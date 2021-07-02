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
      0080B7 93 CB                  314         .word      INTER   ;'EVAL
      0080B9 00 00                  315         .word      0       ;HLD
      0080BB B2 42                  316         .word      LASTN  ;CNTXT pointer
      0080BD 00 80                  317         .word      VAR_BASE   ;variables free space pointer 
      0080BF B3 00                  318         .word      app_space ; FLASH free space pointer 
      0080C1 B2 42                  319         .word      LASTN   ;LAST
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
      00812D CC 9A CC         [ 2]  391         jp  COLD   ;default=MN1
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
      0081A9 CD 91 90         [ 4]  465         call TOKEN 
      0081AC CD 86 08         [ 4]  466         call DUPP 
      0081AF CD 85 18         [ 4]  467         call QBRAN 
      0081B2 82 8F                  468         .word FORGET2
      0081B4 CD 92 8D         [ 4]  469         call NAMEQ
      0081B7 CD 87 BB         [ 4]  470         call QDUP 
      0081BA CD 85 18         [ 4]  471         call QBRAN 
      0081BD 82 8F                  472         .word FORGET2
      0081BF CD 85 FE         [ 4]  473         call DROP 
      0081C2 1D 00 04         [ 2]  474         subw x,#2*CELLL 
      0081C5 90 5F            [ 1]  475         clrw y 
      0081C7 FF               [ 2]  476         ldw (x),y 
      0081C8 90 AE 40 02      [ 2]  477         ldw y,#APP_RUN 
      0081CC EF 02            [ 2]  478         ldw (2,x),y 
      0081CE CC 9D C8         [ 2]  479         jp EESTORE 
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
      0081DA CD 91 90         [ 4]  488         call TOKEN
      0081DD CD 86 08         [ 4]  489         call DUPP 
      0081E0 CD 85 18         [ 4]  490         call QBRAN 
      0081E3 82 8F                  491         .word FORGET2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      0081E5 CD 92 8D         [ 4]  492         call NAMEQ ; ( a -- ca na | a F )
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
      008206 CD 9F CB         [ 4]  507         call CHKIVEC ; ( na -- ) 
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
      00824B CD 9B FB         [ 4]  535         call UPDATCP 
      00824E CC 9B D2         [ 2]  536         jp UPDATLAST 
      008251                        537 FORGET6: ; tried to forget a RAM or system word 
                                    538 ; ( ca na -- )
      008251 1D 00 02         [ 2]  539         subw x,#CELLL 
      008254 90 BE 2C         [ 2]  540         ldw y,SP0 
      008257 FF               [ 2]  541         ldw (x),y  
      008258 CD 88 ED         [ 4]  542         call ULESS
      00825B CD 85 18         [ 4]  543         call QBRAN 
      00825E 82 81                  544         .word PROTECTED 
      008260 CD 93 99         [ 4]  545         call ABORQ 
      008263 1D                     546         .byte 29
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      008264 20 46 6F 72 20 52 41   547         .ascii " For RAM definition do REBOOT"
             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      008281                        548 PROTECTED:
      008281 CD 93 99         [ 4]  549         call ABORQ
      008284 0A                     550         .byte 10
      008285 20 50 72 6F 74 65 63   551         .ascii " Protected"
             74 65 64
      00828F                        552 FORGET2: ; no name or not found in dictionary 
      00828F CD 93 99         [ 4]  553         call ABORQ
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
      0082D8 CC 9C 12         [ 2]  584         jp UPDATVP 
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
      0083C3 CD 93 99         [ 4]  732         call ABORQ 
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
                                   2709 ;       .R      ( n +n -- )
                                   2710 ;       Display an integer in a field
                                   2711 ;       of n columns, right justified.
      008F65 8F 2C                 2712         .word      LINK
                           000EE7  2713 LINK = . 
      008F67 02                    2714         .byte      2
      008F68 2E 52                 2715         .ascii     ".R"
      008F6A                       2716 DOTR:
      008F6A CD 85 D1         [ 4] 2717         CALL     TOR
      008F6D CD 8E 2E         [ 4] 2718         CALL     STR
      008F70 CD 85 B4         [ 4] 2719         CALL     RFROM
      008F73 CD 86 30         [ 4] 2720         CALL     OVER
      008F76 CD 88 A6         [ 4] 2721         CALL     SUBB
      008F79 CD 8E FC         [ 4] 2722         CALL     SPACS
      008F7C CC 8F 17         [ 2] 2723         JP     TYPES
                                   2724 
                                   2725 ;       U.R     ( u +n -- )
                                   2726 ;       Display an unsigned integer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   2727 ;       in n column, right justified.
      008F7F 8F 67                 2728         .word      LINK
                           000F01  2729 LINK = . 
      008F81 03                    2730         .byte      3
      008F82 55 2E 52              2731         .ascii     "U.R"
      008F85                       2732 UDOTR:
      008F85 CD 85 D1         [ 4] 2733         CALL     TOR
      008F88 CD 8D B1         [ 4] 2734         CALL     BDIGS
      008F8B CD 8D EB         [ 4] 2735         CALL     DIGS
      008F8E CD 8E 16         [ 4] 2736         CALL     EDIGS
      008F91 CD 85 B4         [ 4] 2737         CALL     RFROM
      008F94 CD 86 30         [ 4] 2738         CALL     OVER
      008F97 CD 88 A6         [ 4] 2739         CALL     SUBB
      008F9A CD 8E FC         [ 4] 2740         CALL     SPACS
      008F9D CC 8F 17         [ 2] 2741         JP     TYPES
                                   2742 
                                   2743 ;       U.      ( u -- )
                                   2744 ;       Display an unsigned integer
                                   2745 ;       in free format.
      008FA0 8F 81                 2746         .word      LINK
                           000F22  2747 LINK = . 
      008FA2 02                    2748         .byte      2
      008FA3 55 2E                 2749         .ascii     "U."
      008FA5                       2750 UDOT:
      008FA5 CD 8D B1         [ 4] 2751         CALL     BDIGS
      008FA8 CD 8D EB         [ 4] 2752         CALL     DIGS
      008FAB CD 8E 16         [ 4] 2753         CALL     EDIGS
      008FAE CD 8E ED         [ 4] 2754         CALL     SPACE
      008FB1 CC 8F 17         [ 2] 2755         JP     TYPES
                                   2756 
                                   2757 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2758 ;   H. ( n -- )
                                   2759 ;   display n in hexadecimal 
                                   2760 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F34                       2761         _HEADER HDOT,2,"H."
      008FB4 8F A2                    1         .word LINK 
                           000F36     2         LINK=.
      008FB6 02                       3         .byte 2  
      008FB7 48 2E                    4         .ascii "H."
      008FB9                          5         HDOT:
      008FB9 CD 86 CE         [ 4] 2762         CALL BASE 
      008FBC CD 85 63         [ 4] 2763         CALL AT 
      008FBF CD 85 D1         [ 4] 2764         CALL TOR 
      008FC2 CD 8E 4C         [ 4] 2765         CALL HEX 
      008FC5 CD 8F A5         [ 4] 2766         CALL UDOT 
      008FC8 CD 85 B4         [ 4] 2767         CALL RFROM 
      008FCB CD 86 CE         [ 4] 2768         CALL BASE 
      008FCE CD 85 51         [ 4] 2769         CALL STORE 
      008FD1 81               [ 4] 2770         RET 
                                   2771 
                                   2772 
                                   2773 ;       .       ( w -- )
                                   2774 ;       Display an integer in free
                                   2775 ;       format, preceeded by a space.
      008FD2 8F B6                 2776         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



                           000F54  2777 LINK = . 
      008FD4 01                    2778         .byte      1
      008FD5 2E                    2779         .ascii     "."
      008FD6                       2780 DOT:
      008FD6 CD 86 CE         [ 4] 2781         CALL     BASE
      008FD9 CD 85 63         [ 4] 2782         CALL     AT
      008FDC CD 84 EF         [ 4] 2783         CALL     DOLIT
      008FDF 00 0A                 2784         .word      10
      008FE1 CD 86 8E         [ 4] 2785         CALL     XORR    ;?decimal
      008FE4 CD 85 18         [ 4] 2786         CALL     QBRAN
      008FE7 8F EC                 2787         .word      DOT1
      008FE9 CC 8F A5         [ 2] 2788         JP     UDOT
      008FEC CD 8E 2E         [ 4] 2789 DOT1:   CALL     STR
      008FEF CD 8E ED         [ 4] 2790         CALL     SPACE
      008FF2 CC 8F 17         [ 2] 2791         JP     TYPES
                                   2792 
                                   2793 ;       ?       ( a -- )
                                   2794 ;       Display contents in memory cell.
      008FF5 8F D4                 2795         .word      LINK
                                   2796         
                           000F77  2797 LINK = . 
      008FF7 01                    2798         .byte      1
      008FF8 3F                    2799         .ascii     "?"
      008FF9                       2800 QUEST:
      008FF9 CD 85 63         [ 4] 2801         CALL     AT
      008FFC CC 8F D6         [ 2] 2802         JP     DOT
                                   2803 
                                   2804 ;; Parsing
                                   2805 
                                   2806 ;       parse   ( b u c -- b u delta ; <string> )
                                   2807 ;       Scan string delimited by c.
                                   2808 ;       Return found string and its offset.
      008FFF 8F F7                 2809         .word      LINK
                           000F81  2810 LINK = . 
      009001 05                    2811         .byte      5
      009002 70 61 72 73 65        2812         .ascii     "parse"
      009007                       2813 PARS:
      009007 CD 86 DD         [ 4] 2814         CALL     TEMP
      00900A CD 85 51         [ 4] 2815         CALL     STORE
      00900D CD 86 30         [ 4] 2816         CALL     OVER
      009010 CD 85 D1         [ 4] 2817         CALL     TOR
      009013 CD 86 08         [ 4] 2818         CALL     DUPP
      009016 CD 85 18         [ 4] 2819         CALL     QBRAN
      009019 90 BF                 2820         .word    PARS8
      00901B CD 8B 58         [ 4] 2821         CALL     ONEM
      00901E CD 86 DD         [ 4] 2822         CALL     TEMP
      009021 CD 85 63         [ 4] 2823         CALL     AT
      009024 CD 8B AA         [ 4] 2824         CALL     BLANK
      009027 CD 88 CE         [ 4] 2825         CALL     EQUAL
      00902A CD 85 18         [ 4] 2826         CALL     QBRAN
      00902D 90 60                 2827         .word      PARS3
      00902F CD 85 D1         [ 4] 2828         CALL     TOR
      009032 CD 8B AA         [ 4] 2829 PARS1:  CALL     BLANK
      009035 CD 86 30         [ 4] 2830         CALL     OVER
      009038 CD 85 81         [ 4] 2831         CALL     CAT     ;skip leading blanks ONLY
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      00903B CD 88 A6         [ 4] 2832         CALL     SUBB
      00903E CD 86 3F         [ 4] 2833         CALL     ZLESS
      009041 CD 88 47         [ 4] 2834         CALL     INVER
      009044 CD 85 18         [ 4] 2835         CALL     QBRAN
      009047 90 5D                 2836         .word      PARS2
      009049 CD 8B 4B         [ 4] 2837         CALL     ONEP
      00904C CD 85 03         [ 4] 2838         CALL     DONXT
      00904F 90 32                 2839         .word      PARS1
      009051 CD 85 B4         [ 4] 2840         CALL     RFROM
      009054 CD 85 FE         [ 4] 2841         CALL     DROP
      009057 CD 8B B7         [ 4] 2842         CALL     ZERO
      00905A CC 86 08         [ 2] 2843         JP     DUPP
      00905D CD 85 B4         [ 4] 2844 PARS2:  CALL     RFROM
      009060 CD 86 30         [ 4] 2845 PARS3:  CALL     OVER
      009063 CD 86 18         [ 4] 2846         CALL     SWAPP
      009066 CD 85 D1         [ 4] 2847         CALL     TOR
      009069 CD 86 DD         [ 4] 2848 PARS4:  CALL     TEMP
      00906C CD 85 63         [ 4] 2849         CALL     AT
      00906F CD 86 30         [ 4] 2850         CALL     OVER
      009072 CD 85 81         [ 4] 2851         CALL     CAT
      009075 CD 88 A6         [ 4] 2852         CALL     SUBB    ;scan for delimiter
      009078 CD 86 DD         [ 4] 2853         CALL     TEMP
      00907B CD 85 63         [ 4] 2854         CALL     AT
      00907E CD 8B AA         [ 4] 2855         CALL     BLANK
      009081 CD 88 CE         [ 4] 2856         CALL     EQUAL
      009084 CD 85 18         [ 4] 2857         CALL     QBRAN
      009087 90 8C                 2858         .word      PARS5
      009089 CD 86 3F         [ 4] 2859         CALL     ZLESS
      00908C CD 85 18         [ 4] 2860 PARS5:  CALL     QBRAN
      00908F 90 A1                 2861         .word      PARS6
      009091 CD 8B 4B         [ 4] 2862         CALL     ONEP
      009094 CD 85 03         [ 4] 2863         CALL     DONXT
      009097 90 69                 2864         .word      PARS4
      009099 CD 86 08         [ 4] 2865         CALL     DUPP
      00909C CD 85 D1         [ 4] 2866         CALL     TOR
      00909F 20 0F            [ 2] 2867         JRA     PARS7
      0090A1 CD 85 B4         [ 4] 2868 PARS6:  CALL     RFROM
      0090A4 CD 85 FE         [ 4] 2869         CALL     DROP
      0090A7 CD 86 08         [ 4] 2870         CALL     DUPP
      0090AA CD 8B 4B         [ 4] 2871         CALL     ONEP
      0090AD CD 85 D1         [ 4] 2872         CALL     TOR
      0090B0 CD 86 30         [ 4] 2873 PARS7:  CALL     OVER
      0090B3 CD 88 A6         [ 4] 2874         CALL     SUBB
      0090B6 CD 85 B4         [ 4] 2875         CALL     RFROM
      0090B9 CD 85 B4         [ 4] 2876         CALL     RFROM
      0090BC CC 88 A6         [ 2] 2877         JP     SUBB
      0090BF CD 86 30         [ 4] 2878 PARS8:  CALL     OVER
      0090C2 CD 85 B4         [ 4] 2879         CALL     RFROM
      0090C5 CC 88 A6         [ 2] 2880         JP     SUBB
                                   2881 
                                   2882 ;       PARSE   ( c -- b u ; <string> )
                                   2883 ;       Scan input stream and return
                                   2884 ;       counted string delimited by c.
      0090C8 90 01                 2885         .word      LINK
                           00104A  2886 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      0090CA 05                    2887         .byte      5
      0090CB 50 41 52 53 45        2888         .ascii     "PARSE"
      0090D0                       2889 PARSE:
      0090D0 CD 85 D1         [ 4] 2890         CALL     TOR
      0090D3 CD 8C B6         [ 4] 2891         CALL     TIB
      0090D6 CD 86 EC         [ 4] 2892         CALL     INN
      0090D9 CD 85 63         [ 4] 2893         CALL     AT
      0090DC CD 88 2D         [ 4] 2894         CALL     PLUS    ;current input buffer pointer
      0090DF CD 86 FC         [ 4] 2895         CALL     NTIB
      0090E2 CD 85 63         [ 4] 2896         CALL     AT
      0090E5 CD 86 EC         [ 4] 2897         CALL     INN
      0090E8 CD 85 63         [ 4] 2898         CALL     AT
      0090EB CD 88 A6         [ 4] 2899         CALL     SUBB    ;remaining count
      0090EE CD 85 B4         [ 4] 2900         CALL     RFROM
      0090F1 CD 90 07         [ 4] 2901         CALL     PARS
      0090F4 CD 86 EC         [ 4] 2902         CALL     INN
      0090F7 CC 8C 27         [ 2] 2903         JP     PSTOR
                                   2904 
                                   2905 ;       .(      ( -- )
                                   2906 ;       Output following string up to next ) .
      0090FA 90 CA                 2907         .word      LINK
                           00107C  2908 LINK = . 
      0090FC 82                    2909 	.byte      IMEDD+2
      0090FD 2E 28                 2910         .ascii     ".("
      0090FF                       2911 DOTPR:
      0090FF CD 84 EF         [ 4] 2912         CALL     DOLIT
      009102 00 29                 2913         .word     41	; ")"
      009104 CD 90 D0         [ 4] 2914         CALL     PARSE
      009107 CC 8F 17         [ 2] 2915         JP     TYPES
                                   2916 
                                   2917 ;       (       ( -- )
                                   2918 ;       Ignore following string up to next ).
                                   2919 ;       A comment.
      00910A 90 FC                 2920         .word      LINK
                           00108C  2921 LINK = . 
      00910C 81                    2922 	.byte      IMEDD+1
      00910D 28                    2923         .ascii     "("
      00910E                       2924 PAREN:
      00910E CD 84 EF         [ 4] 2925         CALL     DOLIT
      009111 00 29                 2926         .word     41	; ")"
      009113 CD 90 D0         [ 4] 2927         CALL     PARSE
      009116 CC 88 0D         [ 2] 2928         JP     DDROP
                                   2929 
                                   2930 ;       \       ( -- )
                                   2931 ;       Ignore following text till
                                   2932 ;       end of line.
      009119 91 0C                 2933         .word      LINK
                           00109B  2934 LINK = . 
      00911B 81                    2935 	.byte      IMEDD+1
      00911C 5C                    2936         .ascii     "\"
      00911D                       2937 BKSLA:
      00911D 90 AE 00 0E      [ 2] 2938         ldw y,#UCTIB ; #TIB  
      009121 90 FE            [ 2] 2939         ldw y,(y)
      009123 90 89            [ 2] 2940         pushw y ; count in TIB 
      009125 90 AE 00 0C      [ 2] 2941         ldw y,#UINN ; >IN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      009129 90 BF 26         [ 2] 2942         ldw YTEMP,y
      00912C 90 85            [ 2] 2943         popw y 
      00912E 91 CF 26         [ 5] 2944         ldw [YTEMP],y
      009131 81               [ 4] 2945         ret 
                                   2946 
                                   2947 ;       WORD    ( c -- a ; <string> )
                                   2948 ;       Parse a word from input stream
                                   2949 ;       and copy it to code dictionary.
      009132 91 1B                 2950         .word      LINK
                           0010B4  2951 LINK = . 
      009134 04                    2952         .byte      4
      009135 57 4F 52 44           2953         .ascii     "WORD"
      009139                       2954 WORDD:
      009139 CD 90 D0         [ 4] 2955         CALL     PARSE
      00913C CD 8C 94         [ 4] 2956         CALL     HERE
      00913F CD 8B 20         [ 4] 2957         CALL     CELLP
                           000000  2958 .IF CASE_SENSE 
                                   2959         JP      PACKS 
                           000001  2960 .ELSE                 
      009142 CD 8D 54         [ 4] 2961         CALL     PACKS
                                   2962 ; uppercase TOKEN 
      009145 CD 86 08         [ 4] 2963         CALL    DUPP 
      009148 CD 8C 7D         [ 4] 2964         CALL    COUNT 
      00914B CD 85 D1         [ 4] 2965         CALL    TOR 
      00914E CD 85 34         [ 4] 2966         CALL    BRAN 
      009151 91 7F                 2967         .word   UPPER2  
      009153                       2968 UPPER:
      009153 CD 86 08         [ 4] 2969         CALL    DUPP 
      009156 CD 85 81         [ 4] 2970         CALL    CAT
      009159 CD 86 08         [ 4] 2971         CALL    DUPP 
      00915C CD 84 EF         [ 4] 2972         CALL   DOLIT
      00915F 00 61                 2973         .word   'a' 
      009161 CD 84 EF         [ 4] 2974         CALL    DOLIT
      009164 00 7B                 2975         .word   'z'+1 
      009166 CD 89 A6         [ 4] 2976         CALL   WITHI 
      009169 CD 85 18         [ 4] 2977         CALL   QBRAN
      00916C 91 76                 2978         .word  UPPER1  
      00916E CD 84 EF         [ 4] 2979         CALL    DOLIT 
      009171 00 DF                 2980         .word   0xDF 
      009173 CD 86 65         [ 4] 2981         CALL    ANDD 
      009176                       2982 UPPER1:
      009176 CD 86 30         [ 4] 2983         CALL    OVER 
      009179 CD 85 70         [ 4] 2984         CALL    CSTOR          
      00917C CD 8B 4B         [ 4] 2985         CALL    ONEP 
      00917F                       2986 UPPER2: 
      00917F CD 85 03         [ 4] 2987         CALL    DONXT
      009182 91 53                 2988         .word   UPPER  
      009184 CD 85 FE         [ 4] 2989         CALL    DROP  
      009187 81               [ 4] 2990         RET 
                                   2991 .ENDIF 
                                   2992 
                                   2993 ;       TOKEN   ( -- a ; <string> )
                                   2994 ;       Parse a word from input stream
                                   2995 ;       and copy it to name dictionary.
      009188 91 34                 2996         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



                           00110A  2997 LINK = . 
      00918A 05                    2998         .byte      5
      00918B 54 4F 4B 45 4E        2999         .ascii     "TOKEN"
      009190                       3000 TOKEN:
      009190 CD 8B AA         [ 4] 3001         CALL     BLANK
      009193 CC 91 39         [ 2] 3002         JP     WORDD
                                   3003 
                                   3004 ;; Dictionary search
                                   3005 
                                   3006 ;       NAME>   ( na -- ca )
                                   3007 ;       Return a code address given
                                   3008 ;       a name address.
      009196 91 8A                 3009         .word      LINK
                           001118  3010 LINK = . 
      009198 05                    3011         .byte      5
      009199 4E 41 4D 45 3E        3012         .ascii     "NAME>"
      00919E                       3013 NAMET:
      00919E CD 8C 7D         [ 4] 3014         CALL     COUNT
      0091A1 CD 84 EF         [ 4] 3015         CALL     DOLIT
      0091A4 00 1F                 3016         .word      31
      0091A6 CD 86 65         [ 4] 3017         CALL     ANDD
      0091A9 CC 88 2D         [ 2] 3018         JP     PLUS
                                   3019 
                                   3020 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   3021 ;       Compare u cells in two
                                   3022 ;       strings. Return 0 if identical.
      0091AC 91 98                 3023         .word      LINK
                           00112E  3024 LINK = . 
      0091AE 05                    3025         .byte       5
      0091AF 53 41 4D 45 3F        3026         .ascii     "SAME?"
      0091B4                       3027 SAMEQ:
      0091B4 CD 8B 58         [ 4] 3028         CALL     ONEM
      0091B7 CD 85 D1         [ 4] 3029         CALL     TOR
      0091BA 20 29            [ 2] 3030         JRA     SAME2
      0091BC CD 86 30         [ 4] 3031 SAME1:  CALL     OVER
      0091BF CD 85 C5         [ 4] 3032         CALL     RAT
      0091C2 CD 88 2D         [ 4] 3033         CALL     PLUS
      0091C5 CD 85 81         [ 4] 3034         CALL     CAT
      0091C8 CD 86 30         [ 4] 3035         CALL     OVER
      0091CB CD 85 C5         [ 4] 3036         CALL     RAT
      0091CE CD 88 2D         [ 4] 3037         CALL     PLUS
      0091D1 CD 85 81         [ 4] 3038         CALL     CAT
      0091D4 CD 88 A6         [ 4] 3039         CALL     SUBB
      0091D7 CD 87 BB         [ 4] 3040         CALL     QDUP
      0091DA CD 85 18         [ 4] 3041         CALL     QBRAN
      0091DD 91 E5                 3042         .word      SAME2
      0091DF CD 85 B4         [ 4] 3043         CALL     RFROM
      0091E2 CC 85 FE         [ 2] 3044         JP     DROP
      0091E5 CD 85 03         [ 4] 3045 SAME2:  CALL     DONXT
      0091E8 91 BC                 3046         .word      SAME1
      0091EA CC 8B B7         [ 2] 3047         JP     ZERO
                                   3048 
                                   3049 ;       find    ( a va -- ca na | a F )
                                   3050 ;       Search vocabulary for string.
                                   3051 ;       Return ca and na if succeeded.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      0091ED 91 AE                 3052         .word      LINK
                           00116F  3053 LINK = . 
      0091EF 04                    3054         .byte      4
      0091F0 46 49 4E 44           3055         .ascii     "FIND"
      0091F4                       3056 FIND:
      0091F4 CD 86 18         [ 4] 3057         CALL     SWAPP
      0091F7 CD 86 08         [ 4] 3058         CALL     DUPP
      0091FA CD 85 81         [ 4] 3059         CALL     CAT
      0091FD CD 86 DD         [ 4] 3060         CALL     TEMP
      009200 CD 85 51         [ 4] 3061         CALL     STORE
      009203 CD 86 08         [ 4] 3062         CALL     DUPP
      009206 CD 85 63         [ 4] 3063         CALL     AT
      009209 CD 85 D1         [ 4] 3064         CALL     TOR
      00920C CD 8B 20         [ 4] 3065         CALL     CELLP
      00920F CD 86 18         [ 4] 3066         CALL     SWAPP
      009212 CD 85 63         [ 4] 3067 FIND1:  CALL     AT
      009215 CD 86 08         [ 4] 3068         CALL     DUPP
      009218 CD 85 18         [ 4] 3069         CALL     QBRAN
      00921B 92 51                 3070         .word      FIND6
      00921D CD 86 08         [ 4] 3071         CALL     DUPP
      009220 CD 85 63         [ 4] 3072         CALL     AT
      009223 CD 84 EF         [ 4] 3073         CALL     DOLIT
      009226 1F 7F                 3074         .word      MASKK
      009228 CD 86 65         [ 4] 3075         CALL     ANDD
      00922B CD 85 C5         [ 4] 3076         CALL     RAT
      00922E CD 86 8E         [ 4] 3077         CALL     XORR
      009231 CD 85 18         [ 4] 3078         CALL     QBRAN
      009234 92 40                 3079         .word      FIND2
      009236 CD 8B 20         [ 4] 3080         CALL     CELLP
      009239 CD 84 EF         [ 4] 3081         CALL     DOLIT
      00923C FF FF                 3082         .word     0xFFFF
      00923E 20 0C            [ 2] 3083         JRA     FIND3
      009240 CD 8B 20         [ 4] 3084 FIND2:  CALL     CELLP
      009243 CD 86 DD         [ 4] 3085         CALL     TEMP
      009246 CD 85 63         [ 4] 3086         CALL     AT
      009249 CD 91 B4         [ 4] 3087         CALL     SAMEQ
      00924C CD 85 34         [ 4] 3088 FIND3:  CALL     BRAN
      00924F 92 60                 3089         .word      FIND4
      009251 CD 85 B4         [ 4] 3090 FIND6:  CALL     RFROM
      009254 CD 85 FE         [ 4] 3091         CALL     DROP
      009257 CD 86 18         [ 4] 3092         CALL     SWAPP
      00925A CD 8B 2F         [ 4] 3093         CALL     CELLM
      00925D CC 86 18         [ 2] 3094         JP     SWAPP
      009260 CD 85 18         [ 4] 3095 FIND4:  CALL     QBRAN
      009263 92 6D                 3096         .word      FIND5
      009265 CD 8B 2F         [ 4] 3097         CALL     CELLM
      009268 CD 8B 2F         [ 4] 3098         CALL     CELLM
      00926B 20 A5            [ 2] 3099         JRA     FIND1
      00926D CD 85 B4         [ 4] 3100 FIND5:  CALL     RFROM
      009270 CD 85 FE         [ 4] 3101         CALL     DROP
      009273 CD 86 18         [ 4] 3102         CALL     SWAPP
      009276 CD 85 FE         [ 4] 3103         CALL     DROP
      009279 CD 8B 2F         [ 4] 3104         CALL     CELLM
      00927C CD 86 08         [ 4] 3105         CALL     DUPP
      00927F CD 91 9E         [ 4] 3106         CALL     NAMET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      009282 CC 86 18         [ 2] 3107         JP     SWAPP
                                   3108 
                                   3109 ;       NAME?   ( a -- ca na | a F )
                                   3110 ;       Search vocabularies for a string.
      009285 91 EF                 3111         .word      LINK
                           001207  3112 LINK = . 
      009287 05                    3113         .byte      5
      009288 4E 41 4D 45 3F        3114         .ascii     "NAME?"
      00928D                       3115 NAMEQ:
      00928D CD 87 51         [ 4] 3116         CALL   CNTXT
      009290 CC 91 F4         [ 2] 3117         JP     FIND
                                   3118 
                                   3119 ;; Terminal response
                                   3120 
                                   3121 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3122 ;       Backup cursor by one character.
      009293 92 87                 3123         .word      LINK
                           001215  3124 LINK = . 
      009295 02                    3125         .byte      2
      009296 5E 48                 3126         .ascii     "^H"
      009298                       3127 BKSP:
      009298 CD 85 D1         [ 4] 3128         CALL     TOR
      00929B CD 86 30         [ 4] 3129         CALL     OVER
      00929E CD 85 B4         [ 4] 3130         CALL     RFROM
      0092A1 CD 86 18         [ 4] 3131         CALL     SWAPP
      0092A4 CD 86 30         [ 4] 3132         CALL     OVER
      0092A7 CD 86 8E         [ 4] 3133         CALL     XORR
      0092AA CD 85 18         [ 4] 3134         CALL     QBRAN
      0092AD 92 C8                 3135         .word      BACK1
      0092AF CD 84 EF         [ 4] 3136         CALL     DOLIT
      0092B2 00 08                 3137         .word      BKSPP
      0092B4 CD 84 B6         [ 4] 3138         CALL     EMIT
      0092B7 CD 8B 58         [ 4] 3139         CALL     ONEM
      0092BA CD 8B AA         [ 4] 3140         CALL     BLANK
      0092BD CD 84 B6         [ 4] 3141         CALL     EMIT
      0092C0 CD 84 EF         [ 4] 3142         CALL     DOLIT
      0092C3 00 08                 3143         .word      BKSPP
      0092C5 CC 84 B6         [ 2] 3144         JP     EMIT
      0092C8 81               [ 4] 3145 BACK1:  RET
                                   3146 
                                   3147 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3148 ;       Accept and echo key stroke
                                   3149 ;       and bump cursor.
      0092C9 92 95                 3150         .word      LINK
                           00124B  3151 LINK = . 
      0092CB 03                    3152         .byte      3
      0092CC 54 41 50              3153         .ascii     "TAP"
      0092CF                       3154 TAP:
      0092CF CD 86 08         [ 4] 3155         CALL     DUPP
      0092D2 CD 84 B6         [ 4] 3156         CALL     EMIT
      0092D5 CD 86 30         [ 4] 3157         CALL     OVER
      0092D8 CD 85 70         [ 4] 3158         CALL     CSTOR
      0092DB CC 8B 4B         [ 2] 3159         JP     ONEP
                                   3160 
                                   3161 ;       kTAP    ( bot eot cur c -- bot eot cur )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                                   3162 ;       Process a key stroke,
                                   3163 ;       CR,LF or backspace.
      0092DE 92 CB                 3164         .word      LINK
                           001260  3165 LINK = . 
      0092E0 04                    3166         .byte      4
      0092E1 4B 54 41 50           3167         .ascii     "KTAP"
      0092E5                       3168 KTAP:
      0092E5 CD 86 08         [ 4] 3169         CALL     DUPP
      0092E8 CD 84 EF         [ 4] 3170         CALL     DOLIT
                           000001  3171 .if EOL_CR
      0092EB 00 0D                 3172         .word   CRR
                           000000  3173 .else ; EOL_LF 
                                   3174         .word   LF
                                   3175 .endif 
      0092ED CD 86 8E         [ 4] 3176         CALL     XORR
      0092F0 CD 85 18         [ 4] 3177         CALL     QBRAN
      0092F3 93 0B                 3178         .word      KTAP2
      0092F5 CD 84 EF         [ 4] 3179         CALL     DOLIT
      0092F8 00 08                 3180         .word      BKSPP
      0092FA CD 86 8E         [ 4] 3181         CALL     XORR
      0092FD CD 85 18         [ 4] 3182         CALL     QBRAN
      009300 93 08                 3183         .word      KTAP1
      009302 CD 8B AA         [ 4] 3184         CALL     BLANK
      009305 CC 92 CF         [ 2] 3185         JP     TAP
      009308 CC 92 98         [ 2] 3186 KTAP1:  JP     BKSP
      00930B CD 85 FE         [ 4] 3187 KTAP2:  CALL     DROP
      00930E CD 86 18         [ 4] 3188         CALL     SWAPP
      009311 CD 85 FE         [ 4] 3189         CALL     DROP
      009314 CC 86 08         [ 2] 3190         JP     DUPP
                                   3191 
                                   3192 ;       accept  ( b u -- b u )
                                   3193 ;       Accept characters to input
                                   3194 ;       buffer. Return with actual count.
      009317 92 E0                 3195         .word      LINK
                           001299  3196 LINK = . 
      009319 06                    3197         .byte      6
      00931A 41 43 43 45 50 54     3198         .ascii     "ACCEPT"
      009320                       3199 ACCEP:
      009320 CD 86 30         [ 4] 3200         CALL     OVER
      009323 CD 88 2D         [ 4] 3201         CALL     PLUS
      009326 CD 86 30         [ 4] 3202         CALL     OVER
      009329 CD 88 18         [ 4] 3203 ACCP1:  CALL     DDUP
      00932C CD 86 8E         [ 4] 3204         CALL     XORR
      00932F CD 85 18         [ 4] 3205         CALL     QBRAN
      009332 93 54                 3206         .word      ACCP4
      009334 CD 8E B5         [ 4] 3207         CALL     KEY
      009337 CD 86 08         [ 4] 3208         CALL     DUPP
      00933A CD 8B AA         [ 4] 3209         CALL     BLANK
      00933D CD 84 EF         [ 4] 3210         CALL     DOLIT
      009340 00 7F                 3211         .word      127
      009342 CD 89 A6         [ 4] 3212         CALL     WITHI
      009345 CD 85 18         [ 4] 3213         CALL     QBRAN
      009348 93 4F                 3214         .word      ACCP2
      00934A CD 92 CF         [ 4] 3215         CALL     TAP
      00934D 20 03            [ 2] 3216         JRA     ACCP3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      00934F CD 92 E5         [ 4] 3217 ACCP2:  CALL     KTAP
      009352 20 D5            [ 2] 3218 ACCP3:  JRA     ACCP1
      009354 CD 85 FE         [ 4] 3219 ACCP4:  CALL     DROP
      009357 CD 86 30         [ 4] 3220         CALL     OVER
      00935A CC 88 A6         [ 2] 3221         JP     SUBB
                                   3222 
                                   3223 ;       QUERY   ( -- )
                                   3224 ;       Accept input stream to
                                   3225 ;       terminal input buffer.
      00935D 93 19                 3226         .word      LINK
                                   3227         
                           0012DF  3228 LINK = . 
      00935F 05                    3229         .byte      5
      009360 51 55 45 52 59        3230         .ascii     "QUERY"
      009365                       3231 QUERY:
      009365 CD 8C B6         [ 4] 3232         CALL     TIB
      009368 CD 84 EF         [ 4] 3233         CALL     DOLIT
      00936B 00 50                 3234         .word      80
      00936D CD 93 20         [ 4] 3235         CALL     ACCEP
      009370 CD 86 FC         [ 4] 3236         CALL     NTIB
      009373 CD 85 51         [ 4] 3237         CALL     STORE
      009376 CD 85 FE         [ 4] 3238         CALL     DROP
      009379 CD 8B B7         [ 4] 3239         CALL     ZERO
      00937C CD 86 EC         [ 4] 3240         CALL     INN
      00937F CC 85 51         [ 2] 3241         JP     STORE
                                   3242 
                                   3243 ;       ABORT   ( -- )
                                   3244 ;       Reset data stack and
                                   3245 ;       jump to QUIT.
      009382 93 5F                 3246         .word      LINK
                           001304  3247 LINK = . 
      009384 05                    3248         .byte      5
      009385 41 42 4F 52 54        3249         .ascii     "ABORT"
      00938A                       3250 ABORT:
      00938A CD 94 81         [ 4] 3251         CALL     PRESE
      00938D CC 94 9E         [ 2] 3252         JP     QUIT
                                   3253 
                                   3254 ;       abort"  ( f -- )
                                   3255 ;       Run time routine of ABORT".
                                   3256 ;       Abort with a message.
      009390 93 84                 3257         .word      LINK
                           001312  3258 LINK = . 
      009392 46                    3259 	.byte      COMPO+6
      009393 41 42 4F 52 54        3260         .ascii     "ABORT"
      009398 22                    3261         .byte      '"'
      009399                       3262 ABORQ:
      009399 CD 85 18         [ 4] 3263         CALL     QBRAN
      00939C 93 B8                 3264         .word      ABOR2   ;text flag
      00939E CD 8F 3F         [ 4] 3265         CALL     DOSTR
      0093A1 CD 8E ED         [ 4] 3266 ABOR1:  CALL     SPACE
      0093A4 CD 8C 7D         [ 4] 3267         CALL     COUNT
      0093A7 CD 8F 17         [ 4] 3268         CALL     TYPES
      0093AA CD 84 EF         [ 4] 3269         CALL     DOLIT
      0093AD 00 3F                 3270         .word     63 ; "?"
      0093AF CD 84 B6         [ 4] 3271         CALL     EMIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0093B2 CD 8F 2F         [ 4] 3272         CALL     CR
      0093B5 CC 93 8A         [ 2] 3273         JP     ABORT   ;pass error string
      0093B8 CD 8F 3F         [ 4] 3274 ABOR2:  CALL     DOSTR
      0093BB CC 85 FE         [ 2] 3275         JP     DROP
                                   3276 
                                   3277 ;; The text interpreter
                                   3278 
                                   3279 ;       $INTERPRET      ( a -- )
                                   3280 ;       Interpret a word. If failed,
                                   3281 ;       try to convert it to an integer.
      0093BE 93 92                 3282         .word      LINK
                           001340  3283 LINK = . 
      0093C0 0A                    3284         .byte      10
      0093C1 24 49 4E 54 45 52 50  3285         .ascii     "$INTERPRET"
             52 45 54
      0093CB                       3286 INTER:
      0093CB CD 92 8D         [ 4] 3287         CALL     NAMEQ
      0093CE CD 87 BB         [ 4] 3288         CALL     QDUP    ;?defined
      0093D1 CD 85 18         [ 4] 3289         CALL     QBRAN
      0093D4 93 F5                 3290         .word      INTE1
      0093D6 CD 85 63         [ 4] 3291         CALL     AT
      0093D9 CD 84 EF         [ 4] 3292         CALL     DOLIT
      0093DC 40 00                 3293 	.word       0x4000	; COMPO*256
      0093DE CD 86 65         [ 4] 3294         CALL     ANDD    ;?compile only lexicon bits
      0093E1 CD 93 99         [ 4] 3295         CALL     ABORQ
      0093E4 0D                    3296         .byte      13
      0093E5 20 63 6F 6D 70 69 6C  3297         .ascii     " compile only"
             65 20 6F 6E 6C 79
      0093F2 CC 85 44         [ 2] 3298         JP     EXECU
      0093F5 CD A4 95         [ 4] 3299 INTE1:  CALL     NUMBQ   ;convert a number
      0093F8 CD 85 18         [ 4] 3300         CALL     QBRAN
      0093FB 93 A1                 3301         .word    ABOR1
      0093FD 81               [ 4] 3302         RET
                                   3303 
                                   3304 ;       [       ( -- )
                                   3305 ;       Start  text interpreter.
      0093FE 93 C0                 3306         .word      LINK
                           001380  3307 LINK = . 
      009400 81                    3308 	.byte      IMEDD+1
      009401 5B                    3309         .ascii     "["
      009402                       3310 LBRAC:
      009402 CD 84 EF         [ 4] 3311         CALL   DOLIT
      009405 93 CB                 3312         .word  INTER
      009407 CD 87 2F         [ 4] 3313         CALL   TEVAL
      00940A CC 85 51         [ 2] 3314         JP     STORE
                                   3315 
                                   3316 ;       .OK     ( -- )
                                   3317 ;       Display 'ok' while interpreting.
      00940D 94 00                 3318         .word      LINK
                           00138F  3319 LINK = . 
      00940F 03                    3320         .byte      3
      009410 2E 4F 4B              3321         .ascii     ".OK"
      009413                       3322 DOTOK:
      009413 CD 84 EF         [ 4] 3323         CALL     DOLIT
      009416 93 CB                 3324         .word      INTER
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      009418 CD 87 2F         [ 4] 3325         CALL     TEVAL
      00941B CD 85 63         [ 4] 3326         CALL     AT
      00941E CD 88 CE         [ 4] 3327         CALL     EQUAL
      009421 CD 85 18         [ 4] 3328         CALL     QBRAN
      009424 94 2D                 3329         .word      DOTO1
      009426 CD 8F 5C         [ 4] 3330         CALL     DOTQP
      009429 03                    3331         .byte      3
      00942A 20 6F 6B              3332         .ascii     " ok"
      00942D CC 8F 2F         [ 2] 3333 DOTO1:  JP     CR
                                   3334 
                                   3335 ;       ?STACK  ( -- )
                                   3336 ;       Abort if stack underflows.
      009430 94 0F                 3337         .word      LINK
                           0013B2  3338 LINK = . 
      009432 06                    3339         .byte      6
      009433 3F 53 54 41 43 4B     3340         .ascii     "?STACK"
      009439                       3341 QSTAC: 
      009439 CD 8B F9         [ 4] 3342         CALL     DEPTH
      00943C CD 86 3F         [ 4] 3343         CALL     ZLESS   ;check only for underflow
      00943F CD 93 99         [ 4] 3344         CALL     ABORQ
      009442 0B                    3345         .byte      11
      009443 20 75 6E 64 65 72 66  3346         .ascii     " underflow "
             6C 6F 77 20
      00944E 81               [ 4] 3347         RET
                                   3348 
                                   3349 ;       EVAL    ( -- )
                                   3350 ;       Interpret  input stream.
      00944F 94 32                 3351         .word      LINK
                           0013D1  3352 LINK = . 
      009451 04                    3353         .byte      4
      009452 45 56 41 4C           3354         .ascii     "EVAL"
      009456                       3355 EVAL:
      009456 CD 91 90         [ 4] 3356 EVAL1:  CALL     TOKEN
      009459 CD 86 08         [ 4] 3357         CALL     DUPP
      00945C CD 85 81         [ 4] 3358         CALL     CAT     ;?input stream empty
      00945F CD 85 18         [ 4] 3359         CALL     QBRAN
      009462 94 72                 3360         .word    EVAL2
      009464 CD 87 2F         [ 4] 3361         CALL     TEVAL
      009467 CD 8C CA         [ 4] 3362         CALL     ATEXE
      00946A CD 94 39         [ 4] 3363         CALL     QSTAC   ;evaluate input, check stack
      00946D CD 85 34         [ 4] 3364         CALL     BRAN
      009470 94 56                 3365         .word    EVAL1
      009472 CD 85 FE         [ 4] 3366 EVAL2:  CALL     DROP
      009475 CC 94 13         [ 2] 3367         JP       DOTOK
                                   3368 
                                   3369 ;       PRESET  ( -- )
                                   3370 ;       Reset data stack pointer and
                                   3371 ;       terminal input buffer.
      009478 94 51                 3372         .word      LINK
                           0013FA  3373 LINK = . 
      00947A 06                    3374         .byte      6
      00947B 50 52 45 53 45 54     3375         .ascii     "PRESET"
      009481                       3376 PRESE:
      009481 CD 84 EF         [ 4] 3377         CALL     DOLIT
      009484 16 80                 3378         .word      SPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      009486 CD 85 F5         [ 4] 3379         CALL     SPSTO
      009489 CD 84 EF         [ 4] 3380         CALL     DOLIT
      00948C 17 00                 3381         .word      TIBB
      00948E CD 86 FC         [ 4] 3382         CALL     NTIB
      009491 CD 8B 20         [ 4] 3383         CALL     CELLP
      009494 CC 85 51         [ 2] 3384         JP     STORE
                                   3385 
                                   3386 ;       QUIT    ( -- )
                                   3387 ;       Reset return stack pointer
                                   3388 ;       and start text interpreter.
      009497 94 7A                 3389         .word      LINK
                           001419  3390 LINK = . 
      009499 04                    3391         .byte      4
      00949A 51 55 49 54           3392         .ascii     "QUIT"
      00949E                       3393 QUIT:
      00949E CD 84 EF         [ 4] 3394         CALL     DOLIT
      0094A1 17 FF                 3395         .word      RPP
      0094A3 CD 85 9E         [ 4] 3396         CALL     RPSTO   ;reset return stack pointer
      0094A6 CD 94 02         [ 4] 3397 QUIT1:  CALL     LBRAC   ;start interpretation
      0094A9 CD 93 65         [ 4] 3398 QUIT2:  CALL     QUERY   ;get input
      0094AC CD 94 56         [ 4] 3399         CALL     EVAL
      0094AF 20 F8            [ 2] 3400         JRA     QUIT2   ;continue till error
                                   3401 
                                   3402 ;; The compiler
                                   3403 
                                   3404 ;       '       ( -- ca )
                                   3405 ;       Search vocabularies for
                                   3406 ;       next word in input stream.
      0094B1 94 99                 3407         .word      LINK
                           001433  3408 LINK = . 
      0094B3 01                    3409         .byte      1
      0094B4 27                    3410         .ascii     "'"
      0094B5                       3411 TICK:
      0094B5 CD 91 90         [ 4] 3412         CALL     TOKEN
      0094B8 CD 92 8D         [ 4] 3413         CALL     NAMEQ   ;?defined
      0094BB CD 85 18         [ 4] 3414         CALL     QBRAN
      0094BE 93 A1                 3415         .word      ABOR1
      0094C0 81               [ 4] 3416         RET     ;yes, push code address
                                   3417 
                                   3418 ;       ALLOT   ( n -- )
                                   3419 ;       Allocate n bytes to RAM 
      0094C1 94 B3                 3420         .word      LINK
                           001443  3421         LINK = . 
      0094C3 05                    3422         .byte      5
      0094C4 41 4C 4C 4F 54        3423         .ascii     "ALLOT"
      0094C9                       3424 ALLOT:
      0094C9 CD 87 5F         [ 4] 3425         CALL     VPP
                                   3426 ; must update APP_VP each time VP is modidied
      0094CC CD 8C 27         [ 4] 3427         call PSTOR 
      0094CF CC 9C 12         [ 2] 3428         jp UPDATVP 
                                   3429 
                                   3430 ;       ,       ( w -- )
                                   3431 ;         Compile an integer into
                                   3432 ;         variable space.
      0094D2 94 C3                 3433         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                           001454  3434 LINK = . 
      0094D4 01                    3435         .byte      1
      0094D5 2C                    3436         .ascii     ","
      0094D6                       3437 COMMA:
      0094D6 CD 8C 94         [ 4] 3438         CALL     HERE
      0094D9 CD 86 08         [ 4] 3439         CALL     DUPP
      0094DC CD 8B 20         [ 4] 3440         CALL     CELLP   ;cell boundary
      0094DF CD 87 5F         [ 4] 3441         CALL     VPP
      0094E2 CD 85 51         [ 4] 3442         CALL     STORE
      0094E5 CC 85 51         [ 2] 3443         JP     STORE
                                   3444 
                                   3445 ;       C,      ( c -- )
                                   3446 ;       Compile a byte into
                                   3447 ;       variables space.
      0094E8 94 D4                 3448        .word      LINK
                           00146A  3449 LINK = . 
      0094EA 02                    3450         .byte      2
      0094EB 43 2C                 3451         .ascii     "C,"
      0094ED                       3452 CCOMMA:
      0094ED CD 8C 94         [ 4] 3453         CALL     HERE
      0094F0 CD 86 08         [ 4] 3454         CALL     DUPP
      0094F3 CD 8B 4B         [ 4] 3455         CALL     ONEP
      0094F6 CD 87 5F         [ 4] 3456         CALL     VPP
      0094F9 CD 85 51         [ 4] 3457         CALL     STORE
      0094FC CC 85 70         [ 2] 3458         JP     CSTOR
                                   3459 
                                   3460 ;       [COMPILE]       ( -- ; <string> )
                                   3461 ;       Compile next immediate
                                   3462 ;       word into code dictionary.
      0094FF 94 EA                 3463         .word      LINK
                           001481  3464 LINK = . 
      009501 89                    3465 	.byte      IMEDD+9
      009502 5B 43 4F 4D 50 49 4C  3466         .ascii     "[COMPILE]"
             45 5D
      00950B                       3467 BCOMP:
      00950B CD 94 B5         [ 4] 3468         CALL     TICK
      00950E CC 97 E1         [ 2] 3469         JP     JSRC
                                   3470 
                                   3471 ;       COMPILE ( -- )
                                   3472 ;       Compile next jsr in
                                   3473 ;       colon list to code dictionary.
      009511 95 01                 3474         .word      LINK
                           001493  3475 LINK = . 
      009513 47                    3476 	.byte      COMPO+7
      009514 43 4F 4D 50 49 4C 45  3477         .ascii     "COMPILE"
      00951B                       3478 COMPI:
      00951B CD 85 B4         [ 4] 3479         CALL     RFROM
      00951E CD 86 08         [ 4] 3480         CALL     DUPP
      009521 CD 85 63         [ 4] 3481         CALL     AT
      009524 CD 97 E1         [ 4] 3482         CALL     JSRC    ;compile subroutine
      009527 CD 8B 20         [ 4] 3483         CALL     CELLP
      00952A 90 93            [ 1] 3484         ldw y,x 
      00952C 90 FE            [ 2] 3485         ldw y,(y)
      00952E 1C 00 02         [ 2] 3486         addw x,#CELLL 
      009531 90 FC            [ 2] 3487         jp (y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   3488 
                                   3489 ;       LITERAL ( w -- )
                                   3490 ;       Compile tos to dictionary
                                   3491 ;       as an integer literal.
      009533 95 13                 3492         .word      LINK
                           0014B5  3493 LINK = . 
      009535 87                    3494 	.byte      IMEDD+7
      009536 4C 49 54 45 52 41 4C  3495         .ascii     "LITERAL"
      00953D                       3496 LITER:
      00953D CD 95 1B         [ 4] 3497         CALL     COMPI
      009540 84 EF                 3498         .word DOLIT 
      009542 CC 94 D6         [ 2] 3499         JP     COMMA
                                   3500 
                                   3501 ;       $,"     ( -- )
                                   3502 ;       Compile a literal string
                                   3503 ;       up to next " .
      009545 95 35                 3504         .word      LINK
                           0014C7  3505 LINK = . 
      009547 03                    3506         .byte      3
      009548 24 2C 22              3507         .byte     '$',',','"'
      00954B                       3508 STRCQ:
      00954B CD 84 EF         [ 4] 3509         CALL     DOLIT
      00954E 00 22                 3510         .word     34	; "
      009550 CD 90 D0         [ 4] 3511         CALL     PARSE
      009553 CD 8C 94         [ 4] 3512         CALL     HERE
      009556 CD 8D 54         [ 4] 3513         CALL     PACKS   ;string to code dictionary
      009559 CD 8C 7D         [ 4] 3514         CALL     COUNT
      00955C CD 88 2D         [ 4] 3515         CALL     PLUS    ;calculate aligned end of string
      00955F CD 87 5F         [ 4] 3516         CALL     VPP
      009562 CC 85 51         [ 2] 3517         JP     STORE
                                   3518 
                                   3519 ;; Structures
                                   3520 
                                   3521 ;       FOR     ( -- a )
                                   3522 ;       Start a FOR-NEXT loop
                                   3523 ;       structure in a colon definition.
      009565 95 47                 3524         .word      LINK
                           0014E7  3525 LINK = . 
      009567 83                    3526 	.byte      IMEDD+3
      009568 46 4F 52              3527         .ascii     "FOR"
      00956B                       3528 FOR:
      00956B CD 95 1B         [ 4] 3529         CALL     COMPI
      00956E 85 D1                 3530         .word TOR 
      009570 CC 8C 94         [ 2] 3531         JP     HERE
                                   3532 
                                   3533 ;       NEXT    ( a -- )
                                   3534 ;       Terminate a FOR-NEXT loop.
      009573 95 67                 3535         .word      LINK
                           0014F5  3536 LINK = . 
      009575 84                    3537 	.byte      IMEDD+4
      009576 4E 45 58 54           3538         .ascii     "NEXT"
      00957A                       3539 NEXT:
      00957A CD 95 1B         [ 4] 3540         CALL     COMPI
      00957D 85 03                 3541         .word DONXT 
      00957F CD 87 AB         [ 4] 3542         call ADRADJ
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      009582 CC 94 D6         [ 2] 3543         JP     COMMA
                                   3544 
                                   3545 ;       I ( -- n )
                                   3546 ;       stack FOR-NEXT COUNTER 
      009585 95 75                 3547         .word LINK 
                           001507  3548         LINK=.
      009587 01                    3549         .byte 1 
      009588 49                    3550         .ascii "I"
      009589                       3551 IFETCH: 
      009589 1D 00 02         [ 2] 3552         subw x,#CELLL 
      00958C 16 03            [ 2] 3553         ldw y,(3,sp)
      00958E FF               [ 2] 3554         ldw (x),y 
      00958F 81               [ 4] 3555         ret 
                                   3556 
                                   3557 ;       BEGIN   ( -- a )
                                   3558 ;       Start an infinite or
                                   3559 ;       indefinite loop structure.
      009590 95 87                 3560         .word      LINK
                           001512  3561 LINK = . 
      009592 85                    3562 	.byte      IMEDD+5
      009593 42 45 47 49 4E        3563         .ascii     "BEGIN"
      009598                       3564 BEGIN:
      009598 CC 8C 94         [ 2] 3565         JP     HERE
                                   3566 
                                   3567 ;       UNTIL   ( a -- )
                                   3568 ;       Terminate a BEGIN-UNTIL
                                   3569 ;       indefinite loop structure.
      00959B 95 92                 3570         .word      LINK
                           00151D  3571 LINK = . 
      00959D 85                    3572 	.byte      IMEDD+5
      00959E 55 4E 54 49 4C        3573         .ascii     "UNTIL"
      0095A3                       3574 UNTIL:
      0095A3 CD 95 1B         [ 4] 3575         CALL     COMPI
      0095A6 85 18                 3576         .word    QBRAN 
      0095A8 CD 87 AB         [ 4] 3577         call ADRADJ
      0095AB CC 94 D6         [ 2] 3578         JP     COMMA
                                   3579 
                                   3580 ;       AGAIN   ( a -- )
                                   3581 ;       Terminate a BEGIN-AGAIN
                                   3582 ;       infinite loop structure.
      0095AE 95 9D                 3583         .word      LINK
                           001530  3584 LINK = . 
      0095B0 85                    3585 	.byte      IMEDD+5
      0095B1 41 47 41 49 4E        3586         .ascii     "AGAIN"
      0095B6                       3587 AGAIN:
      0095B6 CD 95 1B         [ 4] 3588         CALL     COMPI
      0095B9 85 34                 3589         .word BRAN
      0095BB CD 87 AB         [ 4] 3590         call ADRADJ 
      0095BE CC 94 D6         [ 2] 3591         JP     COMMA
                                   3592 
                                   3593 ;       IF      ( -- A )
                                   3594 ;       Begin a conditional branch.
      0095C1 95 B0                 3595         .word      LINK
                           001543  3596 LINK = . 
      0095C3 82                    3597 	.byte      IMEDD+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0095C4 49 46                 3598         .ascii     "IF"
      0095C6                       3599 IFF:
      0095C6 CD 95 1B         [ 4] 3600         CALL     COMPI
      0095C9 85 18                 3601         .word QBRAN
      0095CB CD 8C 94         [ 4] 3602         CALL     HERE
      0095CE CD 8B B7         [ 4] 3603         CALL     ZERO
      0095D1 CC 94 D6         [ 2] 3604         JP     COMMA
                                   3605 
                                   3606 ;       THEN        ( A -- )
                                   3607 ;       Terminate a conditional branch structure.
      0095D4 95 C3                 3608         .word      LINK
                           001556  3609 LINK = . 
      0095D6 84                    3610 	.byte      IMEDD+4
      0095D7 54 48 45 4E           3611         .ascii     "THEN"
      0095DB                       3612 THENN:
      0095DB CD 8C 94         [ 4] 3613         CALL     HERE
      0095DE CD 87 AB         [ 4] 3614         call ADRADJ 
      0095E1 CD 86 18         [ 4] 3615         CALL     SWAPP
      0095E4 CC 85 51         [ 2] 3616         JP     STORE
                                   3617 
                                   3618 ;       ELSE        ( A -- A )
                                   3619 ;       Start the false clause in an IF-ELSE-THEN structure.
      0095E7 95 D6                 3620         .word      LINK
                           001569  3621 LINK = . 
      0095E9 84                    3622 	.byte      IMEDD+4
      0095EA 45 4C 53 45           3623         .ascii     "ELSE"
      0095EE                       3624 ELSEE:
      0095EE CD 95 1B         [ 4] 3625         CALL     COMPI
      0095F1 85 34                 3626         .word BRAN
      0095F3 CD 8C 94         [ 4] 3627         CALL     HERE
      0095F6 CD 8B B7         [ 4] 3628         CALL     ZERO
      0095F9 CD 94 D6         [ 4] 3629         CALL     COMMA
      0095FC CD 86 18         [ 4] 3630         CALL     SWAPP
      0095FF CD 8C 94         [ 4] 3631         CALL     HERE
      009602 CD 87 AB         [ 4] 3632         call ADRADJ 
      009605 CD 86 18         [ 4] 3633         CALL     SWAPP
      009608 CC 85 51         [ 2] 3634         JP     STORE
                                   3635 
                                   3636 ;       AHEAD       ( -- A )
                                   3637 ;       Compile a forward branch instruction.
      00960B 95 E9                 3638         .word      LINK
                           00158D  3639 LINK = . 
      00960D 85                    3640 	.byte      IMEDD+5
      00960E 41 48 45 41 44        3641         .ascii     "AHEAD"
      009613                       3642 AHEAD:
      009613 CD 95 1B         [ 4] 3643         CALL     COMPI
      009616 85 34                 3644         .word BRAN
      009618 CD 8C 94         [ 4] 3645         CALL     HERE
      00961B CD 8B B7         [ 4] 3646         CALL     ZERO
      00961E CC 94 D6         [ 2] 3647         JP     COMMA
                                   3648 
                                   3649 ;       WHILE       ( a -- A a )
                                   3650 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      009621 96 0D                 3651         .word      LINK
                           0015A3  3652 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      009623 85                    3653 	.byte      IMEDD+5
      009624 57 48 49 4C 45        3654         .ascii     "WHILE"
      009629                       3655 WHILE:
      009629 CD 95 1B         [ 4] 3656         CALL     COMPI
      00962C 85 18                 3657         .word QBRAN
      00962E CD 8C 94         [ 4] 3658         CALL     HERE
      009631 CD 8B B7         [ 4] 3659         CALL     ZERO
      009634 CD 94 D6         [ 4] 3660         CALL     COMMA
      009637 CC 86 18         [ 2] 3661         JP     SWAPP
                                   3662 
                                   3663 ;       REPEAT      ( A a -- )
                                   3664 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      00963A 96 23                 3665         .word      LINK
                           0015BC  3666 LINK = . 
      00963C 86                    3667         .byte      IMEDD+6
      00963D 52 45 50 45 41 54     3668         .ascii     "REPEAT"
      009643                       3669 REPEA:
      009643 CD 95 1B         [ 4] 3670         CALL     COMPI
      009646 85 34                 3671         .word BRAN
      009648 CD 87 AB         [ 4] 3672         call ADRADJ 
      00964B CD 94 D6         [ 4] 3673         CALL     COMMA
      00964E CD 8C 94         [ 4] 3674         CALL     HERE
      009651 CD 87 AB         [ 4] 3675         call ADRADJ 
      009654 CD 86 18         [ 4] 3676         CALL     SWAPP
      009657 CC 85 51         [ 2] 3677         JP     STORE
                                   3678 
                                   3679 ;       AFT         ( a -- a A )
                                   3680 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      00965A 96 3C                 3681         .word      LINK
                           0015DC  3682 LINK = . 
      00965C 83                    3683 	.byte      IMEDD+3
      00965D 41 46 54              3684         .ascii     "AFT"
      009660                       3685 AFT:
      009660 CD 85 FE         [ 4] 3686         CALL     DROP
      009663 CD 96 13         [ 4] 3687         CALL     AHEAD
      009666 CD 8C 94         [ 4] 3688         CALL     HERE
      009669 CC 86 18         [ 2] 3689         JP     SWAPP
                                   3690 
                                   3691 ;       ABORT"      ( -- ; <string> )
                                   3692 ;       Conditional abort with an error message.
      00966C 96 5C                 3693         .word      LINK
                           0015EE  3694 LINK = . 
      00966E 86                    3695 	.byte      IMEDD+6
      00966F 41 42 4F 52 54        3696         .ascii     "ABORT"
      009674 22                    3697         .byte      '"'
      009675                       3698 ABRTQ:
      009675 CD 95 1B         [ 4] 3699         CALL     COMPI
      009678 93 99                 3700         .word ABORQ
      00967A CC 95 4B         [ 2] 3701         JP     STRCQ
                                   3702 
                                   3703 ;       $"     ( -- ; <string> )
                                   3704 ;       Compile an inline string literal.
      00967D 96 6E                 3705         .word      LINK
                           0015FF  3706 LINK = . 
      00967F 82                    3707 	.byte      IMEDD+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      009680 24 22                 3708         .byte     '$','"'
      009682                       3709 STRQ:
      009682 CD 95 1B         [ 4] 3710         CALL     COMPI
      009685 8F 58                 3711         .word STRQP 
      009687 CC 95 4B         [ 2] 3712         JP     STRCQ
                                   3713 
                                   3714 ;       ."          ( -- ; <string> )
                                   3715 ;       Compile an inline string literal to be typed out at run time.
      00968A 96 7F                 3716         .word      LINK
                           00160C  3717 LINK = . 
      00968C 82                    3718 	.byte      IMEDD+2
      00968D 2E 22                 3719         .byte     '.','"'
      00968F                       3720 DOTQ:
      00968F CD 95 1B         [ 4] 3721         CALL     COMPI
      009692 8F 5C                 3722         .word DOTQP 
      009694 CC 95 4B         [ 2] 3723         JP     STRCQ
                                   3724 
                                   3725 ;; Name compiler
                                   3726 
                                   3727 ;       ?UNIQUE ( a -- a )
                                   3728 ;       Display a warning message
                                   3729 ;       if word already exists.
      009697 96 8C                 3730         .word      LINK
                           001619  3731 LINK = . 
      009699 07                    3732         .byte      7
      00969A 3F 55 4E 49 51 55 45  3733         .ascii     "?UNIQUE"
      0096A1                       3734 UNIQU:
      0096A1 CD 86 08         [ 4] 3735         CALL     DUPP
      0096A4 CD 92 8D         [ 4] 3736         CALL     NAMEQ   ;?name exists
      0096A7 CD 85 18         [ 4] 3737         CALL     QBRAN
      0096AA 96 C0                 3738         .word      UNIQ1
      0096AC CD 8F 5C         [ 4] 3739         CALL     DOTQP   ;redef are OK
      0096AF 07                    3740         .byte       7
      0096B0 20 72 65 44 65 66 20  3741         .ascii     " reDef "       
      0096B7 CD 86 30         [ 4] 3742         CALL     OVER
      0096BA CD 8C 7D         [ 4] 3743         CALL     COUNT
      0096BD CD 8F 17         [ 4] 3744         CALL     TYPES   ;just in case
      0096C0 CC 85 FE         [ 2] 3745 UNIQ1:  JP     DROP
                                   3746 
                                   3747 ;       $,n     ( na -- )
                                   3748 ;       Build a new dictionary name
                                   3749 ;       using string at na.
                                   3750 ; compile dans l'espace des variables 
      0096C3 96 99                 3751         .word      LINK
                           001645  3752 LINK = . 
      0096C5 03                    3753         .byte      3
      0096C6 24 2C 6E              3754         .ascii     "$,n"
      0096C9                       3755 SNAME:
      0096C9 CD 86 08         [ 4] 3756         CALL     DUPP
      0096CC CD 85 81         [ 4] 3757         CALL     CAT     ;?null input
      0096CF CD 85 18         [ 4] 3758         CALL     QBRAN
      0096D2 96 FF                 3759         .word      PNAM1
      0096D4 CD 96 A1         [ 4] 3760         CALL     UNIQU   ;?redefinition
      0096D7 CD 86 08         [ 4] 3761         CALL     DUPP
      0096DA CD 8C 7D         [ 4] 3762         CALL     COUNT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      0096DD CD 88 2D         [ 4] 3763         CALL     PLUS
      0096E0 CD 87 5F         [ 4] 3764         CALL     VPP
      0096E3 CD 85 51         [ 4] 3765         CALL     STORE
      0096E6 CD 86 08         [ 4] 3766         CALL     DUPP
      0096E9 CD 87 7D         [ 4] 3767         CALL     LAST
      0096EC CD 85 51         [ 4] 3768         CALL     STORE   ;save na for vocabulary link
      0096EF CD 8B 2F         [ 4] 3769         CALL     CELLM   ;link address
      0096F2 CD 87 51         [ 4] 3770         CALL     CNTXT
      0096F5 CD 85 63         [ 4] 3771         CALL     AT
      0096F8 CD 86 18         [ 4] 3772         CALL     SWAPP
      0096FB CD 85 51         [ 4] 3773         CALL     STORE
      0096FE 81               [ 4] 3774         RET     ;save code pointer
      0096FF CD 8F 58         [ 4] 3775 PNAM1:  CALL     STRQP
      009702 05                    3776         .byte      5
      009703 20 6E 61 6D 65        3777         .ascii     " name" ;null input
      009708 CC 93 A1         [ 2] 3778         JP     ABOR1
                                   3779 
                                   3780 ;; FORTH compiler
                                   3781 
                                   3782 ;       $COMPILE        ( a -- )
                                   3783 ;       Compile next word to
                                   3784 ;       dictionary as a token or literal.
      00970B 96 C5                 3785         .word      LINK
                           00168D  3786 LINK = . 
      00970D 08                    3787         .byte      8
      00970E 24 43 4F 4D 50 49 4C  3788         .ascii     "$COMPILE"
             45
      009716                       3789 SCOMP:
      009716 CD 92 8D         [ 4] 3790         CALL     NAMEQ
      009719 CD 87 BB         [ 4] 3791         CALL     QDUP    ;?defined
      00971C CD 85 18         [ 4] 3792         CALL     QBRAN
      00971F 97 37                 3793         .word      SCOM2
      009721 CD 85 63         [ 4] 3794         CALL     AT
      009724 CD 84 EF         [ 4] 3795         CALL     DOLIT
      009727 80 00                 3796         .word     0x8000	;  IMEDD*256
      009729 CD 86 65         [ 4] 3797         CALL     ANDD    ;?immediate
      00972C CD 85 18         [ 4] 3798         CALL     QBRAN
      00972F 97 34                 3799         .word      SCOM1
      009731 CC 85 44         [ 2] 3800         JP     EXECU
      009734 CC 97 E1         [ 2] 3801 SCOM1:  JP     JSRC
      009737 CD A4 95         [ 4] 3802 SCOM2:  CALL     NUMBQ   ;try to convert to number
      00973A CD 87 BB         [ 4] 3803         CALL    QDUP  
      00973D CD 85 18         [ 4] 3804         CALL     QBRAN
      009740 93 A1                 3805         .word      ABOR1
      0016C2                       3806         _DOLIT  -1
      009742 CD 84 EF         [ 4]    1     CALL DOLIT 
      009745 FF FF                    2     .word -1 
      009747 CD 88 CE         [ 4] 3807         CALL    EQUAL
      0016CA                       3808         _QBRAN DLITER  
      00974A CD 85 18         [ 4]    1     CALL QBRAN
      00974D A8 E2                    2     .word DLITER
      00974F CC 95 3D         [ 2] 3809         JP     LITER
                                   3810 
                                   3811 ;       OVERT   ( -- )
                                   3812 ;       Link a new word into vocabulary.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      009752 97 0D                 3813         .word      LINK
                           0016D4  3814 LINK = . 
      009754 05                    3815         .byte      5
      009755 4F 56 45 52 54        3816         .ascii     "OVERT"
      00975A                       3817 OVERT:
      00975A CD 87 7D         [ 4] 3818         CALL     LAST
      00975D CD 85 63         [ 4] 3819         CALL     AT
      009760 CD 87 51         [ 4] 3820         CALL     CNTXT
      009763 CC 85 51         [ 2] 3821         JP     STORE
                                   3822 
                                   3823 ;       ;       ( -- )
                                   3824 ;       Terminate a colon definition.
      009766 97 54                 3825         .word      LINK
                           0016E8  3826 LINK = . 
      009768 C1                    3827 	.byte      IMEDD+COMPO+1
      009769 3B                    3828         .ascii     ";"
      00976A                       3829 SEMIS:
                           000001  3830 .if OPTIMIZE ; more compact and faster
      00976A CD 84 EF         [ 4] 3831         call DOLIT 
      00976D 00 81                 3832         .word 0x81   ; opcode for RET 
      00976F CD 94 ED         [ 4] 3833         call CCOMMA 
                           000000  3834 .else
                                   3835         CALL     COMPI
                                   3836         .word EXIT 
                                   3837 .endif 
      009772 CD 94 02         [ 4] 3838         CALL     LBRAC
      009775 CD 97 5A         [ 4] 3839         call OVERT 
      009778 CD A1 6A         [ 4] 3840         CALL FMOVE
      00977B CD 87 BB         [ 4] 3841         call QDUP 
      00977E CD 85 18         [ 4] 3842         call QBRAN 
      009781 98 B1                 3843         .word SET_RAMLAST 
      009783 CD A1 FE         [ 4] 3844         CALL UPDATPTR
      009786 81               [ 4] 3845         RET 
                                   3846 
                                   3847 
                                   3848 ;       Terminate an ISR definition 
                                   3849 ;       retourn ca of ISR as double
                                   3850 ;       I; ( -- ud )
      009787 97 68                 3851         .word LINK 
                           001709  3852         LINK=.
      009789 C2                    3853         .byte 2+IMEDD+COMPO 
      00978A 49 3B                 3854         .ascii "I;" 
      00978C                       3855 ISEMI:
      00978C 1D 00 02         [ 2] 3856         subw x,#CELLL  
      00978F 90 AE 00 80      [ 2] 3857         ldw y,#IRET_CODE 
      009793 FF               [ 2] 3858         ldw (x),y 
      009794 CD 94 ED         [ 4] 3859         call CCOMMA
      009797 CD 94 02         [ 4] 3860         call LBRAC 
      00979A CD A2 43         [ 4] 3861         call IFMOVE
      00979D CD 87 BB         [ 4] 3862         call QDUP 
      0097A0 CD 85 18         [ 4] 3863         CALL QBRAN 
      0097A3 98 B1                 3864         .word SET_RAMLAST
      0097A5 CD 87 6D         [ 4] 3865         CALL CPP
      0097A8 CD 85 63         [ 4] 3866         call AT 
      0097AB CD 86 18         [ 4] 3867         call SWAPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      0097AE CD 87 6D         [ 4] 3868         CALL CPP 
      0097B1 CD 85 51         [ 4] 3869         call STORE 
      0097B4 CD 9B FB         [ 4] 3870         call UPDATCP 
      0097B7 CD 9B B8         [ 4] 3871         call EEPVP 
      0097BA CD 85 FE         [ 4] 3872         call DROP 
      0097BD CD 85 63         [ 4] 3873         call AT 
      0097C0 CD 87 5F         [ 4] 3874         call VPP 
      0097C3 CD 85 51         [ 4] 3875         call STORE 
      0097C6 CC 8B B7         [ 2] 3876         jp ZERO
      0097C9 81               [ 4] 3877         ret           
                                   3878         
                                   3879 
                                   3880 ;       ]       ( -- )
                                   3881 ;       Start compiling words in
                                   3882 ;       input stream.
      0097CA 97 89                 3883         .word      LINK
                           00174C  3884 LINK = . 
      0097CC 01                    3885         .byte      1
      0097CD 5D                    3886         .ascii     "]"
      0097CE                       3887 RBRAC:
      0097CE CD 84 EF         [ 4] 3888         CALL   DOLIT
      0097D1 97 16                 3889         .word  SCOMP
      0097D3 CD 87 2F         [ 4] 3890         CALL   TEVAL
      0097D6 CC 85 51         [ 2] 3891         JP     STORE
                                   3892 
                                   3893 ;       CALL,    ( ca -- )
                                   3894 ;       Compile a subroutine call.
      0097D9 97 CC                 3895         .word      LINK
                           00175B  3896 LINK = . 
      0097DB 05                    3897         .byte      5
      0097DC 43 41 4C 4C 2C        3898         .ascii     "CALL,"
      0097E1                       3899 JSRC:
      0097E1 CD 84 EF         [ 4] 3900         CALL     DOLIT
      0097E4 00 CD                 3901         .word     CALLL     ;CALL
      0097E6 CD 94 ED         [ 4] 3902         CALL     CCOMMA
      0097E9 CC 94 D6         [ 2] 3903         JP     COMMA
                                   3904 
                                   3905 ;       INIT-OFS ( -- )
                                   3906 ;       compute offset to adjust jump address 
                                   3907 ;       set variable OFFSET 
      0097EC 97 DB                 3908         .word LINK 
                           00176E  3909         LINK=.
      0097EE 08                    3910         .byte 8 
      0097EF 49 4E 49 54 2D 4F 46  3911         .ascii "INIT-OFS" 
             53
      0097F7                       3912 INITOFS:
      0097F7 CD 87 1E         [ 4] 3913         call TFLASH 
      0097FA CD 85 63         [ 4] 3914         CALL AT 
      0097FD CD 86 08         [ 4] 3915         CALL DUPP 
      009800 CD 85 18         [ 4] 3916         call QBRAN
      009803 98 14                 3917         .word 1$
      009805 CD 85 FE         [ 4] 3918         call DROP  
      009808 CD 87 6D         [ 4] 3919         call CPP 
      00980B CD 85 63         [ 4] 3920         call AT 
      00980E CD 8C 94         [ 4] 3921         call HERE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      009811 CD 88 A6         [ 4] 3922         call SUBB 
      009814 CD 87 A2         [ 4] 3923 1$:     call OFFSET 
      009817 CC 85 51         [ 2] 3924         jp STORE  
                                   3925 
                                   3926 ;       :       ( -- ; <string> )
                                   3927 ;       Start a new colon definition
                                   3928 ;       using next word as its name.
      00981A 97 EE                 3929         .word      LINK
                           00179C  3930 LINK = . 
      00981C 01                    3931         .byte      1
      00981D 3A                    3932         .ascii     ":"
      00981E                       3933 COLON:
      00981E CD 97 F7         [ 4] 3934         call INITOFS       
      009821 CD 91 90         [ 4] 3935         CALL   TOKEN
      009824 CD 96 C9         [ 4] 3936         CALL   SNAME
      009827 CC 97 CE         [ 2] 3937         JP     RBRAC
                                   3938 
                                   3939 ;       I:  ( -- )
                                   3940 ;       Start interrupt service routine definition
                                   3941 ;       those definition have no name.
      00982A 98 1C                 3942         .word LINK
                           0017AC  3943         LINK=.
      00982C 02                    3944         .byte 2 
      00982D 49 3A                 3945         .ascii "I:" 
      00982F                       3946 ICOLON:
      00982F CD 97 F7         [ 4] 3947         call INITOFS 
      009832 CC 97 CE         [ 2] 3948         jp RBRAC  
                                   3949 
                                   3950 ;       IMMEDIATE       ( -- )
                                   3951 ;       Make last compiled word
                                   3952 ;       an immediate word.
      009835 98 2C                 3953         .word      LINK
                           0017B7  3954 LINK = . 
      009837 09                    3955         .byte      9
      009838 49 4D 4D 45 44 49 41  3956         .ascii     "IMMEDIATE"
             54 45
      009841                       3957 IMMED:
      009841 CD 84 EF         [ 4] 3958         CALL     DOLIT
      009844 80 00                 3959         .word     0x8000	;  IMEDD*256
      009846 CD 87 7D         [ 4] 3960         CALL     LAST
      009849 CD 85 63         [ 4] 3961         CALL     AT
      00984C CD 85 63         [ 4] 3962         CALL     AT
      00984F CD 86 79         [ 4] 3963         CALL     ORR
      009852 CD 87 7D         [ 4] 3964         CALL     LAST
      009855 CD 85 63         [ 4] 3965         CALL     AT
      009858 CC 85 51         [ 2] 3966         JP     STORE
                                   3967 
                                   3968 ;; Defining words
                                   3969 
                                   3970 ;       CREATE  ( -- ; <string> )
                                   3971 ;       Compile a new array
                                   3972 ;       without allocating space.
      00985B 98 37                 3973         .word      LINK
                           0017DD  3974 LINK = . 
      00985D 06                    3975         .byte      6
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      00985E 43 52 45 41 54 45     3976         .ascii     "CREATE"
      009864                       3977 CREAT:
      009864 CD 91 90         [ 4] 3978         CALL     TOKEN
      009867 CD 96 C9         [ 4] 3979         CALL     SNAME
      00986A CD 97 5A         [ 4] 3980         CALL     OVERT        
      00986D CD 95 1B         [ 4] 3981         CALL     COMPI 
      009870 86 BE                 3982         .word DOVAR 
      009872 81               [ 4] 3983         RET
                                   3984 
                                   3985 ;       VARIABLE        ( -- ; <string> )
                                   3986 ;       Compile a new variable
                                   3987 ;       initialized to 0.
      009873 98 5D                 3988         .word      LINK
                           0017F5  3989 LINK = . 
      009875 08                    3990         .byte      8
      009876 56 41 52 49 41 42 4C  3991         .ascii     "VARIABLE"
             45
      00987E                       3992 VARIA:
                                   3993 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      00987E CD 8C 94         [ 4] 3994         CALL HERE
      009881 CD 86 08         [ 4] 3995         CALL DUPP 
      009884 CD 8B 20         [ 4] 3996         CALL CELLP
      009887 CD 87 5F         [ 4] 3997         CALL VPP 
      00988A CD 85 51         [ 4] 3998         CALL STORE
      00988D CD 98 64         [ 4] 3999         CALL CREAT
      009890 CD 86 08         [ 4] 4000         CALL DUPP
      009893 CD 94 D6         [ 4] 4001         CALL COMMA
      009896 CD 8B B7         [ 4] 4002         CALL ZERO
      009899 CD 86 18         [ 4] 4003         call SWAPP 
      00989C CD 85 51         [ 4] 4004         CALL STORE
      00989F CD A1 6A         [ 4] 4005         CALL FMOVE ; move definition to FLASH
      0098A2 CD 87 BB         [ 4] 4006         CALL QDUP 
      0098A5 CD 85 18         [ 4] 4007         CALL QBRAN 
      0098A8 98 B1                 4008         .word SET_RAMLAST   
      0098AA CD 9C 12         [ 4] 4009         call UPDATVP  ; don't update if variable kept in RAM.
      0098AD CD A1 FE         [ 4] 4010         CALL UPDATPTR
      0098B0 81               [ 4] 4011         RET         
      0098B1                       4012 SET_RAMLAST: 
      0098B1 CD 87 7D         [ 4] 4013         CALL LAST 
      0098B4 CD 85 63         [ 4] 4014         CALL AT 
      0098B7 CD 87 90         [ 4] 4015         CALL RAMLAST 
      0098BA CC 85 51         [ 2] 4016         jp STORE  
                                   4017 
                                   4018 
                                   4019 ;       CONSTANT  ( n -- ; <string> )
                                   4020 ;       Compile a new constant 
                                   4021 ;       n CONSTANT name 
      0098BD 98 75                 4022         .word LINK 
                           00183F  4023         LINK=. 
      0098BF 08                    4024         .byte 8 
      0098C0 43 4F 4E 53 54 41 4E  4025         .ascii "CONSTANT" 
             54
      0098C8                       4026 CONSTANT:          
      0098C8 CD 91 90         [ 4] 4027         CALL TOKEN
      0098CB CD 96 C9         [ 4] 4028         CALL SNAME 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      0098CE CD 97 5A         [ 4] 4029         CALL OVERT 
      0098D1 CD 95 1B         [ 4] 4030         CALL COMPI 
      0098D4 98 E8                 4031         .word DOCONST
      0098D6 CD 94 D6         [ 4] 4032         CALL COMMA 
      0098D9 CD A1 6A         [ 4] 4033         CALL FMOVE
      0098DC CD 87 BB         [ 4] 4034         CALL QDUP 
      0098DF CD 85 18         [ 4] 4035         CALL QBRAN 
      0098E2 98 B1                 4036         .word SET_RAMLAST  
      0098E4 CD A1 FE         [ 4] 4037         CALL UPDATPTR  
      0098E7 81               [ 4] 4038 1$:     RET          
                                   4039 
                                   4040 ; CONSTANT runtime semantic 
                                   4041 ; doCONST  ( -- n )
                                   4042 ;        .word LINK 
                                   4043 ;        LINK=.
                                   4044 ;        .byte 7
                                   4045 ;        .ascii "DOCONST"
      0098E8                       4046 DOCONST:
      0098E8 1D 00 02         [ 2] 4047         subw x,#CELLL
      0098EB 90 85            [ 2] 4048         popw y 
      0098ED 90 FE            [ 2] 4049         ldw y,(y) 
      0098EF FF               [ 2] 4050         ldw (x),y 
      0098F0 81               [ 4] 4051         ret 
                                   4052 
                                   4053 ;----------------------------------
                                   4054 ; create double constant 
                                   4055 ; 2CONSTANT ( d -- ; <string> )
                                   4056 ;----------------------------------
      0098F1 98 BF                 4057     .word LINK 
                           001873  4058     LINK=.
      0098F3 09                    4059     .byte 9 
      0098F4 32 43 4F 4E 53 54 41  4060     .ascii "2CONSTANT"
             4E 54
      0098FD                       4061 DCONST:
      0098FD CD 91 90         [ 4] 4062         CALL TOKEN
      009900 CD 96 C9         [ 4] 4063         CALL SNAME 
      009903 CD 97 5A         [ 4] 4064         CALL OVERT 
      009906 CD 95 1B         [ 4] 4065         CALL COMPI 
      009909 99 20                 4066         .word DO_DCONST
      00990B CD 94 D6         [ 4] 4067         CALL COMMA
      00990E CD 94 D6         [ 4] 4068         CALL COMMA  
      009911 CD A1 6A         [ 4] 4069         CALL FMOVE
      009914 CD 87 BB         [ 4] 4070         CALL QDUP 
      009917 CD 85 18         [ 4] 4071         CALL QBRAN 
      00991A 98 B1                 4072         .word SET_RAMLAST  
      00991C CD A1 FE         [ 4] 4073         CALL UPDATPTR  
      00991F 81               [ 4] 4074 1$:     RET          
                                   4075     
                                   4076 ;----------------------------------
                                   4077 ; runtime for DCONST 
                                   4078 ; stack double constant 
                                   4079 ; DO-DCONST ( -- d )
                                   4080 ;-----------------------------------
                                   4081 ;        .word LINK 
                                   4082 ;        LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                                   4083 ;        .byte 9 
                                   4084 ;        .ascii "DO-DCONST"
      009920                       4085 DO_DCONST:
      009920 90 85            [ 2] 4086     popw y 
      009922 90 BF 26         [ 2] 4087     ldw YTEMP,y 
      009925 1D 00 04         [ 2] 4088     subw x,#2*CELLL 
      009928 90 FE            [ 2] 4089     ldw y,(y)
      00992A FF               [ 2] 4090     ldw (x),y 
      00992B 90 BE 26         [ 2] 4091     ldw y,YTEMP 
      00992E 90 EE 02         [ 2] 4092     ldw y,(2,y)
      009931 EF 02            [ 2] 4093     ldw (2,x),y 
      009933 81               [ 4] 4094     ret 
                                   4095 
                                   4096 ;; Tools
                                   4097 
                                   4098 ;       _TYPE   ( b u -- )
                                   4099 ;       Display a string. Filter
                                   4100 ;       non-printing characters.
      009934 98 F3                 4101         .word      LINK
                           0018B6  4102 LINK = . 
      009936 05                    4103         .byte      5
      009937 5F 54 59 50 45        4104         .ascii     "_TYPE"
      00993C                       4105 UTYPE:
      00993C CD 85 D1         [ 4] 4106         CALL     TOR     ;start count down loop
      00993F 20 0F            [ 2] 4107         JRA     UTYP2   ;skip first pass
      009941 CD 86 08         [ 4] 4108 UTYP1:  CALL     DUPP
      009944 CD 85 81         [ 4] 4109         CALL     CAT
      009947 CD 8B E1         [ 4] 4110         CALL     TCHAR
      00994A CD 84 B6         [ 4] 4111         CALL     EMIT    ;display only printable
      00994D CD 8B 4B         [ 4] 4112         CALL     ONEP    ;increment address
      009950 CD 85 03         [ 4] 4113 UTYP2:  CALL     DONXT
      009953 99 41                 4114         .word      UTYP1   ;loop till done
      009955 CC 85 FE         [ 2] 4115         JP     DROP
                                   4116 
                                   4117 ;       dm+     ( a u -- a )
                                   4118 ;       Dump u bytes from ,
                                   4119 ;       leaving a+u on  stack.
      009958 99 36                 4120         .word      LINK
                           0018DA  4121 LINK = . 
      00995A 03                    4122         .byte      3
      00995B 64 6D 2B              4123         .ascii     "dm+"
      00995E                       4124 DUMPP:
      00995E CD 86 30         [ 4] 4125         CALL     OVER
      009961 CD 84 EF         [ 4] 4126         CALL     DOLIT
      009964 00 04                 4127         .word      4
      009966 CD 8F 85         [ 4] 4128         CALL     UDOTR   ;display address
      009969 CD 8E ED         [ 4] 4129         CALL     SPACE
      00996C CD 85 D1         [ 4] 4130         CALL     TOR     ;start count down loop
      00996F 20 11            [ 2] 4131         JRA     PDUM2   ;skip first pass
      009971 CD 86 08         [ 4] 4132 PDUM1:  CALL     DUPP
      009974 CD 85 81         [ 4] 4133         CALL     CAT
      009977 CD 84 EF         [ 4] 4134         CALL     DOLIT
      00997A 00 03                 4135         .word      3
      00997C CD 8F 85         [ 4] 4136         CALL     UDOTR   ;display numeric data
      00997F CD 8B 4B         [ 4] 4137         CALL     ONEP    ;increment address
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009982 CD 85 03         [ 4] 4138 PDUM2:  CALL     DONXT
      009985 99 71                 4139         .word      PDUM1   ;loop till done
      009987 81               [ 4] 4140         RET
                                   4141 
                                   4142 ;       DUMP    ( a u -- )
                                   4143 ;       Dump u bytes from a,
                                   4144 ;       in a formatted manner.
      009988 99 5A                 4145         .word      LINK
                           00190A  4146 LINK = . 
      00998A 04                    4147         .byte      4
      00998B 44 55 4D 50           4148         .ascii     "DUMP"
      00998F                       4149 DUMP:
      00998F CD 86 CE         [ 4] 4150         CALL     BASE
      009992 CD 85 63         [ 4] 4151         CALL     AT
      009995 CD 85 D1         [ 4] 4152         CALL     TOR
      009998 CD 8E 4C         [ 4] 4153         CALL     HEX     ;save radix, set hex
      00999B CD 84 EF         [ 4] 4154         CALL     DOLIT
      00999E 00 10                 4155         .word      16
      0099A0 CD 8A 71         [ 4] 4156         CALL     SLASH   ;change count to lines
      0099A3 CD 85 D1         [ 4] 4157         CALL     TOR     ;start count down loop
      0099A6 CD 8F 2F         [ 4] 4158 DUMP1:  CALL     CR
      0099A9 CD 84 EF         [ 4] 4159         CALL     DOLIT
      0099AC 00 10                 4160         .word      16
      0099AE CD 88 18         [ 4] 4161         CALL     DDUP
      0099B1 CD 99 5E         [ 4] 4162         CALL     DUMPP   ;display numeric
      0099B4 CD 87 CC         [ 4] 4163         CALL     ROT
      0099B7 CD 87 CC         [ 4] 4164         CALL     ROT
      0099BA CD 8E ED         [ 4] 4165         CALL     SPACE
      0099BD CD 8E ED         [ 4] 4166         CALL     SPACE
      0099C0 CD 99 3C         [ 4] 4167         CALL     UTYPE   ;display printable characters
      0099C3 CD 85 03         [ 4] 4168         CALL     DONXT
      0099C6 99 A6                 4169         .word      DUMP1   ;loop till done
      0099C8 CD 85 FE         [ 4] 4170 DUMP3:  CALL     DROP
      0099CB CD 85 B4         [ 4] 4171         CALL     RFROM
      0099CE CD 86 CE         [ 4] 4172         CALL     BASE
      0099D1 CC 85 51         [ 2] 4173         JP     STORE   ;restore radix
                                   4174 
                                   4175 ;       .S      ( ... -- ... )
                                   4176 ;        Display  contents of stack.
      0099D4 99 8A                 4177         .word      LINK
                           001956  4178 LINK = . 
      0099D6 02                    4179         .byte      2
      0099D7 2E 53                 4180         .ascii     ".S"
      0099D9                       4181 DOTS:
      0099D9 CD 8F 2F         [ 4] 4182         CALL     CR
      0099DC CD 8B F9         [ 4] 4183         CALL     DEPTH   ;stack depth
      0099DF CD 85 D1         [ 4] 4184         CALL     TOR     ;start count down loop
      0099E2 20 09            [ 2] 4185         JRA     DOTS2   ;skip first pass
      0099E4 CD 85 C5         [ 4] 4186 DOTS1:  CALL     RAT
      0099E7 CD 8C 10         [ 4] 4187 	CALL     PICK
      0099EA CD 8F D6         [ 4] 4188         CALL     DOT     ;index stack, display contents
      0099ED CD 85 03         [ 4] 4189 DOTS2:  CALL     DONXT
      0099F0 99 E4                 4190         .word      DOTS1   ;loop till done
      0099F2 CD 8F 5C         [ 4] 4191         CALL     DOTQP
      0099F5 05                    4192         .byte      5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      0099F6 20 3C 73 70 20        4193         .ascii     " <sp "
      0099FB 81               [ 4] 4194         RET
                                   4195 
                                   4196 ;       >NAME   ( ca -- na | F )
                                   4197 ;       Convert code address
                                   4198 ;       to a name address.
      0099FC 99 D6                 4199         .word      LINK
                           00197E  4200 LINK = . 
      0099FE 05                    4201         .byte      5
      0099FF 3E 4E 41 4D 45        4202         .ascii     ">NAME"
      009A04                       4203 TNAME:
      009A04 CD 87 51         [ 4] 4204         CALL     CNTXT   ;vocabulary link
      009A07 CD 85 63         [ 4] 4205 TNAM2:  CALL     AT
      009A0A CD 86 08         [ 4] 4206         CALL     DUPP    ;?last word in a vocabulary
      009A0D CD 85 18         [ 4] 4207         CALL     QBRAN
      009A10 9A 2B                 4208         .word      TNAM4
      009A12 CD 88 18         [ 4] 4209         CALL     DDUP
      009A15 CD 91 9E         [ 4] 4210         CALL     NAMET
      009A18 CD 86 8E         [ 4] 4211         CALL     XORR    ;compare
      009A1B CD 85 18         [ 4] 4212         CALL     QBRAN
      009A1E 9A 25                 4213         .word      TNAM3
      009A20 CD 8B 2F         [ 4] 4214         CALL     CELLM   ;continue with next word
      009A23 20 E2            [ 2] 4215         JRA     TNAM2
      009A25 CD 86 18         [ 4] 4216 TNAM3:  CALL     SWAPP
      009A28 CC 85 FE         [ 2] 4217         JP     DROP
      009A2B CD 88 0D         [ 4] 4218 TNAM4:  CALL     DDROP
      009A2E CC 8B B7         [ 2] 4219         JP     ZERO
                                   4220 
                                   4221 ;       .ID     ( na -- )
                                   4222 ;        Display  name at address.
      009A31 99 FE                 4223         .word      LINK
                           0019B3  4224 LINK = . 
      009A33 03                    4225         .byte      3
      009A34 2E 49 44              4226         .ascii     ".ID"
      009A37                       4227 DOTID:
      009A37 CD 87 BB         [ 4] 4228         CALL     QDUP    ;if zero no name
      009A3A CD 85 18         [ 4] 4229         CALL     QBRAN
      009A3D 9A 4D                 4230         .word      DOTI1
      009A3F CD 8C 7D         [ 4] 4231         CALL     COUNT
      009A42 CD 84 EF         [ 4] 4232         CALL     DOLIT
      009A45 00 1F                 4233         .word      0x1F
      009A47 CD 86 65         [ 4] 4234         CALL     ANDD    ;mask lexicon bits
      009A4A CC 99 3C         [ 2] 4235         JP     UTYPE
      009A4D CD 8F 5C         [ 4] 4236 DOTI1:  CALL     DOTQP
      009A50 09                    4237         .byte      9
      009A51 20 6E 6F 4E 61 6D 65  4238         .ascii     " noName"
      009A58 81               [ 4] 4239         RET
                                   4240 
                           000000  4241 WANT_SEE=0
                           000000  4242 .if WANT_SEE 
                                   4243 ;       SEE     ( -- ; <string> )
                                   4244 ;       A simple decompiler.
                                   4245 ;       Updated for byte machines.
                                   4246         .word      LINK
                                   4247 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



                                   4248         .byte      3
                                   4249         .ascii     "SEE"
                                   4250 SEE:
                                   4251         CALL     TICK    ;starting address
                                   4252         CALL     CR
                                   4253         CALL     ONEM
                                   4254 SEE1:   CALL     ONEP
                                   4255         CALL     DUPP
                                   4256         CALL     AT
                                   4257         CALL     DUPP
                                   4258         CALL     QBRAN
                                   4259         .word    SEE2
                                   4260         CALL     TNAME   ;?is it a name
                                   4261 SEE2:   CALL     QDUP    ;name address or zero
                                   4262         CALL     QBRAN
                                   4263         .word    SEE3
                                   4264         CALL     SPACE
                                   4265         CALL     DOTID   ;display name
                                   4266         CALL     ONEP
                                   4267         JRA      SEE4
                                   4268 SEE3:   CALL     DUPP
                                   4269         CALL     CAT
                                   4270         CALL     UDOT    ;display number
                                   4271 SEE4:   CALL     NUFQ    ;user control
                                   4272         CALL     QBRAN
                                   4273         .word    SEE1
                                   4274         JP     DROP
                                   4275 .endif ; WANT_SEE 
                                   4276 
                                   4277 ;       WORDS   ( -- )
                                   4278 ;       Display names in vocabulary.
      009A59 9A 33                 4279         .word      LINK
                           0019DB  4280 LINK = . 
      009A5B 05                    4281         .byte      5
      009A5C 57 4F 52 44 53        4282         .ascii     "WORDS"
      009A61                       4283 WORDS:
      009A61 CD 8F 2F         [ 4] 4284         CALL     CR
      009A64 CD 87 51         [ 4] 4285         CALL     CNTXT   ;only in context
      009A67 CD 85 63         [ 4] 4286 WORS1:  CALL     AT
      009A6A CD 87 BB         [ 4] 4287         CALL     QDUP    ;?at end of list
      009A6D CD 85 18         [ 4] 4288         CALL     QBRAN
      009A70 9A 83                 4289         .word      WORS2
      009A72 CD 86 08         [ 4] 4290         CALL     DUPP
      009A75 CD 8E ED         [ 4] 4291         CALL     SPACE
      009A78 CD 9A 37         [ 4] 4292         CALL     DOTID   ;display a name
      009A7B CD 8B 2F         [ 4] 4293         CALL     CELLM
      009A7E CD 85 34         [ 4] 4294         CALL     BRAN
      009A81 9A 67                 4295         .word      WORS1
      009A83 81               [ 4] 4296 WORS2:  RET
                                   4297 
                                   4298         
                                   4299 ;; Hardware reset
                                   4300 
                                   4301 ;       hi      ( -- )
                                   4302 ;       Display sign-on message.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009A84 9A 5B                 4303         .word      LINK
                           001A06  4304 LINK = . 
      009A86 02                    4305         .byte      2
      009A87 68 69                 4306         .ascii     "hi"
      009A89                       4307 HI:
      009A89 CD 8F 2F         [ 4] 4308         CALL     CR
      009A8C CD 8F 5C         [ 4] 4309         CALL     DOTQP   ;initialize I/O
      009A8F 0F                    4310         .byte      15
      009A90 73 74 6D 38 65 46 6F  4311         .ascii     "stm8eForth v"
             72 74 68 20 76
      009A9C 34                    4312 	.byte      VER+'0'
      009A9D 2E                    4313         .byte      '.' 
      009A9E 30                    4314 	.byte      EXT+'0' ;version
      009A9F CD 8F 5C         [ 4] 4315         CALL    DOTQP
                           000001  4316 .if NUCLEO          
      009AA2 12                    4317         .byte 18
      009AA3 20 6F 6E 20 4E 55 43  4318         .ascii  " on NUCLEO-8S208RB"
             4C 45 4F 2D 38 53 32
             30 38 52 42
                                   4319 .endif
                           000000  4320 .if DISCOVERY
                                   4321         .byte 19
                                   4322         .ascii  " on STM8S-DISCOVERY"
                                   4323 .endif
                           000000  4324 .if DOORBELL
                                   4325         .byte 16
                                   4326         .ascii " on stm8s105k6b6"
                                   4327 .endif
      009AB5 CC 8F 2F         [ 2] 4328         JP     CR
                                   4329 
                           000000  4330 WANT_DEBUG=0
                           000000  4331 .if WANT_DEBUG 
                                   4332 ;       DEBUG      ( -- )
                                   4333 ;       Display sign-on message.
                                   4334 ;        .word      LINK
                                   4335 LINK = . 
                                   4336         .byte      5
                                   4337         .ascii     "DEBUG"
                                   4338 DEBUG:
                                   4339 	CALL DOLIT
                                   4340 	.word 0x65
                                   4341 	CALL EMIT
                                   4342 	CALL DOLIT
                                   4343 	.word 0
                                   4344  	CALL ZLESS 
                                   4345 	CALL DOLIT
                                   4346 	.word 0xFFFE
                                   4347 	CALL ZLESS 
                                   4348 	CALL UPLUS 
                                   4349  	CALL DROP 
                                   4350 	CALL DOLIT
                                   4351 	.word 3
                                   4352 	CALL UPLUS 
                                   4353 	CALL UPLUS 
                                   4354  	CALL DROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



                                   4355 	CALL DOLIT
                                   4356 	.word 0x43
                                   4357 	CALL UPLUS 
                                   4358  	CALL DROP
                                   4359 	CALL EMIT
                                   4360 	CALL DOLIT
                                   4361 	.word 0x4F
                                   4362 	CALL DOLIT
                                   4363 	.word 0x6F
                                   4364  	CALL XORR
                                   4365 	CALL DOLIT
                                   4366 	.word 0xF0
                                   4367  	CALL ANDD
                                   4368 	CALL DOLIT
                                   4369 	.word 0x4F
                                   4370  	CALL ORR
                                   4371 	CALL EMIT
                                   4372 	CALL DOLIT
                                   4373 	.word 8
                                   4374 	CALL DOLIT
                                   4375 	.word 6
                                   4376  	CALL SWAPP
                                   4377 	CALL OVER
                                   4378 	CALL XORR
                                   4379 	CALL DOLIT
                                   4380 	.word 3
                                   4381 	CALL ANDD 
                                   4382 	CALL ANDD
                                   4383 	CALL DOLIT
                                   4384 	.word 0x70
                                   4385 	CALL UPLUS 
                                   4386 	CALL DROP
                                   4387 	CALL EMIT
                                   4388 	CALL DOLIT
                                   4389 	.word 0
                                   4390 	CALL QBRAN
                                   4391 	.word DEBUG1
                                   4392 	CALL DOLIT
                                   4393 	.word 0x3F
                                   4394 DEBUG1:
                                   4395 	CALL DOLIT
                                   4396 	.word 0xFFFF
                                   4397 	CALL QBRAN
                                   4398 	.word DEBUG2
                                   4399 	CALL DOLIT
                                   4400 	.word 0x74
                                   4401 	CALL BRAN
                                   4402 	.word DEBUG3
                                   4403 DEBUG2:
                                   4404 	CALL DOLIT
                                   4405 	.word 0x21
                                   4406 DEBUG3:
                                   4407 	CALL EMIT
                                   4408 	CALL DOLIT
                                   4409 	.word 0x68
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                   4410 	CALL DOLIT
                                   4411 	.word 0x80
                                   4412 	CALL STORE
                                   4413 	CALL DOLIT
                                   4414 	.word 0x80
                                   4415 	CALL AT
                                   4416 	CALL EMIT
                                   4417 	CALL DOLIT
                                   4418 	.word 0x4D
                                   4419 	CALL TOR
                                   4420 	CALL RAT
                                   4421 	CALL RFROM
                                   4422 	CALL ANDD
                                   4423 	CALL EMIT
                                   4424 	CALL DOLIT
                                   4425 	.word 0x61
                                   4426 	CALL DOLIT
                                   4427 	.word 0xA
                                   4428 	CALL TOR
                                   4429 DEBUG4:
                                   4430 	CALL DOLIT
                                   4431 	.word 1
                                   4432 	CALL UPLUS 
                                   4433 	CALL DROP
                                   4434 	CALL DONXT
                                   4435 	.word DEBUG4
                                   4436 	CALL EMIT
                                   4437 	CALL DOLIT
                                   4438 	.word 0x656D
                                   4439 	CALL DOLIT
                                   4440 	.word 0x100
                                   4441 	CALL UMSTA
                                   4442 	CALL SWAPP
                                   4443 	CALL DOLIT
                                   4444 	.word 0x100
                                   4445 	CALL UMSTA
                                   4446 	CALL SWAPP 
                                   4447 	CALL DROP
                                   4448 	CALL EMIT
                                   4449 	CALL EMIT
                                   4450 	CALL DOLIT
                                   4451 	.word 0x2043
                                   4452 	CALL DOLIT
                                   4453 	.word 0
                                   4454 	CALL DOLIT
                                   4455 	.word 0x100
                                   4456 	CALL UMMOD
                                   4457 	CALL EMIT
                                   4458 	CALL EMIT
                                   4459 	;JP ORIG
                                   4460 	RET
                                   4461 .endif ; WANT_DEBUG 
                                   4462 
                                   4463 
                                   4464 ;       'BOOT   ( -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                   4465 ;       The application startup vector.
      009AB8 9A 86                 4466         .word      LINK
                           001A3A  4467 LINK = . 
      009ABA 05                    4468         .byte      5
      009ABB 27 42 4F 4F 54        4469         .ascii     "'BOOT"
      009AC0                       4470 TBOOT:
      009AC0 CD 86 BE         [ 4] 4471         CALL     DOVAR
      009AC3 40 02                 4472         .word    APP_RUN      ;application to boot
                                   4473 
                                   4474 ;       COLD    ( -- )
                                   4475 ;       The hilevel cold start s=ence.
      009AC5 9A BA                 4476         .word      LINK
                           001A47  4477         LINK = . 
      009AC7 04                    4478         .byte      4
      009AC8 43 4F 4C 44           4479         .ascii     "COLD"
      009ACC                       4480 COLD:
                           000000  4481 .if WANT_DEBUG
                                   4482         CALL DEBUG
                                   4483 .endif ; WANT_DEBUG
      009ACC CD 84 EF         [ 4] 4484 COLD1:  CALL     DOLIT
      009ACF 80 AB                 4485         .word      UZERO
      009AD1 CD 84 EF         [ 4] 4486 	CALL     DOLIT
      009AD4 00 06                 4487         .word      UPP
      009AD6 CD 84 EF         [ 4] 4488         CALL     DOLIT
      009AD9 00 1C                 4489 	.word      UEND-UZERO
      009ADB CD 8C E1         [ 4] 4490         CALL     CMOVE   ;initialize user area
                           000001  4491 .if WANT_FLOAT 
      009ADE CD AB 95         [ 4] 4492         CALL    FINIT 
                                   4493 .endif 
                                   4494 ; if APP_RUN==0 initialize with ca de 'hi'  
      009AE1 90 CE 40 02      [ 2] 4495         ldw y,APP_RUN 
      009AE5 26 0B            [ 1] 4496         jrne 0$
      009AE7 1D 00 02         [ 2] 4497         subw x,#CELLL 
      009AEA 90 AE 9A 89      [ 2] 4498         ldw y,#HI  
      009AEE FF               [ 2] 4499         ldw (x),y
      009AEF CD 9B EA         [ 4] 4500         call UPDATRUN 
      009AF2                       4501 0$:        
                                   4502 ; update LAST with APP_LAST 
                                   4503 ; if APP_LAST > LAST else do the opposite
      009AF2 90 CE 40 00      [ 2] 4504         ldw y,APP_LAST 
      009AF6 90 B3 1C         [ 2] 4505         cpw y,ULAST 
      009AF9 22 05            [ 1] 4506         jrugt 1$ 
                                   4507 ; save LAST at APP_LAST  
      009AFB CD 9B D2         [ 4] 4508         call UPDATLAST 
      009AFE 20 06            [ 2] 4509         jra 2$
      009B00                       4510 1$: ; update LAST with APP_LAST 
      009B00 90 BF 1C         [ 2] 4511         ldw ULAST,y
      009B03 90 BF 16         [ 2] 4512         ldw UCNTXT,y
      009B06                       4513 2$:  
                                   4514 ; update APP_CP if < app_space 
      009B06 90 CE 40 04      [ 2] 4515         ldw y,APP_CP  
      009B0A 90 B3 1A         [ 2] 4516         cpw y,UCP   
      009B0D 24 06            [ 1] 4517         jruge 3$ 
      009B0F CD 9B FB         [ 4] 4518         call UPDATCP
      009B12 90 BE 1A         [ 2] 4519         ldw y,UCP   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009B15                       4520 3$:
      009B15 90 BF 1A         [ 2] 4521         ldw UCP,y                 
                                   4522 ; update UVP with APP_VP  
                                   4523 ; if APP_VP>UVP else do the opposite 
      009B18 90 CE 40 06      [ 2] 4524         ldw y,APP_VP 
      009B1C 90 B3 18         [ 2] 4525         cpw y,UVP 
      009B1F 22 05            [ 1] 4526         jrugt 4$
      009B21 CD 9C 12         [ 4] 4527         call UPDATVP 
      009B24 20 03            [ 2] 4528         jra 6$
      009B26                       4529 4$: ; update UVP with APP_VP 
      009B26 90 BF 18         [ 2] 4530         ldw UVP,y 
      009B29                       4531 6$:      
      009B29 CD 94 81         [ 4] 4532         CALL     PRESE   ;initialize data stack and TIB
      009B2C CD 9A C0         [ 4] 4533         CALL     TBOOT
      009B2F CD 8C CA         [ 4] 4534         CALL     ATEXE   ;application boot
      009B32 CD 97 5A         [ 4] 4535         CALL     OVERT
      009B35 CC 94 9E         [ 2] 4536         JP     QUIT    ;start interpretation
                                   4537 
                                   4538 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                   4539         .include "flash.asm"
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
      009B38 9A C7                   31     .word LINK 
                           001ABA    32     LINK=.
      009B3A 03                      33     .byte 3 
      009B3B 46 50 21                34     .ascii "FP!"
      009B3E                         35 FPSTOR:
      009B3E 90 93            [ 1]   36     ldw y,x
      009B40 90 FE            [ 2]   37     ldw y,(y)
      009B42 90 9F            [ 1]   38     ld a,yl 
      009B44 B7 34            [ 1]   39     ld FPTR,a 
      009B46 1C 00 02         [ 2]   40     addw x,#CELLL 
      009B49 90 93            [ 1]   41     ldw y,x 
      009B4B 90 FE            [ 2]   42     ldw y,(y)
      009B4D 90 BF 35         [ 2]   43     ldw PTR16,y
      009B50 1C 00 02         [ 2]   44     addw x,#CELLL 
      009B53 81               [ 4]   45     ret 
                                     46 
                                     47 ;-----------------------------------
                                     48 ; return EEPROM base address 
                                     49 ; as a double 
                                     50 ;  EEPROM  ( -- ud )
                                     51 ;-----------------------------------
      009B54 9B 3A                   52     .word LINK 
                           001AD6    53 LINK=.
      009B56 06                      54     .byte 6 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009B57 45 45 50 52 4F 4D       55     .ascii "EEPROM"
      009B5D                         56 EEPROM: 
      009B5D 90 AE 40 00      [ 2]   57     ldw y,#EEPROM_BASE
      009B61 1D 00 04         [ 2]   58     subw x,#2*CELLL 
      009B64 EF 02            [ 2]   59     ldw (2,x),y 
      009B66 90 5F            [ 1]   60     clrw y 
      009B68 FF               [ 2]   61     ldw (x),y 
      009B69 81               [ 4]   62     ret
                                     63 
                                     64 ;---------------------------------
                                     65 ; return APP_LAST pointer as double
                                     66 ; EEP-LAST ( -- ud )
                                     67 ;---------------------------------
      009B6A 9B 56                   68 	.word LINK 
                           001AEC    69 	LINK=.
      009B6C 08                      70 	.byte 8 
      009B6D 45 45 50 2D 4C 41 53    71 	.ascii "EEP-LAST"
             54
      009B75                         72 EEPLAST:
      009B75 1D 00 04         [ 2]   73 	subw x,#2*CELLL 
      009B78 90 AE 40 00      [ 2]   74 	ldw y,#APP_LAST 
      009B7C EF 02            [ 2]   75 	ldw (2,x),y 
      009B7E 90 5F            [ 1]   76 	clrw y 
      009B80 FF               [ 2]   77 	ldw (x),y 
      009B81 81               [ 4]   78 	ret 
                                     79 
                                     80 ;----------------------------------
                                     81 ; return APP_RUN pointer as double	
                                     82 ; EEP-RUN ( -- ud )
                                     83 ;-----------------------------------
      009B82 9B 6C                   84 	.word LINK 
                           001B04    85 	LINK=.
      009B84 07                      86 	.byte 7
      009B85 45 45 50 2D 52 55 4E    87 	.ascii "EEP-RUN"
      009B8C                         88 EEPRUN:
      009B8C 1D 00 04         [ 2]   89 	subw x,#2*CELLL 
      009B8F 90 AE 40 02      [ 2]   90 	ldw y,#APP_RUN 
      009B93 EF 02            [ 2]   91 	ldw (2,x),y 
      009B95 90 5F            [ 1]   92 	clrw y 
      009B97 FF               [ 2]   93 	ldw (x),y 
      009B98 81               [ 4]   94 	ret 
                                     95 
                                     96 ;------------------------------------
                                     97 ; return APP_CP pointer as double 
                                     98 ; EEP-CP ( -- ud )
                                     99 ;------------------------------------
      009B99 9B 84                  100 	.word LINK
                           001B1B   101 	LINK=.
      009B9B 06                     102 	.byte 6 
      009B9C 45 45 50 2D 43 50      103 	.ascii "EEP-CP"
      009BA2                        104 EEPCP:
      009BA2 1D 00 04         [ 2]  105 	subw x,#2*CELLL 
      009BA5 90 AE 40 04      [ 2]  106 	ldw y,#APP_CP  
      009BA9 EF 02            [ 2]  107 	ldw (2,x),y 
      009BAB 90 5F            [ 1]  108 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009BAD FF               [ 2]  109 	ldw (x),y 
      009BAE 81               [ 4]  110 	ret 
                                    111 
                                    112 ;------------------------------------
                                    113 ; return APP_VP pointer as double 
                                    114 ; EEP-VP ( -- ud )
                                    115 ;-------------------------------------
      009BAF 9B 9B                  116 	.word LINK
                           001B31   117 	LINK=.
      009BB1 06                     118 	.byte 6
      009BB2 45 45 50 2D 56 50      119 	.ascii "EEP-VP"
      009BB8                        120 EEPVP:
      009BB8 1D 00 04         [ 2]  121 	subw x,#2*CELLL 
      009BBB 90 AE 40 06      [ 2]  122 	ldw y,#APP_VP  
      009BBF EF 02            [ 2]  123 	ldw (2,x),y 
      009BC1 90 5F            [ 1]  124 	clrw y 
      009BC3 FF               [ 2]  125 	ldw (x),y 
      009BC4 81               [ 4]  126 	ret 
                                    127 
                                    128 ;----------------------------------
                                    129 ; update APP_LAST with LAST 
                                    130 ; UPDAT-LAST ( -- )
                                    131 ;----------------------------------
      009BC5 9B B1                  132 	.word LINK 
                           001B47   133 	LINK=.
      009BC7 0A                     134 	.byte 10
      009BC8 55 50 44 41 54 2D 4C   135 	.ascii "UPDAT-LAST"
             41 53 54
      009BD2                        136 UPDATLAST:
      009BD2 CD 87 7D         [ 4]  137 	call LAST
      009BD5 CD 85 63         [ 4]  138 	call AT  
      009BD8 CD 9B 75         [ 4]  139 	call EEPLAST
      009BDB CC 9D C8         [ 2]  140 	jp EESTORE 
                                    141 
                                    142 ;---------------------------------
                                    143 ; update APP_RUN 
                                    144 ; UPDAT-RUN ( a -- )
                                    145 ;---------------------------------
      009BDE 9B C7                  146 	.word LINK
                           001B60   147 	LINK=.
      009BE0 09                     148 	.byte 9
      009BE1 55 50 44 41 54 2D 52   149 	.ascii "UPDAT-RUN"
             55 4E
      009BEA                        150 UPDATRUN:
      009BEA CD 9B 8C         [ 4]  151 	call EEPRUN
      009BED CC 9D C8         [ 2]  152 	jp EESTORE 
                                    153 	
                                    154 ;---------------------------------
                                    155 ; update APP_CP with CP 
                                    156 ; UPDAT-CP ( -- )
                                    157 ;---------------------------------
      009BF0 9B E0                  158 	.word LINK 
                           001B72   159 	LINK=.
      009BF2 08                     160 	.byte 8 
      009BF3 55 50 44 41 54 2D 43   161 	.ascii "UPDAT-CP"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal  50-Bits]



             50
      009BFB                        162 UPDATCP:
      009BFB CD 87 6D         [ 4]  163 	call CPP 
      009BFE CD 85 63         [ 4]  164 	call AT 
      009C01 CD 9B A2         [ 4]  165 	call EEPCP 
      009C04 CC 9D C8         [ 2]  166 	jp EESTORE 
                                    167 
                                    168 ;----------------------------------
                                    169 ; update APP_VP with VP 
                                    170 ; UPDAT-VP ( -- )
                                    171 ;----------------------------------
      009C07 9B F2                  172 	.word LINK
                           001B89   173 	LINK=.
      009C09 08                     174 	.byte 8 
      009C0A 55 50 44 41 54 2D 56   175 	.ascii "UPDAT-VP" 
             50
      009C12                        176 UPDATVP:
      009C12 CD 87 5F         [ 4]  177 	call VPP 
      009C15 CD 85 63         [ 4]  178 	call AT
      009C18 CD 9B B8         [ 4]  179 	call EEPVP 
      009C1B CC 9D C8         [ 2]  180 	jp EESTORE
                                    181 	
                           000001   182 .if NUCLEO
                                    183 ;----------------------------------
                                    184 ; fetch integer at address over 65535
                                    185 ;  F@   ( ud -- n )
                                    186 ;----------------------------------
      009C1E 9C 09                  187     .word LINK 
                           001BA0   188 LINK=.
      009C20 02                     189     .byte 2
      009C21 46 40                  190     .ascii "F@"
      009C23                        191 FARAT:
      009C23 CD 9B 3E         [ 4]  192     call FPSTOR
      009C26 CC 9C EB         [ 2]  193 	jp EE_READ 
                                    194 
                                    195 
                                    196 ;-------------------------------------
                                    197 ; fetch C at address over 65535 
                                    198 ; FC@ ( ud -- c)
                                    199 ;-------------------------------------
      009C29 9C 20                  200     .word LINK
                           001BAB   201     LINK=.
      009C2B 03                     202     .byte 3 
      009C2C 46 43 40               203     .ascii "FC@" 
      009C2F                        204 FARCAT:
      009C2F CD 9B 3E         [ 4]  205     call FPSTOR
      009C32 CC 9D 0D         [ 2]  206 	jp EE_CREAD  
                                    207 .endif ; NUCLEO 
                                    208 
                                    209 ;----------------------------------
                                    210 ; UNLOCK EEPROM/OPT for writing/erasing
                                    211 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    212 ;  UNLKEE   ( -- )
                                    213 ;----------------------------------
      009C35 9C 2B                  214     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                           001BB7   215 LINK=.
      009C37 06                     216     .byte 6 
      009C38 55 4E 4C 4B 45 45      217     .ascii "UNLKEE"
      009C3E                        218 UNLKEE:
      009C3E 35 00 50 5B      [ 1]  219 	mov FLASH_CR2,#0 
      009C42 35 FF 50 5C      [ 1]  220 	mov FLASH_NCR2,#0xFF 
      009C46 35 AE 50 64      [ 1]  221 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009C4A 35 56 50 64      [ 1]  222     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009C4E 72 07 50 5F FB   [ 2]  223 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009C53 81               [ 4]  224 	ret
                                    225 
                                    226 ;----------------------------------
                                    227 ; UNLOCK FLASH for writing/erasing
                                    228 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    229 ; UNLKFL  ( -- )
                                    230 ;----------------------------------
      009C54 9C 37                  231     .word LINK 
                           001BD6   232 LINK=. 
      009C56 06                     233     .byte 6 
      009C57 55 4E 4C 4B 46 4C      234     .ascii "UNLKFL"    
      009C5D                        235 UNLKFL:
      009C5D 35 00 50 5B      [ 1]  236 	mov FLASH_CR2,#0 
      009C61 35 FF 50 5C      [ 1]  237 	mov FLASH_NCR2,#0xFF 
      009C65 35 56 50 62      [ 1]  238 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009C69 35 AE 50 62      [ 1]  239 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009C6D 72 03 50 5F FB   [ 2]  240 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009C72 81               [ 4]  241 	ret
                                    242 
                                    243 ;-----------------------------
                                    244 ; UNLOCK FLASH or EEPROM 
                                    245 ; according to FPTR address 
                                    246 ;  UNLOCK ( -- )
                                    247 ;-----------------------------
      009C73 9C 56                  248 	.word LINK 
                           001BF5   249 	LINK=.
      009C75 06                     250 	.byte 6
      009C76 55 4E 4C 4F 43 4B      251 	.ascii "UNLOCK"
      009C7C                        252 UNLOCK:
                                    253 ; put addr[15:0] in Y, for bounds check.
      009C7C 90 BE 35         [ 2]  254 	ldw y,PTR16   ; Y=addr15:0
                                    255 ; check addr[23:16], if <> 0 then it is extened flash memory
      009C7F 3D 34            [ 1]  256 	tnz FPTR 
      009C81 26 16            [ 1]  257 	jrne 4$
      009C83 90 A3 80 00      [ 2]  258     cpw y,#FLASH_BASE
      009C87 24 10            [ 1]  259     jruge 4$
      009C89 90 A3 40 00      [ 2]  260 	cpw y,#EEPROM_BASE  
      009C8D 25 0D            [ 1]  261     jrult 9$
      009C8F 90 A3 48 7F      [ 2]  262 	cpw y,#OPTION_END 
      009C93 22 07            [ 1]  263 	jrugt 9$
      009C95 CD 9C 3E         [ 4]  264 	call UNLKEE
      009C98 81               [ 4]  265 	ret 
      009C99 CD 9C 5D         [ 4]  266 4$: call UNLKFL
      009C9C 81               [ 4]  267 9$: ret 
                                    268 
                                    269 ;-------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                    270 ; LOCK write access to 
                                    271 ; FLASH and EEPROM 
                                    272 ; LOCK ( -- )
                                    273 ;-------------------------
      009C9D 9C 75                  274 	.word LINK 
                           001C1F   275 	LINK=.
      009C9F 04                     276 	.byte 4 
      009CA0 4C 4F 43 4B            277 	.ascii "LOCK" 
      009CA4                        278 LOCK: 
      009CA4 72 13 50 5F      [ 1]  279 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009CA8 72 17 50 5F      [ 1]  280 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009CAC 81               [ 4]  281 	ret 
                                    282 
                                    283 ;-------------------------
                                    284 ; increment FPTR 
                                    285 ; INC-FPTR ( -- )
                                    286 ;-------------------------
      009CAD 9C 9F                  287 	.word LINK 
                           001C2F   288 	LINK=. 
      009CAF 08                     289 	.byte 8 
      009CB0 49 4E 43 2D 46 50 54   290 	.ascii "INC-FPTR" 
             52
      009CB8                        291 INC_FPTR:
      009CB8 3C 36            [ 1]  292 	inc PTR8 
      009CBA 26 0C            [ 1]  293 	jrne 1$
      009CBC 90 89            [ 2]  294 	pushw y 
      009CBE 90 BE 34         [ 2]  295 	ldw y,FPTR 
      009CC1 90 5C            [ 1]  296 	incw y 
      009CC3 90 BF 34         [ 2]  297 	ldw FPTR,y
      009CC6 90 85            [ 2]  298 	popw y  
      009CC8 81               [ 4]  299 1$: ret 
                                    300 
                                    301 ;------------------------------
                                    302 ; add u to FPTR 
                                    303 ; PTR+ ( u -- )
                                    304 ;------------------------------
      009CC9 9C AF                  305 	.word LINK 
                           001C4B   306 	LINK=.
      009CCB 04                     307 	.byte 4 
      009CCC 50 54 52 2B            308 	.ascii "PTR+"
      009CD0                        309 PTRPLUS:
      009CD0 90 93            [ 1]  310 	ldw y,x 
      009CD2 1C 00 02         [ 2]  311 	addw x,#CELLL 
      009CD5 72 B9 00 35      [ 2]  312 	addw y,PTR16 
      009CD9 90 BF 35         [ 2]  313 	ldw PTR16,y  
      009CDC 24 02            [ 1]  314 	jrnc 1$
      009CDE 3C 34            [ 1]  315 	inc FPTR 
      009CE0 81               [ 4]  316 1$: ret 
                                    317 
                                    318 ;---------------------------------
                                    319 ; read word at address pointed FPTR
                                    320 ; increment FPTR 
                                    321 ; EE-READ ( -- w )
                                    322 ;------------------------------------
      009CE1 9C CB                  323 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                           001C63   324 	LINK=.
      009CE3 07                     325 	.byte 7 
      009CE4 45 45 2D 52 45 41 44   326 	.ascii "EE-READ"
      009CEB                        327 EE_READ:
      009CEB 1D 00 02         [ 2]  328 	subw x,#CELLL 
      009CEE 92 BC 00 34      [ 5]  329 	ldf a,[FPTR]
      009CF2 90 95            [ 1]  330 	ld yh,a 
      009CF4 CD 9C B8         [ 4]  331 	call INC_FPTR 
      009CF7 92 BC 00 34      [ 5]  332 	ldf a,[FPTR]
      009CFB CD 9C B8         [ 4]  333 	call INC_FPTR 
      009CFE 90 97            [ 1]  334 	ld yl,a 
      009D00 FF               [ 2]  335 	ldw (x),y 
      009D01 81               [ 4]  336 	ret 
                                    337 
                                    338 ;---------------------------------------
                                    339 ; Read byte at address pointed by FPTR 
                                    340 ; EE-CREAD ( -- c )
                                    341 ;---------------------------------------
      009D02 9C E3                  342 	.word LINK 
                           001C84   343 	LINK=.
      009D04 08                     344 	.byte 8
      009D05 45 45 2D 43 52 45 41   345 	.ascii "EE-CREAD" 
             44
      009D0D                        346 EE_CREAD:
      009D0D 1D 00 02         [ 2]  347 	subw x,#CELLL 
      009D10 92 BC 00 34      [ 5]  348 	ldf a,[FPTR]	
      009D14 CD 9C B8         [ 4]  349 	call INC_FPTR
      009D17 90 5F            [ 1]  350 	clrw y 
      009D19 90 97            [ 1]  351 	ld yl,a 
      009D1B FF               [ 2]  352 	ldw (x),y 
      009D1C 81               [ 4]  353 	ret 
                                    354 
                                    355 ;----------------------------
                                    356 ; write a byte at address pointed 
                                    357 ; by FPTR and increment FPTR.
                                    358 ; Expect pointer already initialized 
                                    359 ; and memory unlocked 
                                    360 ; WR-BYTE ( c -- )
                                    361 ;----------------------------
      009D1D 9D 04                  362 	.word LINK 
                           001C9F   363 	LINK=. 
      009D1F 07                     364 	.byte 7 
      009D20 57 52 2D 42 59 54 45   365 	.ascii "WR-BYTE" 
                                    366 
      009D27                        367 WR_BYTE:
      009D27 CD 84 E3         [ 4]  368 	call FC_XOFF
      009D2A 90 93            [ 1]  369 	ldw y,x 
      009D2C 90 FE            [ 2]  370 	ldw y,(y)
      009D2E 1C 00 02         [ 2]  371 	addw x,#CELLL 
      009D31 90 9F            [ 1]  372 	ld a,yl
      009D33 92 BD 00 34      [ 4]  373 	ldf [FPTR],a
      009D37 72 05 50 5F FB   [ 2]  374 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009D3C CD 84 CD         [ 4]  375 	call FC_XON
      009D3F CC 9C B8         [ 2]  376 	jp INC_FPTR 
                                    377 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



                                    378 ;---------------------------------------
                                    379 ; write a word at address pointed 
                                    380 ; by FPTR and increment FPTR 
                                    381 ; Expect pointer already initialzed 
                                    382 ; and memory unlocked 
                                    383 ; WR-WORD ( w -- )
                                    384 ;---------------------------------------
      009D42 9D 1F                  385 	.word LINK 
                           001CC4   386 	LINK=.
      009D44 07                     387 	.byte 7 
      009D45 57 52 2D 57 4F 52 44   388 	.ascii "WR-WORD" 
      009D4C                        389 WR_WORD:
      009D4C CD 84 E3         [ 4]  390 	call FC_XOFF
      009D4F 90 93            [ 1]  391 	ldw y,x
      009D51 90 FE            [ 2]  392 	ldw y,(y)
      009D53 1C 00 02         [ 2]  393 	addw x,#CELLL 
      009D56 90 9E            [ 1]  394 	ld a,yh 
      009D58 92 BD 00 34      [ 4]  395 	ldf [FPTR],a
      009D5C 72 05 50 5F FB   [ 2]  396 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009D61 CD 9C B8         [ 4]  397 	call INC_FPTR 
      009D64 90 9F            [ 1]  398 	ld a,yl 
      009D66 92 BD 00 34      [ 4]  399 	ldf [FPTR],a
      009D6A 72 05 50 5F FB   [ 2]  400 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009D6F CD 84 CD         [ 4]  401 	call FC_XON
      009D72 CC 9C B8         [ 2]  402 	jp INC_FPTR 
                                    403 
                                    404 
                                    405 ;---------------------------------------
                                    406 ; write a byte to FLASH or EEPROM/OPTION  
                                    407 ; EEC!  (c ud -- )
                                    408 ;---------------------------------------
      009D75 9D 44                  409     .word LINK 
                           001CF7   410 	LINK=.
      009D77 04                     411     .byte 4 
      009D78 45 45 43 21            412     .ascii "EEC!"
                                    413 	; local variables 
                           000001   414 	BTW = 1   ; byte to write offset on stack
                           000002   415     OPT = 2 
                           000002   416 	VSIZE = 2
      009D7C                        417 EECSTORE:
      009D7C 52 02            [ 2]  418 	sub sp,#VSIZE
      009D7E CD 9B 3E         [ 4]  419     call FPSTOR
      009D81 E6 01            [ 1]  420 	ld a,(1,x)
      009D83 43               [ 1]  421 	cpl a 
      009D84 6B 01            [ 1]  422 	ld (BTW,sp),a ; byte to write 
      009D86 0F 02            [ 1]  423 	clr (OPT,sp)  ; OPTION flag
      009D88 CD 9C 7C         [ 4]  424 	call UNLOCK 
                                    425 	; check if option
      009D8B 3D 34            [ 1]  426 	tnz FPTR 
      009D8D 26 19            [ 1]  427 	jrne 2$
      009D8F 90 BE 35         [ 2]  428 	ldw y,PTR16 
      009D92 90 A3 48 00      [ 2]  429 	cpw y,#OPTION_BASE
      009D96 2B 10            [ 1]  430 	jrmi 2$
      009D98 90 A3 48 80      [ 2]  431 	cpw y,#OPTION_END+1
      009D9C 2A 0A            [ 1]  432 	jrpl 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      009D9E 03 02            [ 1]  433 	cpl (OPT,sp)
                                    434 	; OPTION WRITE require this UNLOCK 
      009DA0 72 1E 50 5B      [ 1]  435     bset FLASH_CR2,#FLASH_CR2_OPT
      009DA4 72 1F 50 5C      [ 1]  436     bres FLASH_NCR2,#FLASH_CR2_OPT 
      009DA8                        437 2$: 
      009DA8 CD 9D 27         [ 4]  438 	call WR_BYTE 	
      009DAB 0D 02            [ 1]  439 	tnz (OPT,sp)
      009DAD 27 0D            [ 1]  440 	jreq 3$ 
      009DAF 7B 01            [ 1]  441     ld a,(BTW,sp)
      009DB1 90 5F            [ 1]  442     clrw y
      009DB3 90 97            [ 1]  443 	ld yl,a 
      009DB5 1D 00 02         [ 2]  444 	subw x,#CELLL 
      009DB8 FF               [ 2]  445 	ldw (x),y 
      009DB9 CD 9D 27         [ 4]  446 	call WR_BYTE
      009DBC                        447 3$: 
      009DBC CD 9C A4         [ 4]  448 	call LOCK 
      009DBF 5B 02            [ 2]  449 	addw sp,#VSIZE 
      009DC1 81               [ 4]  450     ret
                                    451 
                                    452 ;------------------------------
                                    453 ; write integer in FLASH|EEPROM
                                    454 ; EE! ( n ud -- )
                                    455 ;------------------------------
      009DC2 9D 77                  456 	.word LINK 
                           001D44   457 	LINK=.
      009DC4 03                     458 	.byte 3 
      009DC5 45 45 21               459 	.ascii "EE!"
      009DC8                        460 EESTORE:
      009DC8 CD 9B 3E         [ 4]  461 	call FPSTOR 
      009DCB CD 9C 7C         [ 4]  462 	call UNLOCK 
      009DCE 90 93            [ 1]  463 	ldw y,x 
      009DD0 90 FE            [ 2]  464 	ldw y,(y)
      009DD2 90 89            [ 2]  465 	pushw y 
      009DD4 90 5E            [ 1]  466 	swapw y 
      009DD6 FF               [ 2]  467 	ldw (x),y 
      009DD7 CD 9D 27         [ 4]  468 	call WR_BYTE 
      009DDA 90 85            [ 2]  469 	popw y 
      009DDC 1D 00 02         [ 2]  470 	subw x,#CELLL
      009DDF FF               [ 2]  471 	ldw (x),y 
      009DE0 CD 9D 27         [ 4]  472 	call WR_BYTE
      009DE3 CC 9C A4         [ 2]  473 	jp LOCK 
                                    474 
                                    475 
                                    476 ;----------------------------
                                    477 ; Erase flash memory row 
                                    478 ; stm8s208 as 128 bytes rows
                                    479 ; ROW-ERASE ( ud -- )
                                    480 ;----------------------------
      009DE6 9D C4                  481 	.word LINK 
                           001D68   482 	LINK=. 
      009DE8 09                     483 	.byte 9 
      009DE9 52 4F 57 2D 45 52 41   484 	.ascii "ROW-ERASE" 
             53 45
      009DF2                        485 row_erase:
      009DF2 CD 84 E3         [ 4]  486 	call FC_XOFF
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009DF5 CD 9B 3E         [ 4]  487 	call FPSTOR
                                    488 ;code must be execute from RAM 
                                    489 ;copy routine to PAD 
      009DF8 1D 00 02         [ 2]  490 	subw x,#CELLL 
      009DFB 90 AE 9E 4B      [ 2]  491 	ldw y,#row_erase_proc
      009DFF FF               [ 2]  492 	ldw (x),y 
      009E00 CD 8C A5         [ 4]  493 	call PAD 
      009E03 90 AE 9E 72      [ 2]  494 	ldw y,#row_erase_proc_end 
      009E07 72 A2 9E 4B      [ 2]  495 	subw y,#row_erase_proc
      009E0B 1D 00 02         [ 2]  496 	subw x,#CELLL 
      009E0E FF               [ 2]  497 	ldw (x),y 
      009E0F CD 8C E1         [ 4]  498 	call CMOVE 
      009E12                        499 block_erase:
      009E12 90 BE 35         [ 2]  500 	ldw y,FPTR+1
      009E15 90 A3 B3 00      [ 2]  501 	cpw y,#app_space 
      009E19 2A 19            [ 1]  502 	jrpl erase_flash 
                                    503 ; erase EEPROM block
      009E1B 90 A3 40 00      [ 2]  504 	cpw y,#EEPROM_BASE 
      009E1F 24 04            [ 1]  505 	jruge 1$
      009E21 CD 84 CD         [ 4]  506 	call FC_XON
      009E24 81               [ 4]  507 	ret ; bad address 
      009E25 90 A3 47 FF      [ 2]  508 1$: cpw y,#EEPROM_END 
      009E29 23 04            [ 2]  509 	jrule 2$ 
      009E2B CD 84 CD         [ 4]  510 	call FC_XON
      009E2E 81               [ 4]  511 	ret ; bad address 
      009E2F                        512 2$:	
      009E2F CD 9C 3E         [ 4]  513 	call UNLKEE 
      009E32 20 03            [ 2]  514 	jra proceed_erase
                                    515 ; erase flash block:
      009E34                        516 erase_flash:
      009E34 CD 9C 5D         [ 4]  517 	call UNLKFL 
      009E37                        518 proceed_erase:
      009E37 CD 8C A5         [ 4]  519 	call PAD 
      009E3A 90 93            [ 1]  520 	ldw y,x
      009E3C 90 FE            [ 2]  521 	ldw y,(y)
      009E3E 1C 00 02         [ 2]  522 	addw x,#CELLL  
      009E41 90 FD            [ 4]  523 	call (y) 
      009E43 72 17 50 5F      [ 1]  524 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009E47 CD 84 CD         [ 4]  525 	call FC_XON
      009E4A 81               [ 4]  526 	ret 
                                    527 
                                    528 ; this routine is to be copied to PAD 
      009E4B                        529 row_erase_proc:
      009E4B 35 20 50 5B      [ 1]  530 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009E4F 35 DF 50 5C      [ 1]  531 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009E53 4F               [ 1]  532 	clr a 
      009E54 90 5F            [ 1]  533 	clrw y 
      009E56 91 A7 00 34      [ 1]  534 	ldf ([FPTR],y),a
      009E5A 90 5C            [ 1]  535     incw y
      009E5C 91 A7 00 34      [ 1]  536 	ldf ([FPTR],y),a
      009E60 90 5C            [ 1]  537     incw y
      009E62 91 A7 00 34      [ 1]  538 	ldf ([FPTR],y),a
      009E66 90 5C            [ 1]  539     incw y
      009E68 91 A7 00 34      [ 1]  540 	ldf ([FPTR],y),a
      009E6C 72 05 50 5F FB   [ 2]  541 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009E71 81               [ 4]  542 	ret
      009E72                        543 row_erase_proc_end:
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
      009E72                        556 copy_buffer:
      009E72 4B 80            [ 1]  557 	push #BLOCK_SIZE  
                                    558 ;enable block programming 
      009E74 72 10 50 5B      [ 1]  559 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009E78 72 11 50 5C      [ 1]  560 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009E7C 90 5F            [ 1]  561 	clrw y
      009E7E F6               [ 1]  562 1$:	ld a,(x)
      009E7F 91 A7 00 34      [ 1]  563 	ldf ([FPTR],y),a
      009E83 5C               [ 1]  564 	incw x 
      009E84 90 5C            [ 1]  565 	incw y 
      009E86 0A 01            [ 1]  566 	dec (BCNT,sp)
      009E88 26 F4            [ 1]  567 	jrne 1$
                                    568 ; wait EOP bit 
      009E8A 72 05 50 5F FB   [ 2]  569 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009E8F 84               [ 1]  570 	pop a ; remove BCNT from stack 
      009E90 81               [ 4]  571 	ret 
      009E91                        572 copy_buffer_end:
                                    573 
                                    574 ;-------------------------
                                    575 ; move program_row to RAM 
                                    576 ; in TIB 
                                    577 ;------------------------
      009E91                        578 copy_prog_to_ram:
      009E91 1D 00 06         [ 2]  579 	subw x,#6
      009E94 90 AE 9E 72      [ 2]  580 	ldw y,#copy_buffer 
      009E98 EF 04            [ 2]  581 	ldw (4,x),y 
      009E9A 90 AE 17 00      [ 2]  582 	ldw y,#TIBBASE
      009E9E EF 02            [ 2]  583 	ldw (2,x),y 
      009EA0 90 AE 9E 91      [ 2]  584 	ldw y,#copy_buffer_end 
      009EA4 72 A2 9E 72      [ 2]  585 	subw y,#copy_buffer  
      009EA8 FF               [ 2]  586 	ldw (x),y 
      009EA9 CD 8C E1         [ 4]  587 	call CMOVE 
      009EAC 81               [ 4]  588 	ret 
                                    589 
                                    590 
                                    591 ;-----------------------------
                                    592 ; write a row in FLASH/EEPROM 
                                    593 ; WR-ROW ( a ud -- )
                                    594 ; a -> address 128 byte buffer to write 
                                    595 ; ud ->  row address in FLASH|EEPROM 
                                    596 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009EAD 9D E8                  597 	.word LINK 
                           001E2F   598 	LINK=.
      009EAF 06                     599 	.byte 6 
      009EB0 57 52 2D 52 4F 57      600 	.ascii "WR-ROW"
      009EB6                        601 write_row:
      009EB6 CD 84 E3         [ 4]  602 	call FC_XOFF
      009EB9 CD 9B 3E         [ 4]  603 	call FPSTOR
                                    604 ; align to FLASH block 
      009EBC A6 80            [ 1]  605 	ld a,#0x80 
      009EBE B4 36            [ 1]  606 	and a,PTR8 
      009EC0 B7 36            [ 1]  607 	ld PTR8,a  
      009EC2 CD 9E 91         [ 4]  608 	call copy_prog_to_ram
      009EC5 CD 9C 7C         [ 4]  609 	call UNLOCK
      009EC8 90 93            [ 1]  610 	ldw y,x 
      009ECA 90 FE            [ 2]  611 	ldw y,(y)
      009ECC 1C 00 02         [ 2]  612 	addw x,#CELLL 
      009ECF 89               [ 2]  613 	pushw x 
      009ED0 93               [ 1]  614 	ldw x,y ; buffer address in x 
      009ED1 CD 17 00         [ 4]  615 	call TIBBASE
      009ED4 CD 9C A4         [ 4]  616 	call LOCK
      009ED7 85               [ 2]  617 	popw x 
      009ED8 CD 84 CD         [ 4]  618 	call FC_XON 
      009EDB 81               [ 4]  619 	ret 
                                    620 
                                    621 ;-------------------------------------
                                    622 ; change value of OPTION register 
                                    623 ; SET-OPT (c n -- ) 
                                    624 ; c new value.
                                    625 ; n OPT  number {1..7}
                                    626 ;--------------------------------------
      009EDC 9E AF                  627 		.word LINK 
                           001E5E   628 		LINK=.
      009EDE 07                     629 		.byte 7 
      009EDF 53 45 54 2D 4F 50 54   630 		.ascii "SET-OPT" 
      009EE6                        631 set_option: 
      009EE6 90 93            [ 1]  632 		ldw y,x 
      009EE8 90 FE            [ 2]  633 		ldw y,(y)
      009EEA 27 06            [ 1]  634 		jreq 1$
      009EEC 90 A3 00 07      [ 2]  635 		cpw y,#7 
      009EF0 23 04            [ 2]  636 		jrule 2$ 
                                    637 ; invalid OPTION number 		
      009EF2 1C 00 04         [ 2]  638 1$:		addw x,#2*CELLL
      009EF5 81               [ 4]  639 		ret
      009EF6 90 58            [ 2]  640 2$:		sllw y 
      009EF8 72 A9 47 FF      [ 2]  641 		addw y,#OPTION_BASE-1
      009EFC FF               [ 2]  642 		ldw (x),y 
      009EFD 1D 00 02         [ 2]  643 		subw x,#CELLL 
      009F00 90 5F            [ 1]  644 		clrw y 
      009F02 FF               [ 2]  645 		ldw (x),y 
      009F03 CD 9D 7C         [ 4]  646 		call EECSTORE
      009F06 81               [ 4]  647 		ret 
                                    648 
                                    649 
                                    650 
                                    651 ;--------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



                                    652 ; reset system to its original state 
                                    653 ; before any user modification
                                    654 ; PRISTINE ( -- )
                                    655 ;-------------------------------------
      009F07 9E DE                  656 	.word LINK  
                           001E89   657 	LINK=.
      009F09 08                     658 	.byte 8 
      009F0A 50 52 49 53 54 49 4E   659 	.ascii "PRISTINE"
             45
      009F12                        660 pristine:
                                    661 ;;; erase EEPROM
      009F12 CD 9B 5D         [ 4]  662 	call EEPROM 
      009F15 CD 88 18         [ 4]  663 1$:	call DDUP 
      009F18 CD 9D F2         [ 4]  664 	call row_erase
      009F1B 90 93            [ 1]  665 	ldw y,x 
      009F1D 90 EE 02         [ 2]  666 	ldw y,(2,y)
      009F20 72 A9 00 80      [ 2]  667 	addw y,#BLOCK_SIZE
      009F24 EF 02            [ 2]  668 	ldw (2,x),y
      009F26 90 A3 48 00      [ 2]  669 	cpw y,#OPTION_BASE 
      009F2A 25 E9            [ 1]  670 	jrult 1$
                                    671 ;;; reset OPTION to default values
      009F2C 90 AE 00 01      [ 2]  672 	ldw y,#1 ; OPT1 
      009F30 FF               [ 2]  673 2$:	ldw (x),y   
      009F31 90 5F            [ 1]  674 	clrw y 
      009F33 EF 02            [ 2]  675 	ldw (2,x),y  ; ( 0 1 -- ) 
      009F35 CD 88 18         [ 4]  676 	call DDUP    ; ( 0 1 0 1 -- )  
      009F38 CD 9E E6         [ 4]  677 	call set_option
      009F3B 90 93            [ 1]  678 	ldw y,x 
      009F3D 90 FE            [ 2]  679 	ldw y,(y)
      009F3F 90 5C            [ 1]  680 	incw y  ; next OPTION 
      009F41 90 A3 00 08      [ 2]  681 	cpw y,#8 
      009F45 25 E9            [ 1]  682 	jrult 2$
                                    683 ;;; erase first row of app_space 	
      009F47 90 AE B3 00      [ 2]  684 	ldw y,#app_space
      009F4B EF 02            [ 2]  685 	ldw (2,x),y  
      009F4D 90 5F            [ 1]  686 	clrw y 
      009F4F FF               [ 2]  687 	ldw (x),y ; ( app_space 0 -- )
      009F50 CD 9D F2         [ 4]  688 	call row_erase 
                                    689 ; reset interrupt vectors 
      009F53 1D 00 02         [ 2]  690 	subw x,#CELLL 
      009F56 90 5F            [ 1]  691 	clrw y  
      009F58 FF               [ 2]  692 4$:	ldw (x),y  ; ( n -- ) int# 
      009F59 CD 86 08         [ 4]  693 	call DUPP  
      009F5C CD 9F 79         [ 4]  694 	call reset_vector
      009F5F 90 93            [ 1]  695 	ldw y,x 
      009F61 90 FE            [ 2]  696 	ldw y,(y)
      009F63 90 5C            [ 1]  697 	incw y   ; next vector 
      009F65 90 A3 00 19      [ 2]  698 	cpw y,#25 
      009F69 25 ED            [ 1]  699 	jrult 4$
      009F6B CC 80 80         [ 2]  700 	jp NonHandledInterrupt ; reset MCU
                                    701 
                                    702 ;------------------------------
                                    703 ; reset an interrupt vector 
                                    704 ; to its initial value 
                                    705 ; i.e. NonHandledInterrupt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                                    706 ; RST-IVEC ( n -- )
                                    707 ;-----------------------------
      009F6E 9F 09                  708 	.word LINK 
                           001EF0   709 	LINK=. 
      009F70 08                     710 	.byte 8 
      009F71 52 53 54 2D 49 56 45   711 	.ascii "RST-IVEC"
             43
      009F79                        712 reset_vector:
      009F79 90 93            [ 1]  713 	ldw y,x
      009F7B 1C 00 02         [ 2]  714 	addw x,#CELLL 
      009F7E 90 FE            [ 2]  715 	ldw y,(y)
      009F80 90 A3 00 17      [ 2]  716 	cpw y,#23 
      009F84 27 3A            [ 1]  717 	jreq 9$
      009F86 90 A3 00 1D      [ 2]  718 	cpw y,#29 ; last vector
      009F8A 22 34            [ 1]  719 	jrugt 9$  
      009F8C 90 58            [ 2]  720 	sllw y 
      009F8E 90 58            [ 2]  721 	sllw y 
      009F90 72 A9 80 08      [ 2]  722 	addw y,#0x8008 ; irq0 address 
      009F94 90 BF 26         [ 2]  723 	ldw YTEMP,y
      009F97 1D 00 06         [ 2]  724 	subw x,#3*CELLL 
      009F9A EF 02            [ 2]  725 	ldw (2,x),y 
      009F9C 90 5F            [ 1]  726 	clrw y
      009F9E FF               [ 2]  727 	ldw (x),y 
      009F9F A6 82            [ 1]  728 	ld a,#0x82 
      009FA1 90 95            [ 1]  729 	ld yh,a
      009FA3 EF 04            [ 2]  730 	ldw (4,x),y
      009FA5 CD 9D C8         [ 4]  731 	call EESTORE
      009FA8 1D 00 06         [ 2]  732 	subw x,#3*CELLL
      009FAB 90 5F            [ 1]  733 	clrw y 
      009FAD FF               [ 2]  734 	ldw (x),y 
      009FAE 90 AE 80 80      [ 2]  735 	ldw y,#NonHandledInterrupt
      009FB2 EF 04            [ 2]  736 	ldw (4,x),y 
      009FB4 90 BE 26         [ 2]  737 	ldw y,YTEMP  
      009FB7 72 A9 00 02      [ 2]  738 	addw y,#2
      009FBB EF 02            [ 2]  739 	ldw (2,x),y 
      009FBD CD 9D C8         [ 4]  740 	call EESTORE
      009FC0 81               [ 4]  741 9$:	ret 
                                    742 
                                    743 
                                    744 ;------------------------------
                                    745 ; all interrupt vector with 
                                    746 ; an address >= a are resetted 
                                    747 ; to default
                                    748 ; CHKIVEC ( a -- )
                                    749 ;------------------------------
      009FC1 9F 70                  750 	.word LINK 
                           001F43   751 	LINK=.
      009FC3 07                     752 	.byte 7
      009FC4 43 48 4B 49 56 45 43   753 	.ascii "CHKIVEC"
                                    754 ;local variables 
                           000001   755 	SSP=1
                           000003   756 	CADR=3
                           000005   757 	OFS=5
                           000006   758 	VSIZE=6  
      009FCB                        759 CHKIVEC:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      009FCB 52 06            [ 2]  760 	sub sp,#VSIZE ;alloc local variables 
      009FCD 90 93            [ 1]  761 	ldw y,x 
      009FCF 90 FE            [ 2]  762 	ldw y,(y)
      009FD1 17 03            [ 2]  763 	ldw (CADR,sp),y ; ca 
      009FD3 1F 01            [ 2]  764 	ldw (SSP,sp),x 
      009FD5 AE 80 0A         [ 2]  765 	ldw x,#0x800a ; irq0 address 
      009FD8 BF 35            [ 2]  766 	ldw PTR16,X
      009FDA AE FF FC         [ 2]  767 	ldw x,#-4 
      009FDD 1C 00 04         [ 2]  768 1$:	addw x,#4
      009FE0 A3 00 78         [ 2]  769 	cpw x,#30*4 ; irq0-29 
      009FE3 27 22            [ 1]  770 	jreq 9$
      009FE5 90 93            [ 1]  771 	ldw y,x  
      009FE7 91 D6 35         [ 4]  772 	ld a,([PTR16],y)
      009FEA 11 03            [ 1]  773 	cp a,(CADR,sp)
      009FEC 25 EF            [ 1]  774 	jrult 1$
      009FEE 90 5C            [ 1]  775 	incw y 
      009FF0 91 D6 35         [ 4]  776 	ld a,([PTR16],y)
      009FF3 11 04            [ 1]  777 	cp a,(CADR+1,sp) 
      009FF5 25 E6            [ 1]  778 	jrult 1$ 
      009FF7 1F 05            [ 2]  779 	ldw (OFS,sp),x 
      009FF9 54               [ 2]  780 	srlw x
      009FFA 54               [ 2]  781 	srlw x 
      009FFB 90 93            [ 1]  782 	ldw y,x 
      009FFD 1E 01            [ 2]  783 	ldw x,(SSP,sp)
      009FFF FF               [ 2]  784 	ldw (x),y
      00A000 CD 9F 79         [ 4]  785 	call reset_vector
      00A003 1E 05            [ 2]  786 	ldw x,(OFS,sp) 
      00A005 20 D6            [ 2]  787 	jra 1$
      00A007 1E 01            [ 2]  788 9$:	ldw x,(SSP,sp) 
      00A009 1C 00 02         [ 2]  789 	addw x,#CELLL 
      00A00C 5B 06            [ 2]  790 	addw sp,#VSIZE ; drop local variables  
      00A00E 81               [ 4]  791 	ret 
                                    792 
                                    793 ;------------------------------
                                    794 ; set interrupt vector 
                                    795 ; SET-IVEC ( ud n -- )
                                    796 ;  ud Handler address
                                    797 ;  n  vector # 0 .. 29 
                                    798 ;-----------------------------
      00A00F 9F C3                  799 	.word LINK
                           001F91   800 	LINK=.
      00A011 08                     801 	.byte 8 
      00A012 53 45 54 2D 49 56 45   802 	.ascii "SET-IVEC" 
             43
      00A01A                        803 set_vector:
      00A01A 90 93            [ 1]  804     ldw y,x 
      00A01C 1C 00 02         [ 2]  805 	addw x,#CELLL 
      00A01F 90 FE            [ 2]  806 	ldw y,(y) ; vector #
      00A021 90 A3 00 1D      [ 2]  807 	cpw y,#29 ; last vector
      00A025 23 04            [ 2]  808 	jrule 2$
      00A027 1C 00 04         [ 2]  809 	addw x,#2*CELLL 
      00A02A 81               [ 4]  810 	ret
      00A02B 90 58            [ 2]  811 2$:	sllw y 
      00A02D 90 58            [ 2]  812 	sllw y 
      00A02F 72 A9 80 08      [ 2]  813 	addw y,#0X8008 ; IRQ0 vector address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      00A033 90 BF 26         [ 2]  814 	ldw YTEMP,y ; vector address 
      00A036 A6 82            [ 1]  815 	ld a,#0x82 
      00A038 90 95            [ 1]  816 	ld yh,a 
      00A03A E6 01            [ 1]  817 	ld a,(1,x) ; isr address bits 23..16 
      00A03C 90 97            [ 1]  818 	ld yl,a 
                                    819 ;  write 0x82 + most significant byte of int address	
      00A03E 1D 00 06         [ 2]  820 	subw x,#3*CELLL 
      00A041 EF 04            [ 2]  821 	ldw (4,x),y 
      00A043 90 BE 26         [ 2]  822 	ldw y,YTEMP
      00A046 EF 02            [ 2]  823 	ldw (2,x),y ; vector address 
      00A048 90 5F            [ 1]  824 	clrw y 
      00A04A FF               [ 2]  825 	ldw (x),y   ; as a double 
      00A04B CD 9D C8         [ 4]  826 	call EESTORE 
      00A04E 90 93            [ 1]  827 	ldw y,x 
      00A050 90 EE 02         [ 2]  828 	ldw y,(2,y) ; bits 15..0 int vector 
      00A053 1D 00 06         [ 2]  829 	subw x,#3*CELLL 
      00A056 EF 04            [ 2]  830 	ldw (4,x),y 
      00A058 90 BE 26         [ 2]  831 	ldw y,YTEMP 
      00A05B 72 A9 00 02      [ 2]  832 	addw y,#2 
      00A05F EF 02            [ 2]  833 	ldw (2,x),y 
      00A061 90 5F            [ 1]  834 	clrw y 
      00A063 FF               [ 2]  835 	ldw (x),y 
      00A064 CD 9D C8         [ 4]  836 	call EESTORE
      00A067 1C 00 04         [ 2]  837 	addw x,#2*CELLL  
      00A06A 81               [ 4]  838 9$: ret 
                                    839 
                                    840 
                                    841 ;------------------------
                                    842 ; Compile word to flash
                                    843 ; EE, (w -- )
                                    844 ;-----------------------
      00A06B A0 11                  845 	.word LINK
                           001FED   846 	LINK=.
      00A06D 03                     847 	.byte 3
      00A06E 45 45 2C               848 	.ascii "EE,"
      00A071                        849 EE_COMMA:
      00A071 1D 00 04         [ 2]  850 	subw x,#2*CELLL 
      00A074 90 BE 1A         [ 2]  851 	ldw y,UCP
      00A077 90 89            [ 2]  852 	pushw y 
      00A079 EF 02            [ 2]  853 	ldw (2,x),y 
      00A07B 90 5F            [ 1]  854 	clrw y 
      00A07D FF               [ 2]  855 	ldw (x),y
      00A07E CD 9D C8         [ 4]  856 	call EESTORE
      00A081 90 85            [ 2]  857 	popw y 
      00A083 72 A9 00 02      [ 2]  858 	addw y,#2
      00A087 90 BF 1A         [ 2]  859 	ldw UCP,y
      00A08A 81               [ 4]  860 	ret 
                                    861 
                                    862 
                                    863 ;-------------------------
                                    864 ; Compile byte to flash 
                                    865 ; EEC, ( c -- )	
                                    866 ;-------------------------
      00A08B A0 6D                  867 	.word LINK 
                           00200D   868 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      00A08D 04                     869 	.byte 4 
      00A08E 45 45 43 2C            870 	.ascii "EEC,"
      00A092                        871 EE_CCOMMA:
      00A092 1D 00 04         [ 2]  872 	subw x,#2*CELLL 
      00A095 90 BE 1A         [ 2]  873 	ldw y,UCP
      00A098 90 89            [ 2]  874 	pushw y 
      00A09A EF 02            [ 2]  875 	ldw (2,x),y 
      00A09C 90 5F            [ 1]  876 	clrw y 
      00A09E FF               [ 2]  877 	ldw (x),y
      00A09F CD 9D 7C         [ 4]  878 	call EECSTORE
      00A0A2 90 85            [ 2]  879 	popw y 
      00A0A4 90 5C            [ 1]  880 	incw y 
      00A0A6 90 BF 1A         [ 2]  881 	ldw UCP,y
      00A0A9 81               [ 4]  882 	ret 
                                    883 
                                    884 
                                    885 ;--------------------------
                                    886 ; copy FLASH block to ROWBUF
                                    887 ; ROW>BUF ( ud -- )
                                    888 ;--------------------------
      00A0AA A0 8D                  889 	.word LINK 
                           00202C   890 	LINK=.
      00A0AC 07                     891 	.byte 7 
      00A0AD 52 4F 57 3E 42 55 46   892 	.ascii "ROW>BUF"
      00A0B4                        893 ROW2BUF: 
      00A0B4 CD 9B 3E         [ 4]  894 	call FPSTOR 
      00A0B7 A6 80            [ 1]  895 	ld a,#BLOCK_SIZE
      00A0B9 88               [ 1]  896 	push a 
      00A0BA B4 36            [ 1]  897 	and a,PTR8 ; block align 
      00A0BC B7 36            [ 1]  898 	ld PTR8,a
      00A0BE 90 AE 16 80      [ 2]  899 	ldw y,#ROWBUFF 
      00A0C2 92 BC 00 34      [ 5]  900 1$: ldf a,[FPTR]
      00A0C6 90 F7            [ 1]  901 	ld (y),a
      00A0C8 CD 9C B8         [ 4]  902 	call INC_FPTR
      00A0CB 90 5C            [ 1]  903 	incw y 
      00A0CD 0A 01            [ 1]  904 	dec (1,sp)
      00A0CF 26 F1            [ 1]  905 	jrne 1$ 
      00A0D1 84               [ 1]  906 	pop a 
      00A0D2 81               [ 4]  907 	ret 
                                    908 
                                    909 
                                    910 ;---------------------------
                                    911 ; copy ROWBUFF to flash 
                                    912 ; BUF>ROW ( ud -- )
                                    913 ; ud is row address as double 
                                    914 ;---------------------------
      00A0D3 A0 AC                  915 	.word LINK 
                           002055   916 	LINK=.
      00A0D5 07                     917 	.byte 7 
      00A0D6 42 55 46 3E 52 4F 57   918 	.ascii "BUF>ROW" 
      00A0DD                        919 BUF2ROW:
      00A0DD CD 87 0C         [ 4]  920 	call TBUF ; ( ud rb -- )
      00A0E0 CD 87 CC         [ 4]  921 	call ROT 
      00A0E3 CD 87 CC         [ 4]  922 	call ROT  ; ( rb ud -- )
      00A0E6 CD 9E B6         [ 4]  923 	call write_row 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      00A0E9 81               [ 4]  924 	ret 
                                    925 
                                    926 ;---------------------------------
                                    927 ; how many byte free in that row 
                                    928 ; RFREE ( a -- n )
                                    929 ; a is least byte of target address
                                    930 ;----------------------------------
      00A0EA A0 D5                  931 	.word LINK 
                           00206C   932 	LINK=.
      00A0EC 05                     933 	.byte 5 
      00A0ED 52 46 52 45 45         934 	.ascii "RFREE"
      00A0F2                        935 RFREE:
      00A0F2 E6 01            [ 1]  936 	ld a,(1,x)
      00A0F4 A4 7F            [ 1]  937 	and a,#BLOCK_SIZE-1 
      00A0F6 B7 26            [ 1]  938 	ld YTEMP,a 
      00A0F8 A6 80            [ 1]  939 	ld a,#BLOCK_SIZE 
      00A0FA B0 26            [ 1]  940 	sub a,YTEMP 
      00A0FC 90 5F            [ 1]  941 	clrw y 
      00A0FE 90 97            [ 1]  942 	ld yl,a
      00A100 FF               [ 2]  943 	ldw (x),y 
      00A101 81               [ 4]  944 	ret 
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
      00A102 A0 EC                  955 	.word LINK 
                           002084   956 	LINK=. 
      00A104 06                     957 	.byte 6
      00A105 52 41 4D 3E 45 45      958 	.ascii "RAM>EE"
                                    959 	
      00A10B                        960 RAM2EE:
                                    961 ; copy ud on top 
      00A10B 90 93            [ 1]  962 	ldw y,x 
      00A10D 90 EE 06         [ 2]  963 	ldw y,(6,y) ; LSW of ud  
      00A110 90 BF 26         [ 2]  964 	ldw YTEMP,y 
      00A113 90 93            [ 1]  965 	ldw y,x 
      00A115 90 EE 04         [ 2]  966 	ldw y,(4,y)  ; MSW of ud 
      00A118 1D 00 04         [ 2]  967 	subw x,#2*CELLL 
      00A11B FF               [ 2]  968 	ldw (x),y 
      00A11C 90 BE 26         [ 2]  969 	ldw y,YTEMP 
      00A11F EF 02            [ 2]  970 	ldw (2,x),y 
      00A121 CD A0 B4         [ 4]  971 	call ROW2BUF 
      00A124 90 93            [ 1]  972 	ldw y,x 
      00A126 90 EE 06         [ 2]  973 	ldw y,(6,y)
      00A129 90 89            [ 2]  974 	pushw y ; udl 
      00A12B 90 9F            [ 1]  975 	ld a,yl
      00A12D A4 7F            [ 1]  976 	and a,#BLOCK_SIZE-1 
      00A12F 90 5F            [ 1]  977 	clrw y 
      00A131 90 97            [ 1]  978 	ld yl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      00A133 72 A9 16 80      [ 2]  979 	addw y,#ROWBUFF 
      00A137 1D 00 02         [ 2]  980 	subw x,#CELLL 
      00A13A FF               [ 2]  981 	ldw (x),y  
      00A13B CD 86 18         [ 4]  982 	call SWAPP ;  ( ud a ra u -- )
      00A13E CD 85 B4         [ 4]  983 	call RFROM  
      00A141 CD A0 F2         [ 4]  984 	call RFREE 
      00A144 CD 89 86         [ 4]  985 	call MIN
      00A147 CD 86 08         [ 4]  986 	call DUPP 
      00A14A CD 85 D1         [ 4]  987 	call TOR  
      00A14D CD 8C E1         [ 4]  988 	call CMOVE
      00A150 CD A0 DD         [ 4]  989 	call BUF2ROW 
      00A153 CD 85 B4         [ 4]  990 	call RFROM 
      00A156 81               [ 4]  991 	ret 
                                    992 
                                    993 
                                    994 ;--------------------------
                                    995 ; expand 16 bit address 
                                    996 ; to 32 bit address 
                                    997 ; FADDR ( a -- ud )
                                    998 ;--------------------------
      00A157 A1 04                  999 	.word LINK 
                           0020D9  1000 	LINK=. 
      00A159 05                    1001 	.byte 5 
      00A15A 46 41 44 44 52        1002 	.ascii "FADDR"
      00A15F                       1003 FADDR:
      00A15F CC 8B B7         [ 2] 1004 	jp ZERO 
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
      00A162 A1 59                 1020 	.word LINK 
                           0020E4  1021 	LINK=.
      00A164 05                    1022 	.byte 5 
      00A165 46 4D 4F 56 45        1023 	.ascii "FMOVE" 
      00A16A                       1024 FMOVE:
      00A16A CD 87 1E         [ 4] 1025 	call TFLASH 
      00A16D CD 85 63         [ 4] 1026 	CALL AT 
      00A170 CD 85 18         [ 4] 1027 	CALL QBRAN 
      00A173 A1 EE                 1028 	.word no_move  
      00A175 CD 87 6D         [ 4] 1029 	call CPP
      00A178 CD 85 63         [ 4] 1030 	call AT  
      00A17B CD 86 08         [ 4] 1031 	call DUPP ; ( udl udl -- )
      00A17E CD 87 51         [ 4] 1032 	call CNTXT 
      00A181 CD 85 63         [ 4] 1033 	call AT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      00A184 CD 84 EF         [ 4] 1034 	call DOLIT 
      00A187 00 02                 1035 	.word 2 
      00A189 CD 88 A6         [ 4] 1036 	call SUBB ; ( udl udl a -- )
      00A18C CD 86 18         [ 4] 1037 	call SWAPP 
      00A18F CD A1 5F         [ 4] 1038 	call FADDR 
      00A192 CD 87 CC         [ 4] 1039 	call ROT  ; ( udl ud a -- )
      00A195 CD 86 08         [ 4] 1040 	call DUPP 
      00A198 CD 85 D1         [ 4] 1041 	call TOR    ; R: a 
      00A19B                       1042 FMOVE2: 
      00A19B CD 8C 94         [ 4] 1043 	call HERE 
      00A19E CD 85 C5         [ 4] 1044 	call RAT 
      00A1A1 CD 88 A6         [ 4] 1045 	call SUBB ; (udl ud a wl -- )
      00A1A4                       1046 next_row:
      00A1A4 CD 86 08         [ 4] 1047 	call DUPP 
      00A1A7 CD 85 D1         [ 4] 1048 	call TOR  ; ( udl ud a wl -- ) R: a wl
      00A1AA CD A1 0B         [ 4] 1049 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      00A1AD CD 86 08         [ 4] 1050 	call DUPP 
      00A1B0 CD 85 D1         [ 4] 1051 	call TOR
      00A1B3 CD 88 2D         [ 4] 1052 	call PLUS  ; ( udl+ ) 
      00A1B6 CD 86 08         [ 4] 1053 	call DUPP 
      00A1B9 CD 8B B7         [ 4] 1054 	call ZERO   ; ( udl+ ud -- )
      00A1BC CD 85 B4         [ 4] 1055 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      00A1BF CD 85 B4         [ 4] 1056 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      00A1C2 CD 86 30         [ 4] 1057 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      00A1C5 CD 88 A6         [ 4] 1058 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      00A1C8 CD 86 08         [ 4] 1059 	call DUPP 
      00A1CB CD 85 18         [ 4] 1060 	call QBRAN
      00A1CE A1 E7                 1061 	.word fmove_done 
      00A1D0 CD 86 18         [ 4] 1062 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      00A1D3 CD 85 B4         [ 4] 1063 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      00A1D6 CD 88 2D         [ 4] 1064 	call PLUS  ; ( udl+2 ud wl- a+ )
      00A1D9 CD 86 08         [ 4] 1065 	call DUPP 
      00A1DC CD 85 D1         [ 4] 1066 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      00A1DF CD 86 18         [ 4] 1067 	call SWAPP 
      00A1E2 CD 85 34         [ 4] 1068 	call BRAN
      00A1E5 A1 A4                 1069 	.word next_row  
      00A1E7                       1070 fmove_done:	
      00A1E7 CD 85 B4         [ 4] 1071 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      00A1EA 1C 00 0A         [ 2] 1072 	addw x,#5*CELLL ; (  -- cp+ ) new CP 
      00A1ED 81               [ 4] 1073  	ret  
      00A1EE                       1074 no_move:
      00A1EE CD 8B B7         [ 4] 1075 	call ZERO
      00A1F1 81               [ 4] 1076 	ret 
                                   1077 
                                   1078 ;------------------------------------------
                                   1079 ; adjust pointers after **FMOVE** operetion.
                                   1080 ; UPDAT-PTR ( cp+ -- )
                                   1081 ; cp+ is new CP position after FMOVE 
                                   1082 ;-------------------------------------------
      00A1F2 A1 64                 1083 	.word LINK 
                           002174  1084 	LINK=.
      00A1F4 09                    1085 	.byte 9
      00A1F5 55 50 44 41 54 2D 50  1086 	.ascii "UPDAT-PTR" 
             54 52
      00A1FE                       1087 UPDATPTR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



                                   1088 ;reset VP to previous position  
      00A1FE CD 9B B8         [ 4] 1089 	call EEPVP 
      00A201 CD 85 FE         [ 4] 1090 	call DROP 
      00A204 CD 85 63         [ 4] 1091 	call AT
      00A207 CD 87 5F         [ 4] 1092 	call VPP 
      00A20A CD 85 51         [ 4] 1093 	call STORE
                                   1094 ;update CONTEXT and LAST 
      00A20D CD 9B A2         [ 4] 1095 	call EEPCP 
      00A210 CD 85 FE         [ 4] 1096 	call DROP
      00A213 CD 85 63         [ 4] 1097 	call AT
      00A216 CD 84 EF         [ 4] 1098 	call DOLIT 
      00A219 00 02                 1099 	.word 2 
      00A21B CD 88 2D         [ 4] 1100 	call PLUS 
      00A21E CD 86 08         [ 4] 1101 	call DUPP 
      00A221 CD 87 51         [ 4] 1102 	call CNTXT 
      00A224 CD 85 51         [ 4] 1103 	call STORE
      00A227 CD 87 7D         [ 4] 1104 	call LAST
      00A22A CD 85 51         [ 4] 1105 	call STORE 
      00A22D CD 9B D2         [ 4] 1106 	call UPDATLAST 
                                   1107 ;update CP 
      00A230 CD 87 6D         [ 4] 1108 	call CPP 
      00A233 CD 85 51         [ 4] 1109 	call STORE
      00A236 CD 9B FB         [ 4] 1110 	call UPDATCP 
      00A239 81               [ 4] 1111 	ret 
                                   1112 
                                   1113 ;-----------------------------
                                   1114 ; move interrupt sub-routine
                                   1115 ; in flash memory
                                   1116 ;----------------------------- 
      00A23A A1 F4                 1117 	.word LINK 
                           0021BC  1118 	LINK=. 
      00A23C 06                    1119 	.byte 6
      00A23D 49 46 4D 4F 56 45     1120 	.ascii "IFMOVE" 
      00A243                       1121 IFMOVE:
      00A243 CD 87 1E         [ 4] 1122 	call TFLASH 
      00A246 CD 85 63         [ 4] 1123 	CALL AT 
      00A249 CD 85 18         [ 4] 1124 	CALL QBRAN 
      00A24C A1 EE                 1125 	.word no_move 
      00A24E CD 87 6D         [ 4] 1126 	call CPP 
      00A251 CD 85 63         [ 4] 1127 	call AT 
      00A254 CD 86 08         [ 4] 1128 	call DUPP ; ( udl udl -- )
      00A257 CD 9B B8         [ 4] 1129 	call EEPVP 
      00A25A CD 85 FE         [ 4] 1130 	call DROP
      00A25D CD 85 63         [ 4] 1131 	call AT  ; ( udl udl a )
      00A260 CD 85 D1         [ 4] 1132 	call TOR 
      00A263 CD A1 5F         [ 4] 1133 	call FADDR
      00A266 CD 85 C5         [ 4] 1134 	call RAT ; ( udl ud a -- ) R: a 
      00A269 CC A1 9B         [ 2] 1135 	jp FMOVE2 
                                   1136 
                                   1137 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



                           000001  4540 .if WANT_SCALING_CONST 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



                                   4541         .include "const_ratio.asm"
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
      00A26C A2 3C                   34         .word LINK 
                           0021EE    35         LINK=.
      00A26E 02                      36         .byte 2
      00A26F 50 49                   37         .ascii "PI" 
      00A271                         38 PII:
      00A271 1D 00 04         [ 2]   39         subw x,#2*CELLL 
      00A274 90 AE 01 63      [ 2]   40         ldw y,#355 
      00A278 EF 02            [ 2]   41         ldw (2,x),y 
      00A27A 90 AE 00 71      [ 2]   42         ldw y,#113 
      00A27E FF               [ 2]   43         ldw (x),y 
      00A27F 81               [ 4]   44         ret 
                                     45 
                                     46 ;      SQRT2 ( -- 19601  13860 )
                                     47 ; precision: 1.5e-9 
                                     48 ; usage example to compute Voltage peek to peek from Vrms 
                                     49 ; : VPP SQRT2 */ 2 * ;
                                     50 ;
      00A280 A2 6E                   51         .word LINK 
                           002202    52         LINK=.
      00A282 05                      53         .byte 5 
      00A283 53 51 52 54 32          54         .ascii "SQRT2" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      00A288                         55 SQRT2:
      00A288 1D 00 04         [ 2]   56         subw x,#2*CELLL 
      00A28B 90 AE 4C 91      [ 2]   57         ldw y,#19601 
      00A28F EF 02            [ 2]   58         ldw (2,x),y 
      00A291 90 AE 36 24      [ 2]   59         ldw y,#13860 
      00A295 FF               [ 2]   60         ldw (x),y 
      00A296 81               [ 4]   61         ret 
                                     62 
                                     63 ;   SQRT3 ( -- 18817 10864 )
                                     64 ; precision: 1.1e-9
                                     65 ;
      00A297 A2 82                   66         .word LINK 
                           002219    67         LINK=.
      00A299 05                      68         .byte 5
      00A29A 53 51 52 54 33          69         .ascii "SQRT3" 
      00A29F                         70 SQRT3: 
      00A29F 1D 00 04         [ 2]   71     subw x,#2*CELLL 
      00A2A2 90 AE 49 81      [ 2]   72     ldw y,#18817 
      00A2A6 EF 02            [ 2]   73     ldw (2,x),y 
      00A2A8 90 AE 2A 70      [ 2]   74     ldw y,#10864 
      00A2AC FF               [ 2]   75     ldw (x),y 
      00A2AD 81               [ 4]   76     ret 
                                     77 
                                     78 ;   E ( -- 28667 10546 )
                                     79 ; precision: 5.5e-9 
                                     80 ; natural log base 
      00A2AE A2 99                   81         .word LINK 
                           002230    82         LINK=.
      00A2B0 01                      83         .byte 1
      00A2B1 45                      84         .ascii "E" 
      00A2B2                         85 ENEPER:
      00A2B2 1D 00 04         [ 2]   86     subw x,#2*CELLL 
      00A2B5 90 AE 6F FB      [ 2]   87     ldw y,#28667 
      00A2B9 EF 02            [ 2]   88     ldw (2,x),y 
      00A2BB 90 AE 29 32      [ 2]   89     ldw y,#10546 
      00A2BF FF               [ 2]   90     ldw (x),y 
      00A2C0 81               [ 4]   91     ret 
                                     92 
                                     93 ;   SQRT10 ( -- 22936 7253 )
                                     94 ; precision: 5.7e-9 
      00A2C1 A2 B0                   95         .word LINK 
                           002243    96         LINK=.
      00A2C3 06                      97         .byte 6 
      00A2C4 53 51 52 54 31 30       98         .ascii "SQRT10" 
      00A2CA                         99 SQRT10:
      00A2CA 1D 00 04         [ 2]  100     subw x,#2*CELLL
      00A2CD 90 AE 59 98      [ 2]  101     ldw y,#22936 
      00A2D1 EF 02            [ 2]  102     ldw (2,x),y 
      00A2D3 90 AE 1C 55      [ 2]  103     ldw y,#7253
      00A2D7 FF               [ 2]  104     ldw (x),y 
      00A2D8 81               [ 4]  105     ret 
                                    106 
                                    107 ;   12RT2 ( -- 26797 25293 )
                                    108 ; precision: 1.0e-9 
                                    109 ; used in music to compute well tempered scale
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      00A2D9 A2 C3                  110         .word LINK 
                           00225B   111         LINK=. 
      00A2DB 05                     112         .byte 5 
      00A2DC 31 32 52 54 32         113         .ascii "12RT2"
      00A2E1                        114 RT12_2:
      00A2E1 1D 00 04         [ 2]  115     subw x,#2*CELLL 
      00A2E4 90 AE 68 AD      [ 2]  116     ldw y,#26797
      00A2E8 EF 02            [ 2]  117     ldw (2,x),y 
      00A2EA 90 AE 62 CD      [ 2]  118     ldw y,#25293
      00A2EE FF               [ 2]  119     ldw (x),y 
      00A2EF 81               [ 4]  120     ret 
                                    121 
                                    122 ;   LOG2s ( -- 2040 11103 )
                                    123 ; log(2)/1.6384
                                    124 ; precision: 1.1e-8
      00A2F0 A2 DB                  125         .word LINK 
                           002272   126         LINK=.
      00A2F2 05                     127         .byte 5 
      00A2F3 4C 4F 47 32 53         128         .ascii "LOG2S" 
      00A2F8                        129 LOG2S:
      00A2F8 1D 00 04         [ 2]  130     subw x,#2*CELLL
      00A2FB 90 AE 07 F8      [ 2]  131     ldw y,#2040 
      00A2FF EF 02            [ 2]  132     ldw (2,x),y 
      00A301 90 AE 2B 5F      [ 2]  133     ldw y,#11103 
      00A305 FF               [ 2]  134     ldw (x),y 
      00A306 81               [ 4]  135     ret 
                                    136 
                                    137 ;   LN2 ( -- 485 11464 )
                                    138 ; ln(2)/16.384 
                                    139 ; precision: 1.0e-7 
      00A307 A2 F2                  140         .word LINK 
                           002289   141         LINK=.
      00A309 04                     142         .byte 4 
      00A30A 4C 4E 32 53            143         .ascii "LN2S" 
      00A30E                        144 LN2S: 
      00A30E 1D 00 04         [ 2]  145     subw x,#2*CELLL
      00A311 90 AE 01 E5      [ 2]  146     ldw y,#485
      00A315 EF 02            [ 2]  147     ldw (2,x),y 
      00A317 90 AE 2C C8      [ 2]  148     ldw y,#11464 
      00A31B FF               [ 2]  149     ldw (x),y 
      00A31C 81               [ 4]  150     ret 
                                    151 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



                                   4542 .endif
                           000001  4543 .if WANT_CONST_TABLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



                                   4544         .include "ctable.asm"
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
      00A31D A3 09                   34     .word LINK 
                           00229F    35     LINK=.
      00A31F 06                      36     .byte 6
      00A320 43 41 4C 4C 4F 54       37     .ascii "CALLOT"
      00A326                         38 CALLOT:
      00A326 CD 87 6D         [ 4]   39     CALL CPP
      00A329 CD 86 08         [ 4]   40     CALL DUPP 
      00A32C CD 85 63         [ 4]   41     CALL AT 
      00A32F CD 85 D1         [ 4]   42     CALL TOR 
      00A332 CD 8C 27         [ 4]   43     CALL PSTOR 
      00A335 CD 9B FB         [ 4]   44     CALL UPDATCP 
      00A338 CD 85 B4         [ 4]   45     CALL RFROM
      00A33B CC 8B B7         [ 2]   46     JP ZERO 
                                     47 
                                     48 ;------------------------------
                                     49 ; create constants bytes table 
                                     50 ; in persistant memory
                                     51 ;  CTABLE ( n+ -- ad ; <string> )
                                     52 ; n+ bytes reserved 
                                     53 ;-----------------------------
      00A33E A3 1F                   54     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



                           0022C0    55     LINK=.
      00A340 06                      56     .byte 6
      00A341 43 54 41 42 4C 45       57     .ascii "CTABLE"
      00A347                         58 CTABLE:
      00A347 CD A3 26         [ 4]   59     CALL CALLOT     
      00A34A CC 98 FD         [ 2]   60     JP DCONST 
                                     61      
                                     62 
                                     63 ;--------------------------------
                                     64 ; create constants words table 
                                     65 ; in persistant memory 
                                     66 ; WTABLE ( n+ -- ad ; <string> )
                                     67 ; n+  words reserved  
                                     68 ;--------------------------------
      00A34D A3 40                   69     .word LINK 
                           0022CF    70     LINK=.
      00A34F 06                      71     .byte 6
      00A350 57 54 41 42 4C 45       72     .ascii "WTABLE"
      00A356                         73 WTABLE:
      00A356 CD 8B 3E         [ 4]   74     CALL CELLS  
      00A359 CD A3 26         [ 4]   75     CALL CALLOT 
      00A35C CC 98 FD         [ 2]   76     JP DCONST 
                                     77 
                                     78 ;---------------------------------
                                     79 ; stack an element of CTABLE 
                                     80 ; CTABL@ ( u ad -- c )
                                     81 ; u element order {0..size-1}
                                     82 ; a|ad table address 
                                     83 ;--------------------------------
      00A35F A3 4F                   84     .word LINK 
                           0022E1    85     LINK=.
      00A361 06                      86     .byte 6
      00A362 43 54 41 42 4C 40       87     .ascii "CTABL@" 
      00A368                         88 CTAT:
      00A368 CD 9B 3E         [ 4]   89     call FPSTOR 
      00A36B CD 9C D0         [ 4]   90     call PTRPLUS 
      00A36E CC 9D 0D         [ 2]   91     jp EE_CREAD 
                                     92 
                                     93 ;---------------------------------
                                     94 ; stack an element of WTABLE 
                                     95 ; WTABL@ ( u ud -- w )
                                     96 ; u is element order {0..size-1}
                                     97 ; a|ud table address 
                                     98 ;----------------------------------
      00A371 A3 61                   99     .word LINK 
                           0022F3   100     LINK=.
      00A373 06                     101     .byte 6
      00A374 57 54 41 42 4C 40      102     .ascii "WTABL@" 
      00A37A                        103 WTAT:
      00A37A CD 9B 3E         [ 4]  104     call FPSTOR 
      00A37D CD 8B 3E         [ 4]  105     call CELLS 
      00A380 CD 9C D0         [ 4]  106     call PTRPLUS 
      00A383 CD 9C EB         [ 4]  107     call EE_READ 
      00A386 81               [ 4]  108     ret 
                                    109 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



                                    110 ;--------------------------
                                    111 ; tool to initialize character table 
                                    112 ; CTINIT ( ad -- )
                                    113 ; ad is table address 
                                    114 ;--------------------------
      00A387 A3 73                  115     .word LINK 
                           002309   116     LINK=.
      00A389 06                     117     .byte 6 
      00A38A 43 54 49 4E 49 54      118     .ascii "CTINIT"
      00A390                        119 CTINIT:
      00A390 CD 9B 3E         [ 4]  120     CALL FPSTOR
      00A393 CD 9C 7C         [ 4]  121     CALL UNLOCK
      00A396 CD 8B B7         [ 4]  122     CALL ZERO 
      00A399 CD 8B 4B         [ 4]  123 1$: CALL ONEP 
      00A39C CD 86 08         [ 4]  124     CALL DUPP 
      00A39F CD A3 EC         [ 4]  125     CALL INTQ 
      00A3A2 CD 85 18         [ 4]  126     CALL QBRAN 
      00A3A5 A3 AF                  127     .word 2$
      00A3A7 CD 9D 27         [ 4]  128     call WR_BYTE 
      00A3AA CD 85 34         [ 4]  129     CALL BRAN 
      00A3AD A3 99                  130     .word 1$ 
      00A3AF CD 88 0D         [ 4]  131 2$: CALL DDROP 
      00A3B2 CD 9C A4         [ 4]  132     CALL LOCK 
      00A3B5 81               [ 4]  133     ret 
                                    134 
                                    135 ;--------------------------
                                    136 ; tool to initialize word table 
                                    137 ; WTINIT ( ad -- )
                                    138 ; ad is table address 
                                    139 ;--------------------------
      00A3B6 A3 89                  140     .word LINK 
                           002338   141     LINK=.
      00A3B8 06                     142     .byte 6 
      00A3B9 57 54 49 4E 49 54      143     .ascii "WTINIT"
      00A3BF                        144 WTINIT:
      00A3BF CD 9B 3E         [ 4]  145     CALL FPSTOR
      00A3C2 CD 9C 7C         [ 4]  146     CALL UNLOCK
      00A3C5 CD 8B B7         [ 4]  147     CALL ZERO 
      00A3C8 CD 8B 4B         [ 4]  148 1$: CALL ONEP 
      00A3CB CD 86 08         [ 4]  149     CALL DUPP
      00A3CE CD A3 EC         [ 4]  150     CALL INTQ
      00A3D1 CD 85 18         [ 4]  151     CALL QBRAN 
      00A3D4 A3 DE                  152     .word 2$
      00A3D6 CD 9D 4C         [ 4]  153     call WR_WORD 
      00A3D9 CD 85 34         [ 4]  154     CALL BRAN 
      00A3DC A3 C8                  155     .word 1$ 
      00A3DE CD 88 0D         [ 4]  156 2$: CALL DDROP 
      00A3E1 CD 9C A4         [ 4]  157     CALL LOCK 
      00A3E4 81               [ 4]  158     ret 
                                    159 
                                    160 ;------------------------
                                    161 ; Prompted input for integer 
                                    162 ; display n+ in bracket and
                                    163 ; '?' 
                                    164 ; [N]? ( n+ -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



                                    165 ;------------------------
      00A3E5 A3 B8                  166     .word LINK 
                           002367   167     LINK=.
      00A3E7 04                     168     .byte 4
      00A3E8 5B 4E 5D 3F            169     .ascii "[N]?" 
      00A3EC                        170 INTQ:
      00A3EC CD 8F 2F         [ 4]  171     CALL CR 
      00A3EF CD 84 EF         [ 4]  172     call DOLIT 
      00A3F2 00 5B                  173     .word '[
      00A3F4 CD 84 B6         [ 4]  174     CALL EMIT 
      00A3F7 CD 8F D6         [ 4]  175     CALL DOT 
      00A3FA CD 8F 5C         [ 4]  176     CALL  DOTQP
      00A3FD 03                     177     .byte 3
      00A3FE 5D 3F 20               178     .ascii "]? " 
      00A401 CD 93 65         [ 4]  179     CALL QUERY 
      00A404 CD 91 90         [ 4]  180     call TOKEN 
      00A407 CC A4 95         [ 2]  181     jp NUMBQ
                                    182 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



                                   4545 .endif
                           000001  4546 .if WANT_DOUBLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



                                   4547         .include "double.asm"
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
      00A40A                         30 nsign: ; a cntr -- a cntr f 
      00A40A CD 8B B7         [ 4]   31     CALL ZERO 
      00A40D CD 85 D1         [ 4]   32     CALL TOR  ; R: sign 
      00A410 CD 85 D1         [ 4]   33     CALL TOR  ; R: sign cntr 
      00A413 CD 86 08         [ 4]   34     CALL DUPP 
      00A416 CD 85 81         [ 4]   35     CALL CAT 
      002399                         36     _DOLIT '-'
      00A419 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A41C 00 2D                    2     .word '-' 
      00A41E CD 88 CE         [ 4]   37     CALL EQUAL 
      0023A1                         38     _QBRAN nsign1 
      00A421 CD 85 18         [ 4]    1     CALL QBRAN
      00A424 A4 3B                    2     .word nsign1
      00A426 CD 8B 4B         [ 4]   39     CALL ONEP ; a+ 
      00A429 CD 85 B4         [ 4]   40     CALL RFROM 
      00A42C CD 8B 58         [ 4]   41     CALL ONEM ; cntr-
      00A42F CD 85 B4         [ 4]   42     CALL RFROM ; sign 
      00A432 CD 88 47         [ 4]   43     CALL INVER ; -1
      00A435 CD 85 D1         [ 4]   44     CALL TOR   ; R: sign 
      00A438 CD 85 D1         [ 4]   45     CALL TOR   ; R: cntr 
      00A43B                         46 nsign1:
      00A43B CD 85 B4         [ 4]   47     CALL RFROM 
      00A43E CD 85 B4         [ 4]   48     CALL RFROM 
      00A441 81               [ 4]   49     RET 
                                     50 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



                                     51 
                                     52 ; get all digits in row 
                                     53 ; stop at first non-digit or end of string 
                                     54 ; ( dlo dhi a cntr -- dlo dhi [ a+ cntr- | a+ 0 ] )
      00A442                         55 parse_digits:
      00A442                         56 1$:
      00A442 CD 86 08         [ 4]   57     CALL DUPP 
      0023C5                         58     _QBRAN 5$ 
      00A445 CD 85 18         [ 4]    1     CALL QBRAN
      00A448 A4 8A                    2     .word 5$
      00A44A CD 85 D1         [ 4]   59     CALL TOR   ; dlo dhi a R: cntr 
      00A44D CD 8C 7D         [ 4]   60     CALL COUNT ; dlo dhi a+ char 
      00A450 CD 86 CE         [ 4]   61     CALL BASE 
      00A453 CD 85 63         [ 4]   62     CALL AT 
      00A456 CD 8E 75         [ 4]   63     CALL DIGTQ 
      0023D9                         64     _QBRAN 4$ ; not a digit
      00A459 CD 85 18         [ 4]    1     CALL QBRAN
      00A45C A4 81                    2     .word 4$
      00A45E CD A8 42         [ 4]   65     CALL DTOR  ; dlo dhi R: cntr a+ c  
      00A461 CD 86 CE         [ 4]   66     CALL BASE 
      00A464 CD 85 63         [ 4]   67     CALL AT 
      00A467 CD A6 7C         [ 4]   68     CALL DSSTAR
      00A46A CD 85 B4         [ 4]   69     CALL RFROM 
      00A46D CD 8B B7         [ 4]   70     CALL ZERO 
      00A470 CD AB 09         [ 4]   71     CALL DPLUS 
      00A473 CD 85 B4         [ 4]   72     CALL RFROM  ; dlo dhi a+ 
      00A476 CD 85 B4         [ 4]   73     CALL RFROM ; dlo dhi a+ cntr 
      00A479 CD 8B 58         [ 4]   74     CALL ONEM 
      0023FC                         75     _BRAN 1$ ; dlo dhi a+ R: 
      00A47C CD 85 34         [ 4]    1     CALL BRAN 
      00A47F A4 42                    2     .word 1$ 
      00A481 CD 85 FE         [ 4]   76 4$: CALL DROP  ; dlo dhi a+ 
      00A484 CD 8B 58         [ 4]   77     CALL ONEM  ; unget char 
      00A487 CD 85 B4         [ 4]   78     CALL RFROM ; dlo dhi a+ cntr-
      00A48A                         79 5$:
      00A48A 81               [ 4]   80     RET 
                                     81 
                                     82 
                                     83 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     84 ;   NUMBER? (a -- s -1 |d -2 | a F )
                                     85 ;   convert string to integer 
                                     86 ;   double begin with '#' 
                                     87 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00240B                         88     _HEADER NUMBQ,7,"NUMBER?"
      00A48B A3 E7                    1         .word LINK 
                           00240D     2         LINK=.
      00A48D 07                       3         .byte 7  
      00A48E 4E 55 4D 42 45 52 3F     4         .ascii "NUMBER?"
      00A495                          5         NUMBQ:
                                     89 ; save current base value 
      00A495 CD 86 CE         [ 4]   90     CALL BASE 
      00A498 CD 85 63         [ 4]   91     CALL AT 
      00A49B CD 85 D1         [ 4]   92     CALL TOR 
                                     93 ; initialize integer to 0     
      00A49E 1D 00 04         [ 2]   94     SUBW X,#4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      00A4A1 90 5F            [ 1]   95     CLRW Y 
      00A4A3 FF               [ 2]   96     LDW (X),Y 
      00A4A4 EF 02            [ 2]   97     LDW (2,X),Y ; a 0 0 R: base  
      002426                         98     _DOLIT 2 
      00A4A6 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A4A9 00 02                    2     .word 2 
      00A4AB CD 8C 10         [ 4]   99     CALL PICK  ; a 0 0 a R: base    
      00A4AE CD 8C 7D         [ 4]  100     CALL COUNT ; a 0 0 a+ n 
                                    101 ; check for '#' double integer 
      00A4B1 CD 86 30         [ 4]  102     CALL OVER  ; a 0 0 a+ n a+
      00A4B4 CD 85 81         [ 4]  103     CALL CAT   ; a 0 0 a+ n c 
      002437                        104     _DOLIT '#' ; a 0 0 a+ n c '#' 
      00A4B7 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A4BA 00 23                    2     .word '#' 
      00A4BC CD 88 CE         [ 4]  105     CALL EQUAL 
      00A4BF CD 85 D1         [ 4]  106     CALL TOR   ; a 0 0 a+ n R: base d? 
      00A4C2 CD 85 C5         [ 4]  107     CALL RAT   ; a 0 0 a+ n d? R: base d?
      002445                        108     _QBRAN NUMQ0
      00A4C5 CD 85 18         [ 4]    1     CALL QBRAN
      00A4C8 A4 D6                    2     .word NUMQ0
                                    109 ; update a and count
      00A4CA CD 86 18         [ 4]  110     CALL SWAPP 
      00A4CD CD 8B 4B         [ 4]  111     CALL ONEP 
      00A4D0 CD 86 18         [ 4]  112     CALL SWAPP 
      00A4D3 CD 8B 58         [ 4]  113     CALL ONEM  ; a 0 0 a+ n- R: base d?
                                    114 ; check for '$' hexadecimal  
      00A4D6                        115 NUMQ0: 
      00A4D6 CD 86 30         [ 4]  116     CALL OVER   
      00A4D9 CD 85 81         [ 4]  117     CALL CAT   
      00245C                        118     _DOLIT '$'
      00A4DC CD 84 EF         [ 4]    1     CALL DOLIT 
      00A4DF 00 24                    2     .word '$' 
      00A4E1 CD 88 CE         [ 4]  119     CALL EQUAL ; a 0 0 a+ n- f  
      002464                        120     _QBRAN NUMQ1 
      00A4E4 CD 85 18         [ 4]    1     CALL QBRAN
      00A4E7 A4 F8                    2     .word NUMQ1
      00A4E9 CD 8E 4C         [ 4]  121     CALL HEX   ; switch to hexadecimal base 
                                    122 ; update a and count 
      00A4EC CD 86 18         [ 4]  123     CALL SWAPP 
      00A4EF CD 8B 4B         [ 4]  124     CALL ONEP 
      00A4F2 CD 86 18         [ 4]  125     CALL SWAPP
      00A4F5 CD 8B 58         [ 4]  126     CALL ONEM ; a 0 0 a+ n-  R: base d?
                                    127 ; check for minus sign 
      00A4F8                        128 NUMQ1: 
      00A4F8 CD A4 0A         [ 4]  129     CALL nsign 
      00A4FB CD 85 D1         [ 4]  130     CALL TOR ; R: base d? sign  
                                    131 ; check for end of string     
      00A4FE CD 87 BB         [ 4]  132     CALL QDUP    ; a dlo dhi a+ cntr R: base d? sign 
      002481                        133     _QBRAN NUMQ4 ; yes , not a number 
      00A501 CD 85 18         [ 4]    1     CALL QBRAN
      00A504 A5 43                    2     .word NUMQ4
      00A506 CD A4 42         [ 4]  134     CALL parse_digits
      00A509 CD 87 BB         [ 4]  135     CALL QDUP 
      00A50C CD 86 51         [ 4]  136     CALL ZEQUAL  
      00248F                        137     _QBRAN NUMQ4 ; error not end of string  ( a dlo dhi a+ R: base d? sign )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      00A50F CD 85 18         [ 4]    1     CALL QBRAN
      00A512 A5 43                    2     .word NUMQ4
      00A514 CD 85 FE         [ 4]  138     CALL DROP  ; a dlo dhi 
      00A517 CD 85 B4         [ 4]  139     CALL RFROM  ; a dlo dhi sign 
      00249A                        140     _QBRAN NUMQ3
      00A51A CD 85 18         [ 4]    1     CALL QBRAN
      00A51D A5 22                    2     .word NUMQ3
      00A51F CD 88 6A         [ 4]  141     CALL DNEGA
      00A522                        142 NUMQ3: 
      00A522 CD 87 CC         [ 4]  143     CALL ROT ; dlo dhi a  R: base d?
      00A525 CD 85 FE         [ 4]  144     CALL DROP
      0024A8                        145     _DOLIT -2  ; double return -2 flag 
      00A528 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A52B FF FE                    2     .word -2 
      00A52D CD 85 B4         [ 4]  146     CALL RFROM ; dlo dhi d? R: base 
      0024B0                        147     _TBRAN NUMQ8 
      00A530 CD 85 26         [ 4]    1     CALL TBRAN 
      00A533 A5 4C                    2     .word NUMQ8 
      00A535 CD 86 18         [ 4]  148     CALL SWAPP 
      00A538 CD 85 FE         [ 4]  149     CALL DROP
      00A53B CD 8B 4B         [ 4]  150     CALL ONEP   ; single return -1 flag   
      0024BE                        151     _BRAN NUMQ8
      00A53E CD 85 34         [ 4]    1     CALL BRAN 
      00A541 A5 4C                    2     .word NUMQ8 
      00A543                        152 NUMQ4: ; not end of string error , ( a dlo dhi a+ cntr R: base d? sign )
                           000001   153 .if WANT_FLOAT
      00A543 CD 85 B4         [ 4]  154     CALL RFROM ; sign 
      00A546 CD 85 B4         [ 4]  155     CALL RFROM ; d? 
      00A549 CD AE EA         [ 4]  156     CALL FLOATQ ; ( a dlo dhi a+ cntr sign d? )    
                           000000   157 .else 
                                    158     ADDW X,#4 ; drop dhi a+  , ( a dlo R: base d? sign ) 
                                    159     ADDW SP,#4 ; drop d? sign  R: base 
                                    160     CLRW Y 
                                    161     LDW (X),Y ; dlo replaced by 0 ( -- a 0 R: base ) 
                                    162 .endif 
                                    163 ; restore original base value     
      00A54C                        164 NUMQ8: 
      00A54C CD 85 B4         [ 4]  165     CALL RFROM 
      00A54F CD 86 CE         [ 4]  166     CALL BASE 
      00A552 CD 85 51         [ 4]  167     CALL STORE 
      00A555 81               [ 4]  168     RET 
                                    169 
                                    170 
                                    171 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    172 ;    D0= ( d -- 0|-1 )
                                    173 ;    check if double is 0 
                                    174 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0024D6                        175     _HEADER DZEQUAL,3,"D0="
      00A556 A4 8D                    1         .word LINK 
                           0024D8     2         LINK=.
      00A558 03                       3         .byte 3  
      00A559 44 30 3D                 4         .ascii "D0="
      00A55C                          5         DZEQUAL:
      00A55C CD 86 79         [ 4]  176     CALL ORR 
      00A55F A6 FF            [ 1]  177     LD A,#0xFF
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      00A561 90 93            [ 1]  178     LDW Y,X
      00A563 90 FE            [ 2]  179     LDW Y,(Y)
      00A565 90 A3 00 00      [ 2]  180     CPW Y,#0 
      00A569 27 01            [ 1]  181     JREQ  ZEQ1
      00A56B 4F               [ 1]  182     CLR A   ;false
      00A56C                        183 ZEQ1:
      00A56C F7               [ 1]  184     LD     (X),A
      00A56D E7 01            [ 1]  185     LD (1,X),A
      00A56F 81               [ 4]  186 	RET     
                                    187     
                                    188 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    189 ;  2NEGATE ( d -- d )
                                    190 ;  negate double (2's complement)
                                    191 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0024F0                        192     _HEADER DNEGAT,7,"2NEGATE"
      00A570 A5 58                    1         .word LINK 
                           0024F2     2         LINK=.
      00A572 07                       3         .byte 7  
      00A573 32 4E 45 47 41 54 45     4         .ascii "2NEGATE"
      00A57A                          5         DNEGAT:
      00A57A CD 88 47         [ 4]  193     CALL INVER
      00A57D CD 86 18         [ 4]  194     CALL SWAPP 
      00A580 CD 88 47         [ 4]  195     CALL INVER 
      00A583 90 93            [ 1]  196     LDW  Y,X 
      00A585 90 FE            [ 2]  197     LDW Y,(Y)
      00A587 72 A9 00 01      [ 2]  198     ADDW Y,#1 
      00A58B FF               [ 2]  199     LDW (X),Y 
      00A58C 24 0B            [ 1]  200     JRNC DNEG1 
      00A58E 90 93            [ 1]  201     LDW Y,X 
      00A590 90 EE 02         [ 2]  202     LDW Y,(2,Y)
      00A593 72 A9 00 01      [ 2]  203     ADDW Y,#1
      00A597 EF 02            [ 2]  204     LDW (2,X),Y 
      00A599                        205 DNEG1:
      00A599 CD 86 18         [ 4]  206     CALL SWAPP 
      00A59C 81               [ 4]  207     RET      
                                    208 
                                    209 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    210 ;   DABS ( d -- d )
                                    211 ;   absolute value of double
                                    212 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00251D                        213     _HEADER DABS,4,"DABS"
      00A59D A5 72                    1         .word LINK 
                           00251F     2         LINK=.
      00A59F 04                       3         .byte 4  
      00A5A0 44 41 42 53              4         .ascii "DABS"
      00A5A4                          5         DABS:
      00A5A4 CD 86 08         [ 4]  214     CALL DUPP 
      00A5A7 CD 86 3F         [ 4]  215     CALL ZLESS 
      00252A                        216     _QBRAN DABS1 
      00A5AA CD 85 18         [ 4]    1     CALL QBRAN
      00A5AD A5 B2                    2     .word DABS1
      00A5AF CD 88 6A         [ 4]  217     CALL DNEGA 
      00A5B2                        218 DABS1:
      00A5B2 81               [ 4]  219     RET 
                                    220 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



                                    221 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    222 ;  DSIGN ( d -- d f )
                                    223 ;  sign of double 
                                    224 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002533                        225     _HEADER DSIGN,5,"DSIGN"
      00A5B3 A5 9F                    1         .word LINK 
                           002535     2         LINK=.
      00A5B5 05                       3         .byte 5  
      00A5B6 44 53 49 47 4E           4         .ascii "DSIGN"
      00A5BB                          5         DSIGN:
      00A5BB A6 00            [ 1]  226     LD A,#0 
      00A5BD 90 93            [ 1]  227     LDW Y,X 
      00A5BF 90 FE            [ 2]  228     LDW Y,(Y)
      00A5C1 2A 02            [ 1]  229     JRPL DSIGN1
      00A5C3 A6 FF            [ 1]  230     LD A,#0XFF 
      00A5C5                        231 DSIGN1:
      00A5C5 1D 00 02         [ 2]  232     SUBW X,#2 
      00A5C8 F7               [ 1]  233     LD (X),A 
      00A5C9 E7 01            [ 1]  234     LD (1,X),A 
      00A5CB 81               [ 4]  235     RET 
                                    236 
                                    237 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    238 ;   D/MOD ( d s - r qd )
                                    239 ;   unsigned divide double by single 
                                    240 ;   return double quotient 
                                    241 ;   and single remainder 
                                    242 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00254C                        243     _HEADER DSLMOD,5,"D/MOD"
      00A5CC A5 B5                    1         .word LINK 
                           00254E     2         LINK=.
      00A5CE 05                       3         .byte 5  
      00A5CF 44 2F 4D 4F 44           4         .ascii "D/MOD"
      00A5D4                          5         DSLMOD:
      00A5D4 90 93            [ 1]  244         LDW     Y,X             ; stack pointer to Y
      00A5D6 FE               [ 2]  245         LDW     X,(X)           ; un
      00A5D7 BF 26            [ 2]  246         LDW     YTEMP,X         ; save un
      00A5D9 93               [ 1]  247         LDW     X,Y
      00A5DA 89               [ 2]  248         PUSHW   X               ; save stack pointer
      00A5DB 90 89            [ 2]  249         PUSHW   Y 
      00A5DD EE 02            [ 2]  250         LDW     X,(2,X)           ; X=udh
      00A5DF 90 BE 26         [ 2]  251         LDW     Y,YTEMP         ; divisor 
      00A5E2 65               [ 2]  252         DIVW    X,Y 
      00A5E3 BF 24            [ 2]  253         LDW     XTEMP,X         ; QUOTIENT hi 
      00A5E5 93               [ 1]  254         LDW     X,Y             ; remainder in X 
      00A5E6 90 85            [ 2]  255         POPW    Y 
      00A5E8 90 EE 04         [ 2]  256         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      00A5EB A6 10            [ 1]  257         LD      A,#16           ; loop count
      00A5ED 90 58            [ 2]  258         SLLW    Y               ; udl shift udl into udh
      00A5EF                        259 DSLMOD3:
      00A5EF 59               [ 2]  260         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      00A5F0 25 04            [ 1]  261         JRC     DSLMODa         ; if carry out of rotate
      00A5F2 B3 26            [ 2]  262         CPW     X,YTEMP         ; compare udh to un
      00A5F4 25 05            [ 1]  263         JRULT   DSLMOD4         ; can't subtract
      00A5F6                        264 DSLMODa:
      00A5F6 72 B0 00 26      [ 2]  265         SUBW    X,YTEMP         ; can subtract
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      00A5FA 98               [ 1]  266         RCF
      00A5FB                        267 DSLMOD4:
      00A5FB 8C               [ 1]  268         CCF                     ; quotient bit
      00A5FC 90 59            [ 2]  269         RLCW    Y               ; rotate into quotient, rotate out udl
      00A5FE 4A               [ 1]  270         DEC     A               ; repeat
      00A5FF 26 EE            [ 1]  271         JRNE    DSLMOD3           ; if A == 0
      00A601                        272 DSLMODb:
      00A601 BF 26            [ 2]  273         LDW     YTEMP,X         ; done, save remainder
      00A603 85               [ 2]  274         POPW    X               ; restore stack pointer
      00A604 EF 02            [ 2]  275         LDW     (2,X),Y           ; save quotient low 
      00A606 90 BE 24         [ 2]  276         LDW     Y,XTEMP         ; quotient hi 
      00A609 FF               [ 2]  277         LDW     (X),Y           ; save quotient hi 
      00A60A 90 BE 26         [ 2]  278         LDW     Y,YTEMP         ; remainder onto stack
      00A60D EF 04            [ 2]  279         LDW     (4,X),Y
      00A60F 81               [ 4]  280         RET 
                                    281 
                                    282 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    283 ;   D# ( d -- d )
                                    284 ;   extract least digit 
                                    285 ;   from double integer 
                                    286 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002590                        287     _HEADER DDIG,2,"D#"
      00A610 A5 CE                    1         .word LINK 
                           002592     2         LINK=.
      00A612 02                       3         .byte 2  
      00A613 44 23                    4         .ascii "D#"
      00A615                          5         DDIG:
      00A615 CD 86 CE         [ 4]  288     CALL BASE 
      00A618 CD 85 63         [ 4]  289     CALL AT 
      00A61B CD A5 D4         [ 4]  290     CALL DSLMOD
      00A61E CD 87 CC         [ 4]  291     CALL ROT   
      00A621 CD 8D 75         [ 4]  292     CALL DIGIT 
      00A624 CD 8D C1         [ 4]  293     CALL HOLD 
      00A627 81               [ 4]  294     RET 
                                    295 
                                    296 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    297 ;    D#S ( d -- s )
                                    298 ;   extract digit from double 
                                    299 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025A8                        300     _HEADER DDIGS,3,"D#S"
      00A628 A6 12                    1         .word LINK 
                           0025AA     2         LINK=.
      00A62A 03                       3         .byte 3  
      00A62B 44 23 53                 4         .ascii "D#S"
      00A62E                          5         DDIGS:
      00A62E CD A6 15         [ 4]  301     CALL    DDIG 
      00A631 CD 88 18         [ 4]  302     CALL    DDUP 
      00A634 CD A5 5C         [ 4]  303     CALL    DZEQUAL
      0025B7                        304     _QBRAN  DDIGS 
      00A637 CD 85 18         [ 4]    1     CALL QBRAN
      00A63A A6 2E                    2     .word DDIGS
      00A63C CD 85 FE         [ 4]  305     CALL    DROP 
      00A63F 81               [ 4]  306     RET 
                                    307 
                                    308 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



                                    309 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    310 ;   D. ( d -- )
                                    311 ;   display double integer 
                                    312 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025C0                        313     _HEADER DDOT,2,"D."
      00A640 A6 2A                    1         .word LINK 
                           0025C2     2         LINK=.
      00A642 02                       3         .byte 2  
      00A643 44 2E                    4         .ascii "D."
      00A645                          5         DDOT:
      00A645 CD 8E ED         [ 4]  314     CALL SPACE 
      00A648 CD A5 BB         [ 4]  315     CALL DSIGN 
      00A64B CD 85 D1         [ 4]  316     CALL TOR
      00A64E CD 85 C5         [ 4]  317     CALL RAT 
      0025D1                        318     _QBRAN DDOT0
      00A651 CD 85 18         [ 4]    1     CALL QBRAN
      00A654 A6 59                    2     .word DDOT0
      00A656 CD 88 6A         [ 4]  319     CALL DNEGA 
      00A659                        320 DDOT0:     
      00A659 CD 8D B1         [ 4]  321     CALL BDIGS 
      00A65C CD A6 2E         [ 4]  322     CALL DDIGS 
      00A65F CD 85 B4         [ 4]  323     CALL RFROM 
      0025E2                        324     _QBRAN DDOT1 
      00A662 CD 85 18         [ 4]    1     CALL QBRAN
      00A665 A6 6F                    2     .word DDOT1
      0025E7                        325     _DOLIT '-' 
      00A667 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A66A 00 2D                    2     .word '-' 
      00A66C CD 8D C1         [ 4]  326     CALL HOLD 
      00A66F                        327 DDOT1: 
      00A66F CD 8E 16         [ 4]  328     CALL EDIGS 
      00A672 CD 8F 17         [ 4]  329     CALL TYPES     
      00A675 81               [ 4]  330     RET 
                                    331 
                                    332 
                                    333 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    334 ; multiply double by single 
                                    335 ; return double 
                                    336 ;  ( d s -- d )
                                    337 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025F6                        338     _HEADER DSSTAR,3,"DS*"
      00A676 A6 42                    1         .word LINK 
                           0025F8     2         LINK=.
      00A678 03                       3         .byte 3  
      00A679 44 53 2A                 4         .ascii "DS*"
      00A67C                          5         DSSTAR:
                                    339 ;DSSTAR:
      00A67C CD 85 D1         [ 4]  340     CALL TOR
      00A67F CD 86 08         [ 4]  341     CALL DUPP 
      00A682 CD 86 3F         [ 4]  342     CALL ZLESS
      00A685 CD 86 08         [ 4]  343     CALL DUPP 
      00A688 CD 85 D1         [ 4]  344     CALL TOR 
      00260B                        345     _QBRAN DSSTAR1 
      00A68B CD 85 18         [ 4]    1     CALL QBRAN
      00A68E A6 93                    2     .word DSSTAR1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      00A690 CD 88 6A         [ 4]  346     CALL DNEGA 
      00A693                        347 DSSTAR1:
      00A693 CD 85 B4         [ 4]  348     CALL RFROM 
      00A696 CD 87 EB         [ 4]  349     CALL NROT       
      00A699 CD 86 18         [ 4]  350     CALL SWAPP 
      00A69C CD 85 C5         [ 4]  351     CALL RAT 
      00A69F CD 8A 80         [ 4]  352     CALL UMSTA
      00A6A2 CD 87 CC         [ 4]  353     CALL ROT 
      00A6A5 CD 85 B4         [ 4]  354     CALL RFROM 
      00A6A8 CD 8A 80         [ 4]  355     CALL UMSTA 
      00A6AB CD 85 FE         [ 4]  356     CALL DROP ; DROP OVERFLOW 
      00A6AE CD 88 2D         [ 4]  357     CALL PLUS 
      00A6B1 CD 87 CC         [ 4]  358     CALL ROT 
      002634                        359     _QBRAN DSSTAR3 
      00A6B4 CD 85 18         [ 4]    1     CALL QBRAN
      00A6B7 A6 BC                    2     .word DSSTAR3
      00A6B9 CD 88 6A         [ 4]  360     CALL DNEGA 
      00A6BC                        361 DSSTAR3:
      00A6BC 81               [ 4]  362     RET 
                                    363 
                                    364 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    365 ;  2SWAP ( d1 d2 -- d2 d1 )
                                    366 ;  swap double 
                                    367 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00263D                        368     _HEADER DSWAP,5,"2SWAP"
      00A6BD A6 78                    1         .word LINK 
                           00263F     2         LINK=.
      00A6BF 05                       3         .byte 5  
      00A6C0 32 53 57 41 50           4         .ascii "2SWAP"
      00A6C5                          5         DSWAP:
      00A6C5 90 93            [ 1]  369     LDW Y,X 
      00A6C7 90 FE            [ 2]  370     LDW Y,(Y)
      00A6C9 90 BF 26         [ 2]  371     LDW YTEMP,Y ; d2 hi 
      00A6CC 90 93            [ 1]  372     LDW Y,X 
      00A6CE 90 EE 02         [ 2]  373     LDW Y,(2,Y)
      00A6D1 90 BF 24         [ 2]  374     LDW XTEMP,Y  ; d2 lo 
      00A6D4 90 93            [ 1]  375     LDW Y,X 
      00A6D6 90 EE 04         [ 2]  376     LDW Y,(4,Y)  ; d1 hi 
      00A6D9 FF               [ 2]  377     LDW (X),Y 
      00A6DA 90 93            [ 1]  378     LDW Y,X
      00A6DC 90 EE 06         [ 2]  379     LDW Y,(6,Y)  ; d1 lo 
      00A6DF EF 02            [ 2]  380     LDW (2,X),Y
      00A6E1 90 BE 26         [ 2]  381     LDW Y,YTEMP  
      00A6E4 EF 04            [ 2]  382     LDW (4,X),Y 
      00A6E6 90 BE 24         [ 2]  383     LDW Y,XTEMP 
      00A6E9 EF 06            [ 2]  384     LDW (6,X),Y 
      00A6EB 81               [ 4]  385     RET 
                                    386 
                                    387 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    388 ;    DCLZ ( d -- u )
                                    389 ;    double count leading zeros
                                    390 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00266C                        391     _HEADER DCLZ,4,"DCLZ"
      00A6EC A6 BF                    1         .word LINK 
                           00266E     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      00A6EE 04                       3         .byte 4  
      00A6EF 44 43 4C 5A              4         .ascii "DCLZ"
      00A6F3                          5         DCLZ:
      00A6F3 4F               [ 1]  392     CLR A 
      00A6F4 90 93            [ 1]  393     LDW Y,X 
      00A6F6 90 FE            [ 2]  394     LDW Y,(Y)
      00A6F8 2B 18            [ 1]  395     JRMI DCLZ8 ; no leading zero 
      00A6FA 27 09            [ 1]  396     JREQ DCLZ4 ; >=16 
      00A6FC                        397 DCLZ1: ; <16
      00A6FC 90 58            [ 2]  398     SLLW Y
      00A6FE 4C               [ 1]  399     INC A 
      00A6FF 90 5D            [ 2]  400     TNZW Y 
      00A701 2B 0F            [ 1]  401     JRMI DCLZ8
      00A703 20 F7            [ 2]  402     JRA DCLZ1 
      00A705                        403 DCLZ4:
      00A705 A6 10            [ 1]  404     LD A,#16 
      00A707 90 93            [ 1]  405     LDW Y,X 
      00A709 90 EE 02         [ 2]  406     LDW Y,(2,Y)
      00A70C 2B 04            [ 1]  407     JRMI DCLZ8 
      00A70E 26 EC            [ 1]  408     JRNE DCLZ1 
      00A710 AB 10            [ 1]  409     ADD A,#16
      00A712                        410 DCLZ8: 
      00A712 1C 00 02         [ 2]  411     ADDW X,#2 
      00A715 90 5F            [ 1]  412     CLRW Y 
      00A717 90 97            [ 1]  413     LD YL,A 
      00A719 FF               [ 2]  414     LDW (X),Y 
      00A71A 81               [ 4]  415     RET 
                                    416 
                                    417 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    418 ;   2<ROT ( d1 d2 d3 -- d3 d1 d2 )
                                    419 ;   rotate left doubles 
                                    420 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00269B                        421     _HEADER NDROT,5,"2<ROT"
      00A71B A6 EE                    1         .word LINK 
                           00269D     2         LINK=.
      00A71D 05                       3         .byte 5  
      00A71E 32 3C 52 4F 54           4         .ascii "2<ROT"
      00A723                          5         NDROT:
                                    422 ; save d3 in temp 
      00A723 90 93            [ 1]  423     LDW Y,X 
      00A725 90 FE            [ 2]  424     LDW Y,(Y)
      00A727 90 BF 26         [ 2]  425     LDW YTEMP,Y  ; d3 hi 
      00A72A 90 93            [ 1]  426     LDW Y,X 
      00A72C 90 EE 02         [ 2]  427     LDW Y,(2,Y)
      00A72F 90 BF 24         [ 2]  428     LDW XTEMP,Y  ; d3 lo 
                                    429 ; put d2 in d1 slot 
      00A732 90 93            [ 1]  430     LDW Y,X 
      00A734 90 EE 04         [ 2]  431     LDW Y,(4,Y) 
      00A737 FF               [ 2]  432     LDW (X),Y   ; d2 hi 
      00A738 90 93            [ 1]  433     LDW Y,X 
      00A73A 90 EE 06         [ 2]  434     LDW Y,(6,Y)
      00A73D EF 02            [ 2]  435     LDW (2,X),Y ; d2 lo
                                    436 ; put d1 in d2 slot 
      00A73F 90 93            [ 1]  437     LDW Y,X 
      00A741 90 EE 08         [ 2]  438     LDW Y,(8,Y) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      00A744 EF 04            [ 2]  439     LDW (4,X),Y ; d1 hi 
      00A746 90 93            [ 1]  440     LDW Y,X 
      00A748 90 EE 0A         [ 2]  441     LDW Y,(10,Y)
      00A74B EF 06            [ 2]  442     LDW (6,X),Y  ; d1 lo 
                                    443 ; put d3 in d1 slot 
      00A74D 90 BE 26         [ 2]  444     LDW Y,YTEMP 
      00A750 EF 08            [ 2]  445     LDW (8,X),Y  ; d3 hi 
      00A752 90 BE 24         [ 2]  446     LDW Y,XTEMP 
      00A755 EF 0A            [ 2]  447     LDW (10,X),Y  ; d3 lo 
      00A757 81               [ 4]  448     RET 
                                    449 
                                    450 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    451 ;   2ROT ( d1 d2 d3 -- d2 d3 d1 )
                                    452 ;   rotate right doubles 
                                    453 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026D8                        454     _HEADER DROT,4,"2ROT"
      00A758 A7 1D                    1         .word LINK 
                           0026DA     2         LINK=.
      00A75A 04                       3         .byte 4  
      00A75B 32 52 4F 54              4         .ascii "2ROT"
      00A75F                          5         DROT:
                                    455 ; save d3 in temp 
      00A75F 90 93            [ 1]  456     LDW Y,X 
      00A761 90 FE            [ 2]  457     LDW Y,(Y)
      00A763 90 BF 26         [ 2]  458     LDW YTEMP,Y ; d3 hi 
      00A766 90 93            [ 1]  459     LDW Y,X 
      00A768 90 EE 02         [ 2]  460     LDW Y,(2,Y)
      00A76B 90 BF 24         [ 2]  461     LDW XTEMP,Y ; d3 lo 
                                    462 ; put d1 in d3 slot 
      00A76E 90 93            [ 1]  463     LDW Y,X 
      00A770 90 EE 08         [ 2]  464     LDW Y,(8,Y)
      00A773 FF               [ 2]  465     LDW (X),Y  ; d1 hi 
      00A774 90 93            [ 1]  466     LDW Y,X 
      00A776 90 EE 0A         [ 2]  467     LDW Y,(10,Y) 
      00A779 EF 02            [ 2]  468     LDW (2,X),Y ; d1 lo 
                                    469 ; put d2 in d1 slot 
      00A77B 90 93            [ 1]  470     LDW Y,X 
      00A77D 90 EE 04         [ 2]  471     LDW Y,(4,Y) ; d2 hi 
      00A780 EF 08            [ 2]  472     LDW (8,X),Y 
      00A782 90 93            [ 1]  473     LDW Y,X 
      00A784 90 EE 06         [ 2]  474     LDW Y,(6,Y) ; d2 lo 
      00A787 EF 0A            [ 2]  475     LDW (10,X),Y 
                                    476 ; put d3 in d2 slot 
      00A789 90 BE 26         [ 2]  477     LDW Y,YTEMP 
      00A78C EF 04            [ 2]  478     LDW (4,X),Y 
      00A78E 90 BE 24         [ 2]  479     LDW Y,XTEMP 
      00A791 EF 06            [ 2]  480     LDW (6,X),Y 
      00A793 81               [ 4]  481     RET 
                                    482 
                                    483 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    484 ;   D= ( d1 d2 -- f )
                                    485 ;   d1==d2?
                                    486 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002714                        487     _HEADER DEQUAL,2,"D="
      00A794 A7 5A                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



                           002716     2         LINK=.
      00A796 02                       3         .byte 2  
      00A797 44 3D                    4         .ascii "D="
      00A799                          5         DEQUAL:
      00A799 A6 00            [ 1]  488     LD A,#0 
      00A79B 90 93            [ 1]  489     LDW Y,X 
      00A79D 90 FE            [ 2]  490     LDW Y,(Y)
      00A79F E3 04            [ 2]  491     CPW Y,(4,X)
      00A7A1 26 0B            [ 1]  492     JRNE DEQU4 
      00A7A3 90 93            [ 1]  493     LDW Y,X 
      00A7A5 90 EE 02         [ 2]  494     LDW Y,(2,Y)
      00A7A8 E3 06            [ 2]  495     CPW Y,(6,X)
      00A7AA 26 02            [ 1]  496     JRNE DEQU4 
      00A7AC A6 FF            [ 1]  497     LD A,#0XFF
      00A7AE                        498 DEQU4:
      00A7AE 1C 00 06         [ 2]  499     ADDW X,#6
      00A7B1 F7               [ 1]  500     LD (X),A 
      00A7B2 E7 01            [ 1]  501     LD (1,X),A 
      00A7B4 81               [ 4]  502     RET 
                                    503 
                                    504 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    505 ;   D> ( d1 d2 -- f )
                                    506 ;   d1>d2?
                                    507 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002735                        508     _HEADER DGREAT,2,"D>"
      00A7B5 A7 96                    1         .word LINK 
                           002737     2         LINK=.
      00A7B7 02                       3         .byte 2  
      00A7B8 44 3E                    4         .ascii "D>"
      00A7BA                          5         DGREAT:
      00A7BA A6 FF            [ 1]  509     LD A,#0XFF 
      00A7BC 90 93            [ 1]  510     LDW Y,X 
      00A7BE 90 EE 04         [ 2]  511     LDW Y,(4,Y)  ; d1 hi 
      00A7C1 F3               [ 2]  512     CPW Y,(X)    ; d2 hi 
      00A7C2 2C 0B            [ 1]  513     JRSGT DGREAT4 
      00A7C4 90 93            [ 1]  514     LDW Y,X 
      00A7C6 90 EE 06         [ 2]  515     LDW Y,(6,Y)
      00A7C9 E3 02            [ 2]  516     CPW Y,(2,X)
      00A7CB 22 02            [ 1]  517     JRUGT DGREAT4 
      00A7CD A6 00            [ 1]  518     LD A,#0
      00A7CF                        519 DGREAT4:
      00A7CF 1C 00 06         [ 2]  520     ADDW X,#6
      00A7D2 F7               [ 1]  521     LD (X),A 
      00A7D3 E7 01            [ 1]  522     LD (1,X),A 
      00A7D5 81               [ 4]  523     RET
                                    524 
                                    525 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    526 ;   D< ( d1 d2 -- f )
                                    527 ;   d1<d2? 
                                    528 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002756                        529     _HEADER DLESS,2,"D<"
      00A7D6 A7 B7                    1         .word LINK 
                           002758     2         LINK=.
      00A7D8 02                       3         .byte 2  
      00A7D9 44 3C                    4         .ascii "D<"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      00A7DB                          5         DLESS:
      00A7DB CD AB 3B         [ 4]  530     CALL DSUB
      00275E                        531     _DOLIT 0 
      00A7DE CD 84 EF         [ 4]    1     CALL DOLIT 
      00A7E1 00 00                    2     .word 0 
      00A7E3 CD 87 EB         [ 4]  532     CALL NROT  
      00A7E6 CD A7 F8         [ 4]  533     CALL DZLESS 
      002769                        534     _QBRAN DLESS4
      00A7E9 CD 85 18         [ 4]    1     CALL QBRAN
      00A7EC A7 F1                    2     .word DLESS4
      00A7EE CD 88 47         [ 4]  535     CALL INVER  
      00A7F1                        536 DLESS4:
      00A7F1 81               [ 4]  537     RET
                                    538 
                                    539 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    540 ;  D0< ( d -- f )
                                    541 ;  d<0? 
                                    542 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002772                        543     _HEADER DZLESS,3,"D0<"
      00A7F2 A7 D8                    1         .word LINK 
                           002774     2         LINK=.
      00A7F4 03                       3         .byte 3  
      00A7F5 44 30 3C                 4         .ascii "D0<"
      00A7F8                          5         DZLESS:
      00A7F8 A6 00            [ 1]  544     LD A,#0 
      00A7FA 90 93            [ 1]  545     LDW Y,X 
      00A7FC 90 FE            [ 2]  546     LDW Y,(Y)
      00A7FE 2A 02            [ 1]  547     JRPL DZLESS1 
      00A800 A6 FF            [ 1]  548     LD A,#0XFF 
      00A802                        549 DZLESS1:
      00A802 1C 00 02         [ 2]  550     ADDW X,#2 
      00A805 F7               [ 1]  551     LD (X),A 
      00A806 E7 01            [ 1]  552     LD (1,X),A    
      00A808 81               [ 4]  553     RET 
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
      002789                        565     _HEADER DCMP,4,"DCMP"
      00A809 A7 F4                    1         .word LINK 
                           00278B     2         LINK=.
      00A80B 04                       3         .byte 4  
      00A80C 44 43 4D 50              4         .ascii "DCMP"
      00A810                          5         DCMP:
      00A810 90 93            [ 1]  566     LDW Y,X 
      00A812 90 EE 04         [ 2]  567     LDW Y,(4,Y)
      00A815 F3               [ 2]  568     CPW Y,(X) 
      00A816 27 04            [ 1]  569     JREQ DCMP2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      00A818 2F 13            [ 1]  570     JRSLT DCMP_SMALL 
      00A81A 20 17            [ 2]  571     JRA  DCMP_GREAT 
      00A81C                        572 DCMP2:    
      00A81C 90 93            [ 1]  573     LDW Y,X 
      00A81E 90 EE 06         [ 2]  574     LDW Y,(6,Y)
      00A821 E3 02            [ 2]  575     CPW Y,(2,X)
      00A823 27 04            [ 1]  576     JREQ DCMP_EQUAL  
      00A825 25 06            [ 1]  577     JRULT DCMP_SMALL 
      00A827 20 0A            [ 2]  578     JRA DCMP_GREAT
      00A829                        579 DCMP_EQUAL:
      00A829 90 5F            [ 1]  580     CLRW Y 
      00A82B 20 0A            [ 2]  581     JRA DCMP4 
      00A82D                        582 DCMP_SMALL:
      00A82D 90 AE FF FF      [ 2]  583     LDW Y,#-1 
      00A831 20 04            [ 2]  584     JRA DCMP4 
      00A833                        585 DCMP_GREAT:
      00A833 90 AE 00 01      [ 2]  586     LDW Y,#1
      00A837                        587 DCMP4:
      00A837 1D 00 02         [ 2]  588     SUBW X,#2 
      00A83A FF               [ 2]  589     LDW (X),Y 
      00A83B 81               [ 4]  590     RET
                                    591 
                                    592 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    593 ;   2>R ( d -- R: d )
                                    594 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027BC                        595     _HEADER DTOR,3,"2>R"
      00A83C A8 0B                    1         .word LINK 
                           0027BE     2         LINK=.
      00A83E 03                       3         .byte 3  
      00A83F 32 3E 52                 4         .ascii "2>R"
      00A842                          5         DTOR:
      00A842 90 85            [ 2]  596     POPW Y 
      00A844 90 BF 26         [ 2]  597     LDW YTEMP,Y 
      00A847 90 93            [ 1]  598     LDW Y,X 
      00A849 90 EE 02         [ 2]  599     LDW Y,(2,Y)
      00A84C 90 89            [ 2]  600     PUSHW Y   ; d low 
      00A84E 90 93            [ 1]  601     LDW Y,X 
      00A850 90 FE            [ 2]  602     LDW Y,(Y)
      00A852 90 89            [ 2]  603     PUSHW Y   ; d hi 
      00A854 1C 00 04         [ 2]  604     ADDW X,#4  
      00A857 92 CC 26         [ 5]  605     JP [YTEMP]
                                    606 
                                    607 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    608 ;  2R> ( -- d ) R: d --      
                                    609 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027DA                        610     _HEADER DRFROM,3,"2R>"
      00A85A A8 3E                    1         .word LINK 
                           0027DC     2         LINK=.
      00A85C 03                       3         .byte 3  
      00A85D 32 52 3E                 4         .ascii "2R>"
      00A860                          5         DRFROM:
      00A860 90 85            [ 2]  611     POPW Y      ; d hi 
      00A862 90 BF 26         [ 2]  612     LDW YTEMP,Y 
      00A865 1D 00 04         [ 2]  613     SUBW X,#4
      00A868 90 85            [ 2]  614     POPW Y       ; d hi 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      00A86A FF               [ 2]  615     LDW (X),Y 
      00A86B 90 85            [ 2]  616     POPW Y       ; d low  
      00A86D EF 02            [ 2]  617     LDW (2,X),Y 
      00A86F 92 CC 26         [ 5]  618     JP [YTEMP]
                                    619     
                                    620 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    621 ;   2R@ ( -- d )
                                    622 ;   fecth a double from RSTACK
                                    623 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027F2                        624     _HEADER DRAT,3,"2R@"
      00A872 A8 5C                    1         .word LINK 
                           0027F4     2         LINK=.
      00A874 03                       3         .byte 3  
      00A875 32 52 40                 4         .ascii "2R@"
      00A878                          5         DRAT:
      00A878 90 85            [ 2]  625     POPW Y 
      00A87A 90 BF 26         [ 2]  626     LDW YTEMP,Y 
      00A87D 1D 00 04         [ 2]  627     SUBW X,#4 
      00A880 16 01            [ 2]  628     LDW Y,(1,SP)
      00A882 FF               [ 2]  629     LDW (X),Y 
      00A883 16 03            [ 2]  630     LDW Y,(3,SP)
      00A885 EF 02            [ 2]  631     LDW (2,X),Y 
      00A887 92 CC 26         [ 5]  632     JP [YTEMP]
                                    633 
                                    634 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    635 ;  2VARIABLE <name> 
                                    636 ;  create a double variable 
                                    637 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00280A                        638     _HEADER DVARIA,9,"2VARIABLE"
      00A88A A8 74                    1         .word LINK 
                           00280C     2         LINK=.
      00A88C 09                       3         .byte 9  
      00A88D 32 56 41 52 49 41 42     4         .ascii "2VARIABLE"
             4C 45
      00A896                          5         DVARIA:
      00A896 CD 8C 94         [ 4]  639         CALL HERE
      00A899 CD 86 08         [ 4]  640         CALL DUPP
      00281C                        641         _DOLIT 4  
      00A89C CD 84 EF         [ 4]    1     CALL DOLIT 
      00A89F 00 04                    2     .word 4 
      00A8A1 CD 88 2D         [ 4]  642         CALL PLUS 
      00A8A4 CD 87 5F         [ 4]  643         CALL VPP 
      00A8A7 CD 85 51         [ 4]  644         CALL STORE
      00A8AA CD 98 64         [ 4]  645         CALL CREAT
      00A8AD CD 86 08         [ 4]  646         CALL DUPP
      00A8B0 CD 94 D6         [ 4]  647         CALL COMMA
      00A8B3 CD 8B B7         [ 4]  648         CALL ZERO
      00A8B6 CD 86 30         [ 4]  649         CALL OVER 
      00A8B9 CD 85 51         [ 4]  650         CALL STORE 
      00A8BC CD 8B B7         [ 4]  651         CALL ZERO 
      00A8BF CD 86 18         [ 4]  652         CALL SWAPP 
      00A8C2 CD 85 51         [ 4]  653         CALL STORE
      00A8C5 CD A1 6A         [ 4]  654         CALL FMOVE ; move definition to FLASH
      00A8C8 CD 87 BB         [ 4]  655         CALL QDUP 
      00A8CB CD 85 18         [ 4]  656         CALL QBRAN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      00A8CE 98 B1                  657         .word SET_RAMLAST   
      00A8D0 CD 9C 12         [ 4]  658         call UPDATVP  ; don't update if variable kept in RAM.
      00A8D3 CD A1 FE         [ 4]  659         CALL UPDATPTR
      00A8D6 81               [ 4]  660         RET         
                                    661 
                                    662 
                                    663 
                                    664 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    665 ;  2LITERAL ( d -- )
                                    666 ;  compile double literal 
                                    667 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002857                        668     _HEADER DLITER,IMEDD+8,"2LITERAL"
      00A8D7 A8 8C                    1         .word LINK 
                           002859     2         LINK=.
      00A8D9 88                       3         .byte IMEDD+8  
      00A8DA 32 4C 49 54 45 52 41     4         .ascii "2LITERAL"
             4C
      00A8E2                          5         DLITER:
      00A8E2 CD 95 1B         [ 4]  669     CALL COMPI 
      00A8E5 A8 ED                  670     .word do2lit 
      00A8E7 CD 94 D6         [ 4]  671     CALL COMMA 
      00A8EA CC 94 D6         [ 2]  672     JP   COMMA 
                                    673 
                                    674 
                                    675 ; runtime for 2LITERAL 
      00A8ED                        676 do2lit:
      00A8ED 1D 00 04         [ 2]  677     SUBW X,#4 
      00A8F0 16 01            [ 2]  678     LDW Y,(1,SP)
      00A8F2 90 FE            [ 2]  679     LDW Y,(Y)
      00A8F4 FF               [ 2]  680     LDW (X),Y 
      00A8F5 16 01            [ 2]  681     LDW Y,(1,SP)
      00A8F7 90 EE 02         [ 2]  682     LDW Y,(2,Y)
      00A8FA EF 02            [ 2]  683     LDW (2,X),Y 
      00A8FC 90 85            [ 2]  684     POPW Y 
      00A8FE 90 EC 04         [ 2]  685     JP (4,Y)
                                    686 
                                    687 
                                    688 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    689 ;   2OVER ( d1 d2 -- d1 d2 d1 )
                                    690 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002881                        691     _HEADER DOVER,5,"2OVER"
      00A901 A8 D9                    1         .word LINK 
                           002883     2         LINK=.
      00A903 05                       3         .byte 5  
      00A904 32 4F 56 45 52           4         .ascii "2OVER"
      00A909                          5         DOVER:
      00A909 90 93            [ 1]  692     LDW Y,X 
      00A90B 1D 00 04         [ 2]  693     SUBW X,#4 
      00A90E 90 89            [ 2]  694     PUSHW Y 
      00A910 90 EE 04         [ 2]  695     LDW Y,(4,Y)  ; d1 hi 
      00A913 FF               [ 2]  696     LDW (X),Y 
      00A914 90 85            [ 2]  697     POPW Y 
      00A916 90 EE 06         [ 2]  698     LDW Y,(6,Y)  ;d1 lo 
      00A919 EF 02            [ 2]  699     LDW (2,X),Y 
      00A91B 81               [ 4]  700     RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



                                    701 
                                    702 
                                    703 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    704 ;   D2/ ( d -- d/2 )
                                    705 ;   divide double by 2 
                                    706 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00289C                        707     _HEADER D2SLASH,3,"D2/"
      00A91C A9 03                    1         .word LINK 
                           00289E     2         LINK=.
      00A91E 03                       3         .byte 3  
      00A91F 44 32 2F                 4         .ascii "D2/"
      00A922                          5         D2SLASH:
      00A922 90 93            [ 1]  708     LDW Y,X 
      00A924 90 FE            [ 2]  709     LDW Y,(Y)
      00A926 90 57            [ 2]  710     SRAW Y 
      00A928 FF               [ 2]  711     LDW (X),Y 
      00A929 90 93            [ 1]  712     LDW Y,X 
      00A92B 90 EE 02         [ 2]  713     LDW Y,(2,Y)
      00A92E 90 56            [ 2]  714     RRCW Y 
      00A930 EF 02            [ 2]  715     LDW (2,X),Y 
      00A932 81               [ 4]  716     RET
                                    717 
                                    718 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    719 ;  D2* ( d -- d*2 )
                                    720 ;  multiply double by 2 
                                    721 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028B3                        722     _HEADER D2STAR,3,"D2*"
      00A933 A9 1E                    1         .word LINK 
                           0028B5     2         LINK=.
      00A935 03                       3         .byte 3  
      00A936 44 32 2A                 4         .ascii "D2*"
      00A939                          5         D2STAR:
      00A939 90 93            [ 1]  723     LDW Y,X 
      00A93B 90 EE 02         [ 2]  724     LDW Y,(2,Y)
      00A93E 98               [ 1]  725     RCF 
      00A93F 90 59            [ 2]  726     RLCW Y 
      00A941 EF 02            [ 2]  727     LDW (2,X),Y 
      00A943 90 93            [ 1]  728     LDW Y,X 
      00A945 90 FE            [ 2]  729     LDW Y,(Y)
      00A947 90 59            [ 2]  730     RLCW Y 
      00A949 FF               [ 2]  731     LDW (X),Y 
      00A94A 81               [ 4]  732     RET 
                                    733 
                                    734 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    735 ;   DLSHIFT ( d n -- d )
                                    736 ;   left shift double 
                                    737 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028CB                        738     _HEADER DLSHIFT,7,"DLSHIFT"
      00A94B A9 35                    1         .word LINK 
                           0028CD     2         LINK=.
      00A94D 07                       3         .byte 7  
      00A94E 44 4C 53 48 49 46 54     4         .ascii "DLSHIFT"
      00A955                          5         DLSHIFT:
      00A955 E6 01            [ 1]  739     LD A,(1,X) ; shift count 
      00A957 1C 00 02         [ 2]  740     ADDW X,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      00A95A 90 93            [ 1]  741     LDW Y,X 
      00A95C 90 FE            [ 2]  742     LDW Y,(Y)
      00A95E 90 BF 26         [ 2]  743     LDW YTEMP,Y  ; d hi 
      00A961 90 93            [ 1]  744     LDW Y,X 
      00A963 90 EE 02         [ 2]  745     LDW Y,(2,Y)  ; d low 
      00A966                        746 DLSHIFT1:
      00A966 4D               [ 1]  747     TNZ A 
      00A967 27 12            [ 1]  748     JREQ DLSHIFT2 
      00A969 98               [ 1]  749     RCF 
      00A96A 90 59            [ 2]  750     RLCW Y 
      00A96C 90 89            [ 2]  751     PUSHW Y 
      00A96E 90 BE 26         [ 2]  752     LDW Y,YTEMP 
      00A971 90 59            [ 2]  753     RLCW Y 
      00A973 90 BF 26         [ 2]  754     LDW YTEMP,Y 
      00A976 90 85            [ 2]  755     POPW Y 
      00A978 4A               [ 1]  756     DEC A 
      00A979 20 EB            [ 2]  757     JRA DLSHIFT1 
      00A97B                        758 DLSHIFT2:
      00A97B EF 02            [ 2]  759     LDW (2,X),Y 
      00A97D 90 BE 26         [ 2]  760     LDW Y,YTEMP 
      00A980 FF               [ 2]  761     LDW (X),Y 
      00A981 81               [ 4]  762     RET 
                                    763 
                                    764 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    765 ;  DRSHIFT ( d n -- d )
                                    766 ;  shift right n bits 
                                    767 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002902                        768     _HEADER DRSHIFT,7,"DRSHIFT"
      00A982 A9 4D                    1         .word LINK 
                           002904     2         LINK=.
      00A984 07                       3         .byte 7  
      00A985 44 52 53 48 49 46 54     4         .ascii "DRSHIFT"
      00A98C                          5         DRSHIFT:
      00A98C E6 01            [ 1]  769     LD A,(1,X)
      00A98E A4 1F            [ 1]  770     AND A,#0X1F 
      00A990 1C 00 02         [ 2]  771     ADDW X,#2 
      00A993                        772 DRSHIFT1:
      00A993 4D               [ 1]  773     TNZ A 
      00A994 27 13            [ 1]  774     JREQ DRSHIFT2 
      00A996 90 93            [ 1]  775     LDW Y,X 
      00A998 90 FE            [ 2]  776     LDW Y,(Y)
      00A99A 90 57            [ 2]  777     SRAW Y 
      00A99C FF               [ 2]  778     LDW (X),Y 
      00A99D 90 93            [ 1]  779     LDW Y,X 
      00A99F 90 EE 02         [ 2]  780     LDW Y,(2,Y)
      00A9A2 90 56            [ 2]  781     RRCW Y 
      00A9A4 EF 02            [ 2]  782     LDW (2,X),Y 
      00A9A6 4A               [ 1]  783     DEC A
      00A9A7 20 EA            [ 2]  784     JRA DRSHIFT1  
      00A9A9                        785 DRSHIFT2:
      00A9A9 81               [ 4]  786     RET 
                                    787 
                                    788 
                                    789 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    790 ;   D* ( d1 d2 -- d3 )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



                                    791 ;   double product 
                                    792 ;   
                                    793 ;   d3 = d1 * d2
                                    794 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00292A                        795     _HEADER DSTAR,2,"D*"
      00A9AA A9 84                    1         .word LINK 
                           00292C     2         LINK=.
      00A9AC 02                       3         .byte 2  
      00A9AD 44 2A                    4         .ascii "D*"
      00A9AF                          5         DSTAR:
      00A9AF CD 86 08         [ 4]  796     CALL DUPP 
      00A9B2 CD 86 3F         [ 4]  797     CALL ZLESS  
      00A9B5 CD 85 D1         [ 4]  798     CALL TOR    ; R: d2sign 
      00A9B8 CD A5 A4         [ 4]  799     CALL DABS   
      00A9BB CD 85 B4         [ 4]  800     CALL RFROM 
      00A9BE CD 87 EB         [ 4]  801     CALL NROT  ; d1 d2s ud2
      00A9C1 CD A8 42         [ 4]  802     CALL DTOR  ; d1 d2s R: ud2  
      00A9C4 CD 85 D1         [ 4]  803     CALL TOR   ; d1 R: ud2 d2s   
      00A9C7 CD 86 08         [ 4]  804     CALL DUPP 
      00A9CA CD 86 3F         [ 4]  805     CALL ZLESS 
      00A9CD CD 85 B4         [ 4]  806     CALL RFROM 
      00A9D0 CD 86 8E         [ 4]  807     CALL XORR   
      00A9D3 CD 85 D1         [ 4]  808     CALL TOR   ; d1 R: ud2 prod_sign  
      00A9D6 CD A5 A4         [ 4]  809     CALL DABS ; ud1 R: ud2 ps  
      00A9D9 CD 85 B4         [ 4]  810     CALL RFROM  
      00A9DC CD 87 EB         [ 4]  811     CALL NROT   ; ps ud1 
      00A9DF CD 88 18         [ 4]  812     CALL DDUP   ; ps ud1 ud1  
      00A9E2 CD 85 B4         [ 4]  813     CALL RFROM  ; ps ud1 ud1 ud2hi 
      00A9E5 CD A6 7C         [ 4]  814     CALL DSSTAR ; ps ud1 dprodhi 
                                    815 ; shift partial product 16 bits left 
      00A9E8 CD 85 FE         [ 4]  816     CALL DROP   ; drop overflow 
      00A9EB CD 8B B7         [ 4]  817     CALL ZERO   ; ps ud1 prodhi 
      00A9EE CD 86 18         [ 4]  818     CALL SWAPP  
      00A9F1 CD A6 C5         [ 4]  819     CALL DSWAP  ; ps dprodhi ud1 
      00A9F4 CD 85 B4         [ 4]  820     CALL RFROM  ; ps dprodhi ud1 ud2lo
      00A9F7 CD A6 7C         [ 4]  821     CALL DSSTAR ; ps  dprodhi dprodlo 
      00A9FA CD AB 09         [ 4]  822     CALL DPLUS
      00A9FD CD 87 CC         [ 4]  823     CALL ROT    ; dprod ps 
      002980                        824     _QBRAN DDSTAR3 
      00AA00 CD 85 18         [ 4]    1     CALL QBRAN
      00AA03 AA 08                    2     .word DDSTAR3
      00AA05 CD 88 6A         [ 4]  825     CALL DNEGA 
      00AA08                        826 DDSTAR3:  
      00AA08 81               [ 4]  827     RET 
                                    828 
                                    829 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    830 ;   DD/MOD  ( d1 d2 -- dr dq )
                                    831 ;   double division dq=d1/d2
                                    832 ;   dr remainder double 
                                    833 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002989                        834     _HEADER DDSLMOD,6,"DD/MOD"  
      00AA09 A9 AC                    1         .word LINK 
                           00298B     2         LINK=.
      00AA0B 06                       3         .byte 6  
      00AA0C 44 44 2F 4D 4F 44        4         .ascii "DD/MOD"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      00AA12                          5         DDSLMOD:
      002992                        835     _DOLIT 0 
      00AA12 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AA15 00 00                    2     .word 0 
      00AA17 CD 85 D1         [ 4]  836     CALL TOR   ; R: sign 
      00AA1A 90 93            [ 1]  837     LDW Y,X     
      00AA1C 90 FE            [ 2]  838     LDW Y,(Y)
      00AA1E 2A 0C            [ 1]  839     JRPL DSLA1
      00AA20 CD 88 6A         [ 4]  840     CALL DNEGA  ; ud2 
      00AA23 CD 85 B4         [ 4]  841     CALL RFROM 
      00AA26 CD 88 47         [ 4]  842     CALL INVER 
      00AA29 CD 85 D1         [ 4]  843     CALL TOR  ; sign inverted 
      00AA2C                        844 DSLA1:
      0029AC                        845     _DOLIT 2 
      00AA2C CD 84 EF         [ 4]    1     CALL DOLIT 
      00AA2F 00 02                    2     .word 2 
      00AA31 CD 8C 10         [ 4]  846     CALL PICK 
      00AA34 CD 86 3F         [ 4]  847     CALL ZLESS 
      0029B7                        848     _QBRAN DSLA2
      00AA37 CD 85 18         [ 4]    1     CALL QBRAN
      00AA3A AA 4E                    2     .word DSLA2
      00AA3C CD A6 C5         [ 4]  849     CALL DSWAP 
      00AA3F CD 88 6A         [ 4]  850     CALL DNEGA  ; ud1 
      00AA42 CD A6 C5         [ 4]  851     CALL DSWAP  ; ud1 ud2 ( divident divisor )     
      00AA45 CD 85 B4         [ 4]  852     CALL RFROM 
      00AA48 CD 88 47         [ 4]  853     CALL INVER 
      00AA4B CD 85 D1         [ 4]  854     CALL TOR   ;  sign inverted again 
      00AA4E                        855 DSLA2:
                                    856 ; unsigned double division 
      00AA4E CD 8B B7         [ 4]  857     CALL ZERO 
      00AA51 CD 8B B7         [ 4]  858     CALL ZERO
      00AA54 CD A8 42         [ 4]  859     CALL DTOR ; quotient  R: sign qlo qhi 
      00AA57 CD A9 09         [ 4]  860     CALL DOVER 
      00AA5A CD A6 F3         [ 4]  861     CALL DCLZ ; n2, dividend leading zeros  
      00AA5D CD 85 D1         [ 4]  862     CALL TOR 
      00AA60 CD 88 18         [ 4]  863     CALL DDUP    
      00AA63 CD A6 F3         [ 4]  864     CALL DCLZ  ; n1, divisor leading zeros
      00AA66 CD 85 B4         [ 4]  865     CALL RFROM ; n1 n2 
      00AA69 CD 88 A6         [ 4]  866     CALL SUBB
      00AA6C CD 86 08         [ 4]  867     CALL DUPP   
      00AA6F CD 86 3F         [ 4]  868     CALL ZLESS 
      0029F2                        869     _TBRAN DSLA7 ; quotient is null 
      00AA72 CD 85 26         [ 4]    1     CALL TBRAN 
      00AA75 AA E5                    2     .word DSLA7 
      00AA77 CD 86 08         [ 4]  870     CALL DUPP 
      00AA7A CD 85 D1         [ 4]  871     CALL TOR    ; loop counter 
      00AA7D CD 86 08         [ 4]  872     CALL DUPP 
      00AA80 CD 85 D1         [ 4]  873     CALL TOR    ; need to copies 
      00AA83 CD 87 BB         [ 4]  874     CALL QDUP 
      002A06                        875     _QBRAN DSLA3
      00AA86 CD 85 18         [ 4]    1     CALL QBRAN
      00AA89 AA 8E                    2     .word DSLA3
      00AA8B CD A9 55         [ 4]  876     CALL DLSHIFT ; align divisor with dividend 
      00AA8E                        877 DSLA3: ; division loop -- dividend divisor  
      00AA8E 90 5F            [ 1]  878     CLRW Y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      00AA90 90 89            [ 2]  879     PUSHW Y  
      00AA92 CD A9 09         [ 4]  880     CALL DOVER 
      00AA95 CD A9 09         [ 4]  881     CALL DOVER 
      00AA98 CD A7 DB         [ 4]  882     CALL DLESS 
      002A1B                        883     _TBRAN DSLA4 
      00AA9B CD 85 26         [ 4]    1     CALL TBRAN 
      00AA9E AA B4                    2     .word DSLA4 
      00AAA0 90 85            [ 2]  884     POPW Y 
      00AAA2 72 A9 00 01      [ 2]  885     ADDW Y,#1 
      00AAA6 90 89            [ 2]  886     PUSHW Y    ; quotiend least bit 
      00AAA8 CD 88 18         [ 4]  887     CALL DDUP  ; dividend divisor divisor 
      00AAAB CD A8 42         [ 4]  888     CALL DTOR  
      00AAAE CD AB 3B         [ 4]  889     CALL DSUB  ; dividend-divisor 
      00AAB1 CD A8 60         [ 4]  890     CALL DRFROM  ; dividend- divisor  
      00AAB4                        891 DSLA4: ; shift quotient and add 1 bit 
      00AAB4 90 85            [ 2]  892     POPW Y 
      00AAB6 90 BF 26         [ 2]  893     LDW YTEMP,Y 
      00AAB9 16 07            [ 2]  894     LDW Y,(7,SP) ; quotient low 
      00AABB 98               [ 1]  895     RCF 
      00AABC 90 59            [ 2]  896     RLCW Y
      00AABE 17 07            [ 2]  897     LDW (7,SP),Y 
      00AAC0 16 05            [ 2]  898     LDW Y,(5,SP) ; quotient hi 
      00AAC2 90 59            [ 2]  899     RLCW Y 
      00AAC4 17 05            [ 2]  900     LDW (5,SP),Y 
      00AAC6 16 07            [ 2]  901     LDW Y,(7,SP) 
      00AAC8 72 B9 00 26      [ 2]  902     ADDW Y,YTEMP
      00AACC 17 07            [ 2]  903     LDW (7,SP),Y 
      00AACE 16 01            [ 2]  904     LDW Y,(1,SP) ; loop counter 
      00AAD0 90 5D            [ 2]  905     TNZW Y 
      00AAD2 27 14            [ 1]  906     JREQ DSLA8
      00AAD4 72 A2 00 01      [ 2]  907     SUBW Y,#1  
      00AAD8 17 01            [ 2]  908     LDW (1,SP),Y  
                                    909 ; shift dividend left 1 bit      
      00AADA CD A6 C5         [ 4]  910     CALL DSWAP 
      00AADD CD A9 39         [ 4]  911     CALL D2STAR 
      00AAE0 CD A6 C5         [ 4]  912     CALL DSWAP 
      00AAE3 20 A9            [ 2]  913     JRA DSLA3 
      00AAE5                        914 DSLA7:
      00AAE5 1C 00 02         [ 2]  915     ADDW X,#2 ; drop shift count  
      00AAE8                        916 DSLA8:
      00AAE8 1C 00 04         [ 2]  917     ADDW X,#4 ; drop divisor
      00AAEB CD 85 B4         [ 4]  918     CALL RFROM
      00AAEE CD 85 FE         [ 4]  919     CALL DROP   ; loop counter 
      00AAF1 CD 85 B4         [ 4]  920     CALL RFROM   ; shift count
      00AAF4 CD A9 8C         [ 4]  921     CALL DRSHIFT 
                                    922     ; quotient replace dividend 
      00AAF7 CD A8 60         [ 4]  923     CALL DRFROM  ; quotient 
      00AAFA 90 85            [ 2]  924     POPW Y ; sign 
      00AAFC 90 5D            [ 2]  925     TNZW Y 
      00AAFE 27 03            [ 1]  926     JREQ DSLA9 
      00AB00 CD 88 6A         [ 4]  927     CALL DNEGA ; remainder quotient 
      00AB03                        928 DSLA9: 
      00AB03 81               [ 4]  929     RET 
                                    930 
                                    931 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



                                    932 ;   D+ ( d1 d2 -- d3 )
                                    933 ;   add 2 doubles 
                                    934 ;   d3=d1+d2 
                                    935 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A84                        936     _HEADER DPLUS,2,"D+"
      00AB04 AA 0B                    1         .word LINK 
                           002A86     2         LINK=.
      00AB06 02                       3         .byte 2  
      00AB07 44 2B                    4         .ascii "D+"
      00AB09                          5         DPLUS:
      00AB09 90 93            [ 1]  937     LDW Y,X 
      00AB0B 90 FE            [ 2]  938     LDW Y,(Y)
      00AB0D 90 BF 26         [ 2]  939     LDW YTEMP,Y ; d2 hi 
      00AB10 90 93            [ 1]  940     LDW Y,X 
      00AB12 90 EE 02         [ 2]  941     LDW Y,(2,Y)
      00AB15 90 BF 24         [ 2]  942     LDW XTEMP,Y ; d2 lo 
      00AB18 1C 00 04         [ 2]  943     ADDW X,#4 
      00AB1B 90 93            [ 1]  944     LDW Y,X 
      00AB1D 90 EE 02         [ 2]  945     LDW Y,(2,Y) ; d1 lo
      00AB20 72 B9 00 24      [ 2]  946     ADDW Y,XTEMP
      00AB24 EF 02            [ 2]  947     LDW (2,X),Y 
      00AB26 90 93            [ 1]  948     LDW Y,X 
      00AB28 90 FE            [ 2]  949     LDW Y,(Y) ; d1 hi 
      00AB2A 24 04            [ 1]  950     JRNC DPLUS1 
      00AB2C 72 A9 00 01      [ 2]  951     ADDW Y,#1 
      00AB30                        952 DPLUS1: 
      00AB30 72 B9 00 26      [ 2]  953     ADDW Y,YTEMP 
      00AB34 FF               [ 2]  954     LDW (X),Y 
      00AB35 81               [ 4]  955     RET 
                                    956 
                                    957 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    958 ;   D- ( d1 d2 -- d3 )
                                    959 ;   d3=d1-d2 
                                    960 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002AB6                        961     _HEADER DSUB,2,"D-"
      00AB36 AB 06                    1         .word LINK 
                           002AB8     2         LINK=.
      00AB38 02                       3         .byte 2  
      00AB39 44 2D                    4         .ascii "D-"
      00AB3B                          5         DSUB:
      00AB3B 90 93            [ 1]  962     LDW Y,X 
      00AB3D 90 FE            [ 2]  963     LDW Y,(Y)
      00AB3F 90 BF 26         [ 2]  964     LDW YTEMP,Y ; d2 hi 
      00AB42 90 93            [ 1]  965     LDW Y,X 
      00AB44 90 EE 02         [ 2]  966     LDW Y,(2,Y)
      00AB47 90 BF 24         [ 2]  967     LDW XTEMP,Y ; d2 lo 
      00AB4A 1C 00 04         [ 2]  968     ADDW X,#4 
      00AB4D 90 93            [ 1]  969     LDW Y,X 
      00AB4F 90 EE 02         [ 2]  970     LDW Y,(2,Y) ; d1 lo
      00AB52 72 B2 00 24      [ 2]  971     SUBW Y,XTEMP
      00AB56 EF 02            [ 2]  972     LDW (2,X),Y 
      00AB58 90 93            [ 1]  973     LDW Y,X 
      00AB5A 90 FE            [ 2]  974     LDW Y,(Y) ; d1 hi 
      00AB5C 24 04            [ 1]  975     JRNC DSUB1 
      00AB5E 72 A2 00 01      [ 2]  976     SUBW Y,#1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      00AB62                        977 DSUB1: 
      00AB62 72 B2 00 26      [ 2]  978     SUBW Y,YTEMP 
      00AB66 FF               [ 2]  979     LDW (X),Y 
      00AB67 81               [ 4]  980     RET 
                                    981 
                                    982 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



                                   4548 .endif 
                           000001  4549 .if WANT_FLOAT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



                                   4550         .include "float.asm"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
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
      002AE8                         67     _HEADER FPSW,4,"FPSW"
      00AB68 AB 38                    1         .word LINK 
                           002AEA     2         LINK=.
      00AB6A 04                       3         .byte 4  
      00AB6B 46 50 53 57              4         .ascii "FPSW"
      00AB6F                          5         FPSW:
      00AB6F 90 AE 00 08      [ 2]   68 	LDW Y,#UFPSW  
      00AB73 1D 00 02         [ 2]   69 	SUBW X,#2
      00AB76 FF               [ 2]   70     LDW (X),Y
      00AB77 81               [ 4]   71     RET
                                     72 
                                     73 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     74 ;   FRESET ( -- )
                                     75 ;   reset FPSW variable 
                                     76 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
      002AF8                         77     _HEADER FRESET,6,"FRESET"
      00AB78 AB 6A                    1         .word LINK 
                           002AFA     2         LINK=.
      00AB7A 06                       3         .byte 6  
      00AB7B 46 52 45 53 45 54        4         .ascii "FRESET"
      00AB81                          5         FRESET:
      002B01                         78     _DOLIT 0 
      00AB81 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AB84 00 00                    2     .word 0 
      00AB86 CD AB 6F         [ 4]   79     CALL FPSW 
      00AB89 CD 85 51         [ 4]   80     CALL STORE 
      00AB8C 81               [ 4]   81     RET 
                                     82 
                                     83 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     84 ;   FINIT ( -- )
                                     85 ;   initialize floating point 
                                     86 ;   library 
                                     87 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B0D                         88     _HEADER FINIT,5,"FINIT"
      00AB8D AB 7A                    1         .word LINK 
                           002B0F     2         LINK=.
      00AB8F 05                       3         .byte 5  
      00AB90 46 49 4E 49 54           4         .ascii "FINIT"
      00AB95                          5         FINIT:
      00AB95 CD AB 81         [ 4]   89     CALL FRESET 
      00AB98 81               [ 4]   90     RET 
                                     91 
                                     92 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



                                     93 ;    FER ( -- u )
                                     94 ;    return FPSW value 
                                     95 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B19                         96     _HEADER FER,3,"FER"
      00AB99 AB 8F                    1         .word LINK 
                           002B1B     2         LINK=.
      00AB9B 03                       3         .byte 3  
      00AB9C 46 45 52                 4         .ascii "FER"
      00AB9F                          5         FER:
      00AB9F CD AB 6F         [ 4]   97     CALL FPSW 
      00ABA2 CD 85 63         [ 4]   98     CALL AT 
      00ABA5 81               [ 4]   99     RET 
                                    100 
                                    101 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    102 ;    FZE  ( -- z )
                                    103 ;    return FPSW zero flag 
                                    104 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B26                        105     _HEADER FZE,3,"FZE"
      00ABA6 AB 9B                    1         .word LINK 
                           002B28     2         LINK=.
      00ABA8 03                       3         .byte 3  
      00ABA9 46 5A 45                 4         .ascii "FZE"
      00ABAC                          5         FZE:
      00ABAC CD AB 6F         [ 4]  106     CALL FPSW
      00ABAF CD 85 63         [ 4]  107     CALL AT  
      002B32                        108     _DOLIT 1
      00ABB2 CD 84 EF         [ 4]    1     CALL DOLIT 
      00ABB5 00 01                    2     .word 1 
      00ABB7 CD 86 65         [ 4]  109     CALL ANDD 
      00ABBA 81               [ 4]  110     RET 
                                    111 
                                    112 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    113 ;    FNE ( -- n )
                                    114 ;    return FPSW negative flag 
                                    115 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B3B                        116     _HEADER FNE,3,"FNE"
      00ABBB AB A8                    1         .word LINK 
                           002B3D     2         LINK=.
      00ABBD 03                       3         .byte 3  
      00ABBE 46 4E 45                 4         .ascii "FNE"
      00ABC1                          5         FNE:
      00ABC1 CD AB 6F         [ 4]  117     CALL FPSW 
      00ABC4 CD 85 63         [ 4]  118     CALL AT 
      002B47                        119     _DOLIT 2 
      00ABC7 CD 84 EF         [ 4]    1     CALL DOLIT 
      00ABCA 00 02                    2     .word 2 
      00ABCC CD 86 65         [ 4]  120     CALL ANDD 
      00ABCF 81               [ 4]  121     RET 
                                    122 
                                    123 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    124 ;   FOV (A -- v )
                                    125 ;   return FPSW overflow flag 
                                    126 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B50                        127     _HEADER FOV,3,"FOV"
      00ABD0 AB BD                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



                           002B52     2         LINK=.
      00ABD2 03                       3         .byte 3  
      00ABD3 46 4F 56                 4         .ascii "FOV"
      00ABD6                          5         FOV:
      00ABD6 CD AB 6F         [ 4]  128     CALL FPSW
      00ABD9 CD 85 63         [ 4]  129     CALL AT  
      002B5C                        130     _DOLIT 4 
      00ABDC CD 84 EF         [ 4]    1     CALL DOLIT 
      00ABDF 00 04                    2     .word 4 
      00ABE1 CD 86 65         [ 4]  131     CALL ANDD 
      00ABE4 81               [ 4]  132     RET 
                                    133 
                                    134 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    135 ;    SFZ ( f# -- f# )
                                    136 ;    set FPSW zero flag 
                                    137 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B65                        138     _HEADER SFZ,3,"SFZ"
      00ABE5 AB D2                    1         .word LINK 
                           002B67     2         LINK=.
      00ABE7 03                       3         .byte 3  
      00ABE8 53 46 5A                 4         .ascii "SFZ"
      00ABEB                          5         SFZ:
      00ABEB CD 88 18         [ 4]  139     CALL DDUP 
      00ABEE CD AB 9F         [ 4]  140     CALL FER 
      002B71                        141     _DOLIT 0xfffe 
      00ABF1 CD 84 EF         [ 4]    1     CALL DOLIT 
      00ABF4 FF FE                    2     .word 0xfffe 
      00ABF6 CD 86 65         [ 4]  142     CALL ANDD 
      00ABF9 CD 85 D1         [ 4]  143     CALL TOR    
      002B7C                        144     _DOLIT 0x807F 
      00ABFC CD 84 EF         [ 4]    1     CALL DOLIT 
      00ABFF 80 7F                    2     .word 0x807F 
      00AC01 CD 86 65         [ 4]  145     CALL ANDD 
      00AC04 CD A5 5C         [ 4]  146     CALL DZEQUAL 
      002B87                        147     _DOLIT 1 
      00AC07 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AC0A 00 01                    2     .word 1 
      00AC0C CD 86 65         [ 4]  148     CALL ANDD 
      00AC0F CD 85 B4         [ 4]  149     CALL RFROM 
      00AC12 CD 86 79         [ 4]  150     CALL ORR 
      00AC15 CD AB 6F         [ 4]  151     CALL FPSW 
      00AC18 CD 85 51         [ 4]  152     CALL STORE 
      00AC1B 81               [ 4]  153     RET 
                                    154 
                                    155 
                                    156 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    157 ;   SFN ( f# -- f# )
                                    158 ;   set FPSW negative flag 
                                    159 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B9C                        160     _HEADER SFN,3,"SFN"
      00AC1C AB E7                    1         .word LINK 
                           002B9E     2         LINK=.
      00AC1E 03                       3         .byte 3  
      00AC1F 53 46 4E                 4         .ascii "SFN"
      00AC22                          5         SFN:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      00AC22 CD 86 08         [ 4]  161     CALL DUPP  
      00AC25 CD AB 9F         [ 4]  162     CALL FER 
      002BA8                        163     _DOLIT 0xFFFD 
      00AC28 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AC2B FF FD                    2     .word 0xFFFD 
      00AC2D CD 86 65         [ 4]  164     CALL ANDD  
      00AC30 CD 85 D1         [ 4]  165     CALL TOR 
      002BB3                        166     _DOLIT 0x8000
      00AC33 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AC36 80 00                    2     .word 0x8000 
      00AC38 CD 86 65         [ 4]  167     CALL ANDD
      00AC3B 90 93            [ 1]  168     LDW Y,X 
      00AC3D 90 FE            [ 2]  169     LDW Y,(Y)
      00AC3F 98               [ 1]  170     RCF 
      00AC40 90 59            [ 2]  171     RLCW Y 
      00AC42 90 59            [ 2]  172     RLCW Y 
      00AC44 90 59            [ 2]  173     RLCW Y 
      00AC46 FF               [ 2]  174     LDW (X),Y 
      00AC47 CD 85 B4         [ 4]  175     CALL RFROM 
      00AC4A CD 86 79         [ 4]  176     CALL ORR 
      00AC4D CD AB 6F         [ 4]  177     CALL FPSW
      00AC50 CD 85 51         [ 4]  178     CALL STORE 
      00AC53 81               [ 4]  179     RET 
                                    180 
                                    181 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    182 ;   SFV ( -- )
                                    183 ;   set overflow flag 
                                    184 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BD4                        185     _HEADER SFV,3,"SFV"
      00AC54 AC 1E                    1         .word LINK 
                           002BD6     2         LINK=.
      00AC56 03                       3         .byte 3  
      00AC57 53 46 56                 4         .ascii "SFV"
      00AC5A                          5         SFV:
      00AC5A CD AB 6F         [ 4]  186     CALL FPSW 
      00AC5D CD 85 63         [ 4]  187     CALL AT 
      002BE0                        188     _DOLIT 4 
      00AC60 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AC63 00 04                    2     .word 4 
      00AC65 CD 86 79         [ 4]  189     CALL ORR 
      00AC68 CD AB 6F         [ 4]  190     CALL FPSW 
      00AC6B CD 85 51         [ 4]  191     CALL STORE 
      00AC6E 81               [ 4]  192     RET 
                                    193 
                                    194 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    195 ;  F>ME ( f# -- m e )
                                    196 ;  split float in mantissa/exponent 
                                    197 ;  m mantissa as a double 
                                    198 ;  e exponent as a single 
                                    199 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BEF                        200     _HEADER ATEXP,4,"F>ME"             
      00AC6F AC 56                    1         .word LINK 
                           002BF1     2         LINK=.
      00AC71 04                       3         .byte 4  
      00AC72 46 3E 4D 45              4         .ascii "F>ME"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      00AC76                          5         ATEXP:
      00AC76 CD AB 81         [ 4]  201     CALL FRESET
      00AC79 CD AC 22         [ 4]  202     CALL SFN
      00AC7C CD AB EB         [ 4]  203     CALL SFZ 
      00AC7F CD 86 08         [ 4]  204     CALL DUPP
      002C02                        205     _DOLIT 0X7F80 
      00AC82 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AC85 7F 80                    2     .word 0X7F80 
      00AC87 CD 86 65         [ 4]  206     CALL ANDD 
      002C0A                        207     _DOLIT 7 
      00AC8A CD 84 EF         [ 4]    1     CALL DOLIT 
      00AC8D 00 07                    2     .word 7 
      00AC8F CD 8B 85         [ 4]  208     CALL RSHIFT
      002C12                        209     _DOLIT 127 
      00AC92 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AC95 00 7F                    2     .word 127 
      00AC97 CD 88 A6         [ 4]  210     CALL SUBB
      00AC9A CD 85 D1         [ 4]  211     CALL TOR 
      002C1D                        212     _DOLIT 0x7F
      00AC9D CD 84 EF         [ 4]    1     CALL DOLIT 
      00ACA0 00 7F                    2     .word 0x7F 
      00ACA2 CD 86 65         [ 4]  213     CALL ANDD  ; mantissa as double  
      00ACA5 CD AB C1         [ 4]  214     CALL FNE 
      002C28                        215     _QBRAN POSMANT 
      00ACA8 CD 85 18         [ 4]    1     CALL QBRAN
      00ACAB AC B0                    2     .word POSMANT
      00ACAD CD A5 7A         [ 4]  216     CALL DNEGAT 
      00ACB0                        217 POSMANT:
      00ACB0 CD 85 B4         [ 4]  218     CALL RFROM 
      00ACB3 81               [ 4]  219     RET 
                                    220 
                                    221 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    222 ;    ME>F ( m e -- f# )
                                    223 ;    built float from mantissa/exponent 
                                    224 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C34                        225     _HEADER STEXP,4,"ME>F"
      00ACB4 AC 71                    1         .word LINK 
                           002C36     2         LINK=.
      00ACB6 04                       3         .byte 4  
      00ACB7 4D 45 3E 46              4         .ascii "ME>F"
      00ACBB                          5         STEXP:
      00ACBB CD 86 08         [ 4]  226     CALL DUPP 
      00ACBE CD 88 C0         [ 4]  227     CALL ABSS 
      002C41                        228     _DOLIT 127 
      00ACC1 CD 84 EF         [ 4]    1     CALL DOLIT 
      00ACC4 00 7F                    2     .word 127 
      00ACC6 CD 89 2A         [ 4]  229     CALL UGREAT
      002C49                        230     _QBRAN STEXP1
      00ACC9 CD 85 18         [ 4]    1     CALL QBRAN
      00ACCC AC D1                    2     .word STEXP1
      00ACCE CD AC 5A         [ 4]  231     CALL SFV  
      00ACD1                        232 STEXP1:
      002C51                        233     _DOLIT 127 
      00ACD1 CD 84 EF         [ 4]    1     CALL DOLIT 
      00ACD4 00 7F                    2     .word 127 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      00ACD6 CD 88 2D         [ 4]  234     CALL PLUS 
      002C59                        235     _DOLIT 0XFF 
      00ACD9 CD 84 EF         [ 4]    1     CALL DOLIT 
      00ACDC 00 FF                    2     .word 0XFF 
      00ACDE CD 86 65         [ 4]  236     CALL ANDD 
      002C61                        237     _DOLIT 7 
      00ACE1 CD 84 EF         [ 4]    1     CALL DOLIT 
      00ACE4 00 07                    2     .word 7 
      00ACE6 CD 8B 69         [ 4]  238     CALL LSHIFT 
      00ACE9 CD 85 D1         [ 4]  239     CALL TOR   ; R: e 
      00ACEC CD 86 08         [ 4]  240     CALL DUPP 
      002C6F                        241     _DOLIT 0X8000 
      00ACEF CD 84 EF         [ 4]    1     CALL DOLIT 
      00ACF2 80 00                    2     .word 0X8000 
      00ACF4 CD 86 65         [ 4]  242     CALL ANDD 
      002C77                        243     _QBRAN STEXP2 
      00ACF7 CD 85 18         [ 4]    1     CALL QBRAN
      00ACFA AD 0D                    2     .word STEXP2
      002C7C                        244     _DOLIT 0X8000 
      00ACFC CD 84 EF         [ 4]    1     CALL DOLIT 
      00ACFF 80 00                    2     .word 0X8000 
      00AD01 CD 85 B4         [ 4]  245     CALL RFROM 
      00AD04 CD 86 79         [ 4]  246     CALL ORR
      00AD07 CD 85 D1         [ 4]  247     CALL TOR
      00AD0A CD A5 7A         [ 4]  248     CALL DNEGAT  
      00AD0D                        249 STEXP2:
      00AD0D CD 86 08         [ 4]  250     CALL DUPP 
      002C90                        251     _DOLIT 0X7F
      00AD10 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD13 00 7F                    2     .word 0X7F 
      00AD15 CD 89 2A         [ 4]  252     CALL UGREAT 
      002C98                        253     _QBRAN STEXP3 
      00AD18 CD 85 18         [ 4]    1     CALL QBRAN
      00AD1B AD 20                    2     .word STEXP3
      00AD1D CD AC 5A         [ 4]  254     CALL SFV 
      00AD20                        255 STEXP3:
      002CA0                        256     _DOLIT 0X7F 
      00AD20 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD23 00 7F                    2     .word 0X7F 
      00AD25 CD 86 65         [ 4]  257     CALL ANDD 
      00AD28 CD 85 B4         [ 4]  258     CALL RFROM 
      00AD2B CD 86 79         [ 4]  259     CALL ORR 
      00AD2E CD AB EB         [ 4]  260     CALL SFZ 
      00AD31 CD AC 22         [ 4]  261     CALL SFN 
      00AD34 81               [ 4]  262     RET 
                                    263 
                                    264 
                                    265 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    266 ;   E. ( f# -- )
                                    267 ;   print float in scientific 
                                    268 ;   format 
                                    269 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002CB5                        270     _HEADER EDOT,2,"E."
      00AD35 AC B6                    1         .word LINK 
                           002CB7     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



      00AD37 02                       3         .byte 2  
      00AD38 45 2E                    4         .ascii "E."
      00AD3A                          5         EDOT:
      00AD3A CD 86 CE         [ 4]  271     CALL BASE 
      00AD3D CD 85 63         [ 4]  272     CALL AT 
      00AD40 CD 85 D1         [ 4]  273     CALL TOR 
      002CC3                        274     _DOLIT 10 
      00AD43 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD46 00 0A                    2     .word 10 
      00AD48 CD 86 CE         [ 4]  275     CALL BASE 
      00AD4B CD 85 51         [ 4]  276     CALL STORE 
      00AD4E CD AC 76         [ 4]  277     CALL ATEXP ; m e 
      00AD51                        278 EDOT0:
      00AD51 CD 85 D1         [ 4]  279     CALL TOR   
      00AD54 CD AB C1         [ 4]  280     CALL FNE 
      002CD7                        281     _QBRAN EDOT1
      00AD57 CD 85 18         [ 4]    1     CALL QBRAN
      00AD5A AD 5F                    2     .word EDOT1
      00AD5C CD A5 7A         [ 4]  282     CALL DNEGAT
      00AD5F                        283 EDOT1:
      00AD5F CD 8E ED         [ 4]  284     CALL SPACE 
      00AD62 CD 8D B1         [ 4]  285     CALL BDIGS     
      00AD65                        286 EDOT2: 
      00AD65 CD A6 15         [ 4]  287     CALL DDIG
      00AD68 CD 85 B4         [ 4]  288     CALL RFROM 
      00AD6B CD 8B 4B         [ 4]  289     CALL ONEP 
      00AD6E CD 85 D1         [ 4]  290     CALL TOR 
      00AD71 CD 86 08         [ 4]  291     CALL DUPP
      002CF4                        292     _QBRAN EDOT3 
      00AD74 CD 85 18         [ 4]    1     CALL QBRAN
      00AD77 AD 7E                    2     .word EDOT3
      002CF9                        293     _BRAN EDOT2  
      00AD79 CD 85 34         [ 4]    1     CALL BRAN 
      00AD7C AD 65                    2     .word EDOT2 
      00AD7E                        294 EDOT3:
      00AD7E CD 86 30         [ 4]  295     CALL OVER 
      00AD81 CD 86 CE         [ 4]  296     CALL BASE 
      00AD84 CD 85 63         [ 4]  297     CALL AT 
      00AD87 CD 88 ED         [ 4]  298     CALL ULESS 
      002D0A                        299     _QBRAN EDOT2 
      00AD8A CD 85 18         [ 4]    1     CALL QBRAN
      00AD8D AD 65                    2     .word EDOT2
      002D0F                        300     _DOLIT '.'
      00AD8F CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD92 00 2E                    2     .word '.' 
      00AD94 CD 8D C1         [ 4]  301     CALL HOLD  
      00AD97 CD A6 15         [ 4]  302     CALL DDIG
      00AD9A CD AB C1         [ 4]  303     CALL FNE 
      002D1D                        304     _QBRAN EDOT4 
      00AD9D CD 85 18         [ 4]    1     CALL QBRAN
      00ADA0 AD AD                    2     .word EDOT4
      002D22                        305     _DOLIT '-'
      00ADA2 CD 84 EF         [ 4]    1     CALL DOLIT 
      00ADA5 00 2D                    2     .word '-' 
      00ADA7 CD 8D C1         [ 4]  306     CALL HOLD 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



      00ADAA CD 85 FE         [ 4]  307     CALL DROP 
      00ADAD                        308 EDOT4:       
      00ADAD CD 8E 16         [ 4]  309     CALL EDIGS 
      00ADB0 CD 8F 17         [ 4]  310     CALL TYPES
      00ADB3 CD 85 B4         [ 4]  311     CALL RFROM 
      00ADB6 CD 87 BB         [ 4]  312     CALL QDUP 
      002D39                        313     _QBRAN EDOT5     
      00ADB9 CD 85 18         [ 4]    1     CALL QBRAN
      00ADBC AD C9                    2     .word EDOT5
      002D3E                        314     _DOLIT 'E'
      00ADBE CD 84 EF         [ 4]    1     CALL DOLIT 
      00ADC1 00 45                    2     .word 'E' 
      00ADC3 CD 84 B6         [ 4]  315     CALL EMIT 
      00ADC6 CD 8F D6         [ 4]  316     CALL DOT
      00ADC9                        317 EDOT5: 
      00ADC9 CD 85 B4         [ 4]  318     CALL RFROM 
      00ADCC CD 86 CE         [ 4]  319     CALL BASE 
      00ADCF CD 85 51         [ 4]  320     CALL STORE  
      00ADD2 81               [ 4]  321     RET 
                                    322 
                                    323 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                    324 ;   F. (f# -- )
                                    325 ;   print float in fixed
                                    326 ;   point format. 
                                    327 ;;;;;;;;;;;;;;;;;;;;;;;;;
      002D53                        328     _HEADER FDOT,2,"F."
      00ADD3 AD 37                    1         .word LINK 
                           002D55     2         LINK=.
      00ADD5 02                       3         .byte 2  
      00ADD6 46 2E                    4         .ascii "F."
      00ADD8                          5         FDOT:
      00ADD8 CD 86 CE         [ 4]  329     CALL BASE 
      00ADDB CD 85 63         [ 4]  330     CALL AT 
      00ADDE CD 85 D1         [ 4]  331     CALL TOR 
      002D61                        332     _DOLIT 10 
      00ADE1 CD 84 EF         [ 4]    1     CALL DOLIT 
      00ADE4 00 0A                    2     .word 10 
      00ADE6 CD 86 CE         [ 4]  333     CALL BASE 
      00ADE9 CD 85 51         [ 4]  334     CALL STORE 
      00ADEC CD AC 76         [ 4]  335     CALL    ATEXP
      00ADEF CD 86 08         [ 4]  336     CALL    DUPP  
      00ADF2 CD 88 C0         [ 4]  337     CALL    ABSS 
      002D75                        338     _DOLIT  8
      00ADF5 CD 84 EF         [ 4]    1     CALL DOLIT 
      00ADF8 00 08                    2     .word 8 
      00ADFA CD 89 49         [ 4]  339     CALL    GREAT 
      002D7D                        340     _QBRAN  FDOT1 
      00ADFD CD 85 18         [ 4]    1     CALL QBRAN
      00AE00 AE 05                    2     .word FDOT1
      00AE02 CC AD 51         [ 2]  341     JP      EDOT0 
      00AE05                        342 FDOT1:
      00AE05 CD 8E ED         [ 4]  343     CALL    SPACE 
      00AE08 CD 85 D1         [ 4]  344     CALL    TOR 
      00AE0B CD AB C1         [ 4]  345     CALL    FNE 
      002D8E                        346     _QBRAN  FDOT0 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      00AE0E CD 85 18         [ 4]    1     CALL QBRAN
      00AE11 AE 16                    2     .word FDOT0
      00AE13 CD A5 7A         [ 4]  347     CALL    DNEGAT 
      00AE16                        348 FDOT0: 
      00AE16 CD 8D B1         [ 4]  349     CALL    BDIGS
      00AE19 CD 85 C5         [ 4]  350     CALL    RAT  
      00AE1C CD 86 3F         [ 4]  351     CALL    ZLESS 
      002D9F                        352     _QBRAN  FDOT6 
      00AE1F CD 85 18         [ 4]    1     CALL QBRAN
      00AE22 AE 4D                    2     .word FDOT6
      00AE24                        353 FDOT2: ; e<0 
      00AE24 CD A6 15         [ 4]  354     CALL    DDIG 
      00AE27 CD 85 B4         [ 4]  355     CALL    RFROM
      00AE2A CD 8B 4B         [ 4]  356     CALL    ONEP 
      00AE2D CD 87 BB         [ 4]  357     CALL    QDUP 
      002DB0                        358     _QBRAN  FDOT3 
      00AE30 CD 85 18         [ 4]    1     CALL QBRAN
      00AE33 AE 3D                    2     .word FDOT3
      00AE35 CD 85 D1         [ 4]  359     CALL    TOR 
      002DB8                        360     _BRAN   FDOT2 
      00AE38 CD 85 34         [ 4]    1     CALL BRAN 
      00AE3B AE 24                    2     .word FDOT2 
      00AE3D                        361 FDOT3:
      002DBD                        362     _DOLIT  '.' 
      00AE3D CD 84 EF         [ 4]    1     CALL DOLIT 
      00AE40 00 2E                    2     .word '.' 
      00AE42 CD 8D C1         [ 4]  363     CALL    HOLD 
      00AE45 CD A6 2E         [ 4]  364     CALL    DDIGS
      002DC8                        365     _BRAN   FDOT9  
      00AE48 CD 85 34         [ 4]    1     CALL BRAN 
      00AE4B AE 62                    2     .word FDOT9 
      00AE4D                        366 FDOT6: ; e>=0 
      002DCD                        367     _BRAN   FDOT8
      00AE4D CD 85 34         [ 4]    1     CALL BRAN 
      00AE50 AE 5A                    2     .word FDOT8 
      00AE52                        368 FDOT7:     
      002DD2                        369     _DOLIT  '0'
      00AE52 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AE55 00 30                    2     .word '0' 
      00AE57 CD 8D C1         [ 4]  370     CALL    HOLD 
      00AE5A                        371 FDOT8:
      00AE5A CD 85 03         [ 4]  372     CALL    DONXT 
      00AE5D AE 52                  373     .word   FDOT7
      00AE5F CD A6 2E         [ 4]  374     CALL    DDIGS 
      00AE62                        375 FDOT9:
      00AE62 CD AB C1         [ 4]  376     CALL    FNE 
      002DE5                        377     _QBRAN  FDOT10 
      00AE65 CD 85 18         [ 4]    1     CALL QBRAN
      00AE68 AE 72                    2     .word FDOT10
      002DEA                        378     _DOLIT '-' 
      00AE6A CD 84 EF         [ 4]    1     CALL DOLIT 
      00AE6D 00 2D                    2     .word '-' 
      00AE6F CD 8D C1         [ 4]  379     CALL   HOLD 
      00AE72                        380 FDOT10:
      00AE72 CD 8E 16         [ 4]  381     CALL    EDIGS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      00AE75 CD 8F 17         [ 4]  382     CALL    TYPES 
      00AE78 CD 85 B4         [ 4]  383     CALL    RFROM 
      00AE7B CD 86 CE         [ 4]  384     CALL    BASE 
      00AE7E CD 85 51         [ 4]  385     CALL    STORE 
      00AE81 81               [ 4]  386     RET 
                                    387 
                                    388 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    389 ; return parsed exponent or 
                                    390 ; 0 if failed
                                    391 ; at entry exprect *a=='E'    
                                    392 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00AE82                        393 parse_exponent: ; a cntr -- e -1 | 0 
      00AE82 CD 85 D1         [ 4]  394     CALL TOR   ; R: cntr 
      00AE85 CD 86 08         [ 4]  395     CALL DUPP 
      00AE88 CD 85 81         [ 4]  396     CALL CAT 
      002E0B                        397     _DOLIT 'E' 
      00AE8B CD 84 EF         [ 4]    1     CALL DOLIT 
      00AE8E 00 45                    2     .word 'E' 
      00AE90 CD 88 CE         [ 4]  398     CALL EQUAL 
      002E13                        399     _QBRAN 1$
      00AE93 CD 85 18         [ 4]    1     CALL QBRAN
      00AE96 AE C3                    2     .word 1$
      00AE98 CD 8B 4B         [ 4]  400     CALL ONEP 
      00AE9B CD 85 B4         [ 4]  401     CALL RFROM  ; a cntr 
      00AE9E CD 8B 58         [ 4]  402     CALL ONEM
      00AEA1 CD 86 08         [ 4]  403     CALL DUPP 
      002E24                        404     _QBRAN 2$ ; a cntr 
      00AEA4 CD 85 18         [ 4]    1     CALL QBRAN
      00AEA7 AE C6                    2     .word 2$
      00AEA9 CD 8B B7         [ 4]  405     CALL ZERO
      00AEAC CD 86 08         [ 4]  406     CALL DUPP 
      00AEAF CD A6 C5         [ 4]  407     CALL DSWAP ; 0 0 a cntr  
      00AEB2 CD A4 0A         [ 4]  408     CALL nsign 
      00AEB5 CD 85 D1         [ 4]  409     CALL TOR   ; R: esign  
      00AEB8 CD A4 42         [ 4]  410     CALL parse_digits
      002E3B                        411     _QBRAN PARSEXP_SUCCESS ; parsed to end of string 
      00AEBB CD 85 18         [ 4]    1     CALL QBRAN
      00AEBE AE CD                    2     .word PARSEXP_SUCCESS
                                    412 ; failed invalid character
      00AEC0 CD 88 0D         [ 4]  413     CALL DDROP ; 0 a 
      00AEC3                        414 1$: 
      00AEC3 CD 85 B4         [ 4]  415     CALL RFROM ; sign||cntr  
      00AEC6                        416 2$:
      00AEC6 CD 88 0D         [ 4]  417     CALL DDROP  ; a cntr || a sign || 0 cntr   
      00AEC9 CD 8B B7         [ 4]  418     CALL ZERO   ; return only 0 
      00AECC 81               [ 4]  419     RET 
      00AECD                        420 PARSEXP_SUCCESS: 
      00AECD CD 88 0D         [ 4]  421     CALL DDROP ; drop dhi a 
      00AED0 CD 85 B4         [ 4]  422     CALL RFROM ; es 
      002E53                        423     _QBRAN 1$
      00AED3 CD 85 18         [ 4]    1     CALL QBRAN
      00AED6 AE DB                    2     .word 1$
      00AED8 CD 88 58         [ 4]  424     CALL NEGAT
      00AEDB                        425 1$:
      002E5B                        426     _DOLIT -1 ; -- e -1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      00AEDB CD 84 EF         [ 4]    1     CALL DOLIT 
      00AEDE FF FF                    2     .word -1 
      00AEE0 81               [ 4]  427     RET 
                                    428 
                                    429 
                                    430 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    431 ;   FLOAT?  ( a dlo dhi a+ cntr sign d? -- f -3 | a 0 )
                                    432 ;   called by NUMBER? 
                                    433 ;   convert string to float 
                                    434 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002E61                        435     _HEADER FLOATQ,5,"FLOAT?"
      00AEE1 AD D5                    1         .word LINK 
                           002E63     2         LINK=.
      00AEE3 05                       3         .byte 5  
      00AEE4 46 4C 4F 41 54 3F        4         .ascii "FLOAT?"
      00AEEA                          5         FLOATQ:
      002E6A                        436     _QBRAN FLOATQ0 
      00AEEA CD 85 18         [ 4]    1     CALL QBRAN
      00AEED AE F4                    2     .word FLOATQ0
      002E6F                        437     _BRAN FLOAT_ERROR  ; not a float, string start with '#'
      00AEEF CD 85 34         [ 4]    1     CALL BRAN 
      00AEF2 AF 93                    2     .word FLOAT_ERROR 
      00AEF4                        438 FLOATQ0:
                                    439 ; BASE must be 10 
      00AEF4 CD 86 CE         [ 4]  440     CALL BASE 
      00AEF7 CD 85 63         [ 4]  441     CALL AT 
      002E7A                        442     _DOLIT 10 
      00AEFA CD 84 EF         [ 4]    1     CALL DOLIT 
      00AEFD 00 0A                    2     .word 10 
      00AEFF CD 88 CE         [ 4]  443     CALL EQUAL 
      002E82                        444     _QBRAN FLOAT_ERROR 
      00AF02 CD 85 18         [ 4]    1     CALL QBRAN
      00AF05 AF 93                    2     .word FLOAT_ERROR
                                    445 ; if float next char is '.' or 'E' 
      00AF07 CD 85 D1         [ 4]  446     CALL TOR ; R: sign  
      00AF0A CD 85 D1         [ 4]  447     CALL TOR ; R: sign cntr 
      00AF0D CD 86 08         [ 4]  448     CALL DUPP
      00AF10 CD 85 81         [ 4]  449     CALL CAT 
      002E93                        450     _DOLIT '.' 
      00AF13 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AF16 00 2E                    2     .word '.' 
      00AF18 CD 88 CE         [ 4]  451     CALL EQUAL 
      002E9B                        452     _QBRAN FLOATQ1 ; not a dot 
      00AF1B CD 85 18         [ 4]    1     CALL QBRAN
      00AF1E AF 59                    2     .word FLOATQ1
      00AF20 CD 8B 4B         [ 4]  453     CALL ONEP 
      00AF23 CD 85 B4         [ 4]  454     CALL RFROM  ; dlo dhi a cntr R: sign  
      00AF26 CD 8B 58         [ 4]  455     CALL ONEM 
      00AF29 CD 86 08         [ 4]  456     CALL DUPP 
      00AF2C CD 85 D1         [ 4]  457     CALL TOR  ; R: sign cntr 
                                    458 ; parse fractional part
      00AF2F CD A4 42         [ 4]  459     CALL parse_digits ; dlo dhi a cntr -- dm a cntr 
      00AF32 CD 86 08         [ 4]  460     CALL DUPP 
      00AF35 CD 85 B4         [ 4]  461     CALL RFROM 
      00AF38 CD 86 18         [ 4]  462     CALL SWAPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      00AF3B CD 88 A6         [ 4]  463     CALL SUBB ; fd -> fraction digits count 
      00AF3E CD 85 D1         [ 4]  464     CALL TOR  ; dlo dhi a cntr R: sign fd 
      00AF41 CD 86 08         [ 4]  465     CALL DUPP ; cntr cntr  
      002EC4                        466     _QBRAN 1$ ; end of string, no exponent
      00AF44 CD 85 18         [ 4]    1     CALL QBRAN
      00AF47 AF 4E                    2     .word 1$
      002EC9                        467     _BRAN FLOATQ2
      00AF49 CD 85 34         [ 4]    1     CALL BRAN 
      00AF4C AF 62                    2     .word FLOATQ2 
      00AF4E CD 86 18         [ 4]  468 1$: CALL SWAPP 
      00AF51 CD 85 FE         [ 4]  469     CALL DROP ; a
      002ED4                        470     _BRAN FLOATQ3        
      00AF54 CD 85 34         [ 4]    1     CALL BRAN 
      00AF57 AF 6A                    2     .word FLOATQ3 
      00AF59                        471 FLOATQ1: ; must push fd==0 on RSTACK 
      00AF59 CD 85 B4         [ 4]  472     CALL RFROM ; cntr 
      00AF5C CD 8B B7         [ 4]  473     CALL ZERO  ; fd 
      00AF5F CD 85 D1         [ 4]  474     CALL TOR   ; dm a cntr R: sign fd 
      00AF62                        475 FLOATQ2: 
      00AF62 CD AE 82         [ 4]  476     CALL parse_exponent 
      002EE5                        477     _QBRAN FLOAT_ERROR0 ; exponent expected 
      00AF65 CD 85 18         [ 4]    1     CALL QBRAN
      00AF68 AF 90                    2     .word FLOAT_ERROR0
      00AF6A                        478 FLOATQ3: ; dm 0 || dm e  
      00AF6A CD 85 B4         [ 4]  479     CALL RFROM ;  fd  
      00AF6D CD 88 A6         [ 4]  480     CALL SUBB  ; exp=e-fd 
      00AF70 CD 87 EB         [ 4]  481     CALL NROT 
      00AF73 CD 85 B4         [ 4]  482     CALL RFROM  ; sign 
      002EF6                        483     _QBRAN FLOATQ4 
      00AF76 CD 85 18         [ 4]    1     CALL QBRAN
      00AF79 AF 7E                    2     .word FLOATQ4
      00AF7B CD 88 6A         [ 4]  484     CALL DNEGA 
      00AF7E                        485 FLOATQ4:
      00AF7E CD 87 CC         [ 4]  486     CALL ROT 
      00AF81 CD AC BB         [ 4]  487     CALL STEXP 
      00AF84 CD 87 CC         [ 4]  488     CALL ROT 
      00AF87 CD 85 FE         [ 4]  489     CALL DROP 
      002F0A                        490     _DOLIT -3 
      00AF8A CD 84 EF         [ 4]    1     CALL DOLIT 
      00AF8D FF FD                    2     .word -3 
      00AF8F 81               [ 4]  491     RET       
      00AF90                        492 FLOAT_ERROR0: 
      00AF90 CD A8 60         [ 4]  493     CALL DRFROM ; sign df      
      00AF93                        494 FLOAT_ERROR: 
      00AF93 CD 8B F9         [ 4]  495     CALL DEPTH 
      00AF96 CD 8B 3E         [ 4]  496     CALL CELLS 
      00AF99 CD 85 E8         [ 4]  497     CALL SPAT 
      00AF9C CD 86 18         [ 4]  498     CALL SWAPP 
      00AF9F CD 88 2D         [ 4]  499     CALL PLUS  
      00AFA2 CD 85 F5         [ 4]  500     CALL SPSTO 
      002F25                        501     _DOLIT 0 
      00AFA5 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AFA8 00 00                    2     .word 0 
      00AFAA 81               [ 4]  502     RET 
                                    503 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



                                    504 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    505 ;  LSCALE ( f# -- f# )
                                    506 ;  m *=fbase , e -= 1
                                    507 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002F2B                        508     _HEADER LSCALE,6,"LSCALE"
      00AFAB AE E3                    1         .word LINK 
                           002F2D     2         LINK=.
      00AFAD 06                       3         .byte 6  
      00AFAE 4C 53 43 41 4C 45        4         .ascii "LSCALE"
      00AFB4                          5         LSCALE:
      00AFB4 CD AC 76         [ 4]  509     CALL ATEXP 
      002F37                        510     _DOLIT 1 
      00AFB7 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AFBA 00 01                    2     .word 1 
      00AFBC CD 88 A6         [ 4]  511     CALL SUBB 
      00AFBF CD 85 D1         [ 4]  512     CALL TOR
      002F42                        513     _DOLIT 10 
      00AFC2 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AFC5 00 0A                    2     .word 10 
      00AFC7 CD A6 7C         [ 4]  514     CALL DSSTAR
      00AFCA CD 85 B4         [ 4]  515     CALL RFROM 
      00AFCD CD AC BB         [ 4]  516     CALL STEXP 
      00AFD0 81               [ 4]  517     RET  
                                    518 
                                    519 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    520 ;  RSCALE ( f# -- f# )
                                    521 ;  m /=fbase , e+=1 
                                    522 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002F51                        523     _HEADER RSCALE,6,"RSCALE"
      00AFD1 AF AD                    1         .word LINK 
                           002F53     2         LINK=.
      00AFD3 06                       3         .byte 6  
      00AFD4 52 53 43 41 4C 45        4         .ascii "RSCALE"
      00AFDA                          5         RSCALE:
      00AFDA CD AC 76         [ 4]  524     CALL ATEXP 
      002F5D                        525     _DOLIT 1 
      00AFDD CD 84 EF         [ 4]    1     CALL DOLIT 
      00AFE0 00 01                    2     .word 1 
      00AFE2 CD 88 2D         [ 4]  526     CALL PLUS 
      00AFE5 CD 85 D1         [ 4]  527     CALL TOR 
      002F68                        528     _DOLIT 10 
      00AFE8 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AFEB 00 0A                    2     .word 10 
      00AFED CD A5 D4         [ 4]  529     CALL DSLMOD 
      00AFF0 CD 87 CC         [ 4]  530     CALL ROT 
      00AFF3 CD 85 FE         [ 4]  531     CALL DROP 
      00AFF6 CD 85 B4         [ 4]  532     CALL RFROM 
      00AFF9 CD AC BB         [ 4]  533     CALL STEXP 
      00AFFC 81               [ 4]  534     RET 
                                    535 
                                    536 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    537 ;   SCALE>M ( ud1 -- e ud2 )
                                    538 ;   scale down a double  
                                    539 ;   by repeated d/10
                                    540 ;   until ud<=MAX_MANTISSA   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



                                    541 ;   e is log10 exponent of scaled down
                                    542 ;   ud2 is scaled down ud1 
                                    543 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002F7D                        544     _HEADER SCALETOM,7,"SCALE>M"
      00AFFD AF D3                    1         .word LINK 
                           002F7F     2         LINK=.
      00AFFF 07                       3         .byte 7  
      00B000 53 43 41 4C 45 3E 4D     4         .ascii "SCALE>M"
      00B007                          5         SCALETOM:
      00B007 CD 8B B7         [ 4]  545     CALL ZERO 
      00B00A CD 87 EB         [ 4]  546     CALL NROT 
      00B00D                        547 SCAL1:
      00B00D CD 86 08         [ 4]  548     CALL DUPP 
      002F90                        549     _DOLIT 0X7F 
      00B010 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B013 00 7F                    2     .word 0X7F 
      00B015 CD 89 2A         [ 4]  550     CALL UGREAT 
      002F98                        551     _QBRAN SCAL2  
      00B018 CD 85 18         [ 4]    1     CALL QBRAN
      00B01B B0 39                    2     .word SCAL2
      002F9D                        552     _DOLIT 10 
      00B01D CD 84 EF         [ 4]    1     CALL DOLIT 
      00B020 00 0A                    2     .word 10 
      00B022 CD A5 D4         [ 4]  553     CALL DSLMOD 
      00B025 CD 87 CC         [ 4]  554     CALL ROT  
      00B028 CD 85 FE         [ 4]  555     CALL DROP
      00B02B CD 87 CC         [ 4]  556     CALL ROT 
      00B02E CD 8B 4B         [ 4]  557     CALL ONEP 
      00B031 CD 87 EB         [ 4]  558     CALL NROT  
      002FB4                        559     _BRAN SCAL1 
      00B034 CD 85 34         [ 4]    1     CALL BRAN 
      00B037 B0 0D                    2     .word SCAL1 
      00B039                        560 SCAL2: 
      00B039 81               [ 4]  561     RET 
                                    562 
                                    563 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    564 ;  UDIV10 ( ut -- ut )
                                    565 ;  divide a 48 bits uint by 10 
                                    566 ;  used to scale down MM* 
                                    567 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00B03A                        568 UDIV10:
      00B03A 90 93            [ 1]  569     LDW Y,X 
      00B03C 90 FE            [ 2]  570     LDW Y,(Y)
      00B03E A6 0A            [ 1]  571     LD A,#10 
      00B040 90 62            [ 2]  572     DIV Y,A 
      00B042 FF               [ 2]  573     LDW (X),Y 
      00B043 90 95            [ 1]  574     LD YH,A 
      00B045 E6 02            [ 1]  575     LD A,(2,X)
      00B047 90 97            [ 1]  576     LD YL,A 
      00B049 A6 0A            [ 1]  577     LD A,#10 
      00B04B 90 62            [ 2]  578     DIV Y,A 
      00B04D 90 95            [ 1]  579     LD YH,A 
      00B04F 90 9F            [ 1]  580     LD A,YL 
      00B051 E7 02            [ 1]  581     LD (2,X),A 
      00B053 E6 03            [ 1]  582     LD A,(3,X)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      00B055 90 97            [ 1]  583     LD YL,A 
      00B057 A6 0A            [ 1]  584     LD A,#10 
      00B059 90 62            [ 2]  585     DIV Y,A 
      00B05B 90 95            [ 1]  586     LD YH,A 
      00B05D 90 9F            [ 1]  587     LD A,YL 
      00B05F E7 03            [ 1]  588     LD (3,X),A 
      00B061 E6 04            [ 1]  589     LD A,(4,X)
      00B063 90 97            [ 1]  590     LD YL,A 
      00B065 A6 0A            [ 1]  591     LD A,#10 
      00B067 90 62            [ 2]  592     DIV Y,A 
      00B069 90 95            [ 1]  593     LD YH,A 
      00B06B 90 9F            [ 1]  594     LD A,YL 
      00B06D E7 04            [ 1]  595     LD (4,X),A 
      00B06F E6 05            [ 1]  596     LD A,(5,X)
      00B071 90 97            [ 1]  597     LD YL,A 
      00B073 A6 0A            [ 1]  598     LD A,#10 
      00B075 90 62            [ 2]  599     DIV Y,A 
      00B077 90 9F            [ 1]  600     LD A,YL 
      00B079 E7 05            [ 1]  601     LD (5,X),A 
      00B07B 81               [ 4]  602     RET 
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
      002FFC                        613     _HEADER MMSTAR,3,"MM*"
      00B07C AF FF                    1         .word LINK 
                           002FFE     2         LINK=.
      00B07E 03                       3         .byte 3  
      00B07F 4D 4D 2A                 4         .ascii "MM*"
      00B082                          5         MMSTAR:
      00B082 CD 88 18         [ 4]  614     CALL DDUP
      00B085 CD A5 5C         [ 4]  615     CALL DZEQUAL
      003008                        616     _TBRAN MMSTA2
      00B088 CD 85 26         [ 4]    1     CALL TBRAN 
      00B08B B0 98                    2     .word MMSTA2 
      00B08D                        617 MMSTA1:
      00B08D CD A9 09         [ 4]  618     CALL DOVER 
      00B090 CD A5 5C         [ 4]  619     CALL DZEQUAL 
      003013                        620     _QBRAN MMSTA3 
      00B093 CD 85 18         [ 4]    1     CALL QBRAN
      00B096 B0 A3                    2     .word MMSTA3
      00B098                        621 MMSTA2: ; ( -- 0 0 0 )
      00B098 1C 00 02         [ 2]  622     ADDW X,#2 
      00B09B 90 5F            [ 1]  623     CLRW Y 
      00B09D FF               [ 2]  624     LDW (X),Y 
      00B09E EF 02            [ 2]  625     LDW (2,X),Y
      00B0A0 EF 04            [ 2]  626     LDW (4,X),Y 
      00B0A2 81               [ 4]  627     RET 
      00B0A3                        628 MMSTA3:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      00B0A3 CD A5 BB         [ 4]  629     CALL DSIGN 
      00B0A6 CD 85 D1         [ 4]  630     CALL TOR    ; R: m2sign 
      00B0A9 CD A5 A4         [ 4]  631     CALL DABS   ; m1 um2 
      00B0AC CD A6 C5         [ 4]  632     CALL DSWAP  ; um2 m1 
      00B0AF CD A5 BB         [ 4]  633     CALL DSIGN  ; um2 m1 m1sign 
      00B0B2 CD 85 B4         [ 4]  634     CALL RFROM 
      00B0B5 CD 86 8E         [ 4]  635     CALL XORR 
      00B0B8 CD 85 D1         [ 4]  636     CALL TOR   ; R: product_sign 
      00B0BB CD A5 A4         [ 4]  637     CALL DABS  ; um2 um1  
      00B0BE CD A8 42         [ 4]  638     CALL DTOR  ; um2 
      00B0C1 CD 86 08         [ 4]  639     CALL DUPP  ; um2 um2hi 
      00B0C4 CD 85 C5         [ 4]  640     CALL RAT   ; um2 um2hi um1hi
                                    641 ; first partial product  
                                    642 ; pd1=um2hi*um1hi 
      00B0C7 CD 8A CA         [ 4]  643     CALL STAR 
      00B0CA CD 8B B7         [ 4]  644     CALL ZERO 
      00B0CD CD 86 18         [ 4]  645     CALL SWAPP ; pd1<<16  
      00B0D0 CD A6 C5         [ 4]  646     CALL DSWAP ; pd1 um2 
      00B0D3 CD 86 30         [ 4]  647     CALL OVER  ; pd1 um2 um2lo 
      00B0D6 CD 85 B4         [ 4]  648     CALL RFROM ; pd1 um2 um2lo um1hi 
                                    649 ; pd2=um2lo*um1hi 
      00B0D9 CD 8A 80         [ 4]  650     CALL UMSTA ; pd1 um2 pd2 
      00B0DC CD A6 C5         [ 4]  651     CALL DSWAP ; pd1 pd2 um2 
      00B0DF CD 85 C5         [ 4]  652     CALL RAT   ; pd1 pd2 um2 um1lo 
                                    653 ; pd3= um2hi*um1lo 
      00B0E2 CD 8A 80         [ 4]  654     CALL UMSTA ; pd1 pd2 um2lo pd3 
      00B0E5 CD 87 CC         [ 4]  655     CALL ROT ; pd1 pd2 pd3 um2lo 
      00B0E8 CD 85 D1         [ 4]  656     CALL TOR ; pd1 pd2 pd3 R: psign um1lo um2lo 
                                    657 ; pd1+pd2+pd3  pd1
      00B0EB CD AB 09         [ 4]  658     CALL DPLUS 
      00B0EE CD AB 09         [ 4]  659     CALL DPLUS  
      00B0F1 CD A8 60         [ 4]  660     CALL DRFROM ; triple um2lo um1lo 
                                    661 ; last partial product um2lo*um1lo 
      00B0F4 CD 8A 80         [ 4]  662     CALL UMSTA ; prod pd4 
                                    663 ; mm*=prod<<16+pd4  
      00B0F7 CD A8 42         [ 4]  664     CALL DTOR ;   R: psign pd4lo pd4hi  
                                    665  ; add pd4hi to prodlo and propagate carry 
      00B0FA 90 93            [ 1]  666     LDW Y,X 
      00B0FC 90 EE 02         [ 2]  667     LDW Y,(2,Y)  ; prodlo 
      00B0FF 72 F9 01         [ 2]  668     ADDW Y,(1,SP)  ; prodlo+pd4hi 
      00B102 17 01            [ 2]  669     LDW (1,SP),Y    ; plo phi  
      00B104 90 93            [ 1]  670     LDW Y,X
      00B106 90 FE            [ 2]  671     LDW Y,(Y) ; prodhi  
      00B108 24 04            [ 1]  672     JRNC MMSTA4
      00B10A 72 A9 00 01      [ 2]  673     ADDW Y,#1 ; add carry 
      00B10E                        674 MMSTA4:     
      00B10E 1D 00 02         [ 2]  675     SUBW X,#2 
      00B111 FF               [ 2]  676     LDW (X),Y 
      00B112 90 85            [ 2]  677     POPW Y 
      00B114 EF 02            [ 2]  678     LDW (2,X),Y 
      00B116 90 85            [ 2]  679     POPW Y 
      00B118 EF 04            [ 2]  680     LDW (4,X),Y
      00B11A CD 8B B7         [ 4]  681     CALL ZERO 
      00B11D CD 85 D1         [ 4]  682     CALL TOR 
      00B120                        683 MMSTA5:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



      00B120 CD 87 BB         [ 4]  684     CALL QDUP 
      0030A3                        685     _QBRAN MMSTA6 
      00B123 CD 85 18         [ 4]    1     CALL QBRAN
      00B126 B1 39                    2     .word MMSTA6
      00B128 CD B0 3A         [ 4]  686     CALL UDIV10 
      00B12B CD 85 B4         [ 4]  687     CALL RFROM 
      00B12E CD 8B 4B         [ 4]  688     CALL ONEP 
      00B131 CD 85 D1         [ 4]  689     CALL TOR 
      0030B4                        690     _BRAN MMSTA5 
      00B134 CD 85 34         [ 4]    1     CALL BRAN 
      00B137 B1 20                    2     .word MMSTA5 
                                    691 ; now scale to double 
                                    692 ; scale further <= MAX_MANTISSA 
      00B139                        693 MMSTA6: 
      00B139 CD 85 B4         [ 4]  694     CALL RFROM 
      00B13C CD 87 EB         [ 4]  695     CALL NROT 
      00B13F CD B0 07         [ 4]  696     CALL SCALETOM
      00B142 CD A8 42         [ 4]  697     CALL DTOR 
      00B145 CD 88 2D         [ 4]  698     CALL PLUS 
      00B148 CD A8 60         [ 4]  699     CALL DRFROM 
      00B14B CD 85 B4         [ 4]  700     CALL RFROM
      0030CE                        701     _QBRAN MMSTA7
      00B14E CD 85 18         [ 4]    1     CALL QBRAN
      00B151 B1 56                    2     .word MMSTA7
      00B153 CD 88 6A         [ 4]  702     CALL DNEGA
      00B156                        703 MMSTA7:
      00B156 CD 87 CC         [ 4]  704     CALL ROT ; m e 
      00B159 81               [ 4]  705     RET 
                                    706 
                                    707 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    708 ;    F* ( f#1 f#2 -- f#3 )
                                    709 ;    float product 
                                    710 ;    f#3=f#1 * f#2 
                                    711 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0030DA                        712     _HEADER FSTAR,2,"F*"
      00B15A B0 7E                    1         .word LINK 
                           0030DC     2         LINK=.
      00B15C 02                       3         .byte 2  
      00B15D 46 2A                    4         .ascii "F*"
      00B15F                          5         FSTAR:
      00B15F CD AC 76         [ 4]  713     CALL ATEXP ; f#1 m2 e2 
      00B162 CD 85 D1         [ 4]  714     CALL TOR   
      00B165 CD A6 C5         [ 4]  715     CALL DSWAP ; m2 f#1
      00B168 CD AC 76         [ 4]  716     CALL ATEXP ; m2 m1 e1 
      00B16B CD 85 B4         [ 4]  717     CALL RFROM ; m2 m1 e1 e2 
      00B16E CD 88 2D         [ 4]  718     CALL PLUS  ; m2 m1 e 
      00B171 CD 85 D1         [ 4]  719     CALL TOR   ; m2 m1 R: e 
      00B174 CD B0 82         [ 4]  720     CALL MMSTAR ; m2*m1 e   
      00B177 CD 85 B4         [ 4]  721     CALL RFROM 
      00B17A CD 88 2D         [ 4]  722     CALL PLUS 
      00B17D CD AC BB         [ 4]  723     CALL STEXP ; f#3 
      00B180 81               [ 4]  724     RET 
                                    725 
                                    726 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    727 ;  F/ ( f#1 f#2 -- f#3 )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



                                    728 ;  float division
                                    729 ;  f#3 = f#1/f#2
                                    730 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003101                        731     _HEADER FSLASH,2,"F/"
      00B181 B1 5C                    1         .word LINK 
                           003103     2         LINK=.
      00B183 02                       3         .byte 2  
      00B184 46 2F                    4         .ascii "F/"
      00B186                          5         FSLASH:
      00B186 CD AC 76         [ 4]  732     CALL ATEXP  ; f#1 m2 e2  
      00B189 CD 85 D1         [ 4]  733     CALL TOR    ; f#1 m2   R: e2 
      00B18C CD A6 C5         [ 4]  734     CALL DSWAP  ; m2 f#1 
      00B18F CD AC 76         [ 4]  735     CALL ATEXP  ; m2 m1 e1 
      00B192 CD 85 B4         [ 4]  736     CALL RFROM  ; m2 m1 e1 e2
      00B195 CD 88 2D         [ 4]  737     CALL PLUS   ; m2 m1 e 
      00B198 CD 85 D1         [ 4]  738     CALL TOR    ; m2 m1 R: e 
      00B19B CD A6 C5         [ 4]  739     CALL DSWAP  ; m1 m2 R: e
      00B19E CD 88 18         [ 4]  740     CALL DDUP  ; m1 m2 m2 R: e
      00B1A1 CD A8 42         [ 4]  741     CALL DTOR  ; m1 m2 R: e m2 ( keep divisor need later ) 
      00B1A4 CD AA 12         [ 4]  742     CALL DDSLMOD ; remainder m1/m2 R: e m2 
      00B1A7 CD A9 09         [ 4]  743     CALL DOVER ; if remainder null done 
      00B1AA CD A5 5C         [ 4]  744     CALL DZEQUAL 
      00312D                        745     _TBRAN FSLASH8 
      00B1AD CD 85 26         [ 4]    1     CALL TBRAN 
      00B1B0 B2 09                    2     .word FSLASH8 
                                    746 ; get fractional digits from remainder until mantissa saturate
      00B1B2                        747 FSLASH1: ; remainder mantissa R: e divisor 
                                    748 ; check for mantissa saturation 
      00B1B2 CD 88 18         [ 4]  749     CALL DDUP 
      003135                        750     _DOLIT 0XCCCC 
      00B1B5 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B1B8 CC CC                    2     .word 0XCCCC 
      00313A                        751     _DOLIT 0xC
      00B1BA CD 84 EF         [ 4]    1     CALL DOLIT 
      00B1BD 00 0C                    2     .word 0xC 
      00B1BF CD A7 BA         [ 4]  752     CALL DGREAT 
      003142                        753     _TBRAN FSLASH8 ; another loop would result in mantissa overflow 
      00B1C2 CD 85 26         [ 4]    1     CALL TBRAN 
      00B1C5 B2 09                    2     .word FSLASH8 
                                    754 ; multiply mantissa by 10 
      003147                        755     _DOLIT 10 
      00B1C7 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B1CA 00 0A                    2     .word 10 
      00B1CC CD 8B B7         [ 4]  756     CALL ZERO 
      00B1CF CD A9 AF         [ 4]  757     CALL DSTAR 
                                    758 ; mutliply remainder by 10     
      00B1D2 CD A6 C5         [ 4]  759     CALL DSWAP 
      003155                        760     _DOLIT 10 
      00B1D5 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B1D8 00 0A                    2     .word 10 
      00B1DA CD 8B B7         [ 4]  761     CALL ZERO 
      00B1DD CD A9 AF         [ 4]  762     CALL DSTAR 
                                    763 ; divide remainder by m2     
      00B1E0 CD A8 78         [ 4]  764     CALL DRAT 
      00B1E3 CD AA 12         [ 4]  765     CALL DDSLMOD 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



      00B1E6 CD A6 C5         [ 4]  766     CALL DSWAP ; mantissa frac_digit remainder R: e divisor  
      00B1E9 CD A8 42         [ 4]  767     CALL DTOR  ; mantissa frac_digit R: e divisor remainder 
      00B1EC CD AB 09         [ 4]  768     CALL DPLUS ; mantissa+frac_digit 
      00B1EF CD A8 60         [ 4]  769     CALL DRFROM ; mantissa remainder 
      00B1F2 CD A8 60         [ 4]  770     CALL DRFROM ; mantissa remainder divisor 
      00B1F5 CD 85 B4         [ 4]  771     CALL RFROM  ; mantissa remainder divisor e 
      00B1F8 CD 8B 58         [ 4]  772     CALL ONEM   ; decrement exponent 
      00B1FB CD 85 D1         [ 4]  773     CALL TOR    ; mantissa remainder divisor R: e 
      00B1FE CD A8 42         [ 4]  774     CALL DTOR   ; mantissa remainder R: e divisor 
      00B201 CD A6 C5         [ 4]  775     CALL DSWAP  ; remainder mantissa  
      003184                        776     _BRAN FSLASH1
      00B204 CD 85 34         [ 4]    1     CALL BRAN 
      00B207 B1 B2                    2     .word FSLASH1 
      00B209                        777 FSLASH8: ; remainder mantissa R: e divisor 
      00B209 CD A6 C5         [ 4]  778     CALL DSWAP  
      00B20C CD 88 0D         [ 4]  779     CALL DDROP  ; drop remainder     
      00B20F CD A8 60         [ 4]  780     CALL DRFROM
      00B212 CD 88 0D         [ 4]  781     CALL DDROP  ; drop divisor 
      00B215 CD 85 B4         [ 4]  782     CALL RFROM  ; exponent 
      00B218 CD AC BB         [ 4]  783     CALL STEXP 
      00B21B 81               [ 4]  784     RET 
                                    785 
                                    786 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    787 ;   D>F  ( # -- f# )
                                    788 ;   convert double to float 
                                    789 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00319C                        790     _HEADER DTOF,3,"D>F"
      00B21C B1 83                    1         .word LINK 
                           00319E     2         LINK=.
      00B21E 03                       3         .byte 3  
      00B21F 44 3E 46                 4         .ascii "D>F"
      00B222                          5         DTOF:
      00B222 CD A5 BB         [ 4]  791     CALL DSIGN 
      00B225 CD 85 D1         [ 4]  792     CALL TOR
      00B228 CD A5 A4         [ 4]  793     CALL DABS  
      00B22B                        794 DTOF1:      
      00B22B CD B0 07         [ 4]  795     CALL SCALETOM 
      00B22E CD 85 B4         [ 4]  796     CALL RFROM
      0031B1                        797     _QBRAN DTOF2 
      00B231 CD 85 18         [ 4]    1     CALL QBRAN
      00B234 B2 39                    2     .word DTOF2
      00B236 CD A5 7A         [ 4]  798     CALL DNEGAT 
      00B239                        799 DTOF2: 
      00B239 CD 87 CC         [ 4]  800     CALL ROT 
      00B23C CD AC BB         [ 4]  801     CALL STEXP 
      00B23F 81               [ 4]  802     RET 
                                    803 
                                    804 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    805 ;   F>D  ( f# -- # )
                                    806 ;  convert float to double 
                                    807 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0031C0                        808     _HEADER FTOD,3,"F>D"
      00B240 B2 1E                    1         .word LINK 
                           0031C2     2         LINK=.
      00B242 03                       3         .byte 3  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      00B243 46 3E 44                 4         .ascii "F>D"
      00B246                          5         FTOD:
      00B246 CD AC 76         [ 4]  809     CALL ATEXP ; m e 
      00B249 CD 87 BB         [ 4]  810     CALL QDUP
      0031CC                        811     _QBRAN FTOD9
      00B24C CD 85 18         [ 4]    1     CALL QBRAN
      00B24F B2 DC                    2     .word FTOD9
      00B251 CD 85 D1         [ 4]  812     CALL TOR 
      00B254 CD A5 BB         [ 4]  813     CALL DSIGN 
      00B257 CD 87 EB         [ 4]  814     CALL NROT 
      00B25A CD A5 A4         [ 4]  815     CALL DABS
      00B25D CD 85 B4         [ 4]  816     CALL RFROM  
      00B260 CD 86 08         [ 4]  817     CALL DUPP   
      00B263 CD 86 3F         [ 4]  818     CALL ZLESS 
      0031E6                        819     _QBRAN FTOD4 
      00B266 CD 85 18         [ 4]    1     CALL QBRAN
      00B269 B2 A4                    2     .word FTOD4
                                    820 ; negative exponent 
      00B26B CD 88 C0         [ 4]  821     CALL ABSS 
      00B26E CD 85 D1         [ 4]  822     CALL TOR
      0031F1                        823     _BRAN FTOD2  
      00B271 CD 85 34         [ 4]    1     CALL BRAN 
      00B274 B2 8F                    2     .word FTOD2 
      00B276                        824 FTOD1:
      00B276 CD 88 18         [ 4]  825     CALL DDUP 
      00B279 CD A5 5C         [ 4]  826     CALL DZEQUAL 
      0031FC                        827     _TBRAN FTOD3 
      00B27C CD 85 26         [ 4]    1     CALL TBRAN 
      00B27F B2 99                    2     .word FTOD3 
      003201                        828     _DOLIT 10 
      00B281 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B284 00 0A                    2     .word 10 
      00B286 CD A5 D4         [ 4]  829     CALL DSLMOD 
      00B289 CD 87 CC         [ 4]  830     CALL ROT 
      00B28C CD 85 FE         [ 4]  831     CALL DROP
      00B28F                        832 FTOD2:      
      00320F                        833     _DONXT FTOD1
      00B28F CD 85 03         [ 4]    1     CALL DONXT 
      00B292 B2 76                    2     .word FTOD1 
      003214                        834     _BRAN FTOD8   
      00B294 CD 85 34         [ 4]    1     CALL BRAN 
      00B297 B2 D1                    2     .word FTOD8 
      00B299                        835 FTOD3: 
      00B299 CD 85 B4         [ 4]  836     CALL RFROM 
      00B29C CD 85 FE         [ 4]  837     CALL DROP 
      00321F                        838     _BRAN FTOD8  
      00B29F CD 85 34         [ 4]    1     CALL BRAN 
      00B2A2 B2 D1                    2     .word FTOD8 
                                    839 ; positive exponent 
      00B2A4                        840 FTOD4:
      00B2A4 CD 85 D1         [ 4]  841     CALL TOR 
      003227                        842     _BRAN FTOD6
      00B2A7 CD 85 34         [ 4]    1     CALL BRAN 
      00B2AA B2 CC                    2     .word FTOD6 
      00B2AC                        843 FTOD5:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



      00B2AC CD 88 18         [ 4]  844     CALL DDUP 
      00322F                        845     _DOLIT 0XCCCC
      00B2AF CD 84 EF         [ 4]    1     CALL DOLIT 
      00B2B2 CC CC                    2     .word 0XCCCC 
      003234                        846     _DOLIT 0XCCC  
      00B2B4 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B2B7 0C CC                    2     .word 0XCCC 
      00B2B9 CD A7 BA         [ 4]  847     CALL DGREAT 
      00323C                        848     _TBRAN FTOD3 
      00B2BC CD 85 26         [ 4]    1     CALL TBRAN 
      00B2BF B2 99                    2     .word FTOD3 
      003241                        849     _DOLIT 10 
      00B2C1 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B2C4 00 0A                    2     .word 10 
      00B2C6 CD 8B B7         [ 4]  850     CALL ZERO 
      00B2C9 CD A9 AF         [ 4]  851     CALL DSTAR 
      00B2CC                        852 FTOD6: 
      00324C                        853     _DONXT FTOD5 
      00B2CC CD 85 03         [ 4]    1     CALL DONXT 
      00B2CF B2 AC                    2     .word FTOD5 
      00B2D1                        854 FTOD8:
      00B2D1 CD 87 CC         [ 4]  855     CALL ROT 
      003254                        856     _QBRAN FTOD9 
      00B2D4 CD 85 18         [ 4]    1     CALL QBRAN
      00B2D7 B2 DC                    2     .word FTOD9
      00B2D9 CD 88 6A         [ 4]  857     CALL DNEGA
      00B2DC                        858 FTOD9:          
      00B2DC 81               [ 4]  859     RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



                                   4551 .endif 
                                   4552 
                                   4553 ;===============================================================
                                   4554 
                           0031C2  4555 LASTN =	LINK   ;last name defined
                                   4556 
                                   4557 ; application code begin here
      00B300                       4558 	.bndry 128 ; align on flash block  
      00B300                       4559 app_space: 
                                   4560 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        000849 R   |   6 ABOR1      001321 R
  6 ABOR2      001338 R   |   6 ABORQ      001319 R   |   6 ABORT      00130A R
  6 ABRTQ      0015F5 R   |   6 ABSS       000840 R   |   6 ACCEP      0012A0 R
  6 ACCP1      0012A9 R   |   6 ACCP2      0012CF R   |   6 ACCP3      0012D2 R
  6 ACCP4      0012D4 R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
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
  6 AFT        0015E0 R   |   6 AGAIN      001536 R   |   6 AHEAD      001593 R
  6 ALLOT      001449 R   |   6 ANDD       0005E5 R   |     APP_CP  =  004004 
    APP_LAST=  004000     |     APP_RUN =  004002     |     APP_VP  =  004006 
  6 AT         0004E3 R   |   6 ATEXE      000C4A R   |   6 ATEXP      002BF6 R
  6 AUTORUN    000129 R   |     AWU_APR =  0050F1     |     AWU_CSR =  0050F0 
    AWU_TBR =  0050F2     |     B0_MASK =  000001     |     B115200 =  000006 
  6 B115K2     0003E0 R   |     B19200  =  000003     |   6 B19K2      0003BD R
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
  6 B2K4       00038E R   |     B2_MASK =  000004     |     B38400  =  000004 
    B3_MASK =  000008     |     B460800 =  000008     |     B4800   =  000001 
  6 B4K8       00039C R   |     B4_MASK =  000010     |     B57600  =  000005 
  6 B57K6      0003CE R   |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
  6 B9K6       0003AC R   |   6 BACK1      001248 R   |   6 BASE       00064E R
    BASEE   =  00000A     |   6 BAUD       0003F0 R   |     BCNT    =  000001 
  6 BCOMP      00148B R   |   6 BDIGS      000D31 R   |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
  6 BEGIN      001518 R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
  6 BKSLA      00109D R   |   6 BKSP       001218 R   |     BKSPP   =  000008 
  6 BLANK      000B2A R   |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |   6 BRAN       0004B4 R   |     BTW     =  000001 
  6 BUF2ROW    00205D R   |   6 BYE        0000B6 R   |     CADR    =  000003 
    CALLL   =  0000CD     |   6 CALLOT     0022A6 R   |     CAN_DGR =  005426 
    CAN_FPSR=  005427     |     CAN_IER =  005425     |     CAN_MCR =  005420 
    CAN_MSR =  005421     |     CAN_P0  =  005428     |     CAN_P1  =  005429 
    CAN_P2  =  00542A     |     CAN_P3  =  00542B     |     CAN_P4  =  00542C 
    CAN_P5  =  00542D     |     CAN_P6  =  00542E     |     CAN_P7  =  00542F 
    CAN_P8  =  005430     |     CAN_P9  =  005431     |     CAN_PA  =  005432 
    CAN_PB  =  005433     |     CAN_PC  =  005434     |     CAN_PD  =  005435 
    CAN_PE  =  005436     |     CAN_PF  =  005437     |     CAN_RFR =  005424 
    CAN_TPR =  005423     |     CAN_TSR =  005422     |     CARRY   =  00002A 
    CASE_SEN=  000000     |   6 CAT        000501 R   |   6 CCOMMA     00146D R
    CC_C    =  000000     |     CC_H    =  000004     |     CC_I0   =  000003 
    CC_I1   =  000005     |     CC_N    =  000002     |     CC_V    =  000007 
    CC_Z    =  000001     |     CELLL   =  000002     |   6 CELLM      000AAF R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]

Symbol Table

  6 CELLP      000AA0 R   |   6 CELLS      000ABE R   |     CFG_GCR =  007F60 
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   6 CHAR1      000E87 R
  6 CHAR2      000E8A R   |   6 CHKIVEC    001F4B R   |     CLKOPT  =  004807 
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
  6 CNTXT      0006D1 R   |   6 COLD       001A4C R   |   6 COLD1      001A4C R
  6 COLON      00179E R   |   6 COMMA      001456 R   |   6 COMPI      00149B R
    COMPO   =  000040     |   6 CONSTANT   001848 R   |   6 COUNT      000BFD R
  6 CPP        0006ED R   |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
  6 CR         000EAF R   |   6 CREAT      0017E4 R   |     CRR     =  00000D 
  6 CSTOR      0004F0 R   |   6 CTABLE     0022C7 R   |   6 CTAT       0022E8 R
  6 CTINIT     002310 R   |   6 D2SLASH    0028A2 R   |   6 D2STAR     0028B9 R
  6 DABS       002524 R   |   6 DABS1      002532 R   |   6 DAT        000BE1 R
    DATSTK  =  001680     |   6 DCLZ       002673 R   |   6 DCLZ1      00267C R
  6 DCLZ4      002685 R   |   6 DCLZ8      002692 R   |   6 DCMP       002790 R
  6 DCMP2      00279C R   |   6 DCMP4      0027B7 R   |   6 DCMP_EQU   0027A9 R
  6 DCMP_GRE   0027B3 R   |   6 DCMP_SMA   0027AD R   |   6 DCONST     00187D R
  6 DDIG       002595 R   |   6 DDIGS      0025AE R   |   6 DDOT       0025C5 R
  6 DDOT0      0025D9 R   |   6 DDOT1      0025EF R   |   6 DDROP      00078D R
  6 DDSLMOD    002992 R   |   6 DDSTAR3    002988 R   |   6 DDUP       000798 R
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   6 DECIM      000DE1 R
  6 DEPTH      000B79 R   |   6 DEQU4      00272E R   |   6 DEQUAL     002719 R
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |   6 DGREAT     00273A R
  6 DGREAT4    00274F R   |   6 DGTQ1      000E26 R   |   6 DI         0000C4 R
  6 DIG        000D5A R   |   6 DIGIT      000CF5 R   |   6 DIGS       000D6B R
  6 DIGS1      000D6B R   |   6 DIGS2      000D78 R   |   6 DIGTQ      000DF5 R
    DISCOVER=  000000     |   6 DLESS      00275B R   |   6 DLESS4     002771 R
  6 DLITER     002862 R   |   6 DLSHIFT    0028D5 R   |   6 DLSHIFT1   0028E6 R
  6 DLSHIFT2   0028FB R   |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  6 DN1        000807 R   |   6 DNEG1      002519 R   |   6 DNEGA      0007EA R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]

Symbol Table

  6 DNEGAT     0024FA R   |   6 DOCONST    001868 R   |   6 DOLIT      00046F R
  6 DONXT      000483 R   |     DOORBELL=  000000     |   6 DOSTR      000EBF R
  6 DOT        000F56 R   |   6 DOT1       000F6C R   |   6 DOTI1      0019CD R
  6 DOTID      0019B7 R   |   6 DOTO1      0013AD R   |   6 DOTOK      001393 R
  6 DOTPR      00107F R   |   6 DOTQ       00160F R   |   6 DOTQP      000EDC R
  6 DOTR       000EEA R   |   6 DOTS       001959 R   |   6 DOTS1      001964 R
  6 DOTS2      00196D R   |   6 DOVAR      00063E R   |   6 DOVER      002889 R
  6 DO_DCONS   0018A0 R   |   6 DPLUS      002A89 R   |   6 DPLUS1     002AB0 R
  6 DRAT       0027F8 R   |   6 DRFROM     0027E0 R   |   6 DROP       00057E R
  6 DROT       0026DF R   |   6 DRSHIFT    00290C R   |   6 DRSHIFT1   002913 R
  6 DRSHIFT2   002929 R   |   6 DSIGN      00253B R   |   6 DSIGN1     002545 R
  6 DSLA1      0029AC R   |   6 DSLA2      0029CE R   |   6 DSLA3      002A0E R
  6 DSLA4      002A34 R   |   6 DSLA7      002A65 R   |   6 DSLA8      002A68 R
  6 DSLA9      002A83 R   |   6 DSLMOD     002554 R   |   6 DSLMOD3    00256F R
  6 DSLMOD4    00257B R   |   6 DSLMODa    002576 R   |   6 DSLMODb    002581 R
  6 DSSTAR     0025FC R   |   6 DSSTAR1    002613 R   |   6 DSSTAR3    00263C R
  6 DSTAR      00292F R   |   6 DSTOR      000BC8 R   |   6 DSUB       002ABB R
  6 DSUB1      002AE2 R   |   6 DSWAP      002645 R   |   6 DTOF       0031A2 R
  6 DTOF1      0031AB R   |   6 DTOF2      0031B9 R   |   6 DTOR       0027C2 R
  6 DUMP       00190F R   |   6 DUMP1      001926 R   |   6 DUMP3      001948 R
  6 DUMPP      0018DE R   |   6 DUPP       000588 R   |   6 DVARIA     002816 R
  6 DZEQUAL    0024DC R   |   6 DZLESS     002778 R   |   6 DZLESS1    002782 R
  6 EDIGS      000D96 R   |   6 EDOT       002CBA R   |   6 EDOT0      002CD1 R
  6 EDOT1      002CDF R   |   6 EDOT2      002CE5 R   |   6 EDOT3      002CFE R
  6 EDOT4      002D2D R   |   6 EDOT5      002D49 R   |   6 EECSTORE   001CFC R
  6 EEPCP      001B22 R   |   6 EEPLAST    001AF5 R   |   6 EEPROM     001ADD R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_R=  000010 
    EEPROM_S=  000800     |   6 EEPRUN     001B0C R   |   6 EEPVP      001B38 R
  6 EESTORE    001D48 R   |   6 EE_CCOMM   002012 R   |   6 EE_COMMA   001FF1 R
  6 EE_CREAD   001C8D R   |   6 EE_READ    001C6B R   |   6 EI         0000BD R
  6 ELSEE      00156E R   |   6 EMIT       000436 R   |   6 ENEPER     002232 R
    EOL_CR  =  000001     |     EOL_LF  =  000000     |   6 EQ1        000864 R
  6 EQUAL      00084E R   |   6 ERASE      000CC3 R   |     ERR     =  00001B 
  6 EVAL       0013D6 R   |   6 EVAL1      0013D6 R   |   6 EVAL2      0013F2 R
  6 EXE1       000C58 R   |   6 EXECU      0004C4 R   |     EXT     =  000000 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |   6 EXTRC      000D1D R
  6 FADDR      0020DF R   |   6 FARAT      001BA3 R   |   6 FARCAT     001BAF R
  6 FC_XOFF    000463 R   |   6 FC_XON     00044D R   |   6 FDOT       002D58 R
  6 FDOT0      002D96 R   |   6 FDOT1      002D85 R   |   6 FDOT10     002DF2 R
  6 FDOT2      002DA4 R   |   6 FDOT3      002DBD R   |   6 FDOT6      002DCD R
  6 FDOT7      002DD2 R   |   6 FDOT8      002DDA R   |   6 FDOT9      002DE2 R
  6 FER        002B1F R   |     FHSE    =  7A1200     |     FHSI    =  F42400 
  6 FILL       000C90 R   |   6 FILL1      000CAD R   |   6 FILL2      000CB6 R
  6 FIND       001174 R   |   6 FIND1      001192 R   |   6 FIND2      0011C0 R
  6 FIND3      0011CC R   |   6 FIND4      0011E0 R   |   6 FIND5      0011ED R
  6 FIND6      0011D1 R   |   6 FINIT      002B15 R   |     FLASH_BA=  008000 
    FLASH_CR=  00505A     |     FLASH_CR=  000002     |     FLASH_CR=  000000 
    FLASH_CR=  000003     |     FLASH_CR=  000001     |     FLASH_CR=  00505B 
    FLASH_CR=  000005     |     FLASH_CR=  000004     |     FLASH_CR=  000007 
    FLASH_CR=  000000     |     FLASH_CR=  000006     |     FLASH_DU=  005064 
    FLASH_DU=  0000AE     |     FLASH_DU=  000056     |     FLASH_EN=  027FFF 
    FLASH_FP=  00505D     |     FLASH_FP=  000000     |     FLASH_FP=  000001 
    FLASH_FP=  000002     |     FLASH_FP=  000003     |     FLASH_FP=  000004 
    FLASH_FP=  000005     |     FLASH_IA=  00505F     |     FLASH_IA=  000003 
    FLASH_IA=  000002     |     FLASH_IA=  000006     |     FLASH_IA=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_IA=  000000     |     FLASH_NC=  00505C     |     FLASH_NF=  00505E 
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |   6 FLOATQ     002E6A R
  6 FLOATQ0    002E74 R   |   6 FLOATQ1    002ED9 R   |   6 FLOATQ2    002EE2 R
  6 FLOATQ3    002EEA R   |   6 FLOATQ4    002EFE R   |   6 FLOAT_ER   002F13 R
  6 FLOAT_ER   002F10 R   |     FLSI    =  01F400     |   6 FMOVE      0020EA R
  6 FMOVE2     00211B R   |   6 FNE        002B41 R   |   6 FOR        0014EB R
  6 FORGET     00015A R   |   6 FORGET1    000189 R   |   6 FORGET2    00020F R
  6 FORGET4    000218 R   |   6 FORGET6    0001D1 R   |   6 FOV        002B56 R
  6 FPSTOR     001ABE R   |   6 FPSW       002AEF R   |     FPTR    =  000034 
  6 FREEVAR    000225 R   |   6 FREEVAR4   00025B R   |   6 FRESET     002B01 R
  6 FSLASH     003106 R   |   6 FSLASH1    003132 R   |   6 FSLASH8    003189 R
  6 FSTAR      0030DF R   |   6 FTOD       0031C6 R   |   6 FTOD1      0031F6 R
  6 FTOD2      00320F R   |   6 FTOD3      003219 R   |   6 FTOD4      003224 R
  6 FTOD5      00322C R   |   6 FTOD6      00324C R   |   6 FTOD8      003251 R
  6 FTOD9      00325C R   |   6 FZE        002B2C R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
  6 GREAT      0008C9 R   |   6 GREAT1     0008DF R   |   6 HDOT       000F39 R
  6 HERE       000C14 R   |   6 HEX        000DCC R   |   6 HI         001A09 R
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
  6 ICOLON     0017AF R   |   6 IFETCH     001509 R   |   6 IFF        001546 R
  6 IFMOVE     0021C3 R   |     IMEDD   =  000080     |   6 IMMED      0017C1 R
  6 INCH       00042A R   |   6 INC_FPTR   001C38 R   |   6 INITOFS    001777 R
  6 INN        00066C R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
    INPUT_FL=  000000     |     INPUT_PU=  000001     |   6 INTE1      001375 R
  6 INTER      00134B R   |   6 INTQ       00236C R   |     INT_ADC2=  000016 
    INT_AUAR=  000012     |     INT_AWU =  000001     |     INT_CAN_=  000008 
    INT_CAN_=  000009     |     INT_CLK =  000002     |     INT_EXTI=  000003 
    INT_EXTI=  000004     |     INT_EXTI=  000005     |     INT_EXTI=  000006 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
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
    IRET_COD=  000080     |   6 ISEMI      00170C R   |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   6 JSRC       001761 R   |   6 KEY        000E35 R
  6 KTAP       001265 R   |   6 KTAP1      001288 R   |   6 KTAP2      00128B R
  6 LAST       0006FD R   |   6 LASTN   =  0031C2 R   |   6 LBRAC      001382 R
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
  6 LESS       00088B R   |     LF      =  00000A     |   6 LINK    =  0031C2 R
  6 LITER      0014BD R   |   6 LN2S       00228E R   |   6 LOCK       001C24 R
  6 LOG2S      002278 R   |   6 LSCALE     002F34 R   |   6 LSHIFT     000AE9 R
  6 LSHIFT1    000AF2 R   |   6 LSHIFT4    000AFA R   |   6 LT1        0008A1 R
    MASKK   =  001F7F     |   6 MAX        0008E9 R   |   6 MAX1       0008FC R
    MAX_MANT=  7FFFFF     |   6 MIN        000906 R   |   6 MIN1       000919 R
  6 MMOD1      0009A2 R   |   6 MMOD2      0009B6 R   |   6 MMOD3      0009CD R
  6 MMSM1      00095D R   |   6 MMSM3      000961 R   |   6 MMSM4      00096D R
  6 MMSMa      000968 R   |   6 MMSMb      000973 R   |   6 MMSTA1     00300D R
  6 MMSTA2     003018 R   |   6 MMSTA3     003023 R   |   6 MMSTA4     00308E R
  6 MMSTA5     0030A0 R   |   6 MMSTA6     0030B9 R   |   6 MMSTA7     0030D6 R
  6 MMSTAR     003002 R   |   6 MODD       0009E7 R   |   6 MONE       000B50 R
    MS      =  000030     |   6 MSEC       0002D0 R   |   6 MSMOD      000985 R
  6 MSTA1      000A78 R   |   6 MSTAR      000A55 R   |     NAFR    =  004804 
  6 NAMEQ      00120D R   |   6 NAMET      00111E R   |     NCLKOPT =  004808 
  6 NDROT      0026A3 R   |   6 NEGAT      0007D8 R   |   6 NEX1       000490 R
  6 NEXT       0014FA R   |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   6 NROT       00076B R
  6 NTIB       00067C R   |     NUBC    =  004802     |     NUCLEO  =  000001 
  6 NUFQ       000E4B R   |   6 NUFQ1      000E64 R   |   6 NUMBQ      002415 R
  6 NUMQ0      002456 R   |   6 NUMQ1      002478 R   |   6 NUMQ3      0024A2 R
  6 NUMQ4      0024C3 R   |   6 NUMQ8      0024CC R   |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   6 NonHandl   000000 R   |   6 OFFSET     000722 R
    OFS     =  000005     |   6 ONE        000B42 R   |   6 ONEM       000AD8 R
  6 ONEP       000ACB R   |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTIMIZE=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]

Symbol Table

    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  6 ORIG       000049 R   |   6 ORR        0005F9 R   |   6 OUTPUT     00043B R
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |   6 OVER       0005B0 R   |   6 OVERT      0016DA R
    PA      =  000000     |   6 PACKS      000CD4 R   |   6 PAD        000C25 R
  6 PAREN      00108E R   |   6 PARS       000F87 R   |   6 PARS1      000FB2 R
  6 PARS2      000FDD R   |   6 PARS3      000FE0 R   |   6 PARS4      000FE9 R
  6 PARS5      00100C R   |   6 PARS6      001021 R   |   6 PARS7      001030 R
  6 PARS8      00103F R   |   6 PARSE      001050 R   |   6 PARSEXP_   002E4D R
  6 PAUSE      0002E0 R   |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |   6 PDUM1      0018F1 R   |   6 PDUM2      001902 R
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
    PH_ODR  =  005023     |     PI      =  000028     |   6 PICK       000B90 R
  6 PII        0021F1 R   |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   6 PLUS       0007AD R   |   6 PNAM1      00167F R
  6 POSMANT    002C30 R   |   6 PRESE      001401 R   |     PROD1   =  000024 
    PROD2   =  000026     |     PROD3   =  000028     |   6 PROTECTE   000201 R
  6 PSTOR      000BA7 R   |     PTR16   =  000035     |     PTR8    =  000036 
  6 PTRPLUS    001C50 R   |   6 QBRAN      000498 R   |   6 QDUP       00073B R
  6 QDUP1      000745 R   |   6 QKEY       000418 R   |   6 QSTAC      0013B9 R
  6 QUERY      0012E5 R   |   6 QUEST      000F79 R   |   6 QUIT       00141E R
  6 QUIT1      001426 R   |   6 QUIT2      001429 R   |   6 RAM2EE     00208B R
    RAMBASE =  000000     |   6 RAMLAST    000710 R   |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   6 RANDOM     00027E R
  6 RAT        000545 R   |   6 RBRAC      00174E R   |   6 REPEA      0015C3 R
  6 RFREE      002072 R   |   6 RFROM      000534 R   |     ROP     =  004800 
  6 ROT        00074C R   |   6 ROW2BUF    002034 R   |     ROWBUFF =  001680 
    RP0     =  00002E     |   6 RPAT       000511 R   |     RPP     =  0017FF 
  6 RPSTO      00051E R   |   6 RSCALE     002F5A R   |   6 RSHIFT     000B05 R
  6 RSHIFT1    000B0E R   |   6 RSHIFT4    000B16 R   |     RST_SR  =  0050B3 
  6 RT12_2     002261 R   |   6 SAME1      00113C R   |   6 SAME2      001165 R
  6 SAMEQ      001134 R   |   6 SCAL1      002F8D R   |   6 SCAL2      002FB9 R
  6 SCALETOM   002F87 R   |   6 SCOM1      0016B4 R   |   6 SCOM2      0016B7 R
  6 SCOMP      001696 R   |   6 SEED       000265 R   |     SEEDX   =  000038 
    SEEDY   =  00003A     |   6 SEMIS      0016EA R   |   6 SETISP     0000D0 R
  6 SET_RAML   001831 R   |   6 SFN        002BA2 R   |     SFR_BASE=  005000 
    SFR_END =  0057FF     |   6 SFV        002BDA R   |   6 SFZ        002B6B R
  6 SIGN       000D80 R   |   6 SIGN1      000D90 R   |   6 SLASH      0009F1 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]

Symbol Table

  6 SLMOD      0009D5 R   |   6 SNAME      001649 R   |     SP0     =  00002C 
  6 SPACE      000E6D R   |   6 SPACS      000E7C R   |   6 SPAT       000568 R
    SPI_CR1 =  005200     |     SPI_CR2 =  005201     |     SPI_CRCP=  005205 
    SPI_DR  =  005204     |     SPI_ICR =  005202     |     SPI_RXCR=  005206 
    SPI_SR  =  005203     |     SPI_TXCR=  005207     |     SPP     =  001680 
    SPSAVE  =  000001     |   6 SPSTO      000575 R   |   6 SQRT10     00224A R
  6 SQRT2      002208 R   |   6 SQRT3      00221F R   |   6 SSMOD      000A81 R
    SSP     =  000001     |     STACK   =  0017FF     |   6 STAR       000A4A R
  6 STASL      000A92 R   |   6 STEXP      002C3B R   |   6 STEXP1     002C51 R
  6 STEXP2     002C8D R   |   6 STEXP3     002CA0 R   |   6 STOD       00080F R
  6 STORE      0004D1 R   |   6 STR        000DAE R   |   6 STRCQ      0014CB R
  6 STRQ       001602 R   |   6 STRQP      000ED8 R   |   6 SUBB       000826 R
  6 SWAPP      000598 R   |     SWIM_CSR=  007F80     |   6 TAP        00124F R
  6 TBOOT      001A40 R   |   6 TBRAN      0004A6 R   |   6 TBUF       00068C R
    TBUFFBAS=  001680     |   6 TCHAR      000B61 R   |   6 TEMP       00065D R
  6 TEVAL      0006AF R   |   6 TFLASH     00069E R   |   6 THENN      00155B R
  6 TIB        000C36 R   |     TIBB    =  001700     |     TIBBASE =  001700 
    TIC     =  000027     |   6 TICK       001435 R   |     TIM1_ARR=  005262 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
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
  6 TNAM2      001987 R   |   6 TNAM3      0019A5 R   |   6 TNAM4      0019AB R
  6 TNAME      001984 R   |   6 TOFLASH    000335 R   |   6 TOKEN      001110 R
  6 TOR        000551 R   |   6 TORAM      000375 R   |     TRUEE   =  00FFFF 
  6 TWOSL      000B1D R   |   6 TYPE1      000E9C R   |   6 TYPE2      000EA2 R
  6 TYPES      000E97 R   |   6 Timer4Ha   000005 R   |     UART1   =  000000 
    UART1_BA=  005230     |     UART1_BR=  005232     |     UART1_BR=  005233 
    UART1_CR=  005234     |     UART1_CR=  005235     |     UART1_CR=  005236 
    UART1_CR=  005237     |     UART1_CR=  005238     |     UART1_DR=  005231 
    UART1_GT=  005239     |     UART1_PO=  000000     |     UART1_PS=  00523A 
    UART1_RX=  000004     |     UART1_SR=  005230     |     UART1_TX=  000005 
    UART3   =  000001     |     UART3_BA=  005240     |     UART3_BR=  005242 
    UART3_BR=  005243     |     UART3_CR=  005244     |     UART3_CR=  005245 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
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
  6 UDIV10     002FBA R   |   6 UDOT       000F25 R   |   6 UDOTR      000F05 R
  6 UEND       000047 R   |     UFPSW   =  000008     |   6 UGREAT     0008AA R
  6 UGREAT1    0008C1 R   |     UHLD    =  000014     |     UINN    =  00000C 
    UINTER  =  000012     |     ULAST   =  00001C     |   6 ULES1      000883 R
  6 ULESS      00086D R   |   6 UMMOD      000941 R   |   6 UMSTA      000A00 R
  6 UNIQ1      001640 R   |   6 UNIQU      001621 R   |   6 UNLKEE     001BBE R
  6 UNLKFL     001BDD R   |   6 UNLOCK     001BFC R   |   6 UNTIL      001523 R
    UOFFSET =  00001E     |   6 UPDATCP    001B7B R   |   6 UPDATLAS   001B52 R
  6 UPDATPTR   00217E R   |   6 UPDATRUN   001B6A R   |   6 UPDATVP    001B92 R
  6 UPL1       00063A R   |   6 UPLUS      000623 R   |     UPP     =  000006 
  6 UPPER      0010D3 R   |   6 UPPER1     0010F6 R   |   6 UPPER2     0010FF R
    URLAST  =  000022     |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     UTFLASH =  000020     |     UTIB    =  000010 
    UTMP    =  00000A     |   6 UTYP1      0018C1 R   |   6 UTYP2      0018D0 R
  6 UTYPE      0018BC R   |     UVP     =  000018     |   6 UZERO      00002B R
  6 VARIA      0017FE R   |     VAR_BASE=  000080     |     VAR_TOP =  0017BF 
    VER     =  000004     |   6 VPP        0006DF R   |     VSIZE   =  000006 
    WANT_CON=  000001     |     WANT_DEB=  000000     |     WANT_DOU=  000001 
    WANT_FLO=  000001     |     WANT_SCA=  000001     |     WANT_SEE=  000000 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |   6 WHILE      0015A9 R
  6 WITHI      000926 R   |   6 WORDD      0010B9 R   |   6 WORDS      0019E1 R
  6 WORS1      0019E7 R   |   6 WORS2      001A03 R   |   6 WR_BYTE    001CA7 R
  6 WR_WORD    001CCC R   |   6 WTABLE     0022D6 R   |   6 WTAT       0022FA R
  6 WTINIT     00233F R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XMEM_SIZ=  017830     |     XOFF    =  000013     |     XON     =  000011 
  6 XORR       00060E R   |     XTEMP   =  000024     |     YTEMP   =  000026 
  6 ZEQ1       0024EC R   |   6 ZEQU1      0005DB R   |   6 ZEQUAL     0005D1 R
  6 ZERO       000B37 R   |   6 ZL1        0005C8 R   |   6 ZLESS      0005BF R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]

Symbol Table

  6 app_spac   003280 R   |   6 baudrate   00037B R   |   6 block_er   001D92 R
  6 clear_ra   000019 R   |   6 clock_in   000064 R   |   6 copy_buf   001DF2 R
  6 copy_buf   001E11 R   |   6 copy_pro   001E11 R   |     da      =  000002 
    db      =  000003     |     dc      =  000000     |     dd      =  000001 
  6 do2lit     00286D R   |   6 erase_fl   001DB4 R   |   6 fmove_do   002167 R
  6 main       000016 R   |   6 next_row   002124 R   |   6 no_move    00216E R
  6 nsign      00238A R   |   6 nsign1     0023BB R   |   6 parse_di   0023C2 R
  6 parse_ex   002E02 R   |   6 pristine   001E92 R   |   6 proceed_   001DB7 R
  6 reboot     000327 R   |   6 reset_ve   001EF9 R   |   6 row_eras   001D72 R
  6 row_eras   001DCB R   |   6 row_eras   001DF2 R   |   6 set_opti   001E66 R
  6 set_vect   001F9A R   |   6 uart_ini   000076 R   |   6 write_ro   001E36 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   3280   flags    0

