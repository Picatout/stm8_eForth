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
      0080B7 94 07                  314         .word      INTER   ;'EVAL
      0080B9 00 00                  315         .word      0       ;HLD
      0080BB B2 7E                  316         .word      LASTN  ;CNTXT pointer
      0080BD 00 80                  317         .word      VAR_BASE   ;variables free space pointer 
      0080BF B3 80                  318         .word      app_space ; FLASH free space pointer 
      0080C1 B2 7E                  319         .word      LASTN   ;LAST
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
      00812D CC 9B 08         [ 2]  391         jp  COLD   ;default=MN1
                                    392 
                                    393 
                                    394 ;; place MCU in sleep mode with
                                    395 ;; halt opcode 
                                    396 ;; BYE ( -- )
      008130 00 00                  397         .word 0
                           0000B2   398         LINK=.
      008132 03                     399         .byte 3 
      008133 42 59 45               400         .ascii "BYE"
      008136                        401 BYE: 
      008136 8E               [10]  402         halt 
      008137 81               [ 4]  403         ret 
                                    404 
                                    405 ; Enable interrupts 
                                    406 ; EI ( -- )
      008138 81 32                  407         .word LINK 
                           0000BA   408         LINK=.
      00813A 02                     409         .byte 2
      00813B 45 49                  410         .ascii "EI"
      00813D                        411 EI:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      00813D 9A               [ 1]  412         rim 
      00813E 81               [ 4]  413         ret 
                                    414 
                                    415 ; Disable interrupts
                                    416 ; DI ( -- )
      00813F 81 3A                  417         .word LINK 
                           0000C1   418         LINK=.
      008141 02                     419         .byte 2 
      008142 44 49                  420         .ascii "DI"
      008144                        421 DI:
      008144 9B               [ 1]  422         sim 
      008145 81               [ 4]  423         ret 
                                    424 
                                    425 ; set interrupt priority level 
                                    426 ; SET-ISP ( n1 n2 -- )
                                    427 ; n1 level {1..3}
                                    428 ; n2 vector {0..29}
      008146 81 41                  429         .word LINK 
                           0000C8   430         LINK=.
      008148 07                     431         .byte 7 
      008149 53 45 54 2D 49 53 50   432         .ascii "SET-ISP"
      008150                        433 SETISP:
      008150 90 93            [ 1]  434         ldw y,x 
      008152 90 FE            [ 2]  435         ldw y,(y)
      008154 A6 04            [ 1]  436         ld a,#4 ; 4 slot per register 
                                    437 ;  quotient select register, remainder select slot in register.        
      008156 90 62            [ 2]  438         div y,a ; register=ITC_SPR1[Y], lshift=2*A 
      008158 A4 03            [ 1]  439         and a,#3 
      00815A 48               [ 1]  440         sll a ; 2*SLOT  lshift 
      00815B 72 A9 7F 70      [ 2]  441         addw y,#ITC_SPR1 
      00815F FF               [ 2]  442         ldw (x),y  ; ( level reg -- )
      008160 90 5F            [ 1]  443         clrw y 
      008162 90 97            [ 1]  444         ld yl,a 
      008164 1D 00 02         [ 2]  445         subw x,#CELLL 
      008167 FF               [ 2]  446         ldw (x),y  ; ( level reg lshift -- )
      008168 90 93            [ 1]  447         ldw y,x 
      00816A 90 EE 02         [ 2]  448         ldw y,(2,y) 
      00816D 90 F6            [ 1]  449         ld a,(y)   ; reg_value
      00816F 1D 00 02         [ 2]  450         subw x,#CELLL 
      008172 FF               [ 2]  451         ldw (x),y ; ( level reg lshift rval -- )
      008173 CD 86 3B         [ 4]  452         call OVER ; ( level reg lshift rval lshift -- )
      008176 CD 84 F1         [ 4]  453         call DOLIT 
      008179 00 03                  454         .word 3
      00817B CD 86 21         [ 4]  455         call SWAPP  ; ( level reg lshift rval 3 lshift )
      00817E CD 8B 7C         [ 4]  456         call LSHIFT ; creat slot mask 
      008181 CD 88 5A         [ 4]  457         call INVER  ; ( level reg lshift rval mask )
      008184 CD 86 70         [ 4]  458         call ANDD ; ( level reg lshift slot_masked )
      008187 CD 85 DA         [ 4]  459         call TOR  ; ( level reg lshift -- R: slot_masked )
      00818A CD 87 DF         [ 4]  460         call ROT  ; ( reg lshift level )
      00818D CD 86 21         [ 4]  461         call SWAPP ; ( reg level lshift )
      008190 CD 8B 7C         [ 4]  462         call LSHIFT  ; ( reg slot_level -- )
      008193 CD 85 BB         [ 4]  463         call RFROM ; ( reg slot_level masked_val )
      008196 CD 86 84         [ 4]  464         call ORR   ; ( reg updated_rval )
      008199 CD 86 21         [ 4]  465         call SWAPP 
      00819C CD 85 77         [ 4]  466         call CSTOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



                                    467 
                                    468 ; sélectionne l'application 
                                    469 ; qui démarre automatique lors 
                                    470 ; d'un COLD start 
      00819F 81 48                  471         .word LINK 
                           000121   472         LINK=.
      0081A1 07                     473         .byte 7
      0081A2 41 55 54 4F 52 55 4E   474         .ascii "AUTORUN"
      0081A9                        475 AUTORUN:
      0081A9 CD 91 CC         [ 4]  476         call TOKEN 
      0081AC CD 86 11         [ 4]  477         call DUPP 
      0081AF CD 85 1A         [ 4]  478         call QBRAN 
      0081B2 82 8F                  479         .word FORGET2
      0081B4 CD 92 C9         [ 4]  480         call NAMEQ
      0081B7 CD 87 CE         [ 4]  481         call QDUP 
      0081BA CD 85 1A         [ 4]  482         call QBRAN 
      0081BD 82 8F                  483         .word FORGET2
      0081BF CD 86 07         [ 4]  484         call DROP 
      0081C2 1D 00 04         [ 2]  485         subw x,#2*CELLL 
      0081C5 90 5F            [ 1]  486         clrw y 
      0081C7 FF               [ 2]  487         ldw (x),y 
      0081C8 90 AE 40 02      [ 2]  488         ldw y,#APP_RUN 
      0081CC EF 02            [ 2]  489         ldw (2,x),y 
      0081CE CC 9E 04         [ 2]  490         jp EESTORE 
                                    491 
                                    492 ;; Reset dictionary pointer before 
                                    493 ;; forgotten word. RAM space and 
                                    494 ;; interrupt vector defined after 
                                    495 ;; must be resetted also.
      0081D1 81 A1                  496         .word LINK 
                           000153   497         LINK=.
      0081D3 06                     498         .byte 6
      0081D4 46 4F 52 47 45 54      499         .ascii "FORGET" 
      0081DA                        500 FORGET: 
      0081DA CD 91 CC         [ 4]  501         call TOKEN
      0081DD CD 86 11         [ 4]  502         call DUPP 
      0081E0 CD 85 1A         [ 4]  503         call QBRAN 
      0081E3 82 8F                  504         .word FORGET2
      0081E5 CD 92 C9         [ 4]  505         call NAMEQ ; ( a -- ca na | a F )
      0081E8 CD 87 CE         [ 4]  506         call QDUP 
      0081EB CD 85 1A         [ 4]  507         call QBRAN 
      0081EE 82 8F                  508         .word FORGET2
                                    509 ; only forget users words 
      0081F0 CD 86 11         [ 4]  510         call DUPP ; ( ca na na )
      0081F3 CD 84 F1         [ 4]  511         call DOLIT 
      0081F6 B3 80                  512         .word app_space 
      0081F8 CD 86 21         [ 4]  513         call SWAPP 
      0081FB CD 89 00         [ 4]  514         call  ULESS 
      0081FE CD 85 1A         [ 4]  515         call QBRAN 
      008201 82 51                  516         .word FORGET6 
                                    517 ; ( ca na -- )        
                                    518 ;reset ivec with address >= ca
      008203 CD 86 21         [ 4]  519         call SWAPP ; ( na ca -- ) 
      008206 CD A0 07         [ 4]  520         call CHKIVEC ; ( na -- ) 
                                    521 ; start at LAST and link back to na 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



                                    522 ; if variable found reset VP at that point.
      008209                        523 FORGET1:
      008209 CD 87 90         [ 4]  524         call LAST 
      00820C CD 85 6A         [ 4]  525         call AT 
      00820F CD 86 11         [ 4]  526         call DUPP  ; ( -- na last last )
      008212 CD 82 A5         [ 4]  527         call FREEVAR ; ( -- na last )
      008215 CD 86 11         [ 4]  528         call DUPP 
      008218 CD 84 F1         [ 4]  529         call DOLIT 
      00821B 00 02                  530         .word 2 
      00821D CD 88 B9         [ 4]  531         call SUBB ; ( na last -- na last lfa ) link address 
      008220 CD 85 6A         [ 4]  532         call AT 
      008223 CD 86 11         [ 4]  533         call DUPP ; ( -- na last a a )
      008226 CD 87 64         [ 4]  534         call CNTXT 
      008229 CD 85 53         [ 4]  535         call STORE
      00822C CD 87 90         [ 4]  536         call LAST  
      00822F CD 85 53         [ 4]  537         call STORE ; ( --  na last )
      008232 CD 86 3B         [ 4]  538         call OVER 
      008235 CD 88 E1         [ 4]  539         call EQUAL ; ( na last na -- na T|F ) 
      008238 CD 85 1A         [ 4]  540         call QBRAN 
      00823B 82 09                  541         .word FORGET1 
                                    542 ; ( na -- )
      00823D CD 84 F1         [ 4]  543         call DOLIT 
      008240 00 02                  544         .word 2 
      008242 CD 88 B9         [ 4]  545         call SUBB 
      008245 CD 87 80         [ 4]  546         call CPP 
      008248 CD 85 53         [ 4]  547         call STORE  
      00824B CD 9C 37         [ 4]  548         call UPDATCP 
      00824E CC 9C 0E         [ 2]  549         jp UPDATLAST 
      008251                        550 FORGET6: ; tried to forget a RAM or system word 
                                    551 ; ( ca na -- )
      008251 1D 00 02         [ 2]  552         subw x,#CELLL 
      008254 90 BE 2C         [ 2]  553         ldw y,SP0 
      008257 FF               [ 2]  554         ldw (x),y  
      008258 CD 89 00         [ 4]  555         call ULESS
      00825B CD 85 1A         [ 4]  556         call QBRAN 
      00825E 82 81                  557         .word PROTECTED 
      008260 CD 93 D5         [ 4]  558         call ABORQ 
      008263 1D                     559         .byte 29
      008264 20 46 6F 72 20 52 41   560         .ascii " For RAM definition do REBOOT"
             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      008281                        561 PROTECTED:
      008281 CD 93 D5         [ 4]  562         call ABORQ
      008284 0A                     563         .byte 10
      008285 20 50 72 6F 74 65 63   564         .ascii " Protected"
             74 65 64
      00828F                        565 FORGET2: ; no name or not found in dictionary 
      00828F CD 93 D5         [ 4]  566         call ABORQ
      008292 05                     567         .byte 5
      008293 20 77 68 61 74         568         .ascii " what"
      008298                        569 FORGET4:
      008298 CC 86 07         [ 2]  570         jp DROP 
                                    571 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



                                    572 
                                    573 ;---------------------------------
                                    574 ; if na is variable 
                                    575 ; free variable data  
                                    576 ; FREEVAR ( na -- )
                                    577 ;---------------------------------
      00829B 81 D3                  578         .word LINK 
                           00021D   579         LINK=.
      00829D 07                     580         .byte 7 
      00829E 46 52 45 45 56 41 52   581         .ascii "FREEVAR"
      0082A5                        582 FREEVAR:
      0082A5 CD 86 11         [ 4]  583         call DUPP ; ( na na -- )
      0082A8 CD 85 88         [ 4]  584         CALL CAT  ; ( na c -- )
      0082AB CD 8B 5E         [ 4]  585         call ONEP ;
      0082AE CD 88 40         [ 4]  586         CALL PLUS ; ( na c+1 -- ca ) 
      0082B1 CD 8B 5E         [ 4]  587         call ONEP ; ( ca+ -- ) to get routne address 
      0082B4 CD 86 11         [ 4]  588         call DUPP ; ( ca+ ca+ -- )
      0082B7 CD 85 6A         [ 4]  589         CALL AT   ; ( ca+ fnaddr -- ) ; fnaddr is routine address 
      0082BA CD 84 F1         [ 4]  590         call DOLIT 
      0082BD 86 D1                  591         .word DOVAR ; if routine address is DOVAR then variable 
      0082BF CD 88 E1         [ 4]  592         call EQUAL  ; ( ca+ fnaddr DOVAR -- ca+ T|F ) 
      0082C2 CD 85 1A         [ 4]  593         call QBRAN 
      0082C5 82 DB                  594         .word FREEVAR4 
      0082C7 CD 84 F1         [ 4]  595         call DOLIT 
      0082CA 00 02                  596         .word 2 
      0082CC CD 88 40         [ 4]  597         call PLUS  ; ( ca+ 2 -- da ) da is data address 
      0082CF CD 85 6A         [ 4]  598         call AT 
      0082D2 CD 87 72         [ 4]  599         call VPP   
      0082D5 CD 85 53         [ 4]  600         call STORE 
      0082D8 CC 9C 4E         [ 2]  601         jp UPDATVP 
      0082DB                        602 FREEVAR4: ; not variable
      0082DB CC 86 07         [ 2]  603         jp  DROP 
                                    604 
                                    605 ;    SEED ( n -- )
                                    606 ; Initialize PRNG seed with n 
      0082DE 82 9D                  607         .word LINK 
                           000260   608         LINK=. 
      0082E0 04                     609         .byte 4 
      0082E1 53 45 45 44            610         .ascii "SEED" 
      0082E5                        611 SEED:
      0082E5 90 93            [ 1]  612         ldw y,x 
      0082E7 1C 00 02         [ 2]  613         addw x,#CELLL
      0082EA 90 FE            [ 2]  614         ldw y,(y)
      0082EC 90 9E            [ 1]  615         ld a,yh 
      0082EE B7 38            [ 1]  616         ld SEEDX,a 
      0082F0 90 9F            [ 1]  617         ld a,yl 
      0082F2 B7 3A            [ 1]  618         ld SEEDY,a 
      0082F4 81               [ 4]  619         ret 
                                    620 
                                    621 ;    RANDOM ( u1 -- u2 )
                                    622 ; Pseudo random number betwen 0 and u1-1
      0082F5 82 E0                  623         .word LINK 
                           000277   624         LINK=.
      0082F7 06                     625         .byte 6
      0082F8 52 41 4E 44 4F 4D      626         .ascii "RANDOM" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      0082FE                        627 RANDOM:
                                    628 ;local variable 
                           000001   629         SPSAVE=1
                           000002   630         VSIZE=2 
      0082FE 52 02            [ 2]  631         sub sp,#VSIZE
      008300 1F 01            [ 2]  632         ldw (SPSAVE,sp),x  
                                    633 ; XTEMP=(SEEDX<<5)^SEEDX 
      008302 90 93            [ 1]  634         ldw y,x 
      008304 90 FE            [ 2]  635         ldw y,(y)
      008306 90 BF 26         [ 2]  636         ldw YTEMP,y 
      008309 BE 38            [ 2]  637 	ldw x,SEEDX 
      00830B 58               [ 2]  638 	sllw x 
      00830C 58               [ 2]  639 	sllw x 
      00830D 58               [ 2]  640 	sllw x 
      00830E 58               [ 2]  641 	sllw x 
      00830F 58               [ 2]  642 	sllw x 
      008310 9E               [ 1]  643 	ld a,xh 
      008311 B8 38            [ 1]  644 	xor a,SEEDX 
      008313 B7 24            [ 1]  645 	ld XTEMP,a 
      008315 9F               [ 1]  646 	ld a,xl 
      008316 B8 39            [ 1]  647 	xor a,SEEDX+1 
      008318 B7 25            [ 1]  648 	ld XTEMP+1,a 
                                    649 ; SEEDX=SEEDY 
      00831A BE 3A            [ 2]  650 	ldw x,SEEDY 
      00831C BF 38            [ 2]  651 	ldw SEEDX,x  
                                    652 ; SEEDY=SEEDY^(SEEDY>>1)
      00831E 54               [ 2]  653 	srlw x 
      00831F 9E               [ 1]  654 	ld a,xh 
      008320 B8 3A            [ 1]  655 	xor a,SEEDY 
      008322 B7 3A            [ 1]  656 	ld SEEDY,a  
      008324 9F               [ 1]  657 	ld a,xl 
      008325 B8 3B            [ 1]  658 	xor a,SEEDY+1 
      008327 B7 3B            [ 1]  659 	ld SEEDY+1,a 
                                    660 ; XTEMP>>3 
      008329 BE 24            [ 2]  661 	ldw x,XTEMP 
      00832B 54               [ 2]  662 	srlw x 
      00832C 54               [ 2]  663 	srlw x 
      00832D 54               [ 2]  664 	srlw x 
                                    665 ; x=XTEMP^x 
      00832E 9E               [ 1]  666 	ld a,xh 
      00832F B8 24            [ 1]  667 	xor a,XTEMP 
      008331 95               [ 1]  668 	ld xh,a 
      008332 9F               [ 1]  669 	ld a,xl 
      008333 B8 25            [ 1]  670 	xor a,XTEMP+1  
      008335 97               [ 1]  671 	ld xl,a 
                                    672 ; SEEDY=x^SEEDY 
      008336 B8 3B            [ 1]  673 	xor a,SEEDY+1
      008338 97               [ 1]  674 	ld xl,a 
      008339 9E               [ 1]  675 	ld a,xh 
      00833A B8 3A            [ 1]  676 	xor a,SEEDY
      00833C 95               [ 1]  677 	ld xh,a 
      00833D BF 3A            [ 2]  678 	ldw SEEDY,x 
                                    679 ; return SEEDY modulo YTEMP  
      00833F 90 BE 26         [ 2]  680 	ldw y,YTEMP  
      008342 65               [ 2]  681 	divw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      008343 1E 01            [ 2]  682 	ldw x,(SPSAVE,sp)
      008345 FF               [ 2]  683         ldw (x),y 
      008346 5B 02            [ 2]  684         addw sp,#VSIZE 
      008348 81               [ 4]  685 	ret 
                                    686 
                                    687 
                                    688 ;;
                                    689 ;; get millisecond counter 
                                    690 ;; msec ( -- u )
                                    691 ;; Added by Picatout 2020-04-26
      008349 82 F7                  692         .word LINK  
                           0002CB   693         LINK = . 
      00834B 04                     694         .byte 4
      00834C 4D 53 45 43            695         .ascii "MSEC"
      008350                        696 MSEC: 
      008350 1D 00 02         [ 2]  697         subw x,#CELLL 
      008353 90 BE 30         [ 2]  698         ldw y,MS 
      008356 FF               [ 2]  699         ldw (x),y 
      008357 81               [ 4]  700         ret 
                                    701 
                                    702 ; suspend execution for u msec 
                                    703 ;  pause ( u -- )
      008358 83 4B                  704         .word LINK 
                           0002DA   705         LINK=.
      00835A 05                     706         .byte 5 
      00835B 50 41 55 53 45         707         .ascii "PAUSE"
      008360                        708 PAUSE:
      008360 90 93            [ 1]  709         ldw y,x
      008362 90 FE            [ 2]  710         ldw y,(y)
      008364 72 B9 00 30      [ 2]  711         addw y,MS 
      008368 8F               [10]  712 1$:     wfi  
      008369 90 B3 30         [ 2]  713         cpw y,MS  
      00836C 26 FA            [ 1]  714         jrne 1$        
      00836E 1C 00 02         [ 2]  715         addw x,#CELLL 
      008371 81               [ 4]  716         ret 
                                    717 
                                    718 ; initialize count down timer 
                                    719 ;  TIMER ( u -- )  milliseconds 
      008372 83 5A                  720         .word LINK 
                           0002F4   721         LINK=.
      008374 05                     722         .byte 5 
      008375 54 49 4D 45 52         723         .ascii "TIMER" 
      00837A                        724 TIMER:
      00837A 90 93            [ 1]  725         ldw y,x
      00837C 90 FE            [ 2]  726         ldw y,(y) 
      00837E 90 BF 32         [ 2]  727         ldw CNTDWN,y
      008381 1C 00 02         [ 2]  728         addw x,#CELLL 
      008384 81               [ 4]  729         ret 
                                    730 
                                    731 ; check for TIMER exiparition 
                                    732 ;  TIMEOUT? ( -- 0|-1 )
      008385 83 74                  733         .word LINK 
                           000307   734         LINK=. 
      008387 08                     735         .byte 8 
      008388 54 49 4D 45 4F 55 54   736         .ascii "TIMEOUT?"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal  3F-Bits]



             3F
      008390                        737 TIMEOUTQ: 
      008390 4F               [ 1]  738         clr a
      008391 1D 00 02         [ 2]  739         subw x,#CELLL 
      008394 90 BE 32         [ 2]  740         ldw y,CNTDWN 
      008397 26 01            [ 1]  741         jrne 1$ 
      008399 43               [ 1]  742         cpl a 
      00839A E7 01            [ 1]  743 1$:     ld (1,x),a 
      00839C F7               [ 1]  744         ld (x),a 
      00839D 81               [ 4]  745         ret         
                                    746 
                                    747 ; reboot MCU 
                                    748 ; REBOOT ( -- )
      00839E 83 87                  749         .word LINK 
                           000320   750         LINK=. 
      0083A0 06                     751         .byte 6 
      0083A1 52 45 42 4F 4F 54      752         .ascii "REBOOT"
      0083A7                        753 reboot:
      0083A7 CC 80 80         [ 2]  754         jp NonHandledInterrupt
                                    755 
                                    756 ; compile to flash memory 
                                    757 ; TO-FLASH ( -- )
      0083AA 83 A0                  758         .word LINK 
                           00032C   759         LINK=.
      0083AC 08                     760         .byte 8
      0083AD 54 4F 2D 46 4C 41 53   761         .ascii "TO-FLASH"
             48
      0083B5                        762 TOFLASH:
      0083B5 CD 87 A3         [ 4]  763         call RAMLAST 
      0083B8 CD 85 6A         [ 4]  764         call AT 
      0083BB CD 87 CE         [ 4]  765         call QDUP 
      0083BE CD 85 1A         [ 4]  766         call QBRAN
      0083C1 83 E4                  767         .word 1$
      0083C3 CD 93 D5         [ 4]  768         call ABORQ 
      0083C6 1D                     769         .byte 29
      0083C7 20 4E 6F 74 20 77 68   770         .ascii " Not while definitions in RAM"   
             69 6C 65 20 64 65 66
             69 6E 69 74 69 6F 6E
             73 20 69 6E 20 52 41
             4D
      0083E4 90 AE FF FF      [ 2]  771 1$:     ldw y,#-1 
      0083E8 90 BF 20         [ 2]  772         ldw UTFLASH,y
      0083EB 81               [ 4]  773         ret 
                                    774 
                                    775 ; compile to RAM 
                                    776 ; TO-RAM ( -- )
      0083EC 83 AC                  777         .word LINK 
                           00036E   778         LINK=.
      0083EE 06                     779         .byte 6 
      0083EF 54 4F 2D 52 41 4D      780         .ascii "TO-RAM"
      0083F5                        781 TORAM:
      0083F5 90 5F            [ 1]  782         clrw y 
      0083F7 90 BF 20         [ 2]  783         ldw UTFLASH,y 
      0083FA 81               [ 4]  784         ret 
                                    785 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



                                    786 ;; BAUD RATE constants table
                                    787 ; values to put in BRR1 & BRR2 
      0083FB                        788 baudrate: 
      0083FB A0 1B                  789 	.byte 0xa0,0x1b ; 2400
      0083FD D0 05                  790 	.byte 0xd0,0x5  ; 4800 
      0083FF 68 03                  791 	.byte 0x68,0x3  ; 9600
      008401 34 01                  792 	.byte 0x34,0x1  ; 19200
      008403 11 06                  793 	.byte 0x11,0x6  ; 57600
      008405 08 0B                  794 	.byte 0x8,0xb   ; 115200
                                    795 
                                    796 ; BAUD RATE CONSTANTS names 
                                    797 ; 2400 baud
      008407 83 EE                  798 	.word LINK
                           000389   799 LINK	= .
      008409 04                     800 	.byte 4
      00840A 42 32 4B 34            801 	.ascii "B2K4" 
      00840E                        802 B2K4:
      00840E 1D 00 02         [ 2]  803 	subw x,#CELLL 
      008411 90 5F            [ 1]  804         clrw y
      008413 FF               [ 2]  805         ldw (x),y
      008414 81               [ 4]  806 	ret
                                    807 ; 4800 baud	
      008415 84 09                  808 	.word LINK
                           000397   809 LINK	= .
      008417 04                     810 	.byte 4
      008418 42 34 4B 38            811 	.ascii "B4K8" 
      00841C                        812 B4K8:
      00841C 1D 00 02         [ 2]  813         subw x,#CELLL 
      00841F 90 AE 00 02      [ 2]  814         ldw y,#2 
      008423 FF               [ 2]  815         ldw (x),y
      008424 81               [ 4]  816         ret 
                                    817 ; 9600 baud
      008425 84 17                  818 	.word LINK
                           0003A7   819 LINK	= .
      008427 04                     820 	.byte 4
      008428 42 39 4B 36            821 	.ascii "B9K6" 
      00842C                        822 B9K6:
      00842C 1D 00 02         [ 2]  823         subw x,#CELLL 
      00842F 90 AE 00 04      [ 2]  824         ldw y,#4 
      008433 FF               [ 2]  825         ldw (x),y 
      008434 81               [ 4]  826         ret 
                                    827 ; 19200 baud
      008435 84 27                  828 	.word LINK
                           0003B7   829 LINK	= .
      008437 05                     830 	.byte 5
      008438 42 31 39 4B 32         831 	.ascii "B19K2" 
      00843D                        832 B19K2:
      00843D 1D 00 02         [ 2]  833         subw x,#CELLL
      008440 90 AE 00 06      [ 2]  834         ldw y,#6 
      008444 FF               [ 2]  835         ldw (x),y 
      008445 81               [ 4]  836         ret 
                                    837 ; 57600 baud        
      008446 84 37                  838 	.word LINK
                           0003C8   839 LINK	= .
      008448 05                     840 	.byte 5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      008449 42 35 37 4B 36         841 	.ascii "B57K6" 
      00844E                        842 B57K6:
      00844E 1D 00 02         [ 2]  843         subw x,#CELLL 
      008451 90 AE 00 08      [ 2]  844         ldw y,#8 
      008455 FF               [ 2]  845         ldw (x),y 
      008456 81               [ 4]  846         ret 
                                    847 ; 115200 baud 
      008457 84 48                  848 	.word LINK
                           0003D9   849 LINK	= .
      008459 06                     850 	.byte 6
      00845A 42 31 31 35 4B 32      851 	.ascii "B115K2" 
      008460                        852 B115K2:
      008460 1D 00 02         [ 2]  853 	subw x,#CELLL 
      008463 90 AE 00 0A      [ 2]  854         ldw y,#10 
      008467 FF               [ 2]  855         ldw (x),y 
      008468 81               [ 4]  856         ret 
                                    857 	
                                    858 ;; set UART2 BAUD rate
                                    859 ;	BAUD ( u -- )
      008469 84 59                  860 	.word LINK 
                           0003EB   861 LINK	= .
      00846B 04                     862 	.byte 4
      00846C 42 41 55 44            863 	.ascii "BAUD" 
      008470                        864 BAUD:
      008470 1D 00 02         [ 2]  865 	subw x,#CELLL
      008473 90 AE 83 FB      [ 2]  866         ldw y,#baudrate 
      008477 FF               [ 2]  867         ldw (x),y 
      008478 CD 88 40         [ 4]  868         call PLUS
      00847B 90 93            [ 1]  869         ldw y,x  
      00847D 90 FE            [ 2]  870         ldw y,(y)
      00847F 90 F6            [ 1]  871         ld a,(y)
      008481 88               [ 1]  872         push a 
      008482 90 5C            [ 1]  873         incw y 
      008484 90 F6            [ 1]  874         ld a,(y)
      008486 C7 52 33         [ 1]  875         ld UART_BRR2,a 
      008489 84               [ 1]  876         pop a
      00848A C7 52 32         [ 1]  877         ld UART_BRR1,a 
      00848D 1C 00 02         [ 2]  878         addw x,#CELLL 
      008490 81               [ 4]  879         ret 
                                    880 
                                    881 ;; Device dependent I/O
                                    882 ;       ?RX     ( -- c T | F )
                                    883 ;         Return input byte and true, or false.
      008491 84 6B                  884         .word      LINK 
                           000413   885 LINK	= .
      008493 04                     886         .byte      4
      008494 3F 4B 45 59            887         .ascii     "?KEY"
      008498                        888 QKEY:
      008498 90 5F            [ 1]  889         CLRW Y 
      00849A 72 0B 52 30 0B   [ 2]  890         BTJF UART_SR,#UART_SR_RXNE,INCH   ;check status
      00849F C6 52 31         [ 1]  891         LD    A,UART_DR   ;get char in A
      0084A2 1D 00 02         [ 2]  892 	SUBW	X,#2
      0084A5 E7 01            [ 1]  893         LD     (1,X),A
      0084A7 7F               [ 1]  894 	CLR	(X)
      0084A8 90 53            [ 2]  895         CPLW     Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      0084AA                        896 INCH:
      0084AA 1D 00 02         [ 2]  897 		SUBW	X,#2
      0084AD FF               [ 2]  898         LDW     (X),Y
      0084AE 81               [ 4]  899         RET
                                    900 
                                    901 ;       TX!     ( c -- )
                                    902 ;       Send character c to  output device.
      0084AF 84 93                  903         .word      LINK
                           000431   904 LINK	= .
      0084B1 04                     905         .byte      4
      0084B2 45 4D 49 54            906         .ascii     "EMIT"
      0084B6                        907 EMIT:
      0084B6 E6 01            [ 1]  908         LD     A,(1,X)
      0084B8 1C 00 02         [ 2]  909 	ADDW	X,#2
      0084BB 72 0F 52 30 FB   [ 2]  910 OUTPUT: BTJF UART_SR,#UART_SR_TXE,OUTPUT  ;loop until tx empty 
      0084C0 C7 52 31         [ 1]  911         LD    UART_DR,A   ;send A
      0084C3 81               [ 4]  912         RET
                                    913 
                                    914 ;       FC-XON  ( -- )
                                    915 ;       send XON character 
      0084C4 84 B1                  916         .word LINK
                           000446   917 LINK    = .
      0084C6 06                     918         .byte 6 
      0084C7 46 43 2D 58 4F 4E      919         .ascii "FC-XON"
      0084CD                        920 FC_XON:
      0084CD 1D 00 02         [ 2]  921         subw x,#CELLL 
      0084D0 7F               [ 1]  922         clr (x)
      0084D1 A6 11            [ 1]  923         ld a,#XON 
      0084D3 E7 01            [ 1]  924         ld (1,x),a 
      0084D5 CD 84 B6         [ 4]  925         call EMIT 
      0084D8 81               [ 4]  926         ret 
                                    927 
                                    928 ;       FC-XOFF ( -- )
                                    929 ;       Send XOFF character 
      0084D9 84 C6                  930         .word LINK
                           00045B   931 LINK    = .
      0084DB 07                     932         .byte 7
      0084DC 46 43 2D 58 4F 46 46   933         .ascii "FC-XOFF"
      0084E3                        934 FC_XOFF:
      0084E3 1D 00 02         [ 2]  935         subw x,#CELLL 
      0084E6 7F               [ 1]  936         clr (x)
      0084E7 A6 13            [ 1]  937         ld a,#XOFF 
      0084E9 E7 01            [ 1]  938         ld (1,x),a 
      0084EB CD 84 B6         [ 4]  939         call EMIT 
      0084EE 81               [ 4]  940         ret
                                    941 
                                    942 ;; The kernel
                                    943 
                                    944 ;       doLIT   ( -- w )
                                    945 ;       Push an inline literal.
      0084EF 84 DB                  946         .word      LINK
                                    947 ;LINK	= 	.
                                    948 ;	.byte      COMPO+5
                                    949 ;        .ascii     "DOLIT"
      0084F1                        950 DOLIT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      0084F1 1D 00 02         [ 2]  951 	SUBW X,#2
      0084F4 16 01            [ 2]  952         ldw y,(1,sp)
      0084F6 90 FE            [ 2]  953         ldw y,(y)
      0084F8 FF               [ 2]  954         ldw (x),y
      0084F9 90 85            [ 2]  955         popw y 
      0084FB 90 EC 02         [ 2]  956         jp (2,y)
                                    957 
                                    958 ;       next    ( -- )
                                    959 ;       Code for  single index loop.
      0084FE 84 DB                  960         .word      LINK
                           000480   961 LINK	= 	.
      008500 44                     962 	.byte      COMPO+4
      008501 6E 65 78 74            963         .ascii     "next"
      008505                        964 DONXT:
      008505 16 03            [ 2]  965 	LDW Y,(3,SP)
      008507 90 5A            [ 2]  966 	DECW Y
      008509 2A 07            [ 1]  967 	JRPL NEX1 ; jump if N=0
      00850B 90 85            [ 2]  968 	POPW Y
      00850D 5B 02            [ 2]  969         addw sp,#2
      00850F 90 EC 02         [ 2]  970         JP (2,Y)
      008512                        971 NEX1:
      008512 17 03            [ 2]  972         LDW (3,SP),Y
      008514 90 85            [ 2]  973         POPW Y
      008516 90 FE            [ 2]  974 	LDW Y,(Y)
      008518 90 FC            [ 2]  975 	JP (Y)
                                    976 
                                    977 ;       ?branch ( f -- )
                                    978 ;       Branch if flag is zero.
                                    979 ;        .word      LINK
                                    980 ;LINK	= 	.
                                    981 ;	.byte      COMPO+7
                                    982 ;       .ascii     "?BRANCH"
      00851A                        983 QBRAN:	
      00851A 90 93            [ 1]  984         LDW Y,X
      00851C 1C 00 02         [ 2]  985 	ADDW X,#2
      00851F 90 FE            [ 2]  986 	LDW Y,(Y)
      008521 27 13            [ 1]  987         JREQ     BRAN
      008523 90 85            [ 2]  988 	POPW Y
      008525 90 EC 02         [ 2]  989 	JP (2,Y)
                                    990 
                                    991 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    992 ;  TBRANCH ( f -- )
                                    993 ;  branch if f==TRUE 
                                    994 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    995 ;        _HEADER TBRAN,COMPO+7,"TBRANCH"
      008528                        996 TBRAN: 
      008528 90 93            [ 1]  997         LDW Y,X 
      00852A 1C 00 02         [ 2]  998         ADDW X,#2 
      00852D 90 FE            [ 2]  999         LDW Y,(Y)
      00852F 26 05            [ 1] 1000         JRNE BRAN 
      008531 90 85            [ 2] 1001         POPW Y 
      008533 90 EC 02         [ 2] 1002         JP (2,Y)
                                   1003 
                                   1004 
                                   1005 ;       branch  ( -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



                                   1006 ;       Branch to an inline address.
                                   1007 ;        .word      LINK
                                   1008 ;LINK	= 	.
                                   1009 ;	.byte      COMPO+6
                                   1010 ;        .ascii     "BRANCH"
      008536                       1011 BRAN:
      008536 90 85            [ 2] 1012         POPW Y
      008538 90 FE            [ 2] 1013 	LDW Y,(Y)
      00853A 90 FC            [ 2] 1014         JP     (Y)
                                   1015 
                                   1016 ;       EXECUTE ( ca -- )
                                   1017 ;       Execute  word at ca.
      00853C 85 00                 1018         .word      LINK
                           0004BE  1019 LINK	= 	.
      00853E 07                    1020         .byte       7
      00853F 45 58 45 43 55 54 45  1021         .ascii     "EXECUTE"
      008546                       1022 EXECU:
      008546 90 93            [ 1] 1023         LDW Y,X
      008548 1C 00 02         [ 2] 1024 	ADDW X,#2
      00854B 90 FE            [ 2] 1025 	LDW  Y,(Y)
      00854D 90 FC            [ 2] 1026         JP   (Y)
                                   1027 
                           000001  1028 OPTIMIZE = 1
                           000001  1029 .if OPTIMIZE 
                                   1030 ; remplacement de CALL EXIT par 
                                   1031 ; le opcode de RET.
                                   1032 ; Voir modification au code de ";"
                           000000  1033 .else 
                                   1034 ;       EXIT    ( -- )
                                   1035 ;       Terminate a colon definition.
                                   1036         .word      LINK
                                   1037 LINK = .
                                   1038         .byte      4
                                   1039         .ascii     "EXIT"
                                   1040 EXIT:
                                   1041         POPW Y
                                   1042         RET
                                   1043 .endif 
                                   1044 
                                   1045 ;       !       ( w a -- )
                                   1046 ;       Pop  data stack to memory.
      00854F 85 3E                 1047         .word      LINK
                           0004D1  1048 LINK = .
      008551 01                    1049         .byte      1
      008552 21                    1050         .ascii     "!"
      008553                       1051 STORE:
      008553 90 93            [ 1] 1052         LDW Y,X
      008555 90 FE            [ 2] 1053         LDW Y,(Y)    ;Y=a
      008557 90 BF 26         [ 2] 1054         LDW YTEMP,Y
      00855A 90 93            [ 1] 1055         LDW Y,X
      00855C 90 EE 02         [ 2] 1056         LDW Y,(2,Y)
      00855F 91 CF 26         [ 5] 1057         LDW [YTEMP],Y ;store w at a
      008562 1C 00 04         [ 2] 1058         ADDW X,#4 ; DDROP 
      008565 81               [ 4] 1059         RET     
                                   1060 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



                                   1061 ;       @       ( a -- w )
                                   1062 ;       Push memory location to stack.
      008566 85 51                 1063         .word      LINK
                           0004E8  1064 LINK	= 	.
      008568 01                    1065         .byte    1
      008569 40                    1066         .ascii	"@"
      00856A                       1067 AT:
      00856A 90 93            [ 1] 1068         LDW Y,X     ;Y = a
      00856C 90 FE            [ 2] 1069         LDW Y,(Y)   ; address 
      00856E 90 FE            [ 2] 1070         LDW Y,(Y)   ; value 
      008570 FF               [ 2] 1071         LDW (X),Y ;w = @Y
      008571 81               [ 4] 1072         RET     
                                   1073 
                                   1074 ;       C!      ( c b -- )
                                   1075 ;       Pop  data stack to byte memory.
      008572 85 68                 1076         .word      LINK
                           0004F4  1077 LINK	= .
      008574 02                    1078         .byte      2
      008575 43 21                 1079         .ascii     "C!"
      008577                       1080 CSTOR:
      008577 90 93            [ 1] 1081         LDW Y,X
      008579 90 FE            [ 2] 1082 	LDW Y,(Y)    ;Y=b
      00857B E6 03            [ 1] 1083         LD A,(3,X)    ;D = c
      00857D 90 F7            [ 1] 1084         LD  (Y),A     ;store c at b
      00857F 1C 00 04         [ 2] 1085 	ADDW X,#4 ; DDROP 
      008582 81               [ 4] 1086         RET     
                                   1087 
                                   1088 ;       C@      ( b -- c )
                                   1089 ;       Push byte in memory to  stack.
      008583 85 74                 1090         .word      LINK
                           000505  1091 LINK	= 	.
      008585 02                    1092         .byte      2
      008586 43 40                 1093         .ascii     "C@"
      008588                       1094 CAT:
      008588 90 93            [ 1] 1095         LDW Y,X     ;Y=b
      00858A 90 FE            [ 2] 1096         LDW Y,(Y)
      00858C 90 F6            [ 1] 1097         LD A,(Y)
      00858E E7 01            [ 1] 1098         LD (1,X),A
      008590 7F               [ 1] 1099         CLR (X)
      008591 81               [ 4] 1100         RET     
                                   1101 
                                   1102 ;       RP@     ( -- a )
                                   1103 ;       Push current RP to data stack.
      008592 85 85                 1104         .word      LINK
                           000514  1105 LINK	= .
      008594 03                    1106         .byte      3
      008595 52 50 40              1107         .ascii     "RP@"
      008598                       1108 RPAT:
      008598 90 96            [ 1] 1109         LDW Y,SP    ;save return addr
      00859A 1D 00 02         [ 2] 1110         SUBW X,#2
      00859D FF               [ 2] 1111         LDW (X),Y
      00859E 81               [ 4] 1112         RET     
                                   1113 
                                   1114 ;       RP!     ( a -- )
                                   1115 ;       Set  return stack pointer.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      00859F 85 94                 1116         .word      LINK
                           000521  1117 LINK	= 	. 
      0085A1 43                    1118 	.byte      COMPO+3
      0085A2 52 50 21              1119         .ascii     "RP!"
      0085A5                       1120 RPSTO:
      0085A5 90 85            [ 2] 1121         POPW Y
      0085A7 90 BF 26         [ 2] 1122         LDW YTEMP,Y
      0085AA 90 93            [ 1] 1123         LDW Y,X
      0085AC 90 FE            [ 2] 1124         LDW Y,(Y)
      0085AE 90 94            [ 1] 1125         LDW SP,Y
      0085B0 1C 00 02         [ 2] 1126         ADDW x,#CELLL ; a was not dropped, Picatout 2020-05-24
      0085B3 92 CC 26         [ 5] 1127         JP [YTEMP]
                                   1128 
                                   1129 ;       R>      ( -- w )
                                   1130 ;       Pop return stack to data stack.
      0085B6 85 A1                 1131         .word      LINK
                           000538  1132 LINK	= 	. 
      0085B8 42                    1133 	.byte      COMPO+2
      0085B9 52 3E                 1134         .ascii     "R>"
      0085BB                       1135 RFROM:
      0085BB 90 85            [ 2] 1136         POPW Y    ;save return addr
      0085BD 90 BF 26         [ 2] 1137         LDW YTEMP,Y
      0085C0 90 85            [ 2] 1138         POPW Y
      0085C2 1D 00 02         [ 2] 1139         SUBW X,#2
      0085C5 FF               [ 2] 1140         LDW (X),Y
      0085C6 92 CC 26         [ 5] 1141         JP [YTEMP]
                                   1142 
                                   1143 ;       R@      ( -- w )
                                   1144 ;       Copy top of return stack to stack.
      0085C9 85 B8                 1145         .word      LINK
                           00054B  1146 LINK	= 	. 
      0085CB 02                    1147         .byte      2
      0085CC 52 40                 1148         .ascii     "R@"
      0085CE                       1149 RAT:
      0085CE 16 03            [ 2] 1150         ldw y,(3,sp)
      0085D0 1D 00 02         [ 2] 1151         subw x,#CELLL 
      0085D3 FF               [ 2] 1152         ldw (x),y 
      0085D4 81               [ 4] 1153         ret 
                                   1154 
                                   1155 ;       >R      ( w -- )
                                   1156 ;       Push data stack to return stack.
      0085D5 85 CB                 1157         .word      LINK
                           000557  1158 LINK	= 	. 
      0085D7 42                    1159 	.byte      COMPO+2
      0085D8 3E 52                 1160         .ascii     ">R"
      0085DA                       1161 TOR:
      0085DA 90 85            [ 2] 1162         POPW Y    ;save return addr
      0085DC 90 BF 26         [ 2] 1163         LDW YTEMP,Y
      0085DF 90 93            [ 1] 1164         LDW Y,X
      0085E1 90 FE            [ 2] 1165         LDW Y,(Y)
      0085E3 90 89            [ 2] 1166         PUSHW Y    ;restore return addr
      0085E5 1C 00 02         [ 2] 1167         ADDW X,#2
      0085E8 92 CC 26         [ 5] 1168         JP [YTEMP]
                                   1169 
                                   1170 ;       SP@     ( -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



                                   1171 ;       Push current stack pointer.
      0085EB 85 D7                 1172         .word      LINK
                           00056D  1173 LINK	= 	. 
      0085ED 03                    1174         .byte      3
      0085EE 53 50 40              1175         .ascii     "SP@"
      0085F1                       1176 SPAT:
      0085F1 90 93            [ 1] 1177 	LDW Y,X
      0085F3 1D 00 02         [ 2] 1178         SUBW X,#2
      0085F6 FF               [ 2] 1179 	LDW (X),Y
      0085F7 81               [ 4] 1180         RET     
                                   1181 
                                   1182 ;       SP!     ( a -- )
                                   1183 ;       Set  data stack pointer.
      0085F8 85 ED                 1184         .word      LINK
                           00057A  1185 LINK	= 	. 
      0085FA 03                    1186         .byte      3
      0085FB 53 50 21              1187         .ascii     "SP!"
      0085FE                       1188 SPSTO:
      0085FE FE               [ 2] 1189         LDW     X,(X)     ;X = a
      0085FF 81               [ 4] 1190         RET     
                                   1191 
                                   1192 ;       DROP    ( w -- )
                                   1193 ;       Discard top stack item.
      008600 85 FA                 1194         .word      LINK
                           000582  1195 LINK	= 	. 
      008602 04                    1196         .byte      4
      008603 44 52 4F 50           1197         .ascii     "DROP"
      008607                       1198 DROP:
      008607 1C 00 02         [ 2] 1199         ADDW X,#2     
      00860A 81               [ 4] 1200         RET     
                                   1201 
                                   1202 ;       DUP     ( w -- w w )
                                   1203 ;       Duplicate  top stack item.
      00860B 86 02                 1204         .word      LINK
                           00058D  1205 LINK	= 	. 
      00860D 03                    1206         .byte      3
      00860E 44 55 50              1207         .ascii     "DUP"
      008611                       1208 DUPP:
      008611 90 93            [ 1] 1209 	LDW Y,X
      008613 1D 00 02         [ 2] 1210         SUBW X,#2
      008616 90 FE            [ 2] 1211 	LDW Y,(Y)
      008618 FF               [ 2] 1212 	LDW (X),Y
      008619 81               [ 4] 1213         RET     
                                   1214 
                                   1215 ;       SWAP    ( w1 w2 -- w2 w1 )
                                   1216 ;       Exchange top two stack items.
      00861A 86 0D                 1217         .word      LINK
                           00059C  1218 LINK	= 	. 
      00861C 04                    1219         .byte      4
      00861D 53 57 41 50           1220         .ascii     "SWAP"
      008621                       1221 SWAPP:
      008621 90 93            [ 1] 1222         LDW Y,X
      008623 90 FE            [ 2] 1223         LDW Y,(Y)
      008625 90 BF 26         [ 2] 1224         LDW YTEMP,Y
      008628 90 93            [ 1] 1225         LDW Y,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      00862A 90 EE 02         [ 2] 1226         LDW Y,(2,Y)
      00862D FF               [ 2] 1227         LDW (X),Y
      00862E 90 BE 26         [ 2] 1228         LDW Y,YTEMP
      008631 EF 02            [ 2] 1229         LDW (2,X),Y
      008633 81               [ 4] 1230         RET     
                                   1231 
                                   1232 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                   1233 ;       Copy second stack item to top.
      008634 86 1C                 1234         .word      LINK
                           0005B6  1235 LINK	= . 
      008636 04                    1236         .byte      4
      008637 4F 56 45 52           1237         .ascii     "OVER"
      00863B                       1238 OVER:
      00863B 1D 00 02         [ 2] 1239         SUBW X,#2
      00863E 90 93            [ 1] 1240         LDW Y,X
      008640 90 EE 04         [ 2] 1241         LDW Y,(4,Y)
      008643 FF               [ 2] 1242         LDW (X),Y
      008644 81               [ 4] 1243         RET     
                                   1244 
                                   1245 ;       0<      ( n -- t )
                                   1246 ;       Return true if n is negative.
      008645 86 36                 1247         .word      LINK
                           0005C7  1248 LINK	= . 
      008647 02                    1249         .byte      2
      008648 30 3C                 1250         .ascii     "0<"
      00864A                       1251 ZLESS:
      00864A A6 FF            [ 1] 1252         LD A,#0xFF
      00864C 90 93            [ 1] 1253         LDW Y,X
      00864E 90 FE            [ 2] 1254         LDW Y,(Y)
      008650 2B 01            [ 1] 1255         JRMI     ZL1
      008652 4F               [ 1] 1256         CLR A   ;false
      008653 F7               [ 1] 1257 ZL1:    LD     (X),A
      008654 E7 01            [ 1] 1258         LD (1,X),A
      008656 81               [ 4] 1259 	RET     
                                   1260 
                                   1261 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1262 ;       0= ( n -- f )
                                   1263 ;   n==0?
                                   1264 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0005D7                       1265         _HEADER ZEQUAL,2,"0="
      008657 86 47                    1         .word LINK 
                           0005D9     2         LINK=.
      008659 02                       3         .byte 2  
      00865A 30 3D                    4         .ascii "0="
      00865C                          5         ZEQUAL:
      00865C A6 FF            [ 1] 1266         LD A,#0XFF 
      00865E 90 93            [ 1] 1267         LDW Y,X 
      008660 90 FE            [ 2] 1268         LDW Y,(Y)
      008662 27 02            [ 1] 1269         JREQ ZEQU1 
      008664 A6 00            [ 1] 1270         LD A,#0 
      008666                       1271 ZEQU1:  
      008666 F7               [ 1] 1272         LD (X),A 
      008667 E7 01            [ 1] 1273         LD (1,X),A         
      008669 81               [ 4] 1274         RET 
                                   1275 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



                                   1276 
                                   1277 ;       AND     ( w w -- w )
                                   1278 ;       Bitwise AND.
      00866A 86 59                 1279         .word      LINK
                           0005EC  1280 LINK	= . 
      00866C 03                    1281         .byte      3
      00866D 41 4E 44              1282         .ascii     "AND"
      008670                       1283 ANDD:
      008670 F6               [ 1] 1284         LD  A,(X)    ;D=w
      008671 E4 02            [ 1] 1285         AND A,(2,X)
      008673 E7 02            [ 1] 1286         LD (2,X),A
      008675 E6 01            [ 1] 1287         LD A,(1,X)
      008677 E4 03            [ 1] 1288         AND A,(3,X)
      008679 E7 03            [ 1] 1289         LD (3,X),A
      00867B 1C 00 02         [ 2] 1290         ADDW X,#2
      00867E 81               [ 4] 1291         RET
                                   1292 
                                   1293 ;       OR      ( w w -- w )
                                   1294 ;       Bitwise inclusive OR.
      00867F 86 6C                 1295         .word      LINK
                           000601  1296 LINK = . 
      008681 02                    1297         .byte      2
      008682 4F 52                 1298         .ascii     "OR"
      008684                       1299 ORR:
      008684 F6               [ 1] 1300         LD A,(X)    ;D=w
      008685 EA 02            [ 1] 1301         OR A,(2,X)
      008687 E7 02            [ 1] 1302         LD (2,X),A
      008689 E6 01            [ 1] 1303         LD A,(1,X)
      00868B EA 03            [ 1] 1304         OR A,(3,X)
      00868D E7 03            [ 1] 1305         LD (3,X),A
      00868F 1C 00 02         [ 2] 1306         ADDW X,#2
      008692 81               [ 4] 1307         RET
                                   1308 
                                   1309 ;       XOR     ( w w -- w )
                                   1310 ;       Bitwise exclusive OR.
      008693 86 81                 1311         .word      LINK
                           000615  1312 LINK	= . 
      008695 03                    1313         .byte      3
      008696 58 4F 52              1314         .ascii     "XOR"
      008699                       1315 XORR:
      008699 F6               [ 1] 1316         LD A,(X)    ;D=w
      00869A E8 02            [ 1] 1317         XOR A,(2,X)
      00869C E7 02            [ 1] 1318         LD (2,X),A
      00869E E6 01            [ 1] 1319         LD A,(1,X)
      0086A0 E8 03            [ 1] 1320         XOR A,(3,X)
      0086A2 E7 03            [ 1] 1321         LD (3,X),A
      0086A4 1C 00 02         [ 2] 1322         ADDW X,#2
      0086A7 81               [ 4] 1323         RET
                                   1324 
                                   1325 ;       UM+     ( u u -- udsum )
                                   1326 ;       Add two unsigned single
                                   1327 ;       and return a double sum.
      0086A8 86 95                 1328         .word      LINK
                           00062A  1329 LINK	= . 
      0086AA 03                    1330         .byte      3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      0086AB 55 4D 2B              1331         .ascii     "UM+"
      0086AE                       1332 UPLUS:
      0086AE A6 01            [ 1] 1333         LD A,#1
      0086B0 90 93            [ 1] 1334         LDW Y,X
      0086B2 90 EE 02         [ 2] 1335         LDW Y,(2,Y)
      0086B5 90 BF 26         [ 2] 1336         LDW YTEMP,Y
      0086B8 90 93            [ 1] 1337         LDW Y,X
      0086BA 90 FE            [ 2] 1338         LDW Y,(Y)
      0086BC 72 B9 00 26      [ 2] 1339         ADDW Y,YTEMP
      0086C0 EF 02            [ 2] 1340         LDW (2,X),Y
      0086C2 25 01            [ 1] 1341         JRC     UPL1
      0086C4 4F               [ 1] 1342         CLR A
      0086C5 E7 01            [ 1] 1343 UPL1:   LD     (1,X),A
      0086C7 7F               [ 1] 1344         CLR (X)
      0086C8 81               [ 4] 1345         RET
                                   1346 
                                   1347 ;; System and user variables
                                   1348 
                                   1349 ;       doVAR   ( -- a )
                                   1350 ;       Code for VARIABLE and CREATE.
      0086C9 86 AA                 1351         .word      LINK
                           00064B  1352 LINK	= . 
      0086CB 45                    1353 	.byte      COMPO+5
      0086CC 44 4F 56 41 52        1354         .ascii     "DOVAR"
      0086D1                       1355 DOVAR:
      0086D1 1D 00 02         [ 2] 1356 	SUBW X,#2
      0086D4 90 85            [ 2] 1357         POPW Y    ;get return addr (pfa)
      0086D6 90 FE            [ 2] 1358         LDW Y,(Y) ; indirect address 
      0086D8 FF               [ 2] 1359         LDW (X),Y    ;push on stack
      0086D9 81               [ 4] 1360         RET     ;go to RET of EXEC
                                   1361 
                                   1362 ;       BASE    ( -- a )
                                   1363 ;       Radix base for numeric I/O.
      0086DA 86 CB                 1364         .word      LINK        
                           00065C  1365 LINK = . 
      0086DC 04                    1366         .byte      4
      0086DD 42 41 53 45           1367         .ascii     "BASE"
      0086E1                       1368 BASE:
      0086E1 90 AE 00 06      [ 2] 1369 	LDW Y,#UBASE 
      0086E5 1D 00 02         [ 2] 1370 	SUBW X,#2
      0086E8 FF               [ 2] 1371         LDW (X),Y
      0086E9 81               [ 4] 1372         RET
                                   1373 
                                   1374 ;       tmp     ( -- a )
                                   1375 ;       A temporary storage.
      0086EA 86 DC                 1376         .word      LINK
                                   1377         
                           00066C  1378 LINK = . 
      0086EC 03                    1379 	.byte      3
      0086ED 54 4D 50              1380         .ascii     "TMP"
      0086F0                       1381 TEMP:
      0086F0 90 AE 00 0A      [ 2] 1382 	LDW Y,#UTMP
      0086F4 1D 00 02         [ 2] 1383 	SUBW X,#2
      0086F7 FF               [ 2] 1384         LDW (X),Y
      0086F8 81               [ 4] 1385         RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



                                   1386 
                                   1387 ;       >IN     ( -- a )
                                   1388 ;        Hold parsing pointer.
      0086F9 86 EC                 1389         .word      LINK
                           00067B  1390 LINK = . 
      0086FB 03                    1391         .byte      3
      0086FC 3E 49 4E              1392         .ascii    ">IN"
      0086FF                       1393 INN:
      0086FF 90 AE 00 0C      [ 2] 1394 	LDW Y,#UINN 
      008703 1D 00 02         [ 2] 1395 	SUBW X,#2
      008706 FF               [ 2] 1396         LDW (X),Y
      008707 81               [ 4] 1397         RET
                                   1398 
                                   1399 ;       #TIB    ( -- a )
                                   1400 ;       Count in terminal input buffer.
      008708 86 FB                 1401         .word      LINK
                           00068A  1402 LINK = . 
      00870A 04                    1403         .byte      4
      00870B 23 54 49 42           1404         .ascii     "#TIB"
      00870F                       1405 NTIB:
      00870F 90 AE 00 0E      [ 2] 1406 	LDW Y,#UCTIB 
      008713 1D 00 02         [ 2] 1407 	SUBW X,#2
      008716 FF               [ 2] 1408         LDW (X),Y
      008717 81               [ 4] 1409         RET
                                   1410 
                                   1411 ;       TBUF ( -- a )
                                   1412 ;       address of 128 bytes transaction buffer 
      008718 87 0A                 1413         .word LINK 
                           00069A  1414         LINK=.
      00871A 04                    1415         .byte 4 
      00871B 54 42 55 46           1416         .ascii "TBUF"
      00871F                       1417 TBUF:
      00871F 90 AE 16 80      [ 2] 1418         ldw y,#ROWBUFF
      008723 1D 00 02         [ 2] 1419         subw x,#CELLL
      008726 FF               [ 2] 1420         ldw (x),y 
      008727 81               [ 4] 1421         ret 
                                   1422 
                                   1423 ; systeme variable 
                                   1424 ; compilation destination 
                                   1425 ; TFLASH ( -- A )
      008728 87 1A                 1426         .word LINK 
                           0006AA  1427         LINK=.
      00872A 06                    1428         .byte 6 
      00872B 54 46 4C 41 53 48     1429         .ascii "TFLASH"         
      008731                       1430 TFLASH:
      008731 1D 00 02         [ 2] 1431         subw x,#CELLL 
      008734 90 AE 00 20      [ 2] 1432         ldw y,#UTFLASH
      008738 FF               [ 2] 1433         ldw (x),y 
      008739 81               [ 4] 1434         ret 
                                   1435 
                                   1436 ;       "EVAL   ( -- a )
                                   1437 ;       Execution vector of EVAL.
      00873A 87 2A                 1438         .word      LINK
                           0006BC  1439 LINK = . 
      00873C 05                    1440         .byte      5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      00873D 27 45 56 41 4C        1441         .ascii     "'EVAL"
      008742                       1442 TEVAL:
      008742 90 AE 00 12      [ 2] 1443 	LDW Y,#UINTER 
      008746 1D 00 02         [ 2] 1444 	SUBW X,#2
      008749 FF               [ 2] 1445         LDW (X),Y
      00874A 81               [ 4] 1446         RET
                                   1447 
                                   1448 ;       HLD     ( -- a )
                                   1449 ;       Hold a pointer of output string.
      00874B 87 3C                 1450         .word      LINK
                           0006CD  1451 LINK = . 
      00874D 03                    1452         .byte      3
      00874E 48 4C 44              1453         .ascii     "HLD"
      008751                       1454 HLD:
      008751 90 AE 00 14      [ 2] 1455 	LDW Y,#UHLD 
      008755 1D 00 02         [ 2] 1456 	SUBW X,#2
      008758 FF               [ 2] 1457         LDW (X),Y
      008759 81               [ 4] 1458         RET
                                   1459 
                                   1460 ;       CONTEXT ( -- a )
                                   1461 ;       Start vocabulary search.
      00875A 87 4D                 1462         .word      LINK
                           0006DC  1463 LINK = . 
      00875C 07                    1464         .byte      7
      00875D 43 4F 4E 54 45 58 54  1465         .ascii     "CONTEXT"
      008764                       1466 CNTXT:
      008764 90 AE 00 16      [ 2] 1467 	LDW Y,#UCNTXT
      008768 1D 00 02         [ 2] 1468 	SUBW X,#2
      00876B FF               [ 2] 1469         LDW (X),Y
      00876C 81               [ 4] 1470         RET
                                   1471 
                                   1472 ;       VP      ( -- a )
                                   1473 ;       Point to top of variables
      00876D 87 5C                 1474         .word      LINK
                           0006EF  1475 LINK = . 
      00876F 02                    1476         .byte      2
      008770 56 50                 1477         .ascii     "VP"
      008772                       1478 VPP:
      008772 90 AE 00 18      [ 2] 1479 	LDW Y,#UVP 
      008776 1D 00 02         [ 2] 1480 	SUBW X,#2
      008779 FF               [ 2] 1481         LDW (X),Y
      00877A 81               [ 4] 1482         RET
                                   1483 
                                   1484 ;       CP    ( -- a )
                                   1485 ;       Pointer to top of FLASH 
      00877B 87 6F                 1486         .word LINK 
                           0006FD  1487         LINK=.
      00877D 02                    1488         .byte 2 
      00877E 43 50                 1489         .ascii "CP"
      008780                       1490 CPP: 
      008780 90 AE 00 1A      [ 2] 1491         ldw y,#UCP 
      008784 1D 00 02         [ 2] 1492         subw x,#CELLL 
      008787 FF               [ 2] 1493         ldw (x),y 
      008788 81               [ 4] 1494         ret                
                                   1495 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



                                   1496 ;       LAST    ( -- a )
                                   1497 ;       Point to last name in dictionary.
      008789 87 7D                 1498         .word      LINK
                           00070B  1499 LINK = . 
      00878B 04                    1500         .byte      4
      00878C 4C 41 53 54           1501         .ascii     "LAST"
      008790                       1502 LAST:
      008790 90 AE 00 1C      [ 2] 1503 	LDW Y,#ULAST 
      008794 1D 00 02         [ 2] 1504 	SUBW X,#2
      008797 FF               [ 2] 1505         LDW (X),Y
      008798 81               [ 4] 1506         RET
                                   1507 
                                   1508 ; address of system variable URLAST 
                                   1509 ;       RAMLAST ( -- a )
                                   1510 ; RAM dictionary context 
      008799 87 8B                 1511         .word LINK 
                           00071B  1512         LINK=. 
      00879B 07                    1513         .byte 7  
      00879C 52 41 4D 4C 41 53 54  1514         .ascii "RAMLAST" 
      0087A3                       1515 RAMLAST: 
      0087A3 90 AE 00 22      [ 2] 1516         ldw y,#URLAST 
      0087A7 1D 00 02         [ 2] 1517         subw x,#CELLL 
      0087AA FF               [ 2] 1518         ldw (x),y 
      0087AB 81               [ 4] 1519         ret 
                                   1520 
                                   1521 ; OFFSET ( -- a )
                                   1522 ; address of system variable OFFSET 
      0087AC 87 9B                 1523         .word LINK 
                           00072E  1524         LINK=.
      0087AE 06                    1525         .byte 6
      0087AF 4F 46 46 53 45 54     1526         .ascii "OFFSET" 
      0087B5                       1527 OFFSET: 
      0087B5 1D 00 02         [ 2] 1528         subw x,#CELLL
      0087B8 90 AE 00 1E      [ 2] 1529         ldw y,#UOFFSET 
      0087BC FF               [ 2] 1530         ldw (x),y 
      0087BD 81               [ 4] 1531         ret 
                                   1532 
                                   1533 ; adjust jump address adding OFFSET
                                   1534 ; ADR-ADJ ( a -- a+offset )
      0087BE                       1535 ADRADJ: 
      0087BE CD 87 B5         [ 4] 1536         call OFFSET 
      0087C1 CD 85 6A         [ 4] 1537         call AT 
      0087C4 CC 88 40         [ 2] 1538         jp PLUS 
                                   1539 
                                   1540 
                                   1541 ;; Common functions
                                   1542 
                                   1543 ;       ?DUP    ( w -- w w | 0 )
                                   1544 ;       Dup tos if its is not zero.
      0087C7 87 AE                 1545         .word      LINK
                           000749  1546 LINK = . 
      0087C9 04                    1547         .byte      4
      0087CA 3F 44 55 50           1548         .ascii     "?DUP"
      0087CE                       1549 QDUP:
      0087CE 90 93            [ 1] 1550         LDW Y,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      0087D0 90 FE            [ 2] 1551 	LDW Y,(Y)
      0087D2 27 04            [ 1] 1552         JREQ     QDUP1
      0087D4 1D 00 02         [ 2] 1553 	SUBW X,#2
      0087D7 FF               [ 2] 1554         LDW (X),Y
      0087D8 81               [ 4] 1555 QDUP1:  RET
                                   1556 
                                   1557 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                   1558 ;       Rot 3rd item to top.
      0087D9 87 C9                 1559         .word      LINK
                           00075B  1560 LINK = . 
      0087DB 03                    1561         .byte      3
      0087DC 52 4F 54              1562         .ascii     "ROT"
      0087DF                       1563 ROT:
      0087DF 90 93            [ 1] 1564         ldw y,x 
      0087E1 90 FE            [ 2] 1565         ldw y,(y)
      0087E3 90 89            [ 2] 1566         pushw y 
      0087E5 90 93            [ 1] 1567         ldw y,x 
      0087E7 90 EE 04         [ 2] 1568         ldw y,(4,y)
      0087EA FF               [ 2] 1569         ldw (x),y 
      0087EB 90 93            [ 1] 1570         ldw y,x 
      0087ED 90 EE 02         [ 2] 1571         ldw y,(2,y)
      0087F0 EF 04            [ 2] 1572         ldw (4,x),y 
      0087F2 90 85            [ 2] 1573         popw y 
      0087F4 EF 02            [ 2] 1574         ldw (2,x),y
      0087F6 81               [ 4] 1575         ret 
                                   1576 
                                   1577 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1578 ;    <ROT ( n1 n2 n3 -- n3 n1 n2 )
                                   1579 ;    rotate left 3 top elements 
                                   1580 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000777                       1581     _HEADER NROT,4,"<ROT"
      0087F7 87 DB                    1         .word LINK 
                           000779     2         LINK=.
      0087F9 04                       3         .byte 4  
      0087FA 3C 52 4F 54              4         .ascii "<ROT"
      0087FE                          5         NROT:
      0087FE 90 93            [ 1] 1582     LDW Y,X 
      008800 90 FE            [ 2] 1583     LDW Y,(Y)
      008802 90 BF 26         [ 2] 1584     LDW YTEMP,Y ; n3  
      008805 90 93            [ 1] 1585     LDW Y,X 
      008807 90 EE 02         [ 2] 1586     LDW Y,(2,Y) ; Y = n2 
      00880A FF               [ 2] 1587     LDW (X),Y   ; TOS = n2 
      00880B 90 93            [ 1] 1588     LDW Y,X    
      00880D 90 EE 04         [ 2] 1589     LDW Y,(4,Y) ; Y = n1 
      008810 EF 02            [ 2] 1590     LDW (2,X),Y ;   = n1 
      008812 90 BE 26         [ 2] 1591     LDW Y,YTEMP 
      008815 EF 04            [ 2] 1592     LDW (4,X),Y ; = n3 
      008817 81               [ 4] 1593     RET 
                                   1594 
                                   1595 ;       2DROP   ( w w -- )
                                   1596 ;       Discard two items on stack.
      008818 87 F9                 1597         .word      LINK
                           00079A  1598 LINK = . 
      00881A 05                    1599         .byte      5
      00881B 32 44 52 4F 50        1600         .ascii     "2DROP"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      008820                       1601 DDROP:
      008820 1C 00 04         [ 2] 1602         ADDW X,#4
      008823 81               [ 4] 1603         RET
                                   1604 
                                   1605 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                   1606 ;       Duplicate top two items.
      008824 88 1A                 1607         .word      LINK
                           0007A6  1608 LINK = . 
      008826 04                    1609         .byte      4
      008827 32 44 55 50           1610         .ascii     "2DUP"
      00882B                       1611 DDUP:
      00882B 1D 00 04         [ 2] 1612         SUBW X,#4
      00882E 90 93            [ 1] 1613         LDW Y,X
      008830 90 EE 06         [ 2] 1614         LDW Y,(6,Y)
      008833 EF 02            [ 2] 1615         LDW (2,X),Y
      008835 90 93            [ 1] 1616         LDW Y,X
      008837 90 EE 04         [ 2] 1617         LDW Y,(4,Y)
      00883A FF               [ 2] 1618         LDW (X),Y
      00883B 81               [ 4] 1619         RET
                                   1620 
                                   1621 ;       +       ( w w -- sum )
                                   1622 ;       Add top two items.
      00883C 88 26                 1623         .word      LINK
                           0007BE  1624 LINK = . 
      00883E 01                    1625         .byte      1
      00883F 2B                    1626         .ascii     "+"
      008840                       1627 PLUS:
      008840 90 93            [ 1] 1628         LDW Y,X
      008842 90 FE            [ 2] 1629         LDW Y,(Y)
      008844 90 BF 26         [ 2] 1630         LDW YTEMP,Y
      008847 1C 00 02         [ 2] 1631         ADDW X,#2
      00884A 90 93            [ 1] 1632         LDW Y,X
      00884C 90 FE            [ 2] 1633         LDW Y,(Y)
      00884E 72 B9 00 26      [ 2] 1634         ADDW Y,YTEMP
      008852 FF               [ 2] 1635         LDW (X),Y
      008853 81               [ 4] 1636         RET
                                   1637 
                                   1638 ;       NOT     ( w -- w )
                                   1639 ;       One's complement of tos.
      008854 88 3E                 1640         .word      LINK
                           0007D6  1641 LINK = . 
      008856 03                    1642         .byte      3
      008857 4E 4F 54              1643         .ascii     "NOT"
      00885A                       1644 INVER:
      00885A 90 93            [ 1] 1645         LDW Y,X
      00885C 90 FE            [ 2] 1646         LDW Y,(Y)
      00885E 90 53            [ 2] 1647         CPLW Y
      008860 FF               [ 2] 1648         LDW (X),Y
      008861 81               [ 4] 1649         RET
                                   1650 
                                   1651 ;       NEGATE  ( n -- -n )
                                   1652 ;       Two's complement of tos.
      008862 88 56                 1653         .word      LINK
                           0007E4  1654 LINK = . 
      008864 06                    1655         .byte      6
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      008865 4E 45 47 41 54 45     1656         .ascii     "NEGATE"
      00886B                       1657 NEGAT:
      00886B 90 93            [ 1] 1658         LDW Y,X
      00886D 90 FE            [ 2] 1659         LDW Y,(Y)
      00886F 90 50            [ 2] 1660         NEGW Y
      008871 FF               [ 2] 1661         LDW (X),Y
      008872 81               [ 4] 1662         RET
                                   1663 
                                   1664 ;       DNEGATE ( d -- -d )
                                   1665 ;       Two's complement of top double.
      008873 88 64                 1666         .word      LINK
                           0007F5  1667 LINK = . 
      008875 07                    1668         .byte      7
      008876 44 4E 45 47 41 54 45  1669         .ascii     "DNEGATE"
      00887D                       1670 DNEGA:
      00887D 90 93            [ 1] 1671         LDW Y,X
      00887F 90 FE            [ 2] 1672 	LDW Y,(Y)
      008881 90 53            [ 2] 1673         CPLW Y     
      008883 90 BF 26         [ 2] 1674 	LDW YTEMP,Y
      008886 90 93            [ 1] 1675         LDW Y,X
      008888 90 EE 02         [ 2] 1676         LDW Y,(2,Y)
      00888B 90 53            [ 2] 1677         CPLW Y
      00888D 72 A9 00 01      [ 2] 1678         addw y,#1
      008891 EF 02            [ 2] 1679         LDW (2,X),Y
      008893 90 BE 26         [ 2] 1680         LDW Y,YTEMP
      008896 24 02            [ 1] 1681         JRNC DN1 
      008898 90 5C            [ 1] 1682         INCW Y
      00889A FF               [ 2] 1683 DN1:    LDW (X),Y
      00889B 81               [ 4] 1684         RET
                                   1685 
                                   1686 
                                   1687 ;       S>D ( n -- d )
                                   1688 ; convert single integer to double 
      00889C 88 75                 1689         .word LINK 
                           00081E  1690         LINK=. 
      00889E 03                    1691         .byte 3 
      00889F 53 3E 44              1692         .ascii "S>D"
      0088A2                       1693 STOD: 
      0088A2 1D 00 02         [ 2] 1694         subw x,#CELLL 
      0088A5 90 5F            [ 1] 1695         clrw y 
      0088A7 FF               [ 2] 1696         ldw (x),y 
      0088A8 90 93            [ 1] 1697         ldw y,x 
      0088AA 90 EE 02         [ 2] 1698         ldw y,(2,y)
      0088AD 2A 05            [ 1] 1699         jrpl 1$ 
      0088AF 90 AE FF FF      [ 2] 1700         ldw y,#-1
      0088B3 FF               [ 2] 1701         ldw (x),y 
      0088B4 81               [ 4] 1702 1$:     ret 
                                   1703 
                                   1704 
                                   1705 
                                   1706 
                                   1707 ;       -       ( n1 n2 -- n1-n2 )
                                   1708 ;       Subtraction.
      0088B5 88 9E                 1709         .word      LINK
                           000837  1710 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      0088B7 01                    1711         .byte      1
      0088B8 2D                    1712         .ascii     "-"
      0088B9                       1713 SUBB:
      0088B9 90 93            [ 1] 1714         LDW Y,X
      0088BB 90 FE            [ 2] 1715         LDW Y,(Y)
      0088BD 90 BF 26         [ 2] 1716         LDW YTEMP,Y
      0088C0 1C 00 02         [ 2] 1717         ADDW X,#2
      0088C3 90 93            [ 1] 1718         LDW Y,X
      0088C5 90 FE            [ 2] 1719         LDW Y,(Y)
      0088C7 72 B2 00 26      [ 2] 1720         SUBW Y,YTEMP
      0088CB FF               [ 2] 1721         LDW (X),Y
      0088CC 81               [ 4] 1722         RET
                                   1723 
                                   1724 ;       ABS     ( n -- n )
                                   1725 ;       Return  absolute value of n.
      0088CD 88 B7                 1726         .word      LINK
                           00084F  1727 LINK = . 
      0088CF 03                    1728         .byte      3
      0088D0 41 42 53              1729         .ascii     "ABS"
      0088D3                       1730 ABSS:
      0088D3 90 93            [ 1] 1731         LDW Y,X
      0088D5 90 FE            [ 2] 1732 	LDW Y,(Y)
      0088D7 2A 03            [ 1] 1733         JRPL     AB1     ;negate:
      0088D9 90 50            [ 2] 1734         NEGW     Y     ;else negate hi byte
      0088DB FF               [ 2] 1735         LDW (X),Y
      0088DC 81               [ 4] 1736 AB1:    RET
                                   1737 
                                   1738 ;       =       ( w w -- t )
                                   1739 ;       Return true if top two are =al.
      0088DD 88 CF                 1740         .word      LINK
                           00085F  1741 LINK = . 
      0088DF 01                    1742         .byte      1
      0088E0 3D                    1743         .ascii     "="
      0088E1                       1744 EQUAL:
      0088E1 A6 FF            [ 1] 1745         LD A,#0xFF  ;true
      0088E3 90 93            [ 1] 1746         LDW Y,X    ;D = n2
      0088E5 90 FE            [ 2] 1747         LDW Y,(Y)
      0088E7 90 BF 26         [ 2] 1748         LDW YTEMP,Y
      0088EA 1C 00 02         [ 2] 1749         ADDW X,#2
      0088ED 90 93            [ 1] 1750         LDW Y,X
      0088EF 90 FE            [ 2] 1751         LDW Y,(Y)
      0088F1 90 B3 26         [ 2] 1752         CPW Y,YTEMP     ;if n2 <> n1
      0088F4 27 01            [ 1] 1753         JREQ     EQ1
      0088F6 4F               [ 1] 1754         CLR A
      0088F7 F7               [ 1] 1755 EQ1:    LD (X),A
      0088F8 E7 01            [ 1] 1756         LD (1,X),A
      0088FA 81               [ 4] 1757 	RET     
                                   1758 
                                   1759 ;       U<      ( u u -- t )
                                   1760 ;       Unsigned compare of top two items.
      0088FB 88 DF                 1761         .word      LINK
                           00087D  1762 LINK = . 
      0088FD 02                    1763         .byte      2
      0088FE 55 3C                 1764         .ascii     "U<"
      008900                       1765 ULESS:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008900 A6 FF            [ 1] 1766         LD A,#0xFF  ;true
      008902 90 93            [ 1] 1767         LDW Y,X    ;D = n2
      008904 90 FE            [ 2] 1768         LDW Y,(Y)
      008906 90 BF 26         [ 2] 1769         LDW YTEMP,Y
      008909 1C 00 02         [ 2] 1770         ADDW X,#2
      00890C 90 93            [ 1] 1771         LDW Y,X
      00890E 90 FE            [ 2] 1772         LDW Y,(Y)
      008910 90 B3 26         [ 2] 1773         CPW Y,YTEMP     ;if n2 <> n1
      008913 25 01            [ 1] 1774         JRULT     ULES1
      008915 4F               [ 1] 1775         CLR A
      008916 F7               [ 1] 1776 ULES1:  LD (X),A
      008917 E7 01            [ 1] 1777         LD (1,X),A
      008919 81               [ 4] 1778 	RET     
                                   1779 
                                   1780 ;       <       ( n1 n2 -- t )
                                   1781 ;       Signed compare of top two items.
      00891A 88 FD                 1782         .word      LINK
                           00089C  1783 LINK = . 
      00891C 01                    1784         .byte      1
      00891D 3C                    1785         .ascii     "<"
      00891E                       1786 LESS:
      00891E A6 FF            [ 1] 1787         LD A,#0xFF  ;true
      008920 90 93            [ 1] 1788         LDW Y,X    ;D = n2
      008922 90 FE            [ 2] 1789         LDW Y,(Y)
      008924 90 BF 26         [ 2] 1790         LDW YTEMP,Y
      008927 1C 00 02         [ 2] 1791         ADDW X,#2
      00892A 90 93            [ 1] 1792         LDW Y,X
      00892C 90 FE            [ 2] 1793         LDW Y,(Y)
      00892E 90 B3 26         [ 2] 1794         CPW Y,YTEMP     ;if n2 <> n1
      008931 2F 01            [ 1] 1795         JRSLT     LT1
      008933 4F               [ 1] 1796         CLR A
      008934 F7               [ 1] 1797 LT1:    LD (X),A
      008935 E7 01            [ 1] 1798         LD (1,X),A
      008937 81               [ 4] 1799 	RET     
                                   1800 
                                   1801 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1802 ;   U> ( u1 u2 -- f )
                                   1803 ;   f = true if u1>u2 
                                   1804 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0008B8                       1805     _HEADER UGREAT,2,"U>"
      008938 89 1C                    1         .word LINK 
                           0008BA     2         LINK=.
      00893A 02                       3         .byte 2  
      00893B 55 3E                    4         .ascii "U>"
      00893D                          5         UGREAT:
      00893D A6 00            [ 1] 1806     LD A,#0 
      00893F 90 93            [ 1] 1807     LDW Y,X 
      008941 90 FE            [ 2] 1808     LDW Y,(Y)
      008943 90 BF 26         [ 2] 1809     LDW YTEMP,Y 
      008946 1C 00 02         [ 2] 1810     ADDW X,#2 
      008949 90 93            [ 1] 1811     LDW Y,X
      00894B 90 FE            [ 2] 1812     LDW Y,(Y)
      00894D 90 B3 26         [ 2] 1813     CPW Y,YTEMP 
      008950 23 02            [ 2] 1814     JRULE UGREAT1 
      008952 A6 FF            [ 1] 1815     LD A,#0xff  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008954                       1816 UGREAT1:
      008954 F7               [ 1] 1817     LD (X),A 
      008955 E7 01            [ 1] 1818     LD (1,X),A 
      008957 81               [ 4] 1819     RET 
                                   1820 
                                   1821 
                                   1822 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1823 ;       >   (n1 n2 -- f )
                                   1824 ;  signed compare n1 n2 
                                   1825 ;  true if n1 > n2 
                                   1826 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008958 89 3A                 1827         .word   LINK 
                           0008DA  1828         LINK = . 
      00895A 01                    1829         .byte 1
      00895B 3E                    1830         .ascii ">"
      00895C                       1831 GREAT:
      00895C A6 FF            [ 1] 1832         LD A,#0xFF ;
      00895E 90 93            [ 1] 1833         LDW Y,X 
      008960 90 FE            [ 2] 1834         LDW Y,(Y)
      008962 90 BF 26         [ 2] 1835         LDW YTEMP,Y 
      008965 1C 00 02         [ 2] 1836         ADDW X,#2 
      008968 90 93            [ 1] 1837         LDW Y,X 
      00896A 90 FE            [ 2] 1838         LDW Y,(Y)
      00896C 90 B3 26         [ 2] 1839         CPW  Y,YTEMP 
      00896F 2C 01            [ 1] 1840         JRSGT GREAT1 
      008971 4F               [ 1] 1841         CLR  A
      008972                       1842 GREAT1:
      008972 F7               [ 1] 1843         LD (X),A 
      008973 E7 01            [ 1] 1844         LD (1,X),A 
      008975 81               [ 4] 1845         RET 
                                   1846 
                                   1847 
                                   1848 ;       MAX     ( n n -- n )
                                   1849 ;       Return greater of two top items.
      008976 89 5A                 1850         .word      LINK
                           0008F8  1851 LINK = . 
      008978 03                    1852         .byte      3
      008979 4D 41 58              1853         .ascii     "MAX"
      00897C                       1854 MAX:
      00897C 90 93            [ 1] 1855         LDW Y,X    ;D = n2
      00897E 90 EE 02         [ 2] 1856         LDW Y,(2,Y)
      008981 90 BF 26         [ 2] 1857         LDW YTEMP,Y
      008984 90 93            [ 1] 1858         LDW Y,X
      008986 90 FE            [ 2] 1859         LDW Y,(Y)
      008988 90 B3 26         [ 2] 1860         CPW Y,YTEMP     ;if n2 <> n1
      00898B 2F 02            [ 1] 1861         JRSLT     MAX1
      00898D EF 02            [ 2] 1862         LDW (2,X),Y
      00898F 1C 00 02         [ 2] 1863 MAX1:   ADDW X,#2
      008992 81               [ 4] 1864 	RET     
                                   1865 
                                   1866 ;       MIN     ( n n -- n )
                                   1867 ;       Return smaller of top two items.
      008993 89 78                 1868         .word      LINK
                           000915  1869 LINK = . 
      008995 03                    1870         .byte      3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008996 4D 49 4E              1871         .ascii     "MIN"
      008999                       1872 MIN:
      008999 90 93            [ 1] 1873         LDW Y,X    ;D = n2
      00899B 90 EE 02         [ 2] 1874         LDW Y,(2,Y)
      00899E 90 BF 26         [ 2] 1875         LDW YTEMP,Y
      0089A1 90 93            [ 1] 1876         LDW Y,X
      0089A3 90 FE            [ 2] 1877         LDW Y,(Y)
      0089A5 90 B3 26         [ 2] 1878         CPW Y,YTEMP     ;if n2 <> n1
      0089A8 2C 02            [ 1] 1879         JRSGT     MIN1
      0089AA EF 02            [ 2] 1880         LDW (2,X),Y
      0089AC 1C 00 02         [ 2] 1881 MIN1:	ADDW X,#2
      0089AF 81               [ 4] 1882 	RET     
                                   1883 
                                   1884 ;       WITHIN  ( u ul uh -- t )
                                   1885 ;       Return true if u is within
                                   1886 ;       range of ul and uh. ( ul <= u < uh )
      0089B0 89 95                 1887         .word      LINK
                           000932  1888 LINK = . 
      0089B2 06                    1889         .byte      6
      0089B3 57 49 54 48 49 4E     1890         .ascii     "WITHIN"
      0089B9                       1891 WITHI:
      0089B9 CD 86 3B         [ 4] 1892         CALL     OVER
      0089BC CD 88 B9         [ 4] 1893         CALL     SUBB
      0089BF CD 85 DA         [ 4] 1894         CALL     TOR
      0089C2 CD 88 B9         [ 4] 1895         CALL     SUBB
      0089C5 CD 85 BB         [ 4] 1896         CALL     RFROM
      0089C8 CC 89 00         [ 2] 1897         JP     ULESS
                                   1898 
                                   1899 ;; Divide
                                   1900 
                                   1901 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1902 ;       Unsigned divide of a double by a
                                   1903 ;       single. Return mod and quotient.
      0089CB 89 B2                 1904         .word      LINK
                           00094D  1905 LINK = . 
      0089CD 06                    1906         .byte      6
      0089CE 55 4D 2F 4D 4F 44     1907         .ascii     "UM/MOD"
                                   1908 ; 2021-02-22
                                   1909 ; changed algortihm for Jeeek one 
                                   1910 ; ref: https://github.com/TG9541/stm8ef/pull/406        
      0089D4                       1911 UMMOD:
      0089D4 90 93            [ 1] 1912         LDW     Y,X             ; stack pointer to Y
      0089D6 FE               [ 2] 1913         LDW     X,(X)           ; un
      0089D7 BF 26            [ 2] 1914         LDW     YTEMP,X         ; save un
      0089D9 93               [ 1] 1915         LDW     X,Y
      0089DA 5C               [ 1] 1916         INCW    X               ; drop un
      0089DB 5C               [ 1] 1917         INCW    X
      0089DC 89               [ 2] 1918         PUSHW   X               ; save stack pointer
      0089DD FE               [ 2] 1919         LDW     X,(X)           ; X=udh
      0089DE 90 EE 04         [ 2] 1920         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      0089E1 B3 26            [ 2] 1921         CPW     X,YTEMP
      0089E3 25 0B            [ 1] 1922         JRULT   MMSM1           ; X is still on the R-stack
      0089E5 85               [ 2] 1923         POPW    X               ; restore stack pointer
      0089E6 90 AE FF FF      [ 2] 1924         LDW     Y,#0xFFFF       ; overflow result:
      0089EA FF               [ 2] 1925         LDW     (X),Y           ; quotient max. 16 bit value
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      0089EB 90 5F            [ 1] 1926         CLRW    Y
      0089ED EF 02            [ 2] 1927         LDW     (2,X),Y         ; remainder 0
      0089EF 81               [ 4] 1928         RET
      0089F0                       1929 MMSM1:
      0089F0 A6 10            [ 1] 1930         LD      A,#16           ; loop count
      0089F2 90 58            [ 2] 1931         SLLW    Y               ; udl shift udl into udh
      0089F4                       1932 MMSM3:
      0089F4 59               [ 2] 1933         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      0089F5 25 04            [ 1] 1934         JRC     MMSMa           ; if carry out of rotate
      0089F7 B3 26            [ 2] 1935         CPW     X,YTEMP         ; compare udh to un
      0089F9 25 05            [ 1] 1936         JRULT   MMSM4           ; can't subtract
      0089FB                       1937 MMSMa:
      0089FB 72 B0 00 26      [ 2] 1938         SUBW    X,YTEMP         ; can subtract
      0089FF 98               [ 1] 1939         RCF
      008A00                       1940 MMSM4:
      008A00 8C               [ 1] 1941         CCF                     ; quotient bit
      008A01 90 59            [ 2] 1942         RLCW    Y               ; rotate into quotient, rotate out udl
      008A03 4A               [ 1] 1943         DEC     A               ; repeat
      008A04 26 EE            [ 1] 1944         JRNE    MMSM3           ; if A == 0
      008A06                       1945 MMSMb:
      008A06 BF 26            [ 2] 1946         LDW     YTEMP,X         ; done, save remainder
      008A08 85               [ 2] 1947         POPW    X               ; restore stack pointer
      008A09 FF               [ 2] 1948         LDW     (X),Y           ; save quotient
      008A0A 90 BE 26         [ 2] 1949         LDW     Y,YTEMP         ; remainder onto stack
      008A0D EF 02            [ 2] 1950         LDW     (2,X),Y
      008A0F 81               [ 4] 1951         RET
                                   1952 
                                   1953 
                                   1954 ;----------------------------------------------	
                                   1955 ;       M/MOD   ( d n -- r q )
                                   1956 ;       Signed floored divide of double by
                                   1957 ;       single. Return mod and quotient.
                                   1958 ;----------------------------------------------	
      008A10 89 CD                 1959         .word      LINK
                           000992  1960 LINK = . 
      008A12 05                    1961         .byte      5
      008A13 4D 2F 4D 4F 44        1962         .ascii     "M/MOD"
      008A18                       1963 MSMOD:  
      008A18 CD 86 11         [ 4] 1964         CALL	DUPP
      008A1B CD 86 4A         [ 4] 1965         CALL	ZLESS
      008A1E CD 86 11         [ 4] 1966         CALL	DUPP
      008A21 CD 85 DA         [ 4] 1967         CALL	TOR
      008A24 CD 85 1A         [ 4] 1968         CALL	QBRAN
      008A27 8A 35                 1969         .word	MMOD1
      008A29 CD 88 6B         [ 4] 1970         CALL	NEGAT
      008A2C CD 85 DA         [ 4] 1971         CALL	TOR
      008A2F CD 88 7D         [ 4] 1972         CALL	DNEGA
      008A32 CD 85 BB         [ 4] 1973         CALL	RFROM
      008A35 CD 85 DA         [ 4] 1974 MMOD1:	CALL	TOR
      008A38 CD 86 11         [ 4] 1975         CALL	DUPP
      008A3B CD 86 4A         [ 4] 1976         CALL	ZLESS
      008A3E CD 85 1A         [ 4] 1977         CALL	QBRAN
      008A41 8A 49                 1978         .word	MMOD2
      008A43 CD 85 CE         [ 4] 1979         CALL	RAT
      008A46 CD 88 40         [ 4] 1980         CALL	PLUS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008A49 CD 85 BB         [ 4] 1981 MMOD2:	CALL	RFROM
      008A4C CD 89 D4         [ 4] 1982         CALL	UMMOD
      008A4F CD 85 BB         [ 4] 1983         CALL	RFROM
      008A52 CD 85 1A         [ 4] 1984         CALL	QBRAN
      008A55 8A 60                 1985         .word	MMOD3
      008A57 CD 86 21         [ 4] 1986         CALL	SWAPP
      008A5A CD 88 6B         [ 4] 1987         CALL	NEGAT
      008A5D CD 86 21         [ 4] 1988         CALL	SWAPP
      008A60 81               [ 4] 1989 MMOD3:	RET
                                   1990 
                                   1991 ;       /MOD    ( n n -- r q )
                                   1992 ;       Signed divide. Return mod and quotient.
      008A61 8A 12                 1993         .word      LINK
                           0009E3  1994 LINK = . 
      008A63 04                    1995         .byte      4
      008A64 2F 4D 4F 44           1996         .ascii     "/MOD"
      008A68                       1997 SLMOD:
      008A68 CD 86 3B         [ 4] 1998         CALL	OVER
      008A6B CD 86 4A         [ 4] 1999         CALL	ZLESS
      008A6E CD 86 21         [ 4] 2000         CALL	SWAPP
      008A71 CC 8A 18         [ 2] 2001         JP	MSMOD
                                   2002 
                                   2003 ;       MOD     ( n n -- r )
                                   2004 ;       Signed divide. Return mod only.
      008A74 8A 63                 2005         .word      LINK
                           0009F6  2006 LINK = . 
      008A76 03                    2007         .byte      3
      008A77 4D 4F 44              2008         .ascii     "MOD"
      008A7A                       2009 MODD:
      008A7A CD 8A 68         [ 4] 2010 	CALL	SLMOD
      008A7D CC 86 07         [ 2] 2011 	JP	DROP
                                   2012 
                                   2013 ;       /       ( n n -- q )
                                   2014 ;       Signed divide. Return quotient only.
      008A80 8A 76                 2015         .word      LINK
                           000A02  2016 LINK = . 
      008A82 01                    2017         .byte      1
      008A83 2F                    2018         .ascii     "/"
      008A84                       2019 SLASH:
      008A84 CD 8A 68         [ 4] 2020         CALL	SLMOD
      008A87 CD 86 21         [ 4] 2021         CALL	SWAPP
      008A8A CC 86 07         [ 2] 2022         JP	DROP
                                   2023 
                                   2024 ;; Multiply
                                   2025 
                                   2026 ;       UM*     ( u u -- ud )
                                   2027 ;       Unsigned multiply. Return double product.
      008A8D 8A 82                 2028         .word      LINK
                           000A0F  2029 LINK = . 
      008A8F 03                    2030         .byte      3
      008A90 55 4D 2A              2031         .ascii     "UM*"
      008A93                       2032 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
                                   2033 ; take advantage of SP addressing modes
                                   2034 ; these PRODx in RAM are not required
                                   2035 ; the product is kept on stack as local variable 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                                   2036         ;; bytes offset on data stack 
                           000002  2037         da=2 
                           000003  2038         db=3 
                           000000  2039         dc=0 
                           000001  2040         dd=1 
                                   2041         ;; product bytes offset on return stack 
                           000001  2042         UD1=1  ; ud bits 31..24
                           000002  2043         UD2=2  ; ud bits 23..16
                           000003  2044         UD3=3  ; ud bits 15..8 
                           000004  2045         UD4=4  ; ud bits 7..0 
                                   2046         ;; local variable for product set to zero   
      008A93 90 5F            [ 1] 2047         clrw y 
      008A95 90 89            [ 2] 2048         pushw y  ; bits 15..0
      008A97 90 89            [ 2] 2049         pushw y  ; bits 31..16 
      008A99 E6 03            [ 1] 2050         ld a,(db,x) ; b 
      008A9B 90 97            [ 1] 2051         ld yl,a 
      008A9D E6 01            [ 1] 2052         ld a,(dd,x)   ; d
      008A9F 90 42            [ 4] 2053         mul y,a    ; b*d  
      008AA1 17 03            [ 2] 2054         ldw (UD3,sp),y ; lowest weight product 
      008AA3 E6 03            [ 1] 2055         ld a,(db,x)
      008AA5 90 97            [ 1] 2056         ld yl,a 
      008AA7 E6 00            [ 1] 2057         ld a,(dc,x)
      008AA9 90 42            [ 4] 2058         mul y,a  ; b*c 
                                   2059         ;;; do the partial sum 
      008AAB 72 F9 02         [ 2] 2060         addw y,(UD2,sp)
      008AAE 4F               [ 1] 2061         clr a 
      008AAF 49               [ 1] 2062         rlc a
      008AB0 6B 01            [ 1] 2063         ld (UD1,sp),a 
      008AB2 17 02            [ 2] 2064         ldw (UD2,sp),y 
      008AB4 E6 02            [ 1] 2065         ld a,(da,x)
      008AB6 90 97            [ 1] 2066         ld yl,a 
      008AB8 E6 01            [ 1] 2067         ld a,(dd,x)
      008ABA 90 42            [ 4] 2068         mul y,a   ; a*d 
                                   2069         ;; do partial sum 
      008ABC 72 F9 02         [ 2] 2070         addw y,(UD2,sp)
      008ABF 4F               [ 1] 2071         clr a 
      008AC0 19 01            [ 1] 2072         adc a,(UD1,sp)
      008AC2 6B 01            [ 1] 2073         ld (UD1,sp),a  
      008AC4 17 02            [ 2] 2074         ldw (UD2,sp),y 
      008AC6 E6 02            [ 1] 2075         ld a,(da,x)
      008AC8 90 97            [ 1] 2076         ld yl,a 
      008ACA E6 00            [ 1] 2077         ld a,(dc,x)
      008ACC 90 42            [ 4] 2078         mul y,a  ;  a*c highest weight product 
                                   2079         ;;; do partial sum 
      008ACE 72 F9 01         [ 2] 2080         addw y,(UD1,sp)
      008AD1 FF               [ 2] 2081         ldw (x),y  ; udh 
      008AD2 16 03            [ 2] 2082         ldw y,(UD3,sp)
      008AD4 EF 02            [ 2] 2083         ldw (2,x),y  ; udl  
      008AD6 5B 04            [ 2] 2084         addw sp,#4 ; drop local variable 
      008AD8 81               [ 4] 2085         ret  
                                   2086 
                                   2087 
                                   2088 ;       *       ( n n -- n )
                                   2089 ;       Signed multiply. Return single product.
      008AD9 8A 8F                 2090         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                           000A5B  2091 LINK = . 
      008ADB 01                    2092         .byte      1
      008ADC 2A                    2093         .ascii     "*"
      008ADD                       2094 STAR:
      008ADD CD 8A 93         [ 4] 2095 	CALL	UMSTA
      008AE0 CC 86 07         [ 2] 2096 	JP	DROP
                                   2097 
                                   2098 ;       M*      ( n n -- d )
                                   2099 ;       Signed multiply. Return double product.
      008AE3 8A DB                 2100         .word      LINK
                           000A65  2101 LINK = . 
      008AE5 02                    2102         .byte      2
      008AE6 4D 2A                 2103         .ascii     "M*"
      008AE8                       2104 MSTAR:      
      008AE8 CD 88 2B         [ 4] 2105         CALL	DDUP
      008AEB CD 86 99         [ 4] 2106         CALL	XORR
      008AEE CD 86 4A         [ 4] 2107         CALL	ZLESS
      008AF1 CD 85 DA         [ 4] 2108         CALL	TOR
      008AF4 CD 88 D3         [ 4] 2109         CALL	ABSS
      008AF7 CD 86 21         [ 4] 2110         CALL	SWAPP
      008AFA CD 88 D3         [ 4] 2111         CALL	ABSS
      008AFD CD 8A 93         [ 4] 2112         CALL	UMSTA
      008B00 CD 85 BB         [ 4] 2113         CALL	RFROM
      008B03 CD 85 1A         [ 4] 2114         CALL	QBRAN
      008B06 8B 0B                 2115         .word	MSTA1
      008B08 CD 88 7D         [ 4] 2116         CALL	DNEGA
      008B0B 81               [ 4] 2117 MSTA1:	RET
                                   2118 
                                   2119 ;       */MOD   ( n1 n2 n3 -- r q )
                                   2120 ;       Multiply n1 and n2, then divide
                                   2121 ;       by n3. Return mod and quotient.
      008B0C 8A E5                 2122         .word      LINK
                           000A8E  2123 LINK = . 
      008B0E 05                    2124         .byte      5
      008B0F 2A 2F 4D 4F 44        2125         .ascii     "*/MOD"
      008B14                       2126 SSMOD:
      008B14 CD 85 DA         [ 4] 2127         CALL     TOR
      008B17 CD 8A E8         [ 4] 2128         CALL     MSTAR
      008B1A CD 85 BB         [ 4] 2129         CALL     RFROM
      008B1D CC 8A 18         [ 2] 2130         JP     MSMOD
                                   2131 
                                   2132 ;       */      ( n1 n2 n3 -- q )
                                   2133 ;       Multiply n1 by n2, then divide
                                   2134 ;       by n3. Return quotient only.
      008B20 8B 0E                 2135         .word      LINK
                           000AA2  2136 LINK = . 
      008B22 02                    2137         .byte      2
      008B23 2A 2F                 2138         .ascii     "*/"
      008B25                       2139 STASL:
      008B25 CD 8B 14         [ 4] 2140         CALL	SSMOD
      008B28 CD 86 21         [ 4] 2141         CALL	SWAPP
      008B2B CC 86 07         [ 2] 2142         JP	DROP
                                   2143 
                                   2144 ;; Miscellaneous
                                   2145 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                   2146 ;       CELL+   ( a -- a )
                                   2147 ;       Add cell size in byte to address.
      008B2E 8B 22                 2148         .word      LINK
                           000AB0  2149 LINK = . 
      008B30 02                    2150         .byte       2
      008B31 32 2B                 2151         .ascii     "2+"
      008B33                       2152 CELLP:
      008B33 90 93            [ 1] 2153         LDW Y,X
      008B35 90 FE            [ 2] 2154 	LDW Y,(Y)
      008B37 72 A9 00 02      [ 2] 2155         ADDW Y,#CELLL 
      008B3B FF               [ 2] 2156         LDW (X),Y
      008B3C 81               [ 4] 2157         RET
                                   2158 
                                   2159 ;       CELL-   ( a -- a )
                                   2160 ;       Subtract 2 from address.
      008B3D 8B 30                 2161         .word      LINK
                           000ABF  2162 LINK = . 
      008B3F 02                    2163         .byte       2
      008B40 32 2D                 2164         .ascii     "2-"
      008B42                       2165 CELLM:
      008B42 90 93            [ 1] 2166         LDW Y,X
      008B44 90 FE            [ 2] 2167 	LDW Y,(Y)
      008B46 72 A2 00 02      [ 2] 2168         SUBW Y,#CELLL
      008B4A FF               [ 2] 2169         LDW (X),Y
      008B4B 81               [ 4] 2170         RET
                                   2171 
                                   2172 ;       CELLS   ( n -- n )
                                   2173 ;       Multiply tos by 2.
      008B4C 8B 3F                 2174         .word      LINK
                           000ACE  2175 LINK = . 
      008B4E 02                    2176         .byte       2
      008B4F 32 2A                 2177         .ascii     "2*"
      008B51                       2178 CELLS:
      008B51 90 93            [ 1] 2179         LDW Y,X
      008B53 90 FE            [ 2] 2180 	LDW Y,(Y)
      008B55 90 58            [ 2] 2181         SLAW Y
      008B57 FF               [ 2] 2182         LDW (X),Y
      008B58 81               [ 4] 2183         RET
                                   2184 
                                   2185 ;       1+      ( a -- a )
                                   2186 ;       Add cell size in byte to address.
      008B59 8B 4E                 2187         .word      LINK
                           000ADB  2188 LINK = . 
      008B5B 02                    2189         .byte      2
      008B5C 31 2B                 2190         .ascii     "1+"
      008B5E                       2191 ONEP:
      008B5E 90 93            [ 1] 2192         LDW Y,X
      008B60 90 FE            [ 2] 2193 	LDW Y,(Y)
      008B62 90 5C            [ 1] 2194         INCW Y
      008B64 FF               [ 2] 2195         LDW (X),Y
      008B65 81               [ 4] 2196         RET
                                   2197 
                                   2198 ;       1-      ( a -- a )
                                   2199 ;       Subtract 2 from address.
      008B66 8B 5B                 2200         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                           000AE8  2201 LINK = . 
      008B68 02                    2202         .byte      2
      008B69 31 2D                 2203         .ascii     "1-"
      008B6B                       2204 ONEM:
      008B6B 90 93            [ 1] 2205         LDW Y,X
      008B6D 90 FE            [ 2] 2206 	LDW Y,(Y)
      008B6F 90 5A            [ 2] 2207         DECW Y
      008B71 FF               [ 2] 2208         LDW (X),Y
      008B72 81               [ 4] 2209         RET
                                   2210 
                                   2211 ;  shift left n times 
                                   2212 ; LSHIFT ( n1 n2 -- n1<<n2 )
      008B73 8B 68                 2213         .word LINK 
                           000AF5  2214         LINK=.
      008B75 06                    2215         .byte 6 
      008B76 4C 53 48 49 46 54     2216         .ascii "LSHIFT"
      008B7C                       2217 LSHIFT:
      008B7C E6 01            [ 1] 2218         ld a,(1,x)
      008B7E 1C 00 02         [ 2] 2219         addw x,#CELLL 
      008B81 90 93            [ 1] 2220         ldw y,x 
      008B83 90 FE            [ 2] 2221         ldw y,(y)
      008B85                       2222 LSHIFT1:
      008B85 4D               [ 1] 2223         tnz a 
      008B86 27 05            [ 1] 2224         jreq LSHIFT4 
      008B88 90 58            [ 2] 2225         sllw y 
      008B8A 4A               [ 1] 2226         dec a 
      008B8B 20 F8            [ 2] 2227         jra LSHIFT1 
      008B8D                       2228 LSHIFT4:
      008B8D FF               [ 2] 2229         ldw (x),y 
      008B8E 81               [ 4] 2230         ret 
                                   2231 
                                   2232 ; shift right n times                 
                                   2233 ; RSHIFT (n1 n2 -- n1>>n2 )
      008B8F 8B 75                 2234         .word LINK 
                           000B11  2235         LINK=.
      008B91 06                    2236         .byte 6
      008B92 52 53 48 49 46 54     2237         .ascii "RSHIFT"
      008B98                       2238 RSHIFT:
      008B98 E6 01            [ 1] 2239         ld a,(1,x)
      008B9A 1C 00 02         [ 2] 2240         addw x,#CELLL 
      008B9D 90 93            [ 1] 2241         ldw y,x 
      008B9F 90 FE            [ 2] 2242         ldw y,(y)
      008BA1                       2243 RSHIFT1:
      008BA1 4D               [ 1] 2244         tnz a 
      008BA2 27 05            [ 1] 2245         jreq RSHIFT4 
      008BA4 90 54            [ 2] 2246         srlw y 
      008BA6 4A               [ 1] 2247         dec a 
      008BA7 20 F8            [ 2] 2248         jra RSHIFT1 
      008BA9                       2249 RSHIFT4:
      008BA9 FF               [ 2] 2250         ldw (x),y 
      008BAA 81               [ 4] 2251         ret 
                                   2252 
                                   2253 
                                   2254 ;       2/      ( n -- n )
                                   2255 ;       divide  tos by 2.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008BAB 8B 91                 2256         .word      LINK
                           000B2D  2257 LINK = . 
      008BAD 02                    2258         .byte      2
      008BAE 32 2F                 2259         .ascii     "2/"
      008BB0                       2260 TWOSL:
      008BB0 90 93            [ 1] 2261         LDW Y,X
      008BB2 90 FE            [ 2] 2262 	LDW Y,(Y)
      008BB4 90 57            [ 2] 2263         SRAW Y
      008BB6 FF               [ 2] 2264         LDW (X),Y
      008BB7 81               [ 4] 2265         RET
                                   2266 
                                   2267 ;       BL      ( -- 32 )
                                   2268 ;       Return 32,  blank character.
      008BB8 8B AD                 2269         .word      LINK
                           000B3A  2270 LINK = . 
      008BBA 02                    2271         .byte      2
      008BBB 42 4C                 2272         .ascii     "BL"
      008BBD                       2273 BLANK:
      008BBD 1D 00 02         [ 2] 2274         SUBW X,#2
      008BC0 90 AE 00 20      [ 2] 2275 	LDW Y,#32
      008BC4 FF               [ 2] 2276         LDW (X),Y
      008BC5 81               [ 4] 2277         RET
                                   2278 
                                   2279 ;         0     ( -- 0)
                                   2280 ;         Return 0.
      008BC6 8B BA                 2281         .word      LINK
                           000B48  2282 LINK = . 
      008BC8 01                    2283         .byte       1
      008BC9 30                    2284         .ascii     "0"
      008BCA                       2285 ZERO:
      008BCA 1D 00 02         [ 2] 2286         SUBW X,#2
      008BCD 90 5F            [ 1] 2287 	CLRW Y
      008BCF FF               [ 2] 2288         LDW (X),Y
      008BD0 81               [ 4] 2289         RET
                                   2290 
                                   2291 ;         1     ( -- 1)
                                   2292 ;         Return 1.
      008BD1 8B C8                 2293         .word      LINK
                           000B53  2294 LINK = . 
      008BD3 01                    2295         .byte       1
      008BD4 31                    2296         .ascii     "1"
      008BD5                       2297 ONE:
      008BD5 1D 00 02         [ 2] 2298         SUBW X,#2
      008BD8 90 AE 00 01      [ 2] 2299 	LDW Y,#1
      008BDC FF               [ 2] 2300         LDW (X),Y
      008BDD 81               [ 4] 2301         RET
                                   2302 
                                   2303 ;         -1    ( -- -1)
                                   2304 ;         Return 32,  blank character.
      008BDE 8B D3                 2305         .word      LINK
                           000B60  2306 LINK = . 
      008BE0 02                    2307         .byte       2
      008BE1 2D 31                 2308         .ascii     "-1"
      008BE3                       2309 MONE:
      008BE3 1D 00 02         [ 2] 2310         SUBW X,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008BE6 90 AE FF FF      [ 2] 2311 	LDW Y,#0xFFFF
      008BEA FF               [ 2] 2312         LDW (X),Y
      008BEB 81               [ 4] 2313         RET
                                   2314 
                                   2315 ;       >CHAR   ( c -- c )
                                   2316 ;       Filter non-printing characters.
      008BEC 8B E0                 2317         .word      LINK
                           000B6E  2318 LINK = . 
      008BEE 05                    2319         .byte      5
      008BEF 3E 43 48 41 52        2320         .ascii     ">CHAR"
      008BF4                       2321 TCHAR:
      008BF4 E6 01            [ 1] 2322         ld a,(1,x)
      008BF6 A1 20            [ 1] 2323         cp a,#32  
      008BF8 2B 05            [ 1] 2324         jrmi 1$ 
      008BFA A1 7F            [ 1] 2325         cp a,#127 
      008BFC 2A 01            [ 1] 2326         jrpl 1$ 
      008BFE 81               [ 4] 2327         ret 
      008BFF A6 5F            [ 1] 2328 1$:     ld a,#'_ 
      008C01 E7 01            [ 1] 2329         ld (1,x),a 
      008C03 81               [ 4] 2330         ret 
                                   2331 
                                   2332 ;       DEPTH   ( -- n )
                                   2333 ;       Return  depth of  data stack.
      008C04 8B EE                 2334         .word      LINK
                           000B86  2335 LINK = . 
      008C06 05                    2336         .byte      5
      008C07 44 45 50 54 48        2337         .ascii     "DEPTH"
      008C0C                       2338 DEPTH: 
      008C0C 90 BE 2C         [ 2] 2339         LDW Y,SP0    ;save data stack ptr
      008C0F BF 24            [ 2] 2340 	LDW XTEMP,X
      008C11 72 B2 00 24      [ 2] 2341         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008C15 90 57            [ 2] 2342         SRAW Y    ;Y = #stack items
      008C17 1D 00 02         [ 2] 2343 	SUBW X,#2
      008C1A FF               [ 2] 2344         LDW (X),Y     ; if neg, underflow
      008C1B 81               [ 4] 2345         RET
                                   2346 
                                   2347 ;       PICK    ( ... +n -- ... w )
                                   2348 ;       Copy  nth stack item to tos.
      008C1C 8C 06                 2349         .word      LINK
                           000B9E  2350 LINK = . 
      008C1E 04                    2351         .byte      4
      008C1F 50 49 43 4B           2352         .ascii     "PICK"
      008C23                       2353 PICK:
      008C23 90 93            [ 1] 2354         LDW Y,X   ;D = n1
      008C25 90 FE            [ 2] 2355         LDW Y,(Y)
                                   2356 ; modified for standard compliance          
                                   2357 ; 0 PICK must be equivalent to DUP 
      008C27 90 5C            [ 1] 2358         INCW Y 
      008C29 90 58            [ 2] 2359         SLAW Y
      008C2B BF 24            [ 2] 2360         LDW XTEMP,X
      008C2D 72 B9 00 24      [ 2] 2361         ADDW Y,XTEMP
      008C31 90 FE            [ 2] 2362         LDW Y,(Y)
      008C33 FF               [ 2] 2363         LDW (X),Y
      008C34 81               [ 4] 2364         RET
                                   2365 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



                                   2366 ;; Memory access
                                   2367 
                                   2368 ;       +!      ( n a -- )
                                   2369 ;       Add n to  contents at address a.
      008C35 8C 1E                 2370         .word      LINK
                           000BB7  2371 LINK = . 
      008C37 02                    2372         .byte      2
      008C38 2B 21                 2373         .ascii     "+!"
      008C3A                       2374 PSTOR:
      008C3A 90 93            [ 1] 2375         ldw y,x 
      008C3C 90 FE            [ 2] 2376         ldw y,(y)
      008C3E 90 BF 26         [ 2] 2377         ldw YTEMP,y  ; address
      008C41 90 FE            [ 2] 2378         ldw y,(y)  
      008C43 90 89            [ 2] 2379         pushw y  ; value at address 
      008C45 90 93            [ 1] 2380         ldw y,x 
      008C47 90 EE 02         [ 2] 2381         ldw y,(2,y) ; n 
      008C4A 72 F9 01         [ 2] 2382         addw y,(1,sp) ; n+value
      008C4D 91 CF 26         [ 5] 2383         ldw [YTEMP],y ;  a!
      008C50 90 85            [ 2] 2384         popw y    ;drop local var
      008C52 1C 00 04         [ 2] 2385         addw x,#4 ; DDROP 
      008C55 81               [ 4] 2386         ret 
                                   2387 
                                   2388 ;       2!      ( d a -- )
                                   2389 ;       Store  double integer to address a.
      008C56 8C 37                 2390         .word      LINK
                           000BD8  2391 LINK = . 
      008C58 02                    2392         .byte      2
      008C59 32 21                 2393         .ascii     "2!"
      008C5B                       2394 DSTOR:
      008C5B 90 93            [ 1] 2395         ldw y,x 
      008C5D 90 FE            [ 2] 2396         ldw y,(y)
      008C5F 90 BF 26         [ 2] 2397         ldw YTEMP,y ; address 
      008C62 1C 00 02         [ 2] 2398         addw x,#CELLL ; drop a 
      008C65 90 93            [ 1] 2399         ldw y,x 
      008C67 90 FE            [ 2] 2400         ldw y,(y) ; hi word 
      008C69 89               [ 2] 2401         pushw x 
      008C6A EE 02            [ 2] 2402         ldw x,(2,x) ; lo word 
      008C6C 91 CF 26         [ 5] 2403         ldw [YTEMP],y
      008C6F 90 93            [ 1] 2404         ldw y,x 
      008C71 AE 00 02         [ 2] 2405         ldw x,#2 
      008C74 92 DF 26         [ 5] 2406         ldw ([YTEMP],x),y 
      008C77 85               [ 2] 2407         popw x 
      008C78 1C 00 04         [ 2] 2408         addw x,#4 ; DDROP 
      008C7B 81               [ 4] 2409         ret 
                                   2410 
                                   2411 ;       2@      ( a -- d )
                                   2412 ;       Fetch double integer from address a.
      008C7C 8C 58                 2413         .word      LINK
                           000BFE  2414 LINK = . 
      008C7E 02                    2415         .byte      2
      008C7F 32 40                 2416         .ascii     "2@"
      008C81                       2417 DAT:
      008C81 90 93            [ 1] 2418         ldw y,x 
      008C83 90 FE            [ 2] 2419         ldw y,(y) ;address 
      008C85 90 BF 26         [ 2] 2420         ldw YTEMP,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008C88 1D 00 02         [ 2] 2421         subw x,#CELLL ; space for udh 
      008C8B 91 CE 26         [ 5] 2422         ldw y,[YTEMP] ; udh 
      008C8E FF               [ 2] 2423         ldw (x),y 
      008C8F 90 AE 00 02      [ 2] 2424         ldw y,#2
      008C93 91 DE 26         [ 5] 2425         ldw y,([YTEMP],y) ; udl 
      008C96 EF 02            [ 2] 2426         ldw (2,x),y
      008C98 81               [ 4] 2427         ret 
                                   2428 
                                   2429 ;       COUNT   ( b -- b +n )
                                   2430 ;       Return count byte of a string
                                   2431 ;       and add 1 to byte address.
      008C99 8C 7E                 2432         .word      LINK
                           000C1B  2433 LINK = . 
      008C9B 05                    2434         .byte      5
      008C9C 43 4F 55 4E 54        2435         .ascii     "COUNT"
      008CA1                       2436 COUNT:
      008CA1 90 93            [ 1] 2437         ldw y,x 
      008CA3 90 FE            [ 2] 2438         ldw y,(y) ; address 
      008CA5 90 F6            [ 1] 2439         ld a,(y)  ; count 
      008CA7 90 5C            [ 1] 2440         incw y 
      008CA9 FF               [ 2] 2441         ldw (x),y 
      008CAA 1D 00 02         [ 2] 2442         subw x,#CELLL 
      008CAD E7 01            [ 1] 2443         ld (1,x),a 
      008CAF 7F               [ 1] 2444         clr (x)
      008CB0 81               [ 4] 2445         ret 
                                   2446 
                                   2447 ;       HERE    ( -- a )
                                   2448 ;       Return  top of  variables
      008CB1 8C 9B                 2449         .word      LINK
                           000C33  2450 LINK = . 
      008CB3 04                    2451         .byte      4
      008CB4 48 45 52 45           2452         .ascii     "HERE"
      008CB8                       2453 HERE:
      008CB8 90 AE 00 18      [ 2] 2454       	ldw y,#UVP 
      008CBC 90 FE            [ 2] 2455         ldw y,(y)
      008CBE 1D 00 02         [ 2] 2456         subw x,#CELLL 
      008CC1 FF               [ 2] 2457         ldw (x),y 
      008CC2 81               [ 4] 2458         ret 
                                   2459 
                                   2460 ;       PAD     ( -- a )
                                   2461 ;       Return address of text buffer
                                   2462 ;       above  code dictionary.
      008CC3 8C B3                 2463         .word      LINK
                           000C45  2464 LINK = . 
      008CC5 03                    2465         .byte      3
      008CC6 50 41 44              2466         .ascii     "PAD"
      008CC9                       2467 PAD:
      008CC9 CD 8C B8         [ 4] 2468         CALL     HERE
      008CCC CD 84 F1         [ 4] 2469         CALL     DOLIT
      008CCF 00 50                 2470         .word      80
      008CD1 CC 88 40         [ 2] 2471         JP     PLUS
                                   2472 
                                   2473 ;       TIB     ( -- a )
                                   2474 ;       Return address of terminal input buffer.
      008CD4 8C C5                 2475         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



                           000C56  2476 LINK = . 
      008CD6 03                    2477         .byte      3
      008CD7 54 49 42              2478         .ascii     "TIB"
      008CDA                       2479 TIB:
      008CDA CD 87 0F         [ 4] 2480         CALL     NTIB
      008CDD CD 8B 33         [ 4] 2481         CALL     CELLP
      008CE0 CC 85 6A         [ 2] 2482         JP     AT
                                   2483 
                                   2484 ;       @EXECUTE        ( a -- )
                                   2485 ;       Execute vector stored in address a.
      008CE3 8C D6                 2486         .word      LINK
                           000C65  2487 LINK = . 
      008CE5 08                    2488         .byte      8
      008CE6 40 45 58 45 43 55 54  2489         .ascii     "@EXECUTE"
             45
      008CEE                       2490 ATEXE:
      008CEE CD 85 6A         [ 4] 2491         CALL     AT
      008CF1 CD 87 CE         [ 4] 2492         CALL     QDUP    ;?address or zero
      008CF4 CD 85 1A         [ 4] 2493         CALL     QBRAN
      008CF7 8C FC                 2494         .word      EXE1
      008CF9 CD 85 46         [ 4] 2495         CALL     EXECU   ;execute if non-zero
      008CFC 81               [ 4] 2496 EXE1:   RET     ;do nothing if zero
                                   2497 
                                   2498 ;       CMOVE   ( b1 b2 u -- )
                                   2499 ;       Copy u bytes from b1 to b2.
      008CFD 8C E5                 2500         .word      LINK
                           000C7F  2501 LINK = . 
      008CFF 05                    2502         .byte      5
      008D00 43 4D 4F 56 45        2503         .ascii     "CMOVE"
      008D05                       2504 CMOVE:
      008D05 CD 85 DA         [ 4] 2505         CALL	TOR
      008D08 CD 85 36         [ 4] 2506         CALL	BRAN
      008D0B 8D 25                 2507         .word	CMOV2
      008D0D CD 85 DA         [ 4] 2508 CMOV1:	CALL	TOR
      008D10 CD 86 11         [ 4] 2509         CALL	DUPP
      008D13 CD 85 88         [ 4] 2510         CALL	CAT
      008D16 CD 85 CE         [ 4] 2511         CALL	RAT
      008D19 CD 85 77         [ 4] 2512         CALL	CSTOR
      008D1C CD 8B 5E         [ 4] 2513         CALL	ONEP
      008D1F CD 85 BB         [ 4] 2514         CALL	RFROM
      008D22 CD 8B 5E         [ 4] 2515         CALL	ONEP
      008D25 CD 85 05         [ 4] 2516 CMOV2:	CALL	DONXT
      008D28 8D 0D                 2517         .word	CMOV1
      008D2A CC 88 20         [ 2] 2518         JP	DDROP
                                   2519 
                                   2520 ;       FILL    ( b u c -- )
                                   2521 ;       Fill u bytes of character c
                                   2522 ;       to area beginning at b.
      008D2D 8C FF                 2523         .word       LINK
                           000CAF  2524 LINK = . 
      008D2F 04                    2525         .byte       4
      008D30 46 49 4C 4C           2526         .ascii     "FILL"
      008D34                       2527 FILL:
      008D34 90 93            [ 1] 2528         ldw y,x 
      008D36 90 E6 01         [ 1] 2529         ld a,(1,y) ; c 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008D39 1C 00 02         [ 2] 2530         addw x,#CELLL ; drop c 
      008D3C 90 93            [ 1] 2531         ldw y,x 
      008D3E 90 FE            [ 2] 2532         ldw y,(y) ; count
      008D40 90 89            [ 2] 2533         pushw y 
      008D42 1C 00 02         [ 2] 2534         addw x,#CELLL ; drop u 
      008D45 90 93            [ 1] 2535         ldw y,x 
      008D47 1C 00 02         [ 2] 2536         addw x,#CELLL ; drop b 
      008D4A 90 FE            [ 2] 2537         ldw y,(y) ; address
      008D4C 90 BF 26         [ 2] 2538         ldw YTEMP,y
      008D4F 90 85            [ 2] 2539         popw y ; count 
      008D51                       2540 FILL1:  
      008D51 92 C7 26         [ 4] 2541         ld [YTEMP],a 
      008D54 3C 27            [ 1] 2542         inc YTEMP+1
      008D56 24 02            [ 1] 2543         jrnc FILL2 
      008D58 3C 26            [ 1] 2544         inc YTEMP
      008D5A                       2545 FILL2: 
      008D5A 90 5A            [ 2] 2546         decw y ; count 
      008D5C 26 F3            [ 1] 2547         jrne FILL1  
      008D5E 81               [ 4] 2548         ret 
                                   2549 
                                   2550 ;       ERASE   ( b u -- )
                                   2551 ;       Erase u bytes beginning at b.
      008D5F 8D 2F                 2552         .word      LINK
                           000CE1  2553 LINK = . 
      008D61 05                    2554         .byte      5
      008D62 45 52 41 53 45        2555         .ascii     "ERASE"
      008D67                       2556 ERASE:
      008D67 90 5F            [ 1] 2557         clrw y 
      008D69 1D 00 02         [ 2] 2558         subw x,#CELLL 
      008D6C FF               [ 2] 2559         ldw (x),y 
      008D6D CC 8D 34         [ 2] 2560         jp FILL 
                                   2561 
                                   2562 
                                   2563 ;       PACK0   ( b u a -- a )
                                   2564 ;       Build a counted string with
                                   2565 ;       u characters from b. Null fill.
      008D70 8D 61                 2566         .word      LINK
                           000CF2  2567 LINK = . 
      008D72 05                    2568         .byte      5
      008D73 50 41 43 4B 30        2569         .ascii     "PACK0"
      008D78                       2570 PACKS:
      008D78 CD 86 11         [ 4] 2571         CALL     DUPP
      008D7B CD 85 DA         [ 4] 2572         CALL     TOR     ;strings only on cell boundary
      008D7E CD 88 2B         [ 4] 2573         CALL     DDUP
      008D81 CD 85 77         [ 4] 2574         CALL     CSTOR
      008D84 CD 8B 5E         [ 4] 2575         CALL     ONEP ;save count
      008D87 CD 86 21         [ 4] 2576         CALL     SWAPP
      008D8A CD 8D 05         [ 4] 2577         CALL     CMOVE
      008D8D CD 85 BB         [ 4] 2578         CALL     RFROM
      008D90 81               [ 4] 2579         RET
                                   2580 
                                   2581 ;; Numeric output, single precision
                                   2582 
                                   2583 ;       DIGIT   ( u -- c )
                                   2584 ;       Convert digit u to a character.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008D91 8D 72                 2585         .word      LINK
                           000D13  2586 LINK = . 
      008D93 05                    2587         .byte      5
      008D94 44 49 47 49 54        2588         .ascii     "DIGIT"
      008D99                       2589 DIGIT:
      008D99 CD 84 F1         [ 4] 2590         CALL	DOLIT
      008D9C 00 09                 2591         .word	9
      008D9E CD 86 3B         [ 4] 2592         CALL	OVER
      008DA1 CD 89 1E         [ 4] 2593         CALL	LESS
      008DA4 CD 84 F1         [ 4] 2594         CALL	DOLIT
      008DA7 00 07                 2595         .word	7
      008DA9 CD 86 70         [ 4] 2596         CALL	ANDD
      008DAC CD 88 40         [ 4] 2597         CALL	PLUS
      008DAF CD 84 F1         [ 4] 2598         CALL	DOLIT
      008DB2 00 30                 2599         .word	48	;'0'
      008DB4 CC 88 40         [ 2] 2600         JP	PLUS
                                   2601 
                                   2602 ;       EXTRACT ( n base -- n c )
                                   2603 ;       Extract least significant digit from n.
      008DB7 8D 93                 2604         .word      LINK
                           000D39  2605 LINK = . 
      008DB9 07                    2606         .byte      7
      008DBA 45 58 54 52 41 43 54  2607         .ascii     "EXTRACT"
      008DC1                       2608 EXTRC:
      008DC1 CD 8B CA         [ 4] 2609         CALL     ZERO
      008DC4 CD 86 21         [ 4] 2610         CALL     SWAPP
      008DC7 CD 89 D4         [ 4] 2611         CALL     UMMOD
      008DCA CD 86 21         [ 4] 2612         CALL     SWAPP
      008DCD CC 8D 99         [ 2] 2613         JP     DIGIT
                                   2614 
                                   2615 ;       <#      ( -- )
                                   2616 ;       Initiate  numeric output process.
      008DD0 8D B9                 2617         .word      LINK
                           000D52  2618 LINK = . 
      008DD2 02                    2619         .byte      2
      008DD3 3C 23                 2620         .ascii     "<#"
      008DD5                       2621 BDIGS:
      008DD5 CD 8C C9         [ 4] 2622         CALL     PAD
      008DD8 CD 87 51         [ 4] 2623         CALL     HLD
      008DDB CC 85 53         [ 2] 2624         JP     STORE
                                   2625 
                                   2626 ;       HOLD    ( c -- )
                                   2627 ;       Insert a character into output string.
      008DDE 8D D2                 2628         .word      LINK
                           000D60  2629 LINK = . 
      008DE0 04                    2630         .byte      4
      008DE1 48 4F 4C 44           2631         .ascii     "HOLD"
      008DE5                       2632 HOLD:
      008DE5 CD 87 51         [ 4] 2633         CALL     HLD
      008DE8 CD 85 6A         [ 4] 2634         CALL     AT
      008DEB CD 8B 6B         [ 4] 2635         CALL     ONEM
      008DEE CD 86 11         [ 4] 2636         CALL     DUPP
      008DF1 CD 87 51         [ 4] 2637         CALL     HLD
      008DF4 CD 85 53         [ 4] 2638         CALL     STORE
      008DF7 CC 85 77         [ 2] 2639         JP     CSTOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                   2640 
                                   2641 ;       #       ( u -- u )
                                   2642 ;       Extract one digit from u and
                                   2643 ;       append digit to output string.
      008DFA 8D E0                 2644         .word      LINK
                           000D7C  2645 LINK = . 
      008DFC 01                    2646         .byte      1
      008DFD 23                    2647         .ascii     "#"
      008DFE                       2648 DIG:
      008DFE CD 86 E1         [ 4] 2649         CALL     BASE
      008E01 CD 85 6A         [ 4] 2650         CALL     AT
      008E04 CD 8D C1         [ 4] 2651         CALL     EXTRC
      008E07 CC 8D E5         [ 2] 2652         JP     HOLD
                                   2653 
                                   2654 ;       #S      ( u -- 0 )
                                   2655 ;       Convert u until all digits
                                   2656 ;       are added to output string.
      008E0A 8D FC                 2657         .word      LINK
                           000D8C  2658 LINK = . 
      008E0C 02                    2659         .byte      2
      008E0D 23 53                 2660         .ascii     "#S"
      008E0F                       2661 DIGS:
      008E0F CD 8D FE         [ 4] 2662 DIGS1:  CALL     DIG
      008E12 CD 86 11         [ 4] 2663         CALL     DUPP
      008E15 CD 85 1A         [ 4] 2664         CALL     QBRAN
      008E18 8E 1C                 2665         .word      DIGS2
      008E1A 20 F3            [ 2] 2666         JRA     DIGS1
      008E1C 81               [ 4] 2667 DIGS2:  RET
                                   2668 
                                   2669 ;       SIGN    ( n -- )
                                   2670 ;       Add a minus sign to
                                   2671 ;       numeric output string.
      008E1D 8E 0C                 2672         .word      LINK
                           000D9F  2673 LINK = . 
      008E1F 04                    2674         .byte      4
      008E20 53 49 47 4E           2675         .ascii     "SIGN"
      008E24                       2676 SIGN:
      008E24 CD 86 4A         [ 4] 2677         CALL     ZLESS
      008E27 CD 85 1A         [ 4] 2678         CALL     QBRAN
      008E2A 8E 34                 2679         .word      SIGN1
      008E2C CD 84 F1         [ 4] 2680         CALL     DOLIT
      008E2F 00 2D                 2681         .word      45	;"-"
      008E31 CC 8D E5         [ 2] 2682         JP     HOLD
      008E34 81               [ 4] 2683 SIGN1:  RET
                                   2684 
                                   2685 ;       #>      ( w -- b u )
                                   2686 ;       Prepare output string.
      008E35 8E 1F                 2687         .word      LINK
                           000DB7  2688 LINK = . 
      008E37 02                    2689         .byte      2
      008E38 23 3E                 2690         .ascii     "#>"
      008E3A                       2691 EDIGS:
      008E3A CD 86 07         [ 4] 2692         CALL     DROP
      008E3D CD 87 51         [ 4] 2693         CALL     HLD
      008E40 CD 85 6A         [ 4] 2694         CALL     AT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008E43 CD 8C C9         [ 4] 2695         CALL     PAD
      008E46 CD 86 3B         [ 4] 2696         CALL     OVER
      008E49 CC 88 B9         [ 2] 2697         JP     SUBB
                                   2698 
                                   2699 ;       str     ( w -- b u )
                                   2700 ;       Convert a signed integer
                                   2701 ;       to a numeric string.
      008E4C 8E 37                 2702         .word      LINK
                           000DCE  2703 LINK = . 
      008E4E 03                    2704         .byte      3
      008E4F 53 54 52              2705         .ascii     "STR"
      008E52                       2706 STR:
      008E52 CD 86 11         [ 4] 2707         CALL     DUPP
      008E55 CD 85 DA         [ 4] 2708         CALL     TOR
      008E58 CD 88 D3         [ 4] 2709         CALL     ABSS
      008E5B CD 8D D5         [ 4] 2710         CALL     BDIGS
      008E5E CD 8E 0F         [ 4] 2711         CALL     DIGS
      008E61 CD 85 BB         [ 4] 2712         CALL     RFROM
      008E64 CD 8E 24         [ 4] 2713         CALL     SIGN
      008E67 CC 8E 3A         [ 2] 2714         JP     EDIGS
                                   2715 
                                   2716 ;       HEX     ( -- )
                                   2717 ;       Use radix 16 as base for
                                   2718 ;       numeric conversions.
      008E6A 8E 4E                 2719         .word      LINK
                           000DEC  2720 LINK = . 
      008E6C 03                    2721         .byte      3
      008E6D 48 45 58              2722         .ascii     "HEX"
      008E70                       2723 HEX:
      008E70 CD 84 F1         [ 4] 2724         CALL     DOLIT
      008E73 00 10                 2725         .word      16
      008E75 CD 86 E1         [ 4] 2726         CALL     BASE
      008E78 CC 85 53         [ 2] 2727         JP     STORE
                                   2728 
                                   2729 ;       DECIMAL ( -- )
                                   2730 ;       Use radix 10 as base
                                   2731 ;       for numeric conversions.
      008E7B 8E 6C                 2732         .word      LINK
                           000DFD  2733 LINK = . 
      008E7D 07                    2734         .byte      7
      008E7E 44 45 43 49 4D 41 4C  2735         .ascii     "DECIMAL"
      008E85                       2736 DECIM:
      008E85 CD 84 F1         [ 4] 2737         CALL     DOLIT
      008E88 00 0A                 2738         .word      10
      008E8A CD 86 E1         [ 4] 2739         CALL     BASE
      008E8D CC 85 53         [ 2] 2740         JP     STORE
                                   2741 
                                   2742 ;; Numeric input, single precision
                                   2743 
                                   2744 ;       DIGIT?  ( c base -- u t )
                                   2745 ;       Convert a character to its numeric
                                   2746 ;       value. A flag indicates success.
      008E90 8E 7D                 2747         .word      LINK
                           000E12  2748 LINK = . 
      008E92 06                    2749         .byte       6
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008E93 44 49 47 49 54 3F     2750         .ascii     "DIGIT?"
      008E99                       2751 DIGTQ:
      008E99 CD 85 DA         [ 4] 2752         CALL     TOR
      008E9C CD 84 F1         [ 4] 2753         CALL     DOLIT
      008E9F 00 30                 2754         .word     48	; "0"
      008EA1 CD 88 B9         [ 4] 2755         CALL     SUBB
      008EA4 CD 84 F1         [ 4] 2756         CALL     DOLIT
      008EA7 00 09                 2757         .word      9
      008EA9 CD 86 3B         [ 4] 2758         CALL     OVER
      008EAC CD 89 1E         [ 4] 2759         CALL     LESS
      008EAF CD 85 1A         [ 4] 2760         CALL     QBRAN
      008EB2 8E CA                 2761         .word      DGTQ1
      008EB4 CD 84 F1         [ 4] 2762         CALL     DOLIT
      008EB7 00 07                 2763         .word      7
      008EB9 CD 88 B9         [ 4] 2764         CALL     SUBB
      008EBC CD 86 11         [ 4] 2765         CALL     DUPP
      008EBF CD 84 F1         [ 4] 2766         CALL     DOLIT
      008EC2 00 0A                 2767         .word      10
      008EC4 CD 89 1E         [ 4] 2768         CALL     LESS
      008EC7 CD 86 84         [ 4] 2769         CALL     ORR
      008ECA CD 86 11         [ 4] 2770 DGTQ1:  CALL     DUPP
      008ECD CD 85 BB         [ 4] 2771         CALL     RFROM
      008ED0 CC 89 00         [ 2] 2772         JP     ULESS
                                   2773 
                           000001  2774 .if  WANT_DOUBLE
                           000000  2775 .else 
                                   2776 ;       NUMBER? ( a -- n T | a F )
                                   2777 ;       Convert a number string to
                                   2778 ;       integer. Push a flag on tos.
                                   2779         .word      LINK
                                   2780 LINK = . 
                                   2781         .byte      7
                                   2782         .ascii     "NUMBER?"
                                   2783 NUMBQ:
                                   2784         CALL     BASE
                                   2785         CALL     AT
                                   2786         CALL     TOR
                                   2787         CALL     ZERO
                                   2788         CALL     OVER
                                   2789         CALL     COUNT
                                   2790         CALL     OVER
                                   2791         CALL     CAT
                                   2792         CALL     DOLIT
                                   2793         .word     36	; "0x"
                                   2794         CALL     EQUAL
                                   2795         CALL     QBRAN
                                   2796         .word      NUMQ1
                                   2797         CALL     HEX
                                   2798         CALL     SWAPP
                                   2799         CALL     ONEP
                                   2800         CALL     SWAPP
                                   2801         CALL     ONEM
                                   2802 NUMQ1:  CALL     OVER
                                   2803         CALL     CAT
                                   2804         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2805         .word     45	; "-"
                                   2806         CALL     EQUAL
                                   2807         CALL     TOR
                                   2808         CALL     SWAPP
                                   2809         CALL     RAT
                                   2810         CALL     SUBB
                                   2811         CALL     SWAPP
                                   2812         CALL     RAT
                                   2813         CALL     PLUS
                                   2814         CALL     QDUP
                                   2815         CALL     QBRAN
                                   2816         .word      NUMQ6
                                   2817         CALL     ONEM
                                   2818         CALL     TOR
                                   2819 NUMQ2:  CALL     DUPP
                                   2820         CALL     TOR
                                   2821         CALL     CAT
                                   2822         CALL     BASE
                                   2823         CALL     AT
                                   2824         CALL     DIGTQ
                                   2825         CALL     QBRAN
                                   2826         .word      NUMQ4
                                   2827         CALL     SWAPP
                                   2828         CALL     BASE
                                   2829         CALL     AT
                                   2830         CALL     STAR
                                   2831         CALL     PLUS
                                   2832         CALL     RFROM
                                   2833         CALL     ONEP
                                   2834         CALL     DONXT
                                   2835         .word      NUMQ2
                                   2836         CALL     RAT
                                   2837         CALL     SWAPP
                                   2838         CALL     DROP
                                   2839         CALL     QBRAN
                                   2840         .word      NUMQ3
                                   2841         CALL     NEGAT
                                   2842 NUMQ3:  CALL     SWAPP
                                   2843         JRA     NUMQ5
                                   2844 NUMQ4:  CALL     RFROM
                                   2845         CALL     RFROM
                                   2846         CALL     DDROP
                                   2847         CALL     DDROP
                                   2848         CALL     ZERO
                                   2849 NUMQ5:  CALL     DUPP
                                   2850 NUMQ6:  CALL     RFROM
                                   2851         CALL     DDROP
                                   2852         CALL     RFROM
                                   2853         CALL     BASE
                                   2854         JP     STORE
                                   2855 .endif ; WANT_DOUBLE  
                                   2856 
                                   2857 ;; Basic I/O
                                   2858 
                                   2859 ;       KEY     ( -- c )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                                   2860 ;       Wait for and return an
                                   2861 ;       input character.
      008ED3 8E 92                 2862         .word      LINK
                           000E55  2863 LINK = . 
      008ED5 03                    2864         .byte      3
      008ED6 4B 45 59              2865         .ascii     "KEY"
      008ED9                       2866 KEY:
      008ED9 72 0B 52 30 FB   [ 2] 2867         btjf UART_SR,#UART_SR_RXNE,. 
      008EDE C6 52 31         [ 1] 2868         ld a,UART_DR 
      008EE1 1D 00 02         [ 2] 2869         subw x,#CELLL 
      008EE4 E7 01            [ 1] 2870         ld (1,x),a 
      008EE6 7F               [ 1] 2871         clr (x)
      008EE7 81               [ 4] 2872         ret 
                                   2873 
                                   2874 ;       NUF?    ( -- t )
                                   2875 ;       Return false if no input,
                                   2876 ;       else pause and if CR return true.
      008EE8 8E D5                 2877         .word      LINK
                           000E6A  2878 LINK = . 
      008EEA 04                    2879         .byte      4
      008EEB 4E 55 46 3F           2880         .ascii     "NUF?"
      008EEF                       2881 NUFQ:
      008EEF CD 84 98         [ 4] 2882         CALL     QKEY
      008EF2 CD 86 11         [ 4] 2883         CALL     DUPP
      008EF5 CD 85 1A         [ 4] 2884         CALL     QBRAN
      008EF8 8F 08                 2885         .word    NUFQ1
      008EFA CD 88 20         [ 4] 2886         CALL     DDROP
      008EFD CD 8E D9         [ 4] 2887         CALL     KEY
      008F00 CD 84 F1         [ 4] 2888         CALL     DOLIT
      008F03 00 0D                 2889         .word      CRR
      008F05 CC 88 E1         [ 2] 2890         JP     EQUAL
      008F08 81               [ 4] 2891 NUFQ1:  RET
                                   2892 
                                   2893 ;       SPACE   ( -- )
                                   2894 ;       Send  blank character to
                                   2895 ;       output device.
      008F09 8E EA                 2896         .word      LINK
                           000E8B  2897 LINK = . 
      008F0B 05                    2898         .byte      5
      008F0C 53 50 41 43 45        2899         .ascii     "SPACE"
      008F11                       2900 SPACE:
      008F11 CD 8B BD         [ 4] 2901         CALL     BLANK
      008F14 CC 84 B6         [ 2] 2902         JP     EMIT
                                   2903 
                                   2904 ;       SPACES  ( +n -- )
                                   2905 ;       Send n spaces to output device.
      008F17 8F 0B                 2906         .word      LINK
                           000E99  2907 LINK = . 
      008F19 06                    2908         .byte      6
      008F1A 53 50 41 43 45 53     2909         .ascii     "SPACES"
      008F20                       2910 SPACS:
      008F20 CD 8B CA         [ 4] 2911         CALL     ZERO
      008F23 CD 89 7C         [ 4] 2912         CALL     MAX
      008F26 CD 85 DA         [ 4] 2913         CALL     TOR
      008F29 20 03            [ 2] 2914         JRA      CHAR2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008F2B CD 8F 11         [ 4] 2915 CHAR1:  CALL     SPACE
      008F2E CD 85 05         [ 4] 2916 CHAR2:  CALL     DONXT
      008F31 8F 2B                 2917         .word    CHAR1
      008F33 81               [ 4] 2918         RET
                                   2919 
                                   2920 ;       TYPE    ( b u -- )
                                   2921 ;       Output u characters from b.
      008F34 8F 19                 2922         .word      LINK
                           000EB6  2923 LINK = . 
      008F36 04                    2924         .byte      4
      008F37 54 59 50 45           2925         .ascii     "TYPE"
      008F3B                       2926 TYPES:
      008F3B CD 85 DA         [ 4] 2927         CALL     TOR
      008F3E 20 0C            [ 2] 2928         JRA     TYPE2
      008F40 CD 86 11         [ 4] 2929 TYPE1:  CALL     DUPP
      008F43 CD 85 88         [ 4] 2930         CALL     CAT
      008F46 CD 84 B6         [ 4] 2931         CALL     EMIT
      008F49 CD 8B 5E         [ 4] 2932         CALL     ONEP
      008F4C CD 85 05         [ 4] 2933 TYPE2:  CALL     DONXT
      008F4F 8F 40                 2934         .word      TYPE1
      008F51 CC 86 07         [ 2] 2935         JP     DROP
                                   2936 
                                   2937 ;       CR      ( -- )
                                   2938 ;       Output a carriage return
                                   2939 ;       and a line feed.
      008F54 8F 36                 2940         .word      LINK
                           000ED6  2941 LINK = . 
      008F56 02                    2942         .byte      2
      008F57 43 52                 2943         .ascii     "CR"
      008F59                       2944 CR:
      008F59 CD 84 F1         [ 4] 2945         CALL     DOLIT
      008F5C 00 0D                 2946         .word      CRR
      008F5E CD 84 B6         [ 4] 2947         CALL     EMIT
      008F61 CD 84 F1         [ 4] 2948         CALL     DOLIT
      008F64 00 0A                 2949         .word      LF
      008F66 CC 84 B6         [ 2] 2950         JP     EMIT
                                   2951 
                                   2952 ;       do$     ( -- a )
                                   2953 ;       Return  address of a compiled
                                   2954 ;       string.
      008F69 8F 56                 2955         .word      LINK
                           000EEB  2956 LINK = . 
      008F6B 43                    2957 	.byte      COMPO+3
      008F6C 44 4F 24              2958         .ascii     "DO$"
      008F6F                       2959 DOSTR:
      008F6F CD 85 BB         [ 4] 2960         CALL     RFROM
      008F72 CD 85 CE         [ 4] 2961         CALL     RAT
      008F75 CD 85 BB         [ 4] 2962         CALL     RFROM
      008F78 CD 8C A1         [ 4] 2963         CALL     COUNT
      008F7B CD 88 40         [ 4] 2964         CALL     PLUS
      008F7E CD 85 DA         [ 4] 2965         CALL     TOR
      008F81 CD 86 21         [ 4] 2966         CALL     SWAPP
      008F84 CD 85 DA         [ 4] 2967         CALL     TOR
      008F87 81               [ 4] 2968         RET
                                   2969 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                                   2970 ;       $"|     ( -- a )
                                   2971 ;       Run time routine compiled by $".
                                   2972 ;       Return address of a compiled string.
      008F88 8F 6B                 2973         .word      LINK
                           000F0A  2974 LINK = . 
      008F8A 43                    2975 	.byte      COMPO+3
      008F8B 24 22 7C              2976         .byte     '$','"','|'
      008F8E                       2977 STRQP:
      008F8E CD 8F 6F         [ 4] 2978         CALL     DOSTR
      008F91 81               [ 4] 2979         RET
                                   2980 
                                   2981 ;       ."|     ( -- )
                                   2982 ;       Run time routine of ." .
                                   2983 ;       Output a compiled string.
      008F92 8F 8A                 2984         .word      LINK
                           000F14  2985 LINK = . 
      008F94 43                    2986 	.byte      COMPO+3
      008F95 2E 22 7C              2987         .byte     '.','"','|'
      008F98                       2988 DOTQP:
      008F98 CD 8F 6F         [ 4] 2989         CALL     DOSTR
      008F9B CD 8C A1         [ 4] 2990         CALL     COUNT
      008F9E CC 8F 3B         [ 2] 2991         JP     TYPES
                                   2992 
                                   2993 ;       .R      ( n +n -- )
                                   2994 ;       Display an integer in a field
                                   2995 ;       of n columns, right justified.
      008FA1 8F 94                 2996         .word      LINK
                           000F23  2997 LINK = . 
      008FA3 02                    2998         .byte      2
      008FA4 2E 52                 2999         .ascii     ".R"
      008FA6                       3000 DOTR:
      008FA6 CD 85 DA         [ 4] 3001         CALL     TOR
      008FA9 CD 8E 52         [ 4] 3002         CALL     STR
      008FAC CD 85 BB         [ 4] 3003         CALL     RFROM
      008FAF CD 86 3B         [ 4] 3004         CALL     OVER
      008FB2 CD 88 B9         [ 4] 3005         CALL     SUBB
      008FB5 CD 8F 20         [ 4] 3006         CALL     SPACS
      008FB8 CC 8F 3B         [ 2] 3007         JP     TYPES
                                   3008 
                                   3009 ;       U.R     ( u +n -- )
                                   3010 ;       Display an unsigned integer
                                   3011 ;       in n column, right justified.
      008FBB 8F A3                 3012         .word      LINK
                           000F3D  3013 LINK = . 
      008FBD 03                    3014         .byte      3
      008FBE 55 2E 52              3015         .ascii     "U.R"
      008FC1                       3016 UDOTR:
      008FC1 CD 85 DA         [ 4] 3017         CALL     TOR
      008FC4 CD 8D D5         [ 4] 3018         CALL     BDIGS
      008FC7 CD 8E 0F         [ 4] 3019         CALL     DIGS
      008FCA CD 8E 3A         [ 4] 3020         CALL     EDIGS
      008FCD CD 85 BB         [ 4] 3021         CALL     RFROM
      008FD0 CD 86 3B         [ 4] 3022         CALL     OVER
      008FD3 CD 88 B9         [ 4] 3023         CALL     SUBB
      008FD6 CD 8F 20         [ 4] 3024         CALL     SPACS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      008FD9 CC 8F 3B         [ 2] 3025         JP     TYPES
                                   3026 
                                   3027 ;       U.      ( u -- )
                                   3028 ;       Display an unsigned integer
                                   3029 ;       in free format.
      008FDC 8F BD                 3030         .word      LINK
                           000F5E  3031 LINK = . 
      008FDE 02                    3032         .byte      2
      008FDF 55 2E                 3033         .ascii     "U."
      008FE1                       3034 UDOT:
      008FE1 CD 8D D5         [ 4] 3035         CALL     BDIGS
      008FE4 CD 8E 0F         [ 4] 3036         CALL     DIGS
      008FE7 CD 8E 3A         [ 4] 3037         CALL     EDIGS
      008FEA CD 8F 11         [ 4] 3038         CALL     SPACE
      008FED CC 8F 3B         [ 2] 3039         JP     TYPES
                                   3040 
                                   3041 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3042 ;   H. ( n -- )
                                   3043 ;   display n in hexadecimal 
                                   3044 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F70                       3045         _HEADER HDOT,2,"H."
      008FF0 8F DE                    1         .word LINK 
                           000F72     2         LINK=.
      008FF2 02                       3         .byte 2  
      008FF3 48 2E                    4         .ascii "H."
      008FF5                          5         HDOT:
      008FF5 CD 86 E1         [ 4] 3046         CALL BASE 
      008FF8 CD 85 6A         [ 4] 3047         CALL AT 
      008FFB CD 85 DA         [ 4] 3048         CALL TOR 
      008FFE CD 8E 70         [ 4] 3049         CALL HEX 
      009001 CD 8F E1         [ 4] 3050         CALL UDOT 
      009004 CD 85 BB         [ 4] 3051         CALL RFROM 
      009007 CD 86 E1         [ 4] 3052         CALL BASE 
      00900A CD 85 53         [ 4] 3053         CALL STORE 
      00900D 81               [ 4] 3054         RET 
                                   3055 
                                   3056 
                                   3057 ;       .       ( w -- )
                                   3058 ;       Display an integer in free
                                   3059 ;       format, preceeded by a space.
      00900E 8F F2                 3060         .word      LINK
                           000F90  3061 LINK = . 
      009010 01                    3062         .byte      1
      009011 2E                    3063         .ascii     "."
      009012                       3064 DOT:
      009012 CD 86 E1         [ 4] 3065         CALL     BASE
      009015 CD 85 6A         [ 4] 3066         CALL     AT
      009018 CD 84 F1         [ 4] 3067         CALL     DOLIT
      00901B 00 0A                 3068         .word      10
      00901D CD 86 99         [ 4] 3069         CALL     XORR    ;?decimal
      009020 CD 85 1A         [ 4] 3070         CALL     QBRAN
      009023 90 28                 3071         .word      DOT1
      009025 CC 8F E1         [ 2] 3072         JP     UDOT
      009028 CD 8E 52         [ 4] 3073 DOT1:   CALL     STR
      00902B CD 8F 11         [ 4] 3074         CALL     SPACE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      00902E CC 8F 3B         [ 2] 3075         JP     TYPES
                                   3076 
                                   3077 ;       ?       ( a -- )
                                   3078 ;       Display contents in memory cell.
      009031 90 10                 3079         .word      LINK
                                   3080         
                           000FB3  3081 LINK = . 
      009033 01                    3082         .byte      1
      009034 3F                    3083         .ascii     "?"
      009035                       3084 QUEST:
      009035 CD 85 6A         [ 4] 3085         CALL     AT
      009038 CC 90 12         [ 2] 3086         JP     DOT
                                   3087 
                                   3088 ;; Parsing
                                   3089 
                                   3090 ;       parse   ( b u c -- b u delta ; <string> )
                                   3091 ;       Scan string delimited by c.
                                   3092 ;       Return found string and its offset.
      00903B 90 33                 3093         .word      LINK
                           000FBD  3094 LINK = . 
      00903D 05                    3095         .byte      5
      00903E 70 61 72 73 65        3096         .ascii     "parse"
      009043                       3097 PARS:
      009043 CD 86 F0         [ 4] 3098         CALL     TEMP
      009046 CD 85 53         [ 4] 3099         CALL     STORE
      009049 CD 86 3B         [ 4] 3100         CALL     OVER
      00904C CD 85 DA         [ 4] 3101         CALL     TOR
      00904F CD 86 11         [ 4] 3102         CALL     DUPP
      009052 CD 85 1A         [ 4] 3103         CALL     QBRAN
      009055 90 FB                 3104         .word    PARS8
      009057 CD 8B 6B         [ 4] 3105         CALL     ONEM
      00905A CD 86 F0         [ 4] 3106         CALL     TEMP
      00905D CD 85 6A         [ 4] 3107         CALL     AT
      009060 CD 8B BD         [ 4] 3108         CALL     BLANK
      009063 CD 88 E1         [ 4] 3109         CALL     EQUAL
      009066 CD 85 1A         [ 4] 3110         CALL     QBRAN
      009069 90 9C                 3111         .word      PARS3
      00906B CD 85 DA         [ 4] 3112         CALL     TOR
      00906E CD 8B BD         [ 4] 3113 PARS1:  CALL     BLANK
      009071 CD 86 3B         [ 4] 3114         CALL     OVER
      009074 CD 85 88         [ 4] 3115         CALL     CAT     ;skip leading blanks ONLY
      009077 CD 88 B9         [ 4] 3116         CALL     SUBB
      00907A CD 86 4A         [ 4] 3117         CALL     ZLESS
      00907D CD 88 5A         [ 4] 3118         CALL     INVER
      009080 CD 85 1A         [ 4] 3119         CALL     QBRAN
      009083 90 99                 3120         .word      PARS2
      009085 CD 8B 5E         [ 4] 3121         CALL     ONEP
      009088 CD 85 05         [ 4] 3122         CALL     DONXT
      00908B 90 6E                 3123         .word      PARS1
      00908D CD 85 BB         [ 4] 3124         CALL     RFROM
      009090 CD 86 07         [ 4] 3125         CALL     DROP
      009093 CD 8B CA         [ 4] 3126         CALL     ZERO
      009096 CC 86 11         [ 2] 3127         JP     DUPP
      009099 CD 85 BB         [ 4] 3128 PARS2:  CALL     RFROM
      00909C CD 86 3B         [ 4] 3129 PARS3:  CALL     OVER
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      00909F CD 86 21         [ 4] 3130         CALL     SWAPP
      0090A2 CD 85 DA         [ 4] 3131         CALL     TOR
      0090A5 CD 86 F0         [ 4] 3132 PARS4:  CALL     TEMP
      0090A8 CD 85 6A         [ 4] 3133         CALL     AT
      0090AB CD 86 3B         [ 4] 3134         CALL     OVER
      0090AE CD 85 88         [ 4] 3135         CALL     CAT
      0090B1 CD 88 B9         [ 4] 3136         CALL     SUBB    ;scan for delimiter
      0090B4 CD 86 F0         [ 4] 3137         CALL     TEMP
      0090B7 CD 85 6A         [ 4] 3138         CALL     AT
      0090BA CD 8B BD         [ 4] 3139         CALL     BLANK
      0090BD CD 88 E1         [ 4] 3140         CALL     EQUAL
      0090C0 CD 85 1A         [ 4] 3141         CALL     QBRAN
      0090C3 90 C8                 3142         .word      PARS5
      0090C5 CD 86 4A         [ 4] 3143         CALL     ZLESS
      0090C8 CD 85 1A         [ 4] 3144 PARS5:  CALL     QBRAN
      0090CB 90 DD                 3145         .word      PARS6
      0090CD CD 8B 5E         [ 4] 3146         CALL     ONEP
      0090D0 CD 85 05         [ 4] 3147         CALL     DONXT
      0090D3 90 A5                 3148         .word      PARS4
      0090D5 CD 86 11         [ 4] 3149         CALL     DUPP
      0090D8 CD 85 DA         [ 4] 3150         CALL     TOR
      0090DB 20 0F            [ 2] 3151         JRA     PARS7
      0090DD CD 85 BB         [ 4] 3152 PARS6:  CALL     RFROM
      0090E0 CD 86 07         [ 4] 3153         CALL     DROP
      0090E3 CD 86 11         [ 4] 3154         CALL     DUPP
      0090E6 CD 8B 5E         [ 4] 3155         CALL     ONEP
      0090E9 CD 85 DA         [ 4] 3156         CALL     TOR
      0090EC CD 86 3B         [ 4] 3157 PARS7:  CALL     OVER
      0090EF CD 88 B9         [ 4] 3158         CALL     SUBB
      0090F2 CD 85 BB         [ 4] 3159         CALL     RFROM
      0090F5 CD 85 BB         [ 4] 3160         CALL     RFROM
      0090F8 CC 88 B9         [ 2] 3161         JP     SUBB
      0090FB CD 86 3B         [ 4] 3162 PARS8:  CALL     OVER
      0090FE CD 85 BB         [ 4] 3163         CALL     RFROM
      009101 CC 88 B9         [ 2] 3164         JP     SUBB
                                   3165 
                                   3166 ;       PARSE   ( c -- b u ; <string> )
                                   3167 ;       Scan input stream and return
                                   3168 ;       counted string delimited by c.
      009104 90 3D                 3169         .word      LINK
                           001086  3170 LINK = . 
      009106 05                    3171         .byte      5
      009107 50 41 52 53 45        3172         .ascii     "PARSE"
      00910C                       3173 PARSE:
      00910C CD 85 DA         [ 4] 3174         CALL     TOR
      00910F CD 8C DA         [ 4] 3175         CALL     TIB
      009112 CD 86 FF         [ 4] 3176         CALL     INN
      009115 CD 85 6A         [ 4] 3177         CALL     AT
      009118 CD 88 40         [ 4] 3178         CALL     PLUS    ;current input buffer pointer
      00911B CD 87 0F         [ 4] 3179         CALL     NTIB
      00911E CD 85 6A         [ 4] 3180         CALL     AT
      009121 CD 86 FF         [ 4] 3181         CALL     INN
      009124 CD 85 6A         [ 4] 3182         CALL     AT
      009127 CD 88 B9         [ 4] 3183         CALL     SUBB    ;remaining count
      00912A CD 85 BB         [ 4] 3184         CALL     RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      00912D CD 90 43         [ 4] 3185         CALL     PARS
      009130 CD 86 FF         [ 4] 3186         CALL     INN
      009133 CC 8C 3A         [ 2] 3187         JP     PSTOR
                                   3188 
                                   3189 ;       .(      ( -- )
                                   3190 ;       Output following string up to next ) .
      009136 91 06                 3191         .word      LINK
                           0010B8  3192 LINK = . 
      009138 82                    3193 	.byte      IMEDD+2
      009139 2E 28                 3194         .ascii     ".("
      00913B                       3195 DOTPR:
      00913B CD 84 F1         [ 4] 3196         CALL     DOLIT
      00913E 00 29                 3197         .word     41	; ")"
      009140 CD 91 0C         [ 4] 3198         CALL     PARSE
      009143 CC 8F 3B         [ 2] 3199         JP     TYPES
                                   3200 
                                   3201 ;       (       ( -- )
                                   3202 ;       Ignore following string up to next ).
                                   3203 ;       A comment.
      009146 91 38                 3204         .word      LINK
                           0010C8  3205 LINK = . 
      009148 81                    3206 	.byte      IMEDD+1
      009149 28                    3207         .ascii     "("
      00914A                       3208 PAREN:
      00914A CD 84 F1         [ 4] 3209         CALL     DOLIT
      00914D 00 29                 3210         .word     41	; ")"
      00914F CD 91 0C         [ 4] 3211         CALL     PARSE
      009152 CC 88 20         [ 2] 3212         JP     DDROP
                                   3213 
                                   3214 ;       \       ( -- )
                                   3215 ;       Ignore following text till
                                   3216 ;       end of line.
      009155 91 48                 3217         .word      LINK
                           0010D7  3218 LINK = . 
      009157 81                    3219 	.byte      IMEDD+1
      009158 5C                    3220         .ascii     "\"
      009159                       3221 BKSLA:
      009159 90 AE 00 0E      [ 2] 3222         ldw y,#UCTIB ; #TIB  
      00915D 90 FE            [ 2] 3223         ldw y,(y)
      00915F 90 89            [ 2] 3224         pushw y ; count in TIB 
      009161 90 AE 00 0C      [ 2] 3225         ldw y,#UINN ; >IN 
      009165 90 BF 26         [ 2] 3226         ldw YTEMP,y
      009168 90 85            [ 2] 3227         popw y 
      00916A 91 CF 26         [ 5] 3228         ldw [YTEMP],y
      00916D 81               [ 4] 3229         ret 
                                   3230 
                                   3231 ;       WORD    ( c -- a ; <string> )
                                   3232 ;       Parse a word from input stream
                                   3233 ;       and copy it to code dictionary.
      00916E 91 57                 3234         .word      LINK
                           0010F0  3235 LINK = . 
      009170 04                    3236         .byte      4
      009171 57 4F 52 44           3237         .ascii     "WORD"
      009175                       3238 WORDD:
      009175 CD 91 0C         [ 4] 3239         CALL     PARSE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      009178 CD 8C B8         [ 4] 3240         CALL     HERE
      00917B CD 8B 33         [ 4] 3241         CALL     CELLP
                           000000  3242 .IF CASE_SENSE 
                                   3243         JP      PACKS 
                           000001  3244 .ELSE                 
      00917E CD 8D 78         [ 4] 3245         CALL     PACKS
                                   3246 ; uppercase TOKEN 
      009181 CD 86 11         [ 4] 3247         CALL    DUPP 
      009184 CD 8C A1         [ 4] 3248         CALL    COUNT 
      009187 CD 85 DA         [ 4] 3249         CALL    TOR 
      00918A CD 85 36         [ 4] 3250         CALL    BRAN 
      00918D 91 BB                 3251         .word   UPPER2  
      00918F                       3252 UPPER:
      00918F CD 86 11         [ 4] 3253         CALL    DUPP 
      009192 CD 85 88         [ 4] 3254         CALL    CAT
      009195 CD 86 11         [ 4] 3255         CALL    DUPP 
      009198 CD 84 F1         [ 4] 3256         CALL   DOLIT
      00919B 00 61                 3257         .word   'a' 
      00919D CD 84 F1         [ 4] 3258         CALL    DOLIT
      0091A0 00 7B                 3259         .word   'z'+1 
      0091A2 CD 89 B9         [ 4] 3260         CALL   WITHI 
      0091A5 CD 85 1A         [ 4] 3261         CALL   QBRAN
      0091A8 91 B2                 3262         .word  UPPER1  
      0091AA CD 84 F1         [ 4] 3263         CALL    DOLIT 
      0091AD 00 DF                 3264         .word   0xDF 
      0091AF CD 86 70         [ 4] 3265         CALL    ANDD 
      0091B2                       3266 UPPER1:
      0091B2 CD 86 3B         [ 4] 3267         CALL    OVER 
      0091B5 CD 85 77         [ 4] 3268         CALL    CSTOR          
      0091B8 CD 8B 5E         [ 4] 3269         CALL    ONEP 
      0091BB                       3270 UPPER2: 
      0091BB CD 85 05         [ 4] 3271         CALL    DONXT
      0091BE 91 8F                 3272         .word   UPPER  
      0091C0 CD 86 07         [ 4] 3273         CALL    DROP  
      0091C3 81               [ 4] 3274         RET 
                                   3275 .ENDIF 
                                   3276 
                                   3277 ;       TOKEN   ( -- a ; <string> )
                                   3278 ;       Parse a word from input stream
                                   3279 ;       and copy it to name dictionary.
      0091C4 91 70                 3280         .word      LINK
                           001146  3281 LINK = . 
      0091C6 05                    3282         .byte      5
      0091C7 54 4F 4B 45 4E        3283         .ascii     "TOKEN"
      0091CC                       3284 TOKEN:
      0091CC CD 8B BD         [ 4] 3285         CALL     BLANK
      0091CF CC 91 75         [ 2] 3286         JP     WORDD
                                   3287 
                                   3288 ;; Dictionary search
                                   3289 
                                   3290 ;       NAME>   ( na -- ca )
                                   3291 ;       Return a code address given
                                   3292 ;       a name address.
      0091D2 91 C6                 3293         .word      LINK
                           001154  3294 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0091D4 05                    3295         .byte      5
      0091D5 4E 41 4D 45 3E        3296         .ascii     "NAME>"
      0091DA                       3297 NAMET:
      0091DA CD 8C A1         [ 4] 3298         CALL     COUNT
      0091DD CD 84 F1         [ 4] 3299         CALL     DOLIT
      0091E0 00 1F                 3300         .word      31
      0091E2 CD 86 70         [ 4] 3301         CALL     ANDD
      0091E5 CC 88 40         [ 2] 3302         JP     PLUS
                                   3303 
                                   3304 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   3305 ;       Compare u cells in two
                                   3306 ;       strings. Return 0 if identical.
      0091E8 91 D4                 3307         .word      LINK
                           00116A  3308 LINK = . 
      0091EA 05                    3309         .byte       5
      0091EB 53 41 4D 45 3F        3310         .ascii     "SAME?"
      0091F0                       3311 SAMEQ:
      0091F0 CD 8B 6B         [ 4] 3312         CALL     ONEM
      0091F3 CD 85 DA         [ 4] 3313         CALL     TOR
      0091F6 20 29            [ 2] 3314         JRA     SAME2
      0091F8 CD 86 3B         [ 4] 3315 SAME1:  CALL     OVER
      0091FB CD 85 CE         [ 4] 3316         CALL     RAT
      0091FE CD 88 40         [ 4] 3317         CALL     PLUS
      009201 CD 85 88         [ 4] 3318         CALL     CAT
      009204 CD 86 3B         [ 4] 3319         CALL     OVER
      009207 CD 85 CE         [ 4] 3320         CALL     RAT
      00920A CD 88 40         [ 4] 3321         CALL     PLUS
      00920D CD 85 88         [ 4] 3322         CALL     CAT
      009210 CD 88 B9         [ 4] 3323         CALL     SUBB
      009213 CD 87 CE         [ 4] 3324         CALL     QDUP
      009216 CD 85 1A         [ 4] 3325         CALL     QBRAN
      009219 92 21                 3326         .word      SAME2
      00921B CD 85 BB         [ 4] 3327         CALL     RFROM
      00921E CC 86 07         [ 2] 3328         JP     DROP
      009221 CD 85 05         [ 4] 3329 SAME2:  CALL     DONXT
      009224 91 F8                 3330         .word      SAME1
      009226 CC 8B CA         [ 2] 3331         JP     ZERO
                                   3332 
                                   3333 ;       find    ( a va -- ca na | a F )
                                   3334 ;       Search vocabulary for string.
                                   3335 ;       Return ca and na if succeeded.
      009229 91 EA                 3336         .word      LINK
                           0011AB  3337 LINK = . 
      00922B 04                    3338         .byte      4
      00922C 46 49 4E 44           3339         .ascii     "FIND"
      009230                       3340 FIND:
      009230 CD 86 21         [ 4] 3341         CALL     SWAPP
      009233 CD 86 11         [ 4] 3342         CALL     DUPP
      009236 CD 85 88         [ 4] 3343         CALL     CAT
      009239 CD 86 F0         [ 4] 3344         CALL     TEMP
      00923C CD 85 53         [ 4] 3345         CALL     STORE
      00923F CD 86 11         [ 4] 3346         CALL     DUPP
      009242 CD 85 6A         [ 4] 3347         CALL     AT
      009245 CD 85 DA         [ 4] 3348         CALL     TOR
      009248 CD 8B 33         [ 4] 3349         CALL     CELLP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      00924B CD 86 21         [ 4] 3350         CALL     SWAPP
      00924E CD 85 6A         [ 4] 3351 FIND1:  CALL     AT
      009251 CD 86 11         [ 4] 3352         CALL     DUPP
      009254 CD 85 1A         [ 4] 3353         CALL     QBRAN
      009257 92 8D                 3354         .word      FIND6
      009259 CD 86 11         [ 4] 3355         CALL     DUPP
      00925C CD 85 6A         [ 4] 3356         CALL     AT
      00925F CD 84 F1         [ 4] 3357         CALL     DOLIT
      009262 1F 7F                 3358         .word      MASKK
      009264 CD 86 70         [ 4] 3359         CALL     ANDD
      009267 CD 85 CE         [ 4] 3360         CALL     RAT
      00926A CD 86 99         [ 4] 3361         CALL     XORR
      00926D CD 85 1A         [ 4] 3362         CALL     QBRAN
      009270 92 7C                 3363         .word      FIND2
      009272 CD 8B 33         [ 4] 3364         CALL     CELLP
      009275 CD 84 F1         [ 4] 3365         CALL     DOLIT
      009278 FF FF                 3366         .word     0xFFFF
      00927A 20 0C            [ 2] 3367         JRA     FIND3
      00927C CD 8B 33         [ 4] 3368 FIND2:  CALL     CELLP
      00927F CD 86 F0         [ 4] 3369         CALL     TEMP
      009282 CD 85 6A         [ 4] 3370         CALL     AT
      009285 CD 91 F0         [ 4] 3371         CALL     SAMEQ
      009288 CD 85 36         [ 4] 3372 FIND3:  CALL     BRAN
      00928B 92 9C                 3373         .word      FIND4
      00928D CD 85 BB         [ 4] 3374 FIND6:  CALL     RFROM
      009290 CD 86 07         [ 4] 3375         CALL     DROP
      009293 CD 86 21         [ 4] 3376         CALL     SWAPP
      009296 CD 8B 42         [ 4] 3377         CALL     CELLM
      009299 CC 86 21         [ 2] 3378         JP     SWAPP
      00929C CD 85 1A         [ 4] 3379 FIND4:  CALL     QBRAN
      00929F 92 A9                 3380         .word      FIND5
      0092A1 CD 8B 42         [ 4] 3381         CALL     CELLM
      0092A4 CD 8B 42         [ 4] 3382         CALL     CELLM
      0092A7 20 A5            [ 2] 3383         JRA     FIND1
      0092A9 CD 85 BB         [ 4] 3384 FIND5:  CALL     RFROM
      0092AC CD 86 07         [ 4] 3385         CALL     DROP
      0092AF CD 86 21         [ 4] 3386         CALL     SWAPP
      0092B2 CD 86 07         [ 4] 3387         CALL     DROP
      0092B5 CD 8B 42         [ 4] 3388         CALL     CELLM
      0092B8 CD 86 11         [ 4] 3389         CALL     DUPP
      0092BB CD 91 DA         [ 4] 3390         CALL     NAMET
      0092BE CC 86 21         [ 2] 3391         JP     SWAPP
                                   3392 
                                   3393 ;       NAME?   ( a -- ca na | a F )
                                   3394 ;       Search vocabularies for a string.
      0092C1 92 2B                 3395         .word      LINK
                           001243  3396 LINK = . 
      0092C3 05                    3397         .byte      5
      0092C4 4E 41 4D 45 3F        3398         .ascii     "NAME?"
      0092C9                       3399 NAMEQ:
      0092C9 CD 87 64         [ 4] 3400         CALL   CNTXT
      0092CC CC 92 30         [ 2] 3401         JP     FIND
                                   3402 
                                   3403 ;; Terminal response
                                   3404 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   3405 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3406 ;       Backup cursor by one character.
      0092CF 92 C3                 3407         .word      LINK
                           001251  3408 LINK = . 
      0092D1 02                    3409         .byte      2
      0092D2 5E 48                 3410         .ascii     "^H"
      0092D4                       3411 BKSP:
      0092D4 CD 85 DA         [ 4] 3412         CALL     TOR
      0092D7 CD 86 3B         [ 4] 3413         CALL     OVER
      0092DA CD 85 BB         [ 4] 3414         CALL     RFROM
      0092DD CD 86 21         [ 4] 3415         CALL     SWAPP
      0092E0 CD 86 3B         [ 4] 3416         CALL     OVER
      0092E3 CD 86 99         [ 4] 3417         CALL     XORR
      0092E6 CD 85 1A         [ 4] 3418         CALL     QBRAN
      0092E9 93 04                 3419         .word      BACK1
      0092EB CD 84 F1         [ 4] 3420         CALL     DOLIT
      0092EE 00 08                 3421         .word      BKSPP
      0092F0 CD 84 B6         [ 4] 3422         CALL     EMIT
      0092F3 CD 8B 6B         [ 4] 3423         CALL     ONEM
      0092F6 CD 8B BD         [ 4] 3424         CALL     BLANK
      0092F9 CD 84 B6         [ 4] 3425         CALL     EMIT
      0092FC CD 84 F1         [ 4] 3426         CALL     DOLIT
      0092FF 00 08                 3427         .word      BKSPP
      009301 CC 84 B6         [ 2] 3428         JP     EMIT
      009304 81               [ 4] 3429 BACK1:  RET
                                   3430 
                                   3431 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3432 ;       Accept and echo key stroke
                                   3433 ;       and bump cursor.
      009305 92 D1                 3434         .word      LINK
                           001287  3435 LINK = . 
      009307 03                    3436         .byte      3
      009308 54 41 50              3437         .ascii     "TAP"
      00930B                       3438 TAP:
      00930B CD 86 11         [ 4] 3439         CALL     DUPP
      00930E CD 84 B6         [ 4] 3440         CALL     EMIT
      009311 CD 86 3B         [ 4] 3441         CALL     OVER
      009314 CD 85 77         [ 4] 3442         CALL     CSTOR
      009317 CC 8B 5E         [ 2] 3443         JP     ONEP
                                   3444 
                                   3445 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3446 ;       Process a key stroke,
                                   3447 ;       CR,LF or backspace.
      00931A 93 07                 3448         .word      LINK
                           00129C  3449 LINK = . 
      00931C 04                    3450         .byte      4
      00931D 4B 54 41 50           3451         .ascii     "KTAP"
      009321                       3452 KTAP:
      009321 CD 86 11         [ 4] 3453         CALL     DUPP
      009324 CD 84 F1         [ 4] 3454         CALL     DOLIT
                           000001  3455 .if EOL_CR
      009327 00 0D                 3456         .word   CRR
                           000000  3457 .else ; EOL_LF 
                                   3458         .word   LF
                                   3459 .endif 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      009329 CD 86 99         [ 4] 3460         CALL     XORR
      00932C CD 85 1A         [ 4] 3461         CALL     QBRAN
      00932F 93 47                 3462         .word      KTAP2
      009331 CD 84 F1         [ 4] 3463         CALL     DOLIT
      009334 00 08                 3464         .word      BKSPP
      009336 CD 86 99         [ 4] 3465         CALL     XORR
      009339 CD 85 1A         [ 4] 3466         CALL     QBRAN
      00933C 93 44                 3467         .word      KTAP1
      00933E CD 8B BD         [ 4] 3468         CALL     BLANK
      009341 CC 93 0B         [ 2] 3469         JP     TAP
      009344 CC 92 D4         [ 2] 3470 KTAP1:  JP     BKSP
      009347 CD 86 07         [ 4] 3471 KTAP2:  CALL     DROP
      00934A CD 86 21         [ 4] 3472         CALL     SWAPP
      00934D CD 86 07         [ 4] 3473         CALL     DROP
      009350 CC 86 11         [ 2] 3474         JP     DUPP
                                   3475 
                                   3476 ;       accept  ( b u -- b u )
                                   3477 ;       Accept characters to input
                                   3478 ;       buffer. Return with actual count.
      009353 93 1C                 3479         .word      LINK
                           0012D5  3480 LINK = . 
      009355 06                    3481         .byte      6
      009356 41 43 43 45 50 54     3482         .ascii     "ACCEPT"
      00935C                       3483 ACCEP:
      00935C CD 86 3B         [ 4] 3484         CALL     OVER
      00935F CD 88 40         [ 4] 3485         CALL     PLUS
      009362 CD 86 3B         [ 4] 3486         CALL     OVER
      009365 CD 88 2B         [ 4] 3487 ACCP1:  CALL     DDUP
      009368 CD 86 99         [ 4] 3488         CALL     XORR
      00936B CD 85 1A         [ 4] 3489         CALL     QBRAN
      00936E 93 90                 3490         .word      ACCP4
      009370 CD 8E D9         [ 4] 3491         CALL     KEY
      009373 CD 86 11         [ 4] 3492         CALL     DUPP
      009376 CD 8B BD         [ 4] 3493         CALL     BLANK
      009379 CD 84 F1         [ 4] 3494         CALL     DOLIT
      00937C 00 7F                 3495         .word      127
      00937E CD 89 B9         [ 4] 3496         CALL     WITHI
      009381 CD 85 1A         [ 4] 3497         CALL     QBRAN
      009384 93 8B                 3498         .word      ACCP2
      009386 CD 93 0B         [ 4] 3499         CALL     TAP
      009389 20 03            [ 2] 3500         JRA     ACCP3
      00938B CD 93 21         [ 4] 3501 ACCP2:  CALL     KTAP
      00938E 20 D5            [ 2] 3502 ACCP3:  JRA     ACCP1
      009390 CD 86 07         [ 4] 3503 ACCP4:  CALL     DROP
      009393 CD 86 3B         [ 4] 3504         CALL     OVER
      009396 CC 88 B9         [ 2] 3505         JP     SUBB
                                   3506 
                                   3507 ;       QUERY   ( -- )
                                   3508 ;       Accept input stream to
                                   3509 ;       terminal input buffer.
      009399 93 55                 3510         .word      LINK
                                   3511         
                           00131B  3512 LINK = . 
      00939B 05                    3513         .byte      5
      00939C 51 55 45 52 59        3514         .ascii     "QUERY"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      0093A1                       3515 QUERY:
      0093A1 CD 8C DA         [ 4] 3516         CALL     TIB
      0093A4 CD 84 F1         [ 4] 3517         CALL     DOLIT
      0093A7 00 50                 3518         .word      80
      0093A9 CD 93 5C         [ 4] 3519         CALL     ACCEP
      0093AC CD 87 0F         [ 4] 3520         CALL     NTIB
      0093AF CD 85 53         [ 4] 3521         CALL     STORE
      0093B2 CD 86 07         [ 4] 3522         CALL     DROP
      0093B5 CD 8B CA         [ 4] 3523         CALL     ZERO
      0093B8 CD 86 FF         [ 4] 3524         CALL     INN
      0093BB CC 85 53         [ 2] 3525         JP     STORE
                                   3526 
                                   3527 ;       ABORT   ( -- )
                                   3528 ;       Reset data stack and
                                   3529 ;       jump to QUIT.
      0093BE 93 9B                 3530         .word      LINK
                           001340  3531 LINK = . 
      0093C0 05                    3532         .byte      5
      0093C1 41 42 4F 52 54        3533         .ascii     "ABORT"
      0093C6                       3534 ABORT:
      0093C6 CD 94 BD         [ 4] 3535         CALL     PRESE
      0093C9 CC 94 DA         [ 2] 3536         JP     QUIT
                                   3537 
                                   3538 ;       abort"  ( f -- )
                                   3539 ;       Run time routine of ABORT".
                                   3540 ;       Abort with a message.
      0093CC 93 C0                 3541         .word      LINK
                           00134E  3542 LINK = . 
      0093CE 46                    3543 	.byte      COMPO+6
      0093CF 41 42 4F 52 54        3544         .ascii     "ABORT"
      0093D4 22                    3545         .byte      '"'
      0093D5                       3546 ABORQ:
      0093D5 CD 85 1A         [ 4] 3547         CALL     QBRAN
      0093D8 93 F4                 3548         .word      ABOR2   ;text flag
      0093DA CD 8F 6F         [ 4] 3549         CALL     DOSTR
      0093DD CD 8F 11         [ 4] 3550 ABOR1:  CALL     SPACE
      0093E0 CD 8C A1         [ 4] 3551         CALL     COUNT
      0093E3 CD 8F 3B         [ 4] 3552         CALL     TYPES
      0093E6 CD 84 F1         [ 4] 3553         CALL     DOLIT
      0093E9 00 3F                 3554         .word     63 ; "?"
      0093EB CD 84 B6         [ 4] 3555         CALL     EMIT
      0093EE CD 8F 59         [ 4] 3556         CALL     CR
      0093F1 CC 93 C6         [ 2] 3557         JP     ABORT   ;pass error string
      0093F4 CD 8F 6F         [ 4] 3558 ABOR2:  CALL     DOSTR
      0093F7 CC 86 07         [ 2] 3559         JP     DROP
                                   3560 
                                   3561 ;; The text interpreter
                                   3562 
                                   3563 ;       $INTERPRET      ( a -- )
                                   3564 ;       Interpret a word. If failed,
                                   3565 ;       try to convert it to an integer.
      0093FA 93 CE                 3566         .word      LINK
                           00137C  3567 LINK = . 
      0093FC 0A                    3568         .byte      10
      0093FD 24 49 4E 54 45 52 50  3569         .ascii     "$INTERPRET"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal  52-Bits]



             52 45 54
      001387                       3570 INTER:
      009405 45 54 49         [ 4] 3571         CALL     NAMEQ
      009407 CD 07 4E         [ 4] 3572         CALL     QDUP    ;?defined
      009407 CD 92 C9         [ 4] 3573         CALL     QBRAN
      00940A CD 87                 3574         .word      INTE1
      00940C CE CD 85         [ 4] 3575         CALL     AT
      00940F 1A 94 31         [ 4] 3576         CALL     DOLIT
      009412 CD 85                 3577 	.word       0x4000	; COMPO*256
      009414 6A CD 84         [ 4] 3578         CALL     ANDD    ;?compile only lexicon bits
      009417 F1 40 00         [ 4] 3579         CALL     ABORQ
      00941A CD                    3580         .byte      13
      00941B 86 70 CD 93 D5 0D 20  3581         .ascii     " compile only"
             63 6F 6D 70 69 6C
      009428 65 20 6F         [ 2] 3582         JP     EXECU
      00942B 6E 6C 79         [ 4] 3583 INTE1:  CALL     NUMBQ   ;convert a number
      00942E CC 85 46         [ 4] 3584         CALL     QBRAN
      009431 CD A4                 3585         .word    ABOR1
      009433 D1               [ 4] 3586         RET
                                   3587 
                                   3588 ;       [       ( -- )
                                   3589 ;       Start  text interpreter.
      009434 CD 85                 3590         .word      LINK
                           0013BC  3591 LINK = . 
      009436 1A                    3592 	.byte      IMEDD+1
      009437 93                    3593         .ascii     "["
      0013BE                       3594 LBRAC:
      009438 DD 81 93         [ 4] 3595         CALL   DOLIT
      00943B FC 81                 3596         .word  INTER
      00943D 5B 06 C2         [ 4] 3597         CALL   TEVAL
      00943E CC 04 D3         [ 2] 3598         JP     STORE
                                   3599 
                                   3600 ;       .OK     ( -- )
                                   3601 ;       Display 'ok' while interpreting.
      00943E CD 84                 3602         .word      LINK
                           0013CB  3603 LINK = . 
      009440 F1                    3604         .byte      3
      009441 94 07 CD              3605         .ascii     ".OK"
      0013CF                       3606 DOTOK:
      009444 87 42 CC         [ 4] 3607         CALL     DOLIT
      009447 85 53                 3608         .word      INTER
      009449 94 3C 03         [ 4] 3609         CALL     TEVAL
      00944C 2E 4F 4B         [ 4] 3610         CALL     AT
      00944F CD 08 61         [ 4] 3611         CALL     EQUAL
      00944F CD 84 F1         [ 4] 3612         CALL     QBRAN
      009452 94 07                 3613         .word      DOTO1
      009454 CD 87 42         [ 4] 3614         CALL     DOTQP
      009457 CD                    3615         .byte      3
      009458 85 6A CD              3616         .ascii     " ok"
      00945B 88 E1 CD         [ 2] 3617 DOTO1:  JP     CR
                                   3618 
                                   3619 ;       ?STACK  ( -- )
                                   3620 ;       Abort if stack underflows.
      00945E 85 1A                 3621         .word      LINK
                           0013EE  3622 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      009460 94                    3623         .byte      6
      009461 69 CD 8F 98 03 20     3624         .ascii     "?STACK"
      0013F5                       3625 QSTAC: 
      009467 6F 6B CC         [ 4] 3626         CALL     DEPTH
      00946A 8F 59 94         [ 4] 3627         CALL     ZLESS   ;check only for underflow
      00946D 4B 06 3F         [ 4] 3628         CALL     ABORQ
      009470 53                    3629         .byte      11
      009471 54 41 43 4B 65 72 66  3630         .ascii     " underflow "
             6C 6F 77 20
      009475 81               [ 4] 3631         RET
                                   3632 
                                   3633 ;       EVAL    ( -- )
                                   3634 ;       Interpret  input stream.
      009475 CD 8C                 3635         .word      LINK
                           00140D  3636 LINK = . 
      009477 0C                    3637         .byte      4
      009478 CD 86 4A CD           3638         .ascii     "EVAL"
      001412                       3639 EVAL:
      00947C 93 D5 0B         [ 4] 3640 EVAL1:  CALL     TOKEN
      00947F 20 75 6E         [ 4] 3641         CALL     DUPP
      009482 64 65 72         [ 4] 3642         CALL     CAT     ;?input stream empty
      009485 66 6C 6F         [ 4] 3643         CALL     QBRAN
      009488 77 20                 3644         .word    EVAL2
      00948A 81 94 6E         [ 4] 3645         CALL     TEVAL
      00948D 04 45 56         [ 4] 3646         CALL     ATEXE
      009490 41 4C F5         [ 4] 3647         CALL     QSTAC   ;evaluate input, check stack
      009492 CD 04 B6         [ 4] 3648         CALL     BRAN
      009492 CD 91                 3649         .word    EVAL1
      009494 CC CD 86         [ 4] 3650 EVAL2:  CALL     DROP
      009497 11 CD 85         [ 2] 3651         JP       DOTOK
                                   3652 
                                   3653 ;       PRESET  ( -- )
                                   3654 ;       Reset data stack pointer and
                                   3655 ;       terminal input buffer.
      00949A 88 CD                 3656         .word      LINK
                           001436  3657 LINK = . 
      00949C 85                    3658         .byte      6
      00949D 1A 94 AE CD 87 42     3659         .ascii     "PRESET"
      00143D                       3660 PRESE:
      0094A3 CD 8C EE         [ 4] 3661         CALL     DOLIT
      0094A6 CD 94                 3662         .word      SPP
      0094A8 75 CD 85         [ 4] 3663         CALL     SPSTO
      0094AB 36 94 92         [ 4] 3664         CALL     DOLIT
      0094AE CD 86                 3665         .word      TIBB
      0094B0 07 CC 94         [ 4] 3666         CALL     NTIB
      0094B3 4F 94 8D         [ 4] 3667         CALL     CELLP
      0094B6 06 50 52         [ 2] 3668         JP     STORE
                                   3669 
                                   3670 ;       QUIT    ( -- )
                                   3671 ;       Reset return stack pointer
                                   3672 ;       and start text interpreter.
      0094B9 45 53                 3673         .word      LINK
                           001455  3674 LINK = . 
      0094BB 45                    3675         .byte      4
      0094BC 54 55 49 54           3676         .ascii     "QUIT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0094BD                       3677 QUIT:
      0094BD CD 84 F1         [ 4] 3678         CALL     DOLIT
      0094C0 16 80                 3679         .word      RPP
      0094C2 CD 85 FE         [ 4] 3680         CALL     RPSTO   ;reset return stack pointer
      0094C5 CD 84 F1         [ 4] 3681 QUIT1:  CALL     LBRAC   ;start interpretation
      0094C8 17 00 CD         [ 4] 3682 QUIT2:  CALL     QUERY   ;get input
      0094CB 87 0F CD         [ 4] 3683         CALL     EVAL
      0094CE 8B 33            [ 2] 3684         JRA     QUIT2   ;continue till error
                                   3685 
                                   3686 ;; The compiler
                                   3687 
                                   3688 ;       '       ( -- ca )
                                   3689 ;       Search vocabularies for
                                   3690 ;       next word in input stream.
      0094D0 CC 85                 3691         .word      LINK
                           00146F  3692 LINK = . 
      0094D2 53                    3693         .byte      1
      0094D3 94                    3694         .ascii     "'"
      001471                       3695 TICK:
      0094D4 B6 04 51         [ 4] 3696         CALL     TOKEN
      0094D7 55 49 54         [ 4] 3697         CALL     NAMEQ   ;?defined
      0094DA CD 04 9A         [ 4] 3698         CALL     QBRAN
      0094DA CD 84                 3699         .word      ABOR1
      0094DC F1               [ 4] 3700         RET     ;yes, push code address
                                   3701 
                                   3702 ;       ALLOT   ( n -- )
                                   3703 ;       Allocate n bytes to RAM 
      0094DD 17 FF                 3704         .word      LINK
                           00147F  3705         LINK = . 
      0094DF CD                    3706         .byte      5
      0094E0 85 A5 CD 94 3E        3707         .ascii     "ALLOT"
      001485                       3708 ALLOT:
      0094E5 CD 93 A1         [ 4] 3709         CALL     VPP
                                   3710 ; must update APP_VP each time VP is modidied
      0094E8 CD 94 92         [ 4] 3711         call PSTOR 
      0094EB 20 F8 94         [ 2] 3712         jp UPDATVP 
                                   3713 
                                   3714 ;       ,       ( w -- )
                                   3715 ;         Compile an integer into
                                   3716 ;         variable space.
      0094EE D5 01                 3717         .word      LINK
                           001490  3718 LINK = . 
      0094F0 27                    3719         .byte      1
      0094F1 2C                    3720         .ascii     ","
      001492                       3721 COMMA:
      0094F1 CD 91 CC         [ 4] 3722         CALL     HERE
      0094F4 CD 92 C9         [ 4] 3723         CALL     DUPP
      0094F7 CD 85 1A         [ 4] 3724         CALL     CELLP   ;cell boundary
      0094FA 93 DD 81         [ 4] 3725         CALL     VPP
      0094FD 94 EF 05         [ 4] 3726         CALL     STORE
      009500 41 4C 4C         [ 2] 3727         JP     STORE
                                   3728 
                                   3729 ;       C,      ( c -- )
                                   3730 ;       Compile a byte into
                                   3731 ;       variables space.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      009503 4F 54                 3732        .word      LINK
                           0014A6  3733 LINK = . 
      009505 02                    3734         .byte      2
      009505 CD 87                 3735         .ascii     "C,"
      0014A9                       3736 CCOMMA:
      009507 72 CD 8C         [ 4] 3737         CALL     HERE
      00950A 3A CC 9C         [ 4] 3738         CALL     DUPP
      00950D 4E 94 FF         [ 4] 3739         CALL     ONEP
      009510 01 2C F2         [ 4] 3740         CALL     VPP
      009512 CD 04 D3         [ 4] 3741         CALL     STORE
      009512 CD 8C B8         [ 2] 3742         JP     CSTOR
                                   3743 
                                   3744 ;       [COMPILE]       ( -- ; <string> )
                                   3745 ;       Compile next immediate
                                   3746 ;       word into code dictionary.
      009515 CD 86                 3747         .word      LINK
                           0014BD  3748 LINK = . 
      009517 11                    3749 	.byte      IMEDD+9
      009518 CD 8B 33 CD 87 72 CD  3750         .ascii     "[COMPILE]"
             85 53
      0014C7                       3751 BCOMP:
      009521 CC 85 53         [ 4] 3752         CALL     TICK
      009524 95 10 02         [ 2] 3753         JP     JSRC
                                   3754 
                                   3755 ;       COMPILE ( -- )
                                   3756 ;       Compile next jsr in
                                   3757 ;       colon list to code dictionary.
      009527 43 2C                 3758         .word      LINK
                           0014CF  3759 LINK = . 
      009529 47                    3760 	.byte      COMPO+7
      009529 CD 8C B8 CD 86 11 CD  3761         .ascii     "COMPILE"
      0014D7                       3762 COMPI:
      009530 8B 5E CD         [ 4] 3763         CALL     RFROM
      009533 87 72 CD         [ 4] 3764         CALL     DUPP
      009536 85 53 CC         [ 4] 3765         CALL     AT
      009539 85 77 95         [ 4] 3766         CALL     JSRC    ;compile subroutine
      00953C 26 89 5B         [ 4] 3767         CALL     CELLP
      00953F 43 4F            [ 1] 3768         ldw y,x 
      009541 4D 50            [ 2] 3769         ldw y,(y)
      009543 49 4C 45         [ 2] 3770         addw x,#CELLL 
      009546 5D FC            [ 2] 3771         jp (y)
                                   3772 
                                   3773 ;       LITERAL ( w -- )
                                   3774 ;       Compile tos to dictionary
                                   3775 ;       as an integer literal.
      009547 14 CF                 3776         .word      LINK
                           0014F1  3777 LINK = . 
      009547 CD                    3778 	.byte      IMEDD+7
      009548 94 F1 CC 98 1D 95 3D  3779         .ascii     "LITERAL"
      0014F9                       3780 LITER:
      00954F 47 43 4F         [ 4] 3781         CALL     COMPI
      009552 4D 50                 3782         .word DOLIT 
      009554 49 4C 45         [ 2] 3783         JP     COMMA
                                   3784 
                                   3785 ;       $,"     ( -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                                   3786 ;       Compile a literal string
                                   3787 ;       up to next " .
      009557 14 F1                 3788         .word      LINK
                           001503  3789 LINK = . 
      009557 CD                    3790         .byte      3
      009558 85 BB CD              3791         .byte     '$',',','"'
      001507                       3792 STRCQ:
      00955B 86 11 CD         [ 4] 3793         CALL     DOLIT
      00955E 85 6A                 3794         .word     34	; "
      009560 CD 98 1D         [ 4] 3795         CALL     PARSE
      009563 CD 8B 33         [ 4] 3796         CALL     HERE
      009566 90 93 90         [ 4] 3797         CALL     PACKS   ;string to code dictionary
      009569 FE 1C 00         [ 4] 3798         CALL     COUNT
      00956C 02 90 FC         [ 4] 3799         CALL     PLUS    ;calculate aligned end of string
      00956F 95 4F 87         [ 4] 3800         CALL     VPP
      009572 4C 49 54         [ 2] 3801         JP     STORE
                                   3802 
                                   3803 ;; Structures
                                   3804 
                                   3805 ;       FOR     ( -- a )
                                   3806 ;       Start a FOR-NEXT loop
                                   3807 ;       structure in a colon definition.
      009575 45 52                 3808         .word      LINK
                           001523  3809 LINK = . 
      009577 41                    3810 	.byte      IMEDD+3
      009578 4C 4F 52              3811         .ascii     "FOR"
      009579                       3812 FOR:
      009579 CD 95 57         [ 4] 3813         CALL     COMPI
      00957C 84 F1                 3814         .word TOR 
      00957E CC 95 12         [ 2] 3815         JP     HERE
                                   3816 
                                   3817 ;       NEXT    ( a -- )
                                   3818 ;       Terminate a FOR-NEXT loop.
      009581 95 71                 3819         .word      LINK
                           001531  3820 LINK = . 
      009583 03                    3821 	.byte      IMEDD+4
      009584 24 2C 22 54           3822         .ascii     "NEXT"
      009587                       3823 NEXT:
      009587 CD 84 F1         [ 4] 3824         CALL     COMPI
      00958A 00 22                 3825         .word DONXT 
      00958C CD 91 0C         [ 4] 3826         call ADRADJ
      00958F CD 8C B8         [ 2] 3827         JP     COMMA
                                   3828 
                                   3829 ;       I ( -- n )
                                   3830 ;       stack FOR-NEXT COUNTER 
      009592 CD 8D                 3831         .word LINK 
                           001543  3832         LINK=.
      009594 78                    3833         .byte 1 
      009595 CD                    3834         .ascii "I"
      001545                       3835 IFETCH: 
      009596 8C A1 CD         [ 2] 3836         subw x,#CELLL 
      009599 88 40            [ 2] 3837         ldw y,(3,sp)
      00959B CD               [ 2] 3838         ldw (x),y 
      00959C 87               [ 4] 3839         ret 
                                   3840 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                                   3841 ;       BEGIN   ( -- a )
                                   3842 ;       Start an infinite or
                                   3843 ;       indefinite loop structure.
      00959D 72 CC                 3844         .word      LINK
                           00154E  3845 LINK = . 
      00959F 85                    3846 	.byte      IMEDD+5
      0095A0 53 95 83 83 46        3847         .ascii     "BEGIN"
      001554                       3848 BEGIN:
      0095A5 4F 52 38         [ 2] 3849         JP     HERE
                                   3850 
                                   3851 ;       UNTIL   ( a -- )
                                   3852 ;       Terminate a BEGIN-UNTIL
                                   3853 ;       indefinite loop structure.
      0095A7 15 4E                 3854         .word      LINK
                           001559  3855 LINK = . 
      0095A7 CD                    3856 	.byte      IMEDD+5
      0095A8 95 57 85 DA CC        3857         .ascii     "UNTIL"
      00155F                       3858 UNTIL:
      0095AD 8C B8 95         [ 4] 3859         CALL     COMPI
      0095B0 A3 84                 3860         .word    QBRAN 
      0095B2 4E 45 58         [ 4] 3861         call ADRADJ
      0095B5 54 14 92         [ 2] 3862         JP     COMMA
                                   3863 
                                   3864 ;       AGAIN   ( a -- )
                                   3865 ;       Terminate a BEGIN-AGAIN
                                   3866 ;       infinite loop structure.
      0095B6 15 59                 3867         .word      LINK
                           00156C  3868 LINK = . 
      0095B6 CD                    3869 	.byte      IMEDD+5
      0095B7 95 57 85 05 CD        3870         .ascii     "AGAIN"
      001572                       3871 AGAIN:
      0095BC 87 BE CC         [ 4] 3872         CALL     COMPI
      0095BF 95 12                 3873         .word BRAN
      0095C1 95 B1 01         [ 4] 3874         call ADRADJ 
      0095C4 49 14 92         [ 2] 3875         JP     COMMA
                                   3876 
                                   3877 ;       IF      ( -- A )
                                   3878 ;       Begin a conditional branch.
      0095C5 15 6C                 3879         .word      LINK
                           00157F  3880 LINK = . 
      0095C5 1D                    3881 	.byte      IMEDD+2
      0095C6 00 02                 3882         .ascii     "IF"
      001582                       3883 IFF:
      0095C8 16 03 FF         [ 4] 3884         CALL     COMPI
      0095CB 81 95                 3885         .word QBRAN
      0095CD C3 85 42         [ 4] 3886         CALL     HERE
      0095D0 45 47 49         [ 4] 3887         CALL     ZERO
      0095D3 4E 14 92         [ 2] 3888         JP     COMMA
                                   3889 
                                   3890 ;       THEN        ( A -- )
                                   3891 ;       Terminate a conditional branch structure.
      0095D4 15 7F                 3892         .word      LINK
                           001592  3893 LINK = . 
      0095D4 CC                    3894 	.byte      IMEDD+4
      0095D5 8C B8 95 CE           3895         .ascii     "THEN"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      001597                       3896 THENN:
      0095D9 85 55 4E         [ 4] 3897         CALL     HERE
      0095DC 54 49 4C         [ 4] 3898         call ADRADJ 
      0095DF CD 05 A1         [ 4] 3899         CALL     SWAPP
      0095DF CD 95 57         [ 2] 3900         JP     STORE
                                   3901 
                                   3902 ;       ELSE        ( A -- A )
                                   3903 ;       Start the false clause in an IF-ELSE-THEN structure.
      0095E2 85 1A                 3904         .word      LINK
                           0015A5  3905 LINK = . 
      0095E4 CD                    3906 	.byte      IMEDD+4
      0095E5 87 BE CC 95           3907         .ascii     "ELSE"
      0015AA                       3908 ELSEE:
      0095E9 12 95 D9         [ 4] 3909         CALL     COMPI
      0095EC 85 41                 3910         .word BRAN
      0095EE 47 41 49         [ 4] 3911         CALL     HERE
      0095F1 4E 0B 4A         [ 4] 3912         CALL     ZERO
      0095F2 CD 14 92         [ 4] 3913         CALL     COMMA
      0095F2 CD 95 57         [ 4] 3914         CALL     SWAPP
      0095F5 85 36 CD         [ 4] 3915         CALL     HERE
      0095F8 87 BE CC         [ 4] 3916         call ADRADJ 
      0095FB 95 12 95         [ 4] 3917         CALL     SWAPP
      0095FE EC 82 49         [ 2] 3918         JP     STORE
                                   3919 
                                   3920 ;       AHEAD       ( -- A )
                                   3921 ;       Compile a forward branch instruction.
      009601 46 A5                 3922         .word      LINK
                           0015C9  3923 LINK = . 
      009602 85                    3924 	.byte      IMEDD+5
      009602 CD 95 57 85 1A        3925         .ascii     "AHEAD"
      0015CF                       3926 AHEAD:
      009607 CD 8C B8         [ 4] 3927         CALL     COMPI
      00960A CD 8B                 3928         .word BRAN
      00960C CA CC 95         [ 4] 3929         CALL     HERE
      00960F 12 95 FF         [ 4] 3930         CALL     ZERO
      009612 84 54 48         [ 2] 3931         JP     COMMA
                                   3932 
                                   3933 ;       WHILE       ( a -- A a )
                                   3934 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      009615 45 4E                 3935         .word      LINK
                           0015DF  3936 LINK = . 
      009617 85                    3937 	.byte      IMEDD+5
      009617 CD 8C B8 CD 87        3938         .ascii     "WHILE"
      0015E5                       3939 WHILE:
      00961C BE CD 86         [ 4] 3940         CALL     COMPI
      00961F 21 CC                 3941         .word QBRAN
      009621 85 53 96         [ 4] 3942         CALL     HERE
      009624 12 84 45         [ 4] 3943         CALL     ZERO
      009627 4C 53 45         [ 4] 3944         CALL     COMMA
      00962A CC 05 A1         [ 2] 3945         JP     SWAPP
                                   3946 
                                   3947 ;       REPEAT      ( A a -- )
                                   3948 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      00962A CD 95                 3949         .word      LINK
                           0015F8  3950 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      00962C 57                    3951         .byte      IMEDD+6
      00962D 85 36 CD 8C B8 CD     3952         .ascii     "REPEAT"
      0015FF                       3953 REPEA:
      009633 8B CA CD         [ 4] 3954         CALL     COMPI
      009636 95 12                 3955         .word BRAN
      009638 CD 86 21         [ 4] 3956         call ADRADJ 
      00963B CD 8C B8         [ 4] 3957         CALL     COMMA
      00963E CD 87 BE         [ 4] 3958         CALL     HERE
      009641 CD 86 21         [ 4] 3959         call ADRADJ 
      009644 CC 85 53         [ 4] 3960         CALL     SWAPP
      009647 96 25 85         [ 2] 3961         JP     STORE
                                   3962 
                                   3963 ;       AFT         ( a -- a A )
                                   3964 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      00964A 41 48                 3965         .word      LINK
                           001618  3966 LINK = . 
      00964C 45                    3967 	.byte      IMEDD+3
      00964D 41 44 54              3968         .ascii     "AFT"
      00964F                       3969 AFT:
      00964F CD 95 57         [ 4] 3970         CALL     DROP
      009652 85 36 CD         [ 4] 3971         CALL     AHEAD
      009655 8C B8 CD         [ 4] 3972         CALL     HERE
      009658 8B CA CC         [ 2] 3973         JP     SWAPP
                                   3974 
                                   3975 ;       ABORT"      ( -- ; <string> )
                                   3976 ;       Conditional abort with an error message.
      00965B 95 12                 3977         .word      LINK
                           00162A  3978 LINK = . 
      00965D 96                    3979 	.byte      IMEDD+6
      00965E 49 85 57 48 49        3980         .ascii     "ABORT"
      009663 4C                    3981         .byte      '"'
      001631                       3982 ABRTQ:
      009664 45 14 D7         [ 4] 3983         CALL     COMPI
      009665 13 55                 3984         .word ABORQ
      009665 CD 95 57         [ 2] 3985         JP     STRCQ
                                   3986 
                                   3987 ;       $"     ( -- ; <string> )
                                   3988 ;       Compile an inline string literal.
      009668 85 1A                 3989         .word      LINK
                           00163B  3990 LINK = . 
      00966A CD                    3991 	.byte      IMEDD+2
      00966B 8C B8                 3992         .byte     '$','"'
      00163E                       3993 STRQ:
      00966D CD 8B CA         [ 4] 3994         CALL     COMPI
      009670 CD 95                 3995         .word STRQP 
      009672 12 CC 86         [ 2] 3996         JP     STRCQ
                                   3997 
                                   3998 ;       ."          ( -- ; <string> )
                                   3999 ;       Compile an inline string literal to be typed out at run time.
      009675 21 96                 4000         .word      LINK
                           001648  4001 LINK = . 
      009677 5F                    4002 	.byte      IMEDD+2
      009678 86 52                 4003         .byte     '.','"'
      00164B                       4004 DOTQ:
      00967A 45 50 45         [ 4] 4005         CALL     COMPI
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      00967D 41 54                 4006         .word DOTQP 
      00967F CC 15 07         [ 2] 4007         JP     STRCQ
                                   4008 
                                   4009 ;; Name compiler
                                   4010 
                                   4011 ;       ?UNIQUE ( a -- a )
                                   4012 ;       Display a warning message
                                   4013 ;       if word already exists.
      00967F CD 95                 4014         .word      LINK
                           001655  4015 LINK = . 
      009681 57                    4016         .byte      7
      009682 85 36 CD 87 BE CD 95  4017         .ascii     "?UNIQUE"
      00165D                       4018 UNIQU:
      009689 12 CD 8C         [ 4] 4019         CALL     DUPP
      00968C B8 CD 87         [ 4] 4020         CALL     NAMEQ   ;?name exists
      00968F BE CD 86         [ 4] 4021         CALL     QBRAN
      009692 21 CC                 4022         .word      UNIQ1
      009694 85 53 96         [ 4] 4023         CALL     DOTQP   ;redef are OK
      009697 78                    4024         .byte       7
      009698 83 41 46 54 65 66 20  4025         .ascii     " reDef "       
      00969C CD 05 BB         [ 4] 4026         CALL     OVER
      00969C CD 86 07         [ 4] 4027         CALL     COUNT
      00969F CD 96 4F         [ 4] 4028         CALL     TYPES   ;just in case
      0096A2 CD 8C B8         [ 2] 4029 UNIQ1:  JP     DROP
                                   4030 
                                   4031 ;       $,n     ( na -- )
                                   4032 ;       Build a new dictionary name
                                   4033 ;       using string at na.
                                   4034 ; compile dans l'espace des variables 
      0096A5 CC 86                 4035         .word      LINK
                           001681  4036 LINK = . 
      0096A7 21                    4037         .byte      3
      0096A8 96 98 86              4038         .ascii     "$,n"
      001685                       4039 SNAME:
      0096AB 41 42 4F         [ 4] 4040         CALL     DUPP
      0096AE 52 54 22         [ 4] 4041         CALL     CAT     ;?null input
      0096B1 CD 04 9A         [ 4] 4042         CALL     QBRAN
      0096B1 CD 95                 4043         .word      PNAM1
      0096B3 57 93 D5         [ 4] 4044         CALL     UNIQU   ;?redefinition
      0096B6 CC 95 87         [ 4] 4045         CALL     DUPP
      0096B9 96 AA 82         [ 4] 4046         CALL     COUNT
      0096BC 24 22 C0         [ 4] 4047         CALL     PLUS
      0096BE CD 06 F2         [ 4] 4048         CALL     VPP
      0096BE CD 95 57         [ 4] 4049         CALL     STORE
      0096C1 8F 8E CC         [ 4] 4050         CALL     DUPP
      0096C4 95 87 96         [ 4] 4051         CALL     LAST
      0096C7 BB 82 2E         [ 4] 4052         CALL     STORE   ;save na for vocabulary link
      0096CA 22 0A C2         [ 4] 4053         CALL     CELLM   ;link address
      0096CB CD 06 E4         [ 4] 4054         CALL     CNTXT
      0096CB CD 95 57         [ 4] 4055         CALL     AT
      0096CE 8F 98 CC         [ 4] 4056         CALL     SWAPP
      0096D1 95 87 96         [ 4] 4057         CALL     STORE
      0096D4 C8               [ 4] 4058         RET     ;save code pointer
      0096D5 07 3F 55         [ 4] 4059 PNAM1:  CALL     STRQP
      0096D8 4E                    4060         .byte      5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      0096D9 49 51 55 45 65        4061         .ascii     " name" ;null input
      0096DD CC 13 5D         [ 2] 4062         JP     ABOR1
                                   4063 
                                   4064 ;; FORTH compiler
                                   4065 
                                   4066 ;       $COMPILE        ( a -- )
                                   4067 ;       Compile next word to
                                   4068 ;       dictionary as a token or literal.
      0096DD CD 86                 4069         .word      LINK
                           0016C9  4070 LINK = . 
      0096DF 11                    4071         .byte      8
      0096E0 CD 92 C9 CD 85 1A 96  4072         .ascii     "$COMPILE"
             FC
      0016D2                       4073 SCOMP:
      0096E8 CD 8F 98         [ 4] 4074         CALL     NAMEQ
      0096EB 07 20 72         [ 4] 4075         CALL     QDUP    ;?defined
      0096EE 65 44 65         [ 4] 4076         CALL     QBRAN
      0096F1 66 20                 4077         .word      SCOM2
      0096F3 CD 86 3B         [ 4] 4078         CALL     AT
      0096F6 CD 8C A1         [ 4] 4079         CALL     DOLIT
      0096F9 CD 8F                 4080         .word     0x8000	;  IMEDD*256
      0096FB 3B CC 86         [ 4] 4081         CALL     ANDD    ;?immediate
      0096FE 07 96 D5         [ 4] 4082         CALL     QBRAN
      009701 03 24                 4083         .word      SCOM1
      009703 2C 6E C6         [ 2] 4084         JP     EXECU
      009705 CC 17 9D         [ 2] 4085 SCOM1:  JP     JSRC
      009705 CD 86 11         [ 4] 4086 SCOM2:  CALL     NUMBQ   ;try to convert to number
      009708 CD 85 88         [ 4] 4087         CALL    QDUP  
      00970B CD 85 1A         [ 4] 4088         CALL     QBRAN
      00970E 97 3B                 4089         .word      ABOR1
      0016FE                       4090         _DOLIT  -1
      009710 CD 96 DD         [ 4]    1     CALL DOLIT 
      009713 CD 86                    2     .word -1 
      009715 11 CD 8C         [ 4] 4091         CALL    EQUAL
      001706                       4092         _QBRAN DLITER  
      009718 A1 CD 88         [ 4]    1     CALL QBRAN
      00971B 40 CD                    2     .word DLITER
      00971D 87 72 CD         [ 2] 4093         JP     LITER
                                   4094 
                                   4095 ;       OVERT   ( -- )
                                   4096 ;       Link a new word into vocabulary.
      009720 85 53                 4097         .word      LINK
                           001710  4098 LINK = . 
      009722 CD                    4099         .byte      5
      009723 86 11 CD 87 90        4100         .ascii     "OVERT"
      001716                       4101 OVERT:
      009728 CD 85 53         [ 4] 4102         CALL     LAST
      00972B CD 8B 42         [ 4] 4103         CALL     AT
      00972E CD 87 64         [ 4] 4104         CALL     CNTXT
      009731 CD 85 6A         [ 2] 4105         JP     STORE
                                   4106 
                                   4107 ;       ;       ( -- )
                                   4108 ;       Terminate a colon definition.
      009734 CD 86                 4109         .word      LINK
                           001724  4110 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      009736 21                    4111 	.byte      IMEDD+COMPO+1
      009737 CD                    4112         .ascii     ";"
      001726                       4113 SEMIS:
                           000001  4114 .if OPTIMIZE ; more compact and faster
      009738 85 53 81         [ 4] 4115         call DOLIT 
      00973B CD 8F                 4116         .word 0x81   ; opcode for RET 
      00973D 8E 05 20         [ 4] 4117         call CCOMMA 
                           000000  4118 .else
                                   4119         CALL     COMPI
                                   4120         .word EXIT 
                                   4121 .endif 
      009740 6E 61 6D         [ 4] 4122         CALL     LBRAC
      009743 65 CC 93         [ 4] 4123         call OVERT 
      009746 DD 97 01         [ 4] 4124         CALL FMOVE
      009749 08 24 43         [ 4] 4125         call QDUP 
      00974C 4F 4D 50         [ 4] 4126         call QBRAN 
      00974F 49 4C                 4127         .word SET_RAMLAST 
      009751 45 21 BA         [ 4] 4128         CALL UPDATPTR
      009752 81               [ 4] 4129         RET 
                                   4130 
                                   4131 
                                   4132 ;       Terminate an ISR definition 
                                   4133 ;       retourn ca of ISR as double
                                   4134 ;       I; ( -- ud )
      009752 CD 92                 4135         .word LINK 
                           001745  4136         LINK=.
      009754 C9                    4137         .byte 2+IMEDD+COMPO 
      009755 CD 87                 4138         .ascii "I;" 
      001748                       4139 ISEMI:
      009757 CE CD 85         [ 2] 4140         subw x,#CELLL  
      00975A 1A 97 73 CD      [ 2] 4141         ldw y,#IRET_CODE 
      00975E 85               [ 2] 4142         ldw (x),y 
      00975F 6A CD 84         [ 4] 4143         call CCOMMA
      009762 F1 80 00         [ 4] 4144         call LBRAC 
      009765 CD 86 70         [ 4] 4145         call IFMOVE
      009768 CD 85 1A         [ 4] 4146         call QDUP 
      00976B 97 70 CC         [ 4] 4147         CALL QBRAN 
      00976E 85 46                 4148         .word SET_RAMLAST
      009770 CC 98 1D         [ 4] 4149         CALL CPP
      009773 CD A4 D1         [ 4] 4150         call AT 
      009776 CD 87 CE         [ 4] 4151         call SWAPP 
      009779 CD 85 1A         [ 4] 4152         CALL CPP 
      00977C 93 DD CD         [ 4] 4153         call STORE 
      00977F 84 F1 FF         [ 4] 4154         call UPDATCP 
      009782 FF CD 88         [ 4] 4155         call EEPVP 
      009785 E1 CD 85         [ 4] 4156         call DROP 
      009788 1A A9 1E         [ 4] 4157         call AT 
      00978B CC 95 79         [ 4] 4158         call VPP 
      00978E 97 49 05         [ 4] 4159         call STORE 
      009791 4F 56 45         [ 2] 4160         jp ZERO
      009794 52               [ 4] 4161         ret           
                                   4162         
                                   4163 
                                   4164 ;       ]       ( -- )
                                   4165 ;       Start compiling words in
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   4166 ;       input stream.
      009795 54 45                 4167         .word      LINK
                           001788  4168 LINK = . 
      009796 01                    4169         .byte      1
      009796 CD                    4170         .ascii     "]"
      00178A                       4171 RBRAC:
      009797 87 90 CD         [ 4] 4172         CALL   DOLIT
      00979A 85 6A                 4173         .word  SCOMP
      00979C CD 87 64         [ 4] 4174         CALL   TEVAL
      00979F CC 85 53         [ 2] 4175         JP     STORE
                                   4176 
                                   4177 ;       CALL,    ( ca -- )
                                   4178 ;       Compile a subroutine call.
      0097A2 97 90                 4179         .word      LINK
                           001797  4180 LINK = . 
      0097A4 C1                    4181         .byte      5
      0097A5 3B 41 4C 4C 2C        4182         .ascii     "CALL,"
      0097A6                       4183 JSRC:
      0097A6 CD 84 F1         [ 4] 4184         CALL     DOLIT
      0097A9 00 81                 4185         .word     CALLL     ;CALL
      0097AB CD 95 29         [ 4] 4186         CALL     CCOMMA
      0097AE CD 94 3E         [ 2] 4187         JP     COMMA
                                   4188 
                                   4189 ;       INIT-OFS ( -- )
                                   4190 ;       compute offset to adjust jump address 
                                   4191 ;       set variable OFFSET 
      0097B1 CD 97                 4192         .word LINK 
                           0017AA  4193         LINK=.
      0097B3 96                    4194         .byte 8 
      0097B4 CD A1 A6 CD 87 CE CD  4195         .ascii "INIT-OFS" 
             85
      0017B3                       4196 INITOFS:
      0097BC 1A 98 ED         [ 4] 4197         call TFLASH 
      0097BF CD A2 3A         [ 4] 4198         CALL AT 
      0097C2 81 97 A4         [ 4] 4199         CALL DUPP 
      0097C5 C2 49 3B         [ 4] 4200         call QBRAN
      0097C8 17 D0                 4201         .word 1$
      0097C8 1D 00 02         [ 4] 4202         call DROP  
      0097CB 90 AE 00         [ 4] 4203         call CPP 
      0097CE 80 FF CD         [ 4] 4204         call AT 
      0097D1 95 29 CD         [ 4] 4205         call HERE
      0097D4 94 3E CD         [ 4] 4206         call SUBB 
      0097D7 A2 7F CD         [ 4] 4207 1$:     call OFFSET 
      0097DA 87 CE CD         [ 2] 4208         jp STORE  
                                   4209 
                                   4210 ;       :       ( -- ; <string> )
                                   4211 ;       Start a new colon definition
                                   4212 ;       using next word as its name.
      0097DD 85 1A                 4213         .word      LINK
                           0017D8  4214 LINK = . 
      0097DF 98                    4215         .byte      1
      0097E0 ED                    4216         .ascii     ":"
      0017DA                       4217 COLON:
      0097E1 CD 87 80         [ 4] 4218         call INITOFS       
      0097E4 CD 85 6A         [ 4] 4219         CALL   TOKEN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      0097E7 CD 86 21         [ 4] 4220         CALL   SNAME
      0097EA CD 87 80         [ 2] 4221         JP     RBRAC
                                   4222 
                                   4223 ;       I:  ( -- )
                                   4224 ;       Start interrupt service routine definition
                                   4225 ;       those definition have no name.
      0097ED CD 85                 4226         .word LINK
                           0017E8  4227         LINK=.
      0097EF 53                    4228         .byte 2 
      0097F0 CD 9C                 4229         .ascii "I:" 
      0017EB                       4230 ICOLON:
      0097F2 37 CD 9B         [ 4] 4231         call INITOFS 
      0097F5 F4 CD 86         [ 2] 4232         jp RBRAC  
                                   4233 
                                   4234 ;       IMMEDIATE       ( -- )
                                   4235 ;       Make last compiled word
                                   4236 ;       an immediate word.
      0097F8 07 CD                 4237         .word      LINK
                           0017F3  4238 LINK = . 
      0097FA 85                    4239         .byte      9
      0097FB 6A CD 87 72 CD 85 53  4240         .ascii     "IMMEDIATE"
             CC 8B
      0017FD                       4241 IMMED:
      009804 CA 81 97         [ 4] 4242         CALL     DOLIT
      009807 C5 01                 4243         .word     0x8000	;  IMEDD*256
      009809 5D 07 10         [ 4] 4244         CALL     LAST
      00980A CD 04 EA         [ 4] 4245         CALL     AT
      00980A CD 84 F1         [ 4] 4246         CALL     AT
      00980D 97 52 CD         [ 4] 4247         CALL     ORR
      009810 87 42 CC         [ 4] 4248         CALL     LAST
      009813 85 53 98         [ 4] 4249         CALL     AT
      009816 08 05 43         [ 2] 4250         JP     STORE
                                   4251 
                                   4252 ;; Defining words
                                   4253 
                                   4254 ;       CREATE  ( -- ; <string> )
                                   4255 ;       Compile a new array
                                   4256 ;       without allocating space.
      009819 41 4C                 4257         .word      LINK
                           001819  4258 LINK = . 
      00981B 4C                    4259         .byte      6
      00981C 2C 52 45 41 54 45     4260         .ascii     "CREATE"
      00981D                       4261 CREAT:
      00981D CD 84 F1         [ 4] 4262         CALL     TOKEN
      009820 00 CD CD         [ 4] 4263         CALL     SNAME
      009823 95 29 CC         [ 4] 4264         CALL     OVERT        
      009826 95 12 98         [ 4] 4265         CALL     COMPI 
      009829 17 08                 4266         .word DOVAR 
      00982B 49               [ 4] 4267         RET
                                   4268 
                                   4269 ;       VARIABLE        ( -- ; <string> )
                                   4270 ;       Compile a new variable
                                   4271 ;       initialized to 0.
      00982C 4E 49                 4272         .word      LINK
                           001831  4273 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      00982E 54                    4274         .byte      8
      00982F 2D 4F 46 53 41 42 4C  4275         .ascii     "VARIABLE"
             45
      009833                       4276 VARIA:
                                   4277 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      009833 CD 87 31         [ 4] 4278         CALL HERE
      009836 CD 85 6A         [ 4] 4279         CALL DUPP 
      009839 CD 86 11         [ 4] 4280         CALL CELLP
      00983C CD 85 1A         [ 4] 4281         CALL VPP 
      00983F 98 50 CD         [ 4] 4282         CALL STORE
      009842 86 07 CD         [ 4] 4283         CALL CREAT
      009845 87 80 CD         [ 4] 4284         CALL DUPP
      009848 85 6A CD         [ 4] 4285         CALL COMMA
      00984B 8C B8 CD         [ 4] 4286         CALL ZERO
      00984E 88 B9 CD         [ 4] 4287         call SWAPP 
      009851 87 B5 CC         [ 4] 4288         CALL STORE
      009854 85 53 98         [ 4] 4289         CALL FMOVE ; move definition to FLASH
      009857 2A 01 3A         [ 4] 4290         CALL QDUP 
      00985A CD 04 9A         [ 4] 4291         CALL QBRAN 
      00985A CD 98                 4292         .word SET_RAMLAST   
      00985C 33 CD 91         [ 4] 4293         call UPDATVP  ; don't update if variable kept in RAM.
      00985F CC CD 97         [ 4] 4294         CALL UPDATPTR
      009862 05               [ 4] 4295         RET         
      00186D                       4296 SET_RAMLAST: 
      009863 CC 98 0A         [ 4] 4297         CALL LAST 
      009866 98 58 02         [ 4] 4298         CALL AT 
      009869 49 3A 23         [ 4] 4299         CALL RAMLAST 
      00986B CC 04 D3         [ 2] 4300         jp STORE  
                                   4301 
                                   4302 
                                   4303 ;       CONSTANT  ( n -- ; <string> )
                                   4304 ;       Compile a new constant 
                                   4305 ;       n CONSTANT name 
      00986B CD 98                 4306         .word LINK 
                           00187B  4307         LINK=. 
      00986D 33                    4308         .byte 8 
      00986E CC 98 0A 98 68 09 49  4309         .ascii "CONSTANT" 
             4D
      001884                       4310 CONSTANT:          
      009876 4D 45 44         [ 4] 4311         CALL TOKEN
      009879 49 41 54         [ 4] 4312         CALL SNAME 
      00987C 45 17 16         [ 4] 4313         CALL OVERT 
      00987D CD 14 D7         [ 4] 4314         CALL COMPI 
      00987D CD 84                 4315         .word DOCONST
      00987F F1 80 00         [ 4] 4316         CALL COMMA 
      009882 CD 87 90         [ 4] 4317         CALL FMOVE
      009885 CD 85 6A         [ 4] 4318         CALL QDUP 
      009888 CD 85 6A         [ 4] 4319         CALL QBRAN 
      00988B CD 86                 4320         .word SET_RAMLAST  
      00988D 84 CD 87         [ 4] 4321         CALL UPDATPTR  
      009890 90               [ 4] 4322 1$:     RET          
                                   4323 
                                   4324 ; CONSTANT runtime semantic 
                                   4325 ; doCONST  ( -- n )
                                   4326 ;        .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   4327 ;        LINK=.
                                   4328 ;        .byte 7
                                   4329 ;        .ascii "DOCONST"
      0018A4                       4330 DOCONST:
      009891 CD 85 6A         [ 2] 4331         subw x,#CELLL
      009894 CC 85            [ 2] 4332         popw y 
      009896 53 98            [ 2] 4333         ldw y,(y) 
      009898 73               [ 2] 4334         ldw (x),y 
      009899 06               [ 4] 4335         ret 
                                   4336 
                                   4337 ;----------------------------------
                                   4338 ; create double constant 
                                   4339 ; 2CONSTANT ( d -- ; <string> )
                                   4340 ;----------------------------------
      00989A 43 52                 4341     .word LINK 
                           0018AF  4342     LINK=.
      00989C 45                    4343     .byte 9 
      00989D 41 54 45 4E 53 54 41  4344     .ascii "2CONSTANT"
             4E 54
      0098A0                       4345 DCONST:
      0098A0 CD 91 CC         [ 4] 4346         CALL TOKEN
      0098A3 CD 97 05         [ 4] 4347         CALL SNAME 
      0098A6 CD 97 96         [ 4] 4348         CALL OVERT 
      0098A9 CD 95 57         [ 4] 4349         CALL COMPI 
      0098AC 86 D1                 4350         .word DO_DCONST
      0098AE 81 98 99         [ 4] 4351         CALL COMMA
      0098B1 08 56 41         [ 4] 4352         CALL COMMA  
      0098B4 52 49 41         [ 4] 4353         CALL FMOVE
      0098B7 42 4C 45         [ 4] 4354         CALL QDUP 
      0098BA CD 04 9A         [ 4] 4355         CALL QBRAN 
      0098BA CD 8C                 4356         .word SET_RAMLAST  
      0098BC B8 CD 86         [ 4] 4357         CALL UPDATPTR  
      0098BF 11               [ 4] 4358 1$:     RET          
                                   4359     
                                   4360 ;----------------------------------
                                   4361 ; runtime for DCONST 
                                   4362 ; stack double constant 
                                   4363 ; DO-DCONST ( -- d )
                                   4364 ;-----------------------------------
                                   4365 ;        .word LINK 
                                   4366 ;        LINK=.
                                   4367 ;        .byte 9 
                                   4368 ;        .ascii "DO-DCONST"
      0018DC                       4369 DO_DCONST:
      0098C0 CD 8B            [ 2] 4370     popw y 
      0098C2 33 CD 87         [ 2] 4371     ldw YTEMP,y 
      0098C5 72 CD 85         [ 2] 4372     subw x,#2*CELLL 
      0098C8 53 CD            [ 2] 4373     ldw y,(y)
      0098CA 98               [ 2] 4374     ldw (x),y 
      0098CB A0 CD 86         [ 2] 4375     ldw y,YTEMP 
      0098CE 11 CD 95         [ 2] 4376     ldw y,(2,y)
      0098D1 12 CD            [ 2] 4377     ldw (2,x),y 
      0098D3 8B               [ 4] 4378     ret 
                                   4379 
                                   4380 ;; Tools
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                   4381 
                                   4382 ;       _TYPE   ( b u -- )
                                   4383 ;       Display a string. Filter
                                   4384 ;       non-printing characters.
      0098D4 CA CD                 4385         .word      LINK
                           0018F2  4386 LINK = . 
      0098D6 86                    4387         .byte      5
      0098D7 21 CD 85 53 CD        4388         .ascii     "_TYPE"
      0018F8                       4389 UTYPE:
      0098DC A1 A6 CD         [ 4] 4390         CALL     TOR     ;start count down loop
      0098DF 87 CE            [ 2] 4391         JRA     UTYP2   ;skip first pass
      0098E1 CD 85 1A         [ 4] 4392 UTYP1:  CALL     DUPP
      0098E4 98 ED CD         [ 4] 4393         CALL     CAT
      0098E7 9C 4E CD         [ 4] 4394         CALL     TCHAR
      0098EA A2 3A 81         [ 4] 4395         CALL     EMIT    ;display only printable
      0098ED CD 0A DE         [ 4] 4396         CALL     ONEP    ;increment address
      0098ED CD 87 90         [ 4] 4397 UTYP2:  CALL     DONXT
      0098F0 CD 85                 4398         .word      UTYP1   ;loop till done
      0098F2 6A CD 87         [ 2] 4399         JP     DROP
                                   4400 
                                   4401 ;       dm+     ( a u -- a )
                                   4402 ;       Dump u bytes from ,
                                   4403 ;       leaving a+u on  stack.
      0098F5 A3 CC                 4404         .word      LINK
                           001916  4405 LINK = . 
      0098F7 85                    4406         .byte      3
      0098F8 53 98 B1              4407         .ascii     "dm+"
      00191A                       4408 DUMPP:
      0098FB 08 43 4F         [ 4] 4409         CALL     OVER
      0098FE 4E 53 54         [ 4] 4410         CALL     DOLIT
      009901 41 4E                 4411         .word      4
      009903 54 0F 41         [ 4] 4412         CALL     UDOTR   ;display address
      009904 CD 0E 91         [ 4] 4413         CALL     SPACE
      009904 CD 91 CC         [ 4] 4414         CALL     TOR     ;start count down loop
      009907 CD 97            [ 2] 4415         JRA     PDUM2   ;skip first pass
      009909 05 CD 97         [ 4] 4416 PDUM1:  CALL     DUPP
      00990C 96 CD 95         [ 4] 4417         CALL     CAT
      00990F 57 99 24         [ 4] 4418         CALL     DOLIT
      009912 CD 95                 4419         .word      3
      009914 12 CD A1         [ 4] 4420         CALL     UDOTR   ;display numeric data
      009917 A6 CD 87         [ 4] 4421         CALL     ONEP    ;increment address
      00991A CE CD 85         [ 4] 4422 PDUM2:  CALL     DONXT
      00991D 1A 98                 4423         .word      PDUM1   ;loop till done
      00991F ED               [ 4] 4424         RET
                                   4425 
                                   4426 ;       DUMP    ( a u -- )
                                   4427 ;       Dump u bytes from a,
                                   4428 ;       in a formatted manner.
      009920 CD A2                 4429         .word      LINK
                           001946  4430 LINK = . 
      009922 3A                    4431         .byte      4
      009923 81 55 4D 50           4432         .ascii     "DUMP"
      009924                       4433 DUMP:
      009924 1D 00 02         [ 4] 4434         CALL     BASE
      009927 90 85 90         [ 4] 4435         CALL     AT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      00992A FE FF 81         [ 4] 4436         CALL     TOR
      00992D 98 FB 09         [ 4] 4437         CALL     HEX     ;save radix, set hex
      009930 32 43 4F         [ 4] 4438         CALL     DOLIT
      009933 4E 53                 4439         .word      16
      009935 54 41 4E         [ 4] 4440         CALL     SLASH   ;change count to lines
      009938 54 05 5A         [ 4] 4441         CALL     TOR     ;start count down loop
      009939 CD 0E D9         [ 4] 4442 DUMP1:  CALL     CR
      009939 CD 91 CC         [ 4] 4443         CALL     DOLIT
      00993C CD 97                 4444         .word      16
      00993E 05 CD 97         [ 4] 4445         CALL     DDUP
      009941 96 CD 95         [ 4] 4446         CALL     DUMPP   ;display numeric
      009944 57 99 5C         [ 4] 4447         CALL     ROT
      009947 CD 95 12         [ 4] 4448         CALL     ROT
      00994A CD 95 12         [ 4] 4449         CALL     SPACE
      00994D CD A1 A6         [ 4] 4450         CALL     SPACE
      009950 CD 87 CE         [ 4] 4451         CALL     UTYPE   ;display printable characters
      009953 CD 85 1A         [ 4] 4452         CALL     DONXT
      009956 98 ED                 4453         .word      DUMP1   ;loop till done
      009958 CD A2 3A         [ 4] 4454 DUMP3:  CALL     DROP
      00995B 81 05 3B         [ 4] 4455         CALL     RFROM
      00995C CD 06 61         [ 4] 4456         CALL     BASE
      00995C 90 85 90         [ 2] 4457         JP     STORE   ;restore radix
                                   4458 
                                   4459 ;       .S      ( ... -- ... )
                                   4460 ;        Display  contents of stack.
      00995F BF 26                 4461         .word      LINK
                           001992  4462 LINK = . 
      009961 1D                    4463         .byte      2
      009962 00 04                 4464         .ascii     ".S"
      001995                       4465 DOTS:
      009964 90 FE FF         [ 4] 4466         CALL     CR
      009967 90 BE 26         [ 4] 4467         CALL     DEPTH   ;stack depth
      00996A 90 EE 02         [ 4] 4468         CALL     TOR     ;start count down loop
      00996D EF 02            [ 2] 4469         JRA     DOTS2   ;skip first pass
      00996F 81 99 2F         [ 4] 4470 DOTS1:  CALL     RAT
      009972 05 5F 54         [ 4] 4471 	CALL     PICK
      009975 59 50 45         [ 4] 4472         CALL     DOT     ;index stack, display contents
      009978 CD 04 85         [ 4] 4473 DOTS2:  CALL     DONXT
      009978 CD 85                 4474         .word      DOTS1   ;loop till done
      00997A DA 20 0F         [ 4] 4475         CALL     DOTQP
      00997D CD                    4476         .byte      5
      00997E 86 11 CD 85 88        4477         .ascii     " <sp "
      009983 CD               [ 4] 4478         RET
                                   4479 
                                   4480 ;       >NAME   ( ca -- na | F )
                                   4481 ;       Convert code address
                                   4482 ;       to a name address.
      009984 8B F4                 4483         .word      LINK
                           0019BA  4484 LINK = . 
      009986 CD                    4485         .byte      5
      009987 84 B6 CD 8B 5E        4486         .ascii     ">NAME"
      0019C0                       4487 TNAME:
      00998C CD 85 05         [ 4] 4488         CALL     CNTXT   ;vocabulary link
      00998F 99 7D CC         [ 4] 4489 TNAM2:  CALL     AT
      009992 86 07 99         [ 4] 4490         CALL     DUPP    ;?last word in a vocabulary
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      009995 72 03 64         [ 4] 4491         CALL     QBRAN
      009998 6D 2B                 4492         .word      TNAM4
      00999A CD 07 AB         [ 4] 4493         CALL     DDUP
      00999A CD 86 3B         [ 4] 4494         CALL     NAMET
      00999D CD 84 F1         [ 4] 4495         CALL     XORR    ;compare
      0099A0 00 04 CD         [ 4] 4496         CALL     QBRAN
      0099A3 8F C1                 4497         .word      TNAM3
      0099A5 CD 8F 11         [ 4] 4498         CALL     CELLM   ;continue with next word
      0099A8 CD 85            [ 2] 4499         JRA     TNAM2
      0099AA DA 20 11         [ 4] 4500 TNAM3:  CALL     SWAPP
      0099AD CD 86 11         [ 2] 4501         JP     DROP
      0099B0 CD 85 88         [ 4] 4502 TNAM4:  CALL     DDROP
      0099B3 CD 84 F1         [ 2] 4503         JP     ZERO
                                   4504 
                                   4505 ;       .ID     ( na -- )
                                   4506 ;        Display  name at address.
      0099B6 00 03                 4507         .word      LINK
                           0019EF  4508 LINK = . 
      0099B8 CD                    4509         .byte      3
      0099B9 8F C1 CD              4510         .ascii     ".ID"
      0019F3                       4511 DOTID:
      0099BC 8B 5E CD         [ 4] 4512         CALL     QDUP    ;if zero no name
      0099BF 85 05 99         [ 4] 4513         CALL     QBRAN
      0099C2 AD 81                 4514         .word      DOTI1
      0099C4 99 96 04         [ 4] 4515         CALL     COUNT
      0099C7 44 55 4D         [ 4] 4516         CALL     DOLIT
      0099CA 50 1F                 4517         .word      0x1F
      0099CB CD 05 F0         [ 4] 4518         CALL     ANDD    ;mask lexicon bits
      0099CB CD 86 E1         [ 2] 4519         JP     UTYPE
      0099CE CD 85 6A         [ 4] 4520 DOTI1:  CALL     DOTQP
      0099D1 CD                    4521         .byte      9
      0099D2 85 DA CD 8E 70 CD 84  4522         .ascii     " noName"
      0099D9 F1               [ 4] 4523         RET
                                   4524 
                           000000  4525 WANT_SEE=0
                           000000  4526 .if WANT_SEE 
                                   4527 ;       SEE     ( -- ; <string> )
                                   4528 ;       A simple decompiler.
                                   4529 ;       Updated for byte machines.
                                   4530         .word      LINK
                                   4531 LINK = . 
                                   4532         .byte      3
                                   4533         .ascii     "SEE"
                                   4534 SEE:
                                   4535         CALL     TICK    ;starting address
                                   4536         CALL     CR
                                   4537         CALL     ONEM
                                   4538 SEE1:   CALL     ONEP
                                   4539         CALL     DUPP
                                   4540         CALL     AT
                                   4541         CALL     DUPP
                                   4542         CALL     QBRAN
                                   4543         .word    SEE2
                                   4544         CALL     TNAME   ;?is it a name
                                   4545 SEE2:   CALL     QDUP    ;name address or zero
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   4546         CALL     QBRAN
                                   4547         .word    SEE3
                                   4548         CALL     SPACE
                                   4549         CALL     DOTID   ;display name
                                   4550         CALL     ONEP
                                   4551         JRA      SEE4
                                   4552 SEE3:   CALL     DUPP
                                   4553         CALL     CAT
                                   4554         CALL     UDOT    ;display number
                                   4555 SEE4:   CALL     NUFQ    ;user control
                                   4556         CALL     QBRAN
                                   4557         .word    SEE1
                                   4558         JP     DROP
                                   4559 .endif ; WANT_SEE 
                                   4560 
                                   4561 ;       WORDS   ( -- )
                                   4562 ;       Display names in vocabulary.
      0099DA 00 10                 4563         .word      LINK
                           001A17  4564 LINK = . 
      0099DC CD                    4565         .byte      5
      0099DD 8A 84 CD 85 DA        4566         .ascii     "WORDS"
      001A1D                       4567 WORDS:
      0099E2 CD 8F 59         [ 4] 4568         CALL     CR
      0099E5 CD 84 F1         [ 4] 4569         CALL     CNTXT   ;only in context
      0099E8 00 10 CD         [ 4] 4570 WORS1:  CALL     AT
      0099EB 88 2B CD         [ 4] 4571         CALL     QDUP    ;?at end of list
      0099EE 99 9A CD         [ 4] 4572         CALL     QBRAN
      0099F1 87 DF                 4573         .word      WORS2
      0099F3 CD 87 DF         [ 4] 4574         CALL     DUPP
      0099F6 CD 8F 11         [ 4] 4575         CALL     SPACE
      0099F9 CD 8F 11         [ 4] 4576         CALL     DOTID   ;display a name
      0099FC CD 99 78         [ 4] 4577         CALL     CELLM
      0099FF CD 85 05         [ 4] 4578         CALL     BRAN
      009A02 99 E2                 4579         .word      WORS1
      009A04 CD               [ 4] 4580 WORS2:  RET
                                   4581 
                                   4582         
                                   4583 ;; Hardware reset
                                   4584 
                                   4585 ;       hi      ( -- )
                                   4586 ;       Display sign-on message.
      009A05 86 07                 4587         .word      LINK
                           001A42  4588 LINK = . 
      009A07 CD                    4589         .byte      2
      009A08 85 BB                 4590         .ascii     "hi"
      001A45                       4591 HI:
      009A0A CD 86 E1         [ 4] 4592         CALL     CR
      009A0D CC 85 53         [ 4] 4593         CALL     DOTQP   ;initialize I/O
      009A10 99                    4594         .byte      15
      009A11 C6 02 2E 53 65 46 6F  4595         .ascii     "stm8eForth v"
             72 74 68 20 76
      009A15 34                    4596 	.byte      VER+'0'
      009A15 CD                    4597         .byte      '.' 
      009A16 8F                    4598 	.byte      EXT+'0' ;version
      009A17 59 CD 8C         [ 4] 4599         CALL    DOTQP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                           000001  4600 .if NUCLEO          
      009A1A 0C                    4601         .byte 18
      009A1B CD 85 DA 20 09 CD 85  4602         .ascii  " on NUCLEO-8S208RB"
             CE CD 8C 23 CD 90 12
             CD 85 05 9A
                                   4603 .endif
                           000000  4604 .if DISCOVERY
                                   4605         .byte 19
                                   4606         .ascii  " on STM8S-DISCOVERY"
                                   4607 .endif
                           000000  4608 .if DOORBELL
                                   4609         .byte 16
                                   4610         .ascii " on stm8s105k6b6"
                                   4611 .endif
      009A2D 20 CD 8F         [ 2] 4612         JP     CR
                                   4613 
                           000000  4614 WANT_DEBUG=0
                           000000  4615 .if WANT_DEBUG 
                                   4616 ;       DEBUG      ( -- )
                                   4617 ;       Display sign-on message.
                                   4618 ;        .word      LINK
                                   4619 LINK = . 
                                   4620         .byte      5
                                   4621         .ascii     "DEBUG"
                                   4622 DEBUG:
                                   4623 	CALL DOLIT
                                   4624 	.word 0x65
                                   4625 	CALL EMIT
                                   4626 	CALL DOLIT
                                   4627 	.word 0
                                   4628  	CALL ZLESS 
                                   4629 	CALL DOLIT
                                   4630 	.word 0xFFFE
                                   4631 	CALL ZLESS 
                                   4632 	CALL UPLUS 
                                   4633  	CALL DROP 
                                   4634 	CALL DOLIT
                                   4635 	.word 3
                                   4636 	CALL UPLUS 
                                   4637 	CALL UPLUS 
                                   4638  	CALL DROP
                                   4639 	CALL DOLIT
                                   4640 	.word 0x43
                                   4641 	CALL UPLUS 
                                   4642  	CALL DROP
                                   4643 	CALL EMIT
                                   4644 	CALL DOLIT
                                   4645 	.word 0x4F
                                   4646 	CALL DOLIT
                                   4647 	.word 0x6F
                                   4648  	CALL XORR
                                   4649 	CALL DOLIT
                                   4650 	.word 0xF0
                                   4651  	CALL ANDD
                                   4652 	CALL DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4653 	.word 0x4F
                                   4654  	CALL ORR
                                   4655 	CALL EMIT
                                   4656 	CALL DOLIT
                                   4657 	.word 8
                                   4658 	CALL DOLIT
                                   4659 	.word 6
                                   4660  	CALL SWAPP
                                   4661 	CALL OVER
                                   4662 	CALL XORR
                                   4663 	CALL DOLIT
                                   4664 	.word 3
                                   4665 	CALL ANDD 
                                   4666 	CALL ANDD
                                   4667 	CALL DOLIT
                                   4668 	.word 0x70
                                   4669 	CALL UPLUS 
                                   4670 	CALL DROP
                                   4671 	CALL EMIT
                                   4672 	CALL DOLIT
                                   4673 	.word 0
                                   4674 	CALL QBRAN
                                   4675 	.word DEBUG1
                                   4676 	CALL DOLIT
                                   4677 	.word 0x3F
                                   4678 DEBUG1:
                                   4679 	CALL DOLIT
                                   4680 	.word 0xFFFF
                                   4681 	CALL QBRAN
                                   4682 	.word DEBUG2
                                   4683 	CALL DOLIT
                                   4684 	.word 0x74
                                   4685 	CALL BRAN
                                   4686 	.word DEBUG3
                                   4687 DEBUG2:
                                   4688 	CALL DOLIT
                                   4689 	.word 0x21
                                   4690 DEBUG3:
                                   4691 	CALL EMIT
                                   4692 	CALL DOLIT
                                   4693 	.word 0x68
                                   4694 	CALL DOLIT
                                   4695 	.word 0x80
                                   4696 	CALL STORE
                                   4697 	CALL DOLIT
                                   4698 	.word 0x80
                                   4699 	CALL AT
                                   4700 	CALL EMIT
                                   4701 	CALL DOLIT
                                   4702 	.word 0x4D
                                   4703 	CALL TOR
                                   4704 	CALL RAT
                                   4705 	CALL RFROM
                                   4706 	CALL ANDD
                                   4707 	CALL EMIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   4708 	CALL DOLIT
                                   4709 	.word 0x61
                                   4710 	CALL DOLIT
                                   4711 	.word 0xA
                                   4712 	CALL TOR
                                   4713 DEBUG4:
                                   4714 	CALL DOLIT
                                   4715 	.word 1
                                   4716 	CALL UPLUS 
                                   4717 	CALL DROP
                                   4718 	CALL DONXT
                                   4719 	.word DEBUG4
                                   4720 	CALL EMIT
                                   4721 	CALL DOLIT
                                   4722 	.word 0x656D
                                   4723 	CALL DOLIT
                                   4724 	.word 0x100
                                   4725 	CALL UMSTA
                                   4726 	CALL SWAPP
                                   4727 	CALL DOLIT
                                   4728 	.word 0x100
                                   4729 	CALL UMSTA
                                   4730 	CALL SWAPP 
                                   4731 	CALL DROP
                                   4732 	CALL EMIT
                                   4733 	CALL EMIT
                                   4734 	CALL DOLIT
                                   4735 	.word 0x2043
                                   4736 	CALL DOLIT
                                   4737 	.word 0
                                   4738 	CALL DOLIT
                                   4739 	.word 0x100
                                   4740 	CALL UMMOD
                                   4741 	CALL EMIT
                                   4742 	CALL EMIT
                                   4743 	;JP ORIG
                                   4744 	RET
                                   4745 .endif ; WANT_DEBUG 
                                   4746 
                                   4747 
                                   4748 ;       'BOOT   ( -- a )
                                   4749 ;       The application startup vector.
      009A30 98 05                 4750         .word      LINK
                           001A76  4751 LINK = . 
      009A32 20                    4752         .byte      5
      009A33 3C 73 70 20 81        4753         .ascii     "'BOOT"
      001A7C                       4754 TBOOT:
      009A38 9A 12 05         [ 4] 4755         CALL     DOVAR
      009A3B 3E 4E                 4756         .word    APP_RUN      ;application to boot
                                   4757 
                                   4758 ;       COLD    ( -- )
                                   4759 ;       The hilevel cold start s=ence.
      009A3D 41 4D                 4760         .word      LINK
                           001A83  4761         LINK = . 
      009A3F 45                    4762         .byte      4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009A40 43 4F 4C 44           4763         .ascii     "COLD"
      001A88                       4764 COLD:
                           000000  4765 .if WANT_DEBUG
                                   4766         CALL DEBUG
                                   4767 .endif ; WANT_DEBUG
      009A40 CD 87 64         [ 4] 4768 COLD1:  CALL     DOLIT
      009A43 CD 85                 4769         .word      UZERO
      009A45 6A CD 86         [ 4] 4770 	CALL     DOLIT
      009A48 11 CD                 4771         .word      UPP
      009A4A 85 1A 9A         [ 4] 4772         CALL     DOLIT
      009A4D 67 CD                 4773 	.word      UEND-UZERO
      009A4F 88 2B CD         [ 4] 4774         CALL     CMOVE   ;initialize user area
                           000001  4775 .if WANT_FLOAT 
      009A52 91 DA CD         [ 4] 4776         CALL    FINIT 
                                   4777 .endif 
                                   4778 ; if APP_RUN==0 initialize with ca de 'hi'  
      009A55 86 99 CD 85      [ 2] 4779         ldw y,APP_RUN 
      009A59 1A 9A            [ 1] 4780         jrne 0$
      009A5B 61 CD 8B         [ 2] 4781         subw x,#CELLL 
      009A5E 42 20 E2 CD      [ 2] 4782         ldw y,#HI  
      009A62 86               [ 2] 4783         ldw (x),y
      009A63 21 CC 86         [ 4] 4784         call UPDATRUN 
      001AAE                       4785 0$:        
                                   4786 ; update LAST with APP_LAST 
                                   4787 ; if APP_LAST > LAST else do the opposite
      009A66 07 CD 88 20      [ 2] 4788         ldw y,APP_LAST 
      009A6A CC 8B CA         [ 2] 4789         cpw y,ULAST 
      009A6D 9A 3A            [ 1] 4790         jrugt 1$ 
                                   4791 ; save LAST at APP_LAST  
      009A6F 03 2E 49         [ 4] 4792         call UPDATLAST 
      009A72 44 06            [ 2] 4793         jra 2$
      009A73                       4794 1$: ; update LAST with APP_LAST 
      009A73 CD 87 CE         [ 2] 4795         ldw ULAST,y
      009A76 CD 85 1A         [ 2] 4796         ldw UCNTXT,y
      001AC2                       4797 2$:  
                                   4798 ; update APP_CP if < app_space 
      009A79 9A 89 CD 8C      [ 2] 4799         ldw y,APP_CP  
      009A7D A1 CD 84         [ 2] 4800         cpw y,UCP   
      009A80 F1 00            [ 1] 4801         jruge 3$ 
      009A82 1F CD 86         [ 4] 4802         call UPDATCP
      009A85 70 CC 99         [ 2] 4803         ldw y,UCP   
      001AD1                       4804 3$:
      009A88 78 CD 8F         [ 2] 4805         ldw UCP,y                 
                                   4806 ; update UVP with APP_VP  
                                   4807 ; if APP_VP>UVP else do the opposite 
      009A8B 98 09 20 6E      [ 2] 4808         ldw y,APP_VP 
      009A8F 6F 4E 61         [ 2] 4809         cpw y,UVP 
      009A92 6D 65            [ 1] 4810         jrugt 4$
      009A94 81 9A 6F         [ 4] 4811         call UPDATVP 
      009A97 05 57            [ 2] 4812         jra 6$
      001AE2                       4813 4$: ; update UVP with APP_VP 
      009A99 4F 52 44         [ 2] 4814         ldw UVP,y 
      001AE5                       4815 6$:      
      009A9C 53 14 3D         [ 4] 4816         CALL     PRESE   ;initialize data stack and TIB
      009A9D CD 1A 7C         [ 4] 4817         CALL     TBOOT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009A9D CD 8F 59         [ 4] 4818         CALL     ATEXE   ;application boot
      009AA0 CD 87 64         [ 4] 4819         CALL     OVERT
      009AA3 CD 85 6A         [ 2] 4820         JP     QUIT    ;start interpretation
                                   4821 
                                   4822 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                                   4823         .include "flash.asm"
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
      009AA6 CD 87                   31     .word LINK 
                           001AF6    32     LINK=.
      009AA8 CE                      33     .byte 3 
      009AA9 CD 85 1A                34     .ascii "FP!"
      001AFA                         35 FPSTOR:
      009AAC 9A BF            [ 1]   36     ldw y,x
      009AAE CD 86            [ 2]   37     ldw y,(y)
      009AB0 11 CD            [ 1]   38     ld a,yl 
      009AB2 8F 11            [ 1]   39     ld FPTR,a 
      009AB4 CD 9A 73         [ 2]   40     addw x,#CELLL 
      009AB7 CD 8B            [ 1]   41     ldw y,x 
      009AB9 42 CD            [ 2]   42     ldw y,(y)
      009ABB 85 36 9A         [ 2]   43     ldw PTR16,y
      009ABE A3 81 9A         [ 2]   44     addw x,#CELLL 
      009AC1 97               [ 4]   45     ret 
                                     46 
                                     47 ;-----------------------------------
                                     48 ; return EEPROM base address 
                                     49 ; as a double 
                                     50 ;  EEPROM  ( -- ud )
                                     51 ;-----------------------------------
      009AC2 02 68                   52     .word LINK 
                           001B12    53 LINK=.
      009AC4 69                      54     .byte 6 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      009AC5 45 45 50 52 4F 4D       55     .ascii "EEPROM"
      001B19                         56 EEPROM: 
      009AC5 CD 8F 59 CD      [ 2]   57     ldw y,#EEPROM_BASE
      009AC9 8F 98 0F         [ 2]   58     subw x,#2*CELLL 
      009ACC 73 74            [ 2]   59     ldw (2,x),y 
      009ACE 6D 38            [ 1]   60     clrw y 
      009AD0 65               [ 2]   61     ldw (x),y 
      009AD1 46               [ 4]   62     ret
                                     63 
                                     64 ;---------------------------------
                                     65 ; return APP_LAST pointer as double
                                     66 ; EEP-LAST ( -- ud )
                                     67 ;---------------------------------
      009AD2 6F 72                   68 	.word LINK 
                           001B28    69 	LINK=.
      009AD4 74                      70 	.byte 8 
      009AD5 68 20 76 34 2E 30 CD    71 	.ascii "EEP-LAST"
             8F
      001B31                         72 EEPLAST:
      009ADD 98 12 20         [ 2]   73 	subw x,#2*CELLL 
      009AE0 6F 6E 20 4E      [ 2]   74 	ldw y,#APP_LAST 
      009AE4 55 43            [ 2]   75 	ldw (2,x),y 
      009AE6 4C 45            [ 1]   76 	clrw y 
      009AE8 4F               [ 2]   77 	ldw (x),y 
      009AE9 2D               [ 4]   78 	ret 
                                     79 
                                     80 ;----------------------------------
                                     81 ; return APP_RUN pointer as double	
                                     82 ; EEP-RUN ( -- ud )
                                     83 ;-----------------------------------
      009AEA 38 53                   84 	.word LINK 
                           001B40    85 	LINK=.
      009AEC 32                      86 	.byte 7
      009AED 30 38 52 42 CC 8F 59    87 	.ascii "EEP-RUN"
      001B48                         88 EEPRUN:
      009AF4 9A C2 05         [ 2]   89 	subw x,#2*CELLL 
      009AF7 27 42 4F 4F      [ 2]   90 	ldw y,#APP_RUN 
      009AFB 54 02            [ 2]   91 	ldw (2,x),y 
      009AFC 90 5F            [ 1]   92 	clrw y 
      009AFC CD               [ 2]   93 	ldw (x),y 
      009AFD 86               [ 4]   94 	ret 
                                     95 
                                     96 ;------------------------------------
                                     97 ; return APP_CP pointer as double 
                                     98 ; EEP-CP ( -- ud )
                                     99 ;------------------------------------
      009AFE D1 40                  100 	.word LINK
                           001B57   101 	LINK=.
      009B00 02                     102 	.byte 6 
      009B01 9A F6 04 43 4F 4C      103 	.ascii "EEP-CP"
      001B5E                        104 EEPCP:
      009B07 44 00 04         [ 2]  105 	subw x,#2*CELLL 
      009B08 90 AE 40 04      [ 2]  106 	ldw y,#APP_CP  
      009B08 CD 84            [ 2]  107 	ldw (2,x),y 
      009B0A F1 80            [ 1]  108 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009B0C AB               [ 2]  109 	ldw (x),y 
      009B0D CD               [ 4]  110 	ret 
                                    111 
                                    112 ;------------------------------------
                                    113 ; return APP_VP pointer as double 
                                    114 ; EEP-VP ( -- ud )
                                    115 ;-------------------------------------
      009B0E 84 F1                  116 	.word LINK
                           001B6D   117 	LINK=.
      009B10 00                     118 	.byte 6
      009B11 06 CD 84 F1 00 1C      119 	.ascii "EEP-VP"
      001B74                        120 EEPVP:
      009B17 CD 8D 05         [ 2]  121 	subw x,#2*CELLL 
      009B1A CD AB D1 90      [ 2]  122 	ldw y,#APP_VP  
      009B1E CE 40            [ 2]  123 	ldw (2,x),y 
      009B20 02 26            [ 1]  124 	clrw y 
      009B22 0B               [ 2]  125 	ldw (x),y 
      009B23 1D               [ 4]  126 	ret 
                                    127 
                                    128 ;----------------------------------
                                    129 ; update APP_LAST with LAST 
                                    130 ; UPDAT-LAST ( -- )
                                    131 ;----------------------------------
      009B24 00 02                  132 	.word LINK 
                           001B83   133 	LINK=.
      009B26 90                     134 	.byte 10
      009B27 AE 9A C5 FF CD 9C 26   135 	.ascii "UPDAT-LAST"
             41 53 54
      009B2E                        136 UPDATLAST:
      009B2E 90 CE 40         [ 4]  137 	call LAST
      009B31 00 90 B3         [ 4]  138 	call AT  
      009B34 1C 22 05         [ 4]  139 	call EEPLAST
      009B37 CD 9C 0E         [ 2]  140 	jp EESTORE 
                                    141 
                                    142 ;---------------------------------
                                    143 ; update APP_RUN 
                                    144 ; UPDAT-RUN ( a -- )
                                    145 ;---------------------------------
      009B3A 20 06                  146 	.word LINK
                           001B9C   147 	LINK=.
      009B3C 09                     148 	.byte 9
      009B3C 90 BF 1C 90 BF 16 52   149 	.ascii "UPDAT-RUN"
             55 4E
      009B42                        150 UPDATRUN:
      009B42 90 CE 40         [ 4]  151 	call EEPRUN
      009B45 04 90 B3         [ 2]  152 	jp EESTORE 
                                    153 	
                                    154 ;---------------------------------
                                    155 ; update APP_CP with CP 
                                    156 ; UPDAT-CP ( -- )
                                    157 ;---------------------------------
      009B48 1A 24                  158 	.word LINK 
                           001BAE   159 	LINK=.
      009B4A 06                     160 	.byte 8 
      009B4B CD 9C 37 90 BE 1A 43   161 	.ascii "UPDAT-CP"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



             50
      009B51                        162 UPDATCP:
      009B51 90 BF 1A         [ 4]  163 	call CPP 
      009B54 90 CE 40         [ 4]  164 	call AT 
      009B57 06 90 B3         [ 4]  165 	call EEPCP 
      009B5A 18 22 05         [ 2]  166 	jp EESTORE 
                                    167 
                                    168 ;----------------------------------
                                    169 ; update APP_VP with VP 
                                    170 ; UPDAT-VP ( -- )
                                    171 ;----------------------------------
      009B5D CD 9C                  172 	.word LINK
                           001BC5   173 	LINK=.
      009B5F 4E                     174 	.byte 8 
      009B60 20 03 44 41 54 2D 56   175 	.ascii "UPDAT-VP" 
             50
      009B62                        176 UPDATVP:
      009B62 90 BF 18         [ 4]  177 	call VPP 
      009B65 CD 04 EA         [ 4]  178 	call AT
      009B65 CD 94 BD         [ 4]  179 	call EEPVP 
      009B68 CD 9A FC         [ 2]  180 	jp EESTORE
                                    181 	
                           000001   182 .if NUCLEO
                                    183 ;----------------------------------
                                    184 ; fetch integer at address over 65535
                                    185 ;  F@   ( ud -- n )
                                    186 ;----------------------------------
      009B6B CD 8C                  187     .word LINK 
                           001BDC   188 LINK=.
      009B6D EE                     189     .byte 2
      009B6E CD 97                  190     .ascii "F@"
      001BDF                        191 FARAT:
      009B70 96 CC 94         [ 4]  192     call FPSTOR
      009B73 DA 9B 03         [ 2]  193 	jp EE_READ 
                                    194 
                                    195 
                                    196 ;-------------------------------------
                                    197 ; fetch C at address over 65535 
                                    198 ; FC@ ( ud -- c)
                                    199 ;-------------------------------------
      009B76 03 46                  200     .word LINK
                           001BE7   201     LINK=.
      009B78 50                     202     .byte 3 
      009B79 21 43 40               203     .ascii "FC@" 
      009B7A                        204 FARCAT:
      009B7A 90 93 90         [ 4]  205     call FPSTOR
      009B7D FE 90 9F         [ 2]  206 	jp EE_CREAD  
                                    207 .endif ; NUCLEO 
                                    208 
                                    209 ;----------------------------------
                                    210 ; UNLOCK EEPROM/OPT for writing/erasing
                                    211 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    212 ;  UNLKEE   ( -- )
                                    213 ;----------------------------------
      009B80 B7 34                  214     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                           001BF3   215 LINK=.
      009B82 1C                     216     .byte 6 
      009B83 00 02 90 93 90 FE      217     .ascii "UNLKEE"
      001BFA                        218 UNLKEE:
      009B89 90 BF 35 1C      [ 1]  219 	mov FLASH_CR2,#0 
      009B8D 00 02 81 9B      [ 1]  220 	mov FLASH_NCR2,#0xFF 
      009B91 76 06 45 45      [ 1]  221 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009B95 50 52 4F 4D      [ 1]  222     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009B99 72 07 50 5F FB   [ 2]  223 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009B99 90               [ 4]  224 	ret
                                    225 
                                    226 ;----------------------------------
                                    227 ; UNLOCK FLASH for writing/erasing
                                    228 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    229 ; UNLKFL  ( -- )
                                    230 ;----------------------------------
      009B9A AE 40                  231     .word LINK 
                           001C12   232 LINK=. 
      009B9C 00                     233     .byte 6 
      009B9D 1D 00 04 EF 02 90      234     .ascii "UNLKFL"    
      001C19                        235 UNLKFL:
      009BA3 5F FF 81 9B      [ 1]  236 	mov FLASH_CR2,#0 
      009BA7 92 08 45 45      [ 1]  237 	mov FLASH_NCR2,#0xFF 
      009BAB 50 2D 4C 41      [ 1]  238 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009BAF 53 54 50 62      [ 1]  239 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009BB1 72 03 50 5F FB   [ 2]  240 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009BB1 1D               [ 4]  241 	ret
                                    242 
                                    243 ;-----------------------------
                                    244 ; UNLOCK FLASH or EEPROM 
                                    245 ; according to FPTR address 
                                    246 ;  UNLOCK ( -- )
                                    247 ;-----------------------------
      009BB2 00 04                  248 	.word LINK 
                           001C31   249 	LINK=.
      009BB4 90                     250 	.byte 6
      009BB5 AE 40 00 EF 02 90      251 	.ascii "UNLOCK"
      001C38                        252 UNLOCK:
                                    253 ; put addr[15:0] in Y, for bounds check.
      009BBB 5F FF 81         [ 2]  254 	ldw y,PTR16   ; Y=addr15:0
                                    255 ; check addr[23:16], if <> 0 then it is extened flash memory
      009BBE 9B A8            [ 1]  256 	tnz FPTR 
      009BC0 07 45            [ 1]  257 	jrne 4$
      009BC2 45 50 2D 52      [ 2]  258     cpw y,#FLASH_BASE
      009BC6 55 4E            [ 1]  259     jruge 4$
      009BC8 90 A3 40 00      [ 2]  260 	cpw y,#EEPROM_BASE  
      009BC8 1D 00            [ 1]  261     jrult 9$
      009BCA 04 90 AE 40      [ 2]  262 	cpw y,#OPTION_END 
      009BCE 02 EF            [ 1]  263 	jrugt 9$
      009BD0 02 90 5F         [ 4]  264 	call UNLKEE
      009BD3 FF               [ 4]  265 	ret 
      009BD4 81 9B C0         [ 4]  266 4$: call UNLKFL
      009BD7 06               [ 4]  267 9$: ret 
                                    268 
                                    269 ;-------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                    270 ; LOCK write access to 
                                    271 ; FLASH and EEPROM 
                                    272 ; LOCK ( -- )
                                    273 ;-------------------------
      009BD8 45 45                  274 	.word LINK 
                           001C5B   275 	LINK=.
      009BDA 50                     276 	.byte 4 
      009BDB 2D 43 50 4B            277 	.ascii "LOCK" 
      009BDE                        278 LOCK: 
      009BDE 1D 00 04 90      [ 1]  279 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009BE2 AE 40 04 EF      [ 1]  280 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009BE6 02               [ 4]  281 	ret 
                                    282 
                                    283 ;-------------------------
                                    284 ; increment FPTR 
                                    285 ; INC-FPTR ( -- )
                                    286 ;-------------------------
      009BE7 90 5F                  287 	.word LINK 
                           001C6B   288 	LINK=. 
      009BE9 FF                     289 	.byte 8 
      009BEA 81 9B D7 06 45 45 50   290 	.ascii "INC-FPTR" 
             2D
      001C74                        291 INC_FPTR:
      009BF2 56 50            [ 1]  292 	inc PTR8 
      009BF4 26 0C            [ 1]  293 	jrne 1$
      009BF4 1D 00            [ 2]  294 	pushw y 
      009BF6 04 90 AE         [ 2]  295 	ldw y,FPTR 
      009BF9 40 06            [ 1]  296 	incw y 
      009BFB EF 02 90         [ 2]  297 	ldw FPTR,y
      009BFE 5F FF            [ 2]  298 	popw y  
      009C00 81               [ 4]  299 1$: ret 
                                    300 
                                    301 ;------------------------------
                                    302 ; add u to FPTR 
                                    303 ; PTR+ ( u -- )
                                    304 ;------------------------------
      009C01 9B ED                  305 	.word LINK 
                           001C87   306 	LINK=.
      009C03 0A                     307 	.byte 4 
      009C04 55 50 44 41            308 	.ascii "PTR+"
      001C8C                        309 PTRPLUS:
      009C08 54 2D            [ 1]  310 	ldw y,x 
      009C0A 4C 41 53         [ 2]  311 	addw x,#CELLL 
      009C0D 54 B9 00 35      [ 2]  312 	addw y,PTR16 
      009C0E 90 BF 35         [ 2]  313 	ldw PTR16,y  
      009C0E CD 87            [ 1]  314 	jrnc 1$
      009C10 90 CD            [ 1]  315 	inc FPTR 
      009C12 85               [ 4]  316 1$: ret 
                                    317 
                                    318 ;---------------------------------
                                    319 ; read word at address pointed FPTR
                                    320 ; increment FPTR 
                                    321 ; EE-READ ( -- w )
                                    322 ;------------------------------------
      009C13 6A CD                  323 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                           001C9F   324 	LINK=.
      009C15 9B                     325 	.byte 7 
      009C16 B1 CC 9E 04 9C 03 09   326 	.ascii "EE-READ"
      001CA7                        327 EE_READ:
      009C1D 55 50 44         [ 2]  328 	subw x,#CELLL 
      009C20 41 54 2D 52      [ 5]  329 	ldf a,[FPTR]
      009C24 55 4E            [ 1]  330 	ld yh,a 
      009C26 CD 1C 74         [ 4]  331 	call INC_FPTR 
      009C26 CD 9B C8 CC      [ 5]  332 	ldf a,[FPTR]
      009C2A 9E 04 9C         [ 4]  333 	call INC_FPTR 
      009C2D 1C 08            [ 1]  334 	ld yl,a 
      009C2F 55               [ 2]  335 	ldw (x),y 
      009C30 50               [ 4]  336 	ret 
                                    337 
                                    338 ;---------------------------------------
                                    339 ; Read byte at address pointed by FPTR 
                                    340 ; EE-CREAD ( -- c )
                                    341 ;---------------------------------------
      009C31 44 41                  342 	.word LINK 
                           001CC0   343 	LINK=.
      009C33 54                     344 	.byte 8
      009C34 2D 43 50 43 52 45 41   345 	.ascii "EE-CREAD" 
             44
      009C37                        346 EE_CREAD:
      009C37 CD 87 80         [ 2]  347 	subw x,#CELLL 
      009C3A CD 85 6A CD      [ 5]  348 	ldf a,[FPTR]	
      009C3E 9B DE CC         [ 4]  349 	call INC_FPTR
      009C41 9E 04            [ 1]  350 	clrw y 
      009C43 9C 2E            [ 1]  351 	ld yl,a 
      009C45 08               [ 2]  352 	ldw (x),y 
      009C46 55               [ 4]  353 	ret 
                                    354 
                                    355 ;----------------------------
                                    356 ; write a byte at address pointed 
                                    357 ; by FPTR and increment FPTR.
                                    358 ; Expect pointer already initialized 
                                    359 ; and memory unlocked 
                                    360 ; WR-BYTE ( c -- )
                                    361 ;----------------------------
      009C47 50 44                  362 	.word LINK 
                           001CDB   363 	LINK=. 
      009C49 41                     364 	.byte 7 
      009C4A 54 2D 56 50 59 54 45   365 	.ascii "WR-BYTE" 
                                    366 
      009C4E                        367 WR_BYTE:
      009C4E CD 87 72         [ 4]  368 	call FC_XOFF
      009C51 CD 85            [ 1]  369 	ldw y,x 
      009C53 6A CD            [ 2]  370 	ldw y,(y)
      009C55 9B F4 CC         [ 2]  371 	addw x,#CELLL 
      009C58 9E 04            [ 1]  372 	ld a,yl
      009C5A 9C 45 02 46      [ 4]  373 	ldf [FPTR],a
      009C5E 40 05 50 5F FB   [ 2]  374 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009C5F CD 04 4D         [ 4]  375 	call FC_XON
      009C5F CD 9B 7A         [ 2]  376 	jp INC_FPTR 
                                    377 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                    378 ;---------------------------------------
                                    379 ; write a word at address pointed 
                                    380 ; by FPTR and increment FPTR 
                                    381 ; Expect pointer already initialzed 
                                    382 ; and memory unlocked 
                                    383 ; WR-WORD ( w -- )
                                    384 ;---------------------------------------
      009C62 CC 9D                  385 	.word LINK 
                           001D00   386 	LINK=.
      009C64 27                     387 	.byte 7 
      009C65 9C 5C 03 46 43 40 44   388 	.ascii "WR-WORD" 
      009C6B                        389 WR_WORD:
      009C6B CD 9B 7A         [ 4]  390 	call FC_XOFF
      009C6E CC 9D            [ 1]  391 	ldw y,x
      009C70 49 9C            [ 2]  392 	ldw y,(y)
      009C72 67 06 55         [ 2]  393 	addw x,#CELLL 
      009C75 4E 4C            [ 1]  394 	ld a,yh 
      009C77 4B 45 45 34      [ 4]  395 	ldf [FPTR],a
      009C7A 72 05 50 5F FB   [ 2]  396 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009C7A 35 00 50         [ 4]  397 	call INC_FPTR 
      009C7D 5B 35            [ 1]  398 	ld a,yl 
      009C7F FF 50 5C 35      [ 4]  399 	ldf [FPTR],a
      009C83 AE 50 64 35 56   [ 2]  400 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009C88 50 64 72         [ 4]  401 	call FC_XON
      009C8B 07 50 5F         [ 2]  402 	jp INC_FPTR 
                                    403 
                                    404 
                                    405 ;---------------------------------------
                                    406 ; write a byte to FLASH or EEPROM/OPTION  
                                    407 ; EEC!  (c ud -- )
                                    408 ;---------------------------------------
      009C8E FB 81                  409     .word LINK 
                           001D33   410 	LINK=.
      009C90 9C                     411     .byte 4 
      009C91 73 06 55 4E            412     .ascii "EEC!"
                                    413 	; local variables 
                           000001   414 	BTW = 1   ; byte to write offset on stack
                           000002   415     OPT = 2 
                           000002   416 	VSIZE = 2
      001D38                        417 EECSTORE:
      009C95 4C 4B            [ 2]  418 	sub sp,#VSIZE
      009C97 46 4C FA         [ 4]  419     call FPSTOR
      009C99 E6 01            [ 1]  420 	ld a,(1,x)
      009C99 35               [ 1]  421 	cpl a 
      009C9A 00 50            [ 1]  422 	ld (BTW,sp),a ; byte to write 
      009C9C 5B 35            [ 1]  423 	clr (OPT,sp)  ; OPTION flag
      009C9E FF 50 5C         [ 4]  424 	call UNLOCK 
                                    425 	; check if option
      009CA1 35 56            [ 1]  426 	tnz FPTR 
      009CA3 50 62            [ 1]  427 	jrne 2$
      009CA5 35 AE 50         [ 2]  428 	ldw y,PTR16 
      009CA8 62 72 03 50      [ 2]  429 	cpw y,#OPTION_BASE
      009CAC 5F FB            [ 1]  430 	jrmi 2$
      009CAE 81 9C 92 06      [ 2]  431 	cpw y,#OPTION_END+1
      009CB2 55 4E            [ 1]  432 	jrpl 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009CB4 4C 4F            [ 1]  433 	cpl (OPT,sp)
                                    434 	; OPTION WRITE require this UNLOCK 
      009CB6 43 4B 50 5B      [ 1]  435     bset FLASH_CR2,#FLASH_CR2_OPT
      009CB8 72 1F 50 5C      [ 1]  436     bres FLASH_NCR2,#FLASH_CR2_OPT 
      001D64                        437 2$: 
      009CB8 90 BE 35         [ 4]  438 	call WR_BYTE 	
      009CBB 3D 34            [ 1]  439 	tnz (OPT,sp)
      009CBD 26 16            [ 1]  440 	jreq 3$ 
      009CBF 90 A3            [ 1]  441     ld a,(BTW,sp)
      009CC1 80 00            [ 1]  442     clrw y
      009CC3 24 10            [ 1]  443 	ld yl,a 
      009CC5 90 A3 40         [ 2]  444 	subw x,#CELLL 
      009CC8 00               [ 2]  445 	ldw (x),y 
      009CC9 25 0D 90         [ 4]  446 	call WR_BYTE
      001D78                        447 3$: 
      009CCC A3 48 7F         [ 4]  448 	call LOCK 
      009CCF 22 07            [ 2]  449 	addw sp,#VSIZE 
      009CD1 CD               [ 4]  450     ret
                                    451 
                                    452 ;------------------------------
                                    453 ; write integer in FLASH|EEPROM
                                    454 ; EE! ( n ud -- )
                                    455 ;------------------------------
      009CD2 9C 7A                  456 	.word LINK 
                           001D80   457 	LINK=.
      009CD4 81                     458 	.byte 3 
      009CD5 CD 9C 99               459 	.ascii "EE!"
      001D84                        460 EESTORE:
      009CD8 81 9C B1         [ 4]  461 	call FPSTOR 
      009CDB 04 4C 4F         [ 4]  462 	call UNLOCK 
      009CDE 43 4B            [ 1]  463 	ldw y,x 
      009CE0 90 FE            [ 2]  464 	ldw y,(y)
      009CE0 72 13            [ 2]  465 	pushw y 
      009CE2 50 5F            [ 1]  466 	swapw y 
      009CE4 72               [ 2]  467 	ldw (x),y 
      009CE5 17 50 5F         [ 4]  468 	call WR_BYTE 
      009CE8 81 9C            [ 2]  469 	popw y 
      009CEA DB 08 49         [ 2]  470 	subw x,#CELLL
      009CED 4E               [ 2]  471 	ldw (x),y 
      009CEE 43 2D 46         [ 4]  472 	call WR_BYTE
      009CF1 50 54 52         [ 2]  473 	jp LOCK 
                                    474 
                                    475 
                                    476 ;----------------------------
                                    477 ; Erase flash memory row 
                                    478 ; stm8s208 as 128 bytes rows
                                    479 ; ROW-ERASE ( ud -- )
                                    480 ;----------------------------
      009CF4 1D 80                  481 	.word LINK 
                           001DA4   482 	LINK=. 
      009CF4 3C                     483 	.byte 9 
      009CF5 36 26 0C 90 89 90 BE   484 	.ascii "ROW-ERASE" 
             34 90
      001DAE                        485 row_erase:
      009CFE 5C 90 BF         [ 4]  486 	call FC_XOFF
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009D01 34 90 85         [ 4]  487 	call FPSTOR
                                    488 ;code must be execute from RAM 
                                    489 ;copy routine to PAD 
      009D04 81 9C EB         [ 2]  490 	subw x,#CELLL 
      009D07 04 50 54 52      [ 2]  491 	ldw y,#row_erase_proc
      009D0B 2B               [ 2]  492 	ldw (x),y 
      009D0C CD 0C 49         [ 4]  493 	call PAD 
      009D0C 90 93 1C 00      [ 2]  494 	ldw y,#row_erase_proc_end 
      009D10 02 72 B9 00      [ 2]  495 	subw y,#row_erase_proc
      009D14 35 90 BF         [ 2]  496 	subw x,#CELLL 
      009D17 35               [ 2]  497 	ldw (x),y 
      009D18 24 02 3C         [ 4]  498 	call CMOVE 
      001DCE                        499 block_erase:
      009D1B 34 81 9D         [ 2]  500 	ldw y,FPTR+1
      009D1E 07 07 45 45      [ 2]  501 	cpw y,#app_space 
      009D22 2D 52            [ 1]  502 	jrpl erase_flash 
                                    503 ; erase EEPROM block
      009D24 45 41 44 00      [ 2]  504 	cpw y,#EEPROM_BASE 
      009D27 24 04            [ 1]  505 	jruge 1$
      009D27 1D 00 02         [ 4]  506 	call FC_XON
      009D2A 92               [ 4]  507 	ret ; bad address 
      009D2B BC 00 34 90      [ 2]  508 1$: cpw y,#EEPROM_END 
      009D2F 95 CD            [ 2]  509 	jrule 2$ 
      009D31 9C F4 92         [ 4]  510 	call FC_XON
      009D34 BC               [ 4]  511 	ret ; bad address 
      001DEB                        512 2$:	
      009D35 00 34 CD         [ 4]  513 	call UNLKEE 
      009D38 9C F4            [ 2]  514 	jra proceed_erase
                                    515 ; erase flash block:
      001DF0                        516 erase_flash:
      009D3A 90 97 FF         [ 4]  517 	call UNLKFL 
      001DF3                        518 proceed_erase:
      009D3D 81 9D 1F         [ 4]  519 	call PAD 
      009D40 08 45            [ 1]  520 	ldw y,x
      009D42 45 2D            [ 2]  521 	ldw y,(y)
      009D44 43 52 45         [ 2]  522 	addw x,#CELLL  
      009D47 41 44            [ 4]  523 	call (y) 
      009D49 72 17 50 5F      [ 1]  524 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009D49 1D 00 02         [ 4]  525 	call FC_XON
      009D4C 92               [ 4]  526 	ret 
                                    527 
                                    528 ; this routine is to be copied to PAD 
      001E07                        529 row_erase_proc:
      009D4D BC 00 34 CD      [ 1]  530 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009D51 9C F4 90 5F      [ 1]  531 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009D55 90               [ 1]  532 	clr a 
      009D56 97 FF            [ 1]  533 	clrw y 
      009D58 81 9D 40 07      [ 1]  534 	ldf ([FPTR],y),a
      009D5C 57 52            [ 1]  535     incw y
      009D5E 2D 42 59 54      [ 1]  536 	ldf ([FPTR],y),a
      009D62 45 5C            [ 1]  537     incw y
      009D63 91 A7 00 34      [ 1]  538 	ldf ([FPTR],y),a
      009D63 CD 84            [ 1]  539     incw y
      009D65 E3 90 93 90      [ 1]  540 	ldf ([FPTR],y),a
      009D69 FE 1C 00 02 90   [ 2]  541 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009D6E 9F               [ 4]  542 	ret
      001E2E                        543 row_erase_proc_end:
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
      001E2E                        556 copy_buffer:
      009D6F 92 BD            [ 1]  557 	push #BLOCK_SIZE  
                                    558 ;enable block programming 
      009D71 00 34 72 05      [ 1]  559 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009D75 50 5F FB CD      [ 1]  560 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009D79 84 CD            [ 1]  561 	clrw y
      009D7B CC               [ 1]  562 1$:	ld a,(x)
      009D7C 9C F4 9D 5B      [ 1]  563 	ldf ([FPTR],y),a
      009D80 07               [ 1]  564 	incw x 
      009D81 57 52            [ 1]  565 	incw y 
      009D83 2D 57            [ 1]  566 	dec (BCNT,sp)
      009D85 4F 52            [ 1]  567 	jrne 1$
                                    568 ; wait EOP bit 
      009D87 44 05 50 5F FB   [ 2]  569 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009D88 84               [ 1]  570 	pop a ; remove BCNT from stack 
      009D88 CD               [ 4]  571 	ret 
      001E4D                        572 copy_buffer_end:
                                    573 
                                    574 ;-------------------------
                                    575 ; move program_row to RAM 
                                    576 ; in TIB 
                                    577 ;------------------------
      001E4D                        578 copy_prog_to_ram:
      009D89 84 E3 90         [ 2]  579 	subw x,#6
      009D8C 93 90 FE 1C      [ 2]  580 	ldw y,#copy_buffer 
      009D90 00 02            [ 2]  581 	ldw (4,x),y 
      009D92 90 9E 92 BD      [ 2]  582 	ldw y,#TIBBASE
      009D96 00 34            [ 2]  583 	ldw (2,x),y 
      009D98 72 05 50 5F      [ 2]  584 	ldw y,#copy_buffer_end 
      009D9C FB CD 9C F4      [ 2]  585 	subw y,#copy_buffer  
      009DA0 90               [ 2]  586 	ldw (x),y 
      009DA1 9F 92 BD         [ 4]  587 	call CMOVE 
      009DA4 00               [ 4]  588 	ret 
                                    589 
                                    590 
                                    591 ;-----------------------------
                                    592 ; write a row in FLASH/EEPROM 
                                    593 ; WR-ROW ( a ud -- )
                                    594 ; a -> address 128 byte buffer to write 
                                    595 ; ud ->  row address in FLASH|EEPROM 
                                    596 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009DA5 34 72                  597 	.word LINK 
                           001E6B   598 	LINK=.
      009DA7 05                     599 	.byte 6 
      009DA8 50 5F FB CD 84 CD      600 	.ascii "WR-ROW"
      001E72                        601 write_row:
      009DAE CC 9C F4         [ 4]  602 	call FC_XOFF
      009DB1 9D 80 04         [ 4]  603 	call FPSTOR
                                    604 ; align to FLASH block 
      009DB4 45 45            [ 1]  605 	ld a,#0x80 
      009DB6 43 21            [ 1]  606 	and a,PTR8 
      009DB8 B7 36            [ 1]  607 	ld PTR8,a  
      009DB8 52 02 CD         [ 4]  608 	call copy_prog_to_ram
      009DBB 9B 7A E6         [ 4]  609 	call UNLOCK
      009DBE 01 43            [ 1]  610 	ldw y,x 
      009DC0 6B 01            [ 2]  611 	ldw y,(y)
      009DC2 0F 02 CD         [ 2]  612 	addw x,#CELLL 
      009DC5 9C               [ 2]  613 	pushw x 
      009DC6 B8               [ 1]  614 	ldw x,y ; buffer address in x 
      009DC7 3D 34 26         [ 4]  615 	call TIBBASE
      009DCA 19 90 BE         [ 4]  616 	call LOCK
      009DCD 35               [ 2]  617 	popw x 
      009DCE 90 A3 48         [ 4]  618 	call FC_XON 
      009DD1 00               [ 4]  619 	ret 
                                    620 
                                    621 ;-------------------------------------
                                    622 ; change value of OPTION register 
                                    623 ; SET-OPT (c n -- ) 
                                    624 ; c new value.
                                    625 ; n OPT  number {1..7}
                                    626 ;--------------------------------------
      009DD2 2B 10                  627 		.word LINK 
                           001E9A   628 		LINK=.
      009DD4 90                     629 		.byte 7 
      009DD5 A3 48 80 2A 0A 03 02   630 		.ascii "SET-OPT" 
      001EA2                        631 set_option: 
      009DDC 72 1E            [ 1]  632 		ldw y,x 
      009DDE 50 5B            [ 2]  633 		ldw y,(y)
      009DE0 72 1F            [ 1]  634 		jreq 1$
      009DE2 50 5C 00 07      [ 2]  635 		cpw y,#7 
      009DE4 23 04            [ 2]  636 		jrule 2$ 
                                    637 ; invalid OPTION number 		
      009DE4 CD 9D 63         [ 2]  638 1$:		addw x,#2*CELLL
      009DE7 0D               [ 4]  639 		ret
      009DE8 02 27            [ 2]  640 2$:		sllw y 
      009DEA 0D 7B 01 90      [ 2]  641 		addw y,#OPTION_BASE-1
      009DEE 5F               [ 2]  642 		ldw (x),y 
      009DEF 90 97 1D         [ 2]  643 		subw x,#CELLL 
      009DF2 00 02            [ 1]  644 		clrw y 
      009DF4 FF               [ 2]  645 		ldw (x),y 
      009DF5 CD 9D 63         [ 4]  646 		call EECSTORE
      009DF8 81               [ 4]  647 		ret 
                                    648 
                                    649 
                                    650 
                                    651 ;--------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                    652 ; reset system to its original state 
                                    653 ; before any user modification
                                    654 ; PRISTINE ( -- )
                                    655 ;-------------------------------------
      009DF8 CD 9C                  656 	.word LINK  
                           001EC5   657 	LINK=.
      009DFA E0                     658 	.byte 8 
      009DFB 5B 02 81 9D B3 03 45   659 	.ascii "PRISTINE"
             45
      001ECE                        660 pristine:
                                    661 ;;; erase EEPROM
      009E03 21 1B 19         [ 4]  662 	call EEPROM 
      009E04 CD 07 AB         [ 4]  663 1$:	call DDUP 
      009E04 CD 9B 7A         [ 4]  664 	call row_erase
      009E07 CD 9C            [ 1]  665 	ldw y,x 
      009E09 B8 90 93         [ 2]  666 	ldw y,(2,y)
      009E0C 90 FE 90 89      [ 2]  667 	addw y,#BLOCK_SIZE
      009E10 90 5E            [ 2]  668 	ldw (2,x),y
      009E12 FF CD 9D 63      [ 2]  669 	cpw y,#OPTION_BASE 
      009E16 90 85            [ 1]  670 	jrult 1$
                                    671 ;;; reset OPTION to default values
      009E18 1D 00 02 FF      [ 2]  672 	ldw y,#1 ; OPT1 
      009E1C CD               [ 2]  673 2$:	ldw (x),y   
      009E1D 9D 63            [ 1]  674 	clrw y 
      009E1F CC 9C            [ 2]  675 	ldw (2,x),y  ; ( 0 1 -- ) 
      009E21 E0 9E 00         [ 4]  676 	call DDUP    ; ( 0 1 0 1 -- )  
      009E24 09 52 4F         [ 4]  677 	call set_option
      009E27 57 2D            [ 1]  678 	ldw y,x 
      009E29 45 52            [ 2]  679 	ldw y,(y)
      009E2B 41 53            [ 1]  680 	incw y  ; next OPTION 
      009E2D 45 A3 00 08      [ 2]  681 	cpw y,#8 
      009E2E 25 E9            [ 1]  682 	jrult 2$
                                    683 ;;; erase first row of app_space 	
      009E2E CD 84 E3 CD      [ 2]  684 	ldw y,#app_space
      009E32 9B 7A            [ 2]  685 	ldw (2,x),y  
      009E34 1D 00            [ 1]  686 	clrw y 
      009E36 02               [ 2]  687 	ldw (x),y ; ( app_space 0 -- )
      009E37 90 AE 9E         [ 4]  688 	call row_erase 
                                    689 ; reset interrupt vectors 
      009E3A 87 FF CD         [ 2]  690 	subw x,#CELLL 
      009E3D 8C C9            [ 1]  691 	clrw y  
      009E3F 90               [ 2]  692 4$:	ldw (x),y  ; ( n -- ) int# 
      009E40 AE 9E AE         [ 4]  693 	call DUPP  
      009E43 72 A2 9E         [ 4]  694 	call reset_vector
      009E46 87 1D            [ 1]  695 	ldw y,x 
      009E48 00 02            [ 2]  696 	ldw y,(y)
      009E4A FF CD            [ 1]  697 	incw y   ; next vector 
      009E4C 8D 05 00 19      [ 2]  698 	cpw y,#25 
      009E4E 25 ED            [ 1]  699 	jrult 4$
      009E4E 90 BE 35         [ 2]  700 	jp NonHandledInterrupt ; reset MCU
                                    701 
                                    702 ;------------------------------
                                    703 ; reset an interrupt vector 
                                    704 ; to its initial value 
                                    705 ; i.e. NonHandledInterrupt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                    706 ; RST-IVEC ( n -- )
                                    707 ;-----------------------------
      009E51 90 A3                  708 	.word LINK 
                           001F2C   709 	LINK=. 
      009E53 B3                     710 	.byte 8 
      009E54 80 2A 19 90 A3 40 00   711 	.ascii "RST-IVEC"
             24
      001F35                        712 reset_vector:
      009E5C 04 CD            [ 1]  713 	ldw y,x
      009E5E 84 CD 81         [ 2]  714 	addw x,#CELLL 
      009E61 90 A3            [ 2]  715 	ldw y,(y)
      009E63 47 FF 23 04      [ 2]  716 	cpw y,#23 
      009E67 CD 84            [ 1]  717 	jreq 9$
      009E69 CD 81 00 1D      [ 2]  718 	cpw y,#29 ; last vector
      009E6B 22 34            [ 1]  719 	jrugt 9$  
      009E6B CD 9C            [ 2]  720 	sllw y 
      009E6D 7A 20            [ 2]  721 	sllw y 
      009E6F 03 A9 80 08      [ 2]  722 	addw y,#0x8008 ; irq0 address 
      009E70 90 BF 26         [ 2]  723 	ldw YTEMP,y
      009E70 CD 9C 99         [ 2]  724 	subw x,#3*CELLL 
      009E73 EF 02            [ 2]  725 	ldw (2,x),y 
      009E73 CD 8C            [ 1]  726 	clrw y
      009E75 C9               [ 2]  727 	ldw (x),y 
      009E76 90 93            [ 1]  728 	ld a,#0x82 
      009E78 90 FE            [ 1]  729 	ld yh,a
      009E7A 1C 00            [ 2]  730 	ldw (4,x),y
      009E7C 02 90 FD         [ 4]  731 	call EESTORE
      009E7F 72 17 50         [ 2]  732 	subw x,#3*CELLL
      009E82 5F CD            [ 1]  733 	clrw y 
      009E84 84               [ 2]  734 	ldw (x),y 
      009E85 CD 81 00 00      [ 2]  735 	ldw y,#NonHandledInterrupt
      009E87 EF 04            [ 2]  736 	ldw (4,x),y 
      009E87 35 20 50         [ 2]  737 	ldw y,YTEMP  
      009E8A 5B 35 DF 50      [ 2]  738 	addw y,#2
      009E8E 5C 4F            [ 2]  739 	ldw (2,x),y 
      009E90 90 5F 91         [ 4]  740 	call EESTORE
      009E93 A7               [ 4]  741 9$:	ret 
                                    742 
                                    743 
                                    744 ;------------------------------
                                    745 ; all interrupt vector with 
                                    746 ; an address >= a are resetted 
                                    747 ; to default
                                    748 ; CHKIVEC ( a -- )
                                    749 ;------------------------------
      009E94 00 34                  750 	.word LINK 
                           001F7F   751 	LINK=.
      009E96 90                     752 	.byte 7
      009E97 5C 91 A7 00 34 90 5C   753 	.ascii "CHKIVEC"
                                    754 ;local variables 
                           000001   755 	SSP=1
                           000003   756 	CADR=3
                           000005   757 	OFS=5
                           000006   758 	VSIZE=6  
      001F87                        759 CHKIVEC:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal  91-Bits]



      009E9F A7 00            [ 2]  760 	sub sp,#VSIZE ;alloc local variables 
      009EA1 34 90            [ 1]  761 	ldw y,x 
      009EA3 5C 91            [ 2]  762 	ldw y,(y)
      009EA5 A7 00            [ 2]  763 	ldw (CADR,sp),y ; ca 
      009EA7 34 72            [ 2]  764 	ldw (SSP,sp),x 
      009EA9 05 50 5F         [ 2]  765 	ldw x,#0x800a ; irq0 address 
      009EAC FB 81            [ 2]  766 	ldw PTR16,X
      009EAE AE FF FC         [ 2]  767 	ldw x,#-4 
      009EAE 1C 00 04         [ 2]  768 1$:	addw x,#4
      009EAE 4B 80 72         [ 2]  769 	cpw x,#30*4 ; irq0-29 
      009EB1 10 50            [ 1]  770 	jreq 9$
      009EB3 5B 72            [ 1]  771 	ldw y,x  
      009EB5 11 50 5C         [ 4]  772 	ld a,([PTR16],y)
      009EB8 90 5F            [ 1]  773 	cp a,(CADR,sp)
      009EBA F6 91            [ 1]  774 	jrult 1$
      009EBC A7 00            [ 1]  775 	incw y 
      009EBE 34 5C 90         [ 4]  776 	ld a,([PTR16],y)
      009EC1 5C 0A            [ 1]  777 	cp a,(CADR+1,sp) 
      009EC3 01 26            [ 1]  778 	jrult 1$ 
      009EC5 F4 72            [ 2]  779 	ldw (OFS,sp),x 
      009EC7 05               [ 2]  780 	srlw x
      009EC8 50               [ 2]  781 	srlw x 
      009EC9 5F FB            [ 1]  782 	ldw y,x 
      009ECB 84 81            [ 2]  783 	ldw x,(SSP,sp)
      009ECD FF               [ 2]  784 	ldw (x),y
      009ECD CD 1F 35         [ 4]  785 	call reset_vector
      009ECD 1D 00            [ 2]  786 	ldw x,(OFS,sp) 
      009ECF 06 90            [ 2]  787 	jra 1$
      009ED1 AE 9E            [ 2]  788 9$:	ldw x,(SSP,sp) 
      009ED3 AE EF 04         [ 2]  789 	addw x,#CELLL 
      009ED6 90 AE            [ 2]  790 	addw sp,#VSIZE ; drop local variables  
      009ED8 17               [ 4]  791 	ret 
                                    792 
                                    793 ;------------------------------
                                    794 ; set interrupt vector 
                                    795 ; SET-IVEC ( ud n -- )
                                    796 ;  ud Handler address
                                    797 ;  n  vector # 0 .. 29 
                                    798 ;-----------------------------
      009ED9 00 EF                  799 	.word LINK
                           001FCD   800 	LINK=.
      009EDB 02                     801 	.byte 8 
      009EDC 90 AE 9E CD 72 A2 9E   802 	.ascii "SET-IVEC" 
             AE
      001FD6                        803 set_vector:
      009EE4 FF CD            [ 1]  804     ldw y,x 
      009EE6 8D 05 81         [ 2]  805 	addw x,#CELLL 
      009EE9 9E 24            [ 2]  806 	ldw y,(y) ; vector #
      009EEB 06 57 52 2D      [ 2]  807 	cpw y,#29 ; last vector
      009EEF 52 4F            [ 2]  808 	jrule 2$
      009EF1 57 00 04         [ 2]  809 	addw x,#2*CELLL 
      009EF2 81               [ 4]  810 	ret
      009EF2 CD 84            [ 2]  811 2$:	sllw y 
      009EF4 E3 CD            [ 2]  812 	sllw y 
      009EF6 9B 7A A6 80      [ 2]  813 	addw y,#0X8008 ; IRQ0 vector address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      009EFA B4 36 B7         [ 2]  814 	ldw YTEMP,y ; vector address 
      009EFD 36 CD            [ 1]  815 	ld a,#0x82 
      009EFF 9E CD            [ 1]  816 	ld yh,a 
      009F01 CD 9C            [ 1]  817 	ld a,(1,x) ; isr address bits 23..16 
      009F03 B8 90            [ 1]  818 	ld yl,a 
                                    819 ;  write 0x82 + most significant byte of int address	
      009F05 93 90 FE         [ 2]  820 	subw x,#3*CELLL 
      009F08 1C 00            [ 2]  821 	ldw (4,x),y 
      009F0A 02 89 93         [ 2]  822 	ldw y,YTEMP
      009F0D CD 17            [ 2]  823 	ldw (2,x),y ; vector address 
      009F0F 00 CD            [ 1]  824 	clrw y 
      009F11 9C               [ 2]  825 	ldw (x),y   ; as a double 
      009F12 E0 85 CD         [ 4]  826 	call EESTORE 
      009F15 84 CD            [ 1]  827 	ldw y,x 
      009F17 81 9E EB         [ 2]  828 	ldw y,(2,y) ; bits 15..0 int vector 
      009F1A 07 53 45         [ 2]  829 	subw x,#3*CELLL 
      009F1D 54 2D            [ 2]  830 	ldw (4,x),y 
      009F1F 4F 50 54         [ 2]  831 	ldw y,YTEMP 
      009F22 72 A9 00 02      [ 2]  832 	addw y,#2 
      009F22 90 93            [ 2]  833 	ldw (2,x),y 
      009F24 90 FE            [ 1]  834 	clrw y 
      009F26 27               [ 2]  835 	ldw (x),y 
      009F27 06 90 A3         [ 4]  836 	call EESTORE
      009F2A 00 07 23         [ 2]  837 	addw x,#2*CELLL  
      009F2D 04               [ 4]  838 9$: ret 
                                    839 
                                    840 
                                    841 ;------------------------
                                    842 ; Compile word to flash
                                    843 ; EE, (w -- )
                                    844 ;-----------------------
      009F2E 1C 00                  845 	.word LINK
                           002029   846 	LINK=.
      009F30 04                     847 	.byte 3
      009F31 81 90 58               848 	.ascii "EE,"
      00202D                        849 EE_COMMA:
      009F34 72 A9 47         [ 2]  850 	subw x,#2*CELLL 
      009F37 FF FF 1D         [ 2]  851 	ldw y,UCP
      009F3A 00 02            [ 2]  852 	pushw y 
      009F3C 90 5F            [ 2]  853 	ldw (2,x),y 
      009F3E FF CD            [ 1]  854 	clrw y 
      009F40 9D               [ 2]  855 	ldw (x),y
      009F41 B8 81 9F         [ 4]  856 	call EESTORE
      009F44 1A 08            [ 2]  857 	popw y 
      009F46 50 52 49 53      [ 2]  858 	addw y,#2
      009F4A 54 49 4E         [ 2]  859 	ldw UCP,y
      009F4D 45               [ 4]  860 	ret 
                                    861 
                                    862 
                                    863 ;-------------------------
                                    864 ; Compile byte to flash 
                                    865 ; EEC, ( c -- )	
                                    866 ;-------------------------
      009F4E 20 29                  867 	.word LINK 
                           002049   868 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009F4E CD                     869 	.byte 4 
      009F4F 9B 99 CD 88            870 	.ascii "EEC,"
      00204E                        871 EE_CCOMMA:
      009F53 2B CD 9E         [ 2]  872 	subw x,#2*CELLL 
      009F56 2E 90 93         [ 2]  873 	ldw y,UCP
      009F59 90 EE            [ 2]  874 	pushw y 
      009F5B 02 72            [ 2]  875 	ldw (2,x),y 
      009F5D A9 00            [ 1]  876 	clrw y 
      009F5F 80               [ 2]  877 	ldw (x),y
      009F60 EF 02 90         [ 4]  878 	call EECSTORE
      009F63 A3 48            [ 2]  879 	popw y 
      009F65 00 25            [ 1]  880 	incw y 
      009F67 E9 90 AE         [ 2]  881 	ldw UCP,y
      009F6A 00               [ 4]  882 	ret 
                                    883 
                                    884 
                                    885 ;--------------------------
                                    886 ; copy FLASH block to ROWBUF
                                    887 ; ROW>BUF ( ud -- )
                                    888 ;--------------------------
      009F6B 01 FF                  889 	.word LINK 
                           002068   890 	LINK=.
      009F6D 90                     891 	.byte 7 
      009F6E 5F EF 02 CD 88 2B CD   892 	.ascii "ROW>BUF"
      002070                        893 ROW2BUF: 
      009F75 9F 22 90         [ 4]  894 	call FPSTOR 
      009F78 93 90            [ 1]  895 	ld a,#BLOCK_SIZE
      009F7A FE               [ 1]  896 	push a 
      009F7B 90 5C            [ 1]  897 	and a,PTR8 ; block align 
      009F7D 90 A3            [ 1]  898 	ld PTR8,a
      009F7F 00 08 25 E9      [ 2]  899 	ldw y,#ROWBUFF 
      009F83 90 AE B3 80      [ 5]  900 1$: ldf a,[FPTR]
      009F87 EF 02            [ 1]  901 	ld (y),a
      009F89 90 5F FF         [ 4]  902 	call INC_FPTR
      009F8C CD 9E            [ 1]  903 	incw y 
      009F8E 2E 1D            [ 1]  904 	dec (1,sp)
      009F90 00 02            [ 1]  905 	jrne 1$ 
      009F92 90               [ 1]  906 	pop a 
      009F93 5F               [ 4]  907 	ret 
                                    908 
                                    909 
                                    910 ;---------------------------
                                    911 ; copy ROWBUFF to flash 
                                    912 ; BUF>ROW ( ud -- )
                                    913 ; ud is row address as double 
                                    914 ;---------------------------
      009F94 FF CD                  915 	.word LINK 
                           002091   916 	LINK=.
      009F96 86                     917 	.byte 7 
      009F97 11 CD 9F B5 90 93 90   918 	.ascii "BUF>ROW" 
      002099                        919 BUF2ROW:
      009F9E FE 90 5C         [ 4]  920 	call TBUF ; ( ud rb -- )
      009FA1 90 A3 00         [ 4]  921 	call ROT 
      009FA4 19 25 ED         [ 4]  922 	call ROT  ; ( rb ud -- )
      009FA7 CC 80 80         [ 4]  923 	call write_row 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009FAA 9F               [ 4]  924 	ret 
                                    925 
                                    926 ;---------------------------------
                                    927 ; how many byte free in that row 
                                    928 ; RFREE ( a -- n )
                                    929 ; a is least byte of target address
                                    930 ;----------------------------------
      009FAB 45 08                  931 	.word LINK 
                           0020A8   932 	LINK=.
      009FAD 52                     933 	.byte 5 
      009FAE 53 54 2D 49 56         934 	.ascii "RFREE"
      0020AE                        935 RFREE:
      009FB3 45 43            [ 1]  936 	ld a,(1,x)
      009FB5 A4 7F            [ 1]  937 	and a,#BLOCK_SIZE-1 
      009FB5 90 93            [ 1]  938 	ld YTEMP,a 
      009FB7 1C 00            [ 1]  939 	ld a,#BLOCK_SIZE 
      009FB9 02 90            [ 1]  940 	sub a,YTEMP 
      009FBB FE 90            [ 1]  941 	clrw y 
      009FBD A3 00            [ 1]  942 	ld yl,a
      009FBF 17               [ 2]  943 	ldw (x),y 
      009FC0 27               [ 4]  944 	ret 
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
      009FC1 3A 90                  955 	.word LINK 
                           0020C0   956 	LINK=. 
      009FC3 A3                     957 	.byte 6
      009FC4 00 1D 22 34 90 58      958 	.ascii "RAM>EE"
                                    959 	
      0020C7                        960 RAM2EE:
                                    961 ; copy ud on top 
      009FCA 90 58            [ 1]  962 	ldw y,x 
      009FCC 72 A9 80         [ 2]  963 	ldw y,(6,y) ; LSW of ud  
      009FCF 08 90 BF         [ 2]  964 	ldw YTEMP,y 
      009FD2 26 1D            [ 1]  965 	ldw y,x 
      009FD4 00 06 EF         [ 2]  966 	ldw y,(4,y)  ; MSW of ud 
      009FD7 02 90 5F         [ 2]  967 	subw x,#2*CELLL 
      009FDA FF               [ 2]  968 	ldw (x),y 
      009FDB A6 82 90         [ 2]  969 	ldw y,YTEMP 
      009FDE 95 EF            [ 2]  970 	ldw (2,x),y 
      009FE0 04 CD 9E         [ 4]  971 	call ROW2BUF 
      009FE3 04 1D            [ 1]  972 	ldw y,x 
      009FE5 00 06 90         [ 2]  973 	ldw y,(6,y)
      009FE8 5F FF            [ 2]  974 	pushw y ; udl 
      009FEA 90 AE            [ 1]  975 	ld a,yl
      009FEC 80 80            [ 1]  976 	and a,#BLOCK_SIZE-1 
      009FEE EF 04            [ 1]  977 	clrw y 
      009FF0 90 BE            [ 1]  978 	ld yl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009FF2 26 72 A9 00      [ 2]  979 	addw y,#ROWBUFF 
      009FF6 02 EF 02         [ 2]  980 	subw x,#CELLL 
      009FF9 CD               [ 2]  981 	ldw (x),y  
      009FFA 9E 04 81         [ 4]  982 	call SWAPP ;  ( ud a ra u -- )
      009FFD 9F AC 07         [ 4]  983 	call RFROM  
      00A000 43 48 4B         [ 4]  984 	call RFREE 
      00A003 49 56 45         [ 4]  985 	call MIN
      00A006 43 05 91         [ 4]  986 	call DUPP 
      00A007 CD 05 5A         [ 4]  987 	call TOR  
      00A007 52 06 90         [ 4]  988 	call CMOVE
      00A00A 93 90 FE         [ 4]  989 	call BUF2ROW 
      00A00D 17 03 1F         [ 4]  990 	call RFROM 
      00A010 01               [ 4]  991 	ret 
                                    992 
                                    993 
                                    994 ;--------------------------
                                    995 ; expand 16 bit address 
                                    996 ; to 32 bit address 
                                    997 ; FADDR ( a -- ud )
                                    998 ;--------------------------
      00A011 AE 80                  999 	.word LINK 
                           002115  1000 	LINK=. 
      00A013 0A                    1001 	.byte 5 
      00A014 BF 35 AE FF FC        1002 	.ascii "FADDR"
      00211B                       1003 FADDR:
      00A019 1C 00 04         [ 2] 1004 	jp ZERO 
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
      00A01C A3 00                 1020 	.word LINK 
                           002120  1021 	LINK=.
      00A01E 78                    1022 	.byte 5 
      00A01F 27 22 90 93 91        1023 	.ascii "FMOVE" 
      002126                       1024 FMOVE:
      00A024 D6 35 11         [ 4] 1025 	call TFLASH 
      00A027 03 25 EF         [ 4] 1026 	CALL AT 
      00A02A 90 5C 91         [ 4] 1027 	CALL QBRAN 
      00A02D D6 35                 1028 	.word no_move  
      00A02F 11 04 25         [ 4] 1029 	call CPP
      00A032 E6 1F 05         [ 4] 1030 	call AT  
      00A035 54 54 90         [ 4] 1031 	call DUPP ; ( udl udl -- )
      00A038 93 1E 01         [ 4] 1032 	call CNTXT 
      00A03B FF CD 9F         [ 4] 1033 	call AT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      00A03E B5 1E 05         [ 4] 1034 	call DOLIT 
      00A041 20 D6                 1035 	.word 2 
      00A043 1E 01 1C         [ 4] 1036 	call SUBB ; ( udl udl a -- )
      00A046 00 02 5B         [ 4] 1037 	call SWAPP 
      00A049 06 81 9F         [ 4] 1038 	call FADDR 
      00A04C FF 08 53         [ 4] 1039 	call ROT  ; ( udl ud a -- )
      00A04F 45 54 2D         [ 4] 1040 	call DUPP 
      00A052 49 56 45         [ 4] 1041 	call TOR    ; R: a 
      002157                       1042 FMOVE2: 
      00A055 43 0C 38         [ 4] 1043 	call HERE 
      00A056 CD 05 4E         [ 4] 1044 	call RAT 
      00A056 90 93 1C         [ 4] 1045 	call SUBB ; (udl ud a wl -- )
      002160                       1046 next_row:
      00A059 00 02 90         [ 4] 1047 	call DUPP 
      00A05C FE 90 A3         [ 4] 1048 	call TOR  ; ( udl ud a wl -- ) R: a wl
      00A05F 00 1D 23         [ 4] 1049 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      00A062 04 1C 00         [ 4] 1050 	call DUPP 
      00A065 04 81 90         [ 4] 1051 	call TOR
      00A068 58 90 58         [ 4] 1052 	call PLUS  ; ( udl+ ) 
      00A06B 72 A9 80         [ 4] 1053 	call DUPP 
      00A06E 08 90 BF         [ 4] 1054 	call ZERO   ; ( udl+ ud -- )
      00A071 26 A6 82         [ 4] 1055 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      00A074 90 95 E6         [ 4] 1056 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      00A077 01 90 97         [ 4] 1057 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      00A07A 1D 00 06         [ 4] 1058 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      00A07D EF 04 90         [ 4] 1059 	call DUPP 
      00A080 BE 26 EF         [ 4] 1060 	call QBRAN
      00A083 02 90                 1061 	.word fmove_done 
      00A085 5F FF CD         [ 4] 1062 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      00A088 9E 04 90         [ 4] 1063 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      00A08B 93 90 EE         [ 4] 1064 	call PLUS  ; ( udl+2 ud wl- a+ )
      00A08E 02 1D 00         [ 4] 1065 	call DUPP 
      00A091 06 EF 04         [ 4] 1066 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      00A094 90 BE 26         [ 4] 1067 	call SWAPP 
      00A097 72 A9 00         [ 4] 1068 	call BRAN
      00A09A 02 EF                 1069 	.word next_row  
      0021A3                       1070 fmove_done:	
      00A09C 02 90 5F         [ 4] 1071 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      00A09F FF CD 9E         [ 2] 1072 	addw x,#5*CELLL ; (  -- cp+ ) new CP 
      00A0A2 04               [ 4] 1073  	ret  
      0021AA                       1074 no_move:
      00A0A3 1C 00 04         [ 4] 1075 	call ZERO
      00A0A6 81               [ 4] 1076 	ret 
                                   1077 
                                   1078 ;------------------------------------------
                                   1079 ; adjust pointers after **FMOVE** operetion.
                                   1080 ; UPDAT-PTR ( cp+ -- )
                                   1081 ; cp+ is new CP position after FMOVE 
                                   1082 ;-------------------------------------------
      00A0A7 A0 4D                 1083 	.word LINK 
                           0021B0  1084 	LINK=.
      00A0A9 03                    1085 	.byte 9
      00A0AA 45 45 2C 41 54 2D 50  1086 	.ascii "UPDAT-PTR" 
             54 52
      00A0AD                       1087 UPDATPTR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                                   1088 ;reset VP to previous position  
      00A0AD 1D 00 04         [ 4] 1089 	call EEPVP 
      00A0B0 90 BE 1A         [ 4] 1090 	call DROP 
      00A0B3 90 89 EF         [ 4] 1091 	call AT
      00A0B6 02 90 5F         [ 4] 1092 	call VPP 
      00A0B9 FF CD 9E         [ 4] 1093 	call STORE
                                   1094 ;update CONTEXT and LAST 
      00A0BC 04 90 85         [ 4] 1095 	call EEPCP 
      00A0BF 72 A9 00         [ 4] 1096 	call DROP
      00A0C2 02 90 BF         [ 4] 1097 	call AT
      00A0C5 1A 81 A0         [ 4] 1098 	call DOLIT 
      00A0C8 A9 04                 1099 	.word 2 
      00A0CA 45 45 43         [ 4] 1100 	call PLUS 
      00A0CD 2C 05 91         [ 4] 1101 	call DUPP 
      00A0CE CD 06 E4         [ 4] 1102 	call CNTXT 
      00A0CE 1D 00 04         [ 4] 1103 	call STORE
      00A0D1 90 BE 1A         [ 4] 1104 	call LAST
      00A0D4 90 89 EF         [ 4] 1105 	call STORE 
      00A0D7 02 90 5F         [ 4] 1106 	call UPDATLAST 
                                   1107 ;update CP 
      00A0DA FF CD 9D         [ 4] 1108 	call CPP 
      00A0DD B8 90 85         [ 4] 1109 	call STORE
      00A0E0 90 5C 90         [ 4] 1110 	call UPDATCP 
      00A0E3 BF               [ 4] 1111 	ret 
                                   1112 
                                   1113 ;-----------------------------
                                   1114 ; move interrupt sub-routine
                                   1115 ; in flash memory
                                   1116 ;----------------------------- 
      00A0E4 1A 81                 1117 	.word LINK 
                           0021F8  1118 	LINK=. 
      00A0E6 A0                    1119 	.byte 6
      00A0E7 C9 07 52 4F 57 3E     1120 	.ascii "IFMOVE" 
      0021FF                       1121 IFMOVE:
      00A0ED 42 55 46         [ 4] 1122 	call TFLASH 
      00A0F0 CD 04 EA         [ 4] 1123 	CALL AT 
      00A0F0 CD 9B 7A         [ 4] 1124 	CALL QBRAN 
      00A0F3 A6 80                 1125 	.word no_move 
      00A0F5 88 B4 36         [ 4] 1126 	call CPP 
      00A0F8 B7 36 90         [ 4] 1127 	call AT 
      00A0FB AE 16 80         [ 4] 1128 	call DUPP ; ( udl udl -- )
      00A0FE 92 BC 00         [ 4] 1129 	call EEPVP 
      00A101 34 90 F7         [ 4] 1130 	call DROP
      00A104 CD 9C F4         [ 4] 1131 	call AT  ; ( udl udl a )
      00A107 90 5C 0A         [ 4] 1132 	call TOR 
      00A10A 01 26 F1         [ 4] 1133 	call FADDR
      00A10D 84 81 A0         [ 4] 1134 	call RAT ; ( udl ud a -- ) R: a 
      00A110 E8 07 42         [ 2] 1135 	jp FMOVE2 
                                   1136 
                                   1137 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                           000001  4824 .if WANT_SCALING_CONST 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                                   4825         .include "const_ratio.asm"
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
      00A113 55 46                   34         .word LINK 
                           00222A    35         LINK=.
      00A115 3E                      36         .byte 2
      00A116 52 4F                   37         .ascii "PI" 
      00222D                         38 PII:
      00A118 57 00 04         [ 2]   39         subw x,#2*CELLL 
      00A119 90 AE 01 63      [ 2]   40         ldw y,#355 
      00A119 CD 87            [ 2]   41         ldw (2,x),y 
      00A11B 1F CD 87 DF      [ 2]   42         ldw y,#113 
      00A11F CD               [ 2]   43         ldw (x),y 
      00A120 87               [ 4]   44         ret 
                                     45 
                                     46 ;      SQRT2 ( -- 19601  13860 )
                                     47 ; precision: 1.5e-9 
                                     48 ; usage example to compute Voltage peek to peek from Vrms 
                                     49 ; : VPP SQRT2 */ 2 * ;
                                     50 ;
      00A121 DF CD                   51         .word LINK 
                           00223E    52         LINK=.
      00A123 9E                      53         .byte 5 
      00A124 F2 81 A1 11 05          54         .ascii "SQRT2" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      002244                         55 SQRT2:
      00A129 52 46 52         [ 2]   56         subw x,#2*CELLL 
      00A12C 45 45 4C 91      [ 2]   57         ldw y,#19601 
      00A12E EF 02            [ 2]   58         ldw (2,x),y 
      00A12E E6 01 A4 7F      [ 2]   59         ldw y,#13860 
      00A132 B7               [ 2]   60         ldw (x),y 
      00A133 26               [ 4]   61         ret 
                                     62 
                                     63 ;   SQRT3 ( -- 18817 10864 )
                                     64 ; precision: 1.1e-9
                                     65 ;
      00A134 A6 80                   66         .word LINK 
                           002255    67         LINK=.
      00A136 B0                      68         .byte 5
      00A137 26 90 5F 90 97          69         .ascii "SQRT3" 
      00225B                         70 SQRT3: 
      00A13C FF 81 A1         [ 2]   71     subw x,#2*CELLL 
      00A13F 28 06 52 41      [ 2]   72     ldw y,#18817 
      00A143 4D 3E            [ 2]   73     ldw (2,x),y 
      00A145 45 45 2A 70      [ 2]   74     ldw y,#10864 
      00A147 FF               [ 2]   75     ldw (x),y 
      00A147 90               [ 4]   76     ret 
                                     77 
                                     78 ;   E ( -- 28667 10546 )
                                     79 ; precision: 5.5e-9 
                                     80 ; natural log base 
      00A148 93 90                   81         .word LINK 
                           00226C    82         LINK=.
      00A14A EE                      83         .byte 1
      00A14B 06                      84         .ascii "E" 
      00226E                         85 ENEPER:
      00A14C 90 BF 26         [ 2]   86     subw x,#2*CELLL 
      00A14F 90 93 90 EE      [ 2]   87     ldw y,#28667 
      00A153 04 1D            [ 2]   88     ldw (2,x),y 
      00A155 00 04 FF 90      [ 2]   89     ldw y,#10546 
      00A159 BE               [ 2]   90     ldw (x),y 
      00A15A 26               [ 4]   91     ret 
                                     92 
                                     93 ;   SQRT10 ( -- 22936 7253 )
                                     94 ; precision: 5.7e-9 
      00A15B EF 02                   95         .word LINK 
                           00227F    96         LINK=.
      00A15D CD                      97         .byte 6 
      00A15E A0 F0 90 93 90 EE       98         .ascii "SQRT10" 
      002286                         99 SQRT10:
      00A164 06 90 89         [ 2]  100     subw x,#2*CELLL
      00A167 90 9F A4 7F      [ 2]  101     ldw y,#22936 
      00A16B 90 5F            [ 2]  102     ldw (2,x),y 
      00A16D 90 97 72 A9      [ 2]  103     ldw y,#7253
      00A171 16               [ 2]  104     ldw (x),y 
      00A172 80               [ 4]  105     ret 
                                    106 
                                    107 ;   12RT2 ( -- 26797 25293 )
                                    108 ; precision: 1.0e-9 
                                    109 ; used in music to compute well tempered scale
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      00A173 1D 00                  110         .word LINK 
                           002297   111         LINK=. 
      00A175 02                     112         .byte 5 
      00A176 FF CD 86 21 CD         113         .ascii "12RT2"
      00229D                        114 RT12_2:
      00A17B 85 BB CD         [ 2]  115     subw x,#2*CELLL 
      00A17E A1 2E CD 89      [ 2]  116     ldw y,#26797
      00A182 99 CD            [ 2]  117     ldw (2,x),y 
      00A184 86 11 CD 85      [ 2]  118     ldw y,#25293
      00A188 DA               [ 2]  119     ldw (x),y 
      00A189 CD               [ 4]  120     ret 
                                    121 
                                    122 ;   LOG2s ( -- 2040 11103 )
                                    123 ; log(2)/1.6384
                                    124 ; precision: 1.1e-8
      00A18A 8D 05                  125         .word LINK 
                           0022AE   126         LINK=.
      00A18C CD                     127         .byte 5 
      00A18D A1 19 CD 85 BB         128         .ascii "LOG2S" 
      0022B4                        129 LOG2S:
      00A192 81 A1 40         [ 2]  130     subw x,#2*CELLL
      00A195 05 46 41 44      [ 2]  131     ldw y,#2040 
      00A199 44 52            [ 2]  132     ldw (2,x),y 
      00A19B 90 AE 2B 5F      [ 2]  133     ldw y,#11103 
      00A19B CC               [ 2]  134     ldw (x),y 
      00A19C 8B               [ 4]  135     ret 
                                    136 
                                    137 ;   LN2 ( -- 485 11464 )
                                    138 ; ln(2)/16.384 
                                    139 ; precision: 1.0e-7 
      00A19D CA A1                  140         .word LINK 
                           0022C5   141         LINK=.
      00A19F 95                     142         .byte 4 
      00A1A0 05 46 4D 4F            143         .ascii "LN2S" 
      0022CA                        144 LN2S: 
      00A1A4 56 45 04         [ 2]  145     subw x,#2*CELLL
      00A1A6 90 AE 01 E5      [ 2]  146     ldw y,#485
      00A1A6 CD 87            [ 2]  147     ldw (2,x),y 
      00A1A8 31 CD 85 6A      [ 2]  148     ldw y,#11464 
      00A1AC CD               [ 2]  149     ldw (x),y 
      00A1AD 85               [ 4]  150     ret 
                                    151 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



                                   4826 .endif
                           000001  4827 .if WANT_CONST_TABLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



                                   4828         .include "ctable.asm"
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
      00A1AE 1A A2                   34     .word LINK 
                           0022DB    35     LINK=.
      00A1B0 2A                      36     .byte 6
      00A1B1 CD 87 80 CD 85 6A       37     .ascii "CALLOT"
      0022E2                         38 CALLOT:
      00A1B7 CD 86 11         [ 4]   39     CALL CPP
      00A1BA CD 87 64         [ 4]   40     CALL DUPP 
      00A1BD CD 85 6A         [ 4]   41     CALL AT 
      00A1C0 CD 84 F1         [ 4]   42     CALL TOR 
      00A1C3 00 02 CD         [ 4]   43     CALL PSTOR 
      00A1C6 88 B9 CD         [ 4]   44     CALL UPDATCP 
      00A1C9 86 21 CD         [ 4]   45     CALL RFROM
      00A1CC A1 9B CD         [ 2]   46     JP ZERO 
                                     47 
                                     48 ;------------------------------
                                     49 ; create constants bytes table 
                                     50 ; in persistant memory
                                     51 ;  CTABLE ( n+ -- ad ; <string> )
                                     52 ; n+ bytes reserved 
                                     53 ;-----------------------------
      00A1CF 87 DF                   54     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



                           0022FC    55     LINK=.
      00A1D1 CD                      56     .byte 6
      00A1D2 86 11 CD 85 DA 45       57     .ascii "CTABLE"
      00A1D7                         58 CTABLE:
      00A1D7 CD 8C B8         [ 4]   59     CALL CALLOT     
      00A1DA CD 85 CE         [ 2]   60     JP DCONST 
                                     61      
                                     62 
                                     63 ;--------------------------------
                                     64 ; create constants words table 
                                     65 ; in persistant memory 
                                     66 ; WTABLE ( n+ -- ad ; <string> )
                                     67 ; n+  words reserved  
                                     68 ;--------------------------------
      00A1DD CD 88                   69     .word LINK 
                           00230B    70     LINK=.
      00A1DF B9                      71     .byte 6
      00A1E0 57 54 41 42 4C 45       72     .ascii "WTABLE"
      002312                         73 WTABLE:
      00A1E0 CD 86 11         [ 4]   74     CALL CELLS  
      00A1E3 CD 85 DA         [ 4]   75     CALL CALLOT 
      00A1E6 CD A1 47         [ 2]   76     JP DCONST 
                                     77 
                                     78 ;---------------------------------
                                     79 ; stack an element of CTABLE 
                                     80 ; CTABL@ ( u ad -- c )
                                     81 ; u element order {0..size-1}
                                     82 ; a|ad table address 
                                     83 ;--------------------------------
      00A1E9 CD 86                   84     .word LINK 
                           00231D    85     LINK=.
      00A1EB 11                      86     .byte 6
      00A1EC CD 85 DA CD 88 40       87     .ascii "CTABL@" 
      002324                         88 CTAT:
      00A1F2 CD 86 11         [ 4]   89     call FPSTOR 
      00A1F5 CD 8B CA         [ 4]   90     call PTRPLUS 
      00A1F8 CD 85 BB         [ 2]   91     jp EE_CREAD 
                                     92 
                                     93 ;---------------------------------
                                     94 ; stack an element of WTABLE 
                                     95 ; WTABL@ ( u ud -- w )
                                     96 ; u is element order {0..size-1}
                                     97 ; a|ud table address 
                                     98 ;----------------------------------
      00A1FB CD 85                   99     .word LINK 
                           00232F   100     LINK=.
      00A1FD BB                     101     .byte 6
      00A1FE CD 86 3B CD 88 B9      102     .ascii "WTABL@" 
      002336                        103 WTAT:
      00A204 CD 86 11         [ 4]  104     call FPSTOR 
      00A207 CD 85 1A         [ 4]  105     call CELLS 
      00A20A A2 23 CD         [ 4]  106     call PTRPLUS 
      00A20D 86 21 CD         [ 4]  107     call EE_READ 
      00A210 85               [ 4]  108     ret 
                                    109 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



                                    110 ;--------------------------
                                    111 ; tool to initialize character table 
                                    112 ; CTINIT ( ad -- )
                                    113 ; ad is table address 
                                    114 ;--------------------------
      00A211 BB CD                  115     .word LINK 
                           002345   116     LINK=.
      00A213 88                     117     .byte 6 
      00A214 40 CD 86 11 CD 85      118     .ascii "CTINIT"
      00234C                        119 CTINIT:
      00A21A DA CD 86         [ 4]  120     CALL FPSTOR
      00A21D 21 CD 85         [ 4]  121     CALL UNLOCK
      00A220 36 A1 E0         [ 4]  122     CALL ZERO 
      00A223 CD 0A DE         [ 4]  123 1$: CALL ONEP 
      00A223 CD 85 BB         [ 4]  124     CALL DUPP 
      00A226 1C 00 0A         [ 4]  125     CALL INTQ 
      00A229 81 04 9A         [ 4]  126     CALL QBRAN 
      00A22A 23 6B                  127     .word 2$
      00A22A CD 8B CA         [ 4]  128     call WR_BYTE 
      00A22D 81 A1 A0         [ 4]  129     CALL BRAN 
      00A230 09 55                  130     .word 1$ 
      00A232 50 44 41         [ 4]  131 2$: CALL DDROP 
      00A235 54 2D 50         [ 4]  132     CALL LOCK 
      00A238 54               [ 4]  133     ret 
                                    134 
                                    135 ;--------------------------
                                    136 ; tool to initialize word table 
                                    137 ; WTINIT ( ad -- )
                                    138 ; ad is table address 
                                    139 ;--------------------------
      00A239 52 45                  140     .word LINK 
                           002374   141     LINK=.
      00A23A 06                     142     .byte 6 
      00A23A CD 9B F4 CD 86 07      143     .ascii "WTINIT"
      00237B                        144 WTINIT:
      00A240 CD 85 6A         [ 4]  145     CALL FPSTOR
      00A243 CD 87 72         [ 4]  146     CALL UNLOCK
      00A246 CD 85 53         [ 4]  147     CALL ZERO 
      00A249 CD 9B DE         [ 4]  148 1$: CALL ONEP 
      00A24C CD 86 07         [ 4]  149     CALL DUPP
      00A24F CD 85 6A         [ 4]  150     CALL INTQ
      00A252 CD 84 F1         [ 4]  151     CALL QBRAN 
      00A255 00 02                  152     .word 2$
      00A257 CD 88 40         [ 4]  153     call WR_WORD 
      00A25A CD 86 11         [ 4]  154     CALL BRAN 
      00A25D CD 87                  155     .word 1$ 
      00A25F 64 CD 85         [ 4]  156 2$: CALL DDROP 
      00A262 53 CD 87         [ 4]  157     CALL LOCK 
      00A265 90               [ 4]  158     ret 
                                    159 
                                    160 ;------------------------
                                    161 ; Prompted input for integer 
                                    162 ; display n+ in bracket and
                                    163 ; '?' 
                                    164 ; [N]? ( n+ -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



                                    165 ;------------------------
      00A266 CD 85                  166     .word LINK 
                           0023A3   167     LINK=.
      00A268 53                     168     .byte 4
      00A269 CD 9C 0E CD            169     .ascii "[N]?" 
      0023A8                        170 INTQ:
      00A26D 87 80 CD         [ 4]  171     CALL CR 
      00A270 85 53 CD         [ 4]  172     call DOLIT 
      00A273 9C 37                  173     .word '[
      00A275 81 A2 30         [ 4]  174     CALL EMIT 
      00A278 06 49 46         [ 4]  175     CALL DOT 
      00A27B 4D 4F 56         [ 4]  176     CALL  DOTQP
      00A27E 45                     177     .byte 3
      00A27F 5D 3F 20               178     .ascii "]? " 
      00A27F CD 87 31         [ 4]  179     CALL QUERY 
      00A282 CD 85 6A         [ 4]  180     call TOKEN 
      00A285 CD 85 1A         [ 2]  181     jp NUMBQ
                                    182 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



                                   4829 .endif
                           000001  4830 .if WANT_DOUBLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



                                   4831         .include "double.asm"
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
      0023C6                         30 nsign: ; a cntr -- a cntr f 
      00A288 A2 2A CD         [ 4]   31     CALL ZERO 
      00A28B 87 80 CD         [ 4]   32     CALL TOR  ; R: sign 
      00A28E 85 6A CD         [ 4]   33     CALL TOR  ; R: sign cntr 
      00A291 86 11 CD         [ 4]   34     CALL DUPP 
      00A294 9B F4 CD         [ 4]   35     CALL CAT 
      0023D5                         36     _DOLIT '-'
      00A297 86 07 CD         [ 4]    1     CALL DOLIT 
      00A29A 85 6A                    2     .word '-' 
      00A29C CD 85 DA         [ 4]   37     CALL EQUAL 
      0023DD                         38     _QBRAN nsign1 
      00A29F CD A1 9B         [ 4]    1     CALL QBRAN
      00A2A2 CD 85                    2     .word nsign1
      00A2A4 CE CC A1         [ 4]   39     CALL ONEP ; a+ 
      00A2A7 D7 A2 78         [ 4]   40     CALL RFROM 
      00A2AA 02 50 49         [ 4]   41     CALL ONEM ; cntr-
      00A2AD CD 05 3B         [ 4]   42     CALL RFROM ; sign 
      00A2AD 1D 00 04         [ 4]   43     CALL INVER ; -1
      00A2B0 90 AE 01         [ 4]   44     CALL TOR   ; R: sign 
      00A2B3 63 EF 02         [ 4]   45     CALL TOR   ; R: cntr 
      0023F7                         46 nsign1:
      00A2B6 90 AE 00         [ 4]   47     CALL RFROM 
      00A2B9 71 FF 81         [ 4]   48     CALL RFROM 
      00A2BC A2               [ 4]   49     RET 
                                     50 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



                                     51 
                                     52 ; get all digits in row 
                                     53 ; stop at first non-digit or end of string 
                                     54 ; ( dlo dhi a cntr -- dlo dhi [ a+ cntr- | a+ 0 ] )
      0023FE                         55 parse_digits:
      0023FE                         56 1$:
      00A2BD AA 05 53         [ 4]   57     CALL DUPP 
      002401                         58     _QBRAN 5$ 
      00A2C0 51 52 54         [ 4]    1     CALL QBRAN
      00A2C3 32 46                    2     .word 5$
      00A2C4 CD 05 5A         [ 4]   59     CALL TOR   ; dlo dhi a R: cntr 
      00A2C4 1D 00 04         [ 4]   60     CALL COUNT ; dlo dhi a+ char 
      00A2C7 90 AE 4C         [ 4]   61     CALL BASE 
      00A2CA 91 EF 02         [ 4]   62     CALL AT 
      00A2CD 90 AE 36         [ 4]   63     CALL DIGTQ 
      002415                         64     _QBRAN 4$ ; not a digit
      00A2D0 24 FF 81         [ 4]    1     CALL QBRAN
      00A2D3 A2 BE                    2     .word 4$
      00A2D5 05 53 51         [ 4]   65     CALL DTOR  ; dlo dhi R: cntr a+ c  
      00A2D8 52 54 33         [ 4]   66     CALL BASE 
      00A2DB CD 04 EA         [ 4]   67     CALL AT 
      00A2DB 1D 00 04         [ 4]   68     CALL DSSTAR
      00A2DE 90 AE 49         [ 4]   69     CALL RFROM 
      00A2E1 81 EF 02         [ 4]   70     CALL ZERO 
      00A2E4 90 AE 2A         [ 4]   71     CALL DPLUS 
      00A2E7 70 FF 81         [ 4]   72     CALL RFROM  ; dlo dhi a+ 
      00A2EA A2 D5 01         [ 4]   73     CALL RFROM ; dlo dhi a+ cntr 
      00A2ED 45 0A EB         [ 4]   74     CALL ONEM 
      00A2EE                         75     _BRAN 1$ ; dlo dhi a+ R: 
      00A2EE 1D 00 04         [ 4]    1     CALL BRAN 
      00A2F1 90 AE                    2     .word 1$ 
      00A2F3 6F FB EF         [ 4]   76 4$: CALL DROP  ; dlo dhi a+ 
      00A2F6 02 90 AE         [ 4]   77     CALL ONEM  ; unget char 
      00A2F9 29 32 FF         [ 4]   78     CALL RFROM ; dlo dhi a+ cntr-
      002446                         79 5$:
      00A2FC 81               [ 4]   80     RET 
                                     81 
                                     82 
                                     83 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     84 ;   NUMBER? (a -- s -1 |d -2 | a F )
                                     85 ;   convert string to integer 
                                     86 ;   double begin with '#' 
                                     87 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002447                         88     _HEADER NUMBQ,7,"NUMBER?"
      00A2FD A2 EC                    1         .word LINK 
                           002449     2         LINK=.
      00A2FF 06                       3         .byte 7  
      00A300 53 51 52 54 31 30 3F     4         .ascii "NUMBER?"
      00A306                          5         NUMBQ:
                                     89 ; save current base value 
      00A306 1D 00 04         [ 4]   90     CALL BASE 
      00A309 90 AE 59         [ 4]   91     CALL AT 
      00A30C 98 EF 02         [ 4]   92     CALL TOR 
                                     93 ; initialize integer to 0     
      00A30F 90 AE 1C         [ 2]   94     SUBW X,#4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      00A312 55 FF            [ 1]   95     CLRW Y 
      00A314 81               [ 2]   96     LDW (X),Y 
      00A315 A2 FF            [ 2]   97     LDW (2,X),Y ; a 0 0 R: base  
      002462                         98     _DOLIT 2 
      00A317 05 31 32         [ 4]    1     CALL DOLIT 
      00A31A 52 54                    2     .word 2 
      00A31C 32 0B A3         [ 4]   99     CALL PICK  ; a 0 0 a R: base    
      00A31D CD 0C 21         [ 4]  100     CALL COUNT ; a 0 0 a+ n 
                                    101 ; check for '#' double integer 
      00A31D 1D 00 04         [ 4]  102     CALL OVER  ; a 0 0 a+ n a+
      00A320 90 AE 68         [ 4]  103     CALL CAT   ; a 0 0 a+ n c 
      002473                        104     _DOLIT '#' ; a 0 0 a+ n c '#' 
      00A323 AD EF 02         [ 4]    1     CALL DOLIT 
      00A326 90 AE                    2     .word '#' 
      00A328 62 CD FF         [ 4]  105     CALL EQUAL 
      00A32B 81 A3 17         [ 4]  106     CALL TOR   ; a 0 0 a+ n R: base d? 
      00A32E 05 4C 4F         [ 4]  107     CALL RAT   ; a 0 0 a+ n d? R: base d?
      002481                        108     _QBRAN NUMQ0
      00A331 47 32 53         [ 4]    1     CALL QBRAN
      00A334 24 92                    2     .word NUMQ0
                                    109 ; update a and count
      00A334 1D 00 04         [ 4]  110     CALL SWAPP 
      00A337 90 AE 07         [ 4]  111     CALL ONEP 
      00A33A F8 EF 02         [ 4]  112     CALL SWAPP 
      00A33D 90 AE 2B         [ 4]  113     CALL ONEM  ; a 0 0 a+ n- R: base d?
                                    114 ; check for '$' hexadecimal  
      002492                        115 NUMQ0: 
      00A340 5F FF 81         [ 4]  116     CALL OVER   
      00A343 A3 2E 04         [ 4]  117     CALL CAT   
      002498                        118     _DOLIT '$'
      00A346 4C 4E 32         [ 4]    1     CALL DOLIT 
      00A349 53 24                    2     .word '$' 
      00A34A CD 08 61         [ 4]  119     CALL EQUAL ; a 0 0 a+ n- f  
      0024A0                        120     _QBRAN NUMQ1 
      00A34A 1D 00 04         [ 4]    1     CALL QBRAN
      00A34D 90 AE                    2     .word NUMQ1
      00A34F 01 E5 EF         [ 4]  121     CALL HEX   ; switch to hexadecimal base 
                                    122 ; update a and count 
      00A352 02 90 AE         [ 4]  123     CALL SWAPP 
      00A355 2C C8 FF         [ 4]  124     CALL ONEP 
      00A358 81 A3 45         [ 4]  125     CALL SWAPP
      00A35B 06 43 41         [ 4]  126     CALL ONEM ; a 0 0 a+ n-  R: base d?
                                    127 ; check for minus sign 
      0024B4                        128 NUMQ1: 
      00A35E 4C 4C 4F         [ 4]  129     CALL nsign 
      00A361 54 05 5A         [ 4]  130     CALL TOR ; R: base d? sign  
                                    131 ; check for end of string     
      00A362 CD 07 4E         [ 4]  132     CALL QDUP    ; a dlo dhi a+ cntr R: base d? sign 
      0024BD                        133     _QBRAN NUMQ4 ; yes , not a number 
      00A362 CD 87 80         [ 4]    1     CALL QBRAN
      00A365 CD 86                    2     .word NUMQ4
      00A367 11 CD 85         [ 4]  134     CALL parse_digits
      00A36A 6A CD 85         [ 4]  135     CALL QDUP 
      00A36D DA CD 8C         [ 4]  136     CALL ZEQUAL  
      0024CB                        137     _QBRAN NUMQ4 ; error not end of string  ( a dlo dhi a+ R: base d? sign )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00A370 3A CD 9C         [ 4]    1     CALL QBRAN
      00A373 37 CD                    2     .word NUMQ4
      00A375 85 BB CC         [ 4]  138     CALL DROP  ; a dlo dhi 
      00A378 8B CA A3         [ 4]  139     CALL RFROM  ; a dlo dhi sign 
      0024D6                        140     _QBRAN NUMQ3
      00A37B 5B 06 43         [ 4]    1     CALL QBRAN
      00A37E 54 41                    2     .word NUMQ3
      00A380 42 4C 45         [ 4]  141     CALL DNEGA
      00A383                        142 NUMQ3: 
      00A383 CD A3 62         [ 4]  143     CALL ROT ; dlo dhi a  R: base d?
      00A386 CC 99 39         [ 4]  144     CALL DROP
      0024E4                        145     _DOLIT -2  ; double return -2 flag 
      00A389 A3 7C 06         [ 4]    1     CALL DOLIT 
      00A38C 57 54                    2     .word -2 
      00A38E 41 42 4C         [ 4]  146     CALL RFROM ; dlo dhi d? R: base 
      0024EC                        147     _TBRAN NUMQ8 
      00A391 45 04 A8         [ 4]    1     CALL TBRAN 
      00A392 25 08                    2     .word NUMQ8 
      00A392 CD 8B 51         [ 4]  148     CALL SWAPP 
      00A395 CD A3 62         [ 4]  149     CALL DROP
      00A398 CC 99 39         [ 4]  150     CALL ONEP   ; single return -1 flag   
      0024FA                        151     _BRAN NUMQ8
      00A39B A3 8B 06         [ 4]    1     CALL BRAN 
      00A39E 43 54                    2     .word NUMQ8 
      0024FF                        152 NUMQ4: ; not end of string error , ( a dlo dhi a+ cntr R: base d? sign )
                           000001   153 .if WANT_FLOAT
      00A3A0 41 42 4C         [ 4]  154     CALL RFROM ; sign 
      00A3A3 40 05 3B         [ 4]  155     CALL RFROM ; d? 
      00A3A4 CD 2E A6         [ 4]  156     CALL FLOATQ ; ( a dlo dhi a+ cntr sign d? )    
                           000000   157 .else 
                                    158     ADDW X,#4 ; drop dhi a+  , ( a dlo R: base d? sign ) 
                                    159     ADDW SP,#4 ; drop d? sign  R: base 
                                    160     CLRW Y 
                                    161     LDW (X),Y ; dlo replaced by 0 ( -- a 0 R: base ) 
                                    162 .endif 
                                    163 ; restore original base value     
      002508                        164 NUMQ8: 
      00A3A4 CD 9B 7A         [ 4]  165     CALL RFROM 
      00A3A7 CD 9D 0C         [ 4]  166     CALL BASE 
      00A3AA CC 9D 49         [ 4]  167     CALL STORE 
      00A3AD A3               [ 4]  168     RET 
                                    169 
                                    170 
                                    171 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    172 ;    D0= ( d -- 0|-1 )
                                    173 ;    check if double is 0 
                                    174 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002512                        175     _HEADER DZEQUAL,3,"D0="
      00A3AE 9D 06                    1         .word LINK 
                           002514     2         LINK=.
      00A3B0 57                       3         .byte 3  
      00A3B1 54 41 42                 4         .ascii "D0="
      002518                          5         DZEQUAL:
      00A3B4 4C 40 04         [ 4]  176     CALL ORR 
      00A3B6 A6 FF            [ 1]  177     LD A,#0xFF
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00A3B6 CD 9B            [ 1]  178     LDW Y,X
      00A3B8 7A CD            [ 2]  179     LDW Y,(Y)
      00A3BA 8B 51 CD 9D      [ 2]  180     CPW Y,#0 
      00A3BE 0C CD            [ 1]  181     JREQ  ZEQ1
      00A3C0 9D               [ 1]  182     CLR A   ;false
      002528                        183 ZEQ1:
      00A3C1 27               [ 1]  184     LD     (X),A
      00A3C2 81 A3            [ 1]  185     LD (1,X),A
      00A3C4 AF               [ 4]  186 	RET     
                                    187     
                                    188 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    189 ;  2NEGATE ( d -- d )
                                    190 ;  negate double (2's complement)
                                    191 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00252C                        192     _HEADER DNEGAT,7,"2NEGATE"
      00A3C5 06 43                    1         .word LINK 
                           00252E     2         LINK=.
      00A3C7 54                       3         .byte 7  
      00A3C8 49 4E 49 54 41 54 45     4         .ascii "2NEGATE"
      00A3CC                          5         DNEGAT:
      00A3CC CD 9B 7A         [ 4]  193     CALL INVER
      00A3CF CD 9C B8         [ 4]  194     CALL SWAPP 
      00A3D2 CD 8B CA         [ 4]  195     CALL INVER 
      00A3D5 CD 8B            [ 1]  196     LDW  Y,X 
      00A3D7 5E CD            [ 2]  197     LDW Y,(Y)
      00A3D9 86 11 CD A4      [ 2]  198     ADDW Y,#1 
      00A3DD 28               [ 2]  199     LDW (X),Y 
      00A3DE CD 85            [ 1]  200     JRNC DNEG1 
      00A3E0 1A A3            [ 1]  201     LDW Y,X 
      00A3E2 EB CD 9D         [ 2]  202     LDW Y,(2,Y)
      00A3E5 63 CD 85 36      [ 2]  203     ADDW Y,#1
      00A3E9 A3 D5            [ 2]  204     LDW (2,X),Y 
      002555                        205 DNEG1:
      00A3EB CD 88 20         [ 4]  206     CALL SWAPP 
      00A3EE CD               [ 4]  207     RET      
                                    208 
                                    209 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    210 ;   DABS ( d -- d )
                                    211 ;   absolute value of double
                                    212 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002559                        213     _HEADER DABS,4,"DABS"
      00A3EF 9C E0                    1         .word LINK 
                           00255B     2         LINK=.
      00A3F1 81                       3         .byte 4  
      00A3F2 A3 C5 06 57              4         .ascii "DABS"
      002560                          5         DABS:
      00A3F6 54 49 4E         [ 4]  214     CALL DUPP 
      00A3F9 49 54 CA         [ 4]  215     CALL ZLESS 
      00A3FB                        216     _QBRAN DABS1 
      00A3FB CD 9B 7A         [ 4]    1     CALL QBRAN
      00A3FE CD 9C                    2     .word DABS1
      00A400 B8 CD 8B         [ 4]  217     CALL DNEGA 
      00256E                        218 DABS1:
      00A403 CA               [ 4]  219     RET 
                                    220 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



                                    221 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    222 ;  DSIGN ( d -- d f )
                                    223 ;  sign of double 
                                    224 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00256F                        225     _HEADER DSIGN,5,"DSIGN"
      00A404 CD 8B                    1         .word LINK 
                           002571     2         LINK=.
      00A406 5E                       3         .byte 5  
      00A407 CD 86 11 CD A4           4         .ascii "DSIGN"
      002577                          5         DSIGN:
      00A40C 28 CD            [ 1]  226     LD A,#0 
      00A40E 85 1A            [ 1]  227     LDW Y,X 
      00A410 A4 1A            [ 2]  228     LDW Y,(Y)
      00A412 CD 9D            [ 1]  229     JRPL DSIGN1
      00A414 88 CD            [ 1]  230     LD A,#0XFF 
      002581                        231 DSIGN1:
      00A416 85 36 A4         [ 2]  232     SUBW X,#2 
      00A419 04               [ 1]  233     LD (X),A 
      00A41A CD 88            [ 1]  234     LD (1,X),A 
      00A41C 20               [ 4]  235     RET 
                                    236 
                                    237 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    238 ;   D/MOD ( d s - r qd )
                                    239 ;   unsigned divide double by single 
                                    240 ;   return double quotient 
                                    241 ;   and single remainder 
                                    242 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002588                        243     _HEADER DSLMOD,5,"D/MOD"
      00A41D CD 9C                    1         .word LINK 
                           00258A     2         LINK=.
      00A41F E0                       3         .byte 5  
      00A420 81 A3 F4 04 5B           4         .ascii "D/MOD"
      002590                          5         DSLMOD:
      00A425 4E 5D            [ 1]  244         LDW     Y,X             ; stack pointer to Y
      00A427 3F               [ 2]  245         LDW     X,(X)           ; un
      00A428 BF 26            [ 2]  246         LDW     YTEMP,X         ; save un
      00A428 CD               [ 1]  247         LDW     X,Y
      00A429 8F               [ 2]  248         PUSHW   X               ; save stack pointer
      00A42A 59 CD            [ 2]  249         PUSHW   Y 
      00A42C 84 F1            [ 2]  250         LDW     X,(2,X)           ; X=udh
      00A42E 00 5B CD         [ 2]  251         LDW     Y,YTEMP         ; divisor 
      00A431 84               [ 2]  252         DIVW    X,Y 
      00A432 B6 CD            [ 2]  253         LDW     XTEMP,X         ; QUOTIENT hi 
      00A434 90               [ 1]  254         LDW     X,Y             ; remainder in X 
      00A435 12 CD            [ 2]  255         POPW    Y 
      00A437 8F 98 03         [ 2]  256         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      00A43A 5D 3F            [ 1]  257         LD      A,#16           ; loop count
      00A43C 20 CD            [ 2]  258         SLLW    Y               ; udl shift udl into udh
      0025AB                        259 DSLMOD3:
      00A43E 93               [ 2]  260         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      00A43F A1 CD            [ 1]  261         JRC     DSLMODa         ; if carry out of rotate
      00A441 91 CC            [ 2]  262         CPW     X,YTEMP         ; compare udh to un
      00A443 CC A4            [ 1]  263         JRULT   DSLMOD4         ; can't subtract
      0025B2                        264 DSLMODa:
      00A445 D1 B0 00 26      [ 2]  265         SUBW    X,YTEMP         ; can subtract
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00A446 98               [ 1]  266         RCF
      0025B7                        267 DSLMOD4:
      00A446 CD               [ 1]  268         CCF                     ; quotient bit
      00A447 8B CA            [ 2]  269         RLCW    Y               ; rotate into quotient, rotate out udl
      00A449 CD               [ 1]  270         DEC     A               ; repeat
      00A44A 85 DA            [ 1]  271         JRNE    DSLMOD3           ; if A == 0
      0025BD                        272 DSLMODb:
      00A44C CD 85            [ 2]  273         LDW     YTEMP,X         ; done, save remainder
      00A44E DA               [ 2]  274         POPW    X               ; restore stack pointer
      00A44F CD 86            [ 2]  275         LDW     (2,X),Y           ; save quotient low 
      00A451 11 CD 85         [ 2]  276         LDW     Y,XTEMP         ; quotient hi 
      00A454 88               [ 2]  277         LDW     (X),Y           ; save quotient hi 
      00A455 CD 84 F1         [ 2]  278         LDW     Y,YTEMP         ; remainder onto stack
      00A458 00 2D            [ 2]  279         LDW     (4,X),Y
      00A45A CD               [ 4]  280         RET 
                                    281 
                                    282 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    283 ;   D# ( d -- d )
                                    284 ;   extract least digit 
                                    285 ;   from double integer 
                                    286 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025CC                        287     _HEADER DDIG,2,"D#"
      00A45B 88 E1                    1         .word LINK 
                           0025CE     2         LINK=.
      00A45D CD                       3         .byte 2  
      00A45E 85 1A                    4         .ascii "D#"
      0025D1                          5         DDIG:
      00A460 A4 77 CD         [ 4]  288     CALL BASE 
      00A463 8B 5E CD         [ 4]  289     CALL AT 
      00A466 85 BB CD         [ 4]  290     CALL DSLMOD
      00A469 8B 6B CD         [ 4]  291     CALL ROT   
      00A46C 85 BB CD         [ 4]  292     CALL DIGIT 
      00A46F 88 5A CD         [ 4]  293     CALL HOLD 
      00A472 85               [ 4]  294     RET 
                                    295 
                                    296 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    297 ;    D#S ( d -- s )
                                    298 ;   extract digit from double 
                                    299 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025E4                        300     _HEADER DDIGS,3,"D#S"
      00A473 DA CD                    1         .word LINK 
                           0025E6     2         LINK=.
      00A475 85                       3         .byte 3  
      00A476 DA 23 53                 4         .ascii "D#S"
      00A477                          5         DDIGS:
      00A477 CD 85 BB         [ 4]  301     CALL    DDIG 
      00A47A CD 85 BB         [ 4]  302     CALL    DDUP 
      00A47D 81 25 18         [ 4]  303     CALL    DZEQUAL
      00A47E                        304     _QBRAN  DDIGS 
      00A47E CD 04 9A         [ 4]    1     CALL QBRAN
      00A47E CD 86                    2     .word DDIGS
      00A480 11 CD 85         [ 4]  305     CALL    DROP 
      00A483 1A               [ 4]  306     RET 
                                    307 
                                    308 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



                                    309 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    310 ;   D. ( d -- )
                                    311 ;   display double integer 
                                    312 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025FC                        313     _HEADER DDOT,2,"D."
      00A484 A4 C6                    1         .word LINK 
                           0025FE     2         LINK=.
      00A486 CD                       3         .byte 2  
      00A487 85 DA                    4         .ascii "D."
      002601                          5         DDOT:
      00A489 CD 8C A1         [ 4]  314     CALL SPACE 
      00A48C CD 86 E1         [ 4]  315     CALL DSIGN 
      00A48F CD 85 6A         [ 4]  316     CALL TOR
      00A492 CD 8E 99         [ 4]  317     CALL RAT 
      00260D                        318     _QBRAN DDOT0
      00A495 CD 85 1A         [ 4]    1     CALL QBRAN
      00A498 A4 BD                    2     .word DDOT0
      00A49A CD A8 7E         [ 4]  319     CALL DNEGA 
      002615                        320 DDOT0:     
      00A49D CD 86 E1         [ 4]  321     CALL BDIGS 
      00A4A0 CD 85 6A         [ 4]  322     CALL DDIGS 
      00A4A3 CD A6 B8         [ 4]  323     CALL RFROM 
      00261E                        324     _QBRAN DDOT1 
      00A4A6 CD 85 BB         [ 4]    1     CALL QBRAN
      00A4A9 CD 8B                    2     .word DDOT1
      002623                        325     _DOLIT '-' 
      00A4AB CA CD AB         [ 4]    1     CALL DOLIT 
      00A4AE 45 CD                    2     .word '-' 
      00A4B0 85 BB CD         [ 4]  326     CALL HOLD 
      00262B                        327 DDOT1: 
      00A4B3 85 BB CD         [ 4]  328     CALL EDIGS 
      00A4B6 8B 6B CD         [ 4]  329     CALL TYPES     
      00A4B9 85               [ 4]  330     RET 
                                    331 
                                    332 
                                    333 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    334 ; multiply double by single 
                                    335 ; return double 
                                    336 ;  ( d s -- d )
                                    337 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002632                        338     _HEADER DSSTAR,3,"DS*"
      00A4BA 36 A4                    1         .word LINK 
                           002634     2         LINK=.
      00A4BC 7E                       3         .byte 3  
      00A4BD CD 86 07                 4         .ascii "DS*"
      002638                          5         DSSTAR:
                                    339 ;DSSTAR:
      00A4C0 CD 8B 6B         [ 4]  340     CALL TOR
      00A4C3 CD 85 BB         [ 4]  341     CALL DUPP 
      00A4C6 CD 05 CA         [ 4]  342     CALL ZLESS
      00A4C6 81 A4 23         [ 4]  343     CALL DUPP 
      00A4C9 07 4E 55         [ 4]  344     CALL TOR 
      002647                        345     _QBRAN DSSTAR1 
      00A4CC 4D 42 45         [ 4]    1     CALL QBRAN
      00A4CF 52 3F                    2     .word DSSTAR1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      00A4D1 CD 07 FD         [ 4]  346     CALL DNEGA 
      00264F                        347 DSSTAR1:
      00A4D1 CD 86 E1         [ 4]  348     CALL RFROM 
      00A4D4 CD 85 6A         [ 4]  349     CALL NROT       
      00A4D7 CD 85 DA         [ 4]  350     CALL SWAPP 
      00A4DA 1D 00 04         [ 4]  351     CALL RAT 
      00A4DD 90 5F FF         [ 4]  352     CALL UMSTA
      00A4E0 EF 02 CD         [ 4]  353     CALL ROT 
      00A4E3 84 F1 00         [ 4]  354     CALL RFROM 
      00A4E6 02 CD 8C         [ 4]  355     CALL UMSTA 
      00A4E9 23 CD 8C         [ 4]  356     CALL DROP ; DROP OVERFLOW 
      00A4EC A1 CD 86         [ 4]  357     CALL PLUS 
      00A4EF 3B CD 85         [ 4]  358     CALL ROT 
      002670                        359     _QBRAN DSSTAR3 
      00A4F2 88 CD 84         [ 4]    1     CALL QBRAN
      00A4F5 F1 00                    2     .word DSSTAR3
      00A4F7 23 CD 88         [ 4]  360     CALL DNEGA 
      002678                        361 DSSTAR3:
      00A4FA E1               [ 4]  362     RET 
                                    363 
                                    364 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    365 ;  2SWAP ( d1 d2 -- d2 d1 )
                                    366 ;  swap double 
                                    367 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002679                        368     _HEADER DSWAP,5,"2SWAP"
      00A4FB CD 85                    1         .word LINK 
                           00267B     2         LINK=.
      00A4FD DA                       3         .byte 5  
      00A4FE CD 85 CE CD 85           4         .ascii "2SWAP"
      002681                          5         DSWAP:
      00A503 1A A5            [ 1]  369     LDW Y,X 
      00A505 12 CD            [ 2]  370     LDW Y,(Y)
      00A507 86 21 CD         [ 2]  371     LDW YTEMP,Y ; d2 hi 
      00A50A 8B 5E            [ 1]  372     LDW Y,X 
      00A50C CD 86 21         [ 2]  373     LDW Y,(2,Y)
      00A50F CD 8B 6B         [ 2]  374     LDW XTEMP,Y  ; d2 lo 
      00A512 90 93            [ 1]  375     LDW Y,X 
      00A512 CD 86 3B         [ 2]  376     LDW Y,(4,Y)  ; d1 hi 
      00A515 CD               [ 2]  377     LDW (X),Y 
      00A516 85 88            [ 1]  378     LDW Y,X
      00A518 CD 84 F1         [ 2]  379     LDW Y,(6,Y)  ; d1 lo 
      00A51B 00 24            [ 2]  380     LDW (2,X),Y
      00A51D CD 88 E1         [ 2]  381     LDW Y,YTEMP  
      00A520 CD 85            [ 2]  382     LDW (4,X),Y 
      00A522 1A A5 34         [ 2]  383     LDW Y,XTEMP 
      00A525 CD 8E            [ 2]  384     LDW (6,X),Y 
      00A527 70               [ 4]  385     RET 
                                    386 
                                    387 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    388 ;    DCLZ ( d -- u )
                                    389 ;    double count leading zeros
                                    390 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026A8                        391     _HEADER DCLZ,4,"DCLZ"
      00A528 CD 86                    1         .word LINK 
                           0026AA     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      00A52A 21                       3         .byte 4  
      00A52B CD 8B 5E CD              4         .ascii "DCLZ"
      0026AF                          5         DCLZ:
      00A52F 86               [ 1]  392     CLR A 
      00A530 21 CD            [ 1]  393     LDW Y,X 
      00A532 8B 6B            [ 2]  394     LDW Y,(Y)
      00A534 2B 18            [ 1]  395     JRMI DCLZ8 ; no leading zero 
      00A534 CD A4            [ 1]  396     JREQ DCLZ4 ; >=16 
      0026B8                        397 DCLZ1: ; <16
      00A536 46 CD            [ 2]  398     SLLW Y
      00A538 85               [ 1]  399     INC A 
      00A539 DA CD            [ 2]  400     TNZW Y 
      00A53B 87 CE            [ 1]  401     JRMI DCLZ8
      00A53D CD 85            [ 2]  402     JRA DCLZ1 
      0026C1                        403 DCLZ4:
      00A53F 1A A5            [ 1]  404     LD A,#16 
      00A541 7F CD            [ 1]  405     LDW Y,X 
      00A543 A4 7E CD         [ 2]  406     LDW Y,(2,Y)
      00A546 87 CE            [ 1]  407     JRMI DCLZ8 
      00A548 CD 86            [ 1]  408     JRNE DCLZ1 
      00A54A 5C CD            [ 1]  409     ADD A,#16
      0026CE                        410 DCLZ8: 
      00A54C 85 1A A5         [ 2]  411     ADDW X,#2 
      00A54F 7F CD            [ 1]  412     CLRW Y 
      00A551 86 07            [ 1]  413     LD YL,A 
      00A553 CD               [ 2]  414     LDW (X),Y 
      00A554 85               [ 4]  415     RET 
                                    416 
                                    417 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    418 ;   2<ROT ( d1 d2 d3 -- d3 d1 d2 )
                                    419 ;   rotate left doubles 
                                    420 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026D7                        421     _HEADER NDROT,5,"2<ROT"
      00A555 BB CD                    1         .word LINK 
                           0026D9     2         LINK=.
      00A557 85                       3         .byte 5  
      00A558 1A A5 5E CD 88           4         .ascii "2<ROT"
      0026DF                          5         NDROT:
                                    422 ; save d3 in temp 
      00A55D 7D 93            [ 1]  423     LDW Y,X 
      00A55E 90 FE            [ 2]  424     LDW Y,(Y)
      00A55E CD 87 DF         [ 2]  425     LDW YTEMP,Y  ; d3 hi 
      00A561 CD 86            [ 1]  426     LDW Y,X 
      00A563 07 CD 84         [ 2]  427     LDW Y,(2,Y)
      00A566 F1 FF FE         [ 2]  428     LDW XTEMP,Y  ; d3 lo 
                                    429 ; put d2 in d1 slot 
      00A569 CD 85            [ 1]  430     LDW Y,X 
      00A56B BB CD 85         [ 2]  431     LDW Y,(4,Y) 
      00A56E 28               [ 2]  432     LDW (X),Y   ; d2 hi 
      00A56F A5 88            [ 1]  433     LDW Y,X 
      00A571 CD 86 21         [ 2]  434     LDW Y,(6,Y)
      00A574 CD 86            [ 2]  435     LDW (2,X),Y ; d2 lo
                                    436 ; put d1 in d2 slot 
      00A576 07 CD            [ 1]  437     LDW Y,X 
      00A578 8B 5E CD         [ 2]  438     LDW Y,(8,Y) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      00A57B 85 36            [ 2]  439     LDW (4,X),Y ; d1 hi 
      00A57D A5 88            [ 1]  440     LDW Y,X 
      00A57F 90 EE 0A         [ 2]  441     LDW Y,(10,Y)
      00A57F CD 85            [ 2]  442     LDW (6,X),Y  ; d1 lo 
                                    443 ; put d3 in d1 slot 
      00A581 BB CD 85         [ 2]  444     LDW Y,YTEMP 
      00A584 BB CD            [ 2]  445     LDW (8,X),Y  ; d3 hi 
      00A586 AF 26 24         [ 2]  446     LDW Y,XTEMP 
      00A588 EF 0A            [ 2]  447     LDW (10,X),Y  ; d3 lo 
      00A588 CD               [ 4]  448     RET 
                                    449 
                                    450 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    451 ;   2ROT ( d1 d2 d3 -- d2 d3 d1 )
                                    452 ;   rotate right doubles 
                                    453 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002714                        454     _HEADER DROT,4,"2ROT"
      00A589 85 BB                    1         .word LINK 
                           002716     2         LINK=.
      00A58B CD                       3         .byte 4  
      00A58C 86 E1 CD 85              4         .ascii "2ROT"
      00271B                          5         DROT:
                                    455 ; save d3 in temp 
      00A590 53 81            [ 1]  456     LDW Y,X 
      00A592 A4 C9            [ 2]  457     LDW Y,(Y)
      00A594 03 44 30         [ 2]  458     LDW YTEMP,Y ; d3 hi 
      00A597 3D 93            [ 1]  459     LDW Y,X 
      00A598 90 EE 02         [ 2]  460     LDW Y,(2,Y)
      00A598 CD 86 84         [ 2]  461     LDW XTEMP,Y ; d3 lo 
                                    462 ; put d1 in d3 slot 
      00A59B A6 FF            [ 1]  463     LDW Y,X 
      00A59D 90 93 90         [ 2]  464     LDW Y,(8,Y)
      00A5A0 FE               [ 2]  465     LDW (X),Y  ; d1 hi 
      00A5A1 90 A3            [ 1]  466     LDW Y,X 
      00A5A3 00 00 27         [ 2]  467     LDW Y,(10,Y) 
      00A5A6 01 4F            [ 2]  468     LDW (2,X),Y ; d1 lo 
                                    469 ; put d2 in d1 slot 
      00A5A8 90 93            [ 1]  470     LDW Y,X 
      00A5A8 F7 E7 01         [ 2]  471     LDW Y,(4,Y) ; d2 hi 
      00A5AB 81 A5            [ 2]  472     LDW (8,X),Y 
      00A5AD 94 07            [ 1]  473     LDW Y,X 
      00A5AF 32 4E 45         [ 2]  474     LDW Y,(6,Y) ; d2 lo 
      00A5B2 47 41            [ 2]  475     LDW (10,X),Y 
                                    476 ; put d3 in d2 slot 
      00A5B4 54 45 26         [ 2]  477     LDW Y,YTEMP 
      00A5B6 EF 04            [ 2]  478     LDW (4,X),Y 
      00A5B6 CD 88 5A         [ 2]  479     LDW Y,XTEMP 
      00A5B9 CD 86            [ 2]  480     LDW (6,X),Y 
      00A5BB 21               [ 4]  481     RET 
                                    482 
                                    483 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    484 ;   D= ( d1 d2 -- f )
                                    485 ;   d1==d2?
                                    486 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002750                        487     _HEADER DEQUAL,2,"D="
      00A5BC CD 88                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



                           002752     2         LINK=.
      00A5BE 5A                       3         .byte 2  
      00A5BF 90 93                    4         .ascii "D="
      002755                          5         DEQUAL:
      00A5C1 90 FE            [ 1]  488     LD A,#0 
      00A5C3 72 A9            [ 1]  489     LDW Y,X 
      00A5C5 00 01            [ 2]  490     LDW Y,(Y)
      00A5C7 FF 24            [ 2]  491     CPW Y,(4,X)
      00A5C9 0B 90            [ 1]  492     JRNE DEQU4 
      00A5CB 93 90            [ 1]  493     LDW Y,X 
      00A5CD EE 02 72         [ 2]  494     LDW Y,(2,Y)
      00A5D0 A9 00            [ 2]  495     CPW Y,(6,X)
      00A5D2 01 EF            [ 1]  496     JRNE DEQU4 
      00A5D4 02 FF            [ 1]  497     LD A,#0XFF
      00A5D5                        498 DEQU4:
      00A5D5 CD 86 21         [ 2]  499     ADDW X,#6
      00A5D8 81               [ 1]  500     LD (X),A 
      00A5D9 A5 AE            [ 1]  501     LD (1,X),A 
      00A5DB 04               [ 4]  502     RET 
                                    503 
                                    504 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    505 ;   D> ( d1 d2 -- f )
                                    506 ;   d1>d2?
                                    507 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002771                        508     _HEADER DGREAT,2,"D>"
      00A5DC 44 41                    1         .word LINK 
                           002773     2         LINK=.
      00A5DE 42                       3         .byte 2  
      00A5DF 53 3E                    4         .ascii "D>"
      00A5E0                          5         DGREAT:
      00A5E0 CD 86            [ 1]  509     LD A,#0XFF 
      00A5E2 11 CD            [ 1]  510     LDW Y,X 
      00A5E4 86 4A CD         [ 2]  511     LDW Y,(4,Y)  ; d1 hi 
      00A5E7 85               [ 2]  512     CPW Y,(X)    ; d2 hi 
      00A5E8 1A A5            [ 1]  513     JRSGT DGREAT4 
      00A5EA EE CD            [ 1]  514     LDW Y,X 
      00A5EC 88 7D 06         [ 2]  515     LDW Y,(6,Y)
      00A5EE E3 02            [ 2]  516     CPW Y,(2,X)
      00A5EE 81 A5            [ 1]  517     JRUGT DGREAT4 
      00A5F0 DB 05            [ 1]  518     LD A,#0
      00278B                        519 DGREAT4:
      00A5F2 44 53 49         [ 2]  520     ADDW X,#6
      00A5F5 47               [ 1]  521     LD (X),A 
      00A5F6 4E 01            [ 1]  522     LD (1,X),A 
      00A5F7 81               [ 4]  523     RET
                                    524 
                                    525 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    526 ;   D< ( d1 d2 -- f )
                                    527 ;   d1<d2? 
                                    528 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002792                        529     _HEADER DLESS,2,"D<"
      00A5F7 A6 00                    1         .word LINK 
                           002794     2         LINK=.
      00A5F9 90                       3         .byte 2  
      00A5FA 93 90                    4         .ascii "D<"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      002797                          5         DLESS:
      00A5FC FE 2A 02         [ 4]  530     CALL DSUB
      00279A                        531     _DOLIT 0 
      00A5FF A6 FF 71         [ 4]    1     CALL DOLIT 
      00A601 00 00                    2     .word 0 
      00A601 1D 00 02         [ 4]  532     CALL NROT  
      00A604 F7 E7 01         [ 4]  533     CALL DZLESS 
      0027A5                        534     _QBRAN DLESS4
      00A607 81 A5 F1         [ 4]    1     CALL QBRAN
      00A60A 05 44                    2     .word DLESS4
      00A60C 2F 4D 4F         [ 4]  535     CALL INVER  
      0027AD                        536 DLESS4:
      00A60F 44               [ 4]  537     RET
                                    538 
                                    539 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    540 ;  D0< ( d -- f )
                                    541 ;  d<0? 
                                    542 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00A610                        543     _HEADER DZLESS,3,"D0<"
      00A610 90 93                    1         .word LINK 
                           0027B0     2         LINK=.
      00A612 FE                       3         .byte 3  
      00A613 BF 26 93                 4         .ascii "D0<"
      0027B4                          5         DZLESS:
      00A616 89 90            [ 1]  544     LD A,#0 
      00A618 89 EE            [ 1]  545     LDW Y,X 
      00A61A 02 90            [ 2]  546     LDW Y,(Y)
      00A61C BE 26            [ 1]  547     JRPL DZLESS1 
      00A61E 65 BF            [ 1]  548     LD A,#0XFF 
      0027BE                        549 DZLESS1:
      00A620 24 93 90         [ 2]  550     ADDW X,#2 
      00A623 85               [ 1]  551     LD (X),A 
      00A624 90 EE            [ 1]  552     LD (1,X),A    
      00A626 04               [ 4]  553     RET 
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
      0027C5                        565     _HEADER DCMP,4,"DCMP"
      00A627 A6 10                    1         .word LINK 
                           0027C7     2         LINK=.
      00A629 90                       3         .byte 4  
      00A62A 58 43 4D 50              4         .ascii "DCMP"
      00A62B                          5         DCMP:
      00A62B 59 25            [ 1]  566     LDW Y,X 
      00A62D 04 B3 26         [ 2]  567     LDW Y,(4,Y)
      00A630 25               [ 2]  568     CPW Y,(X) 
      00A631 05 04            [ 1]  569     JREQ DCMP2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      00A632 2F 13            [ 1]  570     JRSLT DCMP_SMALL 
      00A632 72 B0            [ 2]  571     JRA  DCMP_GREAT 
      0027D8                        572 DCMP2:    
      00A634 00 26            [ 1]  573     LDW Y,X 
      00A636 98 EE 06         [ 2]  574     LDW Y,(6,Y)
      00A637 E3 02            [ 2]  575     CPW Y,(2,X)
      00A637 8C 90            [ 1]  576     JREQ DCMP_EQUAL  
      00A639 59 4A            [ 1]  577     JRULT DCMP_SMALL 
      00A63B 26 EE            [ 2]  578     JRA DCMP_GREAT
      00A63D                        579 DCMP_EQUAL:
      00A63D BF 26            [ 1]  580     CLRW Y 
      00A63F 85 EF            [ 2]  581     JRA DCMP4 
      0027E9                        582 DCMP_SMALL:
      00A641 02 90 BE 24      [ 2]  583     LDW Y,#-1 
      00A645 FF 90            [ 2]  584     JRA DCMP4 
      0027EF                        585 DCMP_GREAT:
      00A647 BE 26 EF 04      [ 2]  586     LDW Y,#1
      0027F3                        587 DCMP4:
      00A64B 81 A6 0A         [ 2]  588     SUBW X,#2 
      00A64E 02               [ 2]  589     LDW (X),Y 
      00A64F 44               [ 4]  590     RET
                                    591 
                                    592 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    593 ;   2>R ( d -- R: d )
                                    594 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027F8                        595     _HEADER DTOR,3,"2>R"
      00A650 23 C7                    1         .word LINK 
                           0027FA     2         LINK=.
      00A651 03                       3         .byte 3  
      00A651 CD 86 E1                 4         .ascii "2>R"
      0027FE                          5         DTOR:
      00A654 CD 85            [ 2]  596     POPW Y 
      00A656 6A CD A6         [ 2]  597     LDW YTEMP,Y 
      00A659 10 CD            [ 1]  598     LDW Y,X 
      00A65B 87 DF CD         [ 2]  599     LDW Y,(2,Y)
      00A65E 8D 99            [ 2]  600     PUSHW Y   ; d low 
      00A660 CD 8D            [ 1]  601     LDW Y,X 
      00A662 E5 81            [ 2]  602     LDW Y,(Y)
      00A664 A6 4E            [ 2]  603     PUSHW Y   ; d hi 
      00A666 03 44 23         [ 2]  604     ADDW X,#4  
      00A669 53 CC 26         [ 5]  605     JP [YTEMP]
                                    606 
                                    607 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    608 ;  2R> ( -- d ) R: d --      
                                    609 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00A66A                        610     _HEADER DRFROM,3,"2R>"
      00A66A CD A6                    1         .word LINK 
                           002818     2         LINK=.
      00A66C 51                       3         .byte 3  
      00A66D CD 88 2B                 4         .ascii "2R>"
      00281C                          5         DRFROM:
      00A670 CD A5            [ 2]  611     POPW Y      ; d hi 
      00A672 98 CD 85         [ 2]  612     LDW YTEMP,Y 
      00A675 1A A6 6A         [ 2]  613     SUBW X,#4
      00A678 CD 86            [ 2]  614     POPW Y       ; d hi 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      00A67A 07               [ 2]  615     LDW (X),Y 
      00A67B 81 A6            [ 2]  616     POPW Y       ; d low  
      00A67D 66 02            [ 2]  617     LDW (2,X),Y 
      00A67F 44 2E 26         [ 5]  618     JP [YTEMP]
                                    619     
                                    620 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    621 ;   2R@ ( -- d )
                                    622 ;   fecth a double from RSTACK
                                    623 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00A681                        624     _HEADER DRAT,3,"2R@"
      00A681 CD 8F                    1         .word LINK 
                           002830     2         LINK=.
      00A683 11                       3         .byte 3  
      00A684 CD A5 F7                 4         .ascii "2R@"
      002834                          5         DRAT:
      00A687 CD 85            [ 2]  625     POPW Y 
      00A689 DA CD 85         [ 2]  626     LDW YTEMP,Y 
      00A68C CE CD 85         [ 2]  627     SUBW X,#4 
      00A68F 1A A6            [ 2]  628     LDW Y,(1,SP)
      00A691 95               [ 2]  629     LDW (X),Y 
      00A692 CD 88            [ 2]  630     LDW Y,(3,SP)
      00A694 7D 02            [ 2]  631     LDW (2,X),Y 
      00A695 92 CC 26         [ 5]  632     JP [YTEMP]
                                    633 
                                    634 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    635 ;  2VARIABLE <name> 
                                    636 ;  create a double variable 
                                    637 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002846                        638     _HEADER DVARIA,9,"2VARIABLE"
      00A695 CD 8D                    1         .word LINK 
                           002848     2         LINK=.
      00A697 D5                       3         .byte 9  
      00A698 CD A6 6A CD 85 BB CD     4         .ascii "2VARIABLE"
             85 1A
      002852                          5         DVARIA:
      00A6A1 A6 AB CD         [ 4]  639         CALL HERE
      00A6A4 84 F1 00         [ 4]  640         CALL DUPP
      002858                        641         _DOLIT 4  
      00A6A7 2D CD 8D         [ 4]    1     CALL DOLIT 
      00A6AA E5 04                    2     .word 4 
      00A6AB CD 07 C0         [ 4]  642         CALL PLUS 
      00A6AB CD 8E 3A         [ 4]  643         CALL VPP 
      00A6AE CD 8F 3B         [ 4]  644         CALL STORE
      00A6B1 81 A6 7E         [ 4]  645         CALL CREAT
      00A6B4 03 44 53         [ 4]  646         CALL DUPP
      00A6B7 2A 14 92         [ 4]  647         CALL COMMA
      00A6B8 CD 0B 4A         [ 4]  648         CALL ZERO
      00A6B8 CD 85 DA         [ 4]  649         CALL OVER 
      00A6BB CD 86 11         [ 4]  650         CALL STORE 
      00A6BE CD 86 4A         [ 4]  651         CALL ZERO 
      00A6C1 CD 86 11         [ 4]  652         CALL SWAPP 
      00A6C4 CD 85 DA         [ 4]  653         CALL STORE
      00A6C7 CD 85 1A         [ 4]  654         CALL FMOVE ; move definition to FLASH
      00A6CA A6 CF CD         [ 4]  655         CALL QDUP 
      00A6CD 88 7D 9A         [ 4]  656         CALL QBRAN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      00A6CF 18 6D                  657         .word SET_RAMLAST   
      00A6CF CD 85 BB         [ 4]  658         call UPDATVP  ; don't update if variable kept in RAM.
      00A6D2 CD 87 FE         [ 4]  659         CALL UPDATPTR
      00A6D5 CD               [ 4]  660         RET         
                                    661 
                                    662 
                                    663 
                                    664 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    665 ;  2LITERAL ( d -- )
                                    666 ;  compile double literal 
                                    667 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002893                        668     _HEADER DLITER,IMEDD+8,"2LITERAL"
      00A6D6 86 21                    1         .word LINK 
                           002895     2         LINK=.
      00A6D8 CD                       3         .byte IMEDD+8  
      00A6D9 85 CE CD 8A 93 CD 87     4         .ascii "2LITERAL"
             DF
      00289E                          5         DLITER:
      00A6E1 CD 85 BB         [ 4]  669     CALL COMPI 
      00A6E4 CD 8A                  670     .word do2lit 
      00A6E6 93 CD 86         [ 4]  671     CALL COMMA 
      00A6E9 07 CD 88         [ 2]  672     JP   COMMA 
                                    673 
                                    674 
                                    675 ; runtime for 2LITERAL 
      0028A9                        676 do2lit:
      00A6EC 40 CD 87         [ 2]  677     SUBW X,#4 
      00A6EF DF CD            [ 2]  678     LDW Y,(1,SP)
      00A6F1 85 1A            [ 2]  679     LDW Y,(Y)
      00A6F3 A6               [ 2]  680     LDW (X),Y 
      00A6F4 F8 CD            [ 2]  681     LDW Y,(1,SP)
      00A6F6 88 7D 02         [ 2]  682     LDW Y,(2,Y)
      00A6F8 EF 02            [ 2]  683     LDW (2,X),Y 
      00A6F8 81 A6            [ 2]  684     POPW Y 
      00A6FA B4 05 32         [ 2]  685     JP (4,Y)
                                    686 
                                    687 
                                    688 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    689 ;   2OVER ( d1 d2 -- d1 d2 d1 )
                                    690 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028BD                        691     _HEADER DOVER,5,"2OVER"
      00A6FD 53 57                    1         .word LINK 
                           0028BF     2         LINK=.
      00A6FF 41                       3         .byte 5  
      00A700 50 4F 56 45 52           4         .ascii "2OVER"
      00A701                          5         DOVER:
      00A701 90 93            [ 1]  692     LDW Y,X 
      00A703 90 FE 90         [ 2]  693     SUBW X,#4 
      00A706 BF 26            [ 2]  694     PUSHW Y 
      00A708 90 93 90         [ 2]  695     LDW Y,(4,Y)  ; d1 hi 
      00A70B EE               [ 2]  696     LDW (X),Y 
      00A70C 02 90            [ 2]  697     POPW Y 
      00A70E BF 24 90         [ 2]  698     LDW Y,(6,Y)  ;d1 lo 
      00A711 93 90            [ 2]  699     LDW (2,X),Y 
      00A713 EE               [ 4]  700     RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



                                    701 
                                    702 
                                    703 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    704 ;   D2/ ( d -- d/2 )
                                    705 ;   divide double by 2 
                                    706 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028D8                        707     _HEADER D2SLASH,3,"D2/"
      00A714 04 FF                    1         .word LINK 
                           0028DA     2         LINK=.
      00A716 90                       3         .byte 3  
      00A717 93 90 EE                 4         .ascii "D2/"
      0028DE                          5         D2SLASH:
      00A71A 06 EF            [ 1]  708     LDW Y,X 
      00A71C 02 90            [ 2]  709     LDW Y,(Y)
      00A71E BE 26            [ 2]  710     SRAW Y 
      00A720 EF               [ 2]  711     LDW (X),Y 
      00A721 04 90            [ 1]  712     LDW Y,X 
      00A723 BE 24 EF         [ 2]  713     LDW Y,(2,Y)
      00A726 06 81            [ 2]  714     RRCW Y 
      00A728 A6 FB            [ 2]  715     LDW (2,X),Y 
      00A72A 04               [ 4]  716     RET
                                    717 
                                    718 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    719 ;  D2* ( d -- d*2 )
                                    720 ;  multiply double by 2 
                                    721 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028EF                        722     _HEADER D2STAR,3,"D2*"
      00A72B 44 43                    1         .word LINK 
                           0028F1     2         LINK=.
      00A72D 4C                       3         .byte 3  
      00A72E 5A 32 2A                 4         .ascii "D2*"
      00A72F                          5         D2STAR:
      00A72F 4F 90            [ 1]  723     LDW Y,X 
      00A731 93 90 FE         [ 2]  724     LDW Y,(2,Y)
      00A734 2B               [ 1]  725     RCF 
      00A735 18 27            [ 2]  726     RLCW Y 
      00A737 09 02            [ 2]  727     LDW (2,X),Y 
      00A738 90 93            [ 1]  728     LDW Y,X 
      00A738 90 58            [ 2]  729     LDW Y,(Y)
      00A73A 4C 90            [ 2]  730     RLCW Y 
      00A73C 5D               [ 2]  731     LDW (X),Y 
      00A73D 2B               [ 4]  732     RET 
                                    733 
                                    734 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    735 ;   DLSHIFT ( d n -- d )
                                    736 ;   left shift double 
                                    737 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002907                        738     _HEADER DLSHIFT,7,"DLSHIFT"
      00A73E 0F 20                    1         .word LINK 
                           002909     2         LINK=.
      00A740 F7                       3         .byte 7  
      00A741 44 4C 53 48 49 46 54     4         .ascii "DLSHIFT"
      002911                          5         DLSHIFT:
      00A741 A6 10            [ 1]  739     LD A,(1,X) ; shift count 
      00A743 90 93 90         [ 2]  740     ADDW X,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      00A746 EE 02            [ 1]  741     LDW Y,X 
      00A748 2B 04            [ 2]  742     LDW Y,(Y)
      00A74A 26 EC AB         [ 2]  743     LDW YTEMP,Y  ; d hi 
      00A74D 10 93            [ 1]  744     LDW Y,X 
      00A74E 90 EE 02         [ 2]  745     LDW Y,(2,Y)  ; d low 
      002922                        746 DLSHIFT1:
      00A74E 1C               [ 1]  747     TNZ A 
      00A74F 00 02            [ 1]  748     JREQ DLSHIFT2 
      00A751 90               [ 1]  749     RCF 
      00A752 5F 90            [ 2]  750     RLCW Y 
      00A754 97 FF            [ 2]  751     PUSHW Y 
      00A756 81 A7 2A         [ 2]  752     LDW Y,YTEMP 
      00A759 05 32            [ 2]  753     RLCW Y 
      00A75B 3C 52 4F         [ 2]  754     LDW YTEMP,Y 
      00A75E 54 85            [ 2]  755     POPW Y 
      00A75F 4A               [ 1]  756     DEC A 
      00A75F 90 93            [ 2]  757     JRA DLSHIFT1 
      002937                        758 DLSHIFT2:
      00A761 90 FE            [ 2]  759     LDW (2,X),Y 
      00A763 90 BF 26         [ 2]  760     LDW Y,YTEMP 
      00A766 90               [ 2]  761     LDW (X),Y 
      00A767 93               [ 4]  762     RET 
                                    763 
                                    764 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    765 ;  DRSHIFT ( d n -- d )
                                    766 ;  shift right n bits 
                                    767 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00293E                        768     _HEADER DRSHIFT,7,"DRSHIFT"
      00A768 90 EE                    1         .word LINK 
                           002940     2         LINK=.
      00A76A 02                       3         .byte 7  
      00A76B 90 BF 24 90 93 90 EE     4         .ascii "DRSHIFT"
      002948                          5         DRSHIFT:
      00A772 04 FF            [ 1]  769     LD A,(1,X)
      00A774 90 93            [ 1]  770     AND A,#0X1F 
      00A776 90 EE 06         [ 2]  771     ADDW X,#2 
      00294F                        772 DRSHIFT1:
      00A779 EF               [ 1]  773     TNZ A 
      00A77A 02 90            [ 1]  774     JREQ DRSHIFT2 
      00A77C 93 90            [ 1]  775     LDW Y,X 
      00A77E EE 08            [ 2]  776     LDW Y,(Y)
      00A780 EF 04            [ 2]  777     SRAW Y 
      00A782 90               [ 2]  778     LDW (X),Y 
      00A783 93 90            [ 1]  779     LDW Y,X 
      00A785 EE 0A EF         [ 2]  780     LDW Y,(2,Y)
      00A788 06 90            [ 2]  781     RRCW Y 
      00A78A BE 26            [ 2]  782     LDW (2,X),Y 
      00A78C EF               [ 1]  783     DEC A
      00A78D 08 90            [ 2]  784     JRA DRSHIFT1  
      002965                        785 DRSHIFT2:
      00A78F BE               [ 4]  786     RET 
                                    787 
                                    788 
                                    789 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    790 ;   D* ( d1 d2 -- d3 )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



                                    791 ;   double product 
                                    792 ;   
                                    793 ;   d3 = d1 * d2
                                    794 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002966                        795     _HEADER DSTAR,2,"D*"
      00A790 24 EF                    1         .word LINK 
                           002968     2         LINK=.
      00A792 0A                       3         .byte 2  
      00A793 81 A7                    4         .ascii "D*"
      00296B                          5         DSTAR:
      00A795 59 04 32         [ 4]  796     CALL DUPP 
      00A798 52 4F 54         [ 4]  797     CALL ZLESS  
      00A79B CD 05 5A         [ 4]  798     CALL TOR    ; R: d2sign 
      00A79B 90 93 90         [ 4]  799     CALL DABS   
      00A79E FE 90 BF         [ 4]  800     CALL RFROM 
      00A7A1 26 90 93         [ 4]  801     CALL NROT  ; d1 d2s ud2
      00A7A4 90 EE 02         [ 4]  802     CALL DTOR  ; d1 d2s R: ud2  
      00A7A7 90 BF 24         [ 4]  803     CALL TOR   ; d1 R: ud2 d2s   
      00A7AA 90 93 90         [ 4]  804     CALL DUPP 
      00A7AD EE 08 FF         [ 4]  805     CALL ZLESS 
      00A7B0 90 93 90         [ 4]  806     CALL RFROM 
      00A7B3 EE 0A EF         [ 4]  807     CALL XORR   
      00A7B6 02 90 93         [ 4]  808     CALL TOR   ; d1 R: ud2 prod_sign  
      00A7B9 90 EE 04         [ 4]  809     CALL DABS ; ud1 R: ud2 ps  
      00A7BC EF 08 90         [ 4]  810     CALL RFROM  
      00A7BF 93 90 EE         [ 4]  811     CALL NROT   ; ps ud1 
      00A7C2 06 EF 0A         [ 4]  812     CALL DDUP   ; ps ud1 ud1  
      00A7C5 90 BE 26         [ 4]  813     CALL RFROM  ; ps ud1 ud1 ud2hi 
      00A7C8 EF 04 90         [ 4]  814     CALL DSSTAR ; ps ud1 dprodhi 
                                    815 ; shift partial product 16 bits left 
      00A7CB BE 24 EF         [ 4]  816     CALL DROP   ; drop overflow 
      00A7CE 06 81 A7         [ 4]  817     CALL ZERO   ; ps ud1 prodhi 
      00A7D1 96 02 44         [ 4]  818     CALL SWAPP  
      00A7D4 3D 26 81         [ 4]  819     CALL DSWAP  ; ps dprodhi ud1 
      00A7D5 CD 05 3B         [ 4]  820     CALL RFROM  ; ps dprodhi ud1 ud2lo
      00A7D5 A6 00 90         [ 4]  821     CALL DSSTAR ; ps  dprodhi dprodlo 
      00A7D8 93 90 FE         [ 4]  822     CALL DPLUS
      00A7DB E3 04 26         [ 4]  823     CALL ROT    ; dprod ps 
      0029BC                        824     _QBRAN DDSTAR3 
      00A7DE 0B 90 93         [ 4]    1     CALL QBRAN
      00A7E1 90 EE                    2     .word DDSTAR3
      00A7E3 02 E3 06         [ 4]  825     CALL DNEGA 
      0029C4                        826 DDSTAR3:  
      00A7E6 26               [ 4]  827     RET 
                                    828 
                                    829 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    830 ;   DD/MOD  ( d1 d2 -- dr dq )
                                    831 ;   double division dq=d1/d2
                                    832 ;   dr remainder double 
                                    833 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0029C5                        834     _HEADER DDSLMOD,6,"DD/MOD"  
      00A7E7 02 A6                    1         .word LINK 
                           0029C7     2         LINK=.
      00A7E9 FF                       3         .byte 6  
      00A7EA 44 44 2F 4D 4F 44        4         .ascii "DD/MOD"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      0029CE                          5         DDSLMOD:
      0029CE                        835     _DOLIT 0 
      00A7EA 1C 00 06         [ 4]    1     CALL DOLIT 
      00A7ED F7 E7                    2     .word 0 
      00A7EF 01 81 A7         [ 4]  836     CALL TOR   ; R: sign 
      00A7F2 D2 02            [ 1]  837     LDW Y,X     
      00A7F4 44 3E            [ 2]  838     LDW Y,(Y)
      00A7F6 2A 0C            [ 1]  839     JRPL DSLA1
      00A7F6 A6 FF 90         [ 4]  840     CALL DNEGA  ; ud2 
      00A7F9 93 90 EE         [ 4]  841     CALL RFROM 
      00A7FC 04 F3 2C         [ 4]  842     CALL INVER 
      00A7FF 0B 90 93         [ 4]  843     CALL TOR  ; sign inverted 
      0029E8                        844 DSLA1:
      0029E8                        845     _DOLIT 2 
      00A802 90 EE 06         [ 4]    1     CALL DOLIT 
      00A805 E3 02                    2     .word 2 
      00A807 22 02 A6         [ 4]  846     CALL PICK 
      00A80A 00 05 CA         [ 4]  847     CALL ZLESS 
      00A80B                        848     _QBRAN DSLA2
      00A80B 1C 00 06         [ 4]    1     CALL QBRAN
      00A80E F7 E7                    2     .word DSLA2
      00A810 01 81 A7         [ 4]  849     CALL DSWAP 
      00A813 F3 02 44         [ 4]  850     CALL DNEGA  ; ud1 
      00A816 3C 26 81         [ 4]  851     CALL DSWAP  ; ud1 ud2 ( divident divisor )     
      00A817 CD 05 3B         [ 4]  852     CALL RFROM 
      00A817 CD AB 77         [ 4]  853     CALL INVER 
      00A81A CD 84 F1         [ 4]  854     CALL TOR   ;  sign inverted again 
      002A0A                        855 DSLA2:
                                    856 ; unsigned double division 
      00A81D 00 00 CD         [ 4]  857     CALL ZERO 
      00A820 87 FE CD         [ 4]  858     CALL ZERO
      00A823 A8 34 CD         [ 4]  859     CALL DTOR ; quotient  R: sign qlo qhi 
      00A826 85 1A A8         [ 4]  860     CALL DOVER 
      00A829 2D CD 88         [ 4]  861     CALL DCLZ ; n2, dividend leading zeros  
      00A82C 5A 05 5A         [ 4]  862     CALL TOR 
      00A82D CD 07 AB         [ 4]  863     CALL DDUP    
      00A82D 81 A8 14         [ 4]  864     CALL DCLZ  ; n1, divisor leading zeros
      00A830 03 44 30         [ 4]  865     CALL RFROM ; n1 n2 
      00A833 3C 08 39         [ 4]  866     CALL SUBB
      00A834 CD 05 91         [ 4]  867     CALL DUPP   
      00A834 A6 00 90         [ 4]  868     CALL ZLESS 
      002A2E                        869     _TBRAN DSLA7 ; quotient is null 
      00A837 93 90 FE         [ 4]    1     CALL TBRAN 
      00A83A 2A 02                    2     .word DSLA7 
      00A83C A6 FF 91         [ 4]  870     CALL DUPP 
      00A83E CD 05 5A         [ 4]  871     CALL TOR    ; loop counter 
      00A83E 1C 00 02         [ 4]  872     CALL DUPP 
      00A841 F7 E7 01         [ 4]  873     CALL TOR    ; need to copies 
      00A844 81 A8 30         [ 4]  874     CALL QDUP 
      002A42                        875     _QBRAN DSLA3
      00A847 04 44 43         [ 4]    1     CALL QBRAN
      00A84A 4D 50                    2     .word DSLA3
      00A84C CD 29 11         [ 4]  876     CALL DLSHIFT ; align divisor with dividend 
      002A4A                        877 DSLA3: ; division loop -- dividend divisor  
      00A84C 90 93            [ 1]  878     CLRW Y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      00A84E 90 EE            [ 2]  879     PUSHW Y  
      00A850 04 F3 27         [ 4]  880     CALL DOVER 
      00A853 04 2F 13         [ 4]  881     CALL DOVER 
      00A856 20 17 97         [ 4]  882     CALL DLESS 
      00A858                        883     _TBRAN DSLA4 
      00A858 90 93 90         [ 4]    1     CALL TBRAN 
      00A85B EE 06                    2     .word DSLA4 
      00A85D E3 02            [ 2]  884     POPW Y 
      00A85F 27 04 25 06      [ 2]  885     ADDW Y,#1 
      00A863 20 0A            [ 2]  886     PUSHW Y    ; quotiend least bit 
      00A865 CD 07 AB         [ 4]  887     CALL DDUP  ; dividend divisor divisor 
      00A865 90 5F 20         [ 4]  888     CALL DTOR  
      00A868 0A 2A F7         [ 4]  889     CALL DSUB  ; dividend-divisor 
      00A869 CD 28 1C         [ 4]  890     CALL DRFROM  ; dividend- divisor  
      002A70                        891 DSLA4: ; shift quotient and add 1 bit 
      00A869 90 AE            [ 2]  892     POPW Y 
      00A86B FF FF 20         [ 2]  893     LDW YTEMP,Y 
      00A86E 04 07            [ 2]  894     LDW Y,(7,SP) ; quotient low 
      00A86F 98               [ 1]  895     RCF 
      00A86F 90 AE            [ 2]  896     RLCW Y
      00A871 00 01            [ 2]  897     LDW (7,SP),Y 
      00A873 16 05            [ 2]  898     LDW Y,(5,SP) ; quotient hi 
      00A873 1D 00            [ 2]  899     RLCW Y 
      00A875 02 FF            [ 2]  900     LDW (5,SP),Y 
      00A877 81 A8            [ 2]  901     LDW Y,(7,SP) 
      00A879 47 03 32 3E      [ 2]  902     ADDW Y,YTEMP
      00A87D 52 07            [ 2]  903     LDW (7,SP),Y 
      00A87E 16 01            [ 2]  904     LDW Y,(1,SP) ; loop counter 
      00A87E 90 85            [ 2]  905     TNZW Y 
      00A880 90 BF            [ 1]  906     JREQ DSLA8
      00A882 26 90 93 90      [ 2]  907     SUBW Y,#1  
      00A886 EE 02            [ 2]  908     LDW (1,SP),Y  
                                    909 ; shift dividend left 1 bit      
      00A888 90 89 90         [ 4]  910     CALL DSWAP 
      00A88B 93 90 FE         [ 4]  911     CALL D2STAR 
      00A88E 90 89 1C         [ 4]  912     CALL DSWAP 
      00A891 00 04            [ 2]  913     JRA DSLA3 
      002AA1                        914 DSLA7:
      00A893 92 CC 26         [ 2]  915     ADDW X,#2 ; drop shift count  
      002AA4                        916 DSLA8:
      00A896 A8 7A 03         [ 2]  917     ADDW X,#4 ; drop divisor
      00A899 32 52 3E         [ 4]  918     CALL RFROM
      00A89C CD 05 87         [ 4]  919     CALL DROP   ; loop counter 
      00A89C 90 85 90         [ 4]  920     CALL RFROM   ; shift count
      00A89F BF 26 1D         [ 4]  921     CALL DRSHIFT 
                                    922     ; quotient replace dividend 
      00A8A2 00 04 90         [ 4]  923     CALL DRFROM  ; quotient 
      00A8A5 85 FF            [ 2]  924     POPW Y ; sign 
      00A8A7 90 85            [ 2]  925     TNZW Y 
      00A8A9 EF 02            [ 1]  926     JREQ DSLA9 
      00A8AB 92 CC 26         [ 4]  927     CALL DNEGA ; remainder quotient 
      002ABF                        928 DSLA9: 
      00A8AE A8               [ 4]  929     RET 
                                    930 
                                    931 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



                                    932 ;   D+ ( d1 d2 -- d3 )
                                    933 ;   add 2 doubles 
                                    934 ;   d3=d1+d2 
                                    935 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002AC0                        936     _HEADER DPLUS,2,"D+"
      00A8AF 98 03                    1         .word LINK 
                           002AC2     2         LINK=.
      00A8B1 32                       3         .byte 2  
      00A8B2 52 40                    4         .ascii "D+"
      00A8B4                          5         DPLUS:
      00A8B4 90 85            [ 1]  937     LDW Y,X 
      00A8B6 90 BF            [ 2]  938     LDW Y,(Y)
      00A8B8 26 1D 00         [ 2]  939     LDW YTEMP,Y ; d2 hi 
      00A8BB 04 16            [ 1]  940     LDW Y,X 
      00A8BD 01 FF 16         [ 2]  941     LDW Y,(2,Y)
      00A8C0 03 EF 02         [ 2]  942     LDW XTEMP,Y ; d2 lo 
      00A8C3 92 CC 26         [ 2]  943     ADDW X,#4 
      00A8C6 A8 B0            [ 1]  944     LDW Y,X 
      00A8C8 09 32 56         [ 2]  945     LDW Y,(2,Y) ; d1 lo
      00A8CB 41 52 49 41      [ 2]  946     ADDW Y,XTEMP
      00A8CF 42 4C            [ 2]  947     LDW (2,X),Y 
      00A8D1 45 93            [ 1]  948     LDW Y,X 
      00A8D2 90 FE            [ 2]  949     LDW Y,(Y) ; d1 hi 
      00A8D2 CD 8C            [ 1]  950     JRNC DPLUS1 
      00A8D4 B8 CD 86 11      [ 2]  951     ADDW Y,#1 
      002AEC                        952 DPLUS1: 
      00A8D8 CD 84 F1 00      [ 2]  953     ADDW Y,YTEMP 
      00A8DC 04               [ 2]  954     LDW (X),Y 
      00A8DD CD               [ 4]  955     RET 
                                    956 
                                    957 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    958 ;   D- ( d1 d2 -- d3 )
                                    959 ;   d3=d1-d2 
                                    960 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002AF2                        961     _HEADER DSUB,2,"D-"
      00A8DE 88 40                    1         .word LINK 
                           002AF4     2         LINK=.
      00A8E0 CD                       3         .byte 2  
      00A8E1 87 72                    4         .ascii "D-"
      002AF7                          5         DSUB:
      00A8E3 CD 85            [ 1]  962     LDW Y,X 
      00A8E5 53 CD            [ 2]  963     LDW Y,(Y)
      00A8E7 98 A0 CD         [ 2]  964     LDW YTEMP,Y ; d2 hi 
      00A8EA 86 11            [ 1]  965     LDW Y,X 
      00A8EC CD 95 12         [ 2]  966     LDW Y,(2,Y)
      00A8EF CD 8B CA         [ 2]  967     LDW XTEMP,Y ; d2 lo 
      00A8F2 CD 86 3B         [ 2]  968     ADDW X,#4 
      00A8F5 CD 85            [ 1]  969     LDW Y,X 
      00A8F7 53 CD 8B         [ 2]  970     LDW Y,(2,Y) ; d1 lo
      00A8FA CA CD 86 21      [ 2]  971     SUBW Y,XTEMP
      00A8FE CD 85            [ 2]  972     LDW (2,X),Y 
      00A900 53 CD            [ 1]  973     LDW Y,X 
      00A902 A1 A6            [ 2]  974     LDW Y,(Y) ; d1 hi 
      00A904 CD 87            [ 1]  975     JRNC DSUB1 
      00A906 CE CD 85 1A      [ 2]  976     SUBW Y,#1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      002B1E                        977 DSUB1: 
      00A90A 98 ED CD 9C      [ 2]  978     SUBW Y,YTEMP 
      00A90E 4E               [ 2]  979     LDW (X),Y 
      00A90F CD               [ 4]  980     RET 
                                    981 
                                    982 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



                                   4832 .endif 
                           000001  4833 .if WANT_FLOAT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



                                   4834         .include "float.asm"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
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
      002B24                         67     _HEADER FPSW,4,"FPSW"
      00A910 A2 3A                    1         .word LINK 
                           002B26     2         LINK=.
      00A912 81                       3         .byte 4  
      00A913 A8 C8 88 32              4         .ascii "FPSW"
      002B2B                          5         FPSW:
      00A917 4C 49 54 45      [ 2]   68 	LDW Y,#UFPSW  
      00A91B 52 41 4C         [ 2]   69 	SUBW X,#2
      00A91E FF               [ 2]   70     LDW (X),Y
      00A91E CD               [ 4]   71     RET
                                     72 
                                     73 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     74 ;   FRESET ( -- )
                                     75 ;   reset FPSW variable 
                                     76 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
      002B34                         77     _HEADER FRESET,6,"FRESET"
      00A91F 95 57                    1         .word LINK 
                           002B36     2         LINK=.
      00A921 A9                       3         .byte 6  
      00A922 29 CD 95 12 CC 95        4         .ascii "FRESET"
      002B3D                          5         FRESET:
      002B3D                         78     _DOLIT 0 
      00A928 12 04 71         [ 4]    1     CALL DOLIT 
      00A929 00 00                    2     .word 0 
      00A929 1D 00 04         [ 4]   79     CALL FPSW 
      00A92C 16 01 90         [ 4]   80     CALL STORE 
      00A92F FE               [ 4]   81     RET 
                                     82 
                                     83 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     84 ;   FINIT ( -- )
                                     85 ;   initialize floating point 
                                     86 ;   library 
                                     87 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B49                         88     _HEADER FINIT,5,"FINIT"
      00A930 FF 16                    1         .word LINK 
                           002B4B     2         LINK=.
      00A932 01                       3         .byte 5  
      00A933 90 EE 02 EF 02           4         .ascii "FINIT"
      002B51                          5         FINIT:
      00A938 90 85 90         [ 4]   89     CALL FRESET 
      00A93B EC               [ 4]   90     RET 
                                     91 
                                     92 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



                                     93 ;    FER ( -- u )
                                     94 ;    return FPSW value 
                                     95 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B55                         96     _HEADER FER,3,"FER"
      00A93C 04 A9                    1         .word LINK 
                           002B57     2         LINK=.
      00A93E 15                       3         .byte 3  
      00A93F 05 32 4F                 4         .ascii "FER"
      002B5B                          5         FER:
      00A942 56 45 52         [ 4]   97     CALL FPSW 
      00A945 CD 04 EA         [ 4]   98     CALL AT 
      00A945 90               [ 4]   99     RET 
                                    100 
                                    101 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    102 ;    FZE  ( -- z )
                                    103 ;    return FPSW zero flag 
                                    104 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B62                        105     _HEADER FZE,3,"FZE"
      00A946 93 1D                    1         .word LINK 
                           002B64     2         LINK=.
      00A948 00                       3         .byte 3  
      00A949 04 90 89                 4         .ascii "FZE"
      002B68                          5         FZE:
      00A94C 90 EE 04         [ 4]  106     CALL FPSW
      00A94F FF 90 85         [ 4]  107     CALL AT  
      002B6E                        108     _DOLIT 1
      00A952 90 EE 06         [ 4]    1     CALL DOLIT 
      00A955 EF 02                    2     .word 1 
      00A957 81 A9 3F         [ 4]  109     CALL ANDD 
      00A95A 03               [ 4]  110     RET 
                                    111 
                                    112 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    113 ;    FNE ( -- n )
                                    114 ;    return FPSW negative flag 
                                    115 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B77                        116     _HEADER FNE,3,"FNE"
      00A95B 44 32                    1         .word LINK 
                           002B79     2         LINK=.
      00A95D 2F                       3         .byte 3  
      00A95E 46 4E 45                 4         .ascii "FNE"
      002B7D                          5         FNE:
      00A95E 90 93 90         [ 4]  117     CALL FPSW 
      00A961 FE 90 57         [ 4]  118     CALL AT 
      002B83                        119     _DOLIT 2 
      00A964 FF 90 93         [ 4]    1     CALL DOLIT 
      00A967 90 EE                    2     .word 2 
      00A969 02 90 56         [ 4]  120     CALL ANDD 
      00A96C EF               [ 4]  121     RET 
                                    122 
                                    123 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    124 ;   FOV (A -- v )
                                    125 ;   return FPSW overflow flag 
                                    126 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B8C                        127     _HEADER FOV,3,"FOV"
      00A96D 02 81                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



                           002B8E     2         LINK=.
      00A96F A9                       3         .byte 3  
      00A970 5A 03 44                 4         .ascii "FOV"
      002B92                          5         FOV:
      00A973 32 2A 2B         [ 4]  128     CALL FPSW
      00A975 CD 04 EA         [ 4]  129     CALL AT  
      002B98                        130     _DOLIT 4 
      00A975 90 93 90         [ 4]    1     CALL DOLIT 
      00A978 EE 02                    2     .word 4 
      00A97A 98 90 59         [ 4]  131     CALL ANDD 
      00A97D EF               [ 4]  132     RET 
                                    133 
                                    134 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    135 ;    SFZ ( f# -- f# )
                                    136 ;    set FPSW zero flag 
                                    137 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BA1                        138     _HEADER SFZ,3,"SFZ"
      00A97E 02 90                    1         .word LINK 
                           002BA3     2         LINK=.
      00A980 93                       3         .byte 3  
      00A981 90 FE 90                 4         .ascii "SFZ"
      002BA7                          5         SFZ:
      00A984 59 FF 81         [ 4]  139     CALL DDUP 
      00A987 A9 71 07         [ 4]  140     CALL FER 
      002BAD                        141     _DOLIT 0xfffe 
      00A98A 44 4C 53         [ 4]    1     CALL DOLIT 
      00A98D 48 49                    2     .word 0xfffe 
      00A98F 46 54 F0         [ 4]  142     CALL ANDD 
      00A991 CD 05 5A         [ 4]  143     CALL TOR    
      002BB8                        144     _DOLIT 0x807F 
      00A991 E6 01 1C         [ 4]    1     CALL DOLIT 
      00A994 00 02                    2     .word 0x807F 
      00A996 90 93 90         [ 4]  145     CALL ANDD 
      00A999 FE 90 BF         [ 4]  146     CALL DZEQUAL 
      002BC3                        147     _DOLIT 1 
      00A99C 26 90 93         [ 4]    1     CALL DOLIT 
      00A99F 90 EE                    2     .word 1 
      00A9A1 02 05 F0         [ 4]  148     CALL ANDD 
      00A9A2 CD 05 3B         [ 4]  149     CALL RFROM 
      00A9A2 4D 27 12         [ 4]  150     CALL ORR 
      00A9A5 98 90 59         [ 4]  151     CALL FPSW 
      00A9A8 90 89 90         [ 4]  152     CALL STORE 
      00A9AB BE               [ 4]  153     RET 
                                    154 
                                    155 
                                    156 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    157 ;   SFN ( f# -- f# )
                                    158 ;   set FPSW negative flag 
                                    159 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BD8                        160     _HEADER SFN,3,"SFN"
      00A9AC 26 90                    1         .word LINK 
                           002BDA     2         LINK=.
      00A9AE 59                       3         .byte 3  
      00A9AF 90 BF 26                 4         .ascii "SFN"
      002BDE                          5         SFN:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      00A9B2 90 85 4A         [ 4]  161     CALL DUPP  
      00A9B5 20 EB 5B         [ 4]  162     CALL FER 
      00A9B7                        163     _DOLIT 0xFFFD 
      00A9B7 EF 02 90         [ 4]    1     CALL DOLIT 
      00A9BA BE 26                    2     .word 0xFFFD 
      00A9BC FF 81 A9         [ 4]  164     CALL ANDD  
      00A9BF 89 07 44         [ 4]  165     CALL TOR 
      002BEF                        166     _DOLIT 0x8000
      00A9C2 52 53 48         [ 4]    1     CALL DOLIT 
      00A9C5 49 46                    2     .word 0x8000 
      00A9C7 54 05 F0         [ 4]  167     CALL ANDD
      00A9C8 90 93            [ 1]  168     LDW Y,X 
      00A9C8 E6 01            [ 2]  169     LDW Y,(Y)
      00A9CA A4               [ 1]  170     RCF 
      00A9CB 1F 1C            [ 2]  171     RLCW Y 
      00A9CD 00 02            [ 2]  172     RLCW Y 
      00A9CF 90 59            [ 2]  173     RLCW Y 
      00A9CF 4D               [ 2]  174     LDW (X),Y 
      00A9D0 27 13 90         [ 4]  175     CALL RFROM 
      00A9D3 93 90 FE         [ 4]  176     CALL ORR 
      00A9D6 90 57 FF         [ 4]  177     CALL FPSW
      00A9D9 90 93 90         [ 4]  178     CALL STORE 
      00A9DC EE               [ 4]  179     RET 
                                    180 
                                    181 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    182 ;   SFV ( -- )
                                    183 ;   set overflow flag 
                                    184 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C10                        185     _HEADER SFV,3,"SFV"
      00A9DD 02 90                    1         .word LINK 
                           002C12     2         LINK=.
      00A9DF 56                       3         .byte 3  
      00A9E0 EF 02 4A                 4         .ascii "SFV"
      002C16                          5         SFV:
      00A9E3 20 EA 2B         [ 4]  186     CALL FPSW 
      00A9E5 CD 04 EA         [ 4]  187     CALL AT 
      002C1C                        188     _DOLIT 4 
      00A9E5 81 A9 C0         [ 4]    1     CALL DOLIT 
      00A9E8 02 44                    2     .word 4 
      00A9EA 2A 06 04         [ 4]  189     CALL ORR 
      00A9EB CD 2B 2B         [ 4]  190     CALL FPSW 
      00A9EB CD 86 11         [ 4]  191     CALL STORE 
      00A9EE CD               [ 4]  192     RET 
                                    193 
                                    194 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    195 ;  F>ME ( f# -- m e )
                                    196 ;  split float in mantissa/exponent 
                                    197 ;  m mantissa as a double 
                                    198 ;  e exponent as a single 
                                    199 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C2B                        200     _HEADER ATEXP,4,"F>ME"             
      00A9EF 86 4A                    1         .word LINK 
                           002C2D     2         LINK=.
      00A9F1 CD                       3         .byte 4  
      00A9F2 85 DA CD A5              4         .ascii "F>ME"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      002C32                          5         ATEXP:
      00A9F6 E0 CD 85         [ 4]  201     CALL FRESET
      00A9F9 BB CD 87         [ 4]  202     CALL SFN
      00A9FC FE CD A8         [ 4]  203     CALL SFZ 
      00A9FF 7E CD 85         [ 4]  204     CALL DUPP
      002C3E                        205     _DOLIT 0X7F80 
      00AA02 DA CD 86         [ 4]    1     CALL DOLIT 
      00AA05 11 CD                    2     .word 0X7F80 
      00AA07 86 4A CD         [ 4]  206     CALL ANDD 
      002C46                        207     _DOLIT 7 
      00AA0A 85 BB CD         [ 4]    1     CALL DOLIT 
      00AA0D 86 99                    2     .word 7 
      00AA0F CD 85 DA         [ 4]  208     CALL RSHIFT
      002C4E                        209     _DOLIT 127 
      00AA12 CD A5 E0         [ 4]    1     CALL DOLIT 
      00AA15 CD 85                    2     .word 127 
      00AA17 BB CD 87         [ 4]  210     CALL SUBB
      00AA1A FE CD 88         [ 4]  211     CALL TOR 
      002C59                        212     _DOLIT 0x7F
      00AA1D 2B CD 85         [ 4]    1     CALL DOLIT 
      00AA20 BB CD                    2     .word 0x7F 
      00AA22 A6 B8 CD         [ 4]  213     CALL ANDD  ; mantissa as double  
      00AA25 86 07 CD         [ 4]  214     CALL FNE 
      002C64                        215     _QBRAN POSMANT 
      00AA28 8B CA CD         [ 4]    1     CALL QBRAN
      00AA2B 86 21                    2     .word POSMANT
      00AA2D CD A7 01         [ 4]  216     CALL DNEGAT 
      002C6C                        217 POSMANT:
      00AA30 CD 85 BB         [ 4]  218     CALL RFROM 
      00AA33 CD               [ 4]  219     RET 
                                    220 
                                    221 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    222 ;    ME>F ( m e -- f# )
                                    223 ;    built float from mantissa/exponent 
                                    224 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C70                        225     _HEADER STEXP,4,"ME>F"
      00AA34 A6 B8                    1         .word LINK 
                           002C72     2         LINK=.
      00AA36 CD                       3         .byte 4  
      00AA37 AB 45 CD 87              4         .ascii "ME>F"
      002C77                          5         STEXP:
      00AA3B DF CD 85         [ 4]  226     CALL DUPP 
      00AA3E 1A AA 44         [ 4]  227     CALL ABSS 
      002C7D                        228     _DOLIT 127 
      00AA41 CD 88 7D         [ 4]    1     CALL DOLIT 
      00AA44 00 7F                    2     .word 127 
      00AA44 81 A9 E8         [ 4]  229     CALL UGREAT
      002C85                        230     _QBRAN STEXP1
      00AA47 06 44 44         [ 4]    1     CALL QBRAN
      00AA4A 2F 4D                    2     .word STEXP1
      00AA4C 4F 44 16         [ 4]  231     CALL SFV  
      00AA4E                        232 STEXP1:
      002C8D                        233     _DOLIT 127 
      00AA4E CD 84 F1         [ 4]    1     CALL DOLIT 
      00AA51 00 00                    2     .word 127 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      00AA53 CD 85 DA         [ 4]  234     CALL PLUS 
      002C95                        235     _DOLIT 0XFF 
      00AA56 90 93 90         [ 4]    1     CALL DOLIT 
      00AA59 FE 2A                    2     .word 0XFF 
      00AA5B 0C CD 88         [ 4]  236     CALL ANDD 
      002C9D                        237     _DOLIT 7 
      00AA5E 7D CD 85         [ 4]    1     CALL DOLIT 
      00AA61 BB CD                    2     .word 7 
      00AA63 88 5A CD         [ 4]  238     CALL LSHIFT 
      00AA66 85 DA 5A         [ 4]  239     CALL TOR   ; R: e 
      00AA68 CD 05 91         [ 4]  240     CALL DUPP 
      002CAB                        241     _DOLIT 0X8000 
      00AA68 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AA6B 00 02                    2     .word 0X8000 
      00AA6D CD 8C 23         [ 4]  242     CALL ANDD 
      002CB3                        243     _QBRAN STEXP2 
      00AA70 CD 86 4A         [ 4]    1     CALL QBRAN
      00AA73 CD 85                    2     .word STEXP2
      002CB8                        244     _DOLIT 0X8000 
      00AA75 1A AA 8A         [ 4]    1     CALL DOLIT 
      00AA78 CD A7                    2     .word 0X8000 
      00AA7A 01 CD 88         [ 4]  245     CALL RFROM 
      00AA7D 7D CD A7         [ 4]  246     CALL ORR
      00AA80 01 CD 85         [ 4]  247     CALL TOR
      00AA83 BB CD 88         [ 4]  248     CALL DNEGAT  
      002CC9                        249 STEXP2:
      00AA86 5A CD 85         [ 4]  250     CALL DUPP 
      002CCC                        251     _DOLIT 0X7F
      00AA89 DA 04 71         [ 4]    1     CALL DOLIT 
      00AA8A 00 7F                    2     .word 0X7F 
      00AA8A CD 8B CA         [ 4]  252     CALL UGREAT 
      002CD4                        253     _QBRAN STEXP3 
      00AA8D CD 8B CA         [ 4]    1     CALL QBRAN
      00AA90 CD A8                    2     .word STEXP3
      00AA92 7E CD A9         [ 4]  254     CALL SFV 
      002CDC                        255 STEXP3:
      002CDC                        256     _DOLIT 0X7F 
      00AA95 45 CD A7         [ 4]    1     CALL DOLIT 
      00AA98 2F CD                    2     .word 0X7F 
      00AA9A 85 DA CD         [ 4]  257     CALL ANDD 
      00AA9D 88 2B CD         [ 4]  258     CALL RFROM 
      00AAA0 A7 2F CD         [ 4]  259     CALL ORR 
      00AAA3 85 BB CD         [ 4]  260     CALL SFZ 
      00AAA6 88 B9 CD         [ 4]  261     CALL SFN 
      00AAA9 86               [ 4]  262     RET 
                                    263 
                                    264 
                                    265 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    266 ;   E. ( f# -- )
                                    267 ;   print float in scientific 
                                    268 ;   format 
                                    269 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002CF1                        270     _HEADER EDOT,2,"E."
      00AAAA 11 CD                    1         .word LINK 
                           002CF3     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      00AAAC 86                       3         .byte 2  
      00AAAD 4A CD                    4         .ascii "E."
      002CF6                          5         EDOT:
      00AAAF 85 28 AB         [ 4]  271     CALL BASE 
      00AAB2 21 CD 86         [ 4]  272     CALL AT 
      00AAB5 11 CD 85         [ 4]  273     CALL TOR 
      002CFF                        274     _DOLIT 10 
      00AAB8 DA CD 86         [ 4]    1     CALL DOLIT 
      00AABB 11 CD                    2     .word 10 
      00AABD 85 DA CD         [ 4]  275     CALL BASE 
      00AAC0 87 CE CD         [ 4]  276     CALL STORE 
      00AAC3 85 1A AA         [ 4]  277     CALL ATEXP ; m e 
      002D0D                        278 EDOT0:
      00AAC6 CA CD A9         [ 4]  279     CALL TOR   
      00AAC9 91 2B 7D         [ 4]  280     CALL FNE 
      00AACA                        281     _QBRAN EDOT1
      00AACA 90 5F 90         [ 4]    1     CALL QBRAN
      00AACD 89 CD                    2     .word EDOT1
      00AACF A9 45 CD         [ 4]  282     CALL DNEGAT
      002D1B                        283 EDOT1:
      00AAD2 A9 45 CD         [ 4]  284     CALL SPACE 
      00AAD5 A8 17 CD         [ 4]  285     CALL BDIGS     
      002D21                        286 EDOT2: 
      00AAD8 85 28 AA         [ 4]  287     CALL DDIG
      00AADB F0 90 85         [ 4]  288     CALL RFROM 
      00AADE 72 A9 00         [ 4]  289     CALL ONEP 
      00AAE1 01 90 89         [ 4]  290     CALL TOR 
      00AAE4 CD 88 2B         [ 4]  291     CALL DUPP
      002D30                        292     _QBRAN EDOT3 
      00AAE7 CD A8 7E         [ 4]    1     CALL QBRAN
      00AAEA CD AB                    2     .word EDOT3
      002D35                        293     _BRAN EDOT2  
      00AAEC 77 CD A8         [ 4]    1     CALL BRAN 
      00AAEF 9C 21                    2     .word EDOT2 
      00AAF0                        294 EDOT3:
      00AAF0 90 85 90         [ 4]  295     CALL OVER 
      00AAF3 BF 26 16         [ 4]  296     CALL BASE 
      00AAF6 07 98 90         [ 4]  297     CALL AT 
      00AAF9 59 17 07         [ 4]  298     CALL ULESS 
      002D46                        299     _QBRAN EDOT2 
      00AAFC 16 05 90         [ 4]    1     CALL QBRAN
      00AAFF 59 17                    2     .word EDOT2
      002D4B                        300     _DOLIT '.'
      00AB01 05 16 07         [ 4]    1     CALL DOLIT 
      00AB04 72 B9                    2     .word '.' 
      00AB06 00 26 17         [ 4]  301     CALL HOLD  
      00AB09 07 16 01         [ 4]  302     CALL DDIG
      00AB0C 90 5D 27         [ 4]  303     CALL FNE 
      002D59                        304     _QBRAN EDOT4 
      00AB0F 14 72 A2         [ 4]    1     CALL QBRAN
      00AB12 00 01                    2     .word EDOT4
      002D5E                        305     _DOLIT '-'
      00AB14 17 01 CD         [ 4]    1     CALL DOLIT 
      00AB17 A7 01                    2     .word '-' 
      00AB19 CD A9 75         [ 4]  306     CALL HOLD 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      00AB1C CD A7 01         [ 4]  307     CALL DROP 
      002D69                        308 EDOT4:       
      00AB1F 20 A9 BA         [ 4]  309     CALL EDIGS 
      00AB21 CD 0E BB         [ 4]  310     CALL TYPES
      00AB21 1C 00 02         [ 4]  311     CALL RFROM 
      00AB24 CD 07 4E         [ 4]  312     CALL QDUP 
      002D75                        313     _QBRAN EDOT5     
      00AB24 1C 00 04         [ 4]    1     CALL QBRAN
      00AB27 CD 85                    2     .word EDOT5
      002D7A                        314     _DOLIT 'E'
      00AB29 BB CD 86         [ 4]    1     CALL DOLIT 
      00AB2C 07 CD                    2     .word 'E' 
      00AB2E 85 BB CD         [ 4]  315     CALL EMIT 
      00AB31 A9 C8 CD         [ 4]  316     CALL DOT
      002D85                        317 EDOT5: 
      00AB34 A8 9C 90         [ 4]  318     CALL RFROM 
      00AB37 85 90 5D         [ 4]  319     CALL BASE 
      00AB3A 27 03 CD         [ 4]  320     CALL STORE  
      00AB3D 88               [ 4]  321     RET 
                                    322 
                                    323 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                    324 ;   F. (f# -- )
                                    325 ;   print float in fixed
                                    326 ;   point format. 
                                    327 ;;;;;;;;;;;;;;;;;;;;;;;;;
      002D8F                        328     _HEADER FDOT,2,"F."
      00AB3E 7D F3                    1         .word LINK 
                           002D91     2         LINK=.
      00AB3F 02                       3         .byte 2  
      00AB3F 81 AA                    4         .ascii "F."
      002D94                          5         FDOT:
      00AB41 47 02 44         [ 4]  329     CALL BASE 
      00AB44 2B 04 EA         [ 4]  330     CALL AT 
      00AB45 CD 05 5A         [ 4]  331     CALL TOR 
      002D9D                        332     _DOLIT 10 
      00AB45 90 93 90         [ 4]    1     CALL DOLIT 
      00AB48 FE 90                    2     .word 10 
      00AB4A BF 26 90         [ 4]  333     CALL BASE 
      00AB4D 93 90 EE         [ 4]  334     CALL STORE 
      00AB50 02 90 BF         [ 4]  335     CALL    ATEXP
      00AB53 24 1C 00         [ 4]  336     CALL    DUPP  
      00AB56 04 90 93         [ 4]  337     CALL    ABSS 
      002DB1                        338     _DOLIT  8
      00AB59 90 EE 02         [ 4]    1     CALL DOLIT 
      00AB5C 72 B9                    2     .word 8 
      00AB5E 00 24 EF         [ 4]  339     CALL    GREAT 
      002DB9                        340     _QBRAN  FDOT1 
      00AB61 02 90 93         [ 4]    1     CALL QBRAN
      00AB64 90 FE                    2     .word FDOT1
      00AB66 24 04 72         [ 2]  341     JP      EDOT0 
      002DC1                        342 FDOT1:
      00AB69 A9 00 01         [ 4]  343     CALL    SPACE 
      00AB6C CD 05 5A         [ 4]  344     CALL    TOR 
      00AB6C 72 B9 00         [ 4]  345     CALL    FNE 
      002DCA                        346     _QBRAN  FDOT0 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      00AB6F 26 FF 81         [ 4]    1     CALL QBRAN
      00AB72 AB 42                    2     .word FDOT0
      00AB74 02 44 2D         [ 4]  347     CALL    DNEGAT 
      00AB77                        348 FDOT0: 
      00AB77 90 93 90         [ 4]  349     CALL    BDIGS
      00AB7A FE 90 BF         [ 4]  350     CALL    RAT  
      00AB7D 26 90 93         [ 4]  351     CALL    ZLESS 
      002DDB                        352     _QBRAN  FDOT6 
      00AB80 90 EE 02         [ 4]    1     CALL QBRAN
      00AB83 90 BF                    2     .word FDOT6
      002DE0                        353 FDOT2: ; e<0 
      00AB85 24 1C 00         [ 4]  354     CALL    DDIG 
      00AB88 04 90 93         [ 4]  355     CALL    RFROM
      00AB8B 90 EE 02         [ 4]  356     CALL    ONEP 
      00AB8E 72 B2 00         [ 4]  357     CALL    QDUP 
      002DEC                        358     _QBRAN  FDOT3 
      00AB91 24 EF 02         [ 4]    1     CALL QBRAN
      00AB94 90 93                    2     .word FDOT3
      00AB96 90 FE 24         [ 4]  359     CALL    TOR 
      002DF4                        360     _BRAN   FDOT2 
      00AB99 04 72 A2         [ 4]    1     CALL BRAN 
      00AB9C 00 01                    2     .word FDOT2 
      00AB9E                        361 FDOT3:
      002DF9                        362     _DOLIT  '.' 
      00AB9E 72 B2 00         [ 4]    1     CALL DOLIT 
      00ABA1 26 FF                    2     .word '.' 
      00ABA3 81 AB 74         [ 4]  363     CALL    HOLD 
      00ABA6 04 46 50         [ 4]  364     CALL    DDIGS
      002E04                        365     _BRAN   FDOT9  
      00ABA9 53 57 B6         [ 4]    1     CALL BRAN 
      00ABAB 2E 1E                    2     .word FDOT9 
      002E09                        366 FDOT6: ; e>=0 
      002E09                        367     _BRAN   FDOT8
      00ABAB 90 AE 00         [ 4]    1     CALL BRAN 
      00ABAE 08 1D                    2     .word FDOT8 
      002E0E                        368 FDOT7:     
      002E0E                        369     _DOLIT  '0'
      00ABB0 00 02 FF         [ 4]    1     CALL DOLIT 
      00ABB3 81 AB                    2     .word '0' 
      00ABB5 A6 06 46         [ 4]  370     CALL    HOLD 
      002E16                        371 FDOT8:
      00ABB8 52 45 53         [ 4]  372     CALL    DONXT 
      00ABBB 45 54                  373     .word   FDOT7
      00ABBD CD 25 EA         [ 4]  374     CALL    DDIGS 
      002E1E                        375 FDOT9:
      00ABBD CD 84 F1         [ 4]  376     CALL    FNE 
      002E21                        377     _QBRAN  FDOT10 
      00ABC0 00 00 CD         [ 4]    1     CALL QBRAN
      00ABC3 AB AB                    2     .word FDOT10
      002E26                        378     _DOLIT '-' 
      00ABC5 CD 85 53         [ 4]    1     CALL DOLIT 
      00ABC8 81 AB                    2     .word '-' 
      00ABCA B6 05 46         [ 4]  379     CALL   HOLD 
      002E2E                        380 FDOT10:
      00ABCD 49 4E 49         [ 4]  381     CALL    EDIGS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      00ABD0 54 0E BB         [ 4]  382     CALL    TYPES 
      00ABD1 CD 05 3B         [ 4]  383     CALL    RFROM 
      00ABD1 CD AB BD         [ 4]  384     CALL    BASE 
      00ABD4 81 AB CB         [ 4]  385     CALL    STORE 
      00ABD7 03               [ 4]  386     RET 
                                    387 
                                    388 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    389 ; return parsed exponent or 
                                    390 ; 0 if failed
                                    391 ; at entry exprect *a=='E'    
                                    392 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002E3E                        393 parse_exponent: ; a cntr -- e -1 | 0 
      00ABD8 46 45 52         [ 4]  394     CALL TOR   ; R: cntr 
      00ABDB CD 05 91         [ 4]  395     CALL DUPP 
      00ABDB CD AB AB         [ 4]  396     CALL CAT 
      002E47                        397     _DOLIT 'E' 
      00ABDE CD 85 6A         [ 4]    1     CALL DOLIT 
      00ABE1 81 AB                    2     .word 'E' 
      00ABE3 D7 03 46         [ 4]  398     CALL EQUAL 
      002E4F                        399     _QBRAN 1$
      00ABE6 5A 45 9A         [ 4]    1     CALL QBRAN
      00ABE8 2E 7F                    2     .word 1$
      00ABE8 CD AB AB         [ 4]  400     CALL ONEP 
      00ABEB CD 85 6A         [ 4]  401     CALL RFROM  ; a cntr 
      00ABEE CD 84 F1         [ 4]  402     CALL ONEM
      00ABF1 00 01 CD         [ 4]  403     CALL DUPP 
      002E60                        404     _QBRAN 2$ ; a cntr 
      00ABF4 86 70 81         [ 4]    1     CALL QBRAN
      00ABF7 AB E4                    2     .word 2$
      00ABF9 03 46 4E         [ 4]  405     CALL ZERO
      00ABFC 45 05 91         [ 4]  406     CALL DUPP 
      00ABFD CD 26 81         [ 4]  407     CALL DSWAP ; 0 0 a cntr  
      00ABFD CD AB AB         [ 4]  408     CALL nsign 
      00AC00 CD 85 6A         [ 4]  409     CALL TOR   ; R: esign  
      00AC03 CD 84 F1         [ 4]  410     CALL parse_digits
      002E77                        411     _QBRAN PARSEXP_SUCCESS ; parsed to end of string 
      00AC06 00 02 CD         [ 4]    1     CALL QBRAN
      00AC09 86 70                    2     .word PARSEXP_SUCCESS
                                    412 ; failed invalid character
      00AC0B 81 AB F9         [ 4]  413     CALL DDROP ; 0 a 
      002E7F                        414 1$: 
      00AC0E 03 46 4F         [ 4]  415     CALL RFROM ; sign||cntr  
      002E82                        416 2$:
      00AC11 56 07 A0         [ 4]  417     CALL DDROP  ; a cntr || a sign || 0 cntr   
      00AC12 CD 0B 4A         [ 4]  418     CALL ZERO   ; return only 0 
      00AC12 CD               [ 4]  419     RET 
      002E89                        420 PARSEXP_SUCCESS: 
      00AC13 AB AB CD         [ 4]  421     CALL DDROP ; drop dhi a 
      00AC16 85 6A CD         [ 4]  422     CALL RFROM ; es 
      002E8F                        423     _QBRAN 1$
      00AC19 84 F1 00         [ 4]    1     CALL QBRAN
      00AC1C 04 CD                    2     .word 1$
      00AC1E 86 70 81         [ 4]  424     CALL NEGAT
      002E97                        425 1$:
      002E97                        426     _DOLIT -1 ; -- e -1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      00AC21 AC 0E 03         [ 4]    1     CALL DOLIT 
      00AC24 53 46                    2     .word -1 
      00AC26 5A               [ 4]  427     RET 
                                    428 
                                    429 
                                    430 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    431 ;   FLOAT?  ( a dlo dhi a+ cntr sign d? -- f -3 | a 0 )
                                    432 ;   called by NUMBER? 
                                    433 ;   convert string to float 
                                    434 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00AC27                        435     _HEADER FLOATQ,5,"FLOAT?"
      00AC27 CD 88                    1         .word LINK 
                           002E9F     2         LINK=.
      00AC29 2B                       3         .byte 5  
      00AC2A CD AB DB CD 84 F1        4         .ascii "FLOAT?"
      002EA6                          5         FLOATQ:
      002EA6                        436     _QBRAN FLOATQ0 
      00AC30 FF FE CD         [ 4]    1     CALL QBRAN
      00AC33 86 70                    2     .word FLOATQ0
      002EAB                        437     _BRAN FLOAT_ERROR  ; not a float, string start with '#'
      00AC35 CD 85 DA         [ 4]    1     CALL BRAN 
      00AC38 CD 84                    2     .word FLOAT_ERROR 
      002EB0                        438 FLOATQ0:
                                    439 ; BASE must be 10 
      00AC3A F1 80 7F         [ 4]  440     CALL BASE 
      00AC3D CD 86 70         [ 4]  441     CALL AT 
      002EB6                        442     _DOLIT 10 
      00AC40 CD A5 98         [ 4]    1     CALL DOLIT 
      00AC43 CD 84                    2     .word 10 
      00AC45 F1 00 01         [ 4]  443     CALL EQUAL 
      002EBE                        444     _QBRAN FLOAT_ERROR 
      00AC48 CD 86 70         [ 4]    1     CALL QBRAN
      00AC4B CD 85                    2     .word FLOAT_ERROR
                                    445 ; if float next char is '.' or 'E' 
      00AC4D BB CD 86         [ 4]  446     CALL TOR ; R: sign  
      00AC50 84 CD AB         [ 4]  447     CALL TOR ; R: sign cntr 
      00AC53 AB CD 85         [ 4]  448     CALL DUPP
      00AC56 53 81 AC         [ 4]  449     CALL CAT 
      002ECF                        450     _DOLIT '.' 
      00AC59 23 03 53         [ 4]    1     CALL DOLIT 
      00AC5C 46 4E                    2     .word '.' 
      00AC5E CD 08 61         [ 4]  451     CALL EQUAL 
      002ED7                        452     _QBRAN FLOATQ1 ; not a dot 
      00AC5E CD 86 11         [ 4]    1     CALL QBRAN
      00AC61 CD AB                    2     .word FLOATQ1
      00AC63 DB CD 84         [ 4]  453     CALL ONEP 
      00AC66 F1 FF FD         [ 4]  454     CALL RFROM  ; dlo dhi a cntr R: sign  
      00AC69 CD 86 70         [ 4]  455     CALL ONEM 
      00AC6C CD 85 DA         [ 4]  456     CALL DUPP 
      00AC6F CD 84 F1         [ 4]  457     CALL TOR  ; R: sign cntr 
                                    458 ; parse fractional part
      00AC72 80 00 CD         [ 4]  459     CALL parse_digits ; dlo dhi a cntr -- dm a cntr 
      00AC75 86 70 90         [ 4]  460     CALL DUPP 
      00AC78 93 90 FE         [ 4]  461     CALL RFROM 
      00AC7B 98 90 59         [ 4]  462     CALL SWAPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      00AC7E 90 59 90         [ 4]  463     CALL SUBB ; fd -> fraction digits count 
      00AC81 59 FF CD         [ 4]  464     CALL TOR  ; dlo dhi a cntr R: sign fd 
      00AC84 85 BB CD         [ 4]  465     CALL DUPP ; cntr cntr  
      002F00                        466     _QBRAN 1$ ; end of string, no exponent
      00AC87 86 84 CD         [ 4]    1     CALL QBRAN
      00AC8A AB AB                    2     .word 1$
      002F05                        467     _BRAN FLOATQ2
      00AC8C CD 85 53         [ 4]    1     CALL BRAN 
      00AC8F 81 AC                    2     .word FLOATQ2 
      00AC91 5A 03 53         [ 4]  468 1$: CALL SWAPP 
      00AC94 46 56 87         [ 4]  469     CALL DROP ; a
      00AC96                        470     _BRAN FLOATQ3        
      00AC96 CD AB AB         [ 4]    1     CALL BRAN 
      00AC99 CD 85                    2     .word FLOATQ3 
      002F15                        471 FLOATQ1: ; must push fd==0 on RSTACK 
      00AC9B 6A CD 84         [ 4]  472     CALL RFROM ; cntr 
      00AC9E F1 00 04         [ 4]  473     CALL ZERO  ; fd 
      00ACA1 CD 86 84         [ 4]  474     CALL TOR   ; dm a cntr R: sign fd 
      002F1E                        475 FLOATQ2: 
      00ACA4 CD AB AB         [ 4]  476     CALL parse_exponent 
      002F21                        477     _QBRAN FLOAT_ERROR0 ; exponent expected 
      00ACA7 CD 85 53         [ 4]    1     CALL QBRAN
      00ACAA 81 AC                    2     .word FLOAT_ERROR0
      002F26                        478 FLOATQ3: ; dm 0 || dm e  
      00ACAC 92 04 46         [ 4]  479     CALL RFROM ;  fd  
      00ACAF 3E 4D 45         [ 4]  480     CALL SUBB  ; exp=e-fd 
      00ACB2 CD 07 7E         [ 4]  481     CALL NROT 
      00ACB2 CD AB BD         [ 4]  482     CALL RFROM  ; sign 
      002F32                        483     _QBRAN FLOATQ4 
      00ACB5 CD AC 5E         [ 4]    1     CALL QBRAN
      00ACB8 CD AC                    2     .word FLOATQ4
      00ACBA 27 CD 86         [ 4]  484     CALL DNEGA 
      002F3A                        485 FLOATQ4:
      00ACBD 11 CD 84         [ 4]  486     CALL ROT 
      00ACC0 F1 7F 80         [ 4]  487     CALL STEXP 
      00ACC3 CD 86 70         [ 4]  488     CALL ROT 
      00ACC6 CD 84 F1         [ 4]  489     CALL DROP 
      002F46                        490     _DOLIT -3 
      00ACC9 00 07 CD         [ 4]    1     CALL DOLIT 
      00ACCC 8B 98                    2     .word -3 
      00ACCE CD               [ 4]  491     RET       
      002F4C                        492 FLOAT_ERROR0: 
      00ACCF 84 F1 00         [ 4]  493     CALL DRFROM ; sign df      
      002F4F                        494 FLOAT_ERROR: 
      00ACD2 7F CD 88         [ 4]  495     CALL DEPTH 
      00ACD5 B9 CD 85         [ 4]  496     CALL CELLS 
      00ACD8 DA CD 84         [ 4]  497     CALL SPAT 
      00ACDB F1 00 7F         [ 4]  498     CALL SWAPP 
      00ACDE CD 86 70         [ 4]  499     CALL PLUS  
      00ACE1 CD AB FD         [ 4]  500     CALL SPSTO 
      002F61                        501     _DOLIT 0 
      00ACE4 CD 85 1A         [ 4]    1     CALL DOLIT 
      00ACE7 AC EC                    2     .word 0 
      00ACE9 CD               [ 4]  502     RET 
                                    503 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



                                    504 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    505 ;  LSCALE ( f# -- f# )
                                    506 ;  m *=fbase , e -= 1
                                    507 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002F67                        508     _HEADER LSCALE,6,"LSCALE"
      00ACEA A5 B6                    1         .word LINK 
                           002F69     2         LINK=.
      00ACEC 06                       3         .byte 6  
      00ACEC CD 85 BB 81 AC AD        4         .ascii "LSCALE"
      002F70                          5         LSCALE:
      00ACF2 04 4D 45         [ 4]  509     CALL ATEXP 
      002F73                        510     _DOLIT 1 
      00ACF5 3E 46 71         [ 4]    1     CALL DOLIT 
      00ACF7 00 01                    2     .word 1 
      00ACF7 CD 86 11         [ 4]  511     CALL SUBB 
      00ACFA CD 88 D3         [ 4]  512     CALL TOR
      002F7E                        513     _DOLIT 10 
      00ACFD CD 84 F1         [ 4]    1     CALL DOLIT 
      00AD00 00 7F                    2     .word 10 
      00AD02 CD 89 3D         [ 4]  514     CALL DSSTAR
      00AD05 CD 85 1A         [ 4]  515     CALL RFROM 
      00AD08 AD 0D CD         [ 4]  516     CALL STEXP 
      00AD0B AC               [ 4]  517     RET  
                                    518 
                                    519 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    520 ;  RSCALE ( f# -- f# )
                                    521 ;  m /=fbase , e+=1 
                                    522 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002F8D                        523     _HEADER RSCALE,6,"RSCALE"
      00AD0C 96 69                    1         .word LINK 
                           002F8F     2         LINK=.
      00AD0D 06                       3         .byte 6  
      00AD0D CD 84 F1 00 7F CD        4         .ascii "RSCALE"
      002F96                          5         RSCALE:
      00AD13 88 40 CD         [ 4]  524     CALL ATEXP 
      002F99                        525     _DOLIT 1 
      00AD16 84 F1 00         [ 4]    1     CALL DOLIT 
      00AD19 FF CD                    2     .word 1 
      00AD1B 86 70 CD         [ 4]  526     CALL PLUS 
      00AD1E 84 F1 00         [ 4]  527     CALL TOR 
      002FA4                        528     _DOLIT 10 
      00AD21 07 CD 8B         [ 4]    1     CALL DOLIT 
      00AD24 7C CD                    2     .word 10 
      00AD26 85 DA CD         [ 4]  529     CALL DSLMOD 
      00AD29 86 11 CD         [ 4]  530     CALL ROT 
      00AD2C 84 F1 80         [ 4]  531     CALL DROP 
      00AD2F 00 CD 86         [ 4]  532     CALL RFROM 
      00AD32 70 CD 85         [ 4]  533     CALL STEXP 
      00AD35 1A               [ 4]  534     RET 
                                    535 
                                    536 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    537 ;   SCALE>M ( ud1 -- e ud2 )
                                    538 ;   scale down a double  
                                    539 ;   by repeated d/10
                                    540 ;   until ud<=MAX_MANTISSA   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



                                    541 ;   e is log10 exponent of scaled down
                                    542 ;   ud2 is scaled down ud1 
                                    543 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002FB9                        544     _HEADER SCALETOM,7,"SCALE>M"
      00AD36 AD 49                    1         .word LINK 
                           002FBB     2         LINK=.
      00AD38 CD                       3         .byte 7  
      00AD39 84 F1 80 00 CD 85 BB     4         .ascii "SCALE>M"
      002FC3                          5         SCALETOM:
      00AD40 CD 86 84         [ 4]  545     CALL ZERO 
      00AD43 CD 85 DA         [ 4]  546     CALL NROT 
      002FC9                        547 SCAL1:
      00AD46 CD A5 B6         [ 4]  548     CALL DUPP 
      00AD49                        549     _DOLIT 0X7F 
      00AD49 CD 86 11         [ 4]    1     CALL DOLIT 
      00AD4C CD 84                    2     .word 0X7F 
      00AD4E F1 00 7F         [ 4]  550     CALL UGREAT 
      002FD4                        551     _QBRAN SCAL2  
      00AD51 CD 89 3D         [ 4]    1     CALL QBRAN
      00AD54 CD 85                    2     .word SCAL2
      002FD9                        552     _DOLIT 10 
      00AD56 1A AD 5C         [ 4]    1     CALL DOLIT 
      00AD59 CD AC                    2     .word 10 
      00AD5B 96 25 90         [ 4]  553     CALL DSLMOD 
      00AD5C CD 07 5F         [ 4]  554     CALL ROT  
      00AD5C CD 84 F1         [ 4]  555     CALL DROP
      00AD5F 00 7F CD         [ 4]  556     CALL ROT 
      00AD62 86 70 CD         [ 4]  557     CALL ONEP 
      00AD65 85 BB CD         [ 4]  558     CALL NROT  
      002FF0                        559     _BRAN SCAL1 
      00AD68 86 84 CD         [ 4]    1     CALL BRAN 
      00AD6B AC 27                    2     .word SCAL1 
      002FF5                        560 SCAL2: 
      00AD6D CD               [ 4]  561     RET 
                                    562 
                                    563 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    564 ;  UDIV10 ( ut -- ut )
                                    565 ;  divide a 48 bits uint by 10 
                                    566 ;  used to scale down MM* 
                                    567 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002FF6                        568 UDIV10:
      00AD6E AC 5E            [ 1]  569     LDW Y,X 
      00AD70 81 AC            [ 2]  570     LDW Y,(Y)
      00AD72 F2 02            [ 1]  571     LD A,#10 
      00AD74 45 2E            [ 2]  572     DIV Y,A 
      00AD76 FF               [ 2]  573     LDW (X),Y 
      00AD76 CD 86            [ 1]  574     LD YH,A 
      00AD78 E1 CD            [ 1]  575     LD A,(2,X)
      00AD7A 85 6A            [ 1]  576     LD YL,A 
      00AD7C CD 85            [ 1]  577     LD A,#10 
      00AD7E DA CD            [ 2]  578     DIV Y,A 
      00AD80 84 F1            [ 1]  579     LD YH,A 
      00AD82 00 0A            [ 1]  580     LD A,YL 
      00AD84 CD 86            [ 1]  581     LD (2,X),A 
      00AD86 E1 CD            [ 1]  582     LD A,(3,X)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



      00AD88 85 53            [ 1]  583     LD YL,A 
      00AD8A CD AC            [ 1]  584     LD A,#10 
      00AD8C B2 62            [ 2]  585     DIV Y,A 
      00AD8D 90 95            [ 1]  586     LD YH,A 
      00AD8D CD 85            [ 1]  587     LD A,YL 
      00AD8F DA CD            [ 1]  588     LD (3,X),A 
      00AD91 AB FD            [ 1]  589     LD A,(4,X)
      00AD93 CD 85            [ 1]  590     LD YL,A 
      00AD95 1A AD            [ 1]  591     LD A,#10 
      00AD97 9B CD            [ 2]  592     DIV Y,A 
      00AD99 A5 B6            [ 1]  593     LD YH,A 
      00AD9B 90 9F            [ 1]  594     LD A,YL 
      00AD9B CD 8F            [ 1]  595     LD (4,X),A 
      00AD9D 11 CD            [ 1]  596     LD A,(5,X)
      00AD9F 8D D5            [ 1]  597     LD YL,A 
      00ADA1 A6 0A            [ 1]  598     LD A,#10 
      00ADA1 CD A6            [ 2]  599     DIV Y,A 
      00ADA3 51 CD            [ 1]  600     LD A,YL 
      00ADA5 85 BB            [ 1]  601     LD (5,X),A 
      00ADA7 CD               [ 4]  602     RET 
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
      003038                        613     _HEADER MMSTAR,3,"MM*"
      00ADA8 8B 5E                    1         .word LINK 
                           00303A     2         LINK=.
      00ADAA CD                       3         .byte 3  
      00ADAB 85 DA CD                 4         .ascii "MM*"
      00303E                          5         MMSTAR:
      00ADAE 86 11 CD         [ 4]  614     CALL DDUP
      00ADB1 85 1A AD         [ 4]  615     CALL DZEQUAL
      003044                        616     _TBRAN MMSTA2
      00ADB4 BA CD 85         [ 4]    1     CALL TBRAN 
      00ADB7 36 AD                    2     .word MMSTA2 
      003049                        617 MMSTA1:
      00ADB9 A1 28 C5         [ 4]  618     CALL DOVER 
      00ADBA CD 25 18         [ 4]  619     CALL DZEQUAL 
      00304F                        620     _QBRAN MMSTA3 
      00ADBA CD 86 3B         [ 4]    1     CALL QBRAN
      00ADBD CD 86                    2     .word MMSTA3
      003054                        621 MMSTA2: ; ( -- 0 0 0 )
      00ADBF E1 CD 85         [ 2]  622     ADDW X,#2 
      00ADC2 6A CD            [ 1]  623     CLRW Y 
      00ADC4 89               [ 2]  624     LDW (X),Y 
      00ADC5 00 CD            [ 2]  625     LDW (2,X),Y
      00ADC7 85 1A            [ 2]  626     LDW (4,X),Y 
      00ADC9 AD               [ 4]  627     RET 
      00305F                        628 MMSTA3:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      00ADCA A1 CD 84         [ 4]  629     CALL DSIGN 
      00ADCD F1 00 2E         [ 4]  630     CALL TOR    ; R: m2sign 
      00ADD0 CD 8D E5         [ 4]  631     CALL DABS   ; m1 um2 
      00ADD3 CD A6 51         [ 4]  632     CALL DSWAP  ; um2 m1 
      00ADD6 CD AB FD         [ 4]  633     CALL DSIGN  ; um2 m1 m1sign 
      00ADD9 CD 85 1A         [ 4]  634     CALL RFROM 
      00ADDC AD E9 CD         [ 4]  635     CALL XORR 
      00ADDF 84 F1 00         [ 4]  636     CALL TOR   ; R: product_sign 
      00ADE2 2D CD 8D         [ 4]  637     CALL DABS  ; um2 um1  
      00ADE5 E5 CD 86         [ 4]  638     CALL DTOR  ; um2 
      00ADE8 07 05 91         [ 4]  639     CALL DUPP  ; um2 um2hi 
      00ADE9 CD 05 4E         [ 4]  640     CALL RAT   ; um2 um2hi um1hi
                                    641 ; first partial product  
                                    642 ; pd1=um2hi*um1hi 
      00ADE9 CD 8E 3A         [ 4]  643     CALL STAR 
      00ADEC CD 8F 3B         [ 4]  644     CALL ZERO 
      00ADEF CD 85 BB         [ 4]  645     CALL SWAPP ; pd1<<16  
      00ADF2 CD 87 CE         [ 4]  646     CALL DSWAP ; pd1 um2 
      00ADF5 CD 85 1A         [ 4]  647     CALL OVER  ; pd1 um2 um2lo 
      00ADF8 AE 05 CD         [ 4]  648     CALL RFROM ; pd1 um2 um2lo um1hi 
                                    649 ; pd2=um2lo*um1hi 
      00ADFB 84 F1 00         [ 4]  650     CALL UMSTA ; pd1 um2 pd2 
      00ADFE 45 CD 84         [ 4]  651     CALL DSWAP ; pd1 pd2 um2 
      00AE01 B6 CD 90         [ 4]  652     CALL RAT   ; pd1 pd2 um2 um1lo 
                                    653 ; pd3= um2hi*um1lo 
      00AE04 12 0A 13         [ 4]  654     CALL UMSTA ; pd1 pd2 um2lo pd3 
      00AE05 CD 07 5F         [ 4]  655     CALL ROT ; pd1 pd2 pd3 um2lo 
      00AE05 CD 85 BB         [ 4]  656     CALL TOR ; pd1 pd2 pd3 R: psign um1lo um2lo 
                                    657 ; pd1+pd2+pd3  pd1
      00AE08 CD 86 E1         [ 4]  658     CALL DPLUS 
      00AE0B CD 85 53         [ 4]  659     CALL DPLUS  
      00AE0E 81 AD 73         [ 4]  660     CALL DRFROM ; triple um2lo um1lo 
                                    661 ; last partial product um2lo*um1lo 
      00AE11 02 46 2E         [ 4]  662     CALL UMSTA ; prod pd4 
                                    663 ; mm*=prod<<16+pd4  
      00AE14 CD 27 FE         [ 4]  664     CALL DTOR ;   R: psign pd4lo pd4hi  
                                    665  ; add pd4hi to prodlo and propagate carry 
      00AE14 CD 86            [ 1]  666     LDW Y,X 
      00AE16 E1 CD 85         [ 2]  667     LDW Y,(2,Y)  ; prodlo 
      00AE19 6A CD 85         [ 2]  668     ADDW Y,(1,SP)  ; prodlo+pd4hi 
      00AE1C DA CD            [ 2]  669     LDW (1,SP),Y    ; plo phi  
      00AE1E 84 F1            [ 1]  670     LDW Y,X
      00AE20 00 0A            [ 2]  671     LDW Y,(Y) ; prodhi  
      00AE22 CD 86            [ 1]  672     JRNC MMSTA4
      00AE24 E1 CD 85 53      [ 2]  673     ADDW Y,#1 ; add carry 
      0030CA                        674 MMSTA4:     
      00AE28 CD AC B2         [ 2]  675     SUBW X,#2 
      00AE2B CD               [ 2]  676     LDW (X),Y 
      00AE2C 86 11            [ 2]  677     POPW Y 
      00AE2E CD 88            [ 2]  678     LDW (2,X),Y 
      00AE30 D3 CD            [ 2]  679     POPW Y 
      00AE32 84 F1            [ 2]  680     LDW (4,X),Y
      00AE34 00 08 CD         [ 4]  681     CALL ZERO 
      00AE37 89 5C CD         [ 4]  682     CALL TOR 
      0030DC                        683 MMSTA5:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      00AE3A 85 1A AE         [ 4]  684     CALL QDUP 
      0030DF                        685     _QBRAN MMSTA6 
      00AE3D 41 CC AD         [ 4]    1     CALL QBRAN
      00AE40 8D F5                    2     .word MMSTA6
      00AE41 CD 2F F6         [ 4]  686     CALL UDIV10 
      00AE41 CD 8F 11         [ 4]  687     CALL RFROM 
      00AE44 CD 85 DA         [ 4]  688     CALL ONEP 
      00AE47 CD AB FD         [ 4]  689     CALL TOR 
      0030F0                        690     _BRAN MMSTA5 
      00AE4A CD 85 1A         [ 4]    1     CALL BRAN 
      00AE4D AE 52                    2     .word MMSTA5 
                                    691 ; now scale to double 
                                    692 ; scale further <= MAX_MANTISSA 
      0030F5                        693 MMSTA6: 
      00AE4F CD A5 B6         [ 4]  694     CALL RFROM 
      00AE52 CD 07 7E         [ 4]  695     CALL NROT 
      00AE52 CD 8D D5         [ 4]  696     CALL SCALETOM
      00AE55 CD 85 CE         [ 4]  697     CALL DTOR 
      00AE58 CD 86 4A         [ 4]  698     CALL PLUS 
      00AE5B CD 85 1A         [ 4]  699     CALL DRFROM 
      00AE5E AE 89 3B         [ 4]  700     CALL RFROM
      00AE60                        701     _QBRAN MMSTA7
      00AE60 CD A6 51         [ 4]    1     CALL QBRAN
      00AE63 CD 85                    2     .word MMSTA7
      00AE65 BB CD 8B         [ 4]  702     CALL DNEGA
      003112                        703 MMSTA7:
      00AE68 5E CD 87         [ 4]  704     CALL ROT ; m e 
      00AE6B CE               [ 4]  705     RET 
                                    706 
                                    707 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    708 ;    F* ( f#1 f#2 -- f#3 )
                                    709 ;    float product 
                                    710 ;    f#3=f#1 * f#2 
                                    711 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003116                        712     _HEADER FSTAR,2,"F*"
      00AE6C CD 85                    1         .word LINK 
                           003118     2         LINK=.
      00AE6E 1A                       3         .byte 2  
      00AE6F AE 79                    4         .ascii "F*"
      00311B                          5         FSTAR:
      00AE71 CD 85 DA         [ 4]  713     CALL ATEXP ; f#1 m2 e2 
      00AE74 CD 85 36         [ 4]  714     CALL TOR   
      00AE77 AE 60 81         [ 4]  715     CALL DSWAP ; m2 f#1
      00AE79 CD 2C 32         [ 4]  716     CALL ATEXP ; m2 m1 e1 
      00AE79 CD 84 F1         [ 4]  717     CALL RFROM ; m2 m1 e1 e2 
      00AE7C 00 2E CD         [ 4]  718     CALL PLUS  ; m2 m1 e 
      00AE7F 8D E5 CD         [ 4]  719     CALL TOR   ; m2 m1 R: e 
      00AE82 A6 6A CD         [ 4]  720     CALL MMSTAR ; m2*m1 e   
      00AE85 85 36 AE         [ 4]  721     CALL RFROM 
      00AE88 9E 07 C0         [ 4]  722     CALL PLUS 
      00AE89 CD 2C 77         [ 4]  723     CALL STEXP ; f#3 
      00AE89 CD               [ 4]  724     RET 
                                    725 
                                    726 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    727 ;  F/ ( f#1 f#2 -- f#3 )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



                                    728 ;  float division
                                    729 ;  f#3 = f#1/f#2
                                    730 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00313D                        731     _HEADER FSLASH,2,"F/"
      00AE8A 85 36                    1         .word LINK 
                           00313F     2         LINK=.
      00AE8C AE                       3         .byte 2  
      00AE8D 96 2F                    4         .ascii "F/"
      00AE8E                          5         FSLASH:
      00AE8E CD 84 F1         [ 4]  732     CALL ATEXP  ; f#1 m2 e2  
      00AE91 00 30 CD         [ 4]  733     CALL TOR    ; f#1 m2   R: e2 
      00AE94 8D E5 81         [ 4]  734     CALL DSWAP  ; m2 f#1 
      00AE96 CD 2C 32         [ 4]  735     CALL ATEXP  ; m2 m1 e1 
      00AE96 CD 85 05         [ 4]  736     CALL RFROM  ; m2 m1 e1 e2
      00AE99 AE 8E CD         [ 4]  737     CALL PLUS   ; m2 m1 e 
      00AE9C A6 6A 5A         [ 4]  738     CALL TOR    ; m2 m1 R: e 
      00AE9E CD 26 81         [ 4]  739     CALL DSWAP  ; m1 m2 R: e
      00AE9E CD AB FD         [ 4]  740     CALL DDUP  ; m1 m2 m2 R: e
      00AEA1 CD 85 1A         [ 4]  741     CALL DTOR  ; m1 m2 R: e m2 ( keep divisor need later ) 
      00AEA4 AE AE CD         [ 4]  742     CALL DDSLMOD ; remainder m1/m2 R: e m2 
      00AEA7 84 F1 00         [ 4]  743     CALL DOVER ; if remainder null done 
      00AEAA 2D CD 8D         [ 4]  744     CALL DZEQUAL 
      003169                        745     _TBRAN FSLASH8 
      00AEAD E5 04 A8         [ 4]    1     CALL TBRAN 
      00AEAE 31 C5                    2     .word FSLASH8 
                                    746 ; get fractional digits from remainder until mantissa saturate
      00316E                        747 FSLASH1: ; remainder mantissa R: e divisor 
                                    748 ; check for mantissa saturation 
      00AEAE CD 8E 3A         [ 4]  749     CALL DDUP 
      003171                        750     _DOLIT 0XCCCC 
      00AEB1 CD 8F 3B         [ 4]    1     CALL DOLIT 
      00AEB4 CD 85                    2     .word 0XCCCC 
      003176                        751     _DOLIT 0xC
      00AEB6 BB CD 86         [ 4]    1     CALL DOLIT 
      00AEB9 E1 CD                    2     .word 0xC 
      00AEBB 85 53 81         [ 4]  752     CALL DGREAT 
      00AEBE                        753     _TBRAN FSLASH8 ; another loop would result in mantissa overflow 
      00AEBE CD 85 DA         [ 4]    1     CALL TBRAN 
      00AEC1 CD 86                    2     .word FSLASH8 
                                    754 ; multiply mantissa by 10 
      003183                        755     _DOLIT 10 
      00AEC3 11 CD 85         [ 4]    1     CALL DOLIT 
      00AEC6 88 CD                    2     .word 10 
      00AEC8 84 F1 00         [ 4]  756     CALL ZERO 
      00AECB 45 CD 88         [ 4]  757     CALL DSTAR 
                                    758 ; mutliply remainder by 10     
      00AECE E1 CD 85         [ 4]  759     CALL DSWAP 
      003191                        760     _DOLIT 10 
      00AED1 1A AE FF         [ 4]    1     CALL DOLIT 
      00AED4 CD 8B                    2     .word 10 
      00AED6 5E CD 85         [ 4]  761     CALL ZERO 
      00AED9 BB CD 8B         [ 4]  762     CALL DSTAR 
                                    763 ; divide remainder by m2     
      00AEDC 6B CD 86         [ 4]  764     CALL DRAT 
      00AEDF 11 CD 85         [ 4]  765     CALL DDSLMOD 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      00AEE2 1A AF 02         [ 4]  766     CALL DSWAP ; mantissa frac_digit remainder R: e divisor  
      00AEE5 CD 8B CA         [ 4]  767     CALL DTOR  ; mantissa frac_digit R: e divisor remainder 
      00AEE8 CD 86 11         [ 4]  768     CALL DPLUS ; mantissa+frac_digit 
      00AEEB CD A7 01         [ 4]  769     CALL DRFROM ; mantissa remainder 
      00AEEE CD A4 46         [ 4]  770     CALL DRFROM ; mantissa remainder divisor 
      00AEF1 CD 85 DA         [ 4]  771     CALL RFROM  ; mantissa remainder divisor e 
      00AEF4 CD A4 7E         [ 4]  772     CALL ONEM   ; decrement exponent 
      00AEF7 CD 85 1A         [ 4]  773     CALL TOR    ; mantissa remainder divisor R: e 
      00AEFA AF 09 CD         [ 4]  774     CALL DTOR   ; mantissa remainder R: e divisor 
      00AEFD 88 20 81         [ 4]  775     CALL DSWAP  ; remainder mantissa  
      00AEFF                        776     _BRAN FSLASH1
      00AEFF CD 85 BB         [ 4]    1     CALL BRAN 
      00AF02 31 6E                    2     .word FSLASH1 
      0031C5                        777 FSLASH8: ; remainder mantissa R: e divisor 
      00AF02 CD 88 20         [ 4]  778     CALL DSWAP  
      00AF05 CD 8B CA         [ 4]  779     CALL DDROP  ; drop remainder     
      00AF08 81 28 1C         [ 4]  780     CALL DRFROM
      00AF09 CD 07 A0         [ 4]  781     CALL DDROP  ; drop divisor 
      00AF09 CD 88 20         [ 4]  782     CALL RFROM  ; exponent 
      00AF0C CD 85 BB         [ 4]  783     CALL STEXP 
      00AF0F CD               [ 4]  784     RET 
                                    785 
                                    786 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    787 ;   D>F  ( # -- f# )
                                    788 ;   convert double to float 
                                    789 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0031D8                        790     _HEADER DTOF,3,"D>F"
      00AF10 85 1A                    1         .word LINK 
                           0031DA     2         LINK=.
      00AF12 AF                       3         .byte 3  
      00AF13 17 CD 88                 4         .ascii "D>F"
      0031DE                          5         DTOF:
      00AF16 6B 25 77         [ 4]  791     CALL DSIGN 
      00AF17 CD 05 5A         [ 4]  792     CALL TOR
      00AF17 CD 84 F1         [ 4]  793     CALL DABS  
      0031E7                        794 DTOF1:      
      00AF1A FF FF 81         [ 4]  795     CALL SCALETOM 
      00AF1D AE 11 05         [ 4]  796     CALL RFROM
      0031ED                        797     _QBRAN DTOF2 
      00AF20 46 4C 4F         [ 4]    1     CALL QBRAN
      00AF23 41 54                    2     .word DTOF2
      00AF25 3F 25 36         [ 4]  798     CALL DNEGAT 
      00AF26                        799 DTOF2: 
      00AF26 CD 85 1A         [ 4]  800     CALL ROT 
      00AF29 AF 30 CD         [ 4]  801     CALL STEXP 
      00AF2C 85               [ 4]  802     RET 
                                    803 
                                    804 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    805 ;   F>D  ( f# -- # )
                                    806 ;  convert float to double 
                                    807 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0031FC                        808     _HEADER FTOD,3,"F>D"
      00AF2D 36 AF                    1         .word LINK 
                           0031FE     2         LINK=.
      00AF2F CF                       3         .byte 3  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      00AF30 46 3E 44                 4         .ascii "F>D"
      003202                          5         FTOD:
      00AF30 CD 86 E1         [ 4]  809     CALL ATEXP ; m e 
      00AF33 CD 85 6A         [ 4]  810     CALL QDUP
      003208                        811     _QBRAN FTOD9
      00AF36 CD 84 F1         [ 4]    1     CALL QBRAN
      00AF39 00 0A                    2     .word FTOD9
      00AF3B CD 88 E1         [ 4]  812     CALL TOR 
      00AF3E CD 85 1A         [ 4]  813     CALL DSIGN 
      00AF41 AF CF CD         [ 4]  814     CALL NROT 
      00AF44 85 DA CD         [ 4]  815     CALL DABS
      00AF47 85 DA CD         [ 4]  816     CALL RFROM  
      00AF4A 86 11 CD         [ 4]  817     CALL DUPP   
      00AF4D 85 88 CD         [ 4]  818     CALL ZLESS 
      003222                        819     _QBRAN FTOD4 
      00AF50 84 F1 00         [ 4]    1     CALL QBRAN
      00AF53 2E CD                    2     .word FTOD4
                                    820 ; negative exponent 
      00AF55 88 E1 CD         [ 4]  821     CALL ABSS 
      00AF58 85 1A AF         [ 4]  822     CALL TOR
      00322D                        823     _BRAN FTOD2  
      00AF5B 95 CD 8B         [ 4]    1     CALL BRAN 
      00AF5E 5E CD                    2     .word FTOD2 
      003232                        824 FTOD1:
      00AF60 85 BB CD         [ 4]  825     CALL DDUP 
      00AF63 8B 6B CD         [ 4]  826     CALL DZEQUAL 
      003238                        827     _TBRAN FTOD3 
      00AF66 86 11 CD         [ 4]    1     CALL TBRAN 
      00AF69 85 DA                    2     .word FTOD3 
      00323D                        828     _DOLIT 10 
      00AF6B CD A4 7E         [ 4]    1     CALL DOLIT 
      00AF6E CD 86                    2     .word 10 
      00AF70 11 CD 85         [ 4]  829     CALL DSLMOD 
      00AF73 BB CD 86         [ 4]  830     CALL ROT 
      00AF76 21 CD 88         [ 4]  831     CALL DROP
      00324B                        832 FTOD2:      
      00324B                        833     _DONXT FTOD1
      00AF79 B9 CD 85         [ 4]    1     CALL DONXT 
      00AF7C DA CD                    2     .word FTOD1 
      003250                        834     _BRAN FTOD8   
      00AF7E 86 11 CD         [ 4]    1     CALL BRAN 
      00AF81 85 1A                    2     .word FTOD8 
      003255                        835 FTOD3: 
      00AF83 AF 8A CD         [ 4]  836     CALL RFROM 
      00AF86 85 36 AF         [ 4]  837     CALL DROP 
      00325B                        838     _BRAN FTOD8  
      00AF89 9E CD 86         [ 4]    1     CALL BRAN 
      00AF8C 21 CD                    2     .word FTOD8 
                                    839 ; positive exponent 
      003260                        840 FTOD4:
      00AF8E 86 07 CD         [ 4]  841     CALL TOR 
      003263                        842     _BRAN FTOD6
      00AF91 85 36 AF         [ 4]    1     CALL BRAN 
      00AF94 A6 88                    2     .word FTOD6 
      00AF95                        843 FTOD5:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      00AF95 CD 85 BB         [ 4]  844     CALL DDUP 
      00326B                        845     _DOLIT 0XCCCC
      00AF98 CD 8B CA         [ 4]    1     CALL DOLIT 
      00AF9B CD 85                    2     .word 0XCCCC 
      003270                        846     _DOLIT 0XCCC  
      00AF9D DA 04 71         [ 4]    1     CALL DOLIT 
      00AF9E 0C CC                    2     .word 0XCCC 
      00AF9E CD AE BE         [ 4]  847     CALL DGREAT 
      003278                        848     _TBRAN FTOD3 
      00AFA1 CD 85 1A         [ 4]    1     CALL TBRAN 
      00AFA4 AF CC                    2     .word FTOD3 
      00AFA6                        849     _DOLIT 10 
      00AFA6 CD 85 BB         [ 4]    1     CALL DOLIT 
      00AFA9 CD 88                    2     .word 10 
      00AFAB B9 CD 87         [ 4]  850     CALL ZERO 
      00AFAE FE CD 85         [ 4]  851     CALL DSTAR 
      003288                        852 FTOD6: 
      003288                        853     _DONXT FTOD5 
      00AFB1 BB CD 85         [ 4]    1     CALL DONXT 
      00AFB4 1A AF                    2     .word FTOD5 
      00328D                        854 FTOD8:
      00AFB6 BA CD 88         [ 4]  855     CALL ROT 
      003290                        856     _QBRAN FTOD9 
      00AFB9 7D 04 9A         [ 4]    1     CALL QBRAN
      00AFBA 32 98                    2     .word FTOD9
      00AFBA CD 87 DF         [ 4]  857     CALL DNEGA
      003298                        858 FTOD9:          
      00AFBD CD               [ 4]  859     RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



                                   4835 .endif 
                                   4836 
                                   4837 ;===============================================================
                                   4838 
                           0031FE  4839 LASTN =	LINK   ;last name defined
                                   4840 
                                   4841 ; application code begin here
      003300                       4842 	.bndry 128 ; align on flash block  
      003300                       4843 app_space: 
                                   4844 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        00085C R   |   6 ABOR1      00135D R
  6 ABOR2      001374 R   |   6 ABORQ      001355 R   |   6 ABORT      001346 R
  6 ABRTQ      001631 R   |   6 ABSS       000853 R   |   6 ACCEP      0012DC R
  6 ACCP1      0012E5 R   |   6 ACCP2      00130B R   |   6 ACCP3      00130E R
  6 ACCP4      001310 R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
    ADC_CR1_=  000001     |     ADC_CR1_=  000004     |     ADC_CR1_=  000005 
    ADC_CR1_=  000006     |     ADC_CR2 =  005402     |     ADC_CR2_=  000003 
    ADC_CR2_=  000004     |     ADC_CR2_=  000005     |     ADC_CR2_=  000006 
    ADC_CR2_=  000001     |     ADC_CR3 =  005403     |     ADC_CR3_=  000007 
    ADC_CR3_=  000006     |     ADC_CSR =  005400     |     ADC_CSR_=  000006 
    ADC_CSR_=  000004     |     ADC_CSR_=  000000     |     ADC_CSR_=  000001 
    ADC_CSR_=  000002     |     ADC_CSR_=  000003     |     ADC_CSR_=  000007 
    ADC_CSR_=  000005     |     ADC_DRH =  005404     |     ADC_DRL =  005405 
    ADC_TDRH=  005406     |     ADC_TDRL=  005407     |   6 ADRADJ     00073E R
    AFR     =  004803     |     AFR0_ADC=  000000     |     AFR1_TIM=  000001 
    AFR2_CCO=  000002     |     AFR3_TIM=  000003     |     AFR4_TIM=  000004 
    AFR5_TIM=  000005     |     AFR6_I2C=  000006     |     AFR7_BEE=  000007 
  6 AFT        00161C R   |   6 AGAIN      001572 R   |   6 AHEAD      0015CF R
  6 ALLOT      001485 R   |   6 ANDD       0005F0 R   |     APP_CP  =  004004 
    APP_LAST=  004000     |     APP_RUN =  004002     |     APP_VP  =  004006 
  6 AT         0004EA R   |   6 ATEXE      000C6E R   |   6 ATEXP      002C32 R
  6 AUTORUN    000129 R   |     AWU_APR =  0050F1     |     AWU_CSR =  0050F0 
    AWU_TBR =  0050F2     |     B0_MASK =  000001     |     B115200 =  000006 
  6 B115K2     0003E0 R   |     B19200  =  000003     |   6 B19K2      0003BD R
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
  6 B2K4       00038E R   |     B2_MASK =  000004     |     B38400  =  000004 
    B3_MASK =  000008     |     B460800 =  000008     |     B4800   =  000001 
  6 B4K8       00039C R   |     B4_MASK =  000010     |     B57600  =  000005 
  6 B57K6      0003CE R   |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
  6 B9K6       0003AC R   |   6 BACK1      001284 R   |   6 BASE       000661 R
    BASEE   =  00000A     |   6 BAUD       0003F0 R   |     BCNT    =  000001 
  6 BCOMP      0014C7 R   |   6 BDIGS      000D55 R   |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
  6 BEGIN      001554 R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
  6 BKSLA      0010D9 R   |   6 BKSP       001254 R   |     BKSPP   =  000008 
  6 BLANK      000B3D R   |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |   6 BRAN       0004B6 R   |     BTW     =  000001 
  6 BUF2ROW    002099 R   |   6 BYE        0000B6 R   |     CADR    =  000003 
    CALLL   =  0000CD     |   6 CALLOT     0022E2 R   |     CAN_DGR =  005426 
    CAN_FPSR=  005427     |     CAN_IER =  005425     |     CAN_MCR =  005420 
    CAN_MSR =  005421     |     CAN_P0  =  005428     |     CAN_P1  =  005429 
    CAN_P2  =  00542A     |     CAN_P3  =  00542B     |     CAN_P4  =  00542C 
    CAN_P5  =  00542D     |     CAN_P6  =  00542E     |     CAN_P7  =  00542F 
    CAN_P8  =  005430     |     CAN_P9  =  005431     |     CAN_PA  =  005432 
    CAN_PB  =  005433     |     CAN_PC  =  005434     |     CAN_PD  =  005435 
    CAN_PE  =  005436     |     CAN_PF  =  005437     |     CAN_RFR =  005424 
    CAN_TPR =  005423     |     CAN_TSR =  005422     |     CARRY   =  00002A 
    CASE_SEN=  000000     |   6 CAT        000508 R   |   6 CCOMMA     0014A9 R
    CC_C    =  000000     |     CC_H    =  000004     |     CC_I0   =  000003 
    CC_I1   =  000005     |     CC_N    =  000002     |     CC_V    =  000007 
    CC_Z    =  000001     |     CELLL   =  000002     |   6 CELLM      000AC2 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]

Symbol Table

  6 CELLP      000AB3 R   |   6 CELLS      000AD1 R   |     CFG_GCR =  007F60 
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   6 CHAR1      000EAB R
  6 CHAR2      000EAE R   |   6 CHKIVEC    001F87 R   |     CLKOPT  =  004807 
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
    CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2     |   6 CMOV1      000C8D R
  6 CMOV2      000CA5 R   |   6 CMOVE      000C85 R   |     CNTDWN  =  000032 
  6 CNTXT      0006E4 R   |   6 COLD       001A88 R   |   6 COLD1      001A88 R
  6 COLON      0017DA R   |   6 COMMA      001492 R   |   6 COMPI      0014D7 R
    COMPO   =  000040     |   6 CONSTANT   001884 R   |   6 COUNT      000C21 R
  6 CPP        000700 R   |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
  6 CR         000ED9 R   |   6 CREAT      001820 R   |     CRR     =  00000D 
  6 CSTOR      0004F7 R   |   6 CTABLE     002303 R   |   6 CTAT       002324 R
  6 CTINIT     00234C R   |   6 D2SLASH    0028DE R   |   6 D2STAR     0028F5 R
  6 DABS       002560 R   |   6 DABS1      00256E R   |   6 DAT        000C01 R
    DATSTK  =  001680     |   6 DCLZ       0026AF R   |   6 DCLZ1      0026B8 R
  6 DCLZ4      0026C1 R   |   6 DCLZ8      0026CE R   |   6 DCMP       0027CC R
  6 DCMP2      0027D8 R   |   6 DCMP4      0027F3 R   |   6 DCMP_EQU   0027E5 R
  6 DCMP_GRE   0027EF R   |   6 DCMP_SMA   0027E9 R   |   6 DCONST     0018B9 R
  6 DDIG       0025D1 R   |   6 DDIGS      0025EA R   |   6 DDOT       002601 R
  6 DDOT0      002615 R   |   6 DDOT1      00262B R   |   6 DDROP      0007A0 R
  6 DDSLMOD    0029CE R   |   6 DDSTAR3    0029C4 R   |   6 DDUP       0007AB R
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   6 DECIM      000E05 R
  6 DEPTH      000B8C R   |   6 DEQU4      00276A R   |   6 DEQUAL     002755 R
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |   6 DGREAT     002776 R
  6 DGREAT4    00278B R   |   6 DGTQ1      000E4A R   |   6 DI         0000C4 R
  6 DIG        000D7E R   |   6 DIGIT      000D19 R   |   6 DIGS       000D8F R
  6 DIGS1      000D8F R   |   6 DIGS2      000D9C R   |   6 DIGTQ      000E19 R
    DISCOVER=  000000     |   6 DLESS      002797 R   |   6 DLESS4     0027AD R
  6 DLITER     00289E R   |   6 DLSHIFT    002911 R   |   6 DLSHIFT1   002922 R
  6 DLSHIFT2   002937 R   |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  6 DN1        00081A R   |   6 DNEG1      002555 R   |   6 DNEGA      0007FD R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]

Symbol Table

  6 DNEGAT     002536 R   |   6 DOCONST    0018A4 R   |   6 DOLIT      000471 R
  6 DONXT      000485 R   |     DOORBELL=  000000     |   6 DOSTR      000EEF R
  6 DOT        000F92 R   |   6 DOT1       000FA8 R   |   6 DOTI1      001A09 R
  6 DOTID      0019F3 R   |   6 DOTO1      0013E9 R   |   6 DOTOK      0013CF R
  6 DOTPR      0010BB R   |   6 DOTQ       00164B R   |   6 DOTQP      000F18 R
  6 DOTR       000F26 R   |   6 DOTS       001995 R   |   6 DOTS1      0019A0 R
  6 DOTS2      0019A9 R   |   6 DOVAR      000651 R   |   6 DOVER      0028C5 R
  6 DO_DCONS   0018DC R   |   6 DPLUS      002AC5 R   |   6 DPLUS1     002AEC R
  6 DRAT       002834 R   |   6 DRFROM     00281C R   |   6 DROP       000587 R
  6 DROT       00271B R   |   6 DRSHIFT    002948 R   |   6 DRSHIFT1   00294F R
  6 DRSHIFT2   002965 R   |   6 DSIGN      002577 R   |   6 DSIGN1     002581 R
  6 DSLA1      0029E8 R   |   6 DSLA2      002A0A R   |   6 DSLA3      002A4A R
  6 DSLA4      002A70 R   |   6 DSLA7      002AA1 R   |   6 DSLA8      002AA4 R
  6 DSLA9      002ABF R   |   6 DSLMOD     002590 R   |   6 DSLMOD3    0025AB R
  6 DSLMOD4    0025B7 R   |   6 DSLMODa    0025B2 R   |   6 DSLMODb    0025BD R
  6 DSSTAR     002638 R   |   6 DSSTAR1    00264F R   |   6 DSSTAR3    002678 R
  6 DSTAR      00296B R   |   6 DSTOR      000BDB R   |   6 DSUB       002AF7 R
  6 DSUB1      002B1E R   |   6 DSWAP      002681 R   |   6 DTOF       0031DE R
  6 DTOF1      0031E7 R   |   6 DTOF2      0031F5 R   |   6 DTOR       0027FE R
  6 DUMP       00194B R   |   6 DUMP1      001962 R   |   6 DUMP3      001984 R
  6 DUMPP      00191A R   |   6 DUPP       000591 R   |   6 DVARIA     002852 R
  6 DZEQUAL    002518 R   |   6 DZLESS     0027B4 R   |   6 DZLESS1    0027BE R
  6 EDIGS      000DBA R   |   6 EDOT       002CF6 R   |   6 EDOT0      002D0D R
  6 EDOT1      002D1B R   |   6 EDOT2      002D21 R   |   6 EDOT3      002D3A R
  6 EDOT4      002D69 R   |   6 EDOT5      002D85 R   |   6 EECSTORE   001D38 R
  6 EEPCP      001B5E R   |   6 EEPLAST    001B31 R   |   6 EEPROM     001B19 R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_R=  000010 
    EEPROM_S=  000800     |   6 EEPRUN     001B48 R   |   6 EEPVP      001B74 R
  6 EESTORE    001D84 R   |   6 EE_CCOMM   00204E R   |   6 EE_COMMA   00202D R
  6 EE_CREAD   001CC9 R   |   6 EE_READ    001CA7 R   |   6 EI         0000BD R
  6 ELSEE      0015AA R   |   6 EMIT       000436 R   |   6 ENEPER     00226E R
    EOL_CR  =  000001     |     EOL_LF  =  000000     |   6 EQ1        000877 R
  6 EQUAL      000861 R   |   6 ERASE      000CE7 R   |     ERR     =  00001B 
  6 EVAL       001412 R   |   6 EVAL1      001412 R   |   6 EVAL2      00142E R
  6 EXE1       000C7C R   |   6 EXECU      0004C6 R   |     EXT     =  000000 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |   6 EXTRC      000D41 R
  6 FADDR      00211B R   |   6 FARAT      001BDF R   |   6 FARCAT     001BEB R
  6 FC_XOFF    000463 R   |   6 FC_XON     00044D R   |   6 FDOT       002D94 R
  6 FDOT0      002DD2 R   |   6 FDOT1      002DC1 R   |   6 FDOT10     002E2E R
  6 FDOT2      002DE0 R   |   6 FDOT3      002DF9 R   |   6 FDOT6      002E09 R
  6 FDOT7      002E0E R   |   6 FDOT8      002E16 R   |   6 FDOT9      002E1E R
  6 FER        002B5B R   |     FHSE    =  7A1200     |     FHSI    =  F42400 
  6 FILL       000CB4 R   |   6 FILL1      000CD1 R   |   6 FILL2      000CDA R
  6 FIND       0011B0 R   |   6 FIND1      0011CE R   |   6 FIND2      0011FC R
  6 FIND3      001208 R   |   6 FIND4      00121C R   |   6 FIND5      001229 R
  6 FIND6      00120D R   |   6 FINIT      002B51 R   |     FLASH_BA=  008000 
    FLASH_CR=  00505A     |     FLASH_CR=  000002     |     FLASH_CR=  000000 
    FLASH_CR=  000003     |     FLASH_CR=  000001     |     FLASH_CR=  00505B 
    FLASH_CR=  000005     |     FLASH_CR=  000004     |     FLASH_CR=  000007 
    FLASH_CR=  000000     |     FLASH_CR=  000006     |     FLASH_DU=  005064 
    FLASH_DU=  0000AE     |     FLASH_DU=  000056     |     FLASH_EN=  027FFF 
    FLASH_FP=  00505D     |     FLASH_FP=  000000     |     FLASH_FP=  000001 
    FLASH_FP=  000002     |     FLASH_FP=  000003     |     FLASH_FP=  000004 
    FLASH_FP=  000005     |     FLASH_IA=  00505F     |     FLASH_IA=  000003 
    FLASH_IA=  000002     |     FLASH_IA=  000006     |     FLASH_IA=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_IA=  000000     |     FLASH_NC=  00505C     |     FLASH_NF=  00505E 
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |   6 FLOATQ     002EA6 R
  6 FLOATQ0    002EB0 R   |   6 FLOATQ1    002F15 R   |   6 FLOATQ2    002F1E R
  6 FLOATQ3    002F26 R   |   6 FLOATQ4    002F3A R   |   6 FLOAT_ER   002F4F R
  6 FLOAT_ER   002F4C R   |     FLSI    =  01F400     |   6 FMOVE      002126 R
  6 FMOVE2     002157 R   |   6 FNE        002B7D R   |   6 FOR        001527 R
  6 FORGET     00015A R   |   6 FORGET1    000189 R   |   6 FORGET2    00020F R
  6 FORGET4    000218 R   |   6 FORGET6    0001D1 R   |   6 FOV        002B92 R
  6 FPSTOR     001AFA R   |   6 FPSW       002B2B R   |     FPTR    =  000034 
  6 FREEVAR    000225 R   |   6 FREEVAR4   00025B R   |   6 FRESET     002B3D R
  6 FSLASH     003142 R   |   6 FSLASH1    00316E R   |   6 FSLASH8    0031C5 R
  6 FSTAR      00311B R   |   6 FTOD       003202 R   |   6 FTOD1      003232 R
  6 FTOD2      00324B R   |   6 FTOD3      003255 R   |   6 FTOD4      003260 R
  6 FTOD5      003268 R   |   6 FTOD6      003288 R   |   6 FTOD8      00328D R
  6 FTOD9      003298 R   |   6 FZE        002B68 R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
  6 GREAT      0008DC R   |   6 GREAT1     0008F2 R   |   6 HDOT       000F75 R
  6 HERE       000C38 R   |   6 HEX        000DF0 R   |   6 HI         001A45 R
  6 HLD        0006D1 R   |   6 HOLD       000D65 R   |     HSECNT  =  004809 
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
  6 ICOLON     0017EB R   |   6 IFETCH     001545 R   |   6 IFF        001582 R
  6 IFMOVE     0021FF R   |     IMEDD   =  000080     |   6 IMMED      0017FD R
  6 INCH       00042A R   |   6 INC_FPTR   001C74 R   |   6 INITOFS    0017B3 R
  6 INN        00067F R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
    INPUT_FL=  000000     |     INPUT_PU=  000001     |   6 INTE1      0013B1 R
  6 INTER      001387 R   |   6 INTQ       0023A8 R   |     INT_ADC2=  000016 
    INT_AUAR=  000012     |     INT_AWU =  000001     |     INT_CAN_=  000008 
    INT_CAN_=  000009     |     INT_CLK =  000002     |     INT_EXTI=  000003 
    INT_EXTI=  000004     |     INT_EXTI=  000005     |     INT_EXTI=  000006 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
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
  6 INVER      0007DA R   |     IPR0    =  000002     |     IPR1    =  000001 
    IPR2    =  000000     |     IPR3    =  000003     |     IPR_MASK=  000003 
    IRET_COD=  000080     |   6 ISEMI      001748 R   |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   6 JSRC       00179D R   |   6 KEY        000E59 R
  6 KTAP       0012A1 R   |   6 KTAP1      0012C4 R   |   6 KTAP2      0012C7 R
  6 LAST       000710 R   |   6 LASTN   =  0031FE R   |   6 LBRAC      0013BE R
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
  6 LESS       00089E R   |     LF      =  00000A     |   6 LINK    =  0031FE R
  6 LITER      0014F9 R   |   6 LN2S       0022CA R   |   6 LOCK       001C60 R
  6 LOG2S      0022B4 R   |   6 LSCALE     002F70 R   |   6 LSHIFT     000AFC R
  6 LSHIFT1    000B05 R   |   6 LSHIFT4    000B0D R   |   6 LT1        0008B4 R
    MASKK   =  001F7F     |   6 MAX        0008FC R   |   6 MAX1       00090F R
    MAX_MANT=  7FFFFF     |   6 MIN        000919 R   |   6 MIN1       00092C R
  6 MMOD1      0009B5 R   |   6 MMOD2      0009C9 R   |   6 MMOD3      0009E0 R
  6 MMSM1      000970 R   |   6 MMSM3      000974 R   |   6 MMSM4      000980 R
  6 MMSMa      00097B R   |   6 MMSMb      000986 R   |   6 MMSTA1     003049 R
  6 MMSTA2     003054 R   |   6 MMSTA3     00305F R   |   6 MMSTA4     0030CA R
  6 MMSTA5     0030DC R   |   6 MMSTA6     0030F5 R   |   6 MMSTA7     003112 R
  6 MMSTAR     00303E R   |   6 MODD       0009FA R   |   6 MONE       000B63 R
    MS      =  000030     |   6 MSEC       0002D0 R   |   6 MSMOD      000998 R
  6 MSTA1      000A8B R   |   6 MSTAR      000A68 R   |     NAFR    =  004804 
  6 NAMEQ      001249 R   |   6 NAMET      00115A R   |     NCLKOPT =  004808 
  6 NDROT      0026DF R   |   6 NEGAT      0007EB R   |   6 NEX1       000492 R
  6 NEXT       001536 R   |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   6 NROT       00077E R
  6 NTIB       00068F R   |     NUBC    =  004802     |     NUCLEO  =  000001 
  6 NUFQ       000E6F R   |   6 NUFQ1      000E88 R   |   6 NUMBQ      002451 R
  6 NUMQ0      002492 R   |   6 NUMQ1      0024B4 R   |   6 NUMQ3      0024DE R
  6 NUMQ4      0024FF R   |   6 NUMQ8      002508 R   |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   6 NonHandl   000000 R   |   6 OFFSET     000735 R
    OFS     =  000005     |   6 ONE        000B55 R   |   6 ONEM       000AEB R
  6 ONEP       000ADE R   |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTIMIZE=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]

Symbol Table

    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  6 ORIG       000049 R   |   6 ORR        000604 R   |   6 OUTPUT     00043B R
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |   6 OVER       0005BB R   |   6 OVERT      001716 R
    PA      =  000000     |   6 PACKS      000CF8 R   |   6 PAD        000C49 R
  6 PAREN      0010CA R   |   6 PARS       000FC3 R   |   6 PARS1      000FEE R
  6 PARS2      001019 R   |   6 PARS3      00101C R   |   6 PARS4      001025 R
  6 PARS5      001048 R   |   6 PARS6      00105D R   |   6 PARS7      00106C R
  6 PARS8      00107B R   |   6 PARSE      00108C R   |   6 PARSEXP_   002E89 R
  6 PAUSE      0002E0 R   |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |   6 PDUM1      00192D R   |   6 PDUM2      00193E R
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
    PH_ODR  =  005023     |     PI      =  000028     |   6 PICK       000BA3 R
  6 PII        00222D R   |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   6 PLUS       0007C0 R   |   6 PNAM1      0016BB R
  6 POSMANT    002C6C R   |   6 PRESE      00143D R   |     PROD1   =  000024 
    PROD2   =  000026     |     PROD3   =  000028     |   6 PROTECTE   000201 R
  6 PSTOR      000BBA R   |     PTR16   =  000035     |     PTR8    =  000036 
  6 PTRPLUS    001C8C R   |   6 QBRAN      00049A R   |   6 QDUP       00074E R
  6 QDUP1      000758 R   |   6 QKEY       000418 R   |   6 QSTAC      0013F5 R
  6 QUERY      001321 R   |   6 QUEST      000FB5 R   |   6 QUIT       00145A R
  6 QUIT1      001462 R   |   6 QUIT2      001465 R   |   6 RAM2EE     0020C7 R
    RAMBASE =  000000     |   6 RAMLAST    000723 R   |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   6 RANDOM     00027E R
  6 RAT        00054E R   |   6 RBRAC      00178A R   |   6 REPEA      0015FF R
  6 RFREE      0020AE R   |   6 RFROM      00053B R   |     ROP     =  004800 
  6 ROT        00075F R   |   6 ROW2BUF    002070 R   |     ROWBUFF =  001680 
    RP0     =  00002E     |   6 RPAT       000518 R   |     RPP     =  0017FF 
  6 RPSTO      000525 R   |   6 RSCALE     002F96 R   |   6 RSHIFT     000B18 R
  6 RSHIFT1    000B21 R   |   6 RSHIFT4    000B29 R   |     RST_SR  =  0050B3 
  6 RT12_2     00229D R   |   6 SAME1      001178 R   |   6 SAME2      0011A1 R
  6 SAMEQ      001170 R   |   6 SCAL1      002FC9 R   |   6 SCAL2      002FF5 R
  6 SCALETOM   002FC3 R   |   6 SCOM1      0016F0 R   |   6 SCOM2      0016F3 R
  6 SCOMP      0016D2 R   |   6 SEED       000265 R   |     SEEDX   =  000038 
    SEEDY   =  00003A     |   6 SEMIS      001726 R   |   6 SETISP     0000D0 R
  6 SET_RAML   00186D R   |   6 SFN        002BDE R   |     SFR_BASE=  005000 
    SFR_END =  0057FF     |   6 SFV        002C16 R   |   6 SFZ        002BA7 R
  6 SIGN       000DA4 R   |   6 SIGN1      000DB4 R   |   6 SLASH      000A04 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]

Symbol Table

  6 SLMOD      0009E8 R   |   6 SNAME      001685 R   |     SP0     =  00002C 
  6 SPACE      000E91 R   |   6 SPACS      000EA0 R   |   6 SPAT       000571 R
    SPI_CR1 =  005200     |     SPI_CR2 =  005201     |     SPI_CRCP=  005205 
    SPI_DR  =  005204     |     SPI_ICR =  005202     |     SPI_RXCR=  005206 
    SPI_SR  =  005203     |     SPI_TXCR=  005207     |     SPP     =  001680 
    SPSAVE  =  000001     |   6 SPSTO      00057E R   |   6 SQRT10     002286 R
  6 SQRT2      002244 R   |   6 SQRT3      00225B R   |   6 SSMOD      000A94 R
    SSP     =  000001     |     STACK   =  0017FF     |   6 STAR       000A5D R
  6 STASL      000AA5 R   |   6 STEXP      002C77 R   |   6 STEXP1     002C8D R
  6 STEXP2     002CC9 R   |   6 STEXP3     002CDC R   |   6 STOD       000822 R
  6 STORE      0004D3 R   |   6 STR        000DD2 R   |   6 STRCQ      001507 R
  6 STRQ       00163E R   |   6 STRQP      000F0E R   |   6 SUBB       000839 R
  6 SWAPP      0005A1 R   |     SWIM_CSR=  007F80     |   6 TAP        00128B R
  6 TBOOT      001A7C R   |   6 TBRAN      0004A8 R   |   6 TBUF       00069F R
    TBUFFBAS=  001680     |   6 TCHAR      000B74 R   |   6 TEMP       000670 R
  6 TEVAL      0006C2 R   |   6 TFLASH     0006B1 R   |   6 THENN      001597 R
  6 TIB        000C5A R   |     TIBB    =  001700     |     TIBBASE =  001700 
    TIC     =  000027     |   6 TICK       001471 R   |     TIM1_ARR=  005262 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]

Symbol Table

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
  6 TNAM2      0019C3 R   |   6 TNAM3      0019E1 R   |   6 TNAM4      0019E7 R
  6 TNAME      0019C0 R   |   6 TOFLASH    000335 R   |   6 TOKEN      00114C R
  6 TOR        00055A R   |   6 TORAM      000375 R   |     TRUEE   =  00FFFF 
  6 TWOSL      000B30 R   |   6 TYPE1      000EC0 R   |   6 TYPE2      000ECC R
  6 TYPES      000EBB R   |   6 Timer4Ha   000005 R   |     UART1   =  000000 
    UART1_BA=  005230     |     UART1_BR=  005232     |     UART1_BR=  005233 
    UART1_CR=  005234     |     UART1_CR=  005235     |     UART1_CR=  005236 
    UART1_CR=  005237     |     UART1_CR=  005238     |     UART1_DR=  005231 
    UART1_GT=  005239     |     UART1_PO=  000000     |     UART1_PS=  00523A 
    UART1_RX=  000004     |     UART1_SR=  005230     |     UART1_TX=  000005 
    UART3   =  000001     |     UART3_BA=  005240     |     UART3_BR=  005242 
    UART3_BR=  005243     |     UART3_CR=  005244     |     UART3_CR=  005245 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]

Symbol Table

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
  6 UDIV10     002FF6 R   |   6 UDOT       000F61 R   |   6 UDOTR      000F41 R
  6 UEND       000047 R   |     UFPSW   =  000008     |   6 UGREAT     0008BD R
  6 UGREAT1    0008D4 R   |     UHLD    =  000014     |     UINN    =  00000C 
    UINTER  =  000012     |     ULAST   =  00001C     |   6 ULES1      000896 R
  6 ULESS      000880 R   |   6 UMMOD      000954 R   |   6 UMSTA      000A13 R
  6 UNIQ1      00167C R   |   6 UNIQU      00165D R   |   6 UNLKEE     001BFA R
  6 UNLKFL     001C19 R   |   6 UNLOCK     001C38 R   |   6 UNTIL      00155F R
    UOFFSET =  00001E     |   6 UPDATCP    001BB7 R   |   6 UPDATLAS   001B8E R
  6 UPDATPTR   0021BA R   |   6 UPDATRUN   001BA6 R   |   6 UPDATVP    001BCE R
  6 UPL1       000645 R   |   6 UPLUS      00062E R   |     UPP     =  000006 
  6 UPPER      00110F R   |   6 UPPER1     001132 R   |   6 UPPER2     00113B R
    URLAST  =  000022     |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     UTFLASH =  000020     |     UTIB    =  000010 
    UTMP    =  00000A     |   6 UTYP1      0018FD R   |   6 UTYP2      00190C R
  6 UTYPE      0018F8 R   |     UVP     =  000018     |   6 UZERO      00002B R
  6 VARIA      00183A R   |     VAR_BASE=  000080     |     VAR_TOP =  0017BF 
    VER     =  000004     |   6 VPP        0006F2 R   |     VSIZE   =  000006 
    WANT_CON=  000001     |     WANT_DEB=  000000     |     WANT_DOU=  000001 
    WANT_FLO=  000001     |     WANT_SCA=  000001     |     WANT_SEE=  000000 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |   6 WHILE      0015E5 R
  6 WITHI      000939 R   |   6 WORDD      0010F5 R   |   6 WORDS      001A1D R
  6 WORS1      001A23 R   |   6 WORS2      001A3F R   |   6 WR_BYTE    001CE3 R
  6 WR_WORD    001D08 R   |   6 WTABLE     002312 R   |   6 WTAT       002336 R
  6 WTINIT     00237B R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XMEM_SIZ=  017830     |     XOFF    =  000013     |     XON     =  000011 
  6 XORR       000619 R   |     XTEMP   =  000024     |     YTEMP   =  000026 
  6 ZEQ1       002528 R   |   6 ZEQU1      0005E6 R   |   6 ZEQUAL     0005DC R
  6 ZERO       000B4A R   |   6 ZL1        0005D3 R   |   6 ZLESS      0005CA R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]

Symbol Table

  6 app_spac   003300 R   |   6 baudrate   00037B R   |   6 block_er   001DCE R
  6 clear_ra   000019 R   |   6 clock_in   000064 R   |   6 copy_buf   001E2E R
  6 copy_buf   001E4D R   |   6 copy_pro   001E4D R   |     da      =  000002 
    db      =  000003     |     dc      =  000000     |     dd      =  000001 
  6 do2lit     0028A9 R   |   6 erase_fl   001DF0 R   |   6 fmove_do   0021A3 R
  6 main       000016 R   |   6 next_row   002160 R   |   6 no_move    0021AA R
  6 nsign      0023C6 R   |   6 nsign1     0023F7 R   |   6 parse_di   0023FE R
  6 parse_ex   002E3E R   |   6 pristine   001ECE R   |   6 proceed_   001DF3 R
  6 reboot     000327 R   |   6 reset_ve   001F35 R   |   6 row_eras   001DAE R
  6 row_eras   001E07 R   |   6 row_eras   001E2E R   |   6 set_opti   001EA2 R
  6 set_vect   001FD6 R   |   6 uart_ini   000076 R   |   6 write_ro   001E72 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   3300   flags    0

