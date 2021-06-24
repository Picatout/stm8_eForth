ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 1.
Hexadecimal [24-Bits]



                                      1 ;-------------------------------------------------------------
                                      2 ;  eForth for STM8S adapted from C. H. Ting source file to 
                                      3 ;  assemble using sdasstm8
                                      4 ;  implemented on NUCLEO-8S208RB board
                                      5 ;  Adapted by picatout 2019/10/27
                                      6 ;  https://github.com/picatout/stm8_nucleo/eForth
                                      7 ;--------------------------------------------------------------
                                      8 	.module EFORTH
                                      9          .optsdcc -mstm8
                                                .include "inc/macros.inc" 
                                        ;;
                                        ; Copyright Jacques Deschênes 2019 
                                        ; This file is part of STM8_NUCLEO 
                                        ;
                                        ;     STM8_NUCLEO is free software: you can redistribute it and/or modify
                                        ;     it under the terms of the GNU General Public License as published by
                                        ;     the Free Software Foundation, either version 3 of the License, or
                                        ;     (at your option) any later version.
                                        ;
                                        ;     STM8_NUCLEO is distributed in the hope that it will be useful,
                                        ;     but WITHOUT ANY WARRANTY; without even the implied warranty of
                                        ;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                        ;     GNU General Public License for more details.
                                        ;
                                        ;     You should have received a copy of the GNU General Public License
                                        ;     along with STM8_NUCLEO.  If not, see <http://www.gnu.org/licenses/>.
                                        ;;
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
                                        
                                            ; branch if TOS==0 
                                            ; 0BRANCH 
                                            .macro _QBRAN target 
                                        
                                            ; uncondittionnal BRANCH 
                                            .macro _BRAN target 
                                        
                                            ; run time NEXT 
                                            .macro _DONXT target 
                                                .include "inc/config.inc"
                                        ;;
                                        ; Copyright Jacques Deschênes 2019,2020 
                                        ; This file is part of stm8_eForth  
                                        ;
                                        ;     stm8_eForth is free software: you can redistribute it and/or modify
                                        ;     it under the terms of the GNU General Public License as published by
                                        ;     the Free Software Foundation, either version 3 of the License, or
                                        ;     (at your option) any later version.
                                        ;
                                        ;     stm8_eForth is distributed in the hope that it will be useful,
                                        ;     but WITHOUT ANY WARRANTY; without even the implied warranty of
                                        ;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                        ;     GNU General Public License for more details.
                                        ;
                                        ;     You should have received a copy of the GNU General Public License
                                        ;     along with stm8_eForth.  If not, see <http://www.gnu.org/licenses/>.
                                        ;;
                                        
                                        
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
                                        ;;
                                        ; Copyright Jacques Deschênes 2019 
                                        ; This file is part of MONA 
                                        ;
                                        ;     MONA is free software: you can redistribute it and/or modify
                                        ;     it under the terms of the GNU General Public License as published by
                                        ;     the Free Software Foundation, either version 3 of the License, or
                                        ;     (at your option) any later version.
                                        ;
                                        ;     MONA is distributed in the hope that it will be useful,
                                        ;     but WITHOUT ANY WARRANTY; without even the implied warranty of
                                        ;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                        ;     GNU General Public License for more details.
                                        ;
                                        ;     You should have received a copy of the GNU General Public License
                                        ;     along with MONA.  If not, see <http://www.gnu.org/licenses/>.
                                        ;;
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
                                        ;;
                                        ; Copyright Jacques Deschênes 2019 
                                        ; This file is part of MONA 
                                        ;
                                        ;     MONA is free software: you can redistribute it and/or modify
                                        ;     it under the terms of the GNU General Public License as published by
                                        ;     the Free Software Foundation, either version 3 of the License, or
                                        ;     (at your option) any later version.
                                        ;
                                        ;     MONA is distributed in the hope that it will be useful,
                                        ;     but WITHOUT ANY WARRANTY; without even the implied warranty of
                                        ;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                        ;     GNU General Public License for more details.
                                        ;
                                        ;     You should have received a copy of the GNU General Public License
                                        ;     along with MONA.  If not, see <http://www.gnu.org/licenses/>.
                                        ;;
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
                                        
                                        	
                                         
                                        
                                        
                                        
                                     13 	.list
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



                                     15 
                                     16 ;===============================================================
                                     17 ;  Adaption to NUCLEO-8S208RB by Picatout
                                     18 ;  Date: 2020-06-07 
                                     19 ;       Suite aux nombreux changement remplacé le numéro de version pour 3.0
                                     20 ;  Date: 2019-10-26
                                     21 ;  Changes to memory map:
                                     22 ;       0x16f0  Data Stack, growing downward
                                     23 ;       0x1700  Terminal input buffer TIB
                                     24 ;       0x17ff  Return Stack, growing downard
                                     25 ;================================================================
                                     26 ;       STM8EF, Version 2.1, 13 July
                                     27 ;               Implemented on STM8S-Discovery Board.
                                     28 ;               Assembled by ST VisualDevelop STVD 
                                     29 ;               Bootup on internal 2 MHz clock
                                     30 ;               Switch to external 16 MHz crystal clock
                                     31 ;
                                     32 ; FORTH Virtual Machine:
                                     33 ; Subroutine threaded model
                                     34 ; SP Return stack pointer
                                     35 ; X Data stack pointer
                                     36 ; A,Y Scratch pad registers
                                     37 ;
                                     38 ; Memory Map:
                                     39 ; 0x0 RAM memory, system variables
                                     40 ; 0x80 Start of user defined words, linked to ROM dictionary
                                     41 ; 0x780 Data stack, growing downward
                                     42 ; 0x790 Terminal input buffer TIB
                                     43 ; 0x7FF Return stack, growing downward
                                     44 ; 0x8000 Interrupt vector table
                                     45 ; 0x8080 FORTH startup code
                                     46 ; 0x80E7 Start of FORTH dictionary in ROM
                                     47 ; 0x9584 End of FORTH dictionary
                                     48 ;
                                     49 ;       2020-04-26 Addapted for NUCLEO-8S208RB by Picatout 
                                     50 ;                  use UART1 instead of UART2 for communication with user.
                                     51 ;                  UART1 is available as ttyACM* device via USB connection.
                                     52 ;                  Use TIMER4 for millisecond interrupt to support MS counter 
                                     53 ;                  and MSEC word that return MS value.
                                     54 ;
                                     55 ;       EF12, Version 2.1, 18apr00cht
                                     56 ;               move to 8000H replacing WHYP.
                                     57 ;               copy interrupt vectors from WHYPFLSH.S19
                                     58 ;               to EF12.S19 before flashing
                                     59 ;               add TICKS1 and DELAY1 for motor stepping
                                     60 ;
                                     61 ;       EF12, 02/18/00, C. H. Ting
                                     62 ;       Adapt 86eForth v2.02 to 68HC12.
                                     63 ;               Use WHYP to seed EF12.ASM
                                     64 ;               Use AS12 native 68HC12 assembler:
                                     65 ;               as12 ef12.asm >ef12.lst
                                     66 ;       EF12A, add ADC code, 02mar00cht
                                     67 ;       EF12B, 01mar00cht
                                     68 ;               stack to 0x78, return stack to 0xf8.
                                     69 ;               add all port definitions
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



                                     70 ;               add PWM registers
                                     71 ;               add SPI registers and code
                                     72 ;       EF12C, 12mar00cht
                                     73 ;               add MAX5250 D/A converter
                                     74 ;       EF12D, 15mar00cht
                                     75 ;               add all the Lexel interface words
                                     76 ;       EF12E, 18apr00cht, save for reference
                                     77 ;
                                     78 ;       Copyright (c) 2000
                                     79 ;       Dr. C. H. Ting
                                     80 ;       156 14th Avenue
                                     81 ;       San Mateo, CA 94402
                                     82 ;       (650) 571-7639
                                     83 ;
                                     84 
                                     85       
                                     86 ;*********************************************************
                                     87 ;	Assembler constants
                                     88 ;*********************************************************
                           000000    89 RAMBASE =	0x0000	   ;ram base
                           000001    90 .if NUCLEO 
                           0017FF    91 STACK   =	0x17FF 	;system (return) stack empty 
                           001680    92 DATSTK  =	0x1680	;data stack  empty
                           001680    93 TBUFFBASE =     0x1680  ; flash read/write transaction buffer address  
                           001700    94 TIBBASE =       0X1700  ; transaction input buffer addr.
                           000000    95 .else ; DISCOVERY
                                     96 STACK   =	0x7FF 	;system (return) stack empty 
                                     97 DATSTK  =	0x680	;data stack  empty
                                     98 TBUFFBASE =     0x680  ; flash read/write transaction buffer address  
                                     99 TIBBASE =       0X700  ; transaction input buffer addr.
                                    100 .endif
                                    101 
                                    102 ;; Memory allocation
                           000006   103 UPP     =     RAMBASE+6          ; systeme variables base address 
                           001680   104 SPP     =     RAMBASE+DATSTK     ; data stack bottom 
                           0017FF   105 RPP     =     RAMBASE+STACK      ;  return stack bottom
                           001680   106 ROWBUFF =     RAMBASE+TBUFFBASE ; flash write buffer 
                           001700   107 TIBB    =     RAMBASE+TIBBASE  ; transaction input buffer
                           000080   108 VAR_BASE =    RAMBASE+0x80  ; user variables start here .
                           0017BF   109 VAR_TOP =     STACK-32*CELLL  ; reserve 32 cells for data stack. 
                                    110 
                                    111 ; user variables constants 
                           000006   112 UBASE = UPP       ; numeric base 
                           000008   113 UFBASE = UBASE+2  ; floating point base 
                           00000A   114 UFPSW = UFBASE+2  ; floating point state word 
                           00000C   115 UTMP = UFPSW+2    ; temporary storage
                           00000E   116 UINN = UTMP+2     ; >IN tib pointer 
                           000010   117 UCTIB = UINN+2    ; tib count 
                           000012   118 UTIB = UCTIB+2    ; tib address 
                           000014   119 UINTER = UTIB+2   ; interpreter vector 
                           000016   120 UHLD = UINTER+2   ; hold 
                           000018   121 UCNTXT = UHLD+2   ; context, dictionary first link 
                           00001A   122 UVP = UCNTXT+2    ; variable pointer 
                           00001C   123 UCP = UVP+2      ; code pointer
                           00001E   124 ULAST = UCP+2    ; last dictionary pointer 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                           000020   125 UOFFSET = ULAST+2 ; distance between CP and VP to adjust jump address at compile time.
                           000022   126 UTFLASH = UOFFSET+2 ; select where between FLASH and RAM for compilation destination. 
                           000024   127 URLAST = UTFLASH+2 ; context for dictionary in RAM memory 
                                    128 
                                    129 ;******  System Variables  ******
                           000026   130 XTEMP	=	URLAST +2;address called by CREATE
                           000028   131 YTEMP	=	XTEMP+2	;address called by CREATE
                           000026   132 PROD1 = XTEMP	;space for UM*
                           000028   133 PROD2 = PROD1+2
                           00002A   134 PROD3 = PROD2+2
                           00002C   135 CARRY = PROD3+2
                           00002E   136 SP0	= CARRY+2	;initial data stack pointer
                           000030   137 RP0	= SP0+2		;initial return stack pointer
                           000032   138 MS    =   RP0+2         ; millisecond counter 
                           000034   139 CNTDWN =  MS+2          ; count down timer 
                           000036   140 FPTR = CNTDWN+2         ; 24 bits farptr 
                           000037   141 PTR16 = FPTR+1          ; middle byte of farptr 
                           000038   142 PTR8 = FPTR+2           ; least byte of farptr 
                           00003A   143 SEEDX = PTR8+2          ; PRNG seed X 
                           00003C   144 SEEDY = SEEDX+2         ; PRNG seed Y 
                                    145 
                                    146 ; EEPROM persistant data  
                           004000   147 APP_LAST = EEPROM_BASE ; Application last word pointer  
                           004002   148 APP_RUN = APP_LAST+2   ; application autorun address 
                           004004   149 APP_CP = APP_RUN+2   ; free application space pointer 
                           004006   150 APP_VP = APP_CP+2  ; free data space pointer 
                                    151 
                                    152 
                                    153 ;***********************************************
                                    154 ;; Version control
                                    155 
                           000003   156 VER     =     3         ;major release version
                           000000   157 EXT     =     0         ;minor extension
                                    158 
                                    159 ;; Constants
                                    160 
                           00FFFF   161 TRUEE   =     0xFFFF      ;true flag
                                    162 
                           000040   163 COMPO   =     0x40     ;lexicon compile only bit
                           000080   164 IMEDD   =     0x80     ;lexicon immediate bit
                           001F7F   165 MASKK   =     0x1F7F  ;lexicon bit mask
                                    166 
                           000002   167 CELLL   =     2       ;size of a cell
                           00000A   168 BASEE   =     10      ;default radix
                           000008   169 BKSPP   =     8       ;back space
                           00000A   170 LF      =     10      ;line feed
                           00000D   171 CRR     =     13      ;carriage return
                           000011   172 XON     =     17
                           000013   173 XOFF    =     19
                           00001B   174 ERR     =     27      ;error escape
                           000027   175 TIC     =     39      ;tick
                           0000CD   176 CALLL   =     0xCD     ;CALL opcodes
                           000080   177 IRET_CODE =   0x80    ; IRET opcode 
                                    178 
                                    179         .macro _ledon
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



                                    180         .if NUCLEO
                                    181         bset PC_ODR,#LED2_BIT
                                    182         .else ;DISCOVERY 
                                    183         .if DISCOVERY
                                    184         bres PD_ODR,#LD1_BIT 
                                    185         .endif
                                    186         .endif
                                    187         .endm
                                    188 
                                    189         .macro _ledoff
                                    190         .if NUCLEO 
                                    191         bres PC_ODR,#LED2_BIT
                                    192         .else ;DISCOVERY 
                                    193         .if DISCOVERY
                                    194         bset PD_ODR,#LD1_BIT 
                                    195         .endif 
                                    196         .endif
                                    197         .endm
                                    198 
                                    199 ;**********************************************************
                                    200         .area DATA (ABS)
      000000                        201         .org RAMBASE 
                                    202 ;**********************************************************
                                    203 
                                    204 ;**********************************************************
                                    205         .area SSEG (ABS) ; STACK
      001700                        206         .org 0x1700
      001700                        207         .ds 256 
                                    208 ; space for DATSTK,TIB and STACK         
                                    209 ;**********************************************************
                                    210 
                                    211 ;**********************************************************
                                    212         .area HOME ; vectors table
                                    213 ;**********************************************************
      008000 82 00 80 96            214 	int main	        ; reset
      008004 82 00 80 80            215 	int NonHandledInterrupt	; trap
      008008 82 00 80 80            216 	int NonHandledInterrupt	; irq0
      00800C 82 00 80 80            217 	int NonHandledInterrupt	; irq1
      008010 82 00 80 80            218 	int NonHandledInterrupt	; irq2
      008014 82 00 80 80            219 	int NonHandledInterrupt	; irq3
      008018 82 00 80 80            220 	int NonHandledInterrupt	; irq4
      00801C 82 00 80 80            221 	int NonHandledInterrupt	; irq5
      008020 82 00 80 80            222 	int NonHandledInterrupt	; irq6
      008024 82 00 80 80            223 	int NonHandledInterrupt	; irq7
      008028 82 00 80 80            224 	int NonHandledInterrupt	; irq8
      00802C 82 00 80 80            225 	int NonHandledInterrupt	; irq9
      008030 82 00 80 80            226 	int NonHandledInterrupt	; irq10
      008034 82 00 80 80            227 	int NonHandledInterrupt	; irq11
      008038 82 00 80 80            228 	int NonHandledInterrupt	; irq12
      00803C 82 00 80 80            229 	int NonHandledInterrupt	; irq13
      008040 82 00 80 80            230 	int NonHandledInterrupt	; irq14
      008044 82 00 80 80            231 	int NonHandledInterrupt	; irq15
      008048 82 00 80 80            232 	int NonHandledInterrupt	; irq16
      00804C 82 00 80 80            233 	int NonHandledInterrupt	; irq17
      008050 82 00 80 80            234 	int NonHandledInterrupt	; irq18
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



      008054 82 00 80 80            235 	int NonHandledInterrupt	; irq19
      008058 82 00 80 80            236 	int NonHandledInterrupt	; irq20
      00805C 82 00 80 80            237 	int NonHandledInterrupt	; irq21
      008060 82 00 80 80            238 	int NonHandledInterrupt	; irq22
      008064 82 00 80 85            239 	int Timer4Handler	; irq23
      008068 82 00 80 80            240 	int NonHandledInterrupt	; irq24
      00806C 82 00 80 80            241 	int NonHandledInterrupt	; irq25
      008070 82 00 80 80            242 	int NonHandledInterrupt	; irq26
      008074 82 00 80 80            243 	int NonHandledInterrupt	; irq27
      008078 82 00 80 80            244 	int NonHandledInterrupt	; irq28
      00807C 82 00 80 80            245 	int NonHandledInterrupt	; irq29
                                    246 
                                    247 ;**********************************************************
                                    248         .area CODE
                                    249 ;**********************************************************
                                    250 
                                    251 ; non handled interrupt reset MCU
      008080                        252 NonHandledInterrupt:
      008080 A6 80            [ 1]  253         ld a, #0x80
      008082 C7 50 D1         [ 1]  254         ld WWDG_CR,a ; WWDG_CR used to reset mcu
                                    255 	;iret
                                    256 
                                    257 ; used for milliseconds counter 
                                    258 ; MS is 16 bits counter 
      008085                        259 Timer4Handler:
      008085 72 5F 53 42      [ 1]  260 	clr TIM4_SR 
      008089 BE 32            [ 2]  261         ldw x,MS 
      00808B 5C               [ 1]  262         incw x 
      00808C BF 32            [ 2]  263         ldw MS,x
      00808E BE 34            [ 2]  264         ldw x,CNTDWN 
      008090 27 03            [ 1]  265         jreq 1$
      008092 5A               [ 2]  266         decw x 
      008093 BF 34            [ 2]  267         ldw CNTDWN,x 
      008095                        268 1$:         
      008095 80               [11]  269         iret 
                                    270 
                                    271 
                                    272 ;; Main entry points and COLD start data
      008096                        273 main:
                                    274 ; clear all RAM
      008096 AE 00 00         [ 2]  275 	ldw X,#RAMBASE
      008099                        276 clear_ram0:
      008099 7F               [ 1]  277 	clr (X)
      00809A 5C               [ 1]  278 	incw X
      00809B A3 17 FF         [ 2]  279 	cpw X,#RAM_END
      00809E 23 F9            [ 2]  280 	jrule clear_ram0
      0080A0 AE 17 FF         [ 2]  281         ldw x,#RPP
      0080A3 94               [ 1]  282         ldw sp,x
                                    283 ; set SEEDX and SEEDY to 1 
      0080A4 3C 3B            [ 1]  284         inc SEEDX+1 
      0080A6 3C 3D            [ 1]  285         inc SEEDY+1          
      0080A8 CC 80 CB         [ 2]  286 	jp ORIG
                                    287 
                                    288 ; COLD initialize these variables.
      0080AB                        289 UZERO:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



      0080AB 00 0A                  290         .word      BASEE   ;BASE
      0080AD 00 0A                  291         .word      10      ; floating point base 
      0080AF 00 00                  292         .word      0       ; floating point state 
      0080B1 00 00                  293         .word      0       ;tmp
      0080B3 00 00                  294         .word      0       ;>IN
      0080B5 00 00                  295         .word      0       ;#TIB
      0080B7 17 00                  296         .word      TIBB    ;TIB
      0080B9 93 EE                  297         .word      INTER   ;'EVAL
      0080BB 00 00                  298         .word      0       ;HLD
      0080BD AE ED                  299         .word      LASTN  ;CNTXT pointer
      0080BF 00 80                  300         .word      VAR_BASE   ;variables free space pointer 
      0080C1 B0 00                  301         .word      app_space ; FLASH free space pointer 
      0080C3 AE ED                  302         .word      LASTN   ;LAST
      0080C5 00 00                  303         .word      0        ; OFFSET 
      0080C7 00 00                  304         .word      0       ; TFLASH
                                    305 ;       .word      0       ; URLAST   
      0080C9 00 00                  306 UEND:   .word      0
                                    307 
      0080CB                        308 ORIG:   
                                    309 ; initialize SP
      0080CB AE 17 FF         [ 2]  310         LDW     X,#STACK  ;initialize return stack
      0080CE 94               [ 1]  311         LDW     SP,X
      0080CF BF 30            [ 2]  312         LDW     RP0,X
      0080D1 AE 16 80         [ 2]  313         LDW     X,#DATSTK ;initialize data stack
      0080D4 BF 2E            [ 2]  314         LDW     SP0,X
                           000001   315 .if NUCLEO        
                                    316 ; initialize PC_5 as output to control LED2
                                    317 ; added by Picatout 
      0080D6 72 1A 50 0D      [ 1]  318         bset PC_CR1,#LED2_BIT
      0080DA 72 1A 50 0E      [ 1]  319         bset PC_CR2,#LED2_BIT
      0080DE 72 1A 50 0C      [ 1]  320         bset PC_DDR,#LED2_BIT
                                    321 .endif 
                           000000   322 .if DISCOVERY
                                    323         bset PD_CR1,#LD1_BIT
                                    324         bset PD_CR2,#LD1_BIT
                                    325         bset PD_DDR,#LD1_BIT 
                                    326 .endif
      000062                        327         _ledoff
                           000001     1         .if NUCLEO 
      0080E2 72 1B 50 0A      [ 1]    2         bres PC_ODR,#LED2_BIT
                           000000     3         .else ;DISCOVERY 
                                      4         .if DISCOVERY
                                      5         bset PD_ODR,#LD1_BIT 
                                      6         .endif 
                                      7         .endif
                                    328 ; initialize clock to HSI
                                    329 ; no divisor 16Mhz 
                                    330 ; Added by Picatout 
      0080E6                        331 clock_init:
      0080E6 72 5F 50 C6      [ 1]  332         clr CLK_CKDIVR
      0080EA 72 12 50 C5      [ 1]  333 	bset CLK_SWCR,#CLK_SWCR_SWEN
                           000001   334 .if NUCLEO|DOORBELL
      0080EE A6 E1            [ 1]  335 	ld a,#CLK_SWR_HSI
                           000000   336 .else ; DISCOVERY as 16Mhz crystal
                                    337 	ld a,#CLK_SWR_HSE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



                                    338 .endif 
      0080F0 C7 50 C4         [ 1]  339 	ld CLK_SWR,a
      0080F3 C1 50 C3         [ 1]  340 1$:	cp a,CLK_CMSR
      0080F6 26 FB            [ 1]  341 	jrne 1$
                                    342         
                                    343 ; initialize UART, 115200 8N1
      0080F8                        344 uart_init:
                           000001   345 .if NUCLEO 
      0080F8 72 14 50 C7      [ 1]  346 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1
                                    347 	; configure tx pin
      0080FC 72 1A 50 02      [ 1]  348 	bset PA_DDR,#UART1_TX_PIN ; tx pin
      008100 72 1A 50 03      [ 1]  349 	bset PA_CR1,#UART1_TX_PIN ; push-pull output
      008104 72 1A 50 04      [ 1]  350 	bset PA_CR2,#UART1_TX_PIN ; fast output
                                    351 	; baud rate 115200 Fmaster=16Mhz  16000000/115200=139=0x8b
                           000000   352 .else ; DISCOVERY use UART2 
                                    353 	bset CLK_PCKENR1,#CLK_PCKENR1_UART2
                                    354 	; configure tx pin
                                    355 	bset PD_DDR,#UART2_TX_PIN ; tx pin
                                    356 	bset PD_CR1,#UART2_TX_PIN ; push-pull output
                                    357 	bset PD_CR2,#UART2_TX_PIN ; fast output
                                    358 .endif
                                    359 ; baud rate 115200 Fmaster=8Mhz  
      008108 35 0B 52 33      [ 1]  360 	mov UART_BRR2,#0x0b ; must be loaded first
      00810C 35 08 52 32      [ 1]  361 	mov UART_BRR1,#0x8
      008110 35 0C 52 35      [ 1]  362 	mov UART_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));|(1<<UART_CR2_RIEN))
                                    363 ; initialize timer4, used for millisecond interrupt  
      008114 35 07 53 45      [ 1]  364 	mov TIM4_PSCR,#7 ; prescale 128  
      008118 35 7D 53 46      [ 1]  365 	mov TIM4_ARR,#125 ; set for 1msec.
      00811C 35 05 53 40      [ 1]  366 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008120 72 10 53 41      [ 1]  367 	bset TIM4_IER,#TIM4_IER_UIE 
                                    368 ; set TIM4 interrupt priority to highest
      008124 A6 3F            [ 1]  369         ld a,#~(IPR_MASK<<6)
      008126 C4 7F 75         [ 1]  370         and a,ITC_SPR6
      008129 AA C0            [ 1]  371         or a,#(IPR3<<6)
      00812B C7 7F 75         [ 1]  372         ld ITC_SPR6,a 
      00812E 9A               [ 1]  373         rim
      00812F CC 9A DF         [ 2]  374         jp  COLD   ;default=MN1
                                    375 
                                    376 
                                    377 ;; place MCU in sleep mode with
                                    378 ;; halt opcode 
                                    379 ;; BYE ( -- )
      008132 00 00                  380         .word 0
                           0000B4   381         LINK=.
      008134 03                     382         .byte 3 
      008135 42 59 45               383         .ascii "BYE"
      008138                        384 BYE: 
      008138 8E               [10]  385         halt 
      008139 81               [ 4]  386         ret 
                                    387 
                                    388 ; Enable interrupts 
                                    389 ; EI ( -- )
      00813A 81 34                  390         .word LINK 
                           0000BC   391         LINK=.
      00813C 02                     392         .byte 2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      00813D 45 49                  393         .ascii "EI"
      00813F                        394 EI:
      00813F 9A               [ 1]  395         rim 
      008140 81               [ 4]  396         ret 
                                    397 
                                    398 ; Disable interrupts
                                    399 ; DI ( -- )
      008141 81 3C                  400         .word LINK 
                           0000C3   401         LINK=.
      008143 02                     402         .byte 2 
      008144 44 49                  403         .ascii "DI"
      008146                        404 DI:
      008146 9B               [ 1]  405         sim 
      008147 81               [ 4]  406         ret 
                                    407 
                                    408 ; set interrupt priority level 
                                    409 ; SET-ISP ( n1 n2 -- )
                                    410 ; n1 level {1..3}
                                    411 ; n2 vector {0..29}
      008148 81 43                  412         .word LINK 
                           0000CA   413         LINK=.
      00814A 07                     414         .byte 7 
      00814B 53 45 54 2D 49 53 50   415         .ascii "SET-ISP"
      008152                        416 SETISP:
      008152 90 93            [ 1]  417         ldw y,x 
      008154 90 FE            [ 2]  418         ldw y,(y)
      008156 A6 04            [ 1]  419         ld a,#4 ; 4 slot per register 
                                    420 ;  quotient select register, remainder select slot in register.        
      008158 90 62            [ 2]  421         div y,a ; register=ITC_SPR1[Y], lshift=2*A 
      00815A A4 03            [ 1]  422         and a,#3 
      00815C 48               [ 1]  423         sll a ; 2*SLOT  lshift 
      00815D 72 A9 7F 70      [ 2]  424         addw y,#ITC_SPR1 
      008161 FF               [ 2]  425         ldw (x),y  ; ( level reg -- )
      008162 90 5F            [ 1]  426         clrw y 
      008164 90 97            [ 1]  427         ld yl,a 
      008166 1D 00 02         [ 2]  428         subw x,#CELLL 
      008169 FF               [ 2]  429         ldw (x),y  ; ( level reg lshift -- )
      00816A 90 93            [ 1]  430         ldw y,x 
      00816C 90 EE 02         [ 2]  431         ldw y,(2,y) 
      00816F 90 F6            [ 1]  432         ld a,(y)   ; reg_value
      008171 1D 00 02         [ 2]  433         subw x,#CELLL 
      008174 FF               [ 2]  434         ldw (x),y ; ( level reg lshift rval -- )
      008175 CD 86 42         [ 4]  435         call OVER ; ( level reg lshift rval lshift -- )
      008178 CD 84 F3         [ 4]  436         call DOLIT 
      00817B 00 03                  437         .word 3
      00817D CD 86 28         [ 4]  438         call SWAPP  ; ( level reg lshift rval 3 lshift )
      008180 CD 8B 63         [ 4]  439         call LSHIFT ; creat slot mask 
      008183 CD 88 61         [ 4]  440         call INVER  ; ( level reg lshift rval mask )
      008186 CD 86 77         [ 4]  441         call ANDD ; ( level reg lshift slot_masked )
      008189 CD 85 E1         [ 4]  442         call TOR  ; ( level reg lshift -- R: slot_masked )
      00818C CD 87 E6         [ 4]  443         call ROT  ; ( reg lshift level )
      00818F CD 86 28         [ 4]  444         call SWAPP ; ( reg level lshift )
      008192 CD 8B 63         [ 4]  445         call LSHIFT  ; ( reg slot_level -- )
      008195 CD 85 C2         [ 4]  446         call RFROM ; ( reg slot_level masked_val )
      008198 CD 86 8B         [ 4]  447         call ORR   ; ( reg updated_rval )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      00819B CD 86 28         [ 4]  448         call SWAPP 
      00819E CD 85 7E         [ 4]  449         call CSTOR
                                    450 
                                    451 ; sélectionne l'application 
                                    452 ; qui démarre automatique lors 
                                    453 ; d'un COLD start 
      0081A1 81 4A                  454         .word LINK 
                           000123   455         LINK=.
      0081A3 07                     456         .byte 7
      0081A4 41 55 54 4F 52 55 4E   457         .ascii "AUTORUN"
      0081AB                        458 AUTORUN:
      0081AB CD 91 B3         [ 4]  459         call TOKEN 
      0081AE CD 86 18         [ 4]  460         call DUPP 
      0081B1 CD 85 26         [ 4]  461         call QBRAN 
      0081B4 82 91                  462         .word FORGET2
      0081B6 CD 92 B0         [ 4]  463         call NAMEQ
      0081B9 CD 87 D5         [ 4]  464         call QDUP 
      0081BC CD 85 26         [ 4]  465         call QBRAN 
      0081BF 82 91                  466         .word FORGET2
      0081C1 CD 86 0E         [ 4]  467         call DROP 
      0081C4 1D 00 04         [ 2]  468         subw x,#2*CELLL 
      0081C7 90 5F            [ 1]  469         clrw y 
      0081C9 FF               [ 2]  470         ldw (x),y 
      0081CA 90 AE 40 02      [ 2]  471         ldw y,#APP_RUN 
      0081CE EF 02            [ 2]  472         ldw (2,x),y 
      0081D0 CC 9D DB         [ 2]  473         jp EESTORE 
                                    474 
                                    475 ;; Reset dictionary pointer before 
                                    476 ;; forgotten word. RAM space and 
                                    477 ;; interrupt vector defined after 
                                    478 ;; must be resetted also.
      0081D3 81 A3                  479         .word LINK 
                           000155   480         LINK=.
      0081D5 06                     481         .byte 6
      0081D6 46 4F 52 47 45 54      482         .ascii "FORGET" 
      0081DC                        483 FORGET: 
      0081DC CD 91 B3         [ 4]  484         call TOKEN
      0081DF CD 86 18         [ 4]  485         call DUPP 
      0081E2 CD 85 26         [ 4]  486         call QBRAN 
      0081E5 82 91                  487         .word FORGET2
      0081E7 CD 92 B0         [ 4]  488         call NAMEQ ; ( a -- ca na | a F )
      0081EA CD 87 D5         [ 4]  489         call QDUP 
      0081ED CD 85 26         [ 4]  490         call QBRAN 
      0081F0 82 91                  491         .word FORGET2
                                    492 ; only forget users words 
      0081F2 CD 86 18         [ 4]  493         call DUPP ; ( ca na na )
      0081F5 CD 84 F3         [ 4]  494         call DOLIT 
      0081F8 B0 00                  495         .word app_space 
      0081FA CD 86 28         [ 4]  496         call SWAPP 
      0081FD CD 89 07         [ 4]  497         call  ULESS 
      008200 CD 85 26         [ 4]  498         call QBRAN 
      008203 82 53                  499         .word FORGET6 
                                    500 ; ( ca na -- )        
                                    501 ;reset ivec with address >= ca
      008205 CD 86 28         [ 4]  502         call SWAPP ; ( na ca -- ) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      008208 CD 9F DE         [ 4]  503         call CHKIVEC ; ( na -- ) 
                                    504 ; start at LAST and link back to na 
                                    505 ; if variable found reset VP at that point.
      00820B                        506 FORGET1:
      00820B CD 87 97         [ 4]  507         call LAST 
      00820E CD 85 71         [ 4]  508         call AT 
      008211 CD 86 18         [ 4]  509         call DUPP  ; ( -- na last last )
      008214 CD 82 A7         [ 4]  510         call FREEVAR ; ( -- na last )
      008217 CD 86 18         [ 4]  511         call DUPP 
      00821A CD 84 F3         [ 4]  512         call DOLIT 
      00821D 00 02                  513         .word 2 
      00821F CD 88 C0         [ 4]  514         call SUBB ; ( na last -- na last lfa ) link address 
      008222 CD 85 71         [ 4]  515         call AT 
      008225 CD 86 18         [ 4]  516         call DUPP ; ( -- na last a a )
      008228 CD 87 6B         [ 4]  517         call CNTXT 
      00822B CD 85 5A         [ 4]  518         call STORE
      00822E CD 87 97         [ 4]  519         call LAST  
      008231 CD 85 5A         [ 4]  520         call STORE ; ( --  na last )
      008234 CD 86 42         [ 4]  521         call OVER 
      008237 CD 88 E8         [ 4]  522         call EQUAL ; ( na last na -- na T|F ) 
      00823A CD 85 26         [ 4]  523         call QBRAN 
      00823D 82 0B                  524         .word FORGET1 
                                    525 ; ( na -- )
      00823F CD 84 F3         [ 4]  526         call DOLIT 
      008242 00 02                  527         .word 2 
      008244 CD 88 C0         [ 4]  528         call SUBB 
      008247 CD 87 87         [ 4]  529         call CPP 
      00824A CD 85 5A         [ 4]  530         call STORE  
      00824D CD 9C 0E         [ 4]  531         call UPDATCP 
      008250 CC 9B E5         [ 2]  532         jp UPDATLAST 
      008253                        533 FORGET6: ; tried to forget a RAM or system word 
                                    534 ; ( ca na -- )
      008253 1D 00 02         [ 2]  535         subw x,#CELLL 
      008256 90 BE 2E         [ 2]  536         ldw y,SP0 
      008259 FF               [ 2]  537         ldw (x),y  
      00825A CD 89 07         [ 4]  538         call ULESS
      00825D CD 85 26         [ 4]  539         call QBRAN 
      008260 82 83                  540         .word PROTECTED 
      008262 CD 93 BC         [ 4]  541         call ABORQ 
      008265 1D                     542         .byte 29
      008266 20 46 6F 72 20 52 41   543         .ascii " For RAM definition do REBOOT"
             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      008283                        544 PROTECTED:
      008283 CD 93 BC         [ 4]  545         call ABORQ
      008286 0A                     546         .byte 10
      008287 20 50 72 6F 74 65 63   547         .ascii " Protected"
             74 65 64
      008291                        548 FORGET2: ; no name or not found in dictionary 
      008291 CD 93 BC         [ 4]  549         call ABORQ
      008294 05                     550         .byte 5
      008295 20 77 68 61 74         551         .ascii " what"
      00829A                        552 FORGET4:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      00829A CC 86 0E         [ 2]  553         jp DROP 
                                    554 
                                    555 
                                    556 ;---------------------------------
                                    557 ; if na is variable 
                                    558 ; free variable data  
                                    559 ; FREEVAR ( na -- )
                                    560 ;---------------------------------
      00829D 81 D5                  561         .word LINK 
                           00021F   562         LINK=.
      00829F 07                     563         .byte 7 
      0082A0 46 52 45 45 56 41 52   564         .ascii "FREEVAR"
      0082A7                        565 FREEVAR:
      0082A7 CD 86 18         [ 4]  566         call DUPP ; ( na na -- )
      0082AA CD 85 8F         [ 4]  567         CALL CAT  ; ( na c -- )
      0082AD CD 8B 45         [ 4]  568         call ONEP ;
      0082B0 CD 88 47         [ 4]  569         CALL PLUS ; ( na c+1 -- ca ) 
      0082B3 CD 8B 45         [ 4]  570         call ONEP ; ( ca+ -- ) to get routne address 
      0082B6 CD 86 18         [ 4]  571         call DUPP ; ( ca+ ca+ -- )
      0082B9 CD 85 71         [ 4]  572         CALL AT   ; ( ca+ fnaddr -- ) ; fnaddr is routine address 
      0082BC CD 84 F3         [ 4]  573         call DOLIT 
      0082BF 86 D8                  574         .word DOVAR ; if routine address is DOVAR then variable 
      0082C1 CD 88 E8         [ 4]  575         call EQUAL  ; ( ca+ fnaddr DOVAR -- ca+ T|F ) 
      0082C4 CD 85 26         [ 4]  576         call QBRAN 
      0082C7 82 DD                  577         .word FREEVAR4 
      0082C9 CD 84 F3         [ 4]  578         call DOLIT 
      0082CC 00 02                  579         .word 2 
      0082CE CD 88 47         [ 4]  580         call PLUS  ; ( ca+ 2 -- da ) da is data address 
      0082D1 CD 85 71         [ 4]  581         call AT 
      0082D4 CD 87 79         [ 4]  582         call VPP   
      0082D7 CD 85 5A         [ 4]  583         call STORE 
      0082DA CC 9C 25         [ 2]  584         jp UPDATVP 
      0082DD                        585 FREEVAR4: ; not variable
      0082DD CC 86 0E         [ 2]  586         jp  DROP 
                                    587 
                                    588 ;    SEED ( n -- )
                                    589 ; Initialize PRNG seed with n 
      0082E0 82 9F                  590         .word LINK 
                           000262   591         LINK=. 
      0082E2 04                     592         .byte 4 
      0082E3 53 45 45 44            593         .ascii "SEED" 
      0082E7                        594 SEED:
      0082E7 90 93            [ 1]  595         ldw y,x 
      0082E9 1C 00 02         [ 2]  596         addw x,#CELLL
      0082EC 90 FE            [ 2]  597         ldw y,(y)
      0082EE 90 9E            [ 1]  598         ld a,yh 
      0082F0 B7 3A            [ 1]  599         ld SEEDX,a 
      0082F2 90 9F            [ 1]  600         ld a,yl 
      0082F4 B7 3C            [ 1]  601         ld SEEDY,a 
      0082F6 81               [ 4]  602         ret 
                                    603 
                                    604 ;    RANDOM ( u1 -- u2 )
                                    605 ; Pseudo random number betwen 0 and u1-1
      0082F7 82 E2                  606         .word LINK 
                           000279   607         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      0082F9 06                     608         .byte 6
      0082FA 52 41 4E 44 4F 4D      609         .ascii "RANDOM" 
      008300                        610 RANDOM:
                                    611 ;local variable 
                           000001   612         SPSAVE=1
                           000002   613         VSIZE=2 
      008300 52 02            [ 2]  614         sub sp,#VSIZE
      008302 1F 01            [ 2]  615         ldw (SPSAVE,sp),x  
                                    616 ; XTEMP=(SEEDX<<5)^SEEDX 
      008304 90 93            [ 1]  617         ldw y,x 
      008306 90 FE            [ 2]  618         ldw y,(y)
      008308 90 BF 28         [ 2]  619         ldw YTEMP,y 
      00830B BE 3A            [ 2]  620 	ldw x,SEEDX 
      00830D 58               [ 2]  621 	sllw x 
      00830E 58               [ 2]  622 	sllw x 
      00830F 58               [ 2]  623 	sllw x 
      008310 58               [ 2]  624 	sllw x 
      008311 58               [ 2]  625 	sllw x 
      008312 9E               [ 1]  626 	ld a,xh 
      008313 B8 3A            [ 1]  627 	xor a,SEEDX 
      008315 B7 26            [ 1]  628 	ld XTEMP,a 
      008317 9F               [ 1]  629 	ld a,xl 
      008318 B8 3B            [ 1]  630 	xor a,SEEDX+1 
      00831A B7 27            [ 1]  631 	ld XTEMP+1,a 
                                    632 ; SEEDX=SEEDY 
      00831C BE 3C            [ 2]  633 	ldw x,SEEDY 
      00831E BF 3A            [ 2]  634 	ldw SEEDX,x  
                                    635 ; SEEDY=SEEDY^(SEEDY>>1)
      008320 54               [ 2]  636 	srlw x 
      008321 9E               [ 1]  637 	ld a,xh 
      008322 B8 3C            [ 1]  638 	xor a,SEEDY 
      008324 B7 3C            [ 1]  639 	ld SEEDY,a  
      008326 9F               [ 1]  640 	ld a,xl 
      008327 B8 3D            [ 1]  641 	xor a,SEEDY+1 
      008329 B7 3D            [ 1]  642 	ld SEEDY+1,a 
                                    643 ; XTEMP>>3 
      00832B BE 26            [ 2]  644 	ldw x,XTEMP 
      00832D 54               [ 2]  645 	srlw x 
      00832E 54               [ 2]  646 	srlw x 
      00832F 54               [ 2]  647 	srlw x 
                                    648 ; x=XTEMP^x 
      008330 9E               [ 1]  649 	ld a,xh 
      008331 B8 26            [ 1]  650 	xor a,XTEMP 
      008333 95               [ 1]  651 	ld xh,a 
      008334 9F               [ 1]  652 	ld a,xl 
      008335 B8 27            [ 1]  653 	xor a,XTEMP+1  
      008337 97               [ 1]  654 	ld xl,a 
                                    655 ; SEEDY=x^SEEDY 
      008338 B8 3D            [ 1]  656 	xor a,SEEDY+1
      00833A 97               [ 1]  657 	ld xl,a 
      00833B 9E               [ 1]  658 	ld a,xh 
      00833C B8 3C            [ 1]  659 	xor a,SEEDY
      00833E 95               [ 1]  660 	ld xh,a 
      00833F BF 3C            [ 2]  661 	ldw SEEDY,x 
                                    662 ; return SEEDY modulo YTEMP  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      008341 90 BE 28         [ 2]  663 	ldw y,YTEMP  
      008344 65               [ 2]  664 	divw x,y 
      008345 1E 01            [ 2]  665 	ldw x,(SPSAVE,sp)
      008347 FF               [ 2]  666         ldw (x),y 
      008348 5B 02            [ 2]  667         addw sp,#VSIZE 
      00834A 81               [ 4]  668 	ret 
                                    669 
                                    670 
                                    671 ;;
                                    672 ;; get millisecond counter 
                                    673 ;; msec ( -- u )
                                    674 ;; Added by Picatout 2020-04-26
      00834B 82 F9                  675         .word LINK  
                           0002CD   676         LINK = . 
      00834D 04                     677         .byte 4
      00834E 4D 53 45 43            678         .ascii "MSEC"
      008352                        679 MSEC: 
      008352 1D 00 02         [ 2]  680         subw x,#CELLL 
      008355 90 BE 32         [ 2]  681         ldw y,MS 
      008358 FF               [ 2]  682         ldw (x),y 
      008359 81               [ 4]  683         ret 
                                    684 
                                    685 ; suspend execution for u msec 
                                    686 ;  pause ( u -- )
      00835A 83 4D                  687         .word LINK 
                           0002DC   688         LINK=.
      00835C 05                     689         .byte 5 
      00835D 50 41 55 53 45         690         .ascii "PAUSE"
      008362                        691 PAUSE:
      008362 90 93            [ 1]  692         ldw y,x
      008364 90 FE            [ 2]  693         ldw y,(y)
      008366 72 B9 00 32      [ 2]  694         addw y,MS 
      00836A 8F               [10]  695 1$:     wfi  
      00836B 90 B3 32         [ 2]  696         cpw y,MS  
      00836E 26 FA            [ 1]  697         jrne 1$        
      008370 1C 00 02         [ 2]  698         addw x,#CELLL 
      008373 81               [ 4]  699         ret 
                                    700 
                                    701 ; initialize count down timer 
                                    702 ;  TIMER ( u -- )  milliseconds 
      008374 83 5C                  703         .word LINK 
                           0002F6   704         LINK=.
      008376 05                     705         .byte 5 
      008377 54 49 4D 45 52         706         .ascii "TIMER" 
      00837C                        707 TIMER:
      00837C 90 93            [ 1]  708         ldw y,x
      00837E 90 FE            [ 2]  709         ldw y,(y) 
      008380 90 BF 34         [ 2]  710         ldw CNTDWN,y
      008383 1C 00 02         [ 2]  711         addw x,#CELLL 
      008386 81               [ 4]  712         ret 
                                    713 
                                    714 ; check for TIMER exiparition 
                                    715 ;  TIMEOUT? ( -- 0|-1 )
      008387 83 76                  716         .word LINK 
                           000309   717         LINK=. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      008389 08                     718         .byte 8 
      00838A 54 49 4D 45 4F 55 54   719         .ascii "TIMEOUT?"
             3F
      008392                        720 TIMEOUTQ: 
      008392 4F               [ 1]  721         clr a
      008393 1D 00 02         [ 2]  722         subw x,#CELLL 
      008396 90 BE 34         [ 2]  723         ldw y,CNTDWN 
      008399 26 01            [ 1]  724         jrne 1$ 
      00839B 43               [ 1]  725         cpl a 
      00839C E7 01            [ 1]  726 1$:     ld (1,x),a 
      00839E F7               [ 1]  727         ld (x),a 
      00839F 81               [ 4]  728         ret         
                                    729 
                                    730 ; reboot MCU 
                                    731 ; REBOOT ( -- )
      0083A0 83 89                  732         .word LINK 
                           000322   733         LINK=. 
      0083A2 06                     734         .byte 6 
      0083A3 52 45 42 4F 4F 54      735         .ascii "REBOOT"
      0083A9                        736 reboot:
      0083A9 CC 80 80         [ 2]  737         jp NonHandledInterrupt
                                    738 
                                    739 ; compile to flash memory 
                                    740 ; TO-FLASH ( -- )
      0083AC 83 A2                  741         .word LINK 
                           00032E   742         LINK=.
      0083AE 08                     743         .byte 8
      0083AF 54 4F 2D 46 4C 41 53   744         .ascii "TO-FLASH"
             48
      0083B7                        745 TOFLASH:
      0083B7 CD 87 AA         [ 4]  746         call RAMLAST 
      0083BA CD 85 71         [ 4]  747         call AT 
      0083BD CD 87 D5         [ 4]  748         call QDUP 
      0083C0 CD 85 26         [ 4]  749         call QBRAN
      0083C3 83 E6                  750         .word 1$
      0083C5 CD 93 BC         [ 4]  751         call ABORQ 
      0083C8 1D                     752         .byte 29
      0083C9 20 4E 6F 74 20 77 68   753         .ascii " Not while definitions in RAM"   
             69 6C 65 20 64 65 66
             69 6E 69 74 69 6F 6E
             73 20 69 6E 20 52 41
             4D
      0083E6 90 AE FF FF      [ 2]  754 1$:     ldw y,#-1 
      0083EA 90 BF 22         [ 2]  755         ldw UTFLASH,y
      0083ED 81               [ 4]  756         ret 
                                    757 
                                    758 ; compile to RAM 
                                    759 ; TO-RAM ( -- )
      0083EE 83 AE                  760         .word LINK 
                           000370   761         LINK=.
      0083F0 06                     762         .byte 6 
      0083F1 54 4F 2D 52 41 4D      763         .ascii "TO-RAM"
      0083F7                        764 TORAM:
      0083F7 90 5F            [ 1]  765         clrw y 
      0083F9 90 BF 22         [ 2]  766         ldw UTFLASH,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      0083FC 81               [ 4]  767         ret 
                                    768 
                                    769 ;; BAUD RATE constants table
                                    770 ; values to put in BRR1 & BRR2 
      0083FD                        771 baudrate: 
      0083FD A0 1B                  772 	.byte 0xa0,0x1b ; 2400
      0083FF D0 05                  773 	.byte 0xd0,0x5  ; 4800 
      008401 68 03                  774 	.byte 0x68,0x3  ; 9600
      008403 34 01                  775 	.byte 0x34,0x1  ; 19200
      008405 11 06                  776 	.byte 0x11,0x6  ; 57600
      008407 08 0B                  777 	.byte 0x8,0xb   ; 115200
                                    778 
                                    779 ; BAUD RATE CONSTANTS names 
                                    780 ; 2400 baud
      008409 83 F0                  781 	.word LINK
                           00038B   782 LINK	= .
      00840B 04                     783 	.byte 4
      00840C 42 32 4B 34            784 	.ascii "B2K4" 
      008410                        785 B2K4:
      008410 1D 00 02         [ 2]  786 	subw x,#CELLL 
      008413 90 5F            [ 1]  787         clrw y
      008415 FF               [ 2]  788         ldw (x),y
      008416 81               [ 4]  789 	ret
                                    790 ; 4800 baud	
      008417 84 0B                  791 	.word LINK
                           000399   792 LINK	= .
      008419 04                     793 	.byte 4
      00841A 42 34 4B 38            794 	.ascii "B4K8" 
      00841E                        795 B4K8:
      00841E 1D 00 02         [ 2]  796         subw x,#CELLL 
      008421 90 AE 00 02      [ 2]  797         ldw y,#2 
      008425 FF               [ 2]  798         ldw (x),y
      008426 81               [ 4]  799         ret 
                                    800 ; 9600 baud
      008427 84 19                  801 	.word LINK
                           0003A9   802 LINK	= .
      008429 04                     803 	.byte 4
      00842A 42 39 4B 36            804 	.ascii "B9K6" 
      00842E                        805 B9K6:
      00842E 1D 00 02         [ 2]  806         subw x,#CELLL 
      008431 90 AE 00 04      [ 2]  807         ldw y,#4 
      008435 FF               [ 2]  808         ldw (x),y 
      008436 81               [ 4]  809         ret 
                                    810 ; 19200 baud
      008437 84 29                  811 	.word LINK
                           0003B9   812 LINK	= .
      008439 05                     813 	.byte 5
      00843A 42 31 39 4B 32         814 	.ascii "B19K2" 
      00843F                        815 B19K2:
      00843F 1D 00 02         [ 2]  816         subw x,#CELLL
      008442 90 AE 00 06      [ 2]  817         ldw y,#6 
      008446 FF               [ 2]  818         ldw (x),y 
      008447 81               [ 4]  819         ret 
                                    820 ; 57600 baud        
      008448 84 39                  821 	.word LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



                           0003CA   822 LINK	= .
      00844A 05                     823 	.byte 5
      00844B 42 35 37 4B 36         824 	.ascii "B57K6" 
      008450                        825 B57K6:
      008450 1D 00 02         [ 2]  826         subw x,#CELLL 
      008453 90 AE 00 08      [ 2]  827         ldw y,#8 
      008457 FF               [ 2]  828         ldw (x),y 
      008458 81               [ 4]  829         ret 
                                    830 ; 115200 baud 
      008459 84 4A                  831 	.word LINK
                           0003DB   832 LINK	= .
      00845B 06                     833 	.byte 6
      00845C 42 31 31 35 4B 32      834 	.ascii "B115K2" 
      008462                        835 B115K2:
      008462 1D 00 02         [ 2]  836 	subw x,#CELLL 
      008465 90 AE 00 0A      [ 2]  837         ldw y,#10 
      008469 FF               [ 2]  838         ldw (x),y 
      00846A 81               [ 4]  839         ret 
                                    840 	
                                    841 ;; set UART2 BAUD rate
                                    842 ;	BAUD ( u -- )
      00846B 84 5B                  843 	.word LINK 
                           0003ED   844 LINK	= .
      00846D 04                     845 	.byte 4
      00846E 42 41 55 44            846 	.ascii "BAUD" 
      008472                        847 BAUD:
      008472 1D 00 02         [ 2]  848 	subw x,#CELLL
      008475 90 AE 83 FD      [ 2]  849         ldw y,#baudrate 
      008479 FF               [ 2]  850         ldw (x),y 
      00847A CD 88 47         [ 4]  851         call PLUS
      00847D 90 93            [ 1]  852         ldw y,x  
      00847F 90 FE            [ 2]  853         ldw y,(y)
      008481 90 F6            [ 1]  854         ld a,(y)
      008483 88               [ 1]  855         push a 
      008484 90 5C            [ 1]  856         incw y 
      008486 90 F6            [ 1]  857         ld a,(y)
      008488 C7 52 33         [ 1]  858         ld UART_BRR2,a 
      00848B 84               [ 1]  859         pop a
      00848C C7 52 32         [ 1]  860         ld UART_BRR1,a 
      00848F 1C 00 02         [ 2]  861         addw x,#CELLL 
      008492 81               [ 4]  862         ret 
                                    863 
                                    864 ;; Device dependent I/O
                                    865 ;       ?RX     ( -- c T | F )
                                    866 ;         Return input byte and true, or false.
      008493 84 6D                  867         .word      LINK 
                           000415   868 LINK	= .
      008495 04                     869         .byte      4
      008496 3F 4B 45 59            870         .ascii     "?KEY"
      00849A                        871 QKEY:
      00849A 90 5F            [ 1]  872         CLRW Y 
      00849C 72 0B 52 30 0B   [ 2]  873         BTJF UART_SR,#UART_SR_RXNE,INCH   ;check status
      0084A1 C6 52 31         [ 1]  874         LD    A,UART_DR   ;get char in A
      0084A4 1D 00 02         [ 2]  875 	SUBW	X,#2
      0084A7 E7 01            [ 1]  876         LD     (1,X),A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      0084A9 7F               [ 1]  877 	CLR	(X)
      0084AA 90 53            [ 2]  878         CPLW     Y
      0084AC                        879 INCH:
      0084AC 1D 00 02         [ 2]  880 		SUBW	X,#2
      0084AF FF               [ 2]  881         LDW     (X),Y
      0084B0 81               [ 4]  882         RET
                                    883 
                                    884 ;       TX!     ( c -- )
                                    885 ;       Send character c to  output device.
      0084B1 84 95                  886         .word      LINK
                           000433   887 LINK	= .
      0084B3 04                     888         .byte      4
      0084B4 45 4D 49 54            889         .ascii     "EMIT"
      0084B8                        890 EMIT:
      0084B8 E6 01            [ 1]  891         LD     A,(1,X)
      0084BA 1C 00 02         [ 2]  892 	ADDW	X,#2
      0084BD 72 0F 52 30 FB   [ 2]  893 OUTPUT: BTJF UART_SR,#UART_SR_TXE,OUTPUT  ;loop until tx empty 
      0084C2 C7 52 31         [ 1]  894         LD    UART_DR,A   ;send A
      0084C5 81               [ 4]  895         RET
                                    896 
                                    897 ;       FC-XON  ( -- )
                                    898 ;       send XON character 
      0084C6 84 B3                  899         .word LINK
                           000448   900 LINK    = .
      0084C8 06                     901         .byte 6 
      0084C9 46 43 2D 58 4F 4E      902         .ascii "FC-XON"
      0084CF                        903 FC_XON:
      0084CF 1D 00 02         [ 2]  904         subw x,#CELLL 
      0084D2 7F               [ 1]  905         clr (x)
      0084D3 A6 11            [ 1]  906         ld a,#XON 
      0084D5 E7 01            [ 1]  907         ld (1,x),a 
      0084D7 CD 84 B8         [ 4]  908         call EMIT 
      0084DA 81               [ 4]  909         ret 
                                    910 
                                    911 ;       FC-XOFF ( -- )
                                    912 ;       Send XOFF character 
      0084DB 84 C8                  913         .word LINK
                           00045D   914 LINK    = .
      0084DD 07                     915         .byte 7
      0084DE 46 43 2D 58 4F 46 46   916         .ascii "FC-XOFF"
      0084E5                        917 FC_XOFF:
      0084E5 1D 00 02         [ 2]  918         subw x,#CELLL 
      0084E8 7F               [ 1]  919         clr (x)
      0084E9 A6 13            [ 1]  920         ld a,#XOFF 
      0084EB E7 01            [ 1]  921         ld (1,x),a 
      0084ED CD 84 B8         [ 4]  922         call EMIT 
      0084F0 81               [ 4]  923         ret
                                    924 
                                    925 ;; The kernel
                                    926 
                                    927 ;       doLIT   ( -- w )
                                    928 ;       Push an inline literal.
      0084F1 84 DD                  929         .word      LINK
                                    930 ;LINK	= 	.
                                    931 ;	.byte      COMPO+5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



                                    932 ;        .ascii     "DOLIT"
      0084F3                        933 DOLIT:
      0084F3 1D 00 02         [ 2]  934 	SUBW X,#2
      0084F6 16 01            [ 2]  935         ldw y,(1,sp)
      0084F8 90 FE            [ 2]  936         ldw y,(y)
      0084FA FF               [ 2]  937         ldw (x),y
      0084FB 90 85            [ 2]  938         popw y 
      0084FD 90 EC 02         [ 2]  939         jp (2,y)
                                    940 
                                    941 ;       next    ( -- )
                                    942 ;       Code for  single index loop.
      008500 84 DD                  943         .word      LINK
                           000482   944 LINK	= 	.
      008502 44                     945 	.byte      COMPO+4
      008503 6E 65 78 74            946         .ascii     "next"
      008507                        947 DONXT:
      008507 16 03            [ 2]  948 	LDW Y,(3,SP)
      008509 90 5A            [ 2]  949 	DECW Y
      00850B 2A 07            [ 1]  950 	JRPL NEX1 ; jump if N=0
      00850D 90 85            [ 2]  951 	POPW Y
      00850F 5B 02            [ 2]  952         addw sp,#2
      008511 90 EC 02         [ 2]  953         JP (2,Y)
      008514                        954 NEX1:
      008514 17 03            [ 2]  955         LDW (3,SP),Y
      008516 90 85            [ 2]  956         POPW Y
      008518 90 FE            [ 2]  957 	LDW Y,(Y)
      00851A 90 FC            [ 2]  958 	JP (Y)
                                    959 
                                    960 ;       ?branch ( f -- )
                                    961 ;       Branch if flag is zero.
      00851C 85 02                  962         .word      LINK
                           00049E   963 LINK	= 	.
      00851E 47                     964 	.byte      COMPO+7
      00851F 3F 42 52 41 4E 43 48   965         .ascii     "?BRANCH"
      008526                        966 QBRAN:	
      008526 90 93            [ 1]  967         LDW Y,X
      008528 1C 00 02         [ 2]  968 	ADDW X,#2
      00852B 90 FE            [ 2]  969 	LDW Y,(Y)
      00852D 27 0E            [ 1]  970         JREQ     BRAN
      00852F 90 85            [ 2]  971 	POPW Y
      008531 90 EC 02         [ 2]  972 	JP (2,Y)
                                    973         
                                    974 ;       branch  ( -- )
                                    975 ;       Branch to an inline address.
      008534 85 1E                  976         .word      LINK
                           0004B6   977 LINK	= 	.
      008536 46                     978 	.byte      COMPO+6
      008537 42 52 41 4E 43 48      979         .ascii     "BRANCH"
      00853D                        980 BRAN:
      00853D 90 85            [ 2]  981         POPW Y
      00853F 90 FE            [ 2]  982 	LDW Y,(Y)
      008541 90 FC            [ 2]  983         JP     (Y)
                                    984 
                                    985 ;       EXECUTE ( ca -- )
                                    986 ;       Execute  word at ca.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      008543 85 36                  987         .word      LINK
                           0004C5   988 LINK	= 	.
      008545 07                     989         .byte       7
      008546 45 58 45 43 55 54 45   990         .ascii     "EXECUTE"
      00854D                        991 EXECU:
      00854D 90 93            [ 1]  992         LDW Y,X
      00854F 1C 00 02         [ 2]  993 	ADDW X,#2
      008552 90 FE            [ 2]  994 	LDW  Y,(Y)
      008554 90 FC            [ 2]  995         JP   (Y)
                                    996 
                           000001   997 OPTIMIZE = 1
                           000001   998 .if OPTIMIZE 
                                    999 ; remplacement de CALL EXIT par 
                                   1000 ; le opcode de RET.
                                   1001 ; Voir modification au code de ";"
                           000000  1002 .else 
                                   1003 ;       EXIT    ( -- )
                                   1004 ;       Terminate a colon definition.
                                   1005         .word      LINK
                                   1006 LINK = .
                                   1007         .byte      4
                                   1008         .ascii     "EXIT"
                                   1009 EXIT:
                                   1010         POPW Y
                                   1011         RET
                                   1012 .endif 
                                   1013 
                                   1014 ;       !       ( w a -- )
                                   1015 ;       Pop  data stack to memory.
      008556 85 45                 1016         .word      LINK
                           0004D8  1017 LINK = .
      008558 01                    1018         .byte      1
      008559 21                    1019         .ascii     "!"
      00855A                       1020 STORE:
      00855A 90 93            [ 1] 1021         LDW Y,X
      00855C 90 FE            [ 2] 1022         LDW Y,(Y)    ;Y=a
      00855E 90 BF 28         [ 2] 1023         LDW YTEMP,Y
      008561 90 93            [ 1] 1024         LDW Y,X
      008563 90 EE 02         [ 2] 1025         LDW Y,(2,Y)
      008566 91 CF 28         [ 5] 1026         LDW [YTEMP],Y ;store w at a
      008569 1C 00 04         [ 2] 1027         ADDW X,#4 ; DDROP 
      00856C 81               [ 4] 1028         RET     
                                   1029 
                                   1030 ;       @       ( a -- w )
                                   1031 ;       Push memory location to stack.
      00856D 85 58                 1032         .word      LINK
                           0004EF  1033 LINK	= 	.
      00856F 01                    1034         .byte    1
      008570 40                    1035         .ascii	"@"
      008571                       1036 AT:
      008571 90 93            [ 1] 1037         LDW Y,X     ;Y = a
      008573 90 FE            [ 2] 1038         LDW Y,(Y)   ; address 
      008575 90 FE            [ 2] 1039         LDW Y,(Y)   ; value 
      008577 FF               [ 2] 1040         LDW (X),Y ;w = @Y
      008578 81               [ 4] 1041         RET     
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



                                   1042 
                                   1043 ;       C!      ( c b -- )
                                   1044 ;       Pop  data stack to byte memory.
      008579 85 6F                 1045         .word      LINK
                           0004FB  1046 LINK	= .
      00857B 02                    1047         .byte      2
      00857C 43 21                 1048         .ascii     "C!"
      00857E                       1049 CSTOR:
      00857E 90 93            [ 1] 1050         LDW Y,X
      008580 90 FE            [ 2] 1051 	LDW Y,(Y)    ;Y=b
      008582 E6 03            [ 1] 1052         LD A,(3,X)    ;D = c
      008584 90 F7            [ 1] 1053         LD  (Y),A     ;store c at b
      008586 1C 00 04         [ 2] 1054 	ADDW X,#4 ; DDROP 
      008589 81               [ 4] 1055         RET     
                                   1056 
                                   1057 ;       C@      ( b -- c )
                                   1058 ;       Push byte in memory to  stack.
      00858A 85 7B                 1059         .word      LINK
                           00050C  1060 LINK	= 	.
      00858C 02                    1061         .byte      2
      00858D 43 40                 1062         .ascii     "C@"
      00858F                       1063 CAT:
      00858F 90 93            [ 1] 1064         LDW Y,X     ;Y=b
      008591 90 FE            [ 2] 1065         LDW Y,(Y)
      008593 90 F6            [ 1] 1066         LD A,(Y)
      008595 E7 01            [ 1] 1067         LD (1,X),A
      008597 7F               [ 1] 1068         CLR (X)
      008598 81               [ 4] 1069         RET     
                                   1070 
                                   1071 ;       RP@     ( -- a )
                                   1072 ;       Push current RP to data stack.
      008599 85 8C                 1073         .word      LINK
                           00051B  1074 LINK	= .
      00859B 03                    1075         .byte      3
      00859C 52 50 40              1076         .ascii     "RP@"
      00859F                       1077 RPAT:
      00859F 90 96            [ 1] 1078         LDW Y,SP    ;save return addr
      0085A1 1D 00 02         [ 2] 1079         SUBW X,#2
      0085A4 FF               [ 2] 1080         LDW (X),Y
      0085A5 81               [ 4] 1081         RET     
                                   1082 
                                   1083 ;       RP!     ( a -- )
                                   1084 ;       Set  return stack pointer.
      0085A6 85 9B                 1085         .word      LINK
                           000528  1086 LINK	= 	. 
      0085A8 43                    1087 	.byte      COMPO+3
      0085A9 52 50 21              1088         .ascii     "RP!"
      0085AC                       1089 RPSTO:
      0085AC 90 85            [ 2] 1090         POPW Y
      0085AE 90 BF 28         [ 2] 1091         LDW YTEMP,Y
      0085B1 90 93            [ 1] 1092         LDW Y,X
      0085B3 90 FE            [ 2] 1093         LDW Y,(Y)
      0085B5 90 94            [ 1] 1094         LDW SP,Y
      0085B7 1C 00 02         [ 2] 1095         ADDW x,#CELLL ; a was not dropped, Picatout 2020-05-24
      0085BA 92 CC 28         [ 5] 1096         JP [YTEMP]
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



                                   1097 
                                   1098 ;       R>      ( -- w )
                                   1099 ;       Pop return stack to data stack.
      0085BD 85 A8                 1100         .word      LINK
                           00053F  1101 LINK	= 	. 
      0085BF 42                    1102 	.byte      COMPO+2
      0085C0 52 3E                 1103         .ascii     "R>"
      0085C2                       1104 RFROM:
      0085C2 90 85            [ 2] 1105         POPW Y    ;save return addr
      0085C4 90 BF 28         [ 2] 1106         LDW YTEMP,Y
      0085C7 90 85            [ 2] 1107         POPW Y
      0085C9 1D 00 02         [ 2] 1108         SUBW X,#2
      0085CC FF               [ 2] 1109         LDW (X),Y
      0085CD 92 CC 28         [ 5] 1110         JP [YTEMP]
                                   1111 
                                   1112 ;       R@      ( -- w )
                                   1113 ;       Copy top of return stack to stack.
      0085D0 85 BF                 1114         .word      LINK
                           000552  1115 LINK	= 	. 
      0085D2 02                    1116         .byte      2
      0085D3 52 40                 1117         .ascii     "R@"
      0085D5                       1118 RAT:
      0085D5 16 03            [ 2] 1119         ldw y,(3,sp)
      0085D7 1D 00 02         [ 2] 1120         subw x,#CELLL 
      0085DA FF               [ 2] 1121         ldw (x),y 
      0085DB 81               [ 4] 1122         ret 
                                   1123 
                                   1124 ;       >R      ( w -- )
                                   1125 ;       Push data stack to return stack.
      0085DC 85 D2                 1126         .word      LINK
                           00055E  1127 LINK	= 	. 
      0085DE 42                    1128 	.byte      COMPO+2
      0085DF 3E 52                 1129         .ascii     ">R"
      0085E1                       1130 TOR:
      0085E1 90 85            [ 2] 1131         POPW Y    ;save return addr
      0085E3 90 BF 28         [ 2] 1132         LDW YTEMP,Y
      0085E6 90 93            [ 1] 1133         LDW Y,X
      0085E8 90 FE            [ 2] 1134         LDW Y,(Y)
      0085EA 90 89            [ 2] 1135         PUSHW Y    ;restore return addr
      0085EC 1C 00 02         [ 2] 1136         ADDW X,#2
      0085EF 92 CC 28         [ 5] 1137         JP [YTEMP]
                                   1138 
                                   1139 ;       SP@     ( -- a )
                                   1140 ;       Push current stack pointer.
      0085F2 85 DE                 1141         .word      LINK
                           000574  1142 LINK	= 	. 
      0085F4 03                    1143         .byte      3
      0085F5 53 50 40              1144         .ascii     "SP@"
      0085F8                       1145 SPAT:
      0085F8 90 93            [ 1] 1146 	LDW Y,X
      0085FA 1D 00 02         [ 2] 1147         SUBW X,#2
      0085FD FF               [ 2] 1148 	LDW (X),Y
      0085FE 81               [ 4] 1149         RET     
                                   1150 
                                   1151 ;       SP!     ( a -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



                                   1152 ;       Set  data stack pointer.
      0085FF 85 F4                 1153         .word      LINK
                           000581  1154 LINK	= 	. 
      008601 03                    1155         .byte      3
      008602 53 50 21              1156         .ascii     "SP!"
      008605                       1157 SPSTO:
      008605 FE               [ 2] 1158         LDW     X,(X)     ;X = a
      008606 81               [ 4] 1159         RET     
                                   1160 
                                   1161 ;       DROP    ( w -- )
                                   1162 ;       Discard top stack item.
      008607 86 01                 1163         .word      LINK
                           000589  1164 LINK	= 	. 
      008609 04                    1165         .byte      4
      00860A 44 52 4F 50           1166         .ascii     "DROP"
      00860E                       1167 DROP:
      00860E 1C 00 02         [ 2] 1168         ADDW X,#2     
      008611 81               [ 4] 1169         RET     
                                   1170 
                                   1171 ;       DUP     ( w -- w w )
                                   1172 ;       Duplicate  top stack item.
      008612 86 09                 1173         .word      LINK
                           000594  1174 LINK	= 	. 
      008614 03                    1175         .byte      3
      008615 44 55 50              1176         .ascii     "DUP"
      008618                       1177 DUPP:
      008618 90 93            [ 1] 1178 	LDW Y,X
      00861A 1D 00 02         [ 2] 1179         SUBW X,#2
      00861D 90 FE            [ 2] 1180 	LDW Y,(Y)
      00861F FF               [ 2] 1181 	LDW (X),Y
      008620 81               [ 4] 1182         RET     
                                   1183 
                                   1184 ;       SWAP    ( w1 w2 -- w2 w1 )
                                   1185 ;       Exchange top two stack items.
      008621 86 14                 1186         .word      LINK
                           0005A3  1187 LINK	= 	. 
      008623 04                    1188         .byte      4
      008624 53 57 41 50           1189         .ascii     "SWAP"
      008628                       1190 SWAPP:
      008628 90 93            [ 1] 1191         LDW Y,X
      00862A 90 FE            [ 2] 1192         LDW Y,(Y)
      00862C 90 BF 28         [ 2] 1193         LDW YTEMP,Y
      00862F 90 93            [ 1] 1194         LDW Y,X
      008631 90 EE 02         [ 2] 1195         LDW Y,(2,Y)
      008634 FF               [ 2] 1196         LDW (X),Y
      008635 90 BE 28         [ 2] 1197         LDW Y,YTEMP
      008638 EF 02            [ 2] 1198         LDW (2,X),Y
      00863A 81               [ 4] 1199         RET     
                                   1200 
                                   1201 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                   1202 ;       Copy second stack item to top.
      00863B 86 23                 1203         .word      LINK
                           0005BD  1204 LINK	= . 
      00863D 04                    1205         .byte      4
      00863E 4F 56 45 52           1206         .ascii     "OVER"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      008642                       1207 OVER:
      008642 1D 00 02         [ 2] 1208         SUBW X,#2
      008645 90 93            [ 1] 1209         LDW Y,X
      008647 90 EE 04         [ 2] 1210         LDW Y,(4,Y)
      00864A FF               [ 2] 1211         LDW (X),Y
      00864B 81               [ 4] 1212         RET     
                                   1213 
                                   1214 ;       0<      ( n -- t )
                                   1215 ;       Return true if n is negative.
      00864C 86 3D                 1216         .word      LINK
                           0005CE  1217 LINK	= . 
      00864E 02                    1218         .byte      2
      00864F 30 3C                 1219         .ascii     "0<"
      008651                       1220 ZLESS:
      008651 A6 FF            [ 1] 1221         LD A,#0xFF
      008653 90 93            [ 1] 1222         LDW Y,X
      008655 90 FE            [ 2] 1223         LDW Y,(Y)
      008657 2B 01            [ 1] 1224         JRMI     ZL1
      008659 4F               [ 1] 1225         CLR A   ;false
      00865A F7               [ 1] 1226 ZL1:    LD     (X),A
      00865B E7 01            [ 1] 1227         LD (1,X),A
      00865D 81               [ 4] 1228 	RET     
                                   1229 
                                   1230 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1231 ;       0= ( n -- f )
                                   1232 ;   n==0?
                                   1233 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0005DE                       1234         _HEADER ZEQUAL,2,"0="
      00865E 86 4E                    1         .word LINK 
                           0005E0     2         LINK=.
      008660 02                       3         .byte 2  
      008661 30 3D                    4         .ascii "0="
      008663                          5         ZEQUAL:
      008663 A6 FF            [ 1] 1235         LD A,#0XFF 
      008665 90 93            [ 1] 1236         LDW Y,X 
      008667 90 FE            [ 2] 1237         LDW Y,(Y)
      008669 27 02            [ 1] 1238         JREQ ZEQU1 
      00866B A6 00            [ 1] 1239         LD A,#0 
      00866D                       1240 ZEQU1:  
      00866D F7               [ 1] 1241         LD (X),A 
      00866E E7 01            [ 1] 1242         LD (1,X),A         
      008670 81               [ 4] 1243         RET 
                                   1244 
                                   1245 
                                   1246 ;       AND     ( w w -- w )
                                   1247 ;       Bitwise AND.
      008671 86 60                 1248         .word      LINK
                           0005F3  1249 LINK	= . 
      008673 03                    1250         .byte      3
      008674 41 4E 44              1251         .ascii     "AND"
      008677                       1252 ANDD:
      008677 F6               [ 1] 1253         LD  A,(X)    ;D=w
      008678 E4 02            [ 1] 1254         AND A,(2,X)
      00867A E7 02            [ 1] 1255         LD (2,X),A
      00867C E6 01            [ 1] 1256         LD A,(1,X)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      00867E E4 03            [ 1] 1257         AND A,(3,X)
      008680 E7 03            [ 1] 1258         LD (3,X),A
      008682 1C 00 02         [ 2] 1259         ADDW X,#2
      008685 81               [ 4] 1260         RET
                                   1261 
                                   1262 ;       OR      ( w w -- w )
                                   1263 ;       Bitwise inclusive OR.
      008686 86 73                 1264         .word      LINK
                           000608  1265 LINK = . 
      008688 02                    1266         .byte      2
      008689 4F 52                 1267         .ascii     "OR"
      00868B                       1268 ORR:
      00868B F6               [ 1] 1269         LD A,(X)    ;D=w
      00868C EA 02            [ 1] 1270         OR A,(2,X)
      00868E E7 02            [ 1] 1271         LD (2,X),A
      008690 E6 01            [ 1] 1272         LD A,(1,X)
      008692 EA 03            [ 1] 1273         OR A,(3,X)
      008694 E7 03            [ 1] 1274         LD (3,X),A
      008696 1C 00 02         [ 2] 1275         ADDW X,#2
      008699 81               [ 4] 1276         RET
                                   1277 
                                   1278 ;       XOR     ( w w -- w )
                                   1279 ;       Bitwise exclusive OR.
      00869A 86 88                 1280         .word      LINK
                           00061C  1281 LINK	= . 
      00869C 03                    1282         .byte      3
      00869D 58 4F 52              1283         .ascii     "XOR"
      0086A0                       1284 XORR:
      0086A0 F6               [ 1] 1285         LD A,(X)    ;D=w
      0086A1 E8 02            [ 1] 1286         XOR A,(2,X)
      0086A3 E7 02            [ 1] 1287         LD (2,X),A
      0086A5 E6 01            [ 1] 1288         LD A,(1,X)
      0086A7 E8 03            [ 1] 1289         XOR A,(3,X)
      0086A9 E7 03            [ 1] 1290         LD (3,X),A
      0086AB 1C 00 02         [ 2] 1291         ADDW X,#2
      0086AE 81               [ 4] 1292         RET
                                   1293 
                                   1294 ;       UM+     ( u u -- udsum )
                                   1295 ;       Add two unsigned single
                                   1296 ;       and return a double sum.
      0086AF 86 9C                 1297         .word      LINK
                           000631  1298 LINK	= . 
      0086B1 03                    1299         .byte      3
      0086B2 55 4D 2B              1300         .ascii     "UM+"
      0086B5                       1301 UPLUS:
      0086B5 A6 01            [ 1] 1302         LD A,#1
      0086B7 90 93            [ 1] 1303         LDW Y,X
      0086B9 90 EE 02         [ 2] 1304         LDW Y,(2,Y)
      0086BC 90 BF 28         [ 2] 1305         LDW YTEMP,Y
      0086BF 90 93            [ 1] 1306         LDW Y,X
      0086C1 90 FE            [ 2] 1307         LDW Y,(Y)
      0086C3 72 B9 00 28      [ 2] 1308         ADDW Y,YTEMP
      0086C7 EF 02            [ 2] 1309         LDW (2,X),Y
      0086C9 25 01            [ 1] 1310         JRC     UPL1
      0086CB 4F               [ 1] 1311         CLR A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      0086CC E7 01            [ 1] 1312 UPL1:   LD     (1,X),A
      0086CE 7F               [ 1] 1313         CLR (X)
      0086CF 81               [ 4] 1314         RET
                                   1315 
                                   1316 ;; System and user variables
                                   1317 
                                   1318 ;       doVAR   ( -- a )
                                   1319 ;       Code for VARIABLE and CREATE.
      0086D0 86 B1                 1320         .word      LINK
                           000652  1321 LINK	= . 
      0086D2 45                    1322 	.byte      COMPO+5
      0086D3 44 4F 56 41 52        1323         .ascii     "DOVAR"
      0086D8                       1324 DOVAR:
      0086D8 1D 00 02         [ 2] 1325 	SUBW X,#2
      0086DB 90 85            [ 2] 1326         POPW Y    ;get return addr (pfa)
      0086DD 90 FE            [ 2] 1327         LDW Y,(Y) ; indirect address 
      0086DF FF               [ 2] 1328         LDW (X),Y    ;push on stack
      0086E0 81               [ 4] 1329         RET     ;go to RET of EXEC
                                   1330 
                                   1331 ;       BASE    ( -- a )
                                   1332 ;       Radix base for numeric I/O.
      0086E1 86 D2                 1333         .word      LINK        
                           000663  1334 LINK = . 
      0086E3 04                    1335         .byte      4
      0086E4 42 41 53 45           1336         .ascii     "BASE"
      0086E8                       1337 BASE:
      0086E8 90 AE 00 06      [ 2] 1338 	LDW Y,#UBASE 
      0086EC 1D 00 02         [ 2] 1339 	SUBW X,#2
      0086EF FF               [ 2] 1340         LDW (X),Y
      0086F0 81               [ 4] 1341         RET
                                   1342 
                                   1343 ;       tmp     ( -- a )
                                   1344 ;       A temporary storage.
      0086F1 86 E3                 1345         .word      LINK
                                   1346         
                           000673  1347 LINK = . 
      0086F3 03                    1348 	.byte      3
      0086F4 54 4D 50              1349         .ascii     "TMP"
      0086F7                       1350 TEMP:
      0086F7 90 AE 00 0C      [ 2] 1351 	LDW Y,#UTMP
      0086FB 1D 00 02         [ 2] 1352 	SUBW X,#2
      0086FE FF               [ 2] 1353         LDW (X),Y
      0086FF 81               [ 4] 1354         RET
                                   1355 
                                   1356 ;       >IN     ( -- a )
                                   1357 ;        Hold parsing pointer.
      008700 86 F3                 1358         .word      LINK
                           000682  1359 LINK = . 
      008702 03                    1360         .byte      3
      008703 3E 49 4E              1361         .ascii    ">IN"
      008706                       1362 INN:
      008706 90 AE 00 0E      [ 2] 1363 	LDW Y,#UINN 
      00870A 1D 00 02         [ 2] 1364 	SUBW X,#2
      00870D FF               [ 2] 1365         LDW (X),Y
      00870E 81               [ 4] 1366         RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



                                   1367 
                                   1368 ;       #TIB    ( -- a )
                                   1369 ;       Count in terminal input buffer.
      00870F 87 02                 1370         .word      LINK
                           000691  1371 LINK = . 
      008711 04                    1372         .byte      4
      008712 23 54 49 42           1373         .ascii     "#TIB"
      008716                       1374 NTIB:
      008716 90 AE 00 10      [ 2] 1375 	LDW Y,#UCTIB 
      00871A 1D 00 02         [ 2] 1376 	SUBW X,#2
      00871D FF               [ 2] 1377         LDW (X),Y
      00871E 81               [ 4] 1378         RET
                                   1379 
                                   1380 ;       TBUF ( -- a )
                                   1381 ;       address of 128 bytes transaction buffer 
      00871F 87 11                 1382         .word LINK 
                           0006A1  1383         LINK=.
      008721 04                    1384         .byte 4 
      008722 54 42 55 46           1385         .ascii "TBUF"
      008726                       1386 TBUF:
      008726 90 AE 16 80      [ 2] 1387         ldw y,#ROWBUFF
      00872A 1D 00 02         [ 2] 1388         subw x,#CELLL
      00872D FF               [ 2] 1389         ldw (x),y 
      00872E 81               [ 4] 1390         ret 
                                   1391 
                                   1392 ; systeme variable 
                                   1393 ; compilation destination 
                                   1394 ; TFLASH ( -- A )
      00872F 87 21                 1395         .word LINK 
                           0006B1  1396         LINK=.
      008731 06                    1397         .byte 6 
      008732 54 46 4C 41 53 48     1398         .ascii "TFLASH"         
      008738                       1399 TFLASH:
      008738 1D 00 02         [ 2] 1400         subw x,#CELLL 
      00873B 90 AE 00 22      [ 2] 1401         ldw y,#UTFLASH
      00873F FF               [ 2] 1402         ldw (x),y 
      008740 81               [ 4] 1403         ret 
                                   1404 
                                   1405 ;       "EVAL   ( -- a )
                                   1406 ;       Execution vector of EVAL.
      008741 87 31                 1407         .word      LINK
                           0006C3  1408 LINK = . 
      008743 05                    1409         .byte      5
      008744 27 45 56 41 4C        1410         .ascii     "'EVAL"
      008749                       1411 TEVAL:
      008749 90 AE 00 14      [ 2] 1412 	LDW Y,#UINTER 
      00874D 1D 00 02         [ 2] 1413 	SUBW X,#2
      008750 FF               [ 2] 1414         LDW (X),Y
      008751 81               [ 4] 1415         RET
                                   1416 
                                   1417 ;       HLD     ( -- a )
                                   1418 ;       Hold a pointer of output string.
      008752 87 43                 1419         .word      LINK
                           0006D4  1420 LINK = . 
      008754 03                    1421         .byte      3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      008755 48 4C 44              1422         .ascii     "HLD"
      008758                       1423 HLD:
      008758 90 AE 00 16      [ 2] 1424 	LDW Y,#UHLD 
      00875C 1D 00 02         [ 2] 1425 	SUBW X,#2
      00875F FF               [ 2] 1426         LDW (X),Y
      008760 81               [ 4] 1427         RET
                                   1428 
                                   1429 ;       CONTEXT ( -- a )
                                   1430 ;       Start vocabulary search.
      008761 87 54                 1431         .word      LINK
                           0006E3  1432 LINK = . 
      008763 07                    1433         .byte      7
      008764 43 4F 4E 54 45 58 54  1434         .ascii     "CONTEXT"
      00876B                       1435 CNTXT:
      00876B 90 AE 00 18      [ 2] 1436 	LDW Y,#UCNTXT
      00876F 1D 00 02         [ 2] 1437 	SUBW X,#2
      008772 FF               [ 2] 1438         LDW (X),Y
      008773 81               [ 4] 1439         RET
                                   1440 
                                   1441 ;       VP      ( -- a )
                                   1442 ;       Point to top of variables
      008774 87 63                 1443         .word      LINK
                           0006F6  1444 LINK = . 
      008776 02                    1445         .byte      2
      008777 56 50                 1446         .ascii     "VP"
      008779                       1447 VPP:
      008779 90 AE 00 1A      [ 2] 1448 	LDW Y,#UVP 
      00877D 1D 00 02         [ 2] 1449 	SUBW X,#2
      008780 FF               [ 2] 1450         LDW (X),Y
      008781 81               [ 4] 1451         RET
                                   1452 
                                   1453 ;       CP    ( -- a )
                                   1454 ;       Pointer to top of FLASH 
      008782 87 76                 1455         .word LINK 
                           000704  1456         LINK=.
      008784 02                    1457         .byte 2 
      008785 43 50                 1458         .ascii "CP"
      008787                       1459 CPP: 
      008787 90 AE 00 1C      [ 2] 1460         ldw y,#UCP 
      00878B 1D 00 02         [ 2] 1461         subw x,#CELLL 
      00878E FF               [ 2] 1462         ldw (x),y 
      00878F 81               [ 4] 1463         ret                
                                   1464 
                                   1465 ;       LAST    ( -- a )
                                   1466 ;       Point to last name in dictionary.
      008790 87 84                 1467         .word      LINK
                           000712  1468 LINK = . 
      008792 04                    1469         .byte      4
      008793 4C 41 53 54           1470         .ascii     "LAST"
      008797                       1471 LAST:
      008797 90 AE 00 1E      [ 2] 1472 	LDW Y,#ULAST 
      00879B 1D 00 02         [ 2] 1473 	SUBW X,#2
      00879E FF               [ 2] 1474         LDW (X),Y
      00879F 81               [ 4] 1475         RET
                                   1476 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



                                   1477 ; address of system variable URLAST 
                                   1478 ;       RAMLAST ( -- a )
                                   1479 ; RAM dictionary context 
      0087A0 87 92                 1480         .word LINK 
                           000722  1481         LINK=. 
      0087A2 07                    1482         .byte 7  
      0087A3 52 41 4D 4C 41 53 54  1483         .ascii "RAMLAST" 
      0087AA                       1484 RAMLAST: 
      0087AA 90 AE 00 24      [ 2] 1485         ldw y,#URLAST 
      0087AE 1D 00 02         [ 2] 1486         subw x,#CELLL 
      0087B1 FF               [ 2] 1487         ldw (x),y 
      0087B2 81               [ 4] 1488         ret 
                                   1489 
                                   1490 ; OFFSET ( -- a )
                                   1491 ; address of system variable OFFSET 
      0087B3 87 A2                 1492         .word LINK 
                           000735  1493         LINK=.
      0087B5 06                    1494         .byte 6
      0087B6 4F 46 46 53 45 54     1495         .ascii "OFFSET" 
      0087BC                       1496 OFFSET: 
      0087BC 1D 00 02         [ 2] 1497         subw x,#CELLL
      0087BF 90 AE 00 20      [ 2] 1498         ldw y,#UOFFSET 
      0087C3 FF               [ 2] 1499         ldw (x),y 
      0087C4 81               [ 4] 1500         ret 
                                   1501 
                                   1502 ; adjust jump address adding OFFSET
                                   1503 ; ADR-ADJ ( a -- a+offset )
      0087C5                       1504 ADRADJ: 
      0087C5 CD 87 BC         [ 4] 1505         call OFFSET 
      0087C8 CD 85 71         [ 4] 1506         call AT 
      0087CB CC 88 47         [ 2] 1507         jp PLUS 
                                   1508 
                                   1509 
                                   1510 ;; Common functions
                                   1511 
                                   1512 ;       ?DUP    ( w -- w w | 0 )
                                   1513 ;       Dup tos if its is not zero.
      0087CE 87 B5                 1514         .word      LINK
                           000750  1515 LINK = . 
      0087D0 04                    1516         .byte      4
      0087D1 3F 44 55 50           1517         .ascii     "?DUP"
      0087D5                       1518 QDUP:
      0087D5 90 93            [ 1] 1519         LDW Y,X
      0087D7 90 FE            [ 2] 1520 	LDW Y,(Y)
      0087D9 27 04            [ 1] 1521         JREQ     QDUP1
      0087DB 1D 00 02         [ 2] 1522 	SUBW X,#2
      0087DE FF               [ 2] 1523         LDW (X),Y
      0087DF 81               [ 4] 1524 QDUP1:  RET
                                   1525 
                                   1526 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                   1527 ;       Rot 3rd item to top.
      0087E0 87 D0                 1528         .word      LINK
                           000762  1529 LINK = . 
      0087E2 03                    1530         .byte      3
      0087E3 52 4F 54              1531         .ascii     "ROT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      0087E6                       1532 ROT:
      0087E6 90 93            [ 1] 1533         ldw y,x 
      0087E8 90 FE            [ 2] 1534         ldw y,(y)
      0087EA 90 89            [ 2] 1535         pushw y 
      0087EC 90 93            [ 1] 1536         ldw y,x 
      0087EE 90 EE 04         [ 2] 1537         ldw y,(4,y)
      0087F1 FF               [ 2] 1538         ldw (x),y 
      0087F2 90 93            [ 1] 1539         ldw y,x 
      0087F4 90 EE 02         [ 2] 1540         ldw y,(2,y)
      0087F7 EF 04            [ 2] 1541         ldw (4,x),y 
      0087F9 90 85            [ 2] 1542         popw y 
      0087FB EF 02            [ 2] 1543         ldw (2,x),y
      0087FD 81               [ 4] 1544         ret 
                                   1545 
                                   1546 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1547 ;    <ROT ( n1 n2 n3 -- n3 n1 n2 )
                                   1548 ;    rotate left 3 top elements 
                                   1549 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00077E                       1550     _HEADER NROT,4,"<ROT"
      0087FE 87 E2                    1         .word LINK 
                           000780     2         LINK=.
      008800 04                       3         .byte 4  
      008801 3C 52 4F 54              4         .ascii "<ROT"
      008805                          5         NROT:
      008805 90 93            [ 1] 1551     LDW Y,X 
      008807 90 FE            [ 2] 1552     LDW Y,(Y)
      008809 90 BF 28         [ 2] 1553     LDW YTEMP,Y ; n3  
      00880C 90 93            [ 1] 1554     LDW Y,X 
      00880E 90 EE 02         [ 2] 1555     LDW Y,(2,Y) ; Y = n2 
      008811 FF               [ 2] 1556     LDW (X),Y   ; TOS = n2 
      008812 90 93            [ 1] 1557     LDW Y,X    
      008814 90 EE 04         [ 2] 1558     LDW Y,(4,Y) ; Y = n1 
      008817 EF 02            [ 2] 1559     LDW (2,X),Y ;   = n1 
      008819 90 BE 28         [ 2] 1560     LDW Y,YTEMP 
      00881C EF 04            [ 2] 1561     LDW (4,X),Y ; = n3 
      00881E 81               [ 4] 1562     RET 
                                   1563 
                                   1564 ;       2DROP   ( w w -- )
                                   1565 ;       Discard two items on stack.
      00881F 88 00                 1566         .word      LINK
                           0007A1  1567 LINK = . 
      008821 05                    1568         .byte      5
      008822 32 44 52 4F 50        1569         .ascii     "2DROP"
      008827                       1570 DDROP:
      008827 1C 00 04         [ 2] 1571         ADDW X,#4
      00882A 81               [ 4] 1572         RET
                                   1573 
                                   1574 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                   1575 ;       Duplicate top two items.
      00882B 88 21                 1576         .word      LINK
                           0007AD  1577 LINK = . 
      00882D 04                    1578         .byte      4
      00882E 32 44 55 50           1579         .ascii     "2DUP"
      008832                       1580 DDUP:
      008832 1D 00 04         [ 2] 1581         SUBW X,#4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      008835 90 93            [ 1] 1582         LDW Y,X
      008837 90 EE 06         [ 2] 1583         LDW Y,(6,Y)
      00883A EF 02            [ 2] 1584         LDW (2,X),Y
      00883C 90 93            [ 1] 1585         LDW Y,X
      00883E 90 EE 04         [ 2] 1586         LDW Y,(4,Y)
      008841 FF               [ 2] 1587         LDW (X),Y
      008842 81               [ 4] 1588         RET
                                   1589 
                                   1590 ;       +       ( w w -- sum )
                                   1591 ;       Add top two items.
      008843 88 2D                 1592         .word      LINK
                           0007C5  1593 LINK = . 
      008845 01                    1594         .byte      1
      008846 2B                    1595         .ascii     "+"
      008847                       1596 PLUS:
      008847 90 93            [ 1] 1597         LDW Y,X
      008849 90 FE            [ 2] 1598         LDW Y,(Y)
      00884B 90 BF 28         [ 2] 1599         LDW YTEMP,Y
      00884E 1C 00 02         [ 2] 1600         ADDW X,#2
      008851 90 93            [ 1] 1601         LDW Y,X
      008853 90 FE            [ 2] 1602         LDW Y,(Y)
      008855 72 B9 00 28      [ 2] 1603         ADDW Y,YTEMP
      008859 FF               [ 2] 1604         LDW (X),Y
      00885A 81               [ 4] 1605         RET
                                   1606 
                                   1607 ;       NOT     ( w -- w )
                                   1608 ;       One's complement of tos.
      00885B 88 45                 1609         .word      LINK
                           0007DD  1610 LINK = . 
      00885D 03                    1611         .byte      3
      00885E 4E 4F 54              1612         .ascii     "NOT"
      008861                       1613 INVER:
      008861 90 93            [ 1] 1614         LDW Y,X
      008863 90 FE            [ 2] 1615         LDW Y,(Y)
      008865 90 53            [ 2] 1616         CPLW Y
      008867 FF               [ 2] 1617         LDW (X),Y
      008868 81               [ 4] 1618         RET
                                   1619 
                                   1620 ;       NEGATE  ( n -- -n )
                                   1621 ;       Two's complement of tos.
      008869 88 5D                 1622         .word      LINK
                           0007EB  1623 LINK = . 
      00886B 06                    1624         .byte      6
      00886C 4E 45 47 41 54 45     1625         .ascii     "NEGATE"
      008872                       1626 NEGAT:
      008872 90 93            [ 1] 1627         LDW Y,X
      008874 90 FE            [ 2] 1628         LDW Y,(Y)
      008876 90 50            [ 2] 1629         NEGW Y
      008878 FF               [ 2] 1630         LDW (X),Y
      008879 81               [ 4] 1631         RET
                                   1632 
                                   1633 ;       DNEGATE ( d -- -d )
                                   1634 ;       Two's complement of top double.
      00887A 88 6B                 1635         .word      LINK
                           0007FC  1636 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      00887C 07                    1637         .byte      7
      00887D 44 4E 45 47 41 54 45  1638         .ascii     "DNEGATE"
      008884                       1639 DNEGA:
      008884 90 93            [ 1] 1640         LDW Y,X
      008886 90 FE            [ 2] 1641 	LDW Y,(Y)
      008888 90 53            [ 2] 1642         CPLW Y     
      00888A 90 BF 28         [ 2] 1643 	LDW YTEMP,Y
      00888D 90 93            [ 1] 1644         LDW Y,X
      00888F 90 EE 02         [ 2] 1645         LDW Y,(2,Y)
      008892 90 53            [ 2] 1646         CPLW Y
      008894 72 A9 00 01      [ 2] 1647         addw y,#1
      008898 EF 02            [ 2] 1648         LDW (2,X),Y
      00889A 90 BE 28         [ 2] 1649         LDW Y,YTEMP
      00889D 24 02            [ 1] 1650         JRNC DN1 
      00889F 90 5C            [ 1] 1651         INCW Y
      0088A1 FF               [ 2] 1652 DN1:    LDW (X),Y
      0088A2 81               [ 4] 1653         RET
                                   1654 
                                   1655 
                                   1656 ;       S>D ( n -- d )
                                   1657 ; convert single integer to double 
      0088A3 88 7C                 1658         .word LINK 
                           000825  1659         LINK=. 
      0088A5 03                    1660         .byte 3 
      0088A6 53 3E 44              1661         .ascii "S>D"
      0088A9                       1662 STOD: 
      0088A9 1D 00 02         [ 2] 1663         subw x,#CELLL 
      0088AC 90 5F            [ 1] 1664         clrw y 
      0088AE FF               [ 2] 1665         ldw (x),y 
      0088AF 90 93            [ 1] 1666         ldw y,x 
      0088B1 90 EE 02         [ 2] 1667         ldw y,(2,y)
      0088B4 2A 05            [ 1] 1668         jrpl 1$ 
      0088B6 90 AE FF FF      [ 2] 1669         ldw y,#-1
      0088BA FF               [ 2] 1670         ldw (x),y 
      0088BB 81               [ 4] 1671 1$:     ret 
                                   1672 
                                   1673 
                                   1674 
                                   1675 
                                   1676 ;       -       ( n1 n2 -- n1-n2 )
                                   1677 ;       Subtraction.
      0088BC 88 A5                 1678         .word      LINK
                           00083E  1679 LINK = . 
      0088BE 01                    1680         .byte      1
      0088BF 2D                    1681         .ascii     "-"
      0088C0                       1682 SUBB:
      0088C0 90 93            [ 1] 1683         LDW Y,X
      0088C2 90 FE            [ 2] 1684         LDW Y,(Y)
      0088C4 90 BF 28         [ 2] 1685         LDW YTEMP,Y
      0088C7 1C 00 02         [ 2] 1686         ADDW X,#2
      0088CA 90 93            [ 1] 1687         LDW Y,X
      0088CC 90 FE            [ 2] 1688         LDW Y,(Y)
      0088CE 72 B2 00 28      [ 2] 1689         SUBW Y,YTEMP
      0088D2 FF               [ 2] 1690         LDW (X),Y
      0088D3 81               [ 4] 1691         RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                                   1692 
                                   1693 ;       ABS     ( n -- n )
                                   1694 ;       Return  absolute value of n.
      0088D4 88 BE                 1695         .word      LINK
                           000856  1696 LINK = . 
      0088D6 03                    1697         .byte      3
      0088D7 41 42 53              1698         .ascii     "ABS"
      0088DA                       1699 ABSS:
      0088DA 90 93            [ 1] 1700         LDW Y,X
      0088DC 90 FE            [ 2] 1701 	LDW Y,(Y)
      0088DE 2A 03            [ 1] 1702         JRPL     AB1     ;negate:
      0088E0 90 50            [ 2] 1703         NEGW     Y     ;else negate hi byte
      0088E2 FF               [ 2] 1704         LDW (X),Y
      0088E3 81               [ 4] 1705 AB1:    RET
                                   1706 
                                   1707 ;       =       ( w w -- t )
                                   1708 ;       Return true if top two are =al.
      0088E4 88 D6                 1709         .word      LINK
                           000866  1710 LINK = . 
      0088E6 01                    1711         .byte      1
      0088E7 3D                    1712         .ascii     "="
      0088E8                       1713 EQUAL:
      0088E8 A6 FF            [ 1] 1714         LD A,#0xFF  ;true
      0088EA 90 93            [ 1] 1715         LDW Y,X    ;D = n2
      0088EC 90 FE            [ 2] 1716         LDW Y,(Y)
      0088EE 90 BF 28         [ 2] 1717         LDW YTEMP,Y
      0088F1 1C 00 02         [ 2] 1718         ADDW X,#2
      0088F4 90 93            [ 1] 1719         LDW Y,X
      0088F6 90 FE            [ 2] 1720         LDW Y,(Y)
      0088F8 90 B3 28         [ 2] 1721         CPW Y,YTEMP     ;if n2 <> n1
      0088FB 27 01            [ 1] 1722         JREQ     EQ1
      0088FD 4F               [ 1] 1723         CLR A
      0088FE F7               [ 1] 1724 EQ1:    LD (X),A
      0088FF E7 01            [ 1] 1725         LD (1,X),A
      008901 81               [ 4] 1726 	RET     
                                   1727 
                                   1728 ;       U<      ( u u -- t )
                                   1729 ;       Unsigned compare of top two items.
      008902 88 E6                 1730         .word      LINK
                           000884  1731 LINK = . 
      008904 02                    1732         .byte      2
      008905 55 3C                 1733         .ascii     "U<"
      008907                       1734 ULESS:
      008907 A6 FF            [ 1] 1735         LD A,#0xFF  ;true
      008909 90 93            [ 1] 1736         LDW Y,X    ;D = n2
      00890B 90 FE            [ 2] 1737         LDW Y,(Y)
      00890D 90 BF 28         [ 2] 1738         LDW YTEMP,Y
      008910 1C 00 02         [ 2] 1739         ADDW X,#2
      008913 90 93            [ 1] 1740         LDW Y,X
      008915 90 FE            [ 2] 1741         LDW Y,(Y)
      008917 90 B3 28         [ 2] 1742         CPW Y,YTEMP     ;if n2 <> n1
      00891A 25 01            [ 1] 1743         JRULT     ULES1
      00891C 4F               [ 1] 1744         CLR A
      00891D F7               [ 1] 1745 ULES1:  LD (X),A
      00891E E7 01            [ 1] 1746         LD (1,X),A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008920 81               [ 4] 1747 	RET     
                                   1748 
                                   1749 ;       <       ( n1 n2 -- t )
                                   1750 ;       Signed compare of top two items.
      008921 89 04                 1751         .word      LINK
                           0008A3  1752 LINK = . 
      008923 01                    1753         .byte      1
      008924 3C                    1754         .ascii     "<"
      008925                       1755 LESS:
      008925 A6 FF            [ 1] 1756         LD A,#0xFF  ;true
      008927 90 93            [ 1] 1757         LDW Y,X    ;D = n2
      008929 90 FE            [ 2] 1758         LDW Y,(Y)
      00892B 90 BF 28         [ 2] 1759         LDW YTEMP,Y
      00892E 1C 00 02         [ 2] 1760         ADDW X,#2
      008931 90 93            [ 1] 1761         LDW Y,X
      008933 90 FE            [ 2] 1762         LDW Y,(Y)
      008935 90 B3 28         [ 2] 1763         CPW Y,YTEMP     ;if n2 <> n1
      008938 2F 01            [ 1] 1764         JRSLT     LT1
      00893A 4F               [ 1] 1765         CLR A
      00893B F7               [ 1] 1766 LT1:    LD (X),A
      00893C E7 01            [ 1] 1767         LD (1,X),A
      00893E 81               [ 4] 1768 	RET     
                                   1769 
                                   1770 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1771 ;       >   (n1 n2 -- f )
                                   1772 ;  signed compare n1 n2 
                                   1773 ;  true if n1 > n2 
                                   1774 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00893F 89 23                 1775         .word   LINK 
                           0008C1  1776         LINK = . 
      008941 01                    1777         .byte 1
      008942 3E                    1778         .ascii ">"
      008943                       1779 GREAT:
      008943 A6 FF            [ 1] 1780         LD A,#0xFF ;
      008945 90 93            [ 1] 1781         LDW Y,X 
      008947 90 FE            [ 2] 1782         LDW Y,(Y)
      008949 90 BF 28         [ 2] 1783         LDW YTEMP,Y 
      00894C 1C 00 02         [ 2] 1784         ADDW X,#2 
      00894F 90 93            [ 1] 1785         LDW Y,X 
      008951 90 FE            [ 2] 1786         LDW Y,(Y)
      008953 90 B3 28         [ 2] 1787         CPW  Y,YTEMP 
      008956 2C 01            [ 1] 1788         JRSGT GREAT1 
      008958 4F               [ 1] 1789         CLR  A
      008959                       1790 GREAT1:
      008959 F7               [ 1] 1791         LD (X),A 
      00895A E7 01            [ 1] 1792         LD (1,X),A 
      00895C 81               [ 4] 1793         RET 
                                   1794 
                                   1795 
                                   1796 ;       MAX     ( n n -- n )
                                   1797 ;       Return greater of two top items.
      00895D 89 41                 1798         .word      LINK
                           0008DF  1799 LINK = . 
      00895F 03                    1800         .byte      3
      008960 4D 41 58              1801         .ascii     "MAX"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008963                       1802 MAX:
      008963 90 93            [ 1] 1803         LDW Y,X    ;D = n2
      008965 90 EE 02         [ 2] 1804         LDW Y,(2,Y)
      008968 90 BF 28         [ 2] 1805         LDW YTEMP,Y
      00896B 90 93            [ 1] 1806         LDW Y,X
      00896D 90 FE            [ 2] 1807         LDW Y,(Y)
      00896F 90 B3 28         [ 2] 1808         CPW Y,YTEMP     ;if n2 <> n1
      008972 2F 02            [ 1] 1809         JRSLT     MAX1
      008974 EF 02            [ 2] 1810         LDW (2,X),Y
      008976 1C 00 02         [ 2] 1811 MAX1:   ADDW X,#2
      008979 81               [ 4] 1812 	RET     
                                   1813 
                                   1814 ;       MIN     ( n n -- n )
                                   1815 ;       Return smaller of top two items.
      00897A 89 5F                 1816         .word      LINK
                           0008FC  1817 LINK = . 
      00897C 03                    1818         .byte      3
      00897D 4D 49 4E              1819         .ascii     "MIN"
      008980                       1820 MIN:
      008980 90 93            [ 1] 1821         LDW Y,X    ;D = n2
      008982 90 EE 02         [ 2] 1822         LDW Y,(2,Y)
      008985 90 BF 28         [ 2] 1823         LDW YTEMP,Y
      008988 90 93            [ 1] 1824         LDW Y,X
      00898A 90 FE            [ 2] 1825         LDW Y,(Y)
      00898C 90 B3 28         [ 2] 1826         CPW Y,YTEMP     ;if n2 <> n1
      00898F 2C 02            [ 1] 1827         JRSGT     MIN1
      008991 EF 02            [ 2] 1828         LDW (2,X),Y
      008993 1C 00 02         [ 2] 1829 MIN1:	ADDW X,#2
      008996 81               [ 4] 1830 	RET     
                                   1831 
                                   1832 ;       WITHIN  ( u ul uh -- t )
                                   1833 ;       Return true if u is within
                                   1834 ;       range of ul and uh. ( ul <= u < uh )
      008997 89 7C                 1835         .word      LINK
                           000919  1836 LINK = . 
      008999 06                    1837         .byte      6
      00899A 57 49 54 48 49 4E     1838         .ascii     "WITHIN"
      0089A0                       1839 WITHI:
      0089A0 CD 86 42         [ 4] 1840         CALL     OVER
      0089A3 CD 88 C0         [ 4] 1841         CALL     SUBB
      0089A6 CD 85 E1         [ 4] 1842         CALL     TOR
      0089A9 CD 88 C0         [ 4] 1843         CALL     SUBB
      0089AC CD 85 C2         [ 4] 1844         CALL     RFROM
      0089AF CC 89 07         [ 2] 1845         JP     ULESS
                                   1846 
                                   1847 ;; Divide
                                   1848 
                                   1849 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1850 ;       Unsigned divide of a double by a
                                   1851 ;       single. Return mod and quotient.
      0089B2 89 99                 1852         .word      LINK
                           000934  1853 LINK = . 
      0089B4 06                    1854         .byte      6
      0089B5 55 4D 2F 4D 4F 44     1855         .ascii     "UM/MOD"
                                   1856 ; 2021-02-22
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



                                   1857 ; changed algortihm for Jeeek one 
                                   1858 ; ref: https://github.com/TG9541/stm8ef/pull/406        
      0089BB                       1859 UMMOD:
      0089BB 90 93            [ 1] 1860         LDW     Y,X             ; stack pointer to Y
      0089BD FE               [ 2] 1861         LDW     X,(X)           ; un
      0089BE BF 28            [ 2] 1862         LDW     YTEMP,X         ; save un
      0089C0 93               [ 1] 1863         LDW     X,Y
      0089C1 5C               [ 1] 1864         INCW    X               ; drop un
      0089C2 5C               [ 1] 1865         INCW    X
      0089C3 89               [ 2] 1866         PUSHW   X               ; save stack pointer
      0089C4 FE               [ 2] 1867         LDW     X,(X)           ; X=udh
      0089C5 90 EE 04         [ 2] 1868         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      0089C8 B3 28            [ 2] 1869         CPW     X,YTEMP
      0089CA 25 0B            [ 1] 1870         JRULT   MMSM1           ; X is still on the R-stack
      0089CC 85               [ 2] 1871         POPW    X               ; restore stack pointer
      0089CD 90 AE FF FF      [ 2] 1872         LDW     Y,#0xFFFF       ; overflow result:
      0089D1 FF               [ 2] 1873         LDW     (X),Y           ; quotient max. 16 bit value
      0089D2 90 5F            [ 1] 1874         CLRW    Y
      0089D4 EF 02            [ 2] 1875         LDW     (2,X),Y         ; remainder 0
      0089D6 81               [ 4] 1876         RET
      0089D7                       1877 MMSM1:
      0089D7 A6 10            [ 1] 1878         LD      A,#16           ; loop count
      0089D9 90 58            [ 2] 1879         SLLW    Y               ; udl shift udl into udh
      0089DB                       1880 MMSM3:
      0089DB 59               [ 2] 1881         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      0089DC 25 04            [ 1] 1882         JRC     MMSMa           ; if carry out of rotate
      0089DE B3 28            [ 2] 1883         CPW     X,YTEMP         ; compare udh to un
      0089E0 25 05            [ 1] 1884         JRULT   MMSM4           ; can't subtract
      0089E2                       1885 MMSMa:
      0089E2 72 B0 00 28      [ 2] 1886         SUBW    X,YTEMP         ; can subtract
      0089E6 98               [ 1] 1887         RCF
      0089E7                       1888 MMSM4:
      0089E7 8C               [ 1] 1889         CCF                     ; quotient bit
      0089E8 90 59            [ 2] 1890         RLCW    Y               ; rotate into quotient, rotate out udl
      0089EA 4A               [ 1] 1891         DEC     A               ; repeat
      0089EB 26 EE            [ 1] 1892         JRNE    MMSM3           ; if A == 0
      0089ED                       1893 MMSMb:
      0089ED BF 28            [ 2] 1894         LDW     YTEMP,X         ; done, save remainder
      0089EF 85               [ 2] 1895         POPW    X               ; restore stack pointer
      0089F0 FF               [ 2] 1896         LDW     (X),Y           ; save quotient
      0089F1 90 BE 28         [ 2] 1897         LDW     Y,YTEMP         ; remainder onto stack
      0089F4 EF 02            [ 2] 1898         LDW     (2,X),Y
      0089F6 81               [ 4] 1899         RET
                                   1900 
                                   1901 
                                   1902 ;----------------------------------------------	
                                   1903 ;       M/MOD   ( d n -- r q )
                                   1904 ;       Signed floored divide of double by
                                   1905 ;       single. Return mod and quotient.
                                   1906 ;----------------------------------------------	
      0089F7 89 B4                 1907         .word      LINK
                           000979  1908 LINK = . 
      0089F9 05                    1909         .byte      5
      0089FA 4D 2F 4D 4F 44        1910         .ascii     "M/MOD"
      0089FF                       1911 MSMOD:  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      0089FF CD 86 18         [ 4] 1912         CALL	DUPP
      008A02 CD 86 51         [ 4] 1913         CALL	ZLESS
      008A05 CD 86 18         [ 4] 1914         CALL	DUPP
      008A08 CD 85 E1         [ 4] 1915         CALL	TOR
      008A0B CD 85 26         [ 4] 1916         CALL	QBRAN
      008A0E 8A 1C                 1917         .word	MMOD1
      008A10 CD 88 72         [ 4] 1918         CALL	NEGAT
      008A13 CD 85 E1         [ 4] 1919         CALL	TOR
      008A16 CD 88 84         [ 4] 1920         CALL	DNEGA
      008A19 CD 85 C2         [ 4] 1921         CALL	RFROM
      008A1C CD 85 E1         [ 4] 1922 MMOD1:	CALL	TOR
      008A1F CD 86 18         [ 4] 1923         CALL	DUPP
      008A22 CD 86 51         [ 4] 1924         CALL	ZLESS
      008A25 CD 85 26         [ 4] 1925         CALL	QBRAN
      008A28 8A 30                 1926         .word	MMOD2
      008A2A CD 85 D5         [ 4] 1927         CALL	RAT
      008A2D CD 88 47         [ 4] 1928         CALL	PLUS
      008A30 CD 85 C2         [ 4] 1929 MMOD2:	CALL	RFROM
      008A33 CD 89 BB         [ 4] 1930         CALL	UMMOD
      008A36 CD 85 C2         [ 4] 1931         CALL	RFROM
      008A39 CD 85 26         [ 4] 1932         CALL	QBRAN
      008A3C 8A 47                 1933         .word	MMOD3
      008A3E CD 86 28         [ 4] 1934         CALL	SWAPP
      008A41 CD 88 72         [ 4] 1935         CALL	NEGAT
      008A44 CD 86 28         [ 4] 1936         CALL	SWAPP
      008A47 81               [ 4] 1937 MMOD3:	RET
                                   1938 
                                   1939 ;       /MOD    ( n n -- r q )
                                   1940 ;       Signed divide. Return mod and quotient.
      008A48 89 F9                 1941         .word      LINK
                           0009CA  1942 LINK = . 
      008A4A 04                    1943         .byte      4
      008A4B 2F 4D 4F 44           1944         .ascii     "/MOD"
      008A4F                       1945 SLMOD:
      008A4F CD 86 42         [ 4] 1946         CALL	OVER
      008A52 CD 86 51         [ 4] 1947         CALL	ZLESS
      008A55 CD 86 28         [ 4] 1948         CALL	SWAPP
      008A58 CC 89 FF         [ 2] 1949         JP	MSMOD
                                   1950 
                                   1951 ;       MOD     ( n n -- r )
                                   1952 ;       Signed divide. Return mod only.
      008A5B 8A 4A                 1953         .word      LINK
                           0009DD  1954 LINK = . 
      008A5D 03                    1955         .byte      3
      008A5E 4D 4F 44              1956         .ascii     "MOD"
      008A61                       1957 MODD:
      008A61 CD 8A 4F         [ 4] 1958 	CALL	SLMOD
      008A64 CC 86 0E         [ 2] 1959 	JP	DROP
                                   1960 
                                   1961 ;       /       ( n n -- q )
                                   1962 ;       Signed divide. Return quotient only.
      008A67 8A 5D                 1963         .word      LINK
                           0009E9  1964 LINK = . 
      008A69 01                    1965         .byte      1
      008A6A 2F                    1966         .ascii     "/"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008A6B                       1967 SLASH:
      008A6B CD 8A 4F         [ 4] 1968         CALL	SLMOD
      008A6E CD 86 28         [ 4] 1969         CALL	SWAPP
      008A71 CC 86 0E         [ 2] 1970         JP	DROP
                                   1971 
                                   1972 ;; Multiply
                                   1973 
                                   1974 ;       UM*     ( u u -- ud )
                                   1975 ;       Unsigned multiply. Return double product.
      008A74 8A 69                 1976         .word      LINK
                           0009F6  1977 LINK = . 
      008A76 03                    1978         .byte      3
      008A77 55 4D 2A              1979         .ascii     "UM*"
      008A7A                       1980 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
                                   1981 ; take advantage of SP addressing modes
                                   1982 ; these PRODx in RAM are not required
                                   1983 ; the product is kept on stack as local variable 
                                   1984         ;; bytes offset on data stack 
                           000002  1985         da=2 
                           000003  1986         db=3 
                           000000  1987         dc=0 
                           000001  1988         dd=1 
                                   1989         ;; product bytes offset on return stack 
                           000001  1990         UD1=1  ; ud bits 31..24
                           000002  1991         UD2=2  ; ud bits 23..16
                           000003  1992         UD3=3  ; ud bits 15..8 
                           000004  1993         UD4=4  ; ud bits 7..0 
                                   1994         ;; local variable for product set to zero   
      008A7A 90 5F            [ 1] 1995         clrw y 
      008A7C 90 89            [ 2] 1996         pushw y  ; bits 15..0
      008A7E 90 89            [ 2] 1997         pushw y  ; bits 31..16 
      008A80 E6 03            [ 1] 1998         ld a,(db,x) ; b 
      008A82 90 97            [ 1] 1999         ld yl,a 
      008A84 E6 01            [ 1] 2000         ld a,(dd,x)   ; d
      008A86 90 42            [ 4] 2001         mul y,a    ; b*d  
      008A88 17 03            [ 2] 2002         ldw (UD3,sp),y ; lowest weight product 
      008A8A E6 03            [ 1] 2003         ld a,(db,x)
      008A8C 90 97            [ 1] 2004         ld yl,a 
      008A8E E6 00            [ 1] 2005         ld a,(dc,x)
      008A90 90 42            [ 4] 2006         mul y,a  ; b*c 
                                   2007         ;;; do the partial sum 
      008A92 72 F9 02         [ 2] 2008         addw y,(UD2,sp)
      008A95 4F               [ 1] 2009         clr a 
      008A96 49               [ 1] 2010         rlc a
      008A97 6B 01            [ 1] 2011         ld (UD1,sp),a 
      008A99 17 02            [ 2] 2012         ldw (UD2,sp),y 
      008A9B E6 02            [ 1] 2013         ld a,(da,x)
      008A9D 90 97            [ 1] 2014         ld yl,a 
      008A9F E6 01            [ 1] 2015         ld a,(dd,x)
      008AA1 90 42            [ 4] 2016         mul y,a   ; a*d 
                                   2017         ;; do partial sum 
      008AA3 72 F9 02         [ 2] 2018         addw y,(UD2,sp)
      008AA6 4F               [ 1] 2019         clr a 
      008AA7 19 01            [ 1] 2020         adc a,(UD1,sp)
      008AA9 6B 01            [ 1] 2021         ld (UD1,sp),a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008AAB 17 02            [ 2] 2022         ldw (UD2,sp),y 
      008AAD E6 02            [ 1] 2023         ld a,(da,x)
      008AAF 90 97            [ 1] 2024         ld yl,a 
      008AB1 E6 00            [ 1] 2025         ld a,(dc,x)
      008AB3 90 42            [ 4] 2026         mul y,a  ;  a*c highest weight product 
                                   2027         ;;; do partial sum 
      008AB5 72 F9 01         [ 2] 2028         addw y,(UD1,sp)
      008AB8 FF               [ 2] 2029         ldw (x),y  ; udh 
      008AB9 16 03            [ 2] 2030         ldw y,(UD3,sp)
      008ABB EF 02            [ 2] 2031         ldw (2,x),y  ; udl  
      008ABD 5B 04            [ 2] 2032         addw sp,#4 ; drop local variable 
      008ABF 81               [ 4] 2033         ret  
                                   2034 
                                   2035 
                                   2036 ;       *       ( n n -- n )
                                   2037 ;       Signed multiply. Return single product.
      008AC0 8A 76                 2038         .word      LINK
                           000A42  2039 LINK = . 
      008AC2 01                    2040         .byte      1
      008AC3 2A                    2041         .ascii     "*"
      008AC4                       2042 STAR:
      008AC4 CD 8A 7A         [ 4] 2043 	CALL	UMSTA
      008AC7 CC 86 0E         [ 2] 2044 	JP	DROP
                                   2045 
                                   2046 ;       M*      ( n n -- d )
                                   2047 ;       Signed multiply. Return double product.
      008ACA 8A C2                 2048         .word      LINK
                           000A4C  2049 LINK = . 
      008ACC 02                    2050         .byte      2
      008ACD 4D 2A                 2051         .ascii     "M*"
      008ACF                       2052 MSTAR:      
      008ACF CD 88 32         [ 4] 2053         CALL	DDUP
      008AD2 CD 86 A0         [ 4] 2054         CALL	XORR
      008AD5 CD 86 51         [ 4] 2055         CALL	ZLESS
      008AD8 CD 85 E1         [ 4] 2056         CALL	TOR
      008ADB CD 88 DA         [ 4] 2057         CALL	ABSS
      008ADE CD 86 28         [ 4] 2058         CALL	SWAPP
      008AE1 CD 88 DA         [ 4] 2059         CALL	ABSS
      008AE4 CD 8A 7A         [ 4] 2060         CALL	UMSTA
      008AE7 CD 85 C2         [ 4] 2061         CALL	RFROM
      008AEA CD 85 26         [ 4] 2062         CALL	QBRAN
      008AED 8A F2                 2063         .word	MSTA1
      008AEF CD 88 84         [ 4] 2064         CALL	DNEGA
      008AF2 81               [ 4] 2065 MSTA1:	RET
                                   2066 
                                   2067 ;       */MOD   ( n1 n2 n3 -- r q )
                                   2068 ;       Multiply n1 and n2, then divide
                                   2069 ;       by n3. Return mod and quotient.
      008AF3 8A CC                 2070         .word      LINK
                           000A75  2071 LINK = . 
      008AF5 05                    2072         .byte      5
      008AF6 2A 2F 4D 4F 44        2073         .ascii     "*/MOD"
      008AFB                       2074 SSMOD:
      008AFB CD 85 E1         [ 4] 2075         CALL     TOR
      008AFE CD 8A CF         [ 4] 2076         CALL     MSTAR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008B01 CD 85 C2         [ 4] 2077         CALL     RFROM
      008B04 CC 89 FF         [ 2] 2078         JP     MSMOD
                                   2079 
                                   2080 ;       */      ( n1 n2 n3 -- q )
                                   2081 ;       Multiply n1 by n2, then divide
                                   2082 ;       by n3. Return quotient only.
      008B07 8A F5                 2083         .word      LINK
                           000A89  2084 LINK = . 
      008B09 02                    2085         .byte      2
      008B0A 2A 2F                 2086         .ascii     "*/"
      008B0C                       2087 STASL:
      008B0C CD 8A FB         [ 4] 2088         CALL	SSMOD
      008B0F CD 86 28         [ 4] 2089         CALL	SWAPP
      008B12 CC 86 0E         [ 2] 2090         JP	DROP
                                   2091 
                                   2092 ;; Miscellaneous
                                   2093 
                                   2094 ;       CELL+   ( a -- a )
                                   2095 ;       Add cell size in byte to address.
      008B15 8B 09                 2096         .word      LINK
                           000A97  2097 LINK = . 
      008B17 02                    2098         .byte       2
      008B18 32 2B                 2099         .ascii     "2+"
      008B1A                       2100 CELLP:
      008B1A 90 93            [ 1] 2101         LDW Y,X
      008B1C 90 FE            [ 2] 2102 	LDW Y,(Y)
      008B1E 72 A9 00 02      [ 2] 2103         ADDW Y,#CELLL 
      008B22 FF               [ 2] 2104         LDW (X),Y
      008B23 81               [ 4] 2105         RET
                                   2106 
                                   2107 ;       CELL-   ( a -- a )
                                   2108 ;       Subtract 2 from address.
      008B24 8B 17                 2109         .word      LINK
                           000AA6  2110 LINK = . 
      008B26 02                    2111         .byte       2
      008B27 32 2D                 2112         .ascii     "2-"
      008B29                       2113 CELLM:
      008B29 90 93            [ 1] 2114         LDW Y,X
      008B2B 90 FE            [ 2] 2115 	LDW Y,(Y)
      008B2D 72 A2 00 02      [ 2] 2116         SUBW Y,#CELLL
      008B31 FF               [ 2] 2117         LDW (X),Y
      008B32 81               [ 4] 2118         RET
                                   2119 
                                   2120 ;       CELLS   ( n -- n )
                                   2121 ;       Multiply tos by 2.
      008B33 8B 26                 2122         .word      LINK
                           000AB5  2123 LINK = . 
      008B35 02                    2124         .byte       2
      008B36 32 2A                 2125         .ascii     "2*"
      008B38                       2126 CELLS:
      008B38 90 93            [ 1] 2127         LDW Y,X
      008B3A 90 FE            [ 2] 2128 	LDW Y,(Y)
      008B3C 90 58            [ 2] 2129         SLAW Y
      008B3E FF               [ 2] 2130         LDW (X),Y
      008B3F 81               [ 4] 2131         RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                   2132 
                                   2133 ;       1+      ( a -- a )
                                   2134 ;       Add cell size in byte to address.
      008B40 8B 35                 2135         .word      LINK
                           000AC2  2136 LINK = . 
      008B42 02                    2137         .byte      2
      008B43 31 2B                 2138         .ascii     "1+"
      008B45                       2139 ONEP:
      008B45 90 93            [ 1] 2140         LDW Y,X
      008B47 90 FE            [ 2] 2141 	LDW Y,(Y)
      008B49 90 5C            [ 1] 2142         INCW Y
      008B4B FF               [ 2] 2143         LDW (X),Y
      008B4C 81               [ 4] 2144         RET
                                   2145 
                                   2146 ;       1-      ( a -- a )
                                   2147 ;       Subtract 2 from address.
      008B4D 8B 42                 2148         .word      LINK
                           000ACF  2149 LINK = . 
      008B4F 02                    2150         .byte      2
      008B50 31 2D                 2151         .ascii     "1-"
      008B52                       2152 ONEM:
      008B52 90 93            [ 1] 2153         LDW Y,X
      008B54 90 FE            [ 2] 2154 	LDW Y,(Y)
      008B56 90 5A            [ 2] 2155         DECW Y
      008B58 FF               [ 2] 2156         LDW (X),Y
      008B59 81               [ 4] 2157         RET
                                   2158 
                                   2159 ;  shift left n times 
                                   2160 ; LSHIFT ( n1 n2 -- n1<<n2 )
      008B5A 8B 4F                 2161         .word LINK 
                           000ADC  2162         LINK=.
      008B5C 06                    2163         .byte 6 
      008B5D 4C 53 48 49 46 54     2164         .ascii "LSHIFT"
      008B63                       2165 LSHIFT:
      008B63 E6 01            [ 1] 2166         ld a,(1,x)
      008B65 1C 00 02         [ 2] 2167         addw x,#CELLL 
      008B68 90 93            [ 1] 2168         ldw y,x 
      008B6A 90 FE            [ 2] 2169         ldw y,(y)
      008B6C                       2170 LSHIFT1:
      008B6C 4D               [ 1] 2171         tnz a 
      008B6D 27 05            [ 1] 2172         jreq LSHIFT4 
      008B6F 90 58            [ 2] 2173         sllw y 
      008B71 4A               [ 1] 2174         dec a 
      008B72 20 F8            [ 2] 2175         jra LSHIFT1 
      008B74                       2176 LSHIFT4:
      008B74 FF               [ 2] 2177         ldw (x),y 
      008B75 81               [ 4] 2178         ret 
                                   2179 
                                   2180 ; shift right n times                 
                                   2181 ; RSHIFT (n1 n2 -- n1>>n2 )
      008B76 8B 5C                 2182         .word LINK 
                           000AF8  2183         LINK=.
      008B78 06                    2184         .byte 6
      008B79 52 53 48 49 46 54     2185         .ascii "RSHIFT"
      008B7F                       2186 RSHIFT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008B7F E6 01            [ 1] 2187         ld a,(1,x)
      008B81 1C 00 02         [ 2] 2188         addw x,#CELLL 
      008B84 90 93            [ 1] 2189         ldw y,x 
      008B86 90 FE            [ 2] 2190         ldw y,(y)
      008B88                       2191 RSHIFT1:
      008B88 4D               [ 1] 2192         tnz a 
      008B89 27 05            [ 1] 2193         jreq RSHIFT4 
      008B8B 90 54            [ 2] 2194         srlw y 
      008B8D 4A               [ 1] 2195         dec a 
      008B8E 20 F8            [ 2] 2196         jra RSHIFT1 
      008B90                       2197 RSHIFT4:
      008B90 FF               [ 2] 2198         ldw (x),y 
      008B91 81               [ 4] 2199         ret 
                                   2200 
                                   2201 
                                   2202 ;       2/      ( n -- n )
                                   2203 ;       divide  tos by 2.
      008B92 8B 78                 2204         .word      LINK
                           000B14  2205 LINK = . 
      008B94 02                    2206         .byte      2
      008B95 32 2F                 2207         .ascii     "2/"
      008B97                       2208 TWOSL:
      008B97 90 93            [ 1] 2209         LDW Y,X
      008B99 90 FE            [ 2] 2210 	LDW Y,(Y)
      008B9B 90 57            [ 2] 2211         SRAW Y
      008B9D FF               [ 2] 2212         LDW (X),Y
      008B9E 81               [ 4] 2213         RET
                                   2214 
                                   2215 ;       BL      ( -- 32 )
                                   2216 ;       Return 32,  blank character.
      008B9F 8B 94                 2217         .word      LINK
                           000B21  2218 LINK = . 
      008BA1 02                    2219         .byte      2
      008BA2 42 4C                 2220         .ascii     "BL"
      008BA4                       2221 BLANK:
      008BA4 1D 00 02         [ 2] 2222         SUBW X,#2
      008BA7 90 AE 00 20      [ 2] 2223 	LDW Y,#32
      008BAB FF               [ 2] 2224         LDW (X),Y
      008BAC 81               [ 4] 2225         RET
                                   2226 
                                   2227 ;         0     ( -- 0)
                                   2228 ;         Return 0.
      008BAD 8B A1                 2229         .word      LINK
                           000B2F  2230 LINK = . 
      008BAF 01                    2231         .byte       1
      008BB0 30                    2232         .ascii     "0"
      008BB1                       2233 ZERO:
      008BB1 1D 00 02         [ 2] 2234         SUBW X,#2
      008BB4 90 5F            [ 1] 2235 	CLRW Y
      008BB6 FF               [ 2] 2236         LDW (X),Y
      008BB7 81               [ 4] 2237         RET
                                   2238 
                                   2239 ;         1     ( -- 1)
                                   2240 ;         Return 1.
      008BB8 8B AF                 2241         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



                           000B3A  2242 LINK = . 
      008BBA 01                    2243         .byte       1
      008BBB 31                    2244         .ascii     "1"
      008BBC                       2245 ONE:
      008BBC 1D 00 02         [ 2] 2246         SUBW X,#2
      008BBF 90 AE 00 01      [ 2] 2247 	LDW Y,#1
      008BC3 FF               [ 2] 2248         LDW (X),Y
      008BC4 81               [ 4] 2249         RET
                                   2250 
                                   2251 ;         -1    ( -- -1)
                                   2252 ;         Return 32,  blank character.
      008BC5 8B BA                 2253         .word      LINK
                           000B47  2254 LINK = . 
      008BC7 02                    2255         .byte       2
      008BC8 2D 31                 2256         .ascii     "-1"
      008BCA                       2257 MONE:
      008BCA 1D 00 02         [ 2] 2258         SUBW X,#2
      008BCD 90 AE FF FF      [ 2] 2259 	LDW Y,#0xFFFF
      008BD1 FF               [ 2] 2260         LDW (X),Y
      008BD2 81               [ 4] 2261         RET
                                   2262 
                                   2263 ;       >CHAR   ( c -- c )
                                   2264 ;       Filter non-printing characters.
      008BD3 8B C7                 2265         .word      LINK
                           000B55  2266 LINK = . 
      008BD5 05                    2267         .byte      5
      008BD6 3E 43 48 41 52        2268         .ascii     ">CHAR"
      008BDB                       2269 TCHAR:
      008BDB E6 01            [ 1] 2270         ld a,(1,x)
      008BDD A1 20            [ 1] 2271         cp a,#32  
      008BDF 2B 05            [ 1] 2272         jrmi 1$ 
      008BE1 A1 7F            [ 1] 2273         cp a,#127 
      008BE3 2A 01            [ 1] 2274         jrpl 1$ 
      008BE5 81               [ 4] 2275         ret 
      008BE6 A6 5F            [ 1] 2276 1$:     ld a,#'_ 
      008BE8 E7 01            [ 1] 2277         ld (1,x),a 
      008BEA 81               [ 4] 2278         ret 
                                   2279 
                                   2280 ;       DEPTH   ( -- n )
                                   2281 ;       Return  depth of  data stack.
      008BEB 8B D5                 2282         .word      LINK
                           000B6D  2283 LINK = . 
      008BED 05                    2284         .byte      5
      008BEE 44 45 50 54 48        2285         .ascii     "DEPTH"
      008BF3                       2286 DEPTH: 
      008BF3 90 BE 2E         [ 2] 2287         LDW Y,SP0    ;save data stack ptr
      008BF6 BF 26            [ 2] 2288 	LDW XTEMP,X
      008BF8 72 B2 00 26      [ 2] 2289         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008BFC 90 57            [ 2] 2290         SRAW Y    ;Y = #stack items
      008BFE 1D 00 02         [ 2] 2291 	SUBW X,#2
      008C01 FF               [ 2] 2292         LDW (X),Y     ; if neg, underflow
      008C02 81               [ 4] 2293         RET
                                   2294 
                                   2295 ;       PICK    ( ... +n -- ... w )
                                   2296 ;       Copy  nth stack item to tos.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008C03 8B ED                 2297         .word      LINK
                           000B85  2298 LINK = . 
      008C05 04                    2299         .byte      4
      008C06 50 49 43 4B           2300         .ascii     "PICK"
      008C0A                       2301 PICK:
      008C0A 90 93            [ 1] 2302         LDW Y,X   ;D = n1
      008C0C 90 FE            [ 2] 2303         LDW Y,(Y)
                                   2304 ; modified for standard compliance          
                                   2305 ; 0 PICK must be equivalent to DUP 
      008C0E 90 5C            [ 1] 2306         INCW Y 
      008C10 90 58            [ 2] 2307         SLAW Y
      008C12 BF 26            [ 2] 2308         LDW XTEMP,X
      008C14 72 B9 00 26      [ 2] 2309         ADDW Y,XTEMP
      008C18 90 FE            [ 2] 2310         LDW Y,(Y)
      008C1A FF               [ 2] 2311         LDW (X),Y
      008C1B 81               [ 4] 2312         RET
                                   2313 
                                   2314 ;; Memory access
                                   2315 
                                   2316 ;       +!      ( n a -- )
                                   2317 ;       Add n to  contents at address a.
      008C1C 8C 05                 2318         .word      LINK
                           000B9E  2319 LINK = . 
      008C1E 02                    2320         .byte      2
      008C1F 2B 21                 2321         .ascii     "+!"
      008C21                       2322 PSTOR:
      008C21 90 93            [ 1] 2323         ldw y,x 
      008C23 90 FE            [ 2] 2324         ldw y,(y)
      008C25 90 BF 28         [ 2] 2325         ldw YTEMP,y  ; address
      008C28 90 FE            [ 2] 2326         ldw y,(y)  
      008C2A 90 89            [ 2] 2327         pushw y  ; value at address 
      008C2C 90 93            [ 1] 2328         ldw y,x 
      008C2E 90 EE 02         [ 2] 2329         ldw y,(2,y) ; n 
      008C31 72 F9 01         [ 2] 2330         addw y,(1,sp) ; n+value
      008C34 91 CF 28         [ 5] 2331         ldw [YTEMP],y ;  a!
      008C37 90 85            [ 2] 2332         popw y    ;drop local var
      008C39 1C 00 04         [ 2] 2333         addw x,#4 ; DDROP 
      008C3C 81               [ 4] 2334         ret 
                                   2335 
                                   2336 ;       2!      ( d a -- )
                                   2337 ;       Store  double integer to address a.
      008C3D 8C 1E                 2338         .word      LINK
                           000BBF  2339 LINK = . 
      008C3F 02                    2340         .byte      2
      008C40 32 21                 2341         .ascii     "2!"
      008C42                       2342 DSTOR:
      008C42 90 93            [ 1] 2343         ldw y,x 
      008C44 90 FE            [ 2] 2344         ldw y,(y)
      008C46 90 BF 28         [ 2] 2345         ldw YTEMP,y ; address 
      008C49 1C 00 02         [ 2] 2346         addw x,#CELLL ; drop a 
      008C4C 90 93            [ 1] 2347         ldw y,x 
      008C4E 90 FE            [ 2] 2348         ldw y,(y) ; hi word 
      008C50 89               [ 2] 2349         pushw x 
      008C51 EE 02            [ 2] 2350         ldw x,(2,x) ; lo word 
      008C53 91 CF 28         [ 5] 2351         ldw [YTEMP],y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008C56 90 93            [ 1] 2352         ldw y,x 
      008C58 AE 00 02         [ 2] 2353         ldw x,#2 
      008C5B 92 DF 28         [ 5] 2354         ldw ([YTEMP],x),y 
      008C5E 85               [ 2] 2355         popw x 
      008C5F 1C 00 04         [ 2] 2356         addw x,#4 ; DDROP 
      008C62 81               [ 4] 2357         ret 
                                   2358 
                                   2359 ;       2@      ( a -- d )
                                   2360 ;       Fetch double integer from address a.
      008C63 8C 3F                 2361         .word      LINK
                           000BE5  2362 LINK = . 
      008C65 02                    2363         .byte      2
      008C66 32 40                 2364         .ascii     "2@"
      008C68                       2365 DAT:
      008C68 90 93            [ 1] 2366         ldw y,x 
      008C6A 90 FE            [ 2] 2367         ldw y,(y) ;address 
      008C6C 90 BF 28         [ 2] 2368         ldw YTEMP,y 
      008C6F 1D 00 02         [ 2] 2369         subw x,#CELLL ; space for udh 
      008C72 91 CE 28         [ 5] 2370         ldw y,[YTEMP] ; udh 
      008C75 FF               [ 2] 2371         ldw (x),y 
      008C76 90 AE 00 02      [ 2] 2372         ldw y,#2
      008C7A 91 DE 28         [ 5] 2373         ldw y,([YTEMP],y) ; udl 
      008C7D EF 02            [ 2] 2374         ldw (2,x),y
      008C7F 81               [ 4] 2375         ret 
                                   2376 
                                   2377 ;       COUNT   ( b -- b +n )
                                   2378 ;       Return count byte of a string
                                   2379 ;       and add 1 to byte address.
      008C80 8C 65                 2380         .word      LINK
                           000C02  2381 LINK = . 
      008C82 05                    2382         .byte      5
      008C83 43 4F 55 4E 54        2383         .ascii     "COUNT"
      008C88                       2384 COUNT:
      008C88 90 93            [ 1] 2385         ldw y,x 
      008C8A 90 FE            [ 2] 2386         ldw y,(y) ; address 
      008C8C 90 F6            [ 1] 2387         ld a,(y)  ; count 
      008C8E 90 5C            [ 1] 2388         incw y 
      008C90 FF               [ 2] 2389         ldw (x),y 
      008C91 1D 00 02         [ 2] 2390         subw x,#CELLL 
      008C94 E7 01            [ 1] 2391         ld (1,x),a 
      008C96 7F               [ 1] 2392         clr (x)
      008C97 81               [ 4] 2393         ret 
                                   2394 
                                   2395 ;       HERE    ( -- a )
                                   2396 ;       Return  top of  variables
      008C98 8C 82                 2397         .word      LINK
                           000C1A  2398 LINK = . 
      008C9A 04                    2399         .byte      4
      008C9B 48 45 52 45           2400         .ascii     "HERE"
      008C9F                       2401 HERE:
      008C9F 90 AE 00 1A      [ 2] 2402       	ldw y,#UVP 
      008CA3 90 FE            [ 2] 2403         ldw y,(y)
      008CA5 1D 00 02         [ 2] 2404         subw x,#CELLL 
      008CA8 FF               [ 2] 2405         ldw (x),y 
      008CA9 81               [ 4] 2406         ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



                                   2407 
                                   2408 ;       PAD     ( -- a )
                                   2409 ;       Return address of text buffer
                                   2410 ;       above  code dictionary.
      008CAA 8C 9A                 2411         .word      LINK
                           000C2C  2412 LINK = . 
      008CAC 03                    2413         .byte      3
      008CAD 50 41 44              2414         .ascii     "PAD"
      008CB0                       2415 PAD:
      008CB0 CD 8C 9F         [ 4] 2416         CALL     HERE
      008CB3 CD 84 F3         [ 4] 2417         CALL     DOLIT
      008CB6 00 50                 2418         .word      80
      008CB8 CC 88 47         [ 2] 2419         JP     PLUS
                                   2420 
                                   2421 ;       TIB     ( -- a )
                                   2422 ;       Return address of terminal input buffer.
      008CBB 8C AC                 2423         .word      LINK
                           000C3D  2424 LINK = . 
      008CBD 03                    2425         .byte      3
      008CBE 54 49 42              2426         .ascii     "TIB"
      008CC1                       2427 TIB:
      008CC1 CD 87 16         [ 4] 2428         CALL     NTIB
      008CC4 CD 8B 1A         [ 4] 2429         CALL     CELLP
      008CC7 CC 85 71         [ 2] 2430         JP     AT
                                   2431 
                                   2432 ;       @EXECUTE        ( a -- )
                                   2433 ;       Execute vector stored in address a.
      008CCA 8C BD                 2434         .word      LINK
                           000C4C  2435 LINK = . 
      008CCC 08                    2436         .byte      8
      008CCD 40 45 58 45 43 55 54  2437         .ascii     "@EXECUTE"
             45
      008CD5                       2438 ATEXE:
      008CD5 CD 85 71         [ 4] 2439         CALL     AT
      008CD8 CD 87 D5         [ 4] 2440         CALL     QDUP    ;?address or zero
      008CDB CD 85 26         [ 4] 2441         CALL     QBRAN
      008CDE 8C E3                 2442         .word      EXE1
      008CE0 CD 85 4D         [ 4] 2443         CALL     EXECU   ;execute if non-zero
      008CE3 81               [ 4] 2444 EXE1:   RET     ;do nothing if zero
                                   2445 
                                   2446 ;       CMOVE   ( b1 b2 u -- )
                                   2447 ;       Copy u bytes from b1 to b2.
      008CE4 8C CC                 2448         .word      LINK
                           000C66  2449 LINK = . 
      008CE6 05                    2450         .byte      5
      008CE7 43 4D 4F 56 45        2451         .ascii     "CMOVE"
      008CEC                       2452 CMOVE:
      008CEC CD 85 E1         [ 4] 2453         CALL	TOR
      008CEF CD 85 3D         [ 4] 2454         CALL	BRAN
      008CF2 8D 0C                 2455         .word	CMOV2
      008CF4 CD 85 E1         [ 4] 2456 CMOV1:	CALL	TOR
      008CF7 CD 86 18         [ 4] 2457         CALL	DUPP
      008CFA CD 85 8F         [ 4] 2458         CALL	CAT
      008CFD CD 85 D5         [ 4] 2459         CALL	RAT
      008D00 CD 85 7E         [ 4] 2460         CALL	CSTOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008D03 CD 8B 45         [ 4] 2461         CALL	ONEP
      008D06 CD 85 C2         [ 4] 2462         CALL	RFROM
      008D09 CD 8B 45         [ 4] 2463         CALL	ONEP
      008D0C CD 85 07         [ 4] 2464 CMOV2:	CALL	DONXT
      008D0F 8C F4                 2465         .word	CMOV1
      008D11 CC 88 27         [ 2] 2466         JP	DDROP
                                   2467 
                                   2468 ;       FILL    ( b u c -- )
                                   2469 ;       Fill u bytes of character c
                                   2470 ;       to area beginning at b.
      008D14 8C E6                 2471         .word       LINK
                           000C96  2472 LINK = . 
      008D16 04                    2473         .byte       4
      008D17 46 49 4C 4C           2474         .ascii     "FILL"
      008D1B                       2475 FILL:
      008D1B 90 93            [ 1] 2476         ldw y,x 
      008D1D 90 E6 01         [ 1] 2477         ld a,(1,y) ; c 
      008D20 1C 00 02         [ 2] 2478         addw x,#CELLL ; drop c 
      008D23 90 93            [ 1] 2479         ldw y,x 
      008D25 90 FE            [ 2] 2480         ldw y,(y) ; count
      008D27 90 89            [ 2] 2481         pushw y 
      008D29 1C 00 02         [ 2] 2482         addw x,#CELLL ; drop u 
      008D2C 90 93            [ 1] 2483         ldw y,x 
      008D2E 1C 00 02         [ 2] 2484         addw x,#CELLL ; drop b 
      008D31 90 FE            [ 2] 2485         ldw y,(y) ; address
      008D33 90 BF 28         [ 2] 2486         ldw YTEMP,y
      008D36 90 85            [ 2] 2487         popw y ; count 
      008D38                       2488 FILL1:  
      008D38 92 C7 28         [ 4] 2489         ld [YTEMP],a 
      008D3B 3C 29            [ 1] 2490         inc YTEMP+1
      008D3D 24 02            [ 1] 2491         jrnc FILL2 
      008D3F 3C 28            [ 1] 2492         inc YTEMP
      008D41                       2493 FILL2: 
      008D41 90 5A            [ 2] 2494         decw y ; count 
      008D43 26 F3            [ 1] 2495         jrne FILL1  
      008D45 81               [ 4] 2496         ret 
                                   2497 
                                   2498 ;       ERASE   ( b u -- )
                                   2499 ;       Erase u bytes beginning at b.
      008D46 8D 16                 2500         .word      LINK
                           000CC8  2501 LINK = . 
      008D48 05                    2502         .byte      5
      008D49 45 52 41 53 45        2503         .ascii     "ERASE"
      008D4E                       2504 ERASE:
      008D4E 90 5F            [ 1] 2505         clrw y 
      008D50 1D 00 02         [ 2] 2506         subw x,#CELLL 
      008D53 FF               [ 2] 2507         ldw (x),y 
      008D54 CC 8D 1B         [ 2] 2508         jp FILL 
                                   2509 
                                   2510 
                                   2511 ;       PACK0   ( b u a -- a )
                                   2512 ;       Build a counted string with
                                   2513 ;       u characters from b. Null fill.
      008D57 8D 48                 2514         .word      LINK
                           000CD9  2515 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008D59 05                    2516         .byte      5
      008D5A 50 41 43 4B 30        2517         .ascii     "PACK0"
      008D5F                       2518 PACKS:
      008D5F CD 86 18         [ 4] 2519         CALL     DUPP
      008D62 CD 85 E1         [ 4] 2520         CALL     TOR     ;strings only on cell boundary
      008D65 CD 88 32         [ 4] 2521         CALL     DDUP
      008D68 CD 85 7E         [ 4] 2522         CALL     CSTOR
      008D6B CD 8B 45         [ 4] 2523         CALL     ONEP ;save count
      008D6E CD 86 28         [ 4] 2524         CALL     SWAPP
      008D71 CD 8C EC         [ 4] 2525         CALL     CMOVE
      008D74 CD 85 C2         [ 4] 2526         CALL     RFROM
      008D77 81               [ 4] 2527         RET
                                   2528 
                                   2529 ;; Numeric output, single precision
                                   2530 
                                   2531 ;       DIGIT   ( u -- c )
                                   2532 ;       Convert digit u to a character.
      008D78 8D 59                 2533         .word      LINK
                           000CFA  2534 LINK = . 
      008D7A 05                    2535         .byte      5
      008D7B 44 49 47 49 54        2536         .ascii     "DIGIT"
      008D80                       2537 DIGIT:
      008D80 CD 84 F3         [ 4] 2538         CALL	DOLIT
      008D83 00 09                 2539         .word	9
      008D85 CD 86 42         [ 4] 2540         CALL	OVER
      008D88 CD 89 25         [ 4] 2541         CALL	LESS
      008D8B CD 84 F3         [ 4] 2542         CALL	DOLIT
      008D8E 00 07                 2543         .word	7
      008D90 CD 86 77         [ 4] 2544         CALL	ANDD
      008D93 CD 88 47         [ 4] 2545         CALL	PLUS
      008D96 CD 84 F3         [ 4] 2546         CALL	DOLIT
      008D99 00 30                 2547         .word	48	;'0'
      008D9B CC 88 47         [ 2] 2548         JP	PLUS
                                   2549 
                                   2550 ;       EXTRACT ( n base -- n c )
                                   2551 ;       Extract least significant digit from n.
      008D9E 8D 7A                 2552         .word      LINK
                           000D20  2553 LINK = . 
      008DA0 07                    2554         .byte      7
      008DA1 45 58 54 52 41 43 54  2555         .ascii     "EXTRACT"
      008DA8                       2556 EXTRC:
      008DA8 CD 8B B1         [ 4] 2557         CALL     ZERO
      008DAB CD 86 28         [ 4] 2558         CALL     SWAPP
      008DAE CD 89 BB         [ 4] 2559         CALL     UMMOD
      008DB1 CD 86 28         [ 4] 2560         CALL     SWAPP
      008DB4 CC 8D 80         [ 2] 2561         JP     DIGIT
                                   2562 
                                   2563 ;       <#      ( -- )
                                   2564 ;       Initiate  numeric output process.
      008DB7 8D A0                 2565         .word      LINK
                           000D39  2566 LINK = . 
      008DB9 02                    2567         .byte      2
      008DBA 3C 23                 2568         .ascii     "<#"
      008DBC                       2569 BDIGS:
      008DBC CD 8C B0         [ 4] 2570         CALL     PAD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008DBF CD 87 58         [ 4] 2571         CALL     HLD
      008DC2 CC 85 5A         [ 2] 2572         JP     STORE
                                   2573 
                                   2574 ;       HOLD    ( c -- )
                                   2575 ;       Insert a character into output string.
      008DC5 8D B9                 2576         .word      LINK
                           000D47  2577 LINK = . 
      008DC7 04                    2578         .byte      4
      008DC8 48 4F 4C 44           2579         .ascii     "HOLD"
      008DCC                       2580 HOLD:
      008DCC CD 87 58         [ 4] 2581         CALL     HLD
      008DCF CD 85 71         [ 4] 2582         CALL     AT
      008DD2 CD 8B 52         [ 4] 2583         CALL     ONEM
      008DD5 CD 86 18         [ 4] 2584         CALL     DUPP
      008DD8 CD 87 58         [ 4] 2585         CALL     HLD
      008DDB CD 85 5A         [ 4] 2586         CALL     STORE
      008DDE CC 85 7E         [ 2] 2587         JP     CSTOR
                                   2588 
                                   2589 ;       #       ( u -- u )
                                   2590 ;       Extract one digit from u and
                                   2591 ;       append digit to output string.
      008DE1 8D C7                 2592         .word      LINK
                           000D63  2593 LINK = . 
      008DE3 01                    2594         .byte      1
      008DE4 23                    2595         .ascii     "#"
      008DE5                       2596 DIG:
      008DE5 CD 86 E8         [ 4] 2597         CALL     BASE
      008DE8 CD 85 71         [ 4] 2598         CALL     AT
      008DEB CD 8D A8         [ 4] 2599         CALL     EXTRC
      008DEE CC 8D CC         [ 2] 2600         JP     HOLD
                                   2601 
                                   2602 ;       #S      ( u -- 0 )
                                   2603 ;       Convert u until all digits
                                   2604 ;       are added to output string.
      008DF1 8D E3                 2605         .word      LINK
                           000D73  2606 LINK = . 
      008DF3 02                    2607         .byte      2
      008DF4 23 53                 2608         .ascii     "#S"
      008DF6                       2609 DIGS:
      008DF6 CD 8D E5         [ 4] 2610 DIGS1:  CALL     DIG
      008DF9 CD 86 18         [ 4] 2611         CALL     DUPP
      008DFC CD 85 26         [ 4] 2612         CALL     QBRAN
      008DFF 8E 03                 2613         .word      DIGS2
      008E01 20 F3            [ 2] 2614         JRA     DIGS1
      008E03 81               [ 4] 2615 DIGS2:  RET
                                   2616 
                                   2617 ;       SIGN    ( n -- )
                                   2618 ;       Add a minus sign to
                                   2619 ;       numeric output string.
      008E04 8D F3                 2620         .word      LINK
                           000D86  2621 LINK = . 
      008E06 04                    2622         .byte      4
      008E07 53 49 47 4E           2623         .ascii     "SIGN"
      008E0B                       2624 SIGN:
      008E0B CD 86 51         [ 4] 2625         CALL     ZLESS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008E0E CD 85 26         [ 4] 2626         CALL     QBRAN
      008E11 8E 1B                 2627         .word      SIGN1
      008E13 CD 84 F3         [ 4] 2628         CALL     DOLIT
      008E16 00 2D                 2629         .word      45	;"-"
      008E18 CC 8D CC         [ 2] 2630         JP     HOLD
      008E1B 81               [ 4] 2631 SIGN1:  RET
                                   2632 
                                   2633 ;       #>      ( w -- b u )
                                   2634 ;       Prepare output string.
      008E1C 8E 06                 2635         .word      LINK
                           000D9E  2636 LINK = . 
      008E1E 02                    2637         .byte      2
      008E1F 23 3E                 2638         .ascii     "#>"
      008E21                       2639 EDIGS:
      008E21 CD 86 0E         [ 4] 2640         CALL     DROP
      008E24 CD 87 58         [ 4] 2641         CALL     HLD
      008E27 CD 85 71         [ 4] 2642         CALL     AT
      008E2A CD 8C B0         [ 4] 2643         CALL     PAD
      008E2D CD 86 42         [ 4] 2644         CALL     OVER
      008E30 CC 88 C0         [ 2] 2645         JP     SUBB
                                   2646 
                                   2647 ;       str     ( w -- b u )
                                   2648 ;       Convert a signed integer
                                   2649 ;       to a numeric string.
      008E33 8E 1E                 2650         .word      LINK
                           000DB5  2651 LINK = . 
      008E35 03                    2652         .byte      3
      008E36 53 54 52              2653         .ascii     "STR"
      008E39                       2654 STR:
      008E39 CD 86 18         [ 4] 2655         CALL     DUPP
      008E3C CD 85 E1         [ 4] 2656         CALL     TOR
      008E3F CD 88 DA         [ 4] 2657         CALL     ABSS
      008E42 CD 8D BC         [ 4] 2658         CALL     BDIGS
      008E45 CD 8D F6         [ 4] 2659         CALL     DIGS
      008E48 CD 85 C2         [ 4] 2660         CALL     RFROM
      008E4B CD 8E 0B         [ 4] 2661         CALL     SIGN
      008E4E CC 8E 21         [ 2] 2662         JP     EDIGS
                                   2663 
                                   2664 ;       HEX     ( -- )
                                   2665 ;       Use radix 16 as base for
                                   2666 ;       numeric conversions.
      008E51 8E 35                 2667         .word      LINK
                           000DD3  2668 LINK = . 
      008E53 03                    2669         .byte      3
      008E54 48 45 58              2670         .ascii     "HEX"
      008E57                       2671 HEX:
      008E57 CD 84 F3         [ 4] 2672         CALL     DOLIT
      008E5A 00 10                 2673         .word      16
      008E5C CD 86 E8         [ 4] 2674         CALL     BASE
      008E5F CC 85 5A         [ 2] 2675         JP     STORE
                                   2676 
                                   2677 ;       DECIMAL ( -- )
                                   2678 ;       Use radix 10 as base
                                   2679 ;       for numeric conversions.
      008E62 8E 53                 2680         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                           000DE4  2681 LINK = . 
      008E64 07                    2682         .byte      7
      008E65 44 45 43 49 4D 41 4C  2683         .ascii     "DECIMAL"
      008E6C                       2684 DECIM:
      008E6C CD 84 F3         [ 4] 2685         CALL     DOLIT
      008E6F 00 0A                 2686         .word      10
      008E71 CD 86 E8         [ 4] 2687         CALL     BASE
      008E74 CC 85 5A         [ 2] 2688         JP     STORE
                                   2689 
                                   2690 ;; Numeric input, single precision
                                   2691 
                                   2692 ;       DIGIT?  ( c base -- u t )
                                   2693 ;       Convert a character to its numeric
                                   2694 ;       value. A flag indicates success.
      008E77 8E 64                 2695         .word      LINK
                           000DF9  2696 LINK = . 
      008E79 06                    2697         .byte       6
      008E7A 44 49 47 49 54 3F     2698         .ascii     "DIGIT?"
      008E80                       2699 DIGTQ:
      008E80 CD 85 E1         [ 4] 2700         CALL     TOR
      008E83 CD 84 F3         [ 4] 2701         CALL     DOLIT
      008E86 00 30                 2702         .word     48	; "0"
      008E88 CD 88 C0         [ 4] 2703         CALL     SUBB
      008E8B CD 84 F3         [ 4] 2704         CALL     DOLIT
      008E8E 00 09                 2705         .word      9
      008E90 CD 86 42         [ 4] 2706         CALL     OVER
      008E93 CD 89 25         [ 4] 2707         CALL     LESS
      008E96 CD 85 26         [ 4] 2708         CALL     QBRAN
      008E99 8E B1                 2709         .word      DGTQ1
      008E9B CD 84 F3         [ 4] 2710         CALL     DOLIT
      008E9E 00 07                 2711         .word      7
      008EA0 CD 88 C0         [ 4] 2712         CALL     SUBB
      008EA3 CD 86 18         [ 4] 2713         CALL     DUPP
      008EA6 CD 84 F3         [ 4] 2714         CALL     DOLIT
      008EA9 00 0A                 2715         .word      10
      008EAB CD 89 25         [ 4] 2716         CALL     LESS
      008EAE CD 86 8B         [ 4] 2717         CALL     ORR
      008EB1 CD 86 18         [ 4] 2718 DGTQ1:  CALL     DUPP
      008EB4 CD 85 C2         [ 4] 2719         CALL     RFROM
      008EB7 CC 89 07         [ 2] 2720         JP     ULESS
                                   2721 
                           000001  2722 .if  WANT_DOUBLE
                           000000  2723 .else 
                                   2724 ;       NUMBER? ( a -- n T | a F )
                                   2725 ;       Convert a number string to
                                   2726 ;       integer. Push a flag on tos.
                                   2727         .word      LINK
                                   2728 LINK = . 
                                   2729         .byte      7
                                   2730         .ascii     "NUMBER?"
                                   2731 NUMBQ:
                                   2732         CALL     BASE
                                   2733         CALL     AT
                                   2734         CALL     TOR
                                   2735         CALL     ZERO
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2736         CALL     OVER
                                   2737         CALL     COUNT
                                   2738         CALL     OVER
                                   2739         CALL     CAT
                                   2740         CALL     DOLIT
                                   2741         .word     36	; "0x"
                                   2742         CALL     EQUAL
                                   2743         CALL     QBRAN
                                   2744         .word      NUMQ1
                                   2745         CALL     HEX
                                   2746         CALL     SWAPP
                                   2747         CALL     ONEP
                                   2748         CALL     SWAPP
                                   2749         CALL     ONEM
                                   2750 NUMQ1:  CALL     OVER
                                   2751         CALL     CAT
                                   2752         CALL     DOLIT
                                   2753         .word     45	; "-"
                                   2754         CALL     EQUAL
                                   2755         CALL     TOR
                                   2756         CALL     SWAPP
                                   2757         CALL     RAT
                                   2758         CALL     SUBB
                                   2759         CALL     SWAPP
                                   2760         CALL     RAT
                                   2761         CALL     PLUS
                                   2762         CALL     QDUP
                                   2763         CALL     QBRAN
                                   2764         .word      NUMQ6
                                   2765         CALL     ONEM
                                   2766         CALL     TOR
                                   2767 NUMQ2:  CALL     DUPP
                                   2768         CALL     TOR
                                   2769         CALL     CAT
                                   2770         CALL     BASE
                                   2771         CALL     AT
                                   2772         CALL     DIGTQ
                                   2773         CALL     QBRAN
                                   2774         .word      NUMQ4
                                   2775         CALL     SWAPP
                                   2776         CALL     BASE
                                   2777         CALL     AT
                                   2778         CALL     STAR
                                   2779         CALL     PLUS
                                   2780         CALL     RFROM
                                   2781         CALL     ONEP
                                   2782         CALL     DONXT
                                   2783         .word      NUMQ2
                                   2784         CALL     RAT
                                   2785         CALL     SWAPP
                                   2786         CALL     DROP
                                   2787         CALL     QBRAN
                                   2788         .word      NUMQ3
                                   2789         CALL     NEGAT
                                   2790 NUMQ3:  CALL     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2791         JRA     NUMQ5
                                   2792 NUMQ4:  CALL     RFROM
                                   2793         CALL     RFROM
                                   2794         CALL     DDROP
                                   2795         CALL     DDROP
                                   2796         CALL     ZERO
                                   2797 NUMQ5:  CALL     DUPP
                                   2798 NUMQ6:  CALL     RFROM
                                   2799         CALL     DDROP
                                   2800         CALL     RFROM
                                   2801         CALL     BASE
                                   2802         JP     STORE
                                   2803 .endif ; WANT_DOUBLE  
                                   2804 
                                   2805 ;; Basic I/O
                                   2806 
                                   2807 ;       KEY     ( -- c )
                                   2808 ;       Wait for and return an
                                   2809 ;       input character.
      008EBA 8E 79                 2810         .word      LINK
                           000E3C  2811 LINK = . 
      008EBC 03                    2812         .byte      3
      008EBD 4B 45 59              2813         .ascii     "KEY"
      008EC0                       2814 KEY:
      008EC0 72 0B 52 30 FB   [ 2] 2815         btjf UART_SR,#UART_SR_RXNE,. 
      008EC5 C6 52 31         [ 1] 2816         ld a,UART_DR 
      008EC8 1D 00 02         [ 2] 2817         subw x,#CELLL 
      008ECB E7 01            [ 1] 2818         ld (1,x),a 
      008ECD 7F               [ 1] 2819         clr (x)
      008ECE 81               [ 4] 2820         ret 
                                   2821 
                                   2822 ;       NUF?    ( -- t )
                                   2823 ;       Return false if no input,
                                   2824 ;       else pause and if CR return true.
      008ECF 8E BC                 2825         .word      LINK
                           000E51  2826 LINK = . 
      008ED1 04                    2827         .byte      4
      008ED2 4E 55 46 3F           2828         .ascii     "NUF?"
      008ED6                       2829 NUFQ:
      008ED6 CD 84 9A         [ 4] 2830         CALL     QKEY
      008ED9 CD 86 18         [ 4] 2831         CALL     DUPP
      008EDC CD 85 26         [ 4] 2832         CALL     QBRAN
      008EDF 8E EF                 2833         .word    NUFQ1
      008EE1 CD 88 27         [ 4] 2834         CALL     DDROP
      008EE4 CD 8E C0         [ 4] 2835         CALL     KEY
      008EE7 CD 84 F3         [ 4] 2836         CALL     DOLIT
      008EEA 00 0D                 2837         .word      CRR
      008EEC CC 88 E8         [ 2] 2838         JP     EQUAL
      008EEF 81               [ 4] 2839 NUFQ1:  RET
                                   2840 
                                   2841 ;       SPACE   ( -- )
                                   2842 ;       Send  blank character to
                                   2843 ;       output device.
      008EF0 8E D1                 2844         .word      LINK
                           000E72  2845 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008EF2 05                    2846         .byte      5
      008EF3 53 50 41 43 45        2847         .ascii     "SPACE"
      008EF8                       2848 SPACE:
      008EF8 CD 8B A4         [ 4] 2849         CALL     BLANK
      008EFB CC 84 B8         [ 2] 2850         JP     EMIT
                                   2851 
                                   2852 ;       SPACES  ( +n -- )
                                   2853 ;       Send n spaces to output device.
      008EFE 8E F2                 2854         .word      LINK
                           000E80  2855 LINK = . 
      008F00 06                    2856         .byte      6
      008F01 53 50 41 43 45 53     2857         .ascii     "SPACES"
      008F07                       2858 SPACS:
      008F07 CD 8B B1         [ 4] 2859         CALL     ZERO
      008F0A CD 89 63         [ 4] 2860         CALL     MAX
      008F0D CD 85 E1         [ 4] 2861         CALL     TOR
      008F10 20 03            [ 2] 2862         JRA      CHAR2
      008F12 CD 8E F8         [ 4] 2863 CHAR1:  CALL     SPACE
      008F15 CD 85 07         [ 4] 2864 CHAR2:  CALL     DONXT
      008F18 8F 12                 2865         .word    CHAR1
      008F1A 81               [ 4] 2866         RET
                                   2867 
                                   2868 ;       TYPE    ( b u -- )
                                   2869 ;       Output u characters from b.
      008F1B 8F 00                 2870         .word      LINK
                           000E9D  2871 LINK = . 
      008F1D 04                    2872         .byte      4
      008F1E 54 59 50 45           2873         .ascii     "TYPE"
      008F22                       2874 TYPES:
      008F22 CD 85 E1         [ 4] 2875         CALL     TOR
      008F25 20 0C            [ 2] 2876         JRA     TYPE2
      008F27 CD 86 18         [ 4] 2877 TYPE1:  CALL     DUPP
      008F2A CD 85 8F         [ 4] 2878         CALL     CAT
      008F2D CD 84 B8         [ 4] 2879         CALL     EMIT
      008F30 CD 8B 45         [ 4] 2880         CALL     ONEP
      008F33 CD 85 07         [ 4] 2881 TYPE2:  CALL     DONXT
      008F36 8F 27                 2882         .word      TYPE1
      008F38 CC 86 0E         [ 2] 2883         JP     DROP
                                   2884 
                                   2885 ;       CR      ( -- )
                                   2886 ;       Output a carriage return
                                   2887 ;       and a line feed.
      008F3B 8F 1D                 2888         .word      LINK
                           000EBD  2889 LINK = . 
      008F3D 02                    2890         .byte      2
      008F3E 43 52                 2891         .ascii     "CR"
      008F40                       2892 CR:
      008F40 CD 84 F3         [ 4] 2893         CALL     DOLIT
      008F43 00 0D                 2894         .word      CRR
      008F45 CD 84 B8         [ 4] 2895         CALL     EMIT
      008F48 CD 84 F3         [ 4] 2896         CALL     DOLIT
      008F4B 00 0A                 2897         .word      LF
      008F4D CC 84 B8         [ 2] 2898         JP     EMIT
                                   2899 
                                   2900 ;       do$     ( -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                                   2901 ;       Return  address of a compiled
                                   2902 ;       string.
      008F50 8F 3D                 2903         .word      LINK
                           000ED2  2904 LINK = . 
      008F52 43                    2905 	.byte      COMPO+3
      008F53 44 4F 24              2906         .ascii     "DO$"
      008F56                       2907 DOSTR:
      008F56 CD 85 C2         [ 4] 2908         CALL     RFROM
      008F59 CD 85 D5         [ 4] 2909         CALL     RAT
      008F5C CD 85 C2         [ 4] 2910         CALL     RFROM
      008F5F CD 8C 88         [ 4] 2911         CALL     COUNT
      008F62 CD 88 47         [ 4] 2912         CALL     PLUS
      008F65 CD 85 E1         [ 4] 2913         CALL     TOR
      008F68 CD 86 28         [ 4] 2914         CALL     SWAPP
      008F6B CD 85 E1         [ 4] 2915         CALL     TOR
      008F6E 81               [ 4] 2916         RET
                                   2917 
                                   2918 ;       $"|     ( -- a )
                                   2919 ;       Run time routine compiled by $".
                                   2920 ;       Return address of a compiled string.
      008F6F 8F 52                 2921         .word      LINK
                           000EF1  2922 LINK = . 
      008F71 43                    2923 	.byte      COMPO+3
      008F72 24 22 7C              2924         .byte     '$','"','|'
      008F75                       2925 STRQP:
      008F75 CD 8F 56         [ 4] 2926         CALL     DOSTR
      008F78 81               [ 4] 2927         RET
                                   2928 
                                   2929 ;       ."|     ( -- )
                                   2930 ;       Run time routine of ." .
                                   2931 ;       Output a compiled string.
      008F79 8F 71                 2932         .word      LINK
                           000EFB  2933 LINK = . 
      008F7B 43                    2934 	.byte      COMPO+3
      008F7C 2E 22 7C              2935         .byte     '.','"','|'
      008F7F                       2936 DOTQP:
      008F7F CD 8F 56         [ 4] 2937         CALL     DOSTR
      008F82 CD 8C 88         [ 4] 2938         CALL     COUNT
      008F85 CC 8F 22         [ 2] 2939         JP     TYPES
                                   2940 
                                   2941 ;       .R      ( n +n -- )
                                   2942 ;       Display an integer in a field
                                   2943 ;       of n columns, right justified.
      008F88 8F 7B                 2944         .word      LINK
                           000F0A  2945 LINK = . 
      008F8A 02                    2946         .byte      2
      008F8B 2E 52                 2947         .ascii     ".R"
      008F8D                       2948 DOTR:
      008F8D CD 85 E1         [ 4] 2949         CALL     TOR
      008F90 CD 8E 39         [ 4] 2950         CALL     STR
      008F93 CD 85 C2         [ 4] 2951         CALL     RFROM
      008F96 CD 86 42         [ 4] 2952         CALL     OVER
      008F99 CD 88 C0         [ 4] 2953         CALL     SUBB
      008F9C CD 8F 07         [ 4] 2954         CALL     SPACS
      008F9F CC 8F 22         [ 2] 2955         JP     TYPES
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                                   2956 
                                   2957 ;       U.R     ( u +n -- )
                                   2958 ;       Display an unsigned integer
                                   2959 ;       in n column, right justified.
      008FA2 8F 8A                 2960         .word      LINK
                           000F24  2961 LINK = . 
      008FA4 03                    2962         .byte      3
      008FA5 55 2E 52              2963         .ascii     "U.R"
      008FA8                       2964 UDOTR:
      008FA8 CD 85 E1         [ 4] 2965         CALL     TOR
      008FAB CD 8D BC         [ 4] 2966         CALL     BDIGS
      008FAE CD 8D F6         [ 4] 2967         CALL     DIGS
      008FB1 CD 8E 21         [ 4] 2968         CALL     EDIGS
      008FB4 CD 85 C2         [ 4] 2969         CALL     RFROM
      008FB7 CD 86 42         [ 4] 2970         CALL     OVER
      008FBA CD 88 C0         [ 4] 2971         CALL     SUBB
      008FBD CD 8F 07         [ 4] 2972         CALL     SPACS
      008FC0 CC 8F 22         [ 2] 2973         JP     TYPES
                                   2974 
                                   2975 ;       U.      ( u -- )
                                   2976 ;       Display an unsigned integer
                                   2977 ;       in free format.
      008FC3 8F A4                 2978         .word      LINK
                           000F45  2979 LINK = . 
      008FC5 02                    2980         .byte      2
      008FC6 55 2E                 2981         .ascii     "U."
      008FC8                       2982 UDOT:
      008FC8 CD 8D BC         [ 4] 2983         CALL     BDIGS
      008FCB CD 8D F6         [ 4] 2984         CALL     DIGS
      008FCE CD 8E 21         [ 4] 2985         CALL     EDIGS
      008FD1 CD 8E F8         [ 4] 2986         CALL     SPACE
      008FD4 CC 8F 22         [ 2] 2987         JP     TYPES
                                   2988 
                                   2989 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2990 ;   H. ( n -- )
                                   2991 ;   display n in hexadecimal 
                                   2992 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F57                       2993         _HEADER HDOT,2,"H."
      008FD7 8F C5                    1         .word LINK 
                           000F59     2         LINK=.
      008FD9 02                       3         .byte 2  
      008FDA 48 2E                    4         .ascii "H."
      008FDC                          5         HDOT:
      008FDC CD 86 E8         [ 4] 2994         CALL BASE 
      008FDF CD 85 71         [ 4] 2995         CALL AT 
      008FE2 CD 85 E1         [ 4] 2996         CALL TOR 
      008FE5 CD 8E 57         [ 4] 2997         CALL HEX 
      008FE8 CD 8F C8         [ 4] 2998         CALL UDOT 
      008FEB CD 85 C2         [ 4] 2999         CALL RFROM 
      008FEE CD 86 E8         [ 4] 3000         CALL BASE 
      008FF1 CD 85 5A         [ 4] 3001         CALL STORE 
      008FF4 81               [ 4] 3002         RET 
                                   3003 
                                   3004 
                                   3005 ;       .       ( w -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                                   3006 ;       Display an integer in free
                                   3007 ;       format, preceeded by a space.
      008FF5 8F D9                 3008         .word      LINK
                           000F77  3009 LINK = . 
      008FF7 01                    3010         .byte      1
      008FF8 2E                    3011         .ascii     "."
      008FF9                       3012 DOT:
      008FF9 CD 86 E8         [ 4] 3013         CALL     BASE
      008FFC CD 85 71         [ 4] 3014         CALL     AT
      008FFF CD 84 F3         [ 4] 3015         CALL     DOLIT
      009002 00 0A                 3016         .word      10
      009004 CD 86 A0         [ 4] 3017         CALL     XORR    ;?decimal
      009007 CD 85 26         [ 4] 3018         CALL     QBRAN
      00900A 90 0F                 3019         .word      DOT1
      00900C CC 8F C8         [ 2] 3020         JP     UDOT
      00900F CD 8E 39         [ 4] 3021 DOT1:   CALL     STR
      009012 CD 8E F8         [ 4] 3022         CALL     SPACE
      009015 CC 8F 22         [ 2] 3023         JP     TYPES
                                   3024 
                                   3025 ;       ?       ( a -- )
                                   3026 ;       Display contents in memory cell.
      009018 8F F7                 3027         .word      LINK
                                   3028         
                           000F9A  3029 LINK = . 
      00901A 01                    3030         .byte      1
      00901B 3F                    3031         .ascii     "?"
      00901C                       3032 QUEST:
      00901C CD 85 71         [ 4] 3033         CALL     AT
      00901F CC 8F F9         [ 2] 3034         JP     DOT
                                   3035 
                                   3036 ;; Parsing
                                   3037 
                                   3038 ;       parse   ( b u c -- b u delta ; <string> )
                                   3039 ;       Scan string delimited by c.
                                   3040 ;       Return found string and its offset.
      009022 90 1A                 3041         .word      LINK
                           000FA4  3042 LINK = . 
      009024 05                    3043         .byte      5
      009025 70 61 72 73 65        3044         .ascii     "parse"
      00902A                       3045 PARS:
      00902A CD 86 F7         [ 4] 3046         CALL     TEMP
      00902D CD 85 5A         [ 4] 3047         CALL     STORE
      009030 CD 86 42         [ 4] 3048         CALL     OVER
      009033 CD 85 E1         [ 4] 3049         CALL     TOR
      009036 CD 86 18         [ 4] 3050         CALL     DUPP
      009039 CD 85 26         [ 4] 3051         CALL     QBRAN
      00903C 90 E2                 3052         .word    PARS8
      00903E CD 8B 52         [ 4] 3053         CALL     ONEM
      009041 CD 86 F7         [ 4] 3054         CALL     TEMP
      009044 CD 85 71         [ 4] 3055         CALL     AT
      009047 CD 8B A4         [ 4] 3056         CALL     BLANK
      00904A CD 88 E8         [ 4] 3057         CALL     EQUAL
      00904D CD 85 26         [ 4] 3058         CALL     QBRAN
      009050 90 83                 3059         .word      PARS3
      009052 CD 85 E1         [ 4] 3060         CALL     TOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      009055 CD 8B A4         [ 4] 3061 PARS1:  CALL     BLANK
      009058 CD 86 42         [ 4] 3062         CALL     OVER
      00905B CD 85 8F         [ 4] 3063         CALL     CAT     ;skip leading blanks ONLY
      00905E CD 88 C0         [ 4] 3064         CALL     SUBB
      009061 CD 86 51         [ 4] 3065         CALL     ZLESS
      009064 CD 88 61         [ 4] 3066         CALL     INVER
      009067 CD 85 26         [ 4] 3067         CALL     QBRAN
      00906A 90 80                 3068         .word      PARS2
      00906C CD 8B 45         [ 4] 3069         CALL     ONEP
      00906F CD 85 07         [ 4] 3070         CALL     DONXT
      009072 90 55                 3071         .word      PARS1
      009074 CD 85 C2         [ 4] 3072         CALL     RFROM
      009077 CD 86 0E         [ 4] 3073         CALL     DROP
      00907A CD 8B B1         [ 4] 3074         CALL     ZERO
      00907D CC 86 18         [ 2] 3075         JP     DUPP
      009080 CD 85 C2         [ 4] 3076 PARS2:  CALL     RFROM
      009083 CD 86 42         [ 4] 3077 PARS3:  CALL     OVER
      009086 CD 86 28         [ 4] 3078         CALL     SWAPP
      009089 CD 85 E1         [ 4] 3079         CALL     TOR
      00908C CD 86 F7         [ 4] 3080 PARS4:  CALL     TEMP
      00908F CD 85 71         [ 4] 3081         CALL     AT
      009092 CD 86 42         [ 4] 3082         CALL     OVER
      009095 CD 85 8F         [ 4] 3083         CALL     CAT
      009098 CD 88 C0         [ 4] 3084         CALL     SUBB    ;scan for delimiter
      00909B CD 86 F7         [ 4] 3085         CALL     TEMP
      00909E CD 85 71         [ 4] 3086         CALL     AT
      0090A1 CD 8B A4         [ 4] 3087         CALL     BLANK
      0090A4 CD 88 E8         [ 4] 3088         CALL     EQUAL
      0090A7 CD 85 26         [ 4] 3089         CALL     QBRAN
      0090AA 90 AF                 3090         .word      PARS5
      0090AC CD 86 51         [ 4] 3091         CALL     ZLESS
      0090AF CD 85 26         [ 4] 3092 PARS5:  CALL     QBRAN
      0090B2 90 C4                 3093         .word      PARS6
      0090B4 CD 8B 45         [ 4] 3094         CALL     ONEP
      0090B7 CD 85 07         [ 4] 3095         CALL     DONXT
      0090BA 90 8C                 3096         .word      PARS4
      0090BC CD 86 18         [ 4] 3097         CALL     DUPP
      0090BF CD 85 E1         [ 4] 3098         CALL     TOR
      0090C2 20 0F            [ 2] 3099         JRA     PARS7
      0090C4 CD 85 C2         [ 4] 3100 PARS6:  CALL     RFROM
      0090C7 CD 86 0E         [ 4] 3101         CALL     DROP
      0090CA CD 86 18         [ 4] 3102         CALL     DUPP
      0090CD CD 8B 45         [ 4] 3103         CALL     ONEP
      0090D0 CD 85 E1         [ 4] 3104         CALL     TOR
      0090D3 CD 86 42         [ 4] 3105 PARS7:  CALL     OVER
      0090D6 CD 88 C0         [ 4] 3106         CALL     SUBB
      0090D9 CD 85 C2         [ 4] 3107         CALL     RFROM
      0090DC CD 85 C2         [ 4] 3108         CALL     RFROM
      0090DF CC 88 C0         [ 2] 3109         JP     SUBB
      0090E2 CD 86 42         [ 4] 3110 PARS8:  CALL     OVER
      0090E5 CD 85 C2         [ 4] 3111         CALL     RFROM
      0090E8 CC 88 C0         [ 2] 3112         JP     SUBB
                                   3113 
                                   3114 ;       PARSE   ( c -- b u ; <string> )
                                   3115 ;       Scan input stream and return
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                   3116 ;       counted string delimited by c.
      0090EB 90 24                 3117         .word      LINK
                           00106D  3118 LINK = . 
      0090ED 05                    3119         .byte      5
      0090EE 50 41 52 53 45        3120         .ascii     "PARSE"
      0090F3                       3121 PARSE:
      0090F3 CD 85 E1         [ 4] 3122         CALL     TOR
      0090F6 CD 8C C1         [ 4] 3123         CALL     TIB
      0090F9 CD 87 06         [ 4] 3124         CALL     INN
      0090FC CD 85 71         [ 4] 3125         CALL     AT
      0090FF CD 88 47         [ 4] 3126         CALL     PLUS    ;current input buffer pointer
      009102 CD 87 16         [ 4] 3127         CALL     NTIB
      009105 CD 85 71         [ 4] 3128         CALL     AT
      009108 CD 87 06         [ 4] 3129         CALL     INN
      00910B CD 85 71         [ 4] 3130         CALL     AT
      00910E CD 88 C0         [ 4] 3131         CALL     SUBB    ;remaining count
      009111 CD 85 C2         [ 4] 3132         CALL     RFROM
      009114 CD 90 2A         [ 4] 3133         CALL     PARS
      009117 CD 87 06         [ 4] 3134         CALL     INN
      00911A CC 8C 21         [ 2] 3135         JP     PSTOR
                                   3136 
                                   3137 ;       .(      ( -- )
                                   3138 ;       Output following string up to next ) .
      00911D 90 ED                 3139         .word      LINK
                           00109F  3140 LINK = . 
      00911F 82                    3141 	.byte      IMEDD+2
      009120 2E 28                 3142         .ascii     ".("
      009122                       3143 DOTPR:
      009122 CD 84 F3         [ 4] 3144         CALL     DOLIT
      009125 00 29                 3145         .word     41	; ")"
      009127 CD 90 F3         [ 4] 3146         CALL     PARSE
      00912A CC 8F 22         [ 2] 3147         JP     TYPES
                                   3148 
                                   3149 ;       (       ( -- )
                                   3150 ;       Ignore following string up to next ).
                                   3151 ;       A comment.
      00912D 91 1F                 3152         .word      LINK
                           0010AF  3153 LINK = . 
      00912F 81                    3154 	.byte      IMEDD+1
      009130 28                    3155         .ascii     "("
      009131                       3156 PAREN:
      009131 CD 84 F3         [ 4] 3157         CALL     DOLIT
      009134 00 29                 3158         .word     41	; ")"
      009136 CD 90 F3         [ 4] 3159         CALL     PARSE
      009139 CC 88 27         [ 2] 3160         JP     DDROP
                                   3161 
                                   3162 ;       \       ( -- )
                                   3163 ;       Ignore following text till
                                   3164 ;       end of line.
      00913C 91 2F                 3165         .word      LINK
                           0010BE  3166 LINK = . 
      00913E 81                    3167 	.byte      IMEDD+1
      00913F 5C                    3168         .ascii     "\"
      009140                       3169 BKSLA:
      009140 90 AE 00 10      [ 2] 3170         ldw y,#UCTIB ; #TIB  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      009144 90 FE            [ 2] 3171         ldw y,(y)
      009146 90 89            [ 2] 3172         pushw y ; count in TIB 
      009148 90 AE 00 0E      [ 2] 3173         ldw y,#UINN ; >IN 
      00914C 90 BF 28         [ 2] 3174         ldw YTEMP,y
      00914F 90 85            [ 2] 3175         popw y 
      009151 91 CF 28         [ 5] 3176         ldw [YTEMP],y
      009154 81               [ 4] 3177         ret 
                                   3178 
                                   3179 ;       WORD    ( c -- a ; <string> )
                                   3180 ;       Parse a word from input stream
                                   3181 ;       and copy it to code dictionary.
      009155 91 3E                 3182         .word      LINK
                           0010D7  3183 LINK = . 
      009157 04                    3184         .byte      4
      009158 57 4F 52 44           3185         .ascii     "WORD"
      00915C                       3186 WORDD:
      00915C CD 90 F3         [ 4] 3187         CALL     PARSE
      00915F CD 8C 9F         [ 4] 3188         CALL     HERE
      009162 CD 8B 1A         [ 4] 3189         CALL     CELLP
                           000000  3190 .IF CASE_SENSE 
                                   3191         JP      PACKS 
                           000001  3192 .ELSE                 
      009165 CD 8D 5F         [ 4] 3193         CALL     PACKS
                                   3194 ; uppercase TOKEN 
      009168 CD 86 18         [ 4] 3195         CALL    DUPP 
      00916B CD 8C 88         [ 4] 3196         CALL    COUNT 
      00916E CD 85 E1         [ 4] 3197         CALL    TOR 
      009171 CD 85 3D         [ 4] 3198         CALL    BRAN 
      009174 91 A2                 3199         .word   UPPER2  
      009176                       3200 UPPER:
      009176 CD 86 18         [ 4] 3201         CALL    DUPP 
      009179 CD 85 8F         [ 4] 3202         CALL    CAT
      00917C CD 86 18         [ 4] 3203         CALL    DUPP 
      00917F CD 84 F3         [ 4] 3204         CALL   DOLIT
      009182 00 61                 3205         .word   'a' 
      009184 CD 84 F3         [ 4] 3206         CALL    DOLIT
      009187 00 7B                 3207         .word   'z'+1 
      009189 CD 89 A0         [ 4] 3208         CALL   WITHI 
      00918C CD 85 26         [ 4] 3209         CALL   QBRAN
      00918F 91 99                 3210         .word  UPPER1  
      009191 CD 84 F3         [ 4] 3211         CALL    DOLIT 
      009194 00 DF                 3212         .word   0xDF 
      009196 CD 86 77         [ 4] 3213         CALL    ANDD 
      009199                       3214 UPPER1:
      009199 CD 86 42         [ 4] 3215         CALL    OVER 
      00919C CD 85 7E         [ 4] 3216         CALL    CSTOR          
      00919F CD 8B 45         [ 4] 3217         CALL    ONEP 
      0091A2                       3218 UPPER2: 
      0091A2 CD 85 07         [ 4] 3219         CALL    DONXT
      0091A5 91 76                 3220         .word   UPPER  
      0091A7 CD 86 0E         [ 4] 3221         CALL    DROP  
      0091AA 81               [ 4] 3222         RET 
                                   3223 .ENDIF 
                                   3224 
                                   3225 ;       TOKEN   ( -- a ; <string> )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                   3226 ;       Parse a word from input stream
                                   3227 ;       and copy it to name dictionary.
      0091AB 91 57                 3228         .word      LINK
                           00112D  3229 LINK = . 
      0091AD 05                    3230         .byte      5
      0091AE 54 4F 4B 45 4E        3231         .ascii     "TOKEN"
      0091B3                       3232 TOKEN:
      0091B3 CD 8B A4         [ 4] 3233         CALL     BLANK
      0091B6 CC 91 5C         [ 2] 3234         JP     WORDD
                                   3235 
                                   3236 ;; Dictionary search
                                   3237 
                                   3238 ;       NAME>   ( na -- ca )
                                   3239 ;       Return a code address given
                                   3240 ;       a name address.
      0091B9 91 AD                 3241         .word      LINK
                           00113B  3242 LINK = . 
      0091BB 05                    3243         .byte      5
      0091BC 4E 41 4D 45 3E        3244         .ascii     "NAME>"
      0091C1                       3245 NAMET:
      0091C1 CD 8C 88         [ 4] 3246         CALL     COUNT
      0091C4 CD 84 F3         [ 4] 3247         CALL     DOLIT
      0091C7 00 1F                 3248         .word      31
      0091C9 CD 86 77         [ 4] 3249         CALL     ANDD
      0091CC CC 88 47         [ 2] 3250         JP     PLUS
                                   3251 
                                   3252 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   3253 ;       Compare u cells in two
                                   3254 ;       strings. Return 0 if identical.
      0091CF 91 BB                 3255         .word      LINK
                           001151  3256 LINK = . 
      0091D1 05                    3257         .byte       5
      0091D2 53 41 4D 45 3F        3258         .ascii     "SAME?"
      0091D7                       3259 SAMEQ:
      0091D7 CD 8B 52         [ 4] 3260         CALL     ONEM
      0091DA CD 85 E1         [ 4] 3261         CALL     TOR
      0091DD 20 29            [ 2] 3262         JRA     SAME2
      0091DF CD 86 42         [ 4] 3263 SAME1:  CALL     OVER
      0091E2 CD 85 D5         [ 4] 3264         CALL     RAT
      0091E5 CD 88 47         [ 4] 3265         CALL     PLUS
      0091E8 CD 85 8F         [ 4] 3266         CALL     CAT
      0091EB CD 86 42         [ 4] 3267         CALL     OVER
      0091EE CD 85 D5         [ 4] 3268         CALL     RAT
      0091F1 CD 88 47         [ 4] 3269         CALL     PLUS
      0091F4 CD 85 8F         [ 4] 3270         CALL     CAT
      0091F7 CD 88 C0         [ 4] 3271         CALL     SUBB
      0091FA CD 87 D5         [ 4] 3272         CALL     QDUP
      0091FD CD 85 26         [ 4] 3273         CALL     QBRAN
      009200 92 08                 3274         .word      SAME2
      009202 CD 85 C2         [ 4] 3275         CALL     RFROM
      009205 CC 86 0E         [ 2] 3276         JP     DROP
      009208 CD 85 07         [ 4] 3277 SAME2:  CALL     DONXT
      00920B 91 DF                 3278         .word      SAME1
      00920D CC 8B B1         [ 2] 3279         JP     ZERO
                                   3280 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                   3281 ;       find    ( a va -- ca na | a F )
                                   3282 ;       Search vocabulary for string.
                                   3283 ;       Return ca and na if succeeded.
      009210 91 D1                 3284         .word      LINK
                           001192  3285 LINK = . 
      009212 04                    3286         .byte      4
      009213 46 49 4E 44           3287         .ascii     "FIND"
      009217                       3288 FIND:
      009217 CD 86 28         [ 4] 3289         CALL     SWAPP
      00921A CD 86 18         [ 4] 3290         CALL     DUPP
      00921D CD 85 8F         [ 4] 3291         CALL     CAT
      009220 CD 86 F7         [ 4] 3292         CALL     TEMP
      009223 CD 85 5A         [ 4] 3293         CALL     STORE
      009226 CD 86 18         [ 4] 3294         CALL     DUPP
      009229 CD 85 71         [ 4] 3295         CALL     AT
      00922C CD 85 E1         [ 4] 3296         CALL     TOR
      00922F CD 8B 1A         [ 4] 3297         CALL     CELLP
      009232 CD 86 28         [ 4] 3298         CALL     SWAPP
      009235 CD 85 71         [ 4] 3299 FIND1:  CALL     AT
      009238 CD 86 18         [ 4] 3300         CALL     DUPP
      00923B CD 85 26         [ 4] 3301         CALL     QBRAN
      00923E 92 74                 3302         .word      FIND6
      009240 CD 86 18         [ 4] 3303         CALL     DUPP
      009243 CD 85 71         [ 4] 3304         CALL     AT
      009246 CD 84 F3         [ 4] 3305         CALL     DOLIT
      009249 1F 7F                 3306         .word      MASKK
      00924B CD 86 77         [ 4] 3307         CALL     ANDD
      00924E CD 85 D5         [ 4] 3308         CALL     RAT
      009251 CD 86 A0         [ 4] 3309         CALL     XORR
      009254 CD 85 26         [ 4] 3310         CALL     QBRAN
      009257 92 63                 3311         .word      FIND2
      009259 CD 8B 1A         [ 4] 3312         CALL     CELLP
      00925C CD 84 F3         [ 4] 3313         CALL     DOLIT
      00925F FF FF                 3314         .word     0xFFFF
      009261 20 0C            [ 2] 3315         JRA     FIND3
      009263 CD 8B 1A         [ 4] 3316 FIND2:  CALL     CELLP
      009266 CD 86 F7         [ 4] 3317         CALL     TEMP
      009269 CD 85 71         [ 4] 3318         CALL     AT
      00926C CD 91 D7         [ 4] 3319         CALL     SAMEQ
      00926F CD 85 3D         [ 4] 3320 FIND3:  CALL     BRAN
      009272 92 83                 3321         .word      FIND4
      009274 CD 85 C2         [ 4] 3322 FIND6:  CALL     RFROM
      009277 CD 86 0E         [ 4] 3323         CALL     DROP
      00927A CD 86 28         [ 4] 3324         CALL     SWAPP
      00927D CD 8B 29         [ 4] 3325         CALL     CELLM
      009280 CC 86 28         [ 2] 3326         JP     SWAPP
      009283 CD 85 26         [ 4] 3327 FIND4:  CALL     QBRAN
      009286 92 90                 3328         .word      FIND5
      009288 CD 8B 29         [ 4] 3329         CALL     CELLM
      00928B CD 8B 29         [ 4] 3330         CALL     CELLM
      00928E 20 A5            [ 2] 3331         JRA     FIND1
      009290 CD 85 C2         [ 4] 3332 FIND5:  CALL     RFROM
      009293 CD 86 0E         [ 4] 3333         CALL     DROP
      009296 CD 86 28         [ 4] 3334         CALL     SWAPP
      009299 CD 86 0E         [ 4] 3335         CALL     DROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      00929C CD 8B 29         [ 4] 3336         CALL     CELLM
      00929F CD 86 18         [ 4] 3337         CALL     DUPP
      0092A2 CD 91 C1         [ 4] 3338         CALL     NAMET
      0092A5 CC 86 28         [ 2] 3339         JP     SWAPP
                                   3340 
                                   3341 ;       NAME?   ( a -- ca na | a F )
                                   3342 ;       Search vocabularies for a string.
      0092A8 92 12                 3343         .word      LINK
                           00122A  3344 LINK = . 
      0092AA 05                    3345         .byte      5
      0092AB 4E 41 4D 45 3F        3346         .ascii     "NAME?"
      0092B0                       3347 NAMEQ:
      0092B0 CD 87 6B         [ 4] 3348         CALL   CNTXT
      0092B3 CC 92 17         [ 2] 3349         JP     FIND
                                   3350 
                                   3351 ;; Terminal response
                                   3352 
                                   3353 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3354 ;       Backup cursor by one character.
      0092B6 92 AA                 3355         .word      LINK
                           001238  3356 LINK = . 
      0092B8 02                    3357         .byte      2
      0092B9 5E 48                 3358         .ascii     "^H"
      0092BB                       3359 BKSP:
      0092BB CD 85 E1         [ 4] 3360         CALL     TOR
      0092BE CD 86 42         [ 4] 3361         CALL     OVER
      0092C1 CD 85 C2         [ 4] 3362         CALL     RFROM
      0092C4 CD 86 28         [ 4] 3363         CALL     SWAPP
      0092C7 CD 86 42         [ 4] 3364         CALL     OVER
      0092CA CD 86 A0         [ 4] 3365         CALL     XORR
      0092CD CD 85 26         [ 4] 3366         CALL     QBRAN
      0092D0 92 EB                 3367         .word      BACK1
      0092D2 CD 84 F3         [ 4] 3368         CALL     DOLIT
      0092D5 00 08                 3369         .word      BKSPP
      0092D7 CD 84 B8         [ 4] 3370         CALL     EMIT
      0092DA CD 8B 52         [ 4] 3371         CALL     ONEM
      0092DD CD 8B A4         [ 4] 3372         CALL     BLANK
      0092E0 CD 84 B8         [ 4] 3373         CALL     EMIT
      0092E3 CD 84 F3         [ 4] 3374         CALL     DOLIT
      0092E6 00 08                 3375         .word      BKSPP
      0092E8 CC 84 B8         [ 2] 3376         JP     EMIT
      0092EB 81               [ 4] 3377 BACK1:  RET
                                   3378 
                                   3379 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3380 ;       Accept and echo key stroke
                                   3381 ;       and bump cursor.
      0092EC 92 B8                 3382         .word      LINK
                           00126E  3383 LINK = . 
      0092EE 03                    3384         .byte      3
      0092EF 54 41 50              3385         .ascii     "TAP"
      0092F2                       3386 TAP:
      0092F2 CD 86 18         [ 4] 3387         CALL     DUPP
      0092F5 CD 84 B8         [ 4] 3388         CALL     EMIT
      0092F8 CD 86 42         [ 4] 3389         CALL     OVER
      0092FB CD 85 7E         [ 4] 3390         CALL     CSTOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0092FE CC 8B 45         [ 2] 3391         JP     ONEP
                                   3392 
                                   3393 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3394 ;       Process a key stroke,
                                   3395 ;       CR,LF or backspace.
      009301 92 EE                 3396         .word      LINK
                           001283  3397 LINK = . 
      009303 04                    3398         .byte      4
      009304 4B 54 41 50           3399         .ascii     "KTAP"
      009308                       3400 KTAP:
      009308 CD 86 18         [ 4] 3401         CALL     DUPP
      00930B CD 84 F3         [ 4] 3402         CALL     DOLIT
                           000001  3403 .if EOL_CR
      00930E 00 0D                 3404         .word   CRR
                           000000  3405 .else ; EOL_LF 
                                   3406         .word   LF
                                   3407 .endif 
      009310 CD 86 A0         [ 4] 3408         CALL     XORR
      009313 CD 85 26         [ 4] 3409         CALL     QBRAN
      009316 93 2E                 3410         .word      KTAP2
      009318 CD 84 F3         [ 4] 3411         CALL     DOLIT
      00931B 00 08                 3412         .word      BKSPP
      00931D CD 86 A0         [ 4] 3413         CALL     XORR
      009320 CD 85 26         [ 4] 3414         CALL     QBRAN
      009323 93 2B                 3415         .word      KTAP1
      009325 CD 8B A4         [ 4] 3416         CALL     BLANK
      009328 CC 92 F2         [ 2] 3417         JP     TAP
      00932B CC 92 BB         [ 2] 3418 KTAP1:  JP     BKSP
      00932E CD 86 0E         [ 4] 3419 KTAP2:  CALL     DROP
      009331 CD 86 28         [ 4] 3420         CALL     SWAPP
      009334 CD 86 0E         [ 4] 3421         CALL     DROP
      009337 CC 86 18         [ 2] 3422         JP     DUPP
                                   3423 
                                   3424 ;       accept  ( b u -- b u )
                                   3425 ;       Accept characters to input
                                   3426 ;       buffer. Return with actual count.
      00933A 93 03                 3427         .word      LINK
                           0012BC  3428 LINK = . 
      00933C 06                    3429         .byte      6
      00933D 41 43 43 45 50 54     3430         .ascii     "ACCEPT"
      009343                       3431 ACCEP:
      009343 CD 86 42         [ 4] 3432         CALL     OVER
      009346 CD 88 47         [ 4] 3433         CALL     PLUS
      009349 CD 86 42         [ 4] 3434         CALL     OVER
      00934C CD 88 32         [ 4] 3435 ACCP1:  CALL     DDUP
      00934F CD 86 A0         [ 4] 3436         CALL     XORR
      009352 CD 85 26         [ 4] 3437         CALL     QBRAN
      009355 93 77                 3438         .word      ACCP4
      009357 CD 8E C0         [ 4] 3439         CALL     KEY
      00935A CD 86 18         [ 4] 3440         CALL     DUPP
      00935D CD 8B A4         [ 4] 3441         CALL     BLANK
      009360 CD 84 F3         [ 4] 3442         CALL     DOLIT
      009363 00 7F                 3443         .word      127
      009365 CD 89 A0         [ 4] 3444         CALL     WITHI
      009368 CD 85 26         [ 4] 3445         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      00936B 93 72                 3446         .word      ACCP2
      00936D CD 92 F2         [ 4] 3447         CALL     TAP
      009370 20 03            [ 2] 3448         JRA     ACCP3
      009372 CD 93 08         [ 4] 3449 ACCP2:  CALL     KTAP
      009375 20 D5            [ 2] 3450 ACCP3:  JRA     ACCP1
      009377 CD 86 0E         [ 4] 3451 ACCP4:  CALL     DROP
      00937A CD 86 42         [ 4] 3452         CALL     OVER
      00937D CC 88 C0         [ 2] 3453         JP     SUBB
                                   3454 
                                   3455 ;       QUERY   ( -- )
                                   3456 ;       Accept input stream to
                                   3457 ;       terminal input buffer.
      009380 93 3C                 3458         .word      LINK
                                   3459         
                           001302  3460 LINK = . 
      009382 05                    3461         .byte      5
      009383 51 55 45 52 59        3462         .ascii     "QUERY"
      009388                       3463 QUERY:
      009388 CD 8C C1         [ 4] 3464         CALL     TIB
      00938B CD 84 F3         [ 4] 3465         CALL     DOLIT
      00938E 00 50                 3466         .word      80
      009390 CD 93 43         [ 4] 3467         CALL     ACCEP
      009393 CD 87 16         [ 4] 3468         CALL     NTIB
      009396 CD 85 5A         [ 4] 3469         CALL     STORE
      009399 CD 86 0E         [ 4] 3470         CALL     DROP
      00939C CD 8B B1         [ 4] 3471         CALL     ZERO
      00939F CD 87 06         [ 4] 3472         CALL     INN
      0093A2 CC 85 5A         [ 2] 3473         JP     STORE
                                   3474 
                                   3475 ;       ABORT   ( -- )
                                   3476 ;       Reset data stack and
                                   3477 ;       jump to QUIT.
      0093A5 93 82                 3478         .word      LINK
                           001327  3479 LINK = . 
      0093A7 05                    3480         .byte      5
      0093A8 41 42 4F 52 54        3481         .ascii     "ABORT"
      0093AD                       3482 ABORT:
      0093AD CD 94 A4         [ 4] 3483         CALL     PRESE
      0093B0 CC 94 C1         [ 2] 3484         JP     QUIT
                                   3485 
                                   3486 ;       abort"  ( f -- )
                                   3487 ;       Run time routine of ABORT".
                                   3488 ;       Abort with a message.
      0093B3 93 A7                 3489         .word      LINK
                           001335  3490 LINK = . 
      0093B5 46                    3491 	.byte      COMPO+6
      0093B6 41 42 4F 52 54        3492         .ascii     "ABORT"
      0093BB 22                    3493         .byte      '"'
      0093BC                       3494 ABORQ:
      0093BC CD 85 26         [ 4] 3495         CALL     QBRAN
      0093BF 93 DB                 3496         .word      ABOR2   ;text flag
      0093C1 CD 8F 56         [ 4] 3497         CALL     DOSTR
      0093C4 CD 8E F8         [ 4] 3498 ABOR1:  CALL     SPACE
      0093C7 CD 8C 88         [ 4] 3499         CALL     COUNT
      0093CA CD 8F 22         [ 4] 3500         CALL     TYPES
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      0093CD CD 84 F3         [ 4] 3501         CALL     DOLIT
      0093D0 00 3F                 3502         .word     63 ; "?"
      0093D2 CD 84 B8         [ 4] 3503         CALL     EMIT
      0093D5 CD 8F 40         [ 4] 3504         CALL     CR
      0093D8 CC 93 AD         [ 2] 3505         JP     ABORT   ;pass error string
      0093DB CD 8F 56         [ 4] 3506 ABOR2:  CALL     DOSTR
      0093DE CC 86 0E         [ 2] 3507         JP     DROP
                                   3508 
                                   3509 ;; The text interpreter
                                   3510 
                                   3511 ;       $INTERPRET      ( a -- )
                                   3512 ;       Interpret a word. If failed,
                                   3513 ;       try to convert it to an integer.
      0093E1 93 B5                 3514         .word      LINK
                           001363  3515 LINK = . 
      0093E3 0A                    3516         .byte      10
      0093E4 24 49 4E 54 45 52 50  3517         .ascii     "$INTERPRET"
             52 45 54
      0093EE                       3518 INTER:
      0093EE CD 92 B0         [ 4] 3519         CALL     NAMEQ
      0093F1 CD 87 D5         [ 4] 3520         CALL     QDUP    ;?defined
      0093F4 CD 85 26         [ 4] 3521         CALL     QBRAN
      0093F7 94 18                 3522         .word      INTE1
      0093F9 CD 85 71         [ 4] 3523         CALL     AT
      0093FC CD 84 F3         [ 4] 3524         CALL     DOLIT
      0093FF 40 00                 3525 	.word       0x4000	; COMPO*256
      009401 CD 86 77         [ 4] 3526         CALL     ANDD    ;?compile only lexicon bits
      009404 CD 93 BC         [ 4] 3527         CALL     ABORQ
      009407 0D                    3528         .byte      13
      009408 20 63 6F 6D 70 69 6C  3529         .ascii     " compile only"
             65 20 6F 6E 6C 79
      009415 CC 85 4D         [ 2] 3530         JP     EXECU
      009418 CD A4 71         [ 4] 3531 INTE1:  CALL     NUMBQ   ;convert a number
      00941B CD 85 26         [ 4] 3532         CALL     QBRAN
      00941E 93 C4                 3533         .word    ABOR1
      009420 81               [ 4] 3534         RET
                                   3535 
                                   3536 ;       [       ( -- )
                                   3537 ;       Start  text interpreter.
      009421 93 E3                 3538         .word      LINK
                           0013A3  3539 LINK = . 
      009423 81                    3540 	.byte      IMEDD+1
      009424 5B                    3541         .ascii     "["
      009425                       3542 LBRAC:
      009425 CD 84 F3         [ 4] 3543         CALL   DOLIT
      009428 93 EE                 3544         .word  INTER
      00942A CD 87 49         [ 4] 3545         CALL   TEVAL
      00942D CC 85 5A         [ 2] 3546         JP     STORE
                                   3547 
                                   3548 ;       .OK     ( -- )
                                   3549 ;       Display 'ok' while interpreting.
      009430 94 23                 3550         .word      LINK
                           0013B2  3551 LINK = . 
      009432 03                    3552         .byte      3
      009433 2E 4F 4B              3553         .ascii     ".OK"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009436                       3554 DOTOK:
      009436 CD 84 F3         [ 4] 3555         CALL     DOLIT
      009439 93 EE                 3556         .word      INTER
      00943B CD 87 49         [ 4] 3557         CALL     TEVAL
      00943E CD 85 71         [ 4] 3558         CALL     AT
      009441 CD 88 E8         [ 4] 3559         CALL     EQUAL
      009444 CD 85 26         [ 4] 3560         CALL     QBRAN
      009447 94 50                 3561         .word      DOTO1
      009449 CD 8F 7F         [ 4] 3562         CALL     DOTQP
      00944C 03                    3563         .byte      3
      00944D 20 6F 6B              3564         .ascii     " ok"
      009450 CC 8F 40         [ 2] 3565 DOTO1:  JP     CR
                                   3566 
                                   3567 ;       ?STACK  ( -- )
                                   3568 ;       Abort if stack underflows.
      009453 94 32                 3569         .word      LINK
                           0013D5  3570 LINK = . 
      009455 06                    3571         .byte      6
      009456 3F 53 54 41 43 4B     3572         .ascii     "?STACK"
      00945C                       3573 QSTAC: 
      00945C CD 8B F3         [ 4] 3574         CALL     DEPTH
      00945F CD 86 51         [ 4] 3575         CALL     ZLESS   ;check only for underflow
      009462 CD 93 BC         [ 4] 3576         CALL     ABORQ
      009465 0B                    3577         .byte      11
      009466 20 75 6E 64 65 72 66  3578         .ascii     " underflow "
             6C 6F 77 20
      009471 81               [ 4] 3579         RET
                                   3580 
                                   3581 ;       EVAL    ( -- )
                                   3582 ;       Interpret  input stream.
      009472 94 55                 3583         .word      LINK
                           0013F4  3584 LINK = . 
      009474 04                    3585         .byte      4
      009475 45 56 41 4C           3586         .ascii     "EVAL"
      009479                       3587 EVAL:
      009479 CD 91 B3         [ 4] 3588 EVAL1:  CALL     TOKEN
      00947C CD 86 18         [ 4] 3589         CALL     DUPP
      00947F CD 85 8F         [ 4] 3590         CALL     CAT     ;?input stream empty
      009482 CD 85 26         [ 4] 3591         CALL     QBRAN
      009485 94 95                 3592         .word    EVAL2
      009487 CD 87 49         [ 4] 3593         CALL     TEVAL
      00948A CD 8C D5         [ 4] 3594         CALL     ATEXE
      00948D CD 94 5C         [ 4] 3595         CALL     QSTAC   ;evaluate input, check stack
      009490 CD 85 3D         [ 4] 3596         CALL     BRAN
      009493 94 79                 3597         .word    EVAL1
      009495 CD 86 0E         [ 4] 3598 EVAL2:  CALL     DROP
      009498 CC 94 36         [ 2] 3599         JP       DOTOK
                                   3600 
                                   3601 ;       PRESET  ( -- )
                                   3602 ;       Reset data stack pointer and
                                   3603 ;       terminal input buffer.
      00949B 94 74                 3604         .word      LINK
                           00141D  3605 LINK = . 
      00949D 06                    3606         .byte      6
      00949E 50 52 45 53 45 54     3607         .ascii     "PRESET"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0094A4                       3608 PRESE:
      0094A4 CD 84 F3         [ 4] 3609         CALL     DOLIT
      0094A7 16 80                 3610         .word      SPP
      0094A9 CD 86 05         [ 4] 3611         CALL     SPSTO
      0094AC CD 84 F3         [ 4] 3612         CALL     DOLIT
      0094AF 17 00                 3613         .word      TIBB
      0094B1 CD 87 16         [ 4] 3614         CALL     NTIB
      0094B4 CD 8B 1A         [ 4] 3615         CALL     CELLP
      0094B7 CC 85 5A         [ 2] 3616         JP     STORE
                                   3617 
                                   3618 ;       QUIT    ( -- )
                                   3619 ;       Reset return stack pointer
                                   3620 ;       and start text interpreter.
      0094BA 94 9D                 3621         .word      LINK
                           00143C  3622 LINK = . 
      0094BC 04                    3623         .byte      4
      0094BD 51 55 49 54           3624         .ascii     "QUIT"
      0094C1                       3625 QUIT:
      0094C1 CD 84 F3         [ 4] 3626         CALL     DOLIT
      0094C4 17 FF                 3627         .word      RPP
      0094C6 CD 85 AC         [ 4] 3628         CALL     RPSTO   ;reset return stack pointer
      0094C9 CD 94 25         [ 4] 3629 QUIT1:  CALL     LBRAC   ;start interpretation
      0094CC CD 93 88         [ 4] 3630 QUIT2:  CALL     QUERY   ;get input
      0094CF CD 94 79         [ 4] 3631         CALL     EVAL
      0094D2 20 F8            [ 2] 3632         JRA     QUIT2   ;continue till error
                                   3633 
                                   3634 ;; The compiler
                                   3635 
                                   3636 ;       '       ( -- ca )
                                   3637 ;       Search vocabularies for
                                   3638 ;       next word in input stream.
      0094D4 94 BC                 3639         .word      LINK
                           001456  3640 LINK = . 
      0094D6 01                    3641         .byte      1
      0094D7 27                    3642         .ascii     "'"
      0094D8                       3643 TICK:
      0094D8 CD 91 B3         [ 4] 3644         CALL     TOKEN
      0094DB CD 92 B0         [ 4] 3645         CALL     NAMEQ   ;?defined
      0094DE CD 85 26         [ 4] 3646         CALL     QBRAN
      0094E1 93 C4                 3647         .word      ABOR1
      0094E3 81               [ 4] 3648         RET     ;yes, push code address
                                   3649 
                                   3650 ;       ALLOT   ( n -- )
                                   3651 ;       Allocate n bytes to RAM 
      0094E4 94 D6                 3652         .word      LINK
                           001466  3653         LINK = . 
      0094E6 05                    3654         .byte      5
      0094E7 41 4C 4C 4F 54        3655         .ascii     "ALLOT"
      0094EC                       3656 ALLOT:
      0094EC CD 87 79         [ 4] 3657         CALL     VPP
                                   3658 ; must update APP_VP each time VP is modidied
      0094EF CD 8C 21         [ 4] 3659         call PSTOR 
      0094F2 CC 9C 25         [ 2] 3660         jp UPDATVP 
                                   3661 
                                   3662 ;       ,       ( w -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



                                   3663 ;         Compile an integer into
                                   3664 ;         variable space.
      0094F5 94 E6                 3665         .word      LINK
                           001477  3666 LINK = . 
      0094F7 01                    3667         .byte      1
      0094F8 2C                    3668         .ascii     ","
      0094F9                       3669 COMMA:
      0094F9 CD 8C 9F         [ 4] 3670         CALL     HERE
      0094FC CD 86 18         [ 4] 3671         CALL     DUPP
      0094FF CD 8B 1A         [ 4] 3672         CALL     CELLP   ;cell boundary
      009502 CD 87 79         [ 4] 3673         CALL     VPP
      009505 CD 85 5A         [ 4] 3674         CALL     STORE
      009508 CC 85 5A         [ 2] 3675         JP     STORE
                                   3676 
                                   3677 ;       C,      ( c -- )
                                   3678 ;       Compile a byte into
                                   3679 ;       variables space.
      00950B 94 F7                 3680        .word      LINK
                           00148D  3681 LINK = . 
      00950D 02                    3682         .byte      2
      00950E 43 2C                 3683         .ascii     "C,"
      009510                       3684 CCOMMA:
      009510 CD 8C 9F         [ 4] 3685         CALL     HERE
      009513 CD 86 18         [ 4] 3686         CALL     DUPP
      009516 CD 8B 45         [ 4] 3687         CALL     ONEP
      009519 CD 87 79         [ 4] 3688         CALL     VPP
      00951C CD 85 5A         [ 4] 3689         CALL     STORE
      00951F CC 85 7E         [ 2] 3690         JP     CSTOR
                                   3691 
                                   3692 ;       [COMPILE]       ( -- ; <string> )
                                   3693 ;       Compile next immediate
                                   3694 ;       word into code dictionary.
      009522 95 0D                 3695         .word      LINK
                           0014A4  3696 LINK = . 
      009524 89                    3697 	.byte      IMEDD+9
      009525 5B 43 4F 4D 50 49 4C  3698         .ascii     "[COMPILE]"
             45 5D
      00952E                       3699 BCOMP:
      00952E CD 94 D8         [ 4] 3700         CALL     TICK
      009531 CC 97 F4         [ 2] 3701         JP     JSRC
                                   3702 
                                   3703 ;       COMPILE ( -- )
                                   3704 ;       Compile next jsr in
                                   3705 ;       colon list to code dictionary.
      009534 95 24                 3706         .word      LINK
                           0014B6  3707 LINK = . 
      009536 47                    3708 	.byte      COMPO+7
      009537 43 4F 4D 50 49 4C 45  3709         .ascii     "COMPILE"
      00953E                       3710 COMPI:
      00953E CD 85 C2         [ 4] 3711         CALL     RFROM
      009541 CD 86 18         [ 4] 3712         CALL     DUPP
      009544 CD 85 71         [ 4] 3713         CALL     AT
      009547 CD 97 F4         [ 4] 3714         CALL     JSRC    ;compile subroutine
      00954A CD 8B 1A         [ 4] 3715         CALL     CELLP
      00954D 90 93            [ 1] 3716         ldw y,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      00954F 90 FE            [ 2] 3717         ldw y,(y)
      009551 1C 00 02         [ 2] 3718         addw x,#CELLL 
      009554 90 FC            [ 2] 3719         jp (y)
                                   3720 
                                   3721 ;       LITERAL ( w -- )
                                   3722 ;       Compile tos to dictionary
                                   3723 ;       as an integer literal.
      009556 95 36                 3724         .word      LINK
                           0014D8  3725 LINK = . 
      009558 87                    3726 	.byte      IMEDD+7
      009559 4C 49 54 45 52 41 4C  3727         .ascii     "LITERAL"
      009560                       3728 LITER:
      009560 CD 95 3E         [ 4] 3729         CALL     COMPI
      009563 84 F3                 3730         .word DOLIT 
      009565 CC 94 F9         [ 2] 3731         JP     COMMA
                                   3732 
                                   3733 ;       $,"     ( -- )
                                   3734 ;       Compile a literal string
                                   3735 ;       up to next " .
      009568 95 58                 3736         .word      LINK
                           0014EA  3737 LINK = . 
      00956A 03                    3738         .byte      3
      00956B 24 2C 22              3739         .byte     '$',',','"'
      00956E                       3740 STRCQ:
      00956E CD 84 F3         [ 4] 3741         CALL     DOLIT
      009571 00 22                 3742         .word     34	; "
      009573 CD 90 F3         [ 4] 3743         CALL     PARSE
      009576 CD 8C 9F         [ 4] 3744         CALL     HERE
      009579 CD 8D 5F         [ 4] 3745         CALL     PACKS   ;string to code dictionary
      00957C CD 8C 88         [ 4] 3746         CALL     COUNT
      00957F CD 88 47         [ 4] 3747         CALL     PLUS    ;calculate aligned end of string
      009582 CD 87 79         [ 4] 3748         CALL     VPP
      009585 CC 85 5A         [ 2] 3749         JP     STORE
                                   3750 
                                   3751 ;; Structures
                                   3752 
                                   3753 ;       FOR     ( -- a )
                                   3754 ;       Start a FOR-NEXT loop
                                   3755 ;       structure in a colon definition.
      009588 95 6A                 3756         .word      LINK
                           00150A  3757 LINK = . 
      00958A 83                    3758 	.byte      IMEDD+3
      00958B 46 4F 52              3759         .ascii     "FOR"
      00958E                       3760 FOR:
      00958E CD 95 3E         [ 4] 3761         CALL     COMPI
      009591 85 E1                 3762         .word TOR 
      009593 CC 8C 9F         [ 2] 3763         JP     HERE
                                   3764 
                                   3765 ;       NEXT    ( a -- )
                                   3766 ;       Terminate a FOR-NEXT loop.
      009596 95 8A                 3767         .word      LINK
                           001518  3768 LINK = . 
      009598 84                    3769 	.byte      IMEDD+4
      009599 4E 45 58 54           3770         .ascii     "NEXT"
      00959D                       3771 NEXT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      00959D CD 95 3E         [ 4] 3772         CALL     COMPI
      0095A0 85 07                 3773         .word DONXT 
      0095A2 CD 87 C5         [ 4] 3774         call ADRADJ
      0095A5 CC 94 F9         [ 2] 3775         JP     COMMA
                                   3776 
                                   3777 ;       I ( -- n )
                                   3778 ;       stack FOR-NEXT COUNTER 
      0095A8 95 98                 3779         .word LINK 
                           00152A  3780         LINK=.
      0095AA 01                    3781         .byte 1 
      0095AB 49                    3782         .ascii "I"
      0095AC                       3783 IFETCH: 
      0095AC 1D 00 02         [ 2] 3784         subw x,#CELLL 
      0095AF 16 03            [ 2] 3785         ldw y,(3,sp)
      0095B1 FF               [ 2] 3786         ldw (x),y 
      0095B2 81               [ 4] 3787         ret 
                                   3788 
                                   3789 ;       BEGIN   ( -- a )
                                   3790 ;       Start an infinite or
                                   3791 ;       indefinite loop structure.
      0095B3 95 AA                 3792         .word      LINK
                           001535  3793 LINK = . 
      0095B5 85                    3794 	.byte      IMEDD+5
      0095B6 42 45 47 49 4E        3795         .ascii     "BEGIN"
      0095BB                       3796 BEGIN:
      0095BB CC 8C 9F         [ 2] 3797         JP     HERE
                                   3798 
                                   3799 ;       UNTIL   ( a -- )
                                   3800 ;       Terminate a BEGIN-UNTIL
                                   3801 ;       indefinite loop structure.
      0095BE 95 B5                 3802         .word      LINK
                           001540  3803 LINK = . 
      0095C0 85                    3804 	.byte      IMEDD+5
      0095C1 55 4E 54 49 4C        3805         .ascii     "UNTIL"
      0095C6                       3806 UNTIL:
      0095C6 CD 95 3E         [ 4] 3807         CALL     COMPI
      0095C9 85 26                 3808         .word    QBRAN 
      0095CB CD 87 C5         [ 4] 3809         call ADRADJ
      0095CE CC 94 F9         [ 2] 3810         JP     COMMA
                                   3811 
                                   3812 ;       AGAIN   ( a -- )
                                   3813 ;       Terminate a BEGIN-AGAIN
                                   3814 ;       infinite loop structure.
      0095D1 95 C0                 3815         .word      LINK
                           001553  3816 LINK = . 
      0095D3 85                    3817 	.byte      IMEDD+5
      0095D4 41 47 41 49 4E        3818         .ascii     "AGAIN"
      0095D9                       3819 AGAIN:
      0095D9 CD 95 3E         [ 4] 3820         CALL     COMPI
      0095DC 85 3D                 3821         .word BRAN
      0095DE CD 87 C5         [ 4] 3822         call ADRADJ 
      0095E1 CC 94 F9         [ 2] 3823         JP     COMMA
                                   3824 
                                   3825 ;       IF      ( -- A )
                                   3826 ;       Begin a conditional branch.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0095E4 95 D3                 3827         .word      LINK
                           001566  3828 LINK = . 
      0095E6 82                    3829 	.byte      IMEDD+2
      0095E7 49 46                 3830         .ascii     "IF"
      0095E9                       3831 IFF:
      0095E9 CD 95 3E         [ 4] 3832         CALL     COMPI
      0095EC 85 26                 3833         .word QBRAN
      0095EE CD 8C 9F         [ 4] 3834         CALL     HERE
      0095F1 CD 8B B1         [ 4] 3835         CALL     ZERO
      0095F4 CC 94 F9         [ 2] 3836         JP     COMMA
                                   3837 
                                   3838 ;       THEN        ( A -- )
                                   3839 ;       Terminate a conditional branch structure.
      0095F7 95 E6                 3840         .word      LINK
                           001579  3841 LINK = . 
      0095F9 84                    3842 	.byte      IMEDD+4
      0095FA 54 48 45 4E           3843         .ascii     "THEN"
      0095FE                       3844 THENN:
      0095FE CD 8C 9F         [ 4] 3845         CALL     HERE
      009601 CD 87 C5         [ 4] 3846         call ADRADJ 
      009604 CD 86 28         [ 4] 3847         CALL     SWAPP
      009607 CC 85 5A         [ 2] 3848         JP     STORE
                                   3849 
                                   3850 ;       ELSE        ( A -- A )
                                   3851 ;       Start the false clause in an IF-ELSE-THEN structure.
      00960A 95 F9                 3852         .word      LINK
                           00158C  3853 LINK = . 
      00960C 84                    3854 	.byte      IMEDD+4
      00960D 45 4C 53 45           3855         .ascii     "ELSE"
      009611                       3856 ELSEE:
      009611 CD 95 3E         [ 4] 3857         CALL     COMPI
      009614 85 3D                 3858         .word BRAN
      009616 CD 8C 9F         [ 4] 3859         CALL     HERE
      009619 CD 8B B1         [ 4] 3860         CALL     ZERO
      00961C CD 94 F9         [ 4] 3861         CALL     COMMA
      00961F CD 86 28         [ 4] 3862         CALL     SWAPP
      009622 CD 8C 9F         [ 4] 3863         CALL     HERE
      009625 CD 87 C5         [ 4] 3864         call ADRADJ 
      009628 CD 86 28         [ 4] 3865         CALL     SWAPP
      00962B CC 85 5A         [ 2] 3866         JP     STORE
                                   3867 
                                   3868 ;       AHEAD       ( -- A )
                                   3869 ;       Compile a forward branch instruction.
      00962E 96 0C                 3870         .word      LINK
                           0015B0  3871 LINK = . 
      009630 85                    3872 	.byte      IMEDD+5
      009631 41 48 45 41 44        3873         .ascii     "AHEAD"
      009636                       3874 AHEAD:
      009636 CD 95 3E         [ 4] 3875         CALL     COMPI
      009639 85 3D                 3876         .word BRAN
      00963B CD 8C 9F         [ 4] 3877         CALL     HERE
      00963E CD 8B B1         [ 4] 3878         CALL     ZERO
      009641 CC 94 F9         [ 2] 3879         JP     COMMA
                                   3880 
                                   3881 ;       WHILE       ( a -- A a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                   3882 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      009644 96 30                 3883         .word      LINK
                           0015C6  3884 LINK = . 
      009646 85                    3885 	.byte      IMEDD+5
      009647 57 48 49 4C 45        3886         .ascii     "WHILE"
      00964C                       3887 WHILE:
      00964C CD 95 3E         [ 4] 3888         CALL     COMPI
      00964F 85 26                 3889         .word QBRAN
      009651 CD 8C 9F         [ 4] 3890         CALL     HERE
      009654 CD 8B B1         [ 4] 3891         CALL     ZERO
      009657 CD 94 F9         [ 4] 3892         CALL     COMMA
      00965A CC 86 28         [ 2] 3893         JP     SWAPP
                                   3894 
                                   3895 ;       REPEAT      ( A a -- )
                                   3896 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      00965D 96 46                 3897         .word      LINK
                           0015DF  3898 LINK = . 
      00965F 86                    3899         .byte      IMEDD+6
      009660 52 45 50 45 41 54     3900         .ascii     "REPEAT"
      009666                       3901 REPEA:
      009666 CD 95 3E         [ 4] 3902         CALL     COMPI
      009669 85 3D                 3903         .word BRAN
      00966B CD 87 C5         [ 4] 3904         call ADRADJ 
      00966E CD 94 F9         [ 4] 3905         CALL     COMMA
      009671 CD 8C 9F         [ 4] 3906         CALL     HERE
      009674 CD 87 C5         [ 4] 3907         call ADRADJ 
      009677 CD 86 28         [ 4] 3908         CALL     SWAPP
      00967A CC 85 5A         [ 2] 3909         JP     STORE
                                   3910 
                                   3911 ;       AFT         ( a -- a A )
                                   3912 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      00967D 96 5F                 3913         .word      LINK
                           0015FF  3914 LINK = . 
      00967F 83                    3915 	.byte      IMEDD+3
      009680 41 46 54              3916         .ascii     "AFT"
      009683                       3917 AFT:
      009683 CD 86 0E         [ 4] 3918         CALL     DROP
      009686 CD 96 36         [ 4] 3919         CALL     AHEAD
      009689 CD 8C 9F         [ 4] 3920         CALL     HERE
      00968C CC 86 28         [ 2] 3921         JP     SWAPP
                                   3922 
                                   3923 ;       ABORT"      ( -- ; <string> )
                                   3924 ;       Conditional abort with an error message.
      00968F 96 7F                 3925         .word      LINK
                           001611  3926 LINK = . 
      009691 86                    3927 	.byte      IMEDD+6
      009692 41 42 4F 52 54        3928         .ascii     "ABORT"
      009697 22                    3929         .byte      '"'
      009698                       3930 ABRTQ:
      009698 CD 95 3E         [ 4] 3931         CALL     COMPI
      00969B 93 BC                 3932         .word ABORQ
      00969D CC 95 6E         [ 2] 3933         JP     STRCQ
                                   3934 
                                   3935 ;       $"     ( -- ; <string> )
                                   3936 ;       Compile an inline string literal.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0096A0 96 91                 3937         .word      LINK
                           001622  3938 LINK = . 
      0096A2 82                    3939 	.byte      IMEDD+2
      0096A3 24 22                 3940         .byte     '$','"'
      0096A5                       3941 STRQ:
      0096A5 CD 95 3E         [ 4] 3942         CALL     COMPI
      0096A8 8F 75                 3943         .word STRQP 
      0096AA CC 95 6E         [ 2] 3944         JP     STRCQ
                                   3945 
                                   3946 ;       ."          ( -- ; <string> )
                                   3947 ;       Compile an inline string literal to be typed out at run time.
      0096AD 96 A2                 3948         .word      LINK
                           00162F  3949 LINK = . 
      0096AF 82                    3950 	.byte      IMEDD+2
      0096B0 2E 22                 3951         .byte     '.','"'
      0096B2                       3952 DOTQ:
      0096B2 CD 95 3E         [ 4] 3953         CALL     COMPI
      0096B5 8F 7F                 3954         .word DOTQP 
      0096B7 CC 95 6E         [ 2] 3955         JP     STRCQ
                                   3956 
                                   3957 ;; Name compiler
                                   3958 
                                   3959 ;       ?UNIQUE ( a -- a )
                                   3960 ;       Display a warning message
                                   3961 ;       if word already exists.
      0096BA 96 AF                 3962         .word      LINK
                           00163C  3963 LINK = . 
      0096BC 07                    3964         .byte      7
      0096BD 3F 55 4E 49 51 55 45  3965         .ascii     "?UNIQUE"
      0096C4                       3966 UNIQU:
      0096C4 CD 86 18         [ 4] 3967         CALL     DUPP
      0096C7 CD 92 B0         [ 4] 3968         CALL     NAMEQ   ;?name exists
      0096CA CD 85 26         [ 4] 3969         CALL     QBRAN
      0096CD 96 E3                 3970         .word      UNIQ1
      0096CF CD 8F 7F         [ 4] 3971         CALL     DOTQP   ;redef are OK
      0096D2 07                    3972         .byte       7
      0096D3 20 72 65 44 65 66 20  3973         .ascii     " reDef "       
      0096DA CD 86 42         [ 4] 3974         CALL     OVER
      0096DD CD 8C 88         [ 4] 3975         CALL     COUNT
      0096E0 CD 8F 22         [ 4] 3976         CALL     TYPES   ;just in case
      0096E3 CC 86 0E         [ 2] 3977 UNIQ1:  JP     DROP
                                   3978 
                                   3979 ;       $,n     ( na -- )
                                   3980 ;       Build a new dictionary name
                                   3981 ;       using string at na.
                                   3982 ; compile dans l'espace des variables 
      0096E6 96 BC                 3983         .word      LINK
                           001668  3984 LINK = . 
      0096E8 03                    3985         .byte      3
      0096E9 24 2C 6E              3986         .ascii     "$,n"
      0096EC                       3987 SNAME:
      0096EC CD 86 18         [ 4] 3988         CALL     DUPP
      0096EF CD 85 8F         [ 4] 3989         CALL     CAT     ;?null input
      0096F2 CD 85 26         [ 4] 3990         CALL     QBRAN
      0096F5 97 22                 3991         .word      PNAM1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0096F7 CD 96 C4         [ 4] 3992         CALL     UNIQU   ;?redefinition
      0096FA CD 86 18         [ 4] 3993         CALL     DUPP
      0096FD CD 8C 88         [ 4] 3994         CALL     COUNT
      009700 CD 88 47         [ 4] 3995         CALL     PLUS
      009703 CD 87 79         [ 4] 3996         CALL     VPP
      009706 CD 85 5A         [ 4] 3997         CALL     STORE
      009709 CD 86 18         [ 4] 3998         CALL     DUPP
      00970C CD 87 97         [ 4] 3999         CALL     LAST
      00970F CD 85 5A         [ 4] 4000         CALL     STORE   ;save na for vocabulary link
      009712 CD 8B 29         [ 4] 4001         CALL     CELLM   ;link address
      009715 CD 87 6B         [ 4] 4002         CALL     CNTXT
      009718 CD 85 71         [ 4] 4003         CALL     AT
      00971B CD 86 28         [ 4] 4004         CALL     SWAPP
      00971E CD 85 5A         [ 4] 4005         CALL     STORE
      009721 81               [ 4] 4006         RET     ;save code pointer
      009722 CD 8F 75         [ 4] 4007 PNAM1:  CALL     STRQP
      009725 05                    4008         .byte      5
      009726 20 6E 61 6D 65        4009         .ascii     " name" ;null input
      00972B CC 93 C4         [ 2] 4010         JP     ABOR1
                                   4011 
                                   4012 ;; FORTH compiler
                                   4013 
                                   4014 ;       $COMPILE        ( a -- )
                                   4015 ;       Compile next word to
                                   4016 ;       dictionary as a token or literal.
      00972E 96 E8                 4017         .word      LINK
                           0016B0  4018 LINK = . 
      009730 08                    4019         .byte      8
      009731 24 43 4F 4D 50 49 4C  4020         .ascii     "$COMPILE"
             45
      009739                       4021 SCOMP:
      009739 CD 92 B0         [ 4] 4022         CALL     NAMEQ
      00973C CD 87 D5         [ 4] 4023         CALL     QDUP    ;?defined
      00973F CD 85 26         [ 4] 4024         CALL     QBRAN
      009742 97 5A                 4025         .word      SCOM2
      009744 CD 85 71         [ 4] 4026         CALL     AT
      009747 CD 84 F3         [ 4] 4027         CALL     DOLIT
      00974A 80 00                 4028         .word     0x8000	;  IMEDD*256
      00974C CD 86 77         [ 4] 4029         CALL     ANDD    ;?immediate
      00974F CD 85 26         [ 4] 4030         CALL     QBRAN
      009752 97 57                 4031         .word      SCOM1
      009754 CC 85 4D         [ 2] 4032         JP     EXECU
      009757 CC 97 F4         [ 2] 4033 SCOM1:  JP     JSRC
      00975A CD A4 71         [ 4] 4034 SCOM2:  CALL     NUMBQ   ;try to convert to number
      00975D CD 85 26         [ 4] 4035         CALL     QBRAN
      009760 93 C4                 4036         .word      ABOR1
      009762 CC 95 60         [ 2] 4037         JP     LITER
                                   4038 
                                   4039 ;       OVERT   ( -- )
                                   4040 ;       Link a new word into vocabulary.
      009765 97 30                 4041         .word      LINK
                           0016E7  4042 LINK = . 
      009767 05                    4043         .byte      5
      009768 4F 56 45 52 54        4044         .ascii     "OVERT"
      00976D                       4045 OVERT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      00976D CD 87 97         [ 4] 4046         CALL     LAST
      009770 CD 85 71         [ 4] 4047         CALL     AT
      009773 CD 87 6B         [ 4] 4048         CALL     CNTXT
      009776 CC 85 5A         [ 2] 4049         JP     STORE
                                   4050 
                                   4051 ;       ;       ( -- )
                                   4052 ;       Terminate a colon definition.
      009779 97 67                 4053         .word      LINK
                           0016FB  4054 LINK = . 
      00977B C1                    4055 	.byte      IMEDD+COMPO+1
      00977C 3B                    4056         .ascii     ";"
      00977D                       4057 SEMIS:
                           000001  4058 .if OPTIMIZE ; more compact and faster
      00977D CD 84 F3         [ 4] 4059         call DOLIT 
      009780 00 81                 4060         .word 0x81   ; opcode for RET 
      009782 CD 95 10         [ 4] 4061         call CCOMMA 
                           000000  4062 .else
                                   4063         CALL     COMPI
                                   4064         .word EXIT 
                                   4065 .endif 
      009785 CD 94 25         [ 4] 4066         CALL     LBRAC
      009788 CD 97 6D         [ 4] 4067         call OVERT 
      00978B CD A1 7D         [ 4] 4068         CALL FMOVE
      00978E CD 87 D5         [ 4] 4069         call QDUP 
      009791 CD 85 26         [ 4] 4070         call QBRAN 
      009794 98 C4                 4071         .word SET_RAMLAST 
      009796 CD A2 11         [ 4] 4072         CALL UPDATPTR
      009799 81               [ 4] 4073         RET 
                                   4074 
                                   4075 
                                   4076 ;       Terminate an ISR definition 
                                   4077 ;       retourn ca of ISR as double
                                   4078 ;       I; ( -- ud )
      00979A 97 7B                 4079         .word LINK 
                           00171C  4080         LINK=.
      00979C C2                    4081         .byte 2+IMEDD+COMPO 
      00979D 49 3B                 4082         .ascii "I;" 
      00979F                       4083 ISEMI:
      00979F 1D 00 02         [ 2] 4084         subw x,#CELLL  
      0097A2 90 AE 00 80      [ 2] 4085         ldw y,#IRET_CODE 
      0097A6 FF               [ 2] 4086         ldw (x),y 
      0097A7 CD 95 10         [ 4] 4087         call CCOMMA
      0097AA CD 94 25         [ 4] 4088         call LBRAC 
      0097AD CD A2 56         [ 4] 4089         call IFMOVE
      0097B0 CD 87 D5         [ 4] 4090         call QDUP 
      0097B3 CD 85 26         [ 4] 4091         CALL QBRAN 
      0097B6 98 C4                 4092         .word SET_RAMLAST
      0097B8 CD 87 87         [ 4] 4093         CALL CPP
      0097BB CD 85 71         [ 4] 4094         call AT 
      0097BE CD 86 28         [ 4] 4095         call SWAPP 
      0097C1 CD 87 87         [ 4] 4096         CALL CPP 
      0097C4 CD 85 5A         [ 4] 4097         call STORE 
      0097C7 CD 9C 0E         [ 4] 4098         call UPDATCP 
      0097CA CD 9B CB         [ 4] 4099         call EEPVP 
      0097CD CD 86 0E         [ 4] 4100         call DROP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      0097D0 CD 85 71         [ 4] 4101         call AT 
      0097D3 CD 87 79         [ 4] 4102         call VPP 
      0097D6 CD 85 5A         [ 4] 4103         call STORE 
      0097D9 CC 8B B1         [ 2] 4104         jp ZERO
      0097DC 81               [ 4] 4105         ret           
                                   4106         
                                   4107 
                                   4108 ;       ]       ( -- )
                                   4109 ;       Start compiling words in
                                   4110 ;       input stream.
      0097DD 97 9C                 4111         .word      LINK
                           00175F  4112 LINK = . 
      0097DF 01                    4113         .byte      1
      0097E0 5D                    4114         .ascii     "]"
      0097E1                       4115 RBRAC:
      0097E1 CD 84 F3         [ 4] 4116         CALL   DOLIT
      0097E4 97 39                 4117         .word  SCOMP
      0097E6 CD 87 49         [ 4] 4118         CALL   TEVAL
      0097E9 CC 85 5A         [ 2] 4119         JP     STORE
                                   4120 
                                   4121 ;       CALL,    ( ca -- )
                                   4122 ;       Compile a subroutine call.
      0097EC 97 DF                 4123         .word      LINK
                           00176E  4124 LINK = . 
      0097EE 05                    4125         .byte      5
      0097EF 43 41 4C 4C 2C        4126         .ascii     "CALL,"
      0097F4                       4127 JSRC:
      0097F4 CD 84 F3         [ 4] 4128         CALL     DOLIT
      0097F7 00 CD                 4129         .word     CALLL     ;CALL
      0097F9 CD 95 10         [ 4] 4130         CALL     CCOMMA
      0097FC CC 94 F9         [ 2] 4131         JP     COMMA
                                   4132 
                                   4133 ;       INIT-OFS ( -- )
                                   4134 ;       compute offset to adjust jump address 
                                   4135 ;       set variable OFFSET 
      0097FF 97 EE                 4136         .word LINK 
                           001781  4137         LINK=.
      009801 08                    4138         .byte 8 
      009802 49 4E 49 54 2D 4F 46  4139         .ascii "INIT-OFS" 
             53
      00980A                       4140 INITOFS:
      00980A CD 87 38         [ 4] 4141         call TFLASH 
      00980D CD 85 71         [ 4] 4142         CALL AT 
      009810 CD 86 18         [ 4] 4143         CALL DUPP 
      009813 CD 85 26         [ 4] 4144         call QBRAN
      009816 98 27                 4145         .word 1$
      009818 CD 86 0E         [ 4] 4146         call DROP  
      00981B CD 87 87         [ 4] 4147         call CPP 
      00981E CD 85 71         [ 4] 4148         call AT 
      009821 CD 8C 9F         [ 4] 4149         call HERE
      009824 CD 88 C0         [ 4] 4150         call SUBB 
      009827 CD 87 BC         [ 4] 4151 1$:     call OFFSET 
      00982A CC 85 5A         [ 2] 4152         jp STORE  
                                   4153 
                                   4154 ;       :       ( -- ; <string> )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   4155 ;       Start a new colon definition
                                   4156 ;       using next word as its name.
      00982D 98 01                 4157         .word      LINK
                           0017AF  4158 LINK = . 
      00982F 01                    4159         .byte      1
      009830 3A                    4160         .ascii     ":"
      009831                       4161 COLON:
      009831 CD 98 0A         [ 4] 4162         call INITOFS       
      009834 CD 91 B3         [ 4] 4163         CALL   TOKEN
      009837 CD 96 EC         [ 4] 4164         CALL   SNAME
      00983A CC 97 E1         [ 2] 4165         JP     RBRAC
                                   4166 
                                   4167 ;       I:  ( -- )
                                   4168 ;       Start interrupt service routine definition
                                   4169 ;       those definition have no name.
      00983D 98 2F                 4170         .word LINK
                           0017BF  4171         LINK=.
      00983F 02                    4172         .byte 2 
      009840 49 3A                 4173         .ascii "I:" 
      009842                       4174 ICOLON:
      009842 CD 98 0A         [ 4] 4175         call INITOFS 
      009845 CC 97 E1         [ 2] 4176         jp RBRAC  
                                   4177 
                                   4178 ;       IMMEDIATE       ( -- )
                                   4179 ;       Make last compiled word
                                   4180 ;       an immediate word.
      009848 98 3F                 4181         .word      LINK
                           0017CA  4182 LINK = . 
      00984A 09                    4183         .byte      9
      00984B 49 4D 4D 45 44 49 41  4184         .ascii     "IMMEDIATE"
             54 45
      009854                       4185 IMMED:
      009854 CD 84 F3         [ 4] 4186         CALL     DOLIT
      009857 80 00                 4187         .word     0x8000	;  IMEDD*256
      009859 CD 87 97         [ 4] 4188         CALL     LAST
      00985C CD 85 71         [ 4] 4189         CALL     AT
      00985F CD 85 71         [ 4] 4190         CALL     AT
      009862 CD 86 8B         [ 4] 4191         CALL     ORR
      009865 CD 87 97         [ 4] 4192         CALL     LAST
      009868 CD 85 71         [ 4] 4193         CALL     AT
      00986B CC 85 5A         [ 2] 4194         JP     STORE
                                   4195 
                                   4196 ;; Defining words
                                   4197 
                                   4198 ;       CREATE  ( -- ; <string> )
                                   4199 ;       Compile a new array
                                   4200 ;       without allocating space.
      00986E 98 4A                 4201         .word      LINK
                           0017F0  4202 LINK = . 
      009870 06                    4203         .byte      6
      009871 43 52 45 41 54 45     4204         .ascii     "CREATE"
      009877                       4205 CREAT:
      009877 CD 91 B3         [ 4] 4206         CALL     TOKEN
      00987A CD 96 EC         [ 4] 4207         CALL     SNAME
      00987D CD 97 6D         [ 4] 4208         CALL     OVERT        
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      009880 CD 95 3E         [ 4] 4209         CALL     COMPI 
      009883 86 D8                 4210         .word DOVAR 
      009885 81               [ 4] 4211         RET
                                   4212 
                                   4213 ;       VARIABLE        ( -- ; <string> )
                                   4214 ;       Compile a new variable
                                   4215 ;       initialized to 0.
      009886 98 70                 4216         .word      LINK
                           001808  4217 LINK = . 
      009888 08                    4218         .byte      8
      009889 56 41 52 49 41 42 4C  4219         .ascii     "VARIABLE"
             45
      009891                       4220 VARIA:
                                   4221 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      009891 CD 8C 9F         [ 4] 4222         CALL HERE
      009894 CD 86 18         [ 4] 4223         CALL DUPP 
      009897 CD 8B 1A         [ 4] 4224         CALL CELLP
      00989A CD 87 79         [ 4] 4225         CALL VPP 
      00989D CD 85 5A         [ 4] 4226         CALL STORE
      0098A0 CD 98 77         [ 4] 4227         CALL CREAT
      0098A3 CD 86 18         [ 4] 4228         CALL DUPP
      0098A6 CD 94 F9         [ 4] 4229         CALL COMMA
      0098A9 CD 8B B1         [ 4] 4230         CALL ZERO
      0098AC CD 86 28         [ 4] 4231         call SWAPP 
      0098AF CD 85 5A         [ 4] 4232         CALL STORE
      0098B2 CD A1 7D         [ 4] 4233         CALL FMOVE ; move definition to FLASH
      0098B5 CD 87 D5         [ 4] 4234         CALL QDUP 
      0098B8 CD 85 26         [ 4] 4235         CALL QBRAN 
      0098BB 98 C4                 4236         .word SET_RAMLAST   
      0098BD CD 9C 25         [ 4] 4237         call UPDATVP  ; don't update if variable kept in RAM.
      0098C0 CD A2 11         [ 4] 4238         CALL UPDATPTR
      0098C3 81               [ 4] 4239         RET         
      0098C4                       4240 SET_RAMLAST: 
      0098C4 CD 87 97         [ 4] 4241         CALL LAST 
      0098C7 CD 85 71         [ 4] 4242         CALL AT 
      0098CA CD 87 AA         [ 4] 4243         CALL RAMLAST 
      0098CD CC 85 5A         [ 2] 4244         jp STORE  
                                   4245 
                                   4246 
                                   4247 ;       CONSTANT  ( n -- ; <string> )
                                   4248 ;       Compile a new constant 
                                   4249 ;       n CONSTANT name 
      0098D0 98 88                 4250         .word LINK 
                           001852  4251         LINK=. 
      0098D2 08                    4252         .byte 8 
      0098D3 43 4F 4E 53 54 41 4E  4253         .ascii "CONSTANT" 
             54
      0098DB                       4254 CONSTANT:          
      0098DB CD 91 B3         [ 4] 4255         CALL TOKEN
      0098DE CD 96 EC         [ 4] 4256         CALL SNAME 
      0098E1 CD 97 6D         [ 4] 4257         CALL OVERT 
      0098E4 CD 95 3E         [ 4] 4258         CALL COMPI 
      0098E7 98 FB                 4259         .word DOCONST
      0098E9 CD 94 F9         [ 4] 4260         CALL COMMA 
      0098EC CD A1 7D         [ 4] 4261         CALL FMOVE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0098EF CD 87 D5         [ 4] 4262         CALL QDUP 
      0098F2 CD 85 26         [ 4] 4263         CALL QBRAN 
      0098F5 98 C4                 4264         .word SET_RAMLAST  
      0098F7 CD A2 11         [ 4] 4265         CALL UPDATPTR  
      0098FA 81               [ 4] 4266 1$:     RET          
                                   4267 
                                   4268 ; CONSTANT runtime semantic 
                                   4269 ; doCONST  ( -- n )
                                   4270 ;        .word LINK 
                                   4271 ;        LINK=.
                                   4272 ;        .byte 7
                                   4273 ;        .ascii "DOCONST"
      0098FB                       4274 DOCONST:
      0098FB 1D 00 02         [ 2] 4275         subw x,#CELLL
      0098FE 90 85            [ 2] 4276         popw y 
      009900 90 FE            [ 2] 4277         ldw y,(y) 
      009902 FF               [ 2] 4278         ldw (x),y 
      009903 81               [ 4] 4279         ret 
                                   4280 
                                   4281 ;----------------------------------
                                   4282 ; create double constant 
                                   4283 ; 2CONSTANT ( d -- ; <string> )
                                   4284 ;----------------------------------
      009904 98 D2                 4285     .word LINK 
                           001886  4286     LINK=.
      009906 09                    4287     .byte 9 
      009907 32 43 4F 4E 53 54 41  4288     .ascii "2CONSTANT"
             4E 54
      009910                       4289 DCONST:
      009910 CD 91 B3         [ 4] 4290         CALL TOKEN
      009913 CD 96 EC         [ 4] 4291         CALL SNAME 
      009916 CD 97 6D         [ 4] 4292         CALL OVERT 
      009919 CD 95 3E         [ 4] 4293         CALL COMPI 
      00991C 99 33                 4294         .word DO_DCONST
      00991E CD 94 F9         [ 4] 4295         CALL COMMA
      009921 CD 94 F9         [ 4] 4296         CALL COMMA  
      009924 CD A1 7D         [ 4] 4297         CALL FMOVE
      009927 CD 87 D5         [ 4] 4298         CALL QDUP 
      00992A CD 85 26         [ 4] 4299         CALL QBRAN 
      00992D 98 C4                 4300         .word SET_RAMLAST  
      00992F CD A2 11         [ 4] 4301         CALL UPDATPTR  
      009932 81               [ 4] 4302 1$:     RET          
                                   4303     
                                   4304 ;----------------------------------
                                   4305 ; runtime for DCONST 
                                   4306 ; stack double constant 
                                   4307 ; DO-DCONST ( -- d )
                                   4308 ;-----------------------------------
                                   4309 ;        .word LINK 
                                   4310 ;        LINK=.
                                   4311 ;        .byte 9 
                                   4312 ;        .ascii "DO-DCONST"
      009933                       4313 DO_DCONST:
      009933 90 85            [ 2] 4314     popw y 
      009935 90 BF 28         [ 2] 4315     ldw YTEMP,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      009938 1D 00 04         [ 2] 4316     subw x,#2*CELLL 
      00993B 90 FE            [ 2] 4317     ldw y,(y)
      00993D FF               [ 2] 4318     ldw (x),y 
      00993E 90 BE 28         [ 2] 4319     ldw y,YTEMP 
      009941 90 EE 02         [ 2] 4320     ldw y,(2,y)
      009944 EF 02            [ 2] 4321     ldw (2,x),y 
      009946 81               [ 4] 4322     ret 
                                   4323 
                                   4324 ;; Tools
                                   4325 
                                   4326 ;       _TYPE   ( b u -- )
                                   4327 ;       Display a string. Filter
                                   4328 ;       non-printing characters.
      009947 99 06                 4329         .word      LINK
                           0018C9  4330 LINK = . 
      009949 05                    4331         .byte      5
      00994A 5F 54 59 50 45        4332         .ascii     "_TYPE"
      00994F                       4333 UTYPE:
      00994F CD 85 E1         [ 4] 4334         CALL     TOR     ;start count down loop
      009952 20 0F            [ 2] 4335         JRA     UTYP2   ;skip first pass
      009954 CD 86 18         [ 4] 4336 UTYP1:  CALL     DUPP
      009957 CD 85 8F         [ 4] 4337         CALL     CAT
      00995A CD 8B DB         [ 4] 4338         CALL     TCHAR
      00995D CD 84 B8         [ 4] 4339         CALL     EMIT    ;display only printable
      009960 CD 8B 45         [ 4] 4340         CALL     ONEP    ;increment address
      009963 CD 85 07         [ 4] 4341 UTYP2:  CALL     DONXT
      009966 99 54                 4342         .word      UTYP1   ;loop till done
      009968 CC 86 0E         [ 2] 4343         JP     DROP
                                   4344 
                                   4345 ;       dm+     ( a u -- a )
                                   4346 ;       Dump u bytes from ,
                                   4347 ;       leaving a+u on  stack.
      00996B 99 49                 4348         .word      LINK
                           0018ED  4349 LINK = . 
      00996D 03                    4350         .byte      3
      00996E 64 6D 2B              4351         .ascii     "dm+"
      009971                       4352 DUMPP:
      009971 CD 86 42         [ 4] 4353         CALL     OVER
      009974 CD 84 F3         [ 4] 4354         CALL     DOLIT
      009977 00 04                 4355         .word      4
      009979 CD 8F A8         [ 4] 4356         CALL     UDOTR   ;display address
      00997C CD 8E F8         [ 4] 4357         CALL     SPACE
      00997F CD 85 E1         [ 4] 4358         CALL     TOR     ;start count down loop
      009982 20 11            [ 2] 4359         JRA     PDUM2   ;skip first pass
      009984 CD 86 18         [ 4] 4360 PDUM1:  CALL     DUPP
      009987 CD 85 8F         [ 4] 4361         CALL     CAT
      00998A CD 84 F3         [ 4] 4362         CALL     DOLIT
      00998D 00 03                 4363         .word      3
      00998F CD 8F A8         [ 4] 4364         CALL     UDOTR   ;display numeric data
      009992 CD 8B 45         [ 4] 4365         CALL     ONEP    ;increment address
      009995 CD 85 07         [ 4] 4366 PDUM2:  CALL     DONXT
      009998 99 84                 4367         .word      PDUM1   ;loop till done
      00999A 81               [ 4] 4368         RET
                                   4369 
                                   4370 ;       DUMP    ( a u -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                   4371 ;       Dump u bytes from a,
                                   4372 ;       in a formatted manner.
      00999B 99 6D                 4373         .word      LINK
                           00191D  4374 LINK = . 
      00999D 04                    4375         .byte      4
      00999E 44 55 4D 50           4376         .ascii     "DUMP"
      0099A2                       4377 DUMP:
      0099A2 CD 86 E8         [ 4] 4378         CALL     BASE
      0099A5 CD 85 71         [ 4] 4379         CALL     AT
      0099A8 CD 85 E1         [ 4] 4380         CALL     TOR
      0099AB CD 8E 57         [ 4] 4381         CALL     HEX     ;save radix, set hex
      0099AE CD 84 F3         [ 4] 4382         CALL     DOLIT
      0099B1 00 10                 4383         .word      16
      0099B3 CD 8A 6B         [ 4] 4384         CALL     SLASH   ;change count to lines
      0099B6 CD 85 E1         [ 4] 4385         CALL     TOR     ;start count down loop
      0099B9 CD 8F 40         [ 4] 4386 DUMP1:  CALL     CR
      0099BC CD 84 F3         [ 4] 4387         CALL     DOLIT
      0099BF 00 10                 4388         .word      16
      0099C1 CD 88 32         [ 4] 4389         CALL     DDUP
      0099C4 CD 99 71         [ 4] 4390         CALL     DUMPP   ;display numeric
      0099C7 CD 87 E6         [ 4] 4391         CALL     ROT
      0099CA CD 87 E6         [ 4] 4392         CALL     ROT
      0099CD CD 8E F8         [ 4] 4393         CALL     SPACE
      0099D0 CD 8E F8         [ 4] 4394         CALL     SPACE
      0099D3 CD 99 4F         [ 4] 4395         CALL     UTYPE   ;display printable characters
      0099D6 CD 85 07         [ 4] 4396         CALL     DONXT
      0099D9 99 B9                 4397         .word      DUMP1   ;loop till done
      0099DB CD 86 0E         [ 4] 4398 DUMP3:  CALL     DROP
      0099DE CD 85 C2         [ 4] 4399         CALL     RFROM
      0099E1 CD 86 E8         [ 4] 4400         CALL     BASE
      0099E4 CC 85 5A         [ 2] 4401         JP     STORE   ;restore radix
                                   4402 
                                   4403 ;       .S      ( ... -- ... )
                                   4404 ;        Display  contents of stack.
      0099E7 99 9D                 4405         .word      LINK
                           001969  4406 LINK = . 
      0099E9 02                    4407         .byte      2
      0099EA 2E 53                 4408         .ascii     ".S"
      0099EC                       4409 DOTS:
      0099EC CD 8F 40         [ 4] 4410         CALL     CR
      0099EF CD 8B F3         [ 4] 4411         CALL     DEPTH   ;stack depth
      0099F2 CD 85 E1         [ 4] 4412         CALL     TOR     ;start count down loop
      0099F5 20 09            [ 2] 4413         JRA     DOTS2   ;skip first pass
      0099F7 CD 85 D5         [ 4] 4414 DOTS1:  CALL     RAT
      0099FA CD 8C 0A         [ 4] 4415 	CALL     PICK
      0099FD CD 8F F9         [ 4] 4416         CALL     DOT     ;index stack, display contents
      009A00 CD 85 07         [ 4] 4417 DOTS2:  CALL     DONXT
      009A03 99 F7                 4418         .word      DOTS1   ;loop till done
      009A05 CD 8F 7F         [ 4] 4419         CALL     DOTQP
      009A08 05                    4420         .byte      5
      009A09 20 3C 73 70 20        4421         .ascii     " <sp "
      009A0E 81               [ 4] 4422         RET
                                   4423 
                                   4424 ;       >NAME   ( ca -- na | F )
                                   4425 ;       Convert code address
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                   4426 ;       to a name address.
      009A0F 99 E9                 4427         .word      LINK
                           001991  4428 LINK = . 
      009A11 05                    4429         .byte      5
      009A12 3E 4E 41 4D 45        4430         .ascii     ">NAME"
      009A17                       4431 TNAME:
      009A17 CD 87 6B         [ 4] 4432         CALL     CNTXT   ;vocabulary link
      009A1A CD 85 71         [ 4] 4433 TNAM2:  CALL     AT
      009A1D CD 86 18         [ 4] 4434         CALL     DUPP    ;?last word in a vocabulary
      009A20 CD 85 26         [ 4] 4435         CALL     QBRAN
      009A23 9A 3E                 4436         .word      TNAM4
      009A25 CD 88 32         [ 4] 4437         CALL     DDUP
      009A28 CD 91 C1         [ 4] 4438         CALL     NAMET
      009A2B CD 86 A0         [ 4] 4439         CALL     XORR    ;compare
      009A2E CD 85 26         [ 4] 4440         CALL     QBRAN
      009A31 9A 38                 4441         .word      TNAM3
      009A33 CD 8B 29         [ 4] 4442         CALL     CELLM   ;continue with next word
      009A36 20 E2            [ 2] 4443         JRA     TNAM2
      009A38 CD 86 28         [ 4] 4444 TNAM3:  CALL     SWAPP
      009A3B CC 86 0E         [ 2] 4445         JP     DROP
      009A3E CD 88 27         [ 4] 4446 TNAM4:  CALL     DDROP
      009A41 CC 8B B1         [ 2] 4447         JP     ZERO
                                   4448 
                                   4449 ;       .ID     ( na -- )
                                   4450 ;        Display  name at address.
      009A44 9A 11                 4451         .word      LINK
                           0019C6  4452 LINK = . 
      009A46 03                    4453         .byte      3
      009A47 2E 49 44              4454         .ascii     ".ID"
      009A4A                       4455 DOTID:
      009A4A CD 87 D5         [ 4] 4456         CALL     QDUP    ;if zero no name
      009A4D CD 85 26         [ 4] 4457         CALL     QBRAN
      009A50 9A 60                 4458         .word      DOTI1
      009A52 CD 8C 88         [ 4] 4459         CALL     COUNT
      009A55 CD 84 F3         [ 4] 4460         CALL     DOLIT
      009A58 00 1F                 4461         .word      0x1F
      009A5A CD 86 77         [ 4] 4462         CALL     ANDD    ;mask lexicon bits
      009A5D CC 99 4F         [ 2] 4463         JP     UTYPE
      009A60 CD 8F 7F         [ 4] 4464 DOTI1:  CALL     DOTQP
      009A63 09                    4465         .byte      9
      009A64 20 6E 6F 4E 61 6D 65  4466         .ascii     " noName"
      009A6B 81               [ 4] 4467         RET
                                   4468 
                           000000  4469 WANT_SEE=0
                           000000  4470 .if WANT_SEE 
                                   4471 ;       SEE     ( -- ; <string> )
                                   4472 ;       A simple decompiler.
                                   4473 ;       Updated for byte machines.
                                   4474         .word      LINK
                                   4475 LINK = . 
                                   4476         .byte      3
                                   4477         .ascii     "SEE"
                                   4478 SEE:
                                   4479         CALL     TICK    ;starting address
                                   4480         CALL     CR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   4481         CALL     ONEM
                                   4482 SEE1:   CALL     ONEP
                                   4483         CALL     DUPP
                                   4484         CALL     AT
                                   4485         CALL     DUPP
                                   4486         CALL     QBRAN
                                   4487         .word    SEE2
                                   4488         CALL     TNAME   ;?is it a name
                                   4489 SEE2:   CALL     QDUP    ;name address or zero
                                   4490         CALL     QBRAN
                                   4491         .word    SEE3
                                   4492         CALL     SPACE
                                   4493         CALL     DOTID   ;display name
                                   4494         CALL     ONEP
                                   4495         JRA      SEE4
                                   4496 SEE3:   CALL     DUPP
                                   4497         CALL     CAT
                                   4498         CALL     UDOT    ;display number
                                   4499 SEE4:   CALL     NUFQ    ;user control
                                   4500         CALL     QBRAN
                                   4501         .word    SEE1
                                   4502         JP     DROP
                                   4503 .endif ; WANT_SEE 
                                   4504 
                                   4505 ;       WORDS   ( -- )
                                   4506 ;       Display names in vocabulary.
      009A6C 9A 46                 4507         .word      LINK
                           0019EE  4508 LINK = . 
      009A6E 05                    4509         .byte      5
      009A6F 57 4F 52 44 53        4510         .ascii     "WORDS"
      009A74                       4511 WORDS:
      009A74 CD 8F 40         [ 4] 4512         CALL     CR
      009A77 CD 87 6B         [ 4] 4513         CALL     CNTXT   ;only in context
      009A7A CD 85 71         [ 4] 4514 WORS1:  CALL     AT
      009A7D CD 87 D5         [ 4] 4515         CALL     QDUP    ;?at end of list
      009A80 CD 85 26         [ 4] 4516         CALL     QBRAN
      009A83 9A 96                 4517         .word      WORS2
      009A85 CD 86 18         [ 4] 4518         CALL     DUPP
      009A88 CD 8E F8         [ 4] 4519         CALL     SPACE
      009A8B CD 9A 4A         [ 4] 4520         CALL     DOTID   ;display a name
      009A8E CD 8B 29         [ 4] 4521         CALL     CELLM
      009A91 CD 85 3D         [ 4] 4522         CALL     BRAN
      009A94 9A 7A                 4523         .word      WORS1
      009A96 81               [ 4] 4524 WORS2:  RET
                                   4525 
                                   4526         
                                   4527 ;; Hardware reset
                                   4528 
                                   4529 ;       hi      ( -- )
                                   4530 ;       Display sign-on message.
      009A97 9A 6E                 4531         .word      LINK
                           001A19  4532 LINK = . 
      009A99 02                    4533         .byte      2
      009A9A 68 69                 4534         .ascii     "hi"
      009A9C                       4535 HI:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      009A9C CD 8F 40         [ 4] 4536         CALL     CR
      009A9F CD 8F 7F         [ 4] 4537         CALL     DOTQP   ;initialize I/O
      009AA2 0F                    4538         .byte      15
      009AA3 73 74 6D 38 65 46 6F  4539         .ascii     "stm8eForth v"
             72 74 68 20 76
      009AAF 33                    4540 	.byte      VER+'0'
      009AB0 2E                    4541         .byte      '.' 
      009AB1 30                    4542 	.byte      EXT+'0' ;version
      009AB2 CD 8F 7F         [ 4] 4543         CALL    DOTQP
                           000001  4544 .if NUCLEO          
      009AB5 12                    4545         .byte 18
      009AB6 20 6F 6E 20 4E 55 43  4546         .ascii  " on NUCLEO-8S208RB"
             4C 45 4F 2D 38 53 32
             30 38 52 42
                                   4547 .endif
                           000000  4548 .if DISCOVERY
                                   4549         .byte 19
                                   4550         .ascii  " on STM8S-DISCOVERY"
                                   4551 .endif
                           000000  4552 .if DOORBELL
                                   4553         .byte 16
                                   4554         .ascii " on stm8s105k6b6"
                                   4555 .endif
      009AC8 CC 8F 40         [ 2] 4556         JP     CR
                                   4557 
                           000000  4558 WANT_DEBUG=0
                           000000  4559 .if WANT_DEBUG 
                                   4560 ;       DEBUG      ( -- )
                                   4561 ;       Display sign-on message.
                                   4562 ;        .word      LINK
                                   4563 LINK = . 
                                   4564         .byte      5
                                   4565         .ascii     "DEBUG"
                                   4566 DEBUG:
                                   4567 	CALL DOLIT
                                   4568 	.word 0x65
                                   4569 	CALL EMIT
                                   4570 	CALL DOLIT
                                   4571 	.word 0
                                   4572  	CALL ZLESS 
                                   4573 	CALL DOLIT
                                   4574 	.word 0xFFFE
                                   4575 	CALL ZLESS 
                                   4576 	CALL UPLUS 
                                   4577  	CALL DROP 
                                   4578 	CALL DOLIT
                                   4579 	.word 3
                                   4580 	CALL UPLUS 
                                   4581 	CALL UPLUS 
                                   4582  	CALL DROP
                                   4583 	CALL DOLIT
                                   4584 	.word 0x43
                                   4585 	CALL UPLUS 
                                   4586  	CALL DROP
                                   4587 	CALL EMIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   4588 	CALL DOLIT
                                   4589 	.word 0x4F
                                   4590 	CALL DOLIT
                                   4591 	.word 0x6F
                                   4592  	CALL XORR
                                   4593 	CALL DOLIT
                                   4594 	.word 0xF0
                                   4595  	CALL ANDD
                                   4596 	CALL DOLIT
                                   4597 	.word 0x4F
                                   4598  	CALL ORR
                                   4599 	CALL EMIT
                                   4600 	CALL DOLIT
                                   4601 	.word 8
                                   4602 	CALL DOLIT
                                   4603 	.word 6
                                   4604  	CALL SWAPP
                                   4605 	CALL OVER
                                   4606 	CALL XORR
                                   4607 	CALL DOLIT
                                   4608 	.word 3
                                   4609 	CALL ANDD 
                                   4610 	CALL ANDD
                                   4611 	CALL DOLIT
                                   4612 	.word 0x70
                                   4613 	CALL UPLUS 
                                   4614 	CALL DROP
                                   4615 	CALL EMIT
                                   4616 	CALL DOLIT
                                   4617 	.word 0
                                   4618 	CALL QBRAN
                                   4619 	.word DEBUG1
                                   4620 	CALL DOLIT
                                   4621 	.word 0x3F
                                   4622 DEBUG1:
                                   4623 	CALL DOLIT
                                   4624 	.word 0xFFFF
                                   4625 	CALL QBRAN
                                   4626 	.word DEBUG2
                                   4627 	CALL DOLIT
                                   4628 	.word 0x74
                                   4629 	CALL BRAN
                                   4630 	.word DEBUG3
                                   4631 DEBUG2:
                                   4632 	CALL DOLIT
                                   4633 	.word 0x21
                                   4634 DEBUG3:
                                   4635 	CALL EMIT
                                   4636 	CALL DOLIT
                                   4637 	.word 0x68
                                   4638 	CALL DOLIT
                                   4639 	.word 0x80
                                   4640 	CALL STORE
                                   4641 	CALL DOLIT
                                   4642 	.word 0x80
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4643 	CALL AT
                                   4644 	CALL EMIT
                                   4645 	CALL DOLIT
                                   4646 	.word 0x4D
                                   4647 	CALL TOR
                                   4648 	CALL RAT
                                   4649 	CALL RFROM
                                   4650 	CALL ANDD
                                   4651 	CALL EMIT
                                   4652 	CALL DOLIT
                                   4653 	.word 0x61
                                   4654 	CALL DOLIT
                                   4655 	.word 0xA
                                   4656 	CALL TOR
                                   4657 DEBUG4:
                                   4658 	CALL DOLIT
                                   4659 	.word 1
                                   4660 	CALL UPLUS 
                                   4661 	CALL DROP
                                   4662 	CALL DONXT
                                   4663 	.word DEBUG4
                                   4664 	CALL EMIT
                                   4665 	CALL DOLIT
                                   4666 	.word 0x656D
                                   4667 	CALL DOLIT
                                   4668 	.word 0x100
                                   4669 	CALL UMSTA
                                   4670 	CALL SWAPP
                                   4671 	CALL DOLIT
                                   4672 	.word 0x100
                                   4673 	CALL UMSTA
                                   4674 	CALL SWAPP 
                                   4675 	CALL DROP
                                   4676 	CALL EMIT
                                   4677 	CALL EMIT
                                   4678 	CALL DOLIT
                                   4679 	.word 0x2043
                                   4680 	CALL DOLIT
                                   4681 	.word 0
                                   4682 	CALL DOLIT
                                   4683 	.word 0x100
                                   4684 	CALL UMMOD
                                   4685 	CALL EMIT
                                   4686 	CALL EMIT
                                   4687 	;JP ORIG
                                   4688 	RET
                                   4689 .endif ; WANT_DEBUG 
                                   4690 
                                   4691 
                                   4692 ;       'BOOT   ( -- a )
                                   4693 ;       The application startup vector.
      009ACB 9A 99                 4694         .word      LINK
                           001A4D  4695 LINK = . 
      009ACD 05                    4696         .byte      5
      009ACE 27 42 4F 4F 54        4697         .ascii     "'BOOT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      009AD3                       4698 TBOOT:
      009AD3 CD 86 D8         [ 4] 4699         CALL     DOVAR
      009AD6 40 02                 4700         .word    APP_RUN      ;application to boot
                                   4701 
                                   4702 ;       COLD    ( -- )
                                   4703 ;       The hilevel cold start s=ence.
      009AD8 9A CD                 4704         .word      LINK
                           001A5A  4705         LINK = . 
      009ADA 04                    4706         .byte      4
      009ADB 43 4F 4C 44           4707         .ascii     "COLD"
      009ADF                       4708 COLD:
                           000000  4709 .if WANT_DEBUG
                                   4710         CALL DEBUG
                                   4711 .endif ; WANT_DEBUG
      009ADF CD 84 F3         [ 4] 4712 COLD1:  CALL     DOLIT
      009AE2 80 AB                 4713         .word      UZERO
      009AE4 CD 84 F3         [ 4] 4714 	CALL     DOLIT
      009AE7 00 06                 4715         .word      UPP
      009AE9 CD 84 F3         [ 4] 4716         CALL     DOLIT
      009AEC 00 1E                 4717 	.word      UEND-UZERO
      009AEE CD 8C EC         [ 4] 4718         CALL     CMOVE   ;initialize user area
                           000001  4719 .if WANT_FLOAT 
      009AF1 CD AB 05         [ 4] 4720         CALL    FINIT 
                                   4721 .endif 
                                   4722 ; if APP_RUN==0 initialize with ca de 'hi'  
      009AF4 90 CE 40 02      [ 2] 4723         ldw y,APP_RUN 
      009AF8 26 0B            [ 1] 4724         jrne 0$
      009AFA 1D 00 02         [ 2] 4725         subw x,#CELLL 
      009AFD 90 AE 9A 9C      [ 2] 4726         ldw y,#HI  
      009B01 FF               [ 2] 4727         ldw (x),y
      009B02 CD 9B FD         [ 4] 4728         call UPDATRUN 
      009B05                       4729 0$:        
                                   4730 ; update LAST with APP_LAST 
                                   4731 ; if APP_LAST > LAST else do the opposite
      009B05 90 CE 40 00      [ 2] 4732         ldw y,APP_LAST 
      009B09 90 B3 1E         [ 2] 4733         cpw y,ULAST 
      009B0C 22 05            [ 1] 4734         jrugt 1$ 
                                   4735 ; save LAST at APP_LAST  
      009B0E CD 9B E5         [ 4] 4736         call UPDATLAST 
      009B11 20 06            [ 2] 4737         jra 2$
      009B13                       4738 1$: ; update LAST with APP_LAST 
      009B13 90 BF 1E         [ 2] 4739         ldw ULAST,y
      009B16 90 BF 18         [ 2] 4740         ldw UCNTXT,y
      009B19                       4741 2$:  
                                   4742 ; update APP_CP if < app_space 
      009B19 90 CE 40 04      [ 2] 4743         ldw y,APP_CP  
      009B1D 90 B3 1C         [ 2] 4744         cpw y,UCP   
      009B20 24 06            [ 1] 4745         jruge 3$ 
      009B22 CD 9C 0E         [ 4] 4746         call UPDATCP
      009B25 90 BE 1C         [ 2] 4747         ldw y,UCP   
      009B28                       4748 3$:
      009B28 90 BF 1C         [ 2] 4749         ldw UCP,y                 
                                   4750 ; update UVP with APP_VP  
                                   4751 ; if APP_VP>UVP else do the opposite 
      009B2B 90 CE 40 06      [ 2] 4752         ldw y,APP_VP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009B2F 90 B3 1A         [ 2] 4753         cpw y,UVP 
      009B32 22 05            [ 1] 4754         jrugt 4$
      009B34 CD 9C 25         [ 4] 4755         call UPDATVP 
      009B37 20 03            [ 2] 4756         jra 6$
      009B39                       4757 4$: ; update UVP with APP_VP 
      009B39 90 BF 1A         [ 2] 4758         ldw UVP,y 
      009B3C                       4759 6$:      
      009B3C CD 94 A4         [ 4] 4760         CALL     PRESE   ;initialize data stack and TIB
      009B3F CD 9A D3         [ 4] 4761         CALL     TBOOT
      009B42 CD 8C D5         [ 4] 4762         CALL     ATEXE   ;application boot
      009B45 CD 97 6D         [ 4] 4763         CALL     OVERT
      009B48 CC 94 C1         [ 2] 4764         JP     QUIT    ;start interpretation
                                   4765 
                                   4766 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



                                   4767         .include "flash.asm"
                                      1 ;;
                                      2 ; Copyright Jacques Deschênes 2019,2020 
                                      3 ; This file is part of stm8_eForth  
                                      4 ;
                                      5 ;     stm8_eForth is free software: you can redistribute it and/or modify
                                      6 ;     it under the terms of the GNU General Public License as published by
                                      7 ;     the Free Software Foundation, either version 3 of the License, or
                                      8 ;     (at your option) any later version.
                                      9 ;
                                     10 ;     stm8_eForth is distributed in the hope that it will be useful,
                                     11 ;     but WITHOUT ANY WARRANTY; without even the implied warranty of
                                     12 ;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                     13 ;     GNU General Public License for more details.
                                     14 ;
                                     15 ;     You should have received a copy of the GNU General Public License
                                     16 ;     along with stm8_eForth.  If not, see <http://www.gnu.org/licenses/>.
                                     17 ;;
                                     18 
                                     19 
                                     20 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     21 ;  routines to write to FLASH, EEPROM 
                                     22 ;  and OPTION 
                                     23 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     24 
                                     25 
                                     26 ;--------------------------------
                                     27 ; initialize FPTR 
                                     28 ; FP!  ( ud -- )
                                     29 ;---------------------------------
      009B4B 9A DA                   30     .word LINK 
                           001ACD    31     LINK=.
      009B4D 03                      32     .byte 3 
      009B4E 46 50 21                33     .ascii "FP!"
      009B51                         34 FPSTOR:
      009B51 90 93            [ 1]   35     ldw y,x
      009B53 90 FE            [ 2]   36     ldw y,(y)
      009B55 90 9F            [ 1]   37     ld a,yl 
      009B57 B7 36            [ 1]   38     ld FPTR,a 
      009B59 1C 00 02         [ 2]   39     addw x,#CELLL 
      009B5C 90 93            [ 1]   40     ldw y,x 
      009B5E 90 FE            [ 2]   41     ldw y,(y)
      009B60 90 BF 37         [ 2]   42     ldw PTR16,y
      009B63 1C 00 02         [ 2]   43     addw x,#CELLL 
      009B66 81               [ 4]   44     ret 
                                     45 
                                     46 ;-----------------------------------
                                     47 ; return EEPROM base address 
                                     48 ; as a double 
                                     49 ;  EEPROM  ( -- ud )
                                     50 ;-----------------------------------
      009B67 9B 4D                   51     .word LINK 
                           001AE9    52 LINK=.
      009B69 06                      53     .byte 6 
      009B6A 45 45 50 52 4F 4D       54     .ascii "EEPROM"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009B70                         55 EEPROM: 
      009B70 90 AE 40 00      [ 2]   56     ldw y,#EEPROM_BASE
      009B74 1D 00 04         [ 2]   57     subw x,#2*CELLL 
      009B77 EF 02            [ 2]   58     ldw (2,x),y 
      009B79 90 5F            [ 1]   59     clrw y 
      009B7B FF               [ 2]   60     ldw (x),y 
      009B7C 81               [ 4]   61     ret
                                     62 
                                     63 ;---------------------------------
                                     64 ; return APP_LAST pointer as double
                                     65 ; EEP-LAST ( -- ud )
                                     66 ;---------------------------------
      009B7D 9B 69                   67 	.word LINK 
                           001AFF    68 	LINK=.
      009B7F 08                      69 	.byte 8 
      009B80 45 45 50 2D 4C 41 53    70 	.ascii "EEP-LAST"
             54
      009B88                         71 EEPLAST:
      009B88 1D 00 04         [ 2]   72 	subw x,#2*CELLL 
      009B8B 90 AE 40 00      [ 2]   73 	ldw y,#APP_LAST 
      009B8F EF 02            [ 2]   74 	ldw (2,x),y 
      009B91 90 5F            [ 1]   75 	clrw y 
      009B93 FF               [ 2]   76 	ldw (x),y 
      009B94 81               [ 4]   77 	ret 
                                     78 
                                     79 ;----------------------------------
                                     80 ; return APP_RUN pointer as double	
                                     81 ; EEP-RUN ( -- ud )
                                     82 ;-----------------------------------
      009B95 9B 7F                   83 	.word LINK 
                           001B17    84 	LINK=.
      009B97 07                      85 	.byte 7
      009B98 45 45 50 2D 52 55 4E    86 	.ascii "EEP-RUN"
      009B9F                         87 EEPRUN:
      009B9F 1D 00 04         [ 2]   88 	subw x,#2*CELLL 
      009BA2 90 AE 40 02      [ 2]   89 	ldw y,#APP_RUN 
      009BA6 EF 02            [ 2]   90 	ldw (2,x),y 
      009BA8 90 5F            [ 1]   91 	clrw y 
      009BAA FF               [ 2]   92 	ldw (x),y 
      009BAB 81               [ 4]   93 	ret 
                                     94 
                                     95 ;------------------------------------
                                     96 ; return APP_CP pointer as double 
                                     97 ; EEP-CP ( -- ud )
                                     98 ;------------------------------------
      009BAC 9B 97                   99 	.word LINK
                           001B2E   100 	LINK=.
      009BAE 06                     101 	.byte 6 
      009BAF 45 45 50 2D 43 50      102 	.ascii "EEP-CP"
      009BB5                        103 EEPCP:
      009BB5 1D 00 04         [ 2]  104 	subw x,#2*CELLL 
      009BB8 90 AE 40 04      [ 2]  105 	ldw y,#APP_CP  
      009BBC EF 02            [ 2]  106 	ldw (2,x),y 
      009BBE 90 5F            [ 1]  107 	clrw y 
      009BC0 FF               [ 2]  108 	ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      009BC1 81               [ 4]  109 	ret 
                                    110 
                                    111 ;------------------------------------
                                    112 ; return APP_VP pointer as double 
                                    113 ; EEP-VP ( -- ud )
                                    114 ;-------------------------------------
      009BC2 9B AE                  115 	.word LINK
                           001B44   116 	LINK=.
      009BC4 06                     117 	.byte 6
      009BC5 45 45 50 2D 56 50      118 	.ascii "EEP-VP"
      009BCB                        119 EEPVP:
      009BCB 1D 00 04         [ 2]  120 	subw x,#2*CELLL 
      009BCE 90 AE 40 06      [ 2]  121 	ldw y,#APP_VP  
      009BD2 EF 02            [ 2]  122 	ldw (2,x),y 
      009BD4 90 5F            [ 1]  123 	clrw y 
      009BD6 FF               [ 2]  124 	ldw (x),y 
      009BD7 81               [ 4]  125 	ret 
                                    126 
                                    127 ;----------------------------------
                                    128 ; update APP_LAST with LAST 
                                    129 ; UPDAT-LAST ( -- )
                                    130 ;----------------------------------
      009BD8 9B C4                  131 	.word LINK 
                           001B5A   132 	LINK=.
      009BDA 0A                     133 	.byte 10
      009BDB 55 50 44 41 54 2D 4C   134 	.ascii "UPDAT-LAST"
             41 53 54
      009BE5                        135 UPDATLAST:
      009BE5 CD 87 97         [ 4]  136 	call LAST
      009BE8 CD 85 71         [ 4]  137 	call AT  
      009BEB CD 9B 88         [ 4]  138 	call EEPLAST
      009BEE CC 9D DB         [ 2]  139 	jp EESTORE 
                                    140 
                                    141 ;---------------------------------
                                    142 ; update APP_RUN 
                                    143 ; UPDAT-RUN ( a -- )
                                    144 ;---------------------------------
      009BF1 9B DA                  145 	.word LINK
                           001B73   146 	LINK=.
      009BF3 09                     147 	.byte 9
      009BF4 55 50 44 41 54 2D 52   148 	.ascii "UPDAT-RUN"
             55 4E
      009BFD                        149 UPDATRUN:
      009BFD CD 9B 9F         [ 4]  150 	call EEPRUN
      009C00 CC 9D DB         [ 2]  151 	jp EESTORE 
                                    152 	
                                    153 ;---------------------------------
                                    154 ; update APP_CP with CP 
                                    155 ; UPDAT-CP ( -- )
                                    156 ;---------------------------------
      009C03 9B F3                  157 	.word LINK 
                           001B85   158 	LINK=.
      009C05 08                     159 	.byte 8 
      009C06 55 50 44 41 54 2D 43   160 	.ascii "UPDAT-CP"
             50
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009C0E                        161 UPDATCP:
      009C0E CD 87 87         [ 4]  162 	call CPP 
      009C11 CD 85 71         [ 4]  163 	call AT 
      009C14 CD 9B B5         [ 4]  164 	call EEPCP 
      009C17 CC 9D DB         [ 2]  165 	jp EESTORE 
                                    166 
                                    167 ;----------------------------------
                                    168 ; update APP_VP with VP 
                                    169 ; UPDAT-VP ( -- )
                                    170 ;----------------------------------
      009C1A 9C 05                  171 	.word LINK
                           001B9C   172 	LINK=.
      009C1C 08                     173 	.byte 8 
      009C1D 55 50 44 41 54 2D 56   174 	.ascii "UPDAT-VP" 
             50
      009C25                        175 UPDATVP:
      009C25 CD 87 79         [ 4]  176 	call VPP 
      009C28 CD 85 71         [ 4]  177 	call AT
      009C2B CD 9B CB         [ 4]  178 	call EEPVP 
      009C2E CC 9D DB         [ 2]  179 	jp EESTORE
                                    180 	
                           000001   181 .if NUCLEO
                                    182 ;----------------------------------
                                    183 ; fetch integer at address over 65535
                                    184 ;  F@   ( ud -- n )
                                    185 ;----------------------------------
      009C31 9C 1C                  186     .word LINK 
                           001BB3   187 LINK=.
      009C33 02                     188     .byte 2
      009C34 46 40                  189     .ascii "F@"
      009C36                        190 FARAT:
      009C36 CD 9B 51         [ 4]  191     call FPSTOR
      009C39 CC 9C FE         [ 2]  192 	jp EE_READ 
                                    193 
                                    194 
                                    195 ;-------------------------------------
                                    196 ; fetch C at address over 65535 
                                    197 ; FC@ ( ud -- c)
                                    198 ;-------------------------------------
      009C3C 9C 33                  199     .word LINK
                           001BBE   200     LINK=.
      009C3E 03                     201     .byte 3 
      009C3F 46 43 40               202     .ascii "FC@" 
      009C42                        203 FARCAT:
      009C42 CD 9B 51         [ 4]  204     call FPSTOR
      009C45 CC 9D 20         [ 2]  205 	jp EE_CREAD  
                                    206 .endif ; NUCLEO 
                                    207 
                                    208 ;----------------------------------
                                    209 ; UNLOCK EEPROM/OPT for writing/erasing
                                    210 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    211 ;  UNLKEE   ( -- )
                                    212 ;----------------------------------
      009C48 9C 3E                  213     .word LINK 
                           001BCA   214 LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009C4A 06                     215     .byte 6 
      009C4B 55 4E 4C 4B 45 45      216     .ascii "UNLKEE"
      009C51                        217 UNLKEE:
      009C51 35 00 50 5B      [ 1]  218 	mov FLASH_CR2,#0 
      009C55 35 FF 50 5C      [ 1]  219 	mov FLASH_NCR2,#0xFF 
      009C59 35 AE 50 64      [ 1]  220 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009C5D 35 56 50 64      [ 1]  221     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009C61 72 07 50 5F FB   [ 2]  222 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009C66 81               [ 4]  223 	ret
                                    224 
                                    225 ;----------------------------------
                                    226 ; UNLOCK FLASH for writing/erasing
                                    227 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    228 ; UNLKFL  ( -- )
                                    229 ;----------------------------------
      009C67 9C 4A                  230     .word LINK 
                           001BE9   231 LINK=. 
      009C69 06                     232     .byte 6 
      009C6A 55 4E 4C 4B 46 4C      233     .ascii "UNLKFL"    
      009C70                        234 UNLKFL:
      009C70 35 00 50 5B      [ 1]  235 	mov FLASH_CR2,#0 
      009C74 35 FF 50 5C      [ 1]  236 	mov FLASH_NCR2,#0xFF 
      009C78 35 56 50 62      [ 1]  237 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009C7C 35 AE 50 62      [ 1]  238 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009C80 72 03 50 5F FB   [ 2]  239 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009C85 81               [ 4]  240 	ret
                                    241 
                                    242 ;-----------------------------
                                    243 ; UNLOCK FLASH or EEPROM 
                                    244 ; according to FPTR address 
                                    245 ;  UNLOCK ( -- )
                                    246 ;-----------------------------
      009C86 9C 69                  247 	.word LINK 
                           001C08   248 	LINK=.
      009C88 06                     249 	.byte 6
      009C89 55 4E 4C 4F 43 4B      250 	.ascii "UNLOCK"
      009C8F                        251 UNLOCK:
                                    252 ; put addr[15:0] in Y, for bounds check.
      009C8F 90 BE 37         [ 2]  253 	ldw y,PTR16   ; Y=addr15:0
                                    254 ; check addr[23:16], if <> 0 then it is extened flash memory
      009C92 3D 36            [ 1]  255 	tnz FPTR 
      009C94 26 16            [ 1]  256 	jrne 4$
      009C96 90 A3 80 00      [ 2]  257     cpw y,#FLASH_BASE
      009C9A 24 10            [ 1]  258     jruge 4$
      009C9C 90 A3 40 00      [ 2]  259 	cpw y,#EEPROM_BASE  
      009CA0 25 0D            [ 1]  260     jrult 9$
      009CA2 90 A3 48 7F      [ 2]  261 	cpw y,#OPTION_END 
      009CA6 22 07            [ 1]  262 	jrugt 9$
      009CA8 CD 9C 51         [ 4]  263 	call UNLKEE
      009CAB 81               [ 4]  264 	ret 
      009CAC CD 9C 70         [ 4]  265 4$: call UNLKFL
      009CAF 81               [ 4]  266 9$: ret 
                                    267 
                                    268 ;-------------------------
                                    269 ; LOCK write access to 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                    270 ; FLASH and EEPROM 
                                    271 ; LOCK ( -- )
                                    272 ;-------------------------
      009CB0 9C 88                  273 	.word LINK 
                           001C32   274 	LINK=.
      009CB2 04                     275 	.byte 4 
      009CB3 4C 4F 43 4B            276 	.ascii "LOCK" 
      009CB7                        277 LOCK: 
      009CB7 72 13 50 5F      [ 1]  278 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009CBB 72 17 50 5F      [ 1]  279 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009CBF 81               [ 4]  280 	ret 
                                    281 
                                    282 ;-------------------------
                                    283 ; increment FPTR 
                                    284 ; INC-FPTR ( -- )
                                    285 ;-------------------------
      009CC0 9C B2                  286 	.word LINK 
                           001C42   287 	LINK=. 
      009CC2 08                     288 	.byte 8 
      009CC3 49 4E 43 2D 46 50 54   289 	.ascii "INC-FPTR" 
             52
      009CCB                        290 INC_FPTR:
      009CCB 3C 38            [ 1]  291 	inc PTR8 
      009CCD 26 0C            [ 1]  292 	jrne 1$
      009CCF 90 89            [ 2]  293 	pushw y 
      009CD1 90 BE 36         [ 2]  294 	ldw y,FPTR 
      009CD4 90 5C            [ 1]  295 	incw y 
      009CD6 90 BF 36         [ 2]  296 	ldw FPTR,y
      009CD9 90 85            [ 2]  297 	popw y  
      009CDB 81               [ 4]  298 1$: ret 
                                    299 
                                    300 ;------------------------------
                                    301 ; add u to FPTR 
                                    302 ; PTR+ ( u -- )
                                    303 ;------------------------------
      009CDC 9C C2                  304 	.word LINK 
                           001C5E   305 	LINK=.
      009CDE 04                     306 	.byte 4 
      009CDF 50 54 52 2B            307 	.ascii "PTR+"
      009CE3                        308 PTRPLUS:
      009CE3 90 93            [ 1]  309 	ldw y,x 
      009CE5 1C 00 02         [ 2]  310 	addw x,#CELLL 
      009CE8 72 B9 00 37      [ 2]  311 	addw y,PTR16 
      009CEC 90 BF 37         [ 2]  312 	ldw PTR16,y  
      009CEF 24 02            [ 1]  313 	jrnc 1$
      009CF1 3C 36            [ 1]  314 	inc FPTR 
      009CF3 81               [ 4]  315 1$: ret 
                                    316 
                                    317 ;---------------------------------
                                    318 ; read word at address pointed FPTR
                                    319 ; increment FPTR 
                                    320 ; EE-READ ( -- w )
                                    321 ;------------------------------------
      009CF4 9C DE                  322 	.word LINK 
                           001C76   323 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009CF6 07                     324 	.byte 7 
      009CF7 45 45 2D 52 45 41 44   325 	.ascii "EE-READ"
      009CFE                        326 EE_READ:
      009CFE 1D 00 02         [ 2]  327 	subw x,#CELLL 
      009D01 92 BC 00 36      [ 5]  328 	ldf a,[FPTR]
      009D05 90 95            [ 1]  329 	ld yh,a 
      009D07 CD 9C CB         [ 4]  330 	call INC_FPTR 
      009D0A 92 BC 00 36      [ 5]  331 	ldf a,[FPTR]
      009D0E CD 9C CB         [ 4]  332 	call INC_FPTR 
      009D11 90 97            [ 1]  333 	ld yl,a 
      009D13 FF               [ 2]  334 	ldw (x),y 
      009D14 81               [ 4]  335 	ret 
                                    336 
                                    337 ;---------------------------------------
                                    338 ; Read byte at address pointed by FPTR 
                                    339 ; EE-CREAD ( -- c )
                                    340 ;---------------------------------------
      009D15 9C F6                  341 	.word LINK 
                           001C97   342 	LINK=.
      009D17 08                     343 	.byte 8
      009D18 45 45 2D 43 52 45 41   344 	.ascii "EE-CREAD" 
             44
      009D20                        345 EE_CREAD:
      009D20 1D 00 02         [ 2]  346 	subw x,#CELLL 
      009D23 92 BC 00 36      [ 5]  347 	ldf a,[FPTR]	
      009D27 CD 9C CB         [ 4]  348 	call INC_FPTR
      009D2A 90 5F            [ 1]  349 	clrw y 
      009D2C 90 97            [ 1]  350 	ld yl,a 
      009D2E FF               [ 2]  351 	ldw (x),y 
      009D2F 81               [ 4]  352 	ret 
                                    353 
                                    354 ;----------------------------
                                    355 ; write a byte at address pointed 
                                    356 ; by FPTR and increment FPTR.
                                    357 ; Expect pointer already initialized 
                                    358 ; and memory unlocked 
                                    359 ; WR-BYTE ( c -- )
                                    360 ;----------------------------
      009D30 9D 17                  361 	.word LINK 
                           001CB2   362 	LINK=. 
      009D32 07                     363 	.byte 7 
      009D33 57 52 2D 42 59 54 45   364 	.ascii "WR-BYTE" 
                                    365 
      009D3A                        366 WR_BYTE:
      009D3A CD 84 E5         [ 4]  367 	call FC_XOFF
      009D3D 90 93            [ 1]  368 	ldw y,x 
      009D3F 90 FE            [ 2]  369 	ldw y,(y)
      009D41 1C 00 02         [ 2]  370 	addw x,#CELLL 
      009D44 90 9F            [ 1]  371 	ld a,yl
      009D46 92 BD 00 36      [ 4]  372 	ldf [FPTR],a
      009D4A 72 05 50 5F FB   [ 2]  373 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009D4F CD 84 CF         [ 4]  374 	call FC_XON
      009D52 CC 9C CB         [ 2]  375 	jp INC_FPTR 
                                    376 
                                    377 ;---------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                    378 ; write a word at address pointed 
                                    379 ; by FPTR and increment FPTR 
                                    380 ; Expect pointer already initialzed 
                                    381 ; and memory unlocked 
                                    382 ; WR-WORD ( w -- )
                                    383 ;---------------------------------------
      009D55 9D 32                  384 	.word LINK 
                           001CD7   385 	LINK=.
      009D57 07                     386 	.byte 7 
      009D58 57 52 2D 57 4F 52 44   387 	.ascii "WR-WORD" 
      009D5F                        388 WR_WORD:
      009D5F CD 84 E5         [ 4]  389 	call FC_XOFF
      009D62 90 93            [ 1]  390 	ldw y,x
      009D64 90 FE            [ 2]  391 	ldw y,(y)
      009D66 1C 00 02         [ 2]  392 	addw x,#CELLL 
      009D69 90 9E            [ 1]  393 	ld a,yh 
      009D6B 92 BD 00 36      [ 4]  394 	ldf [FPTR],a
      009D6F 72 05 50 5F FB   [ 2]  395 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009D74 CD 9C CB         [ 4]  396 	call INC_FPTR 
      009D77 90 9F            [ 1]  397 	ld a,yl 
      009D79 92 BD 00 36      [ 4]  398 	ldf [FPTR],a
      009D7D 72 05 50 5F FB   [ 2]  399 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009D82 CD 84 CF         [ 4]  400 	call FC_XON
      009D85 CC 9C CB         [ 2]  401 	jp INC_FPTR 
                                    402 
                                    403 
                                    404 ;---------------------------------------
                                    405 ; write a byte to FLASH or EEPROM/OPTION  
                                    406 ; EEC!  (c ud -- )
                                    407 ;---------------------------------------
      009D88 9D 57                  408     .word LINK 
                           001D0A   409 	LINK=.
      009D8A 04                     410     .byte 4 
      009D8B 45 45 43 21            411     .ascii "EEC!"
                                    412 	; local variables 
                           000001   413 	BTW = 1   ; byte to write offset on stack
                           000002   414     OPT = 2 
                           000002   415 	VSIZE = 2
      009D8F                        416 EECSTORE:
      009D8F 52 02            [ 2]  417 	sub sp,#VSIZE
      009D91 CD 9B 51         [ 4]  418     call FPSTOR
      009D94 E6 01            [ 1]  419 	ld a,(1,x)
      009D96 43               [ 1]  420 	cpl a 
      009D97 6B 01            [ 1]  421 	ld (BTW,sp),a ; byte to write 
      009D99 0F 02            [ 1]  422 	clr (OPT,sp)  ; OPTION flag
      009D9B CD 9C 8F         [ 4]  423 	call UNLOCK 
                                    424 	; check if option
      009D9E 3D 36            [ 1]  425 	tnz FPTR 
      009DA0 26 19            [ 1]  426 	jrne 2$
      009DA2 90 BE 37         [ 2]  427 	ldw y,PTR16 
      009DA5 90 A3 48 00      [ 2]  428 	cpw y,#OPTION_BASE
      009DA9 2B 10            [ 1]  429 	jrmi 2$
      009DAB 90 A3 48 80      [ 2]  430 	cpw y,#OPTION_END+1
      009DAF 2A 0A            [ 1]  431 	jrpl 2$
      009DB1 03 02            [ 1]  432 	cpl (OPT,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                    433 	; OPTION WRITE require this UNLOCK 
      009DB3 72 1E 50 5B      [ 1]  434     bset FLASH_CR2,#FLASH_CR2_OPT
      009DB7 72 1F 50 5C      [ 1]  435     bres FLASH_NCR2,#FLASH_CR2_OPT 
      009DBB                        436 2$: 
      009DBB CD 9D 3A         [ 4]  437 	call WR_BYTE 	
      009DBE 0D 02            [ 1]  438 	tnz (OPT,sp)
      009DC0 27 0D            [ 1]  439 	jreq 3$ 
      009DC2 7B 01            [ 1]  440     ld a,(BTW,sp)
      009DC4 90 5F            [ 1]  441     clrw y
      009DC6 90 97            [ 1]  442 	ld yl,a 
      009DC8 1D 00 02         [ 2]  443 	subw x,#CELLL 
      009DCB FF               [ 2]  444 	ldw (x),y 
      009DCC CD 9D 3A         [ 4]  445 	call WR_BYTE
      009DCF                        446 3$: 
      009DCF CD 9C B7         [ 4]  447 	call LOCK 
      009DD2 5B 02            [ 2]  448 	addw sp,#VSIZE 
      009DD4 81               [ 4]  449     ret
                                    450 
                                    451 ;------------------------------
                                    452 ; write integer in FLASH|EEPROM
                                    453 ; EE! ( n ud -- )
                                    454 ;------------------------------
      009DD5 9D 8A                  455 	.word LINK 
                           001D57   456 	LINK=.
      009DD7 03                     457 	.byte 3 
      009DD8 45 45 21               458 	.ascii "EE!"
      009DDB                        459 EESTORE:
      009DDB CD 9B 51         [ 4]  460 	call FPSTOR 
      009DDE CD 9C 8F         [ 4]  461 	call UNLOCK 
      009DE1 90 93            [ 1]  462 	ldw y,x 
      009DE3 90 FE            [ 2]  463 	ldw y,(y)
      009DE5 90 89            [ 2]  464 	pushw y 
      009DE7 90 5E            [ 1]  465 	swapw y 
      009DE9 FF               [ 2]  466 	ldw (x),y 
      009DEA CD 9D 3A         [ 4]  467 	call WR_BYTE 
      009DED 90 85            [ 2]  468 	popw y 
      009DEF 1D 00 02         [ 2]  469 	subw x,#CELLL
      009DF2 FF               [ 2]  470 	ldw (x),y 
      009DF3 CD 9D 3A         [ 4]  471 	call WR_BYTE
      009DF6 CC 9C B7         [ 2]  472 	jp LOCK 
                                    473 
                                    474 
                                    475 ;----------------------------
                                    476 ; Erase flash memory row 
                                    477 ; stm8s208 as 128 bytes rows
                                    478 ; ROW-ERASE ( ud -- )
                                    479 ;----------------------------
      009DF9 9D D7                  480 	.word LINK 
                           001D7B   481 	LINK=. 
      009DFB 09                     482 	.byte 9 
      009DFC 52 4F 57 2D 45 52 41   483 	.ascii "ROW-ERASE" 
             53 45
      009E05                        484 row_erase:
      009E05 CD 84 E5         [ 4]  485 	call FC_XOFF
      009E08 CD 9B 51         [ 4]  486 	call FPSTOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                    487 ;code must be execute from RAM 
                                    488 ;copy routine to PAD 
      009E0B 1D 00 02         [ 2]  489 	subw x,#CELLL 
      009E0E 90 AE 9E 5E      [ 2]  490 	ldw y,#row_erase_proc
      009E12 FF               [ 2]  491 	ldw (x),y 
      009E13 CD 8C B0         [ 4]  492 	call PAD 
      009E16 90 AE 9E 85      [ 2]  493 	ldw y,#row_erase_proc_end 
      009E1A 72 A2 9E 5E      [ 2]  494 	subw y,#row_erase_proc
      009E1E 1D 00 02         [ 2]  495 	subw x,#CELLL 
      009E21 FF               [ 2]  496 	ldw (x),y 
      009E22 CD 8C EC         [ 4]  497 	call CMOVE 
      009E25                        498 block_erase:
      009E25 90 BE 37         [ 2]  499 	ldw y,FPTR+1
      009E28 90 A3 B0 00      [ 2]  500 	cpw y,#app_space 
      009E2C 2A 19            [ 1]  501 	jrpl erase_flash 
                                    502 ; erase EEPROM block
      009E2E 90 A3 40 00      [ 2]  503 	cpw y,#EEPROM_BASE 
      009E32 24 04            [ 1]  504 	jruge 1$
      009E34 CD 84 CF         [ 4]  505 	call FC_XON
      009E37 81               [ 4]  506 	ret ; bad address 
      009E38 90 A3 47 FF      [ 2]  507 1$: cpw y,#EEPROM_END 
      009E3C 23 04            [ 2]  508 	jrule 2$ 
      009E3E CD 84 CF         [ 4]  509 	call FC_XON
      009E41 81               [ 4]  510 	ret ; bad address 
      009E42                        511 2$:	
      009E42 CD 9C 51         [ 4]  512 	call UNLKEE 
      009E45 20 03            [ 2]  513 	jra proceed_erase
                                    514 ; erase flash block:
      009E47                        515 erase_flash:
      009E47 CD 9C 70         [ 4]  516 	call UNLKFL 
      009E4A                        517 proceed_erase:
      009E4A CD 8C B0         [ 4]  518 	call PAD 
      009E4D 90 93            [ 1]  519 	ldw y,x
      009E4F 90 FE            [ 2]  520 	ldw y,(y)
      009E51 1C 00 02         [ 2]  521 	addw x,#CELLL  
      009E54 90 FD            [ 4]  522 	call (y) 
      009E56 72 17 50 5F      [ 1]  523 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009E5A CD 84 CF         [ 4]  524 	call FC_XON
      009E5D 81               [ 4]  525 	ret 
                                    526 
                                    527 ; this routine is to be copied to PAD 
      009E5E                        528 row_erase_proc:
      009E5E 35 20 50 5B      [ 1]  529 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009E62 35 DF 50 5C      [ 1]  530 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009E66 4F               [ 1]  531 	clr a 
      009E67 90 5F            [ 1]  532 	clrw y 
      009E69 91 A7 00 36      [ 1]  533 	ldf ([FPTR],y),a
      009E6D 90 5C            [ 1]  534     incw y
      009E6F 91 A7 00 36      [ 1]  535 	ldf ([FPTR],y),a
      009E73 90 5C            [ 1]  536     incw y
      009E75 91 A7 00 36      [ 1]  537 	ldf ([FPTR],y),a
      009E79 90 5C            [ 1]  538     incw y
      009E7B 91 A7 00 36      [ 1]  539 	ldf ([FPTR],y),a
      009E7F 72 05 50 5F FB   [ 2]  540 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009E84 81               [ 4]  541 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009E85                        542 row_erase_proc_end:
                                    543 
                                    544 
                                    545 ;-----------------------------------
                                    546 ; block programming must be 
                                    547 ; executed from RAM 
                                    548 ; initial contidions: 
                                    549 ; 		memory unlocked
                                    550 ;       FPTR initialized 
                                    551 ; input: 
                                    552 ;    x   buffer address 
                                    553 ;-----------------------------------
                           000001   554 	BCNT=1 
      009E85                        555 copy_buffer:
      009E85 4B 80            [ 1]  556 	push #BLOCK_SIZE  
                                    557 ;enable block programming 
      009E87 72 10 50 5B      [ 1]  558 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009E8B 72 11 50 5C      [ 1]  559 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009E8F 90 5F            [ 1]  560 	clrw y
      009E91 F6               [ 1]  561 1$:	ld a,(x)
      009E92 91 A7 00 36      [ 1]  562 	ldf ([FPTR],y),a
      009E96 5C               [ 1]  563 	incw x 
      009E97 90 5C            [ 1]  564 	incw y 
      009E99 0A 01            [ 1]  565 	dec (BCNT,sp)
      009E9B 26 F4            [ 1]  566 	jrne 1$
                                    567 ; wait EOP bit 
      009E9D 72 05 50 5F FB   [ 2]  568 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009EA2 84               [ 1]  569 	pop a ; remove BCNT from stack 
      009EA3 81               [ 4]  570 	ret 
      009EA4                        571 copy_buffer_end:
                                    572 
                                    573 ;-------------------------
                                    574 ; move program_row to RAM 
                                    575 ; in TIB 
                                    576 ;------------------------
      009EA4                        577 copy_prog_to_ram:
      009EA4 1D 00 06         [ 2]  578 	subw x,#6
      009EA7 90 AE 9E 85      [ 2]  579 	ldw y,#copy_buffer 
      009EAB EF 04            [ 2]  580 	ldw (4,x),y 
      009EAD 90 AE 17 00      [ 2]  581 	ldw y,#TIBBASE
      009EB1 EF 02            [ 2]  582 	ldw (2,x),y 
      009EB3 90 AE 9E A4      [ 2]  583 	ldw y,#copy_buffer_end 
      009EB7 72 A2 9E 85      [ 2]  584 	subw y,#copy_buffer  
      009EBB FF               [ 2]  585 	ldw (x),y 
      009EBC CD 8C EC         [ 4]  586 	call CMOVE 
      009EBF 81               [ 4]  587 	ret 
                                    588 
                                    589 
                                    590 ;-----------------------------
                                    591 ; write a row in FLASH/EEPROM 
                                    592 ; WR-ROW ( a ud -- )
                                    593 ; a -> address 128 byte buffer to write 
                                    594 ; ud ->  row address in FLASH|EEPROM 
                                    595 ;-----------------------------
      009EC0 9D FB                  596 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                           001E42   597 	LINK=.
      009EC2 06                     598 	.byte 6 
      009EC3 57 52 2D 52 4F 57      599 	.ascii "WR-ROW"
      009EC9                        600 write_row:
      009EC9 CD 84 E5         [ 4]  601 	call FC_XOFF
      009ECC CD 9B 51         [ 4]  602 	call FPSTOR
                                    603 ; align to FLASH block 
      009ECF A6 80            [ 1]  604 	ld a,#0x80 
      009ED1 B4 38            [ 1]  605 	and a,PTR8 
      009ED3 B7 38            [ 1]  606 	ld PTR8,a  
      009ED5 CD 9E A4         [ 4]  607 	call copy_prog_to_ram
      009ED8 CD 9C 8F         [ 4]  608 	call UNLOCK
      009EDB 90 93            [ 1]  609 	ldw y,x 
      009EDD 90 FE            [ 2]  610 	ldw y,(y)
      009EDF 1C 00 02         [ 2]  611 	addw x,#CELLL 
      009EE2 89               [ 2]  612 	pushw x 
      009EE3 93               [ 1]  613 	ldw x,y ; buffer address in x 
      009EE4 CD 17 00         [ 4]  614 	call TIBBASE
      009EE7 CD 9C B7         [ 4]  615 	call LOCK
      009EEA 85               [ 2]  616 	popw x 
      009EEB CD 84 CF         [ 4]  617 	call FC_XON 
      009EEE 81               [ 4]  618 	ret 
                                    619 
                                    620 ;-------------------------------------
                                    621 ; change value of OPTION register 
                                    622 ; SET-OPT (c n -- ) 
                                    623 ; c new value.
                                    624 ; n OPT  number {1..7}
                                    625 ;--------------------------------------
      009EEF 9E C2                  626 		.word LINK 
                           001E71   627 		LINK=.
      009EF1 07                     628 		.byte 7 
      009EF2 53 45 54 2D 4F 50 54   629 		.ascii "SET-OPT" 
      009EF9                        630 set_option: 
      009EF9 90 93            [ 1]  631 		ldw y,x 
      009EFB 90 FE            [ 2]  632 		ldw y,(y)
      009EFD 27 06            [ 1]  633 		jreq 1$
      009EFF 90 A3 00 07      [ 2]  634 		cpw y,#7 
      009F03 23 04            [ 2]  635 		jrule 2$ 
                                    636 ; invalid OPTION number 		
      009F05 1C 00 04         [ 2]  637 1$:		addw x,#2*CELLL
      009F08 81               [ 4]  638 		ret
      009F09 90 58            [ 2]  639 2$:		sllw y 
      009F0B 72 A9 47 FF      [ 2]  640 		addw y,#OPTION_BASE-1
      009F0F FF               [ 2]  641 		ldw (x),y 
      009F10 1D 00 02         [ 2]  642 		subw x,#CELLL 
      009F13 90 5F            [ 1]  643 		clrw y 
      009F15 FF               [ 2]  644 		ldw (x),y 
      009F16 CD 9D 8F         [ 4]  645 		call EECSTORE
      009F19 81               [ 4]  646 		ret 
                                    647 
                                    648 
                                    649 
                                    650 ;--------------------------------------
                                    651 ; reset system to its original state 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                                    652 ; before any user modification
                                    653 ; PRISTINE ( -- )
                                    654 ;-------------------------------------
      009F1A 9E F1                  655 	.word LINK  
                           001E9C   656 	LINK=.
      009F1C 08                     657 	.byte 8 
      009F1D 50 52 49 53 54 49 4E   658 	.ascii "PRISTINE"
             45
      009F25                        659 pristine:
                                    660 ;;; erase EEPROM
      009F25 CD 9B 70         [ 4]  661 	call EEPROM 
      009F28 CD 88 32         [ 4]  662 1$:	call DDUP 
      009F2B CD 9E 05         [ 4]  663 	call row_erase
      009F2E 90 93            [ 1]  664 	ldw y,x 
      009F30 90 EE 02         [ 2]  665 	ldw y,(2,y)
      009F33 72 A9 00 80      [ 2]  666 	addw y,#BLOCK_SIZE
      009F37 EF 02            [ 2]  667 	ldw (2,x),y
      009F39 90 A3 48 00      [ 2]  668 	cpw y,#OPTION_BASE 
      009F3D 25 E9            [ 1]  669 	jrult 1$
                                    670 ;;; reset OPTION to default values
      009F3F 90 AE 00 01      [ 2]  671 	ldw y,#1 ; OPT1 
      009F43 FF               [ 2]  672 2$:	ldw (x),y   
      009F44 90 5F            [ 1]  673 	clrw y 
      009F46 EF 02            [ 2]  674 	ldw (2,x),y  ; ( 0 1 -- ) 
      009F48 CD 88 32         [ 4]  675 	call DDUP    ; ( 0 1 0 1 -- )  
      009F4B CD 9E F9         [ 4]  676 	call set_option
      009F4E 90 93            [ 1]  677 	ldw y,x 
      009F50 90 FE            [ 2]  678 	ldw y,(y)
      009F52 90 5C            [ 1]  679 	incw y  ; next OPTION 
      009F54 90 A3 00 08      [ 2]  680 	cpw y,#8 
      009F58 25 E9            [ 1]  681 	jrult 2$
                                    682 ;;; erase first row of app_space 	
      009F5A 90 AE B0 00      [ 2]  683 	ldw y,#app_space
      009F5E EF 02            [ 2]  684 	ldw (2,x),y  
      009F60 90 5F            [ 1]  685 	clrw y 
      009F62 FF               [ 2]  686 	ldw (x),y ; ( app_space 0 -- )
      009F63 CD 9E 05         [ 4]  687 	call row_erase 
                                    688 ; reset interrupt vectors 
      009F66 1D 00 02         [ 2]  689 	subw x,#CELLL 
      009F69 90 5F            [ 1]  690 	clrw y  
      009F6B FF               [ 2]  691 4$:	ldw (x),y  ; ( n -- ) int# 
      009F6C CD 86 18         [ 4]  692 	call DUPP  
      009F6F CD 9F 8C         [ 4]  693 	call reset_vector
      009F72 90 93            [ 1]  694 	ldw y,x 
      009F74 90 FE            [ 2]  695 	ldw y,(y)
      009F76 90 5C            [ 1]  696 	incw y   ; next vector 
      009F78 90 A3 00 19      [ 2]  697 	cpw y,#25 
      009F7C 25 ED            [ 1]  698 	jrult 4$
      009F7E CC 80 80         [ 2]  699 	jp NonHandledInterrupt ; reset MCU
                                    700 
                                    701 ;------------------------------
                                    702 ; reset an interrupt vector 
                                    703 ; to its initial value 
                                    704 ; i.e. NonHandledInterrupt
                                    705 ; RST-IVEC ( n -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                    706 ;-----------------------------
      009F81 9F 1C                  707 	.word LINK 
                           001F03   708 	LINK=. 
      009F83 08                     709 	.byte 8 
      009F84 52 53 54 2D 49 56 45   710 	.ascii "RST-IVEC"
             43
      009F8C                        711 reset_vector:
      009F8C 90 93            [ 1]  712 	ldw y,x
      009F8E 1C 00 02         [ 2]  713 	addw x,#CELLL 
      009F91 90 FE            [ 2]  714 	ldw y,(y)
      009F93 90 A3 00 17      [ 2]  715 	cpw y,#23 
      009F97 27 3A            [ 1]  716 	jreq 9$
      009F99 90 A3 00 1D      [ 2]  717 	cpw y,#29 ; last vector
      009F9D 22 34            [ 1]  718 	jrugt 9$  
      009F9F 90 58            [ 2]  719 	sllw y 
      009FA1 90 58            [ 2]  720 	sllw y 
      009FA3 72 A9 80 08      [ 2]  721 	addw y,#0x8008 ; irq0 address 
      009FA7 90 BF 28         [ 2]  722 	ldw YTEMP,y
      009FAA 1D 00 06         [ 2]  723 	subw x,#3*CELLL 
      009FAD EF 02            [ 2]  724 	ldw (2,x),y 
      009FAF 90 5F            [ 1]  725 	clrw y
      009FB1 FF               [ 2]  726 	ldw (x),y 
      009FB2 A6 82            [ 1]  727 	ld a,#0x82 
      009FB4 90 95            [ 1]  728 	ld yh,a
      009FB6 EF 04            [ 2]  729 	ldw (4,x),y
      009FB8 CD 9D DB         [ 4]  730 	call EESTORE
      009FBB 1D 00 06         [ 2]  731 	subw x,#3*CELLL
      009FBE 90 5F            [ 1]  732 	clrw y 
      009FC0 FF               [ 2]  733 	ldw (x),y 
      009FC1 90 AE 80 80      [ 2]  734 	ldw y,#NonHandledInterrupt
      009FC5 EF 04            [ 2]  735 	ldw (4,x),y 
      009FC7 90 BE 28         [ 2]  736 	ldw y,YTEMP  
      009FCA 72 A9 00 02      [ 2]  737 	addw y,#2
      009FCE EF 02            [ 2]  738 	ldw (2,x),y 
      009FD0 CD 9D DB         [ 4]  739 	call EESTORE
      009FD3 81               [ 4]  740 9$:	ret 
                                    741 
                                    742 
                                    743 ;------------------------------
                                    744 ; all interrupt vector with 
                                    745 ; an address >= a are resetted 
                                    746 ; to default
                                    747 ; CHKIVEC ( a -- )
                                    748 ;------------------------------
      009FD4 9F 83                  749 	.word LINK 
                           001F56   750 	LINK=.
      009FD6 07                     751 	.byte 7
      009FD7 43 48 4B 49 56 45 43   752 	.ascii "CHKIVEC"
                                    753 ;local variables 
                           000001   754 	SSP=1
                           000003   755 	CADR=3
                           000005   756 	OFS=5
                           000006   757 	VSIZE=6  
      009FDE                        758 CHKIVEC:
      009FDE 52 06            [ 2]  759 	sub sp,#VSIZE ;alloc local variables 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009FE0 90 93            [ 1]  760 	ldw y,x 
      009FE2 90 FE            [ 2]  761 	ldw y,(y)
      009FE4 17 03            [ 2]  762 	ldw (CADR,sp),y ; ca 
      009FE6 1F 01            [ 2]  763 	ldw (SSP,sp),x 
      009FE8 AE 80 0A         [ 2]  764 	ldw x,#0x800a ; irq0 address 
      009FEB BF 37            [ 2]  765 	ldw PTR16,X
      009FED AE FF FC         [ 2]  766 	ldw x,#-4 
      009FF0 1C 00 04         [ 2]  767 1$:	addw x,#4
      009FF3 A3 00 78         [ 2]  768 	cpw x,#30*4 ; irq0-29 
      009FF6 27 22            [ 1]  769 	jreq 9$
      009FF8 90 93            [ 1]  770 	ldw y,x  
      009FFA 91 D6 37         [ 4]  771 	ld a,([PTR16],y)
      009FFD 11 03            [ 1]  772 	cp a,(CADR,sp)
      009FFF 25 EF            [ 1]  773 	jrult 1$
      00A001 90 5C            [ 1]  774 	incw y 
      00A003 91 D6 37         [ 4]  775 	ld a,([PTR16],y)
      00A006 11 04            [ 1]  776 	cp a,(CADR+1,sp) 
      00A008 25 E6            [ 1]  777 	jrult 1$ 
      00A00A 1F 05            [ 2]  778 	ldw (OFS,sp),x 
      00A00C 54               [ 2]  779 	srlw x
      00A00D 54               [ 2]  780 	srlw x 
      00A00E 90 93            [ 1]  781 	ldw y,x 
      00A010 1E 01            [ 2]  782 	ldw x,(SSP,sp)
      00A012 FF               [ 2]  783 	ldw (x),y
      00A013 CD 9F 8C         [ 4]  784 	call reset_vector
      00A016 1E 05            [ 2]  785 	ldw x,(OFS,sp) 
      00A018 20 D6            [ 2]  786 	jra 1$
      00A01A 1E 01            [ 2]  787 9$:	ldw x,(SSP,sp) 
      00A01C 1C 00 02         [ 2]  788 	addw x,#CELLL 
      00A01F 5B 06            [ 2]  789 	addw sp,#VSIZE ; drop local variables  
      00A021 81               [ 4]  790 	ret 
                                    791 
                                    792 ;------------------------------
                                    793 ; set interrupt vector 
                                    794 ; SET-IVEC ( ud n -- )
                                    795 ;  ud Handler address
                                    796 ;  n  vector # 0 .. 29 
                                    797 ;-----------------------------
      00A022 9F D6                  798 	.word LINK
                           001FA4   799 	LINK=.
      00A024 08                     800 	.byte 8 
      00A025 53 45 54 2D 49 56 45   801 	.ascii "SET-IVEC" 
             43
      00A02D                        802 set_vector:
      00A02D 90 93            [ 1]  803     ldw y,x 
      00A02F 1C 00 02         [ 2]  804 	addw x,#CELLL 
      00A032 90 FE            [ 2]  805 	ldw y,(y) ; vector #
      00A034 90 A3 00 1D      [ 2]  806 	cpw y,#29 ; last vector
      00A038 23 04            [ 2]  807 	jrule 2$
      00A03A 1C 00 04         [ 2]  808 	addw x,#2*CELLL 
      00A03D 81               [ 4]  809 	ret
      00A03E 90 58            [ 2]  810 2$:	sllw y 
      00A040 90 58            [ 2]  811 	sllw y 
      00A042 72 A9 80 08      [ 2]  812 	addw y,#0X8008 ; IRQ0 vector address 
      00A046 90 BF 28         [ 2]  813 	ldw YTEMP,y ; vector address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      00A049 A6 82            [ 1]  814 	ld a,#0x82 
      00A04B 90 95            [ 1]  815 	ld yh,a 
      00A04D E6 01            [ 1]  816 	ld a,(1,x) ; isr address bits 23..16 
      00A04F 90 97            [ 1]  817 	ld yl,a 
                                    818 ;  write 0x82 + most significant byte of int address	
      00A051 1D 00 06         [ 2]  819 	subw x,#3*CELLL 
      00A054 EF 04            [ 2]  820 	ldw (4,x),y 
      00A056 90 BE 28         [ 2]  821 	ldw y,YTEMP
      00A059 EF 02            [ 2]  822 	ldw (2,x),y ; vector address 
      00A05B 90 5F            [ 1]  823 	clrw y 
      00A05D FF               [ 2]  824 	ldw (x),y   ; as a double 
      00A05E CD 9D DB         [ 4]  825 	call EESTORE 
      00A061 90 93            [ 1]  826 	ldw y,x 
      00A063 90 EE 02         [ 2]  827 	ldw y,(2,y) ; bits 15..0 int vector 
      00A066 1D 00 06         [ 2]  828 	subw x,#3*CELLL 
      00A069 EF 04            [ 2]  829 	ldw (4,x),y 
      00A06B 90 BE 28         [ 2]  830 	ldw y,YTEMP 
      00A06E 72 A9 00 02      [ 2]  831 	addw y,#2 
      00A072 EF 02            [ 2]  832 	ldw (2,x),y 
      00A074 90 5F            [ 1]  833 	clrw y 
      00A076 FF               [ 2]  834 	ldw (x),y 
      00A077 CD 9D DB         [ 4]  835 	call EESTORE
      00A07A 1C 00 04         [ 2]  836 	addw x,#2*CELLL  
      00A07D 81               [ 4]  837 9$: ret 
                                    838 
                                    839 
                                    840 ;------------------------
                                    841 ; Compile word to flash
                                    842 ; EE, (w -- )
                                    843 ;-----------------------
      00A07E A0 24                  844 	.word LINK
                           002000   845 	LINK=.
      00A080 03                     846 	.byte 3
      00A081 45 45 2C               847 	.ascii "EE,"
      00A084                        848 EE_COMMA:
      00A084 1D 00 04         [ 2]  849 	subw x,#2*CELLL 
      00A087 90 BE 1C         [ 2]  850 	ldw y,UCP
      00A08A 90 89            [ 2]  851 	pushw y 
      00A08C EF 02            [ 2]  852 	ldw (2,x),y 
      00A08E 90 5F            [ 1]  853 	clrw y 
      00A090 FF               [ 2]  854 	ldw (x),y
      00A091 CD 9D DB         [ 4]  855 	call EESTORE
      00A094 90 85            [ 2]  856 	popw y 
      00A096 72 A9 00 02      [ 2]  857 	addw y,#2
      00A09A 90 BF 1C         [ 2]  858 	ldw UCP,y
      00A09D 81               [ 4]  859 	ret 
                                    860 
                                    861 
                                    862 ;-------------------------
                                    863 ; Compile byte to flash 
                                    864 ; EEC, ( c -- )	
                                    865 ;-------------------------
      00A09E A0 80                  866 	.word LINK 
                           002020   867 	LINK=.
      00A0A0 04                     868 	.byte 4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      00A0A1 45 45 43 2C            869 	.ascii "EEC,"
      00A0A5                        870 EE_CCOMMA:
      00A0A5 1D 00 04         [ 2]  871 	subw x,#2*CELLL 
      00A0A8 90 BE 1C         [ 2]  872 	ldw y,UCP
      00A0AB 90 89            [ 2]  873 	pushw y 
      00A0AD EF 02            [ 2]  874 	ldw (2,x),y 
      00A0AF 90 5F            [ 1]  875 	clrw y 
      00A0B1 FF               [ 2]  876 	ldw (x),y
      00A0B2 CD 9D 8F         [ 4]  877 	call EECSTORE
      00A0B5 90 85            [ 2]  878 	popw y 
      00A0B7 90 5C            [ 1]  879 	incw y 
      00A0B9 90 BF 1C         [ 2]  880 	ldw UCP,y
      00A0BC 81               [ 4]  881 	ret 
                                    882 
                                    883 
                                    884 ;--------------------------
                                    885 ; copy FLASH block to ROWBUF
                                    886 ; ROW>BUF ( ud -- )
                                    887 ;--------------------------
      00A0BD A0 A0                  888 	.word LINK 
                           00203F   889 	LINK=.
      00A0BF 07                     890 	.byte 7 
      00A0C0 52 4F 57 3E 42 55 46   891 	.ascii "ROW>BUF"
      00A0C7                        892 ROW2BUF: 
      00A0C7 CD 9B 51         [ 4]  893 	call FPSTOR 
      00A0CA A6 80            [ 1]  894 	ld a,#BLOCK_SIZE
      00A0CC 88               [ 1]  895 	push a 
      00A0CD B4 38            [ 1]  896 	and a,PTR8 ; block align 
      00A0CF B7 38            [ 1]  897 	ld PTR8,a
      00A0D1 90 AE 16 80      [ 2]  898 	ldw y,#ROWBUFF 
      00A0D5 92 BC 00 36      [ 5]  899 1$: ldf a,[FPTR]
      00A0D9 90 F7            [ 1]  900 	ld (y),a
      00A0DB CD 9C CB         [ 4]  901 	call INC_FPTR
      00A0DE 90 5C            [ 1]  902 	incw y 
      00A0E0 0A 01            [ 1]  903 	dec (1,sp)
      00A0E2 26 F1            [ 1]  904 	jrne 1$ 
      00A0E4 84               [ 1]  905 	pop a 
      00A0E5 81               [ 4]  906 	ret 
                                    907 
                                    908 
                                    909 ;---------------------------
                                    910 ; copy ROWBUFF to flash 
                                    911 ; BUF>ROW ( ud -- )
                                    912 ; ud is row address as double 
                                    913 ;---------------------------
      00A0E6 A0 BF                  914 	.word LINK 
                           002068   915 	LINK=.
      00A0E8 07                     916 	.byte 7 
      00A0E9 42 55 46 3E 52 4F 57   917 	.ascii "BUF>ROW" 
      00A0F0                        918 BUF2ROW:
      00A0F0 CD 87 26         [ 4]  919 	call TBUF ; ( ud rb -- )
      00A0F3 CD 87 E6         [ 4]  920 	call ROT 
      00A0F6 CD 87 E6         [ 4]  921 	call ROT  ; ( rb ud -- )
      00A0F9 CD 9E C9         [ 4]  922 	call write_row 
      00A0FC 81               [ 4]  923 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



                                    924 
                                    925 ;---------------------------------
                                    926 ; how many byte free in that row 
                                    927 ; RFREE ( a -- n )
                                    928 ; a is least byte of target address
                                    929 ;----------------------------------
      00A0FD A0 E8                  930 	.word LINK 
                           00207F   931 	LINK=.
      00A0FF 05                     932 	.byte 5 
      00A100 52 46 52 45 45         933 	.ascii "RFREE"
      00A105                        934 RFREE:
      00A105 E6 01            [ 1]  935 	ld a,(1,x)
      00A107 A4 7F            [ 1]  936 	and a,#BLOCK_SIZE-1 
      00A109 B7 28            [ 1]  937 	ld YTEMP,a 
      00A10B A6 80            [ 1]  938 	ld a,#BLOCK_SIZE 
      00A10D B0 28            [ 1]  939 	sub a,YTEMP 
      00A10F 90 5F            [ 1]  940 	clrw y 
      00A111 90 97            [ 1]  941 	ld yl,a
      00A113 FF               [ 2]  942 	ldw (x),y 
      00A114 81               [ 4]  943 	ret 
                                    944 
                                    945 ;---------------------------------
                                    946 ; write u bytes to flash/EEPROM 
                                    947 ; constraint to row limit 
                                    948 ; RAM>EE ( ud a u -- u2 )
                                    949 ; ud flash address 
                                    950 ; a ram address 
                                    951 ; u bytes count
                                    952 ; return u2 bytes written  
                                    953 ;-------------------------------
      00A115 A0 FF                  954 	.word LINK 
                           002097   955 	LINK=. 
      00A117 06                     956 	.byte 6
      00A118 52 41 4D 3E 45 45      957 	.ascii "RAM>EE"
                                    958 	
      00A11E                        959 RAM2EE:
                                    960 ; copy ud on top 
      00A11E 90 93            [ 1]  961 	ldw y,x 
      00A120 90 EE 06         [ 2]  962 	ldw y,(6,y) ; LSW of ud  
      00A123 90 BF 28         [ 2]  963 	ldw YTEMP,y 
      00A126 90 93            [ 1]  964 	ldw y,x 
      00A128 90 EE 04         [ 2]  965 	ldw y,(4,y)  ; MSW of ud 
      00A12B 1D 00 04         [ 2]  966 	subw x,#2*CELLL 
      00A12E FF               [ 2]  967 	ldw (x),y 
      00A12F 90 BE 28         [ 2]  968 	ldw y,YTEMP 
      00A132 EF 02            [ 2]  969 	ldw (2,x),y 
      00A134 CD A0 C7         [ 4]  970 	call ROW2BUF 
      00A137 90 93            [ 1]  971 	ldw y,x 
      00A139 90 EE 06         [ 2]  972 	ldw y,(6,y)
      00A13C 90 89            [ 2]  973 	pushw y ; udl 
      00A13E 90 9F            [ 1]  974 	ld a,yl
      00A140 A4 7F            [ 1]  975 	and a,#BLOCK_SIZE-1 
      00A142 90 5F            [ 1]  976 	clrw y 
      00A144 90 97            [ 1]  977 	ld yl,a 
      00A146 72 A9 16 80      [ 2]  978 	addw y,#ROWBUFF 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      00A14A 1D 00 02         [ 2]  979 	subw x,#CELLL 
      00A14D FF               [ 2]  980 	ldw (x),y  
      00A14E CD 86 28         [ 4]  981 	call SWAPP ;  ( ud a ra u -- )
      00A151 CD 85 C2         [ 4]  982 	call RFROM  
      00A154 CD A1 05         [ 4]  983 	call RFREE 
      00A157 CD 89 80         [ 4]  984 	call MIN
      00A15A CD 86 18         [ 4]  985 	call DUPP 
      00A15D CD 85 E1         [ 4]  986 	call TOR  
      00A160 CD 8C EC         [ 4]  987 	call CMOVE
      00A163 CD A0 F0         [ 4]  988 	call BUF2ROW 
      00A166 CD 85 C2         [ 4]  989 	call RFROM 
      00A169 81               [ 4]  990 	ret 
                                    991 
                                    992 
                                    993 ;--------------------------
                                    994 ; expand 16 bit address 
                                    995 ; to 32 bit address 
                                    996 ; FADDR ( a -- ud )
                                    997 ;--------------------------
      00A16A A1 17                  998 	.word LINK 
                           0020EC   999 	LINK=. 
      00A16C 05                    1000 	.byte 5 
      00A16D 46 41 44 44 52        1001 	.ascii "FADDR"
      00A172                       1002 FADDR:
      00A172 CC 8B B1         [ 2] 1003 	jp ZERO 
                                   1004 
                                   1005 
                                   1006 ;--------------------------
                                   1007 ; move new colon definition to FLASH 
                                   1008 ; using WR-ROW for efficiency 
                                   1009 ; preserving bytes already used 
                                   1010 ; in the current block. 
                                   1011 ; At this point the compiler as completed
                                   1012 ; in RAM and pointers CP and CNTXT updated.
                                   1013 ; CNTXT point to nfa of new word and  
                                   1014 ; CP is after compiled word so CP-CNTXT+2=count to write 
                                   1015 ; 
                                   1016 ; FMOVE ( -- cp+ )
                                   1017 ; 
                                   1018 ;--------------------------
      00A175 A1 6C                 1019 	.word LINK 
                           0020F7  1020 	LINK=.
      00A177 05                    1021 	.byte 5 
      00A178 46 4D 4F 56 45        1022 	.ascii "FMOVE" 
      00A17D                       1023 FMOVE:
      00A17D CD 87 38         [ 4] 1024 	call TFLASH 
      00A180 CD 85 71         [ 4] 1025 	CALL AT 
      00A183 CD 85 26         [ 4] 1026 	CALL QBRAN 
      00A186 A2 01                 1027 	.word no_move  
      00A188 CD 87 87         [ 4] 1028 	call CPP
      00A18B CD 85 71         [ 4] 1029 	call AT  
      00A18E CD 86 18         [ 4] 1030 	call DUPP ; ( udl udl -- )
      00A191 CD 87 6B         [ 4] 1031 	call CNTXT 
      00A194 CD 85 71         [ 4] 1032 	call AT 
      00A197 CD 84 F3         [ 4] 1033 	call DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      00A19A 00 02                 1034 	.word 2 
      00A19C CD 88 C0         [ 4] 1035 	call SUBB ; ( udl udl a -- )
      00A19F CD 86 28         [ 4] 1036 	call SWAPP 
      00A1A2 CD A1 72         [ 4] 1037 	call FADDR 
      00A1A5 CD 87 E6         [ 4] 1038 	call ROT  ; ( udl ud a -- )
      00A1A8 CD 86 18         [ 4] 1039 	call DUPP 
      00A1AB CD 85 E1         [ 4] 1040 	call TOR    ; R: a 
      00A1AE                       1041 FMOVE2: 
      00A1AE CD 8C 9F         [ 4] 1042 	call HERE 
      00A1B1 CD 85 D5         [ 4] 1043 	call RAT 
      00A1B4 CD 88 C0         [ 4] 1044 	call SUBB ; (udl ud a wl -- )
      00A1B7                       1045 next_row:
      00A1B7 CD 86 18         [ 4] 1046 	call DUPP 
      00A1BA CD 85 E1         [ 4] 1047 	call TOR  ; ( udl ud a wl -- ) R: a wl
      00A1BD CD A1 1E         [ 4] 1048 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      00A1C0 CD 86 18         [ 4] 1049 	call DUPP 
      00A1C3 CD 85 E1         [ 4] 1050 	call TOR
      00A1C6 CD 88 47         [ 4] 1051 	call PLUS  ; ( udl+ ) 
      00A1C9 CD 86 18         [ 4] 1052 	call DUPP 
      00A1CC CD 8B B1         [ 4] 1053 	call ZERO   ; ( udl+ ud -- )
      00A1CF CD 85 C2         [ 4] 1054 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      00A1D2 CD 85 C2         [ 4] 1055 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      00A1D5 CD 86 42         [ 4] 1056 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      00A1D8 CD 88 C0         [ 4] 1057 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      00A1DB CD 86 18         [ 4] 1058 	call DUPP 
      00A1DE CD 85 26         [ 4] 1059 	call QBRAN
      00A1E1 A1 FA                 1060 	.word fmove_done 
      00A1E3 CD 86 28         [ 4] 1061 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      00A1E6 CD 85 C2         [ 4] 1062 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      00A1E9 CD 88 47         [ 4] 1063 	call PLUS  ; ( udl+2 ud wl- a+ )
      00A1EC CD 86 18         [ 4] 1064 	call DUPP 
      00A1EF CD 85 E1         [ 4] 1065 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      00A1F2 CD 86 28         [ 4] 1066 	call SWAPP 
      00A1F5 CD 85 3D         [ 4] 1067 	call BRAN
      00A1F8 A1 B7                 1068 	.word next_row  
      00A1FA                       1069 fmove_done:	
      00A1FA CD 85 C2         [ 4] 1070 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      00A1FD 1C 00 0A         [ 2] 1071 	addw x,#5*CELLL ; (  -- cp+ ) new CP 
      00A200 81               [ 4] 1072  	ret  
      00A201                       1073 no_move:
      00A201 CD 8B B1         [ 4] 1074 	call ZERO
      00A204 81               [ 4] 1075 	ret 
                                   1076 
                                   1077 ;------------------------------------------
                                   1078 ; adjust pointers after **FMOVE** operetion.
                                   1079 ; UPDAT-PTR ( cp+ -- )
                                   1080 ; cp+ is new CP position after FMOVE 
                                   1081 ;-------------------------------------------
      00A205 A1 77                 1082 	.word LINK 
                           002187  1083 	LINK=.
      00A207 09                    1084 	.byte 9
      00A208 55 50 44 41 54 2D 50  1085 	.ascii "UPDAT-PTR" 
             54 52
      00A211                       1086 UPDATPTR:
                                   1087 ;reset VP to previous position  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      00A211 CD 9B CB         [ 4] 1088 	call EEPVP 
      00A214 CD 86 0E         [ 4] 1089 	call DROP 
      00A217 CD 85 71         [ 4] 1090 	call AT
      00A21A CD 87 79         [ 4] 1091 	call VPP 
      00A21D CD 85 5A         [ 4] 1092 	call STORE
                                   1093 ;update CONTEXT and LAST 
      00A220 CD 9B B5         [ 4] 1094 	call EEPCP 
      00A223 CD 86 0E         [ 4] 1095 	call DROP
      00A226 CD 85 71         [ 4] 1096 	call AT
      00A229 CD 84 F3         [ 4] 1097 	call DOLIT 
      00A22C 00 02                 1098 	.word 2 
      00A22E CD 88 47         [ 4] 1099 	call PLUS 
      00A231 CD 86 18         [ 4] 1100 	call DUPP 
      00A234 CD 87 6B         [ 4] 1101 	call CNTXT 
      00A237 CD 85 5A         [ 4] 1102 	call STORE
      00A23A CD 87 97         [ 4] 1103 	call LAST
      00A23D CD 85 5A         [ 4] 1104 	call STORE 
      00A240 CD 9B E5         [ 4] 1105 	call UPDATLAST 
                                   1106 ;update CP 
      00A243 CD 87 87         [ 4] 1107 	call CPP 
      00A246 CD 85 5A         [ 4] 1108 	call STORE
      00A249 CD 9C 0E         [ 4] 1109 	call UPDATCP 
      00A24C 81               [ 4] 1110 	ret 
                                   1111 
                                   1112 ;-----------------------------
                                   1113 ; move interrupt sub-routine
                                   1114 ; in flash memory
                                   1115 ;----------------------------- 
      00A24D A2 07                 1116 	.word LINK 
                           0021CF  1117 	LINK=. 
      00A24F 06                    1118 	.byte 6
      00A250 49 46 4D 4F 56 45     1119 	.ascii "IFMOVE" 
      00A256                       1120 IFMOVE:
      00A256 CD 87 38         [ 4] 1121 	call TFLASH 
      00A259 CD 85 71         [ 4] 1122 	CALL AT 
      00A25C CD 85 26         [ 4] 1123 	CALL QBRAN 
      00A25F A2 01                 1124 	.word no_move 
      00A261 CD 87 87         [ 4] 1125 	call CPP 
      00A264 CD 85 71         [ 4] 1126 	call AT 
      00A267 CD 86 18         [ 4] 1127 	call DUPP ; ( udl udl -- )
      00A26A CD 9B CB         [ 4] 1128 	call EEPVP 
      00A26D CD 86 0E         [ 4] 1129 	call DROP
      00A270 CD 85 71         [ 4] 1130 	call AT  ; ( udl udl a )
      00A273 CD 85 E1         [ 4] 1131 	call TOR 
      00A276 CD A1 72         [ 4] 1132 	call FADDR
      00A279 CD 85 D5         [ 4] 1133 	call RAT ; ( udl ud a -- ) R: a 
      00A27C CC A1 AE         [ 2] 1134 	jp FMOVE2 
                                   1135 
                                   1136 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                           000001  4768 .if WANT_SCALING_CONST 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                                   4769         .include "const_ratio.asm"
                                      1 ;;
                                      2 ; Copyright Jacques Deschênes 2019,2020 
                                      3 ; This file is part of stm8_eForth  
                                      4 ;
                                      5 ;     stm8_eForth is free software: you can redistribute it and/or modify
                                      6 ;     it under the terms of the GNU General Public License as published by
                                      7 ;     the Free Software Foundation, either version 3 of the License, or
                                      8 ;     (at your option) any later version.
                                      9 ;
                                     10 ;     stm8_eForth is distributed in the hope that it will be useful,
                                     11 ;     but WITHOUT ANY WARRANTY; without even the implied warranty of
                                     12 ;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                     13 ;     GNU General Public License for more details.
                                     14 ;
                                     15 ;     You should have received a copy of the GNU General Public License
                                     16 ;     along with stm8_eForth.  If not, see <http://www.gnu.org/licenses/>.
                                     17 ;;
                                     18 
                                     19 ;--------------------------------------------------------------------
                                     20 ; Irrationals constants 
                                     21 ; expressed as 2 integers ratio
                                     22 ; aproximation. These are to be used with scaling operators */ and */MOD 
                                     23 ; REF: https://www.forth.com/starting-forth/5-fixed-point-arithmetic/
                                     24 ;---------------------------------------------------------------------
                                     25 
                                     26 ;       PI ( --  355 113 )
                                     27 ; precision 8.5e-8 
                                     28 ; usage example to compute circle area
                                     29 ; : CAREA DUP * PI */ ;
                                     30 ; 
      00A27F A2 4F                   31         .word LINK 
                           002201    32         LINK=.
      00A281 02                      33         .byte 2
      00A282 50 49                   34         .ascii "PI" 
      00A284                         35 PII:
      00A284 1D 00 04         [ 2]   36         subw x,#2*CELLL 
      00A287 90 AE 01 63      [ 2]   37         ldw y,#355 
      00A28B EF 02            [ 2]   38         ldw (2,x),y 
      00A28D 90 AE 00 71      [ 2]   39         ldw y,#113 
      00A291 FF               [ 2]   40         ldw (x),y 
      00A292 81               [ 4]   41         ret 
                                     42 
                                     43 ;      SQRT2 ( -- 19601  13860 )
                                     44 ; precision: 1.5e-9 
                                     45 ; usage example to compute Voltage peek to peek from Vrms 
                                     46 ; : VPP SQRT2 */ 2 * ;
                                     47 ;
      00A293 A2 81                   48         .word LINK 
                           002215    49         LINK=.
      00A295 05                      50         .byte 5 
      00A296 53 51 52 54 32          51         .ascii "SQRT2" 
      00A29B                         52 SQRT2:
      00A29B 1D 00 04         [ 2]   53         subw x,#2*CELLL 
      00A29E 90 AE 4C 91      [ 2]   54         ldw y,#19601 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      00A2A2 EF 02            [ 2]   55         ldw (2,x),y 
      00A2A4 90 AE 36 24      [ 2]   56         ldw y,#13860 
      00A2A8 FF               [ 2]   57         ldw (x),y 
      00A2A9 81               [ 4]   58         ret 
                                     59 
                                     60 ;   SQRT3 ( -- 18817 10864 )
                                     61 ; precision: 1.1e-9
                                     62 ;
      00A2AA A2 95                   63         .word LINK 
                           00222C    64         LINK=.
      00A2AC 05                      65         .byte 5
      00A2AD 53 51 52 54 33          66         .ascii "SQRT3" 
      00A2B2                         67 SQRT3: 
      00A2B2 1D 00 04         [ 2]   68     subw x,#2*CELLL 
      00A2B5 90 AE 49 81      [ 2]   69     ldw y,#18817 
      00A2B9 EF 02            [ 2]   70     ldw (2,x),y 
      00A2BB 90 AE 2A 70      [ 2]   71     ldw y,#10864 
      00A2BF FF               [ 2]   72     ldw (x),y 
      00A2C0 81               [ 4]   73     ret 
                                     74 
                                     75 ;   E ( -- 28667 10546 )
                                     76 ; precision: 5.5e-9 
                                     77 ; natural log base 
      00A2C1 A2 AC                   78         .word LINK 
                           002243    79         LINK=.
      00A2C3 01                      80         .byte 1
      00A2C4 45                      81         .ascii "E" 
      00A2C5                         82 ENEPER:
      00A2C5 1D 00 04         [ 2]   83     subw x,#2*CELLL 
      00A2C8 90 AE 6F FB      [ 2]   84     ldw y,#28667 
      00A2CC EF 02            [ 2]   85     ldw (2,x),y 
      00A2CE 90 AE 29 32      [ 2]   86     ldw y,#10546 
      00A2D2 FF               [ 2]   87     ldw (x),y 
      00A2D3 81               [ 4]   88     ret 
                                     89 
                                     90 ;   SQRT10 ( -- 22936 7253 )
                                     91 ; precision: 5.7e-9 
      00A2D4 A2 C3                   92         .word LINK 
                           002256    93         LINK=.
      00A2D6 06                      94         .byte 6 
      00A2D7 53 51 52 54 31 30       95         .ascii "SQRT10" 
      00A2DD                         96 SQRT10:
      00A2DD 1D 00 04         [ 2]   97     subw x,#2*CELLL
      00A2E0 90 AE 59 98      [ 2]   98     ldw y,#22936 
      00A2E4 EF 02            [ 2]   99     ldw (2,x),y 
      00A2E6 90 AE 1C 55      [ 2]  100     ldw y,#7253
      00A2EA FF               [ 2]  101     ldw (x),y 
      00A2EB 81               [ 4]  102     ret 
                                    103 
                                    104 ;   12RT2 ( -- 26797 25293 )
                                    105 ; precision: 1.0e-9 
                                    106 ; used in music to compute well tempered scale
      00A2EC A2 D6                  107         .word LINK 
                           00226E   108         LINK=. 
      00A2EE 05                     109         .byte 5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      00A2EF 31 32 52 54 32         110         .ascii "12RT2"
      00A2F4                        111 RT12_2:
      00A2F4 1D 00 04         [ 2]  112     subw x,#2*CELLL 
      00A2F7 90 AE 68 AD      [ 2]  113     ldw y,#26797
      00A2FB EF 02            [ 2]  114     ldw (2,x),y 
      00A2FD 90 AE 62 CD      [ 2]  115     ldw y,#25293
      00A301 FF               [ 2]  116     ldw (x),y 
      00A302 81               [ 4]  117     ret 
                                    118 
                                    119 ;   LOG2s ( -- 2040 11103 )
                                    120 ; log(2)/1.6384
                                    121 ; precision: 1.1e-8
      00A303 A2 EE                  122         .word LINK 
                           002285   123         LINK=.
      00A305 05                     124         .byte 5 
      00A306 4C 4F 47 32 53         125         .ascii "LOG2S" 
      00A30B                        126 LOG2S:
      00A30B 1D 00 04         [ 2]  127     subw x,#2*CELLL
      00A30E 90 AE 07 F8      [ 2]  128     ldw y,#2040 
      00A312 EF 02            [ 2]  129     ldw (2,x),y 
      00A314 90 AE 2B 5F      [ 2]  130     ldw y,#11103 
      00A318 FF               [ 2]  131     ldw (x),y 
      00A319 81               [ 4]  132     ret 
                                    133 
                                    134 ;   LN2 ( -- 485 11464 )
                                    135 ; ln(2)/16.384 
                                    136 ; precision: 1.0e-7 
      00A31A A3 05                  137         .word LINK 
                           00229C   138         LINK=.
      00A31C 04                     139         .byte 4 
      00A31D 4C 4E 32 53            140         .ascii "LN2S" 
      00A321                        141 LN2S: 
      00A321 1D 00 04         [ 2]  142     subw x,#2*CELLL
      00A324 90 AE 01 E5      [ 2]  143     ldw y,#485
      00A328 EF 02            [ 2]  144     ldw (2,x),y 
      00A32A 90 AE 2C C8      [ 2]  145     ldw y,#11464 
      00A32E FF               [ 2]  146     ldw (x),y 
      00A32F 81               [ 4]  147     ret 
                                    148 
                                    149 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



                                   4770 .endif
                           000001  4771 .if WANT_CONST_TABLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



                                   4772         .include "ctable.asm"
                                      1 ;;
                                      2 ; Copyright Jacques Deschênes 2019,2020 
                                      3 ; This file is part of stm8_eForth  
                                      4 ;
                                      5 ;     stm8_eForth is free software: you can redistribute it and/or modify
                                      6 ;     it under the terms of the GNU General Public License as published by
                                      7 ;     the Free Software Foundation, either version 3 of the License, or
                                      8 ;     (at your option) any later version.
                                      9 ;
                                     10 ;     stm8_eForth is distributed in the hope that it will be useful,
                                     11 ;     but WITHOUT ANY WARRANTY; without even the implied warranty of
                                     12 ;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                     13 ;     GNU General Public License for more details.
                                     14 ;
                                     15 ;     You should have received a copy of the GNU General Public License
                                     16 ;     along with stm8_eForth.  If not, see <http://www.gnu.org/licenses/>.
                                     17 ;;
                                     18 
                                     19 ;------------------------------
                                     20 ; words to create and read 
                                     21 ; constants tables in FLASH 
                                     22 ; and EEPROM
                                     23 ;------------------------------
                                     24 
                                     25 ;-----------------------------
                                     26 ; allocate space in CODE area 
                                     27 ; for constant table.
                                     28 ; CALLOT ( u -- ad )
                                     29 ; u  bytes to allocates 
                                     30 ; ad data address as double.
                                     31 ;-----------------------------
      00A330 A3 1C                   32     .word LINK 
                           0022B2    33     LINK=.
      00A332 06                      34     .byte 6
      00A333 43 41 4C 4C 4F 54       35     .ascii "CALLOT"
      00A339                         36 CALLOT:
      00A339 CD 87 87         [ 4]   37     CALL CPP
      00A33C CD 86 18         [ 4]   38     CALL DUPP 
      00A33F CD 85 71         [ 4]   39     CALL AT 
      00A342 CD 85 E1         [ 4]   40     CALL TOR 
      00A345 CD 8C 21         [ 4]   41     CALL PSTOR 
      00A348 CD 9C 0E         [ 4]   42     CALL UPDATCP 
      00A34B CD 85 C2         [ 4]   43     CALL RFROM
      00A34E CC 8B B1         [ 2]   44     JP ZERO 
                                     45 
                                     46 ;------------------------------
                                     47 ; create constants bytes table 
                                     48 ; in persistant memory
                                     49 ;  CTABLE ( n+ -- ad ; <string> )
                                     50 ; n+ bytes reserved 
                                     51 ;-----------------------------
      00A351 A3 32                   52     .word LINK 
                           0022D3    53     LINK=.
      00A353 06                      54     .byte 6
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      00A354 43 54 41 42 4C 45       55     .ascii "CTABLE"
      00A35A                         56 CTABLE:
      00A35A CD A3 39         [ 4]   57     CALL CALLOT     
      00A35D CC 99 10         [ 2]   58     JP DCONST 
                                     59      
                                     60 
                                     61 ;--------------------------------
                                     62 ; create constants words table 
                                     63 ; in persistant memory 
                                     64 ; WTABLE ( n+ -- ad ; <string> )
                                     65 ; n+  words reserved  
                                     66 ;--------------------------------
      00A360 A3 53                   67     .word LINK 
                           0022E2    68     LINK=.
      00A362 06                      69     .byte 6
      00A363 57 54 41 42 4C 45       70     .ascii "WTABLE"
      00A369                         71 WTABLE:
      00A369 CD 8B 38         [ 4]   72     CALL CELLS  
      00A36C CD A3 39         [ 4]   73     CALL CALLOT 
      00A36F CC 99 10         [ 2]   74     JP DCONST 
                                     75 
                                     76 ;---------------------------------
                                     77 ; stack an element of CTABLE 
                                     78 ; CTABL@ ( u ad -- c )
                                     79 ; u element order {0..size-1}
                                     80 ; a|ad table address 
                                     81 ;--------------------------------
      00A372 A3 62                   82     .word LINK 
                           0022F4    83     LINK=.
      00A374 06                      84     .byte 6
      00A375 43 54 41 42 4C 40       85     .ascii "CTABL@" 
      00A37B                         86 CTAT:
      00A37B CD 9B 51         [ 4]   87     call FPSTOR 
      00A37E CD 9C E3         [ 4]   88     call PTRPLUS 
      00A381 CC 9D 20         [ 2]   89     jp EE_CREAD 
                                     90 
                                     91 ;---------------------------------
                                     92 ; stack an element of WTABLE 
                                     93 ; WTABL@ ( u ud -- w )
                                     94 ; u is element order {0..size-1}
                                     95 ; a|ud table address 
                                     96 ;----------------------------------
      00A384 A3 74                   97     .word LINK 
                           002306    98     LINK=.
      00A386 06                      99     .byte 6
      00A387 57 54 41 42 4C 40      100     .ascii "WTABL@" 
      00A38D                        101 WTAT:
      00A38D CD 9B 51         [ 4]  102     call FPSTOR 
      00A390 CD 8B 38         [ 4]  103     call CELLS 
      00A393 CD 9C E3         [ 4]  104     call PTRPLUS 
      00A396 CD 9C FE         [ 4]  105     call EE_READ 
      00A399 81               [ 4]  106     ret 
                                    107 
                                    108 ;--------------------------
                                    109 ; tool to initialize character table 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



                                    110 ; CTINIT ( ad -- )
                                    111 ; ad is table address 
                                    112 ;--------------------------
      00A39A A3 86                  113     .word LINK 
                           00231C   114     LINK=.
      00A39C 06                     115     .byte 6 
      00A39D 43 54 49 4E 49 54      116     .ascii "CTINIT"
      00A3A3                        117 CTINIT:
      00A3A3 CD 9B 51         [ 4]  118     CALL FPSTOR
      00A3A6 CD 9C 8F         [ 4]  119     CALL UNLOCK
      00A3A9 CD 8B B1         [ 4]  120     CALL ZERO 
      00A3AC CD 8B 45         [ 4]  121 1$: CALL ONEP 
      00A3AF CD 86 18         [ 4]  122     CALL DUPP 
      00A3B2 CD A3 FF         [ 4]  123     CALL INTQ 
      00A3B5 CD 85 26         [ 4]  124     CALL QBRAN 
      00A3B8 A3 C2                  125     .word 2$
      00A3BA CD 9D 3A         [ 4]  126     call WR_BYTE 
      00A3BD CD 85 3D         [ 4]  127     CALL BRAN 
      00A3C0 A3 AC                  128     .word 1$ 
      00A3C2 CD 88 27         [ 4]  129 2$: CALL DDROP 
      00A3C5 CD 9C B7         [ 4]  130     CALL LOCK 
      00A3C8 81               [ 4]  131     ret 
                                    132 
                                    133 ;--------------------------
                                    134 ; tool to initialize word table 
                                    135 ; WTINIT ( ad -- )
                                    136 ; ad is table address 
                                    137 ;--------------------------
      00A3C9 A3 9C                  138     .word LINK 
                           00234B   139     LINK=.
      00A3CB 06                     140     .byte 6 
      00A3CC 57 54 49 4E 49 54      141     .ascii "WTINIT"
      00A3D2                        142 WTINIT:
      00A3D2 CD 9B 51         [ 4]  143     CALL FPSTOR
      00A3D5 CD 9C 8F         [ 4]  144     CALL UNLOCK
      00A3D8 CD 8B B1         [ 4]  145     CALL ZERO 
      00A3DB CD 8B 45         [ 4]  146 1$: CALL ONEP 
      00A3DE CD 86 18         [ 4]  147     CALL DUPP
      00A3E1 CD A3 FF         [ 4]  148     CALL INTQ
      00A3E4 CD 85 26         [ 4]  149     CALL QBRAN 
      00A3E7 A3 F1                  150     .word 2$
      00A3E9 CD 9D 5F         [ 4]  151     call WR_WORD 
      00A3EC CD 85 3D         [ 4]  152     CALL BRAN 
      00A3EF A3 DB                  153     .word 1$ 
      00A3F1 CD 88 27         [ 4]  154 2$: CALL DDROP 
      00A3F4 CD 9C B7         [ 4]  155     CALL LOCK 
      00A3F7 81               [ 4]  156     ret 
                                    157 
                                    158 ;------------------------
                                    159 ; Prompted input for integer 
                                    160 ; display n+ in bracket and
                                    161 ; '?' 
                                    162 ; [N]? ( n+ -- a )
                                    163 ;------------------------
      00A3F8 A3 CB                  164     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



                           00237A   165     LINK=.
      00A3FA 04                     166     .byte 4
      00A3FB 5B 4E 5D 3F            167     .ascii "[N]?" 
      00A3FF                        168 INTQ:
      00A3FF CD 8F 40         [ 4]  169     CALL CR 
      00A402 CD 84 F3         [ 4]  170     call DOLIT 
      00A405 00 5B                  171     .word '[
      00A407 CD 84 B8         [ 4]  172     CALL EMIT 
      00A40A CD 8F F9         [ 4]  173     CALL DOT 
      00A40D CD 8F 7F         [ 4]  174     CALL  DOTQP
      00A410 03                     175     .byte 3
      00A411 5D 3F 20               176     .ascii "]? " 
      00A414 CD 93 88         [ 4]  177     CALL QUERY 
      00A417 CD 91 B3         [ 4]  178     call TOKEN 
      00A41A CC A4 71         [ 2]  179     jp NUMBQ
                                    180 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



                                   4773 .endif
                           000001  4774 .if WANT_DOUBLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



                                   4775         .include "double.asm"
                                      1 ;************************************
                                      2 ;    doubles integers library 
                                      3 ;    doubles are signed 32 bits 
                                      4 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      5 
                                      6 
                                      7     .module DOUBLE 
                                      8 
                                      9 ; get all digits in row 
                                     10 ; stop at first non-digit or end of string 
                                     11 ; ( dlo dhi a cntr -- dlo dhi [ a+ cntr- | a+ 0 ] )
      00A41D                         12 parse_digits:
      00A41D CD 85 E1         [ 4]   13     CALL TOR ; dlo dhi a R: cntr 
      00A420                         14 1$:
      00A420 CD 8C 88         [ 4]   15     CALL COUNT ; dlo dhi a+ c 
      00A423 CD 86 E8         [ 4]   16     CALL BASE 
      00A426 CD 85 71         [ 4]   17     CALL AT 
      00A429 CD 8E 80         [ 4]   18     CALL DIGTQ 
      0023AC                         19     _QBRAN 4$ ; not a digit
      00A42C CD 85 26         [ 4]    1     CALL QBRAN
      00A42F A4 60                    2     .word 4$
      00A431 CD A8 39         [ 4]   20     CALL DTOR  ; dlo dhi R: cntr a+ c  
      00A434 CD 86 E8         [ 4]   21     CALL BASE 
      00A437 CD 85 71         [ 4]   22     CALL AT 
      00A43A CD A6 71         [ 4]   23     CALL DSSTAR
      00A43D CD 85 C2         [ 4]   24     CALL RFROM 
      00A440 CD 8B B1         [ 4]   25     CALL ZERO 
      00A443 CD AA 1F         [ 4]   26     CALL DPLUS 
      00A446 CD 85 C2         [ 4]   27     CALL RFROM  ; dlo dhi a+ 
      00A449 CD 85 C2         [ 4]   28     CALL RFROM ; dlo dhi a+ cntr 
      00A44C CD 8B 52         [ 4]   29     CALL ONEM 
      00A44F CD 86 18         [ 4]   30     CALL DUPP 
      0023D2                         31     _QBRAN 2$ 
      00A452 CD 85 26         [ 4]    1     CALL QBRAN
      00A455 A4 5F                    2     .word 2$
      00A457 CD 85 E1         [ 4]   32     CALL TOR  
      0023DA                         33     _BRAN 1$ ; dlo dhi a+ R: cntr 
      00A45A CD 85 3D         [ 4]    1     CALL BRAN 
      00A45D A4 20                    2     .word 1$ 
      00A45F                         34 2$: ; end of string ( dlo hi a+ 0 )
      00A45F 81               [ 4]   35     RET 
      00A460 CD 86 0E         [ 4]   36 4$: CALL DROP  ; dlo dhi a+ 
      00A463 CD 85 C2         [ 4]   37     CALL RFROM ; dlo dhi a+ cntr- 
      00A466 81               [ 4]   38     RET 
                                     39 
                                     40 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     41 ;   NUMBER? (a -- s|d T | a F )
                                     42 ;   convert string to integer 
                                     43 ;   double begin with '#' 
                                     44 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0023E7                         45     _HEADER NUMBQ,7,"NUMBER?"
      00A467 A3 FA                    1         .word LINK 
                           0023E9     2         LINK=.
      00A469 07                       3         .byte 7  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      00A46A 4E 55 4D 42 45 52 3F     4         .ascii "NUMBER?"
      00A471                          5         NUMBQ:
                                     46 ; save current base value 
      00A471 CD 86 E8         [ 4]   47     CALL BASE 
      00A474 CD 85 71         [ 4]   48     CALL AT 
      00A477 CD 85 E1         [ 4]   49     CALL TOR 
                                     50 ; initialize integer to 0     
      00A47A 1D 00 04         [ 2]   51     SUBW X,#4 
      00A47D 90 5F            [ 1]   52     CLRW Y 
      00A47F FF               [ 2]   53     LDW (X),Y 
      00A480 EF 02            [ 2]   54     LDW (2,X),Y ; a 0 0 R: base  
      002402                         55     _DOLIT 2 
      00A482 CD 84 F3         [ 4]    1     CALL DOLIT 
      00A485 00 02                    2     .word 2 
      00A487 CD 8C 0A         [ 4]   56     CALL PICK  ; a 0 0 a R: base    
      00A48A CD 8C 88         [ 4]   57     CALL COUNT ; a 0 0 a+ n 
                                     58 ; check for '#' double integer 
      00A48D CD 86 42         [ 4]   59     CALL OVER  ; a 0 0 a+ n a+
      00A490 CD 85 8F         [ 4]   60     CALL CAT   ; a 0 0 a+ n c 
      002413                         61     _DOLIT '#' ; a 0 0 a+ n c '#' 
      00A493 CD 84 F3         [ 4]    1     CALL DOLIT 
      00A496 00 23                    2     .word '#' 
      00A498 CD 88 E8         [ 4]   62     CALL EQUAL 
      00A49B CD 85 E1         [ 4]   63     CALL TOR   ; a 0 0 a+ n R: base d? 
      00A49E CD 85 D5         [ 4]   64     CALL RAT   ; a 0 0 a+ n d? R: base d?
      002421                         65     _QBRAN NUMQ0
      00A4A1 CD 85 26         [ 4]    1     CALL QBRAN
      00A4A4 A4 B2                    2     .word NUMQ0
                                     66 ; update a and count
      00A4A6 CD 86 28         [ 4]   67     CALL SWAPP 
      00A4A9 CD 8B 45         [ 4]   68     CALL ONEP 
      00A4AC CD 86 28         [ 4]   69     CALL SWAPP 
      00A4AF CD 8B 52         [ 4]   70     CALL ONEM  ; a 0 0 a+ n- R: base d?
                                     71 ; check for '$' hexadecimal  
      00A4B2                         72 NUMQ0: 
      00A4B2 CD 86 42         [ 4]   73     CALL OVER   
      00A4B5 CD 85 8F         [ 4]   74     CALL CAT   
      002438                         75     _DOLIT '$'
      00A4B8 CD 84 F3         [ 4]    1     CALL DOLIT 
      00A4BB 00 24                    2     .word '$' 
      00A4BD CD 88 E8         [ 4]   76     CALL EQUAL ; a 0 0 a+ n- f  
      002440                         77     _QBRAN NUMQ1 
      00A4C0 CD 85 26         [ 4]    1     CALL QBRAN
      00A4C3 A4 D4                    2     .word NUMQ1
      00A4C5 CD 8E 57         [ 4]   78     CALL HEX   ; switch to hexadecimal base 
                                     79 ; update a and count 
      00A4C8 CD 86 28         [ 4]   80     CALL SWAPP 
      00A4CB CD 8B 45         [ 4]   81     CALL ONEP 
      00A4CE CD 86 28         [ 4]   82     CALL SWAPP
      00A4D1 CD 8B 52         [ 4]   83     CALL ONEM ; a 0 0 a+ n-  R: base d?
                                     84 ; check for minus sign 
      00A4D4                         85 NUMQ1:    
      00A4D4 CD 86 42         [ 4]   86     CALL OVER 
      00A4D7 CD 85 8F         [ 4]   87     CALL CAT   
      00245A                         88     _DOLIT '-' 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00A4DA CD 84 F3         [ 4]    1     CALL DOLIT 
      00A4DD 00 2D                    2     .word '-' 
      00A4DF CD 88 E8         [ 4]   89     CALL EQUAL 
      00A4E2 CD 85 E1         [ 4]   90     CALL TOR ; R: base d? sign  
                                     91 ; update a and n, if sign==0 no change  
      00A4E5 CD 85 D5         [ 4]   92     CALL RAT   
      00A4E8 CD 88 47         [ 4]   93     CALL PLUS  
      00A4EB CD 86 28         [ 4]   94     CALL SWAPP 
      00A4EE CD 85 D5         [ 4]   95     CALL RAT 
      00A4F1 CD 88 C0         [ 4]   96     CALL SUBB  
      00A4F4 CD 86 28         [ 4]   97     CALL SWAPP 
                                     98 ; check for end of string     
      00A4F7 CD 87 D5         [ 4]   99     CALL QDUP    ; a dlo dhi a+ cntr R: base d? sign 
      00247A                        100     _QBRAN NUMQ4 ; yes , not a number 
      00A4FA CD 85 26         [ 4]    1     CALL QBRAN
      00A4FD A5 39                    2     .word NUMQ4
      00A4FF CD A4 1D         [ 4]  101     CALL parse_digits
      00A502 CD 86 63         [ 4]  102     CALL ZEQUAL  
      002485                        103     _QBRAN NUMQ4 ; error not end of string  ( a dlo dhi a+ R: base d? sign )
      00A505 CD 85 26         [ 4]    1     CALL QBRAN
      00A508 A5 39                    2     .word NUMQ4
      00A50A CD 86 0E         [ 4]  104     CALL DROP  ; a dlo dhi 
      00A50D CD 85 C2         [ 4]  105     CALL RFROM  ; a dlo dhi sign 
      002490                        106     _QBRAN NUMQ3
      00A510 CD 85 26         [ 4]    1     CALL QBRAN
      00A513 A5 18                    2     .word NUMQ3
      00A515 CD 88 84         [ 4]  107     CALL DNEGA
      00A518                        108 NUMQ3: 
      00A518 CD 87 E6         [ 4]  109     CALL ROT ; dlo dhi a  R: base d?
      00A51B CD 86 0E         [ 4]  110     CALL DROP
      00249E                        111     _DOLIT -1  
      00A51E CD 84 F3         [ 4]    1     CALL DOLIT 
      00A521 FF FF                    2     .word -1 
      00A523 CD 85 C2         [ 4]  112     CALL RFROM ; dlo dhi d? R: base 
      00A526 CD 88 61         [ 4]  113     CALL INVER 
      0024A9                        114     _QBRAN NUMQ8 
      00A529 CD 85 26         [ 4]    1     CALL QBRAN
      00A52C A5 41                    2     .word NUMQ8
      00A52E CD 86 28         [ 4]  115     CALL SWAPP 
      00A531 CD 86 0E         [ 4]  116     CALL DROP 
      0024B4                        117     _BRAN NUMQ8
      00A534 CD 85 3D         [ 4]    1     CALL BRAN 
      00A537 A5 41                    2     .word NUMQ8 
      00A539                        118 NUMQ4: ; not end of string error , ( a dlo dhi a+ R: base d? sign )
      00A539 1C 00 04         [ 2]  119     ADDW X,#4 ; drop dhi a+  , ( a dlo R: base d? sign ) 
      00A53C 5B 04            [ 2]  120     ADDW SP,#4 ; drop d? sign  R: base 
      00A53E 90 5F            [ 1]  121     CLRW Y 
      00A540 FF               [ 2]  122     LDW (X),Y ; dlo replaced by 0 ( -- a 0 R: base ) 
                                    123 ; restore original base value     
      00A541                        124 NUMQ8: 
      00A541 CD 85 C2         [ 4]  125     CALL RFROM 
      00A544 CD 86 E8         [ 4]  126     CALL BASE 
      00A547 CD 85 5A         [ 4]  127     CALL STORE 
      00A54A 81               [ 4]  128     RET 
                                    129 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



                                    130 
                                    131 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    132 ;    D0= ( d -- 0|-1 )
                                    133 ;    check if double is 0 
                                    134 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0024CB                        135     _HEADER DZEQUAL,3,"D0="
      00A54B A4 69                    1         .word LINK 
                           0024CD     2         LINK=.
      00A54D 03                       3         .byte 3  
      00A54E 44 30 3D                 4         .ascii "D0="
      00A551                          5         DZEQUAL:
      00A551 CD 86 8B         [ 4]  136     CALL ORR 
      00A554 A6 FF            [ 1]  137     LD A,#0xFF
      00A556 90 93            [ 1]  138     LDW Y,X
      00A558 90 FE            [ 2]  139     LDW Y,(Y)
      00A55A 90 A3 00 00      [ 2]  140     CPW Y,#0 
      00A55E 27 01            [ 1]  141     JREQ  ZEQ1
      00A560 4F               [ 1]  142     CLR A   ;false
      00A561                        143 ZEQ1:
      00A561 F7               [ 1]  144     LD     (X),A
      00A562 E7 01            [ 1]  145     LD (1,X),A
      00A564 81               [ 4]  146 	RET     
                                    147     
                                    148 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    149 ;  DNEGATE ( d -- d )
                                    150 ;  negate double (2's complement)
                                    151 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0024E5                        152     _HEADER DNEGAT,7,"DNEGATE"
      00A565 A5 4D                    1         .word LINK 
                           0024E7     2         LINK=.
      00A567 07                       3         .byte 7  
      00A568 44 4E 45 47 41 54 45     4         .ascii "DNEGATE"
      00A56F                          5         DNEGAT:
      00A56F CD 88 61         [ 4]  153     CALL INVER
      00A572 CD 86 28         [ 4]  154     CALL SWAPP 
      00A575 CD 88 61         [ 4]  155     CALL INVER 
      00A578 90 93            [ 1]  156     LDW  Y,X 
      00A57A 90 FE            [ 2]  157     LDW Y,(Y)
      00A57C 72 A9 00 01      [ 2]  158     ADDW Y,#1 
      00A580 FF               [ 2]  159     LDW (X),Y 
      00A581 24 0B            [ 1]  160     JRNC DNEG1 
      00A583 90 93            [ 1]  161     LDW Y,X 
      00A585 90 EE 02         [ 2]  162     LDW Y,(2,Y)
      00A588 72 A9 00 01      [ 2]  163     ADDW Y,#1
      00A58C EF 02            [ 2]  164     LDW (2,X),Y 
      00A58E                        165 DNEG1:
      00A58E CD 86 28         [ 4]  166     CALL SWAPP 
      00A591 81               [ 4]  167     RET      
                                    168 
                                    169 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    170 ;   DABS ( d -- d )
                                    171 ;   absolute value of double
                                    172 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002512                        173     _HEADER DABS,4,"DABS"
      00A592 A5 67                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



                           002514     2         LINK=.
      00A594 04                       3         .byte 4  
      00A595 44 41 42 53              4         .ascii "DABS"
      00A599                          5         DABS:
      00A599 CD 86 18         [ 4]  174     CALL DUPP 
      00A59C CD 86 51         [ 4]  175     CALL ZLESS 
      00251F                        176     _QBRAN DABS1 
      00A59F CD 85 26         [ 4]    1     CALL QBRAN
      00A5A2 A5 A7                    2     .word DABS1
      00A5A4 CD 88 84         [ 4]  177     CALL DNEGA 
      00A5A7                        178 DABS1:
      00A5A7 81               [ 4]  179     RET 
                                    180 
                                    181 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    182 ;  DSIGN ( d -- d f )
                                    183 ;  sign of double 
                                    184 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002528                        185     _HEADER DSIGN,5,"DSIGN"
      00A5A8 A5 94                    1         .word LINK 
                           00252A     2         LINK=.
      00A5AA 05                       3         .byte 5  
      00A5AB 44 53 49 47 4E           4         .ascii "DSIGN"
      00A5B0                          5         DSIGN:
      00A5B0 A6 00            [ 1]  186     LD A,#0 
      00A5B2 90 93            [ 1]  187     LDW Y,X 
      00A5B4 90 FE            [ 2]  188     LDW Y,(Y)
      00A5B6 2A 02            [ 1]  189     JRPL DSIGN1
      00A5B8 A6 FF            [ 1]  190     LD A,#0XFF 
      00A5BA                        191 DSIGN1:
      00A5BA 1D 00 02         [ 2]  192     SUBW X,#2 
      00A5BD F7               [ 1]  193     LD (X),A 
      00A5BE E7 01            [ 1]  194     LD (1,X),A 
      00A5C0 81               [ 4]  195     RET 
                                    196 
                                    197 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    198 ;   D/MOD ( d s - r qd )
                                    199 ;   unsigned divide double by single 
                                    200 ;   return double quotient 
                                    201 ;   and single remainder 
                                    202 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002541                        203     _HEADER DSLMOD,5,"D/MOD"
      00A5C1 A5 AA                    1         .word LINK 
                           002543     2         LINK=.
      00A5C3 05                       3         .byte 5  
      00A5C4 44 2F 4D 4F 44           4         .ascii "D/MOD"
      00A5C9                          5         DSLMOD:
      00A5C9 90 93            [ 1]  204         LDW     Y,X             ; stack pointer to Y
      00A5CB FE               [ 2]  205         LDW     X,(X)           ; un
      00A5CC BF 28            [ 2]  206         LDW     YTEMP,X         ; save un
      00A5CE 93               [ 1]  207         LDW     X,Y
      00A5CF 89               [ 2]  208         PUSHW   X               ; save stack pointer
      00A5D0 90 89            [ 2]  209         PUSHW   Y 
      00A5D2 EE 02            [ 2]  210         LDW     X,(2,X)           ; X=udh
      00A5D4 90 BE 28         [ 2]  211         LDW     Y,YTEMP         ; divisor 
      00A5D7 65               [ 2]  212         DIVW    X,Y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00A5D8 BF 26            [ 2]  213         LDW     XTEMP,X         ; QUOTIENT hi 
      00A5DA 93               [ 1]  214         LDW     X,Y             ; remainder in X 
      00A5DB 90 85            [ 2]  215         POPW    Y 
      00A5DD 90 EE 04         [ 2]  216         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      00A5E0 A6 10            [ 1]  217         LD      A,#16           ; loop count
      00A5E2 90 58            [ 2]  218         SLLW    Y               ; udl shift udl into udh
      00A5E4                        219 DSLMOD3:
      00A5E4 59               [ 2]  220         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      00A5E5 25 04            [ 1]  221         JRC     DSLMODa         ; if carry out of rotate
      00A5E7 B3 28            [ 2]  222         CPW     X,YTEMP         ; compare udh to un
      00A5E9 25 05            [ 1]  223         JRULT   DSLMOD4         ; can't subtract
      00A5EB                        224 DSLMODa:
      00A5EB 72 B0 00 28      [ 2]  225         SUBW    X,YTEMP         ; can subtract
      00A5EF 98               [ 1]  226         RCF
      00A5F0                        227 DSLMOD4:
      00A5F0 8C               [ 1]  228         CCF                     ; quotient bit
      00A5F1 90 59            [ 2]  229         RLCW    Y               ; rotate into quotient, rotate out udl
      00A5F3 4A               [ 1]  230         DEC     A               ; repeat
      00A5F4 26 EE            [ 1]  231         JRNE    DSLMOD3           ; if A == 0
      00A5F6                        232 DSLMODb:
      00A5F6 BF 28            [ 2]  233         LDW     YTEMP,X         ; done, save remainder
      00A5F8 85               [ 2]  234         POPW    X               ; restore stack pointer
      00A5F9 EF 02            [ 2]  235         LDW     (2,X),Y           ; save quotient low 
      00A5FB 90 BE 26         [ 2]  236         LDW     Y,XTEMP         ; quotient hi 
      00A5FE FF               [ 2]  237         LDW     (X),Y           ; save quotient hi 
      00A5FF 90 BE 28         [ 2]  238         LDW     Y,YTEMP         ; remainder onto stack
      00A602 EF 04            [ 2]  239         LDW     (4,X),Y
      00A604 81               [ 4]  240         RET 
                                    241 
                                    242 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    243 ;   D# ( d -- d )
                                    244 ;   extract least digit 
                                    245 ;   from double integer 
                                    246 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002585                        247     _HEADER DDIG,2,"D#"
      00A605 A5 C3                    1         .word LINK 
                           002587     2         LINK=.
      00A607 02                       3         .byte 2  
      00A608 44 23                    4         .ascii "D#"
      00A60A                          5         DDIG:
      00A60A CD 86 E8         [ 4]  248     CALL BASE 
      00A60D CD 85 71         [ 4]  249     CALL AT 
      00A610 CD A5 C9         [ 4]  250     CALL DSLMOD
      00A613 CD 87 E6         [ 4]  251     CALL ROT   
      00A616 CD 8D 80         [ 4]  252     CALL DIGIT 
      00A619 CD 8D CC         [ 4]  253     CALL HOLD 
      00A61C 81               [ 4]  254     RET 
                                    255 
                                    256 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    257 ;    D#S ( d -- s )
                                    258 ;   extract digit from double 
                                    259 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00259D                        260     _HEADER DDIGS,3,"D#S"
      00A61D A6 07                    1         .word LINK 
                           00259F     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      00A61F 03                       3         .byte 3  
      00A620 44 23 53                 4         .ascii "D#S"
      00A623                          5         DDIGS:
      00A623 CD A6 0A         [ 4]  261     CALL    DDIG 
      00A626 CD 88 32         [ 4]  262     CALL    DDUP 
      00A629 CD A5 51         [ 4]  263     CALL    DZEQUAL
      0025AC                        264     _QBRAN  DDIGS 
      00A62C CD 85 26         [ 4]    1     CALL QBRAN
      00A62F A6 23                    2     .word DDIGS
      00A631 CD 86 0E         [ 4]  265     CALL    DROP 
      00A634 81               [ 4]  266     RET 
                                    267 
                                    268 
                                    269 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    270 ;   D. ( d -- )
                                    271 ;   display double integer 
                                    272 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025B5                        273     _HEADER DDOT,2,"D."
      00A635 A6 1F                    1         .word LINK 
                           0025B7     2         LINK=.
      00A637 02                       3         .byte 2  
      00A638 44 2E                    4         .ascii "D."
      00A63A                          5         DDOT:
      00A63A CD 8E F8         [ 4]  274     CALL SPACE 
      00A63D CD A5 B0         [ 4]  275     CALL DSIGN 
      00A640 CD 85 E1         [ 4]  276     CALL TOR
      00A643 CD 85 D5         [ 4]  277     CALL RAT 
      0025C6                        278     _QBRAN DDOT0
      00A646 CD 85 26         [ 4]    1     CALL QBRAN
      00A649 A6 4E                    2     .word DDOT0
      00A64B CD 88 84         [ 4]  279     CALL DNEGA 
      00A64E                        280 DDOT0:     
      00A64E CD 8D BC         [ 4]  281     CALL BDIGS 
      00A651 CD A6 23         [ 4]  282     CALL DDIGS 
      00A654 CD 85 C2         [ 4]  283     CALL RFROM 
      0025D7                        284     _QBRAN DDOT1 
      00A657 CD 85 26         [ 4]    1     CALL QBRAN
      00A65A A6 64                    2     .word DDOT1
      0025DC                        285     _DOLIT '-' 
      00A65C CD 84 F3         [ 4]    1     CALL DOLIT 
      00A65F 00 2D                    2     .word '-' 
      00A661 CD 8D CC         [ 4]  286     CALL HOLD 
      00A664                        287 DDOT1: 
      00A664 CD 8E 21         [ 4]  288     CALL EDIGS 
      00A667 CD 8F 22         [ 4]  289     CALL TYPES     
      00A66A 81               [ 4]  290     RET 
                                    291 
                                    292 
                                    293 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    294 ; multiply double by single 
                                    295 ; return double 
                                    296 ;  ( d s -- d )
                                    297 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025EB                        298     _HEADER DSSTAR,3,"DS*"
      00A66B A6 37                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



                           0025ED     2         LINK=.
      00A66D 03                       3         .byte 3  
      00A66E 44 53 2A                 4         .ascii "DS*"
      00A671                          5         DSSTAR:
                                    299 ;DSSTAR:
      00A671 CD 85 E1         [ 4]  300     CALL TOR
      00A674 CD 86 18         [ 4]  301     CALL DUPP 
      00A677 CD 86 51         [ 4]  302     CALL ZLESS
      00A67A CD 86 18         [ 4]  303     CALL DUPP 
      00A67D CD 85 E1         [ 4]  304     CALL TOR 
      002600                        305     _QBRAN DSSTAR1 
      00A680 CD 85 26         [ 4]    1     CALL QBRAN
      00A683 A6 88                    2     .word DSSTAR1
      00A685 CD 88 84         [ 4]  306     CALL DNEGA 
      00A688                        307 DSSTAR1:
      00A688 CD 85 C2         [ 4]  308     CALL RFROM 
      00A68B CD 88 05         [ 4]  309     CALL NROT       
      00A68E CD 86 28         [ 4]  310     CALL SWAPP 
      00A691 CD 85 D5         [ 4]  311     CALL RAT 
      00A694 CD 8A 7A         [ 4]  312     CALL UMSTA
      00A697 CD 87 E6         [ 4]  313     CALL ROT 
      00A69A CD 85 C2         [ 4]  314     CALL RFROM 
      00A69D CD 8A 7A         [ 4]  315     CALL UMSTA 
      00A6A0 CD 86 0E         [ 4]  316     CALL DROP ; DROP OVERFLOW 
      00A6A3 CD 88 47         [ 4]  317     CALL PLUS 
      00A6A6 CD 87 E6         [ 4]  318     CALL ROT 
      002629                        319     _QBRAN DSSTAR3 
      00A6A9 CD 85 26         [ 4]    1     CALL QBRAN
      00A6AC A6 B1                    2     .word DSSTAR3
      00A6AE CD 88 84         [ 4]  320     CALL DNEGA 
      00A6B1                        321 DSSTAR3:
      00A6B1 81               [ 4]  322     RET 
                                    323 
                                    324 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    325 ;  2SWAP ( d1 d2 -- d2 d1 )
                                    326 ;  swap double 
                                    327 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002632                        328     _HEADER DSWAP,5,"2SWAP"
      00A6B2 A6 6D                    1         .word LINK 
                           002634     2         LINK=.
      00A6B4 05                       3         .byte 5  
      00A6B5 32 53 57 41 50           4         .ascii "2SWAP"
      00A6BA                          5         DSWAP:
      00A6BA 90 93            [ 1]  329     LDW Y,X 
      00A6BC 90 FE            [ 2]  330     LDW Y,(Y)
      00A6BE 90 BF 28         [ 2]  331     LDW YTEMP,Y ; d2 hi 
      00A6C1 90 93            [ 1]  332     LDW Y,X 
      00A6C3 90 EE 02         [ 2]  333     LDW Y,(2,Y)
      00A6C6 90 BF 26         [ 2]  334     LDW XTEMP,Y  ; d2 lo 
      00A6C9 90 93            [ 1]  335     LDW Y,X 
      00A6CB 90 EE 04         [ 2]  336     LDW Y,(4,Y)  ; d1 hi 
      00A6CE FF               [ 2]  337     LDW (X),Y 
      00A6CF 90 93            [ 1]  338     LDW Y,X
      00A6D1 90 EE 06         [ 2]  339     LDW Y,(6,Y)  ; d1 lo 
      00A6D4 EF 02            [ 2]  340     LDW (2,X),Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      00A6D6 90 BE 28         [ 2]  341     LDW Y,YTEMP  
      00A6D9 EF 04            [ 2]  342     LDW (4,X),Y 
      00A6DB 90 BE 26         [ 2]  343     LDW Y,XTEMP 
      00A6DE EF 06            [ 2]  344     LDW (6,X),Y 
      00A6E0 81               [ 4]  345     RET 
                                    346 
                                    347 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    348 ;    DCLZ ( d -- u )
                                    349 ;    double count leading zeros
                                    350 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002661                        351     _HEADER DCLZ,4,"DCLZ"
      00A6E1 A6 B4                    1         .word LINK 
                           002663     2         LINK=.
      00A6E3 04                       3         .byte 4  
      00A6E4 44 43 4C 5A              4         .ascii "DCLZ"
      00A6E8                          5         DCLZ:
      00A6E8 4F               [ 1]  352     CLR A 
      00A6E9 90 93            [ 1]  353     LDW Y,X 
      00A6EB 90 FE            [ 2]  354     LDW Y,(Y)
      00A6ED 2B 15            [ 1]  355     JRMI DCLZ8 ; no leading zero 
      00A6EF 27 06            [ 1]  356     JREQ DCLZ4 ; >=16 
      00A6F1                        357 DCLZ1: ; <16
      00A6F1 90 58            [ 2]  358     SLLW Y 
      00A6F3 2B 0F            [ 1]  359     JRMI DCLZ8 
      00A6F5 20 FA            [ 2]  360     JRA DCLZ1 
      00A6F7                        361 DCLZ4:
      00A6F7 A6 10            [ 1]  362     LD A,#16 
      00A6F9 90 93            [ 1]  363     LDW Y,X 
      00A6FB 90 EE 02         [ 2]  364     LDW Y,(2,Y)
      00A6FE 2B 04            [ 1]  365     JRMI DCLZ8 
      00A700 26 EF            [ 1]  366     JRNE DCLZ1 
      00A702 AB 10            [ 1]  367     ADD A,#16
      00A704                        368 DCLZ8: 
      00A704 1C 00 02         [ 2]  369     ADDW X,#2 
      00A707 90 5F            [ 1]  370     CLRW Y 
      00A709 90 97            [ 1]  371     LD YL,A 
      00A70B FF               [ 2]  372     LDW (X),Y 
      00A70C 81               [ 4]  373     RET 
                                    374 
                                    375 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    376 ;   2<ROT ( d1 d2 d3 -- d3 d1 d2 )
                                    377 ;   rotate left doubles 
                                    378 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00268D                        379     _HEADER NDROT,5,"2<ROT"
      00A70D A6 E3                    1         .word LINK 
                           00268F     2         LINK=.
      00A70F 05                       3         .byte 5  
      00A710 32 3C 52 4F 54           4         .ascii "2<ROT"
      00A715                          5         NDROT:
                                    380 ; save d3 in temp 
      00A715 90 93            [ 1]  381     LDW Y,X 
      00A717 90 FE            [ 2]  382     LDW Y,(Y)
      00A719 90 BF 28         [ 2]  383     LDW YTEMP,Y  ; d3 hi 
      00A71C 90 93            [ 1]  384     LDW Y,X 
      00A71E 90 EE 02         [ 2]  385     LDW Y,(2,Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      00A721 90 BF 26         [ 2]  386     LDW XTEMP,Y  ; d3 lo 
                                    387 ; put d2 in d1 slot 
      00A724 90 93            [ 1]  388     LDW Y,X 
      00A726 90 EE 04         [ 2]  389     LDW Y,(4,Y) 
      00A729 FF               [ 2]  390     LDW (X),Y   ; d2 hi 
      00A72A 90 93            [ 1]  391     LDW Y,X 
      00A72C 90 EE 06         [ 2]  392     LDW Y,(6,Y)
      00A72F EF 02            [ 2]  393     LDW (2,X),Y ; d2 lo
                                    394 ; put d1 in d2 slot 
      00A731 90 93            [ 1]  395     LDW Y,X 
      00A733 90 EE 08         [ 2]  396     LDW Y,(8,Y) 
      00A736 EF 04            [ 2]  397     LDW (4,X),Y ; d1 hi 
      00A738 90 93            [ 1]  398     LDW Y,X 
      00A73A 90 EE 0A         [ 2]  399     LDW Y,(10,Y)
      00A73D EF 06            [ 2]  400     LDW (6,X),Y  ; d1 lo 
                                    401 ; put d3 in d1 slot 
      00A73F 90 BE 28         [ 2]  402     LDW Y,YTEMP 
      00A742 EF 08            [ 2]  403     LDW (8,X),Y  ; d3 hi 
      00A744 90 BE 26         [ 2]  404     LDW Y,XTEMP 
      00A747 EF 0A            [ 2]  405     LDW (10,X),Y  ; d3 lo 
      00A749 81               [ 4]  406     RET 
                                    407 
                                    408 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    409 ;   2ROT ( d1 d2 d3 -- d2 d3 d1 )
                                    410 ;   rotate right doubles 
                                    411 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026CA                        412     _HEADER DROT,4,"2ROT"
      00A74A A7 0F                    1         .word LINK 
                           0026CC     2         LINK=.
      00A74C 04                       3         .byte 4  
      00A74D 32 52 4F 54              4         .ascii "2ROT"
      00A751                          5         DROT:
                                    413 ; save d3 in temp 
      00A751 90 93            [ 1]  414     LDW Y,X 
      00A753 90 FE            [ 2]  415     LDW Y,(Y)
      00A755 90 BF 28         [ 2]  416     LDW YTEMP,Y ; d3 hi 
      00A758 90 93            [ 1]  417     LDW Y,X 
      00A75A 90 EE 02         [ 2]  418     LDW Y,(2,Y)
      00A75D 90 BF 26         [ 2]  419     LDW XTEMP,Y ; d3 lo 
                                    420 ; put d1 in d3 slot 
      00A760 90 93            [ 1]  421     LDW Y,X 
      00A762 90 EE 08         [ 2]  422     LDW Y,(8,Y)
      00A765 FF               [ 2]  423     LDW (X),Y  ; d1 hi 
      00A766 90 93            [ 1]  424     LDW Y,X 
      00A768 90 EE 0A         [ 2]  425     LDW Y,(10,Y) 
      00A76B EF 02            [ 2]  426     LDW (2,X),Y ; d1 lo 
                                    427 ; put d2 in d1 slot 
      00A76D 90 93            [ 1]  428     LDW Y,X 
      00A76F 90 EE 04         [ 2]  429     LDW Y,(4,Y) ; d2 hi 
      00A772 EF 08            [ 2]  430     LDW (8,X),Y 
      00A774 90 93            [ 1]  431     LDW Y,X 
      00A776 90 EE 06         [ 2]  432     LDW Y,(6,Y) ; d2 lo 
      00A779 EF 0A            [ 2]  433     LDW (10,X),Y 
                                    434 ; put d3 in d2 slot 
      00A77B 90 BE 28         [ 2]  435     LDW Y,YTEMP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      00A77E EF 04            [ 2]  436     LDW (4,X),Y 
      00A780 90 BE 26         [ 2]  437     LDW Y,XTEMP 
      00A783 EF 06            [ 2]  438     LDW (6,X),Y 
      00A785 81               [ 4]  439     RET 
                                    440 
                                    441 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    442 ;   D= ( d1 d2 -- f )
                                    443 ;   d1==d2?
                                    444 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002706                        445     _HEADER DEQUAL,2,"D="
      00A786 A7 4C                    1         .word LINK 
                           002708     2         LINK=.
      00A788 02                       3         .byte 2  
      00A789 44 3D                    4         .ascii "D="
      00A78B                          5         DEQUAL:
      00A78B A6 00            [ 1]  446     LD A,#0 
      00A78D 90 93            [ 1]  447     LDW Y,X 
      00A78F 90 FE            [ 2]  448     LDW Y,(Y)
      00A791 E3 04            [ 2]  449     CPW Y,(4,X)
      00A793 26 0B            [ 1]  450     JRNE DEQU4 
      00A795 90 93            [ 1]  451     LDW Y,X 
      00A797 90 EE 02         [ 2]  452     LDW Y,(2,Y)
      00A79A E3 06            [ 2]  453     CPW Y,(6,X)
      00A79C 26 02            [ 1]  454     JRNE DEQU4 
      00A79E A6 FF            [ 1]  455     LD A,#0XFF
      00A7A0                        456 DEQU4:
      00A7A0 1C 00 06         [ 2]  457     ADDW X,#6
      00A7A3 F7               [ 1]  458     LD (X),A 
      00A7A4 E7 01            [ 1]  459     LD (1,X),A 
      00A7A6 81               [ 4]  460     RET 
                                    461 
                                    462 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    463 ;   D> ( d1 d2 -- f )
                                    464 ;   d1>d2?
                                    465 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002727                        466     _HEADER DGREAT,2,"D>"
      00A7A7 A7 88                    1         .word LINK 
                           002729     2         LINK=.
      00A7A9 02                       3         .byte 2  
      00A7AA 44 3E                    4         .ascii "D>"
      00A7AC                          5         DGREAT:
      00A7AC A6 00            [ 1]  467     LD A,#0 
      00A7AE 90 93            [ 1]  468     LDW Y,X 
      00A7B0 90 EE 04         [ 2]  469     LDW Y,(4,Y)  ; d1 hi 
      00A7B3 F3               [ 2]  470     CPW Y,(X)    ; d2 hi 
      00A7B4 2F 0B            [ 1]  471     JRSLT DGREAT4 
      00A7B6 90 93            [ 1]  472     LDW Y,X 
      00A7B8 90 EE 06         [ 2]  473     LDW Y,(6,Y)
      00A7BB E3 02            [ 2]  474     CPW Y,(2,X)
      00A7BD 2D 02            [ 1]  475     JRSLE DGREAT4 
      00A7BF A6 FF            [ 1]  476     LD A,#0XFF
      00A7C1                        477 DGREAT4:
      00A7C1 1C 00 06         [ 2]  478     ADDW X,#6
      00A7C4 F7               [ 1]  479     LD (X),A 
      00A7C5 E7 01            [ 1]  480     LD (1,X),A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      00A7C7 81               [ 4]  481     RET
                                    482 
                                    483 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    484 ;   D< ( d1 d2 -- f )
                                    485 ;   d1<d2? 
                                    486 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002748                        487     _HEADER DLESS,2,"D<"
      00A7C8 A7 A9                    1         .word LINK 
                           00274A     2         LINK=.
      00A7CA 02                       3         .byte 2  
      00A7CB 44 3C                    4         .ascii "D<"
      00A7CD                          5         DLESS:
      00A7CD A6 00            [ 1]  488     LD A,#0 
      00A7CF 90 93            [ 1]  489     LDW Y,X 
      00A7D1 90 EE 04         [ 2]  490     LDW Y,(4,Y)
      00A7D4 F3               [ 2]  491     CPW Y,(X)
      00A7D5 2C 0B            [ 1]  492     JRSGT DLESS4 
      00A7D7 90 93            [ 1]  493     LDW Y,X 
      00A7D9 90 EE 06         [ 2]  494     LDW Y,(6,Y)
      00A7DC E3 02            [ 2]  495     CPW Y,(2,X)
      00A7DE 2E C0            [ 1]  496     JRSGE DEQU4 
      00A7E0 A6 FF            [ 1]  497     LD A,#0XFF
      00A7E2                        498 DLESS4:
      00A7E2 1C 00 06         [ 2]  499     ADDW X,#6
      00A7E5 F7               [ 1]  500     LD (X),A 
      00A7E6 E7 01            [ 1]  501     LD (1,X),A 
      00A7E8 81               [ 4]  502     RET
                                    503 
                                    504 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    505 ;  D0< ( d -- f )
                                    506 ;  d<0? 
                                    507 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002769                        508     _HEADER DZLESS,3,"D0<"
      00A7E9 A7 CA                    1         .word LINK 
                           00276B     2         LINK=.
      00A7EB 03                       3         .byte 3  
      00A7EC 44 30 3C                 4         .ascii "D0<"
      00A7EF                          5         DZLESS:
      00A7EF A6 00            [ 1]  509     LD A,#0 
      00A7F1 90 93            [ 1]  510     LDW Y,X 
      00A7F3 90 FE            [ 2]  511     LDW Y,(Y)
      00A7F5 2A 02            [ 1]  512     JRPL DZLESS1 
      00A7F7 A6 FF            [ 1]  513     LD A,#0XFF 
      00A7F9                        514 DZLESS1:
      00A7F9 1C 00 02         [ 2]  515     ADDW X,#2 
      00A7FC F7               [ 1]  516     LD (X),A 
      00A7FD E7 01            [ 1]  517     LD (1,X),A    
      00A7FF 81               [ 4]  518     RET 
                                    519 
                                    520 
                                    521 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    522 ;  DCMP ( d1 d2 -- d1 d2 -1|0|1 )
                                    523 ; compare 2 doubles 
                                    524 ; keep the doubles 
                                    525 ; return flag: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



                                    526 ;    -1 if d1<d2 
                                    527 ;     0 if d1==d2
                                    528 ;     1 if d1>d2 
                                    529 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002780                        530     _HEADER DCMP,4,"DCMP"
      00A800 A7 EB                    1         .word LINK 
                           002782     2         LINK=.
      00A802 04                       3         .byte 4  
      00A803 44 43 4D 50              4         .ascii "DCMP"
      00A807                          5         DCMP:
      00A807 90 93            [ 1]  531     LDW Y,X 
      00A809 90 EE 04         [ 2]  532     LDW Y,(4,Y)
      00A80C F3               [ 2]  533     CPW Y,(X) 
      00A80D 27 04            [ 1]  534     JREQ DCMP2 
      00A80F 2F 13            [ 1]  535     JRSLT DCMP_SMALL 
      00A811 20 17            [ 2]  536     JRA  DCMP_GREAT 
      00A813                        537 DCMP2:    
      00A813 90 93            [ 1]  538     LDW Y,X 
      00A815 90 EE 06         [ 2]  539     LDW Y,(6,Y)
      00A818 E3 02            [ 2]  540     CPW Y,(2,X)
      00A81A 27 04            [ 1]  541     JREQ DCMP_EQUAL  
      00A81C 25 06            [ 1]  542     JRULT DCMP_SMALL 
      00A81E 20 0A            [ 2]  543     JRA DCMP_GREAT
      00A820                        544 DCMP_EQUAL:
      00A820 90 5F            [ 1]  545     CLRW Y 
      00A822 20 0A            [ 2]  546     JRA DCMP4 
      00A824                        547 DCMP_SMALL:
      00A824 90 AE FF FF      [ 2]  548     LDW Y,#-1 
      00A828 20 04            [ 2]  549     JRA DCMP4 
      00A82A                        550 DCMP_GREAT:
      00A82A 90 AE 00 01      [ 2]  551     LDW Y,#1
      00A82E                        552 DCMP4:
      00A82E 1D 00 02         [ 2]  553     SUBW X,#2 
      00A831 FF               [ 2]  554     LDW (X),Y 
      00A832 81               [ 4]  555     RET
                                    556 
                                    557 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    558 ;   2>R ( d -- R: d )
                                    559 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027B3                        560     _HEADER DTOR,3,"2>R"
      00A833 A8 02                    1         .word LINK 
                           0027B5     2         LINK=.
      00A835 03                       3         .byte 3  
      00A836 32 3E 52                 4         .ascii "2>R"
      00A839                          5         DTOR:
      00A839 90 85            [ 2]  561     POPW Y 
      00A83B 90 BF 28         [ 2]  562     LDW YTEMP,Y 
      00A83E 90 93            [ 1]  563     LDW Y,X 
      00A840 90 EE 02         [ 2]  564     LDW Y,(2,Y)
      00A843 90 89            [ 2]  565     PUSHW Y   ; d low 
      00A845 90 93            [ 1]  566     LDW Y,X 
      00A847 90 FE            [ 2]  567     LDW Y,(Y)
      00A849 90 89            [ 2]  568     PUSHW Y   ; d hi 
      00A84B 1C 00 04         [ 2]  569     ADDW X,#4  
      00A84E 92 CC 28         [ 5]  570     JP [YTEMP]
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



                                    571 
                                    572 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    573 ;  2R> ( -- d ) R: d --      
                                    574 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027D1                        575     _HEADER DRFROM,3,"2R>"
      00A851 A8 35                    1         .word LINK 
                           0027D3     2         LINK=.
      00A853 03                       3         .byte 3  
      00A854 32 52 3E                 4         .ascii "2R>"
      00A857                          5         DRFROM:
      00A857 90 85            [ 2]  576     POPW Y      ; d hi 
      00A859 90 BF 28         [ 2]  577     LDW YTEMP,Y 
      00A85C 1D 00 04         [ 2]  578     SUBW X,#4
      00A85F 90 85            [ 2]  579     POPW Y       ; d hi 
      00A861 FF               [ 2]  580     LDW (X),Y 
      00A862 90 85            [ 2]  581     POPW Y       ; d low  
      00A864 EF 02            [ 2]  582     LDW (2,X),Y 
      00A866 92 CC 28         [ 5]  583     JP [YTEMP]
                                    584     
                                    585 
                                    586 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    587 ;  2VARIABLE <name> 
                                    588 ;  create a double variable 
                                    589 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027E9                        590     _HEADER DVARIA,9,"2VARIABLE"
      00A869 A8 53                    1         .word LINK 
                           0027EB     2         LINK=.
      00A86B 09                       3         .byte 9  
      00A86C 32 56 41 52 49 41 42     4         .ascii "2VARIABLE"
             4C 45
      00A875                          5         DVARIA:
      00A875 CD 8C 9F         [ 4]  591         CALL HERE
      00A878 CD 86 18         [ 4]  592         CALL DUPP
      0027FB                        593         _DOLIT 4  
      00A87B CD 84 F3         [ 4]    1     CALL DOLIT 
      00A87E 00 04                    2     .word 4 
      00A880 CD 88 47         [ 4]  594         CALL PLUS 
      00A883 CD 87 79         [ 4]  595         CALL VPP 
      00A886 CD 85 5A         [ 4]  596         CALL STORE
      00A889 CD 98 77         [ 4]  597         CALL CREAT
      00A88C CD 86 18         [ 4]  598         CALL DUPP
      00A88F CD 94 F9         [ 4]  599         CALL COMMA
      00A892 CD 8B B1         [ 4]  600         CALL ZERO
      00A895 CD 86 42         [ 4]  601         CALL OVER 
      00A898 CD 85 5A         [ 4]  602         CALL STORE 
      00A89B CD 8B B1         [ 4]  603         CALL ZERO 
      00A89E CD 86 28         [ 4]  604         CALL SWAPP 
      00A8A1 CD 85 5A         [ 4]  605         CALL STORE
      00A8A4 CD A1 7D         [ 4]  606         CALL FMOVE ; move definition to FLASH
      00A8A7 CD 87 D5         [ 4]  607         CALL QDUP 
      00A8AA CD 85 26         [ 4]  608         CALL QBRAN 
      00A8AD 98 C4                  609         .word SET_RAMLAST   
      00A8AF CD 9C 25         [ 4]  610         call UPDATVP  ; don't update if variable kept in RAM.
      00A8B2 CD A2 11         [ 4]  611         CALL UPDATPTR
      00A8B5 81               [ 4]  612         RET         
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



                                    613 
                                    614 
                                    615 
                                    616 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    617 ;  2LITERAL ( d -- )
                                    618 ;  compile double literal 
                                    619 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002836                        620     _HEADER DLITER,IMEDD+8,"2LITERAL"
      00A8B6 A8 6B                    1         .word LINK 
                           002838     2         LINK=.
      00A8B8 88                       3         .byte IMEDD+8  
      00A8B9 32 4C 49 54 45 52 41     4         .ascii "2LITERAL"
             4C
      00A8C1                          5         DLITER:
      00A8C1 CD 95 3E         [ 4]  621     CALL COMPI 
      00A8C4 A8 CC                  622     .word do2lit 
      00A8C6 CD 94 F9         [ 4]  623     CALL COMMA 
      00A8C9 CC 94 F9         [ 2]  624     JP   COMMA 
                                    625 
                                    626 
                                    627 ; runtime for 2LITERAL 
      00A8CC                        628 do2lit:
      00A8CC 1D 00 04         [ 2]  629     SUBW X,#4 
      00A8CF 16 01            [ 2]  630     LDW Y,(1,SP)
      00A8D1 90 FE            [ 2]  631     LDW Y,(Y)
      00A8D3 FF               [ 2]  632     LDW (X),Y 
      00A8D4 16 01            [ 2]  633     LDW Y,(1,SP)
      00A8D6 90 EE 02         [ 2]  634     LDW Y,(2,Y)
      00A8D9 EF 02            [ 2]  635     LDW (2,X),Y 
      00A8DB 90 85            [ 2]  636     POPW Y 
      00A8DD 90 EC 04         [ 2]  637     JP (4,Y)
                                    638 
                                    639 
                                    640 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    641 ;   2OVER ( d1 d2 -- d1 d2 d1 )
                                    642 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002860                        643     _HEADER DOVER,5,"2OVER"
      00A8E0 A8 B8                    1         .word LINK 
                           002862     2         LINK=.
      00A8E2 05                       3         .byte 5  
      00A8E3 32 4F 56 45 52           4         .ascii "2OVER"
      00A8E8                          5         DOVER:
      00A8E8 90 93            [ 1]  644     LDW Y,X 
      00A8EA 1D 00 04         [ 2]  645     SUBW X,#4 
      00A8ED 90 89            [ 2]  646     PUSHW Y 
      00A8EF 90 EE 04         [ 2]  647     LDW Y,(4,Y)  ; d1 hi 
      00A8F2 FF               [ 2]  648     LDW (X),Y 
      00A8F3 90 85            [ 2]  649     POPW Y 
      00A8F5 90 EE 06         [ 2]  650     LDW Y,(6,Y)  ;d1 lo 
      00A8F8 EF 02            [ 2]  651     LDW (2,X),Y 
      00A8FA 81               [ 4]  652     RET 
                                    653 
                                    654 
                                    655 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    656 ;   D2/ ( d -- d/2 )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



                                    657 ;   divide double by 2 
                                    658 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00287B                        659     _HEADER D2SLASH,3,"D2/"
      00A8FB A8 E2                    1         .word LINK 
                           00287D     2         LINK=.
      00A8FD 03                       3         .byte 3  
      00A8FE 44 32 2F                 4         .ascii "D2/"
      00A901                          5         D2SLASH:
      00A901 90 93            [ 1]  660     LDW Y,X 
      00A903 90 FE            [ 2]  661     LDW Y,(Y)
      00A905 90 57            [ 2]  662     SRAW Y 
      00A907 FF               [ 2]  663     LDW (X),Y 
      00A908 90 93            [ 1]  664     LDW Y,X 
      00A90A 90 EE 02         [ 2]  665     LDW Y,(2,Y)
      00A90D 90 56            [ 2]  666     RRCW Y 
      00A90F EF 02            [ 2]  667     LDW (2,X),Y 
      00A911 81               [ 4]  668     RET
                                    669 
                                    670 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    671 ;   DLSHIFT ( d n -- d )
                                    672 ;   left shift double 
                                    673 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002892                        674     _HEADER DLSHIFT,7,"DLSHIFT"
      00A912 A8 FD                    1         .word LINK 
                           002894     2         LINK=.
      00A914 07                       3         .byte 7  
      00A915 44 4C 53 48 49 46 54     4         .ascii "DLSHIFT"
      00A91C                          5         DLSHIFT:
      00A91C E6 01            [ 1]  675     LD A,(1,X) ; shift count 
      00A91E 1C 00 02         [ 2]  676     ADDW X,#2 
      00A921 90 93            [ 1]  677     LDW Y,X 
      00A923 90 FE            [ 2]  678     LDW Y,(Y)
      00A925 90 BF 28         [ 2]  679     LDW YTEMP,Y  ; d hi 
      00A928 90 93            [ 1]  680     LDW Y,X 
      00A92A 90 EE 02         [ 2]  681     LDW Y,(2,Y)  ; d low 
      00A92D                        682 DLSHIFT1:
      00A92D 4D               [ 1]  683     TNZ A 
      00A92E 27 12            [ 1]  684     JREQ DLSHIFT2 
      00A930 98               [ 1]  685     RCF 
      00A931 90 59            [ 2]  686     RLCW Y 
      00A933 90 89            [ 2]  687     PUSHW Y 
      00A935 90 BE 28         [ 2]  688     LDW Y,YTEMP 
      00A938 90 59            [ 2]  689     RLCW Y 
      00A93A 90 BF 28         [ 2]  690     LDW YTEMP,Y 
      00A93D 90 85            [ 2]  691     POPW Y 
      00A93F 4A               [ 1]  692     DEC A 
      00A940 20 EB            [ 2]  693     JRA DLSHIFT1 
      00A942                        694 DLSHIFT2:
      00A942 EF 02            [ 2]  695     LDW (2,X),Y 
      00A944 90 BE 28         [ 2]  696     LDW Y,YTEMP 
      00A947 FF               [ 2]  697     LDW (X),Y 
      00A948 81               [ 4]  698     RET 
                                    699 
                                    700 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    701 ;  DD/MOD ( d1 d2 -- dr dq )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



                                    702 ;  unsigned division double 
                                    703 ;  double.
                                    704 ;  return double quotient and 
                                    705 ;  double remainder 
                                    706 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028C9                        707     _HEADER DDSLMOD,6,"DD/MOD"
      00A949 A9 14                    1         .word LINK 
                           0028CB     2         LINK=.
      00A94B 06                       3         .byte 6  
      00A94C 44 44 2F 4D 4F 44        4         .ascii "DD/MOD"
      00A952                          5         DDSLMOD:
      00A952 CD 88 32         [ 4]  708     CALL DDUP 
      00A955 CD A6 E8         [ 4]  709     CALL DCLZ 
      00A958 CD 86 18         [ 4]  710     CALL DUPP
      0028DB                        711     _DOLIT 16 
      00A95B CD 84 F3         [ 4]    1     CALL DOLIT 
      00A95E 00 10                    2     .word 16 
      00A960 CD 89 43         [ 4]  712     CALL GREAT 
      0028E3                        713     _QBRAN DDSLMOD1 
      00A963 CD 85 26         [ 4]    1     CALL QBRAN
      00A966 A9 6F                    2     .word DDSLMOD1
      00A968 CD 88 27         [ 4]  714     CALL DDROP 
      00A96B CD A5 C9         [ 4]  715     CALL DSLMOD 
      00A96E 81               [ 4]  716     RET 
      00A96F                        717 DDSLMOD1:
      00A96F CD 86 18         [ 4]  718     CALL DUPP      
      00A972 CD 85 E1         [ 4]  719     CALL TOR 
      00A975 CD A9 1C         [ 4]  720     CALL DLSHIFT
      0028F8                        721     _DOLIT 32 
      00A978 CD 84 F3         [ 4]    1     CALL DOLIT 
      00A97B 00 20                    2     .word 32 
      00A97D CD 85 C2         [ 4]  722     CALL RFROM 
      00A980 CD 88 C0         [ 4]  723     CALL SUBB 
      002903                        724     _DOLIT 5 
      00A983 CD 84 F3         [ 4]    1     CALL DOLIT 
      00A986 00 05                    2     .word 5 
      00A988 CD 8C 0A         [ 4]  725     CALL PICK 
      00290B                        726     _DOLIT 5 
      00A98B CD 84 F3         [ 4]    1     CALL DOLIT 
      00A98E 00 05                    2     .word 5 
      00A990 CD 8C 0A         [ 4]  727     CALL PICK 
      00A993 CD A6 E8         [ 4]  728     CALL DCLZ 
      00A996 CD 85 E1         [ 4]  729     CALL TOR 
      00A999 CD A6 BA         [ 4]  730     CALL DSWAP 
      00A99C CD 85 D5         [ 4]  731     CALL RAT 
      00A99F CD A9 1C         [ 4]  732     CALL DLSHIFT 
      00A9A2 CD A6 BA         [ 4]  733     CALL DSWAP 
      00A9A5 CD 85 C2         [ 4]  734     CALL RFROM 
      00A9A8 CD 85 C2         [ 4]  735     CALL RFROM 
      00A9AB CD 86 28         [ 4]  736     CALL SWAPP 
      00A9AE CD 88 C0         [ 4]  737     CALL SUBB ; number dividend left shift to do.
                                    738 
      00A9B1 81               [ 4]  739     RET 
                                    740 
                                    741 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



                                    742 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    743 ;   D* ( d1 d2 -- d3 )
                                    744 ;   double product 
                                    745 ;   
                                    746 ;   d3 = d1 * d2
                                    747 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002932                        748     _HEADER DSTAR,2,"D*"
      00A9B2 A9 4B                    1         .word LINK 
                           002934     2         LINK=.
      00A9B4 02                       3         .byte 2  
      00A9B5 44 2A                    4         .ascii "D*"
      00A9B7                          5         DSTAR:
      002937                        749     _DOLIT 0 
      00A9B7 CD 84 F3         [ 4]    1     CALL DOLIT 
      00A9BA 00 00                    2     .word 0 
      00A9BC CD 88 05         [ 4]  750     CALL NROT  
      00A9BF CD 86 18         [ 4]  751     CALL DUPP 
      00A9C2 CD 86 51         [ 4]  752     CALL ZLESS 
      002945                        753     _QBRAN DDSTAR1 
      00A9C5 CD 85 26         [ 4]    1     CALL QBRAN
      00A9C8 A9 D6                    2     .word DDSTAR1
      00A9CA CD 88 84         [ 4]  754     CALL DNEGA 
      00A9CD CD 87 E6         [ 4]  755     CALL ROT  
      00A9D0 CD 88 61         [ 4]  756     CALL INVER 
      00A9D3 CD 88 05         [ 4]  757     CALL NROT  
      00A9D6                        758 DDSTAR1:
      00A9D6 CD 85 E1         [ 4]  759     CALL TOR 
      00A9D9 CD 85 E1         [ 4]  760     CALL TOR
      00A9DC CD 88 05         [ 4]  761     CALL NROT  
      00A9DF CD 86 18         [ 4]  762     CALL DUPP 
      00A9E2 CD 86 51         [ 4]  763     CALL ZLESS 
      002965                        764     _QBRAN DDSTAR2 
      00A9E5 CD 85 26         [ 4]    1     CALL QBRAN
      00A9E8 A9 F6                    2     .word DDSTAR2
      00A9EA CD 88 84         [ 4]  765     CALL DNEGA 
      00A9ED CD 87 E6         [ 4]  766     CALL ROT
      00A9F0 CD 88 61         [ 4]  767     CALL INVER 
      00A9F3 CD 88 05         [ 4]  768     CALL NROT 
      00A9F6                        769 DDSTAR2:
      00A9F6 CD 88 32         [ 4]  770     CALL DDUP 
      00A9F9 CD 85 C2         [ 4]  771     CALL RFROM 
      00A9FC CD A6 71         [ 4]  772     CALL DSSTAR 
      00A9FF CD A6 BA         [ 4]  773     CALL DSWAP 
      00AA02 CD 85 C2         [ 4]  774     CALL RFROM 
      00AA05 CD A6 71         [ 4]  775     CALL DSSTAR 
      00AA08 CD 86 0E         [ 4]  776     CALL DROP
      00AA0B CD 88 47         [ 4]  777     CALL PLUS
      00AA0E CD 87 E6         [ 4]  778     CALL ROT 
      002991                        779     _QBRAN DDSTAR3 
      00AA11 CD 85 26         [ 4]    1     CALL QBRAN
      00AA14 AA 19                    2     .word DDSTAR3
      00AA16 CD 88 84         [ 4]  780     CALL DNEGA 
      00AA19                        781 DDSTAR3:  
      00AA19 81               [ 4]  782     RET 
                                    783 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



                                    784 
                                    785 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    786 ;   D+ ( d1 d2 -- d3 )
                                    787 ;   add 2 doubles 
                                    788 ;   d3=d1+d2 
                                    789 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00299A                        790     _HEADER DPLUS,2,"D+"
      00AA1A A9 B4                    1         .word LINK 
                           00299C     2         LINK=.
      00AA1C 02                       3         .byte 2  
      00AA1D 44 2B                    4         .ascii "D+"
      00AA1F                          5         DPLUS:
      00AA1F 90 93            [ 1]  791     LDW Y,X 
      00AA21 90 FE            [ 2]  792     LDW Y,(Y)
      00AA23 90 BF 28         [ 2]  793     LDW YTEMP,Y ; d2 hi 
      00AA26 90 93            [ 1]  794     LDW Y,X 
      00AA28 90 EE 02         [ 2]  795     LDW Y,(2,Y)
      00AA2B 90 BF 26         [ 2]  796     LDW XTEMP,Y ; d2 lo 
      00AA2E 1C 00 04         [ 2]  797     ADDW X,#4 
      00AA31 90 93            [ 1]  798     LDW Y,X 
      00AA33 90 EE 02         [ 2]  799     LDW Y,(2,Y) ; d1 lo
      00AA36 72 B9 00 26      [ 2]  800     ADDW Y,XTEMP
      00AA3A EF 02            [ 2]  801     LDW (2,X),Y 
      00AA3C 90 93            [ 1]  802     LDW Y,X 
      00AA3E 90 FE            [ 2]  803     LDW Y,(Y) ; d1 hi 
      00AA40 24 04            [ 1]  804     JRNC DPLUS1 
      00AA42 72 A9 00 01      [ 2]  805     ADDW Y,#1 
      00AA46                        806 DPLUS1: 
      00AA46 72 B9 00 28      [ 2]  807     ADDW Y,YTEMP 
      00AA4A FF               [ 2]  808     LDW (X),Y 
      00AA4B 81               [ 4]  809     RET 
                                    810 
                                    811 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    812 ;   D- ( d1 d2 -- d3 )
                                    813 ;   d3=d1-d2 
                                    814 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0029CC                        815     _HEADER DSUB,2,"D-"
      00AA4C AA 1C                    1         .word LINK 
                           0029CE     2         LINK=.
      00AA4E 02                       3         .byte 2  
      00AA4F 44 2D                    4         .ascii "D-"
      00AA51                          5         DSUB:
      00AA51 90 93            [ 1]  816     LDW Y,X 
      00AA53 90 FE            [ 2]  817     LDW Y,(Y)
      00AA55 90 BF 28         [ 2]  818     LDW YTEMP,Y ; d2 hi 
      00AA58 90 93            [ 1]  819     LDW Y,X 
      00AA5A 90 EE 02         [ 2]  820     LDW Y,(2,Y)
      00AA5D 90 BF 26         [ 2]  821     LDW XTEMP,Y ; d2 lo 
      00AA60 1C 00 04         [ 2]  822     ADDW X,#4 
      00AA63 90 93            [ 1]  823     LDW Y,X 
      00AA65 90 EE 02         [ 2]  824     LDW Y,(2,Y) ; d1 lo
      00AA68 72 B2 00 26      [ 2]  825     SUBW Y,XTEMP
      00AA6C EF 02            [ 2]  826     LDW (2,X),Y 
      00AA6E 90 93            [ 1]  827     LDW Y,X 
      00AA70 90 FE            [ 2]  828     LDW Y,(Y) ; d1 hi 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      00AA72 24 04            [ 1]  829     JRNC DSUB1 
      00AA74 72 A2 00 01      [ 2]  830     SUBW Y,#1 
      00AA78                        831 DSUB1: 
      00AA78 72 B2 00 28      [ 2]  832     SUBW Y,YTEMP 
      00AA7C FF               [ 2]  833     LDW (X),Y 
      00AA7D 81               [ 4]  834     RET 
                                    835 
                                    836 
                                    837 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    838 ;    ILOG ( ud base -- n )
                                    839 ;    integer part of double in base 
                                    840 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0029FE                        841     _HEADER ILOG,4,"ILOG"
      00AA7E AA 4E                    1         .word LINK 
                           002A00     2         LINK=.
      00AA80 04                       3         .byte 4  
      00AA81 49 4C 4F 47              4         .ascii "ILOG"
      00AA85                          5         ILOG:
      002A05                        842     _DOLIT 0 
      00AA85 CD 84 F3         [ 4]    1     CALL DOLIT 
      00AA88 00 00                    2     .word 0 
      00AA8A CD 85 E1         [ 4]  843     CALL TOR 
      00AA8D CD 88 05         [ 4]  844     CALL NROT 
      00AA90                        845 ILOG1: 
      002A10                        846     _DOLIT 2 
      00AA90 CD 84 F3         [ 4]    1     CALL DOLIT 
      00AA93 00 02                    2     .word 2 
      00AA95 CD 8C 0A         [ 4]  847     CALL PICK 
      00AA98 CD A5 C9         [ 4]  848     CALL DSLMOD 
      00AA9B CD 87 E6         [ 4]  849     CALL ROT 
      00AA9E CD 86 0E         [ 4]  850     CALL DROP 
      00AAA1 CD 88 32         [ 4]  851     CALL DDUP
      00AAA4 CD A5 51         [ 4]  852     CALL DZEQUAL 
      00AAA7 CD 88 61         [ 4]  853     CALL INVER 
      002A2A                        854     _QBRAN ILOG2
      00AAAA CD 85 26         [ 4]    1     CALL QBRAN
      00AAAD AA BD                    2     .word ILOG2
      00AAAF CD 85 C2         [ 4]  855     CALL RFROM 
      00AAB2 CD 8B 45         [ 4]  856     CALL ONEP 
      00AAB5 CD 85 E1         [ 4]  857     CALL TOR 
      002A38                        858     _BRAN ILOG1 
      00AAB8 CD 85 3D         [ 4]    1     CALL BRAN 
      00AABB AA 90                    2     .word ILOG1 
      00AABD                        859 ILOG2:
      00AABD CD 88 27         [ 4]  860     CALL DDROP 
      00AAC0 CD 86 0E         [ 4]  861     CALL DROP 
      00AAC3 CD 85 C2         [ 4]  862     CALL RFROM 
      00AAC6 81               [ 4]  863     RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



                                   4776 .endif 
                           000001  4777 .if WANT_FLOAT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



                                   4778         .include "float.asm"
                                      1 ;*********************************
                                      2 ;    floating point library
                                      3 ;    adapted from 
                                      4 ;    Forth dimensions Vol. IV #1 
                                      5 ;    published in  may/june 1982
                                      6 ;
                                      7 ; Creation date: 2021-06-15 
                                      8 ;
                                      9 ; NOTE: I used a different format 
                                     10 ;       for float number. This 
                                     11 ;       enable comparison of floats 
                                     12 ;       as they were integer hence 
                                     13 ;       there no need for F>,F<,etc 
                                     14 ;************************************
                                     15 
                                     16 ;*************************************************
                                     17 ;  FLOAT format double for storage 
                                     18 ;  bits 22:0  mantissa absolute value 
                                     19 ;  bits  30:23  exponent with 127 offset added  
                                     20 ;  bit 31  mantissa sign 
                                     21 ;  float value: if bit 31 is 1 negate mantissa
                                     22 ;                else keep mantissas as bits 22:0
                                     23 ;                as is
                                     24 ;                eponent: 10^^(exp-127) 
                                     25 ;***********************************************  
                                     26 
                                     27     .module FLOAT 
                                     28 
                           000001    29 .if WANT_DOUBLE 
                                     30 ; already included 
                           000000    31 .else
                                     32 ;  must be included  
                                     33     .include "double.asm"
                                     34 .endif  
                                     35 
                                     36 ;-------------------------
                                     37 ;    FPSW ( -- a )
                                     38 ;    floating state variable
                                     39 ;    bit 0 zero flag 
                                     40 ;    bit 1 negative flag 
                                     41 ;    bit 2 overflow/error flag 
                                     42 ;---------------------------
      002A47                         43     _HEADER FPSW,4,"FPSW"
      00AAC7 AA 80                    1         .word LINK 
                           002A49     2         LINK=.
      00AAC9 04                       3         .byte 4  
      00AACA 46 50 53 57              4         .ascii "FPSW"
      00AACE                          5         FPSW:
      00AACE 90 AE 00 0A      [ 2]   44 	LDW Y,#UFPSW  
      00AAD2 1D 00 02         [ 2]   45 	SUBW X,#2
      00AAD5 FF               [ 2]   46     LDW (X),Y
      00AAD6 81               [ 4]   47     RET
                                     48 
                                     49 ;----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



                                     50 ;    FBASE ( -- a )
                                     51 ;    floating point numerical
                                     52 ;    base variable 
                                     53 ;----------------------------
      002A57                         54     _HEADER FBASE,5,"FBASE"
      00AAD7 AA C9                    1         .word LINK 
                           002A59     2         LINK=.
      00AAD9 05                       3         .byte 5  
      00AADA 46 42 41 53 45           4         .ascii "FBASE"
      00AADF                          5         FBASE:
      00AADF 90 AE 00 08      [ 2]   55 	LDW Y,#UFBASE  
      00AAE3 1D 00 02         [ 2]   56 	SUBW X,#2
      00AAE6 FF               [ 2]   57     LDW (X),Y
      00AAE7 81               [ 4]   58     RET
                                     59 
                                     60 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     61 ;   FRESET ( -- )
                                     62 ;   reset FPSW variable 
                                     63 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
      002A68                         64     _HEADER FRESET,6,"FRESET"
      00AAE8 AA D9                    1         .word LINK 
                           002A6A     2         LINK=.
      00AAEA 06                       3         .byte 6  
      00AAEB 46 52 45 53 45 54        4         .ascii "FRESET"
      00AAF1                          5         FRESET:
      002A71                         65     _DOLIT 0 
      00AAF1 CD 84 F3         [ 4]    1     CALL DOLIT 
      00AAF4 00 00                    2     .word 0 
      00AAF6 CD AA CE         [ 4]   66     CALL FPSW 
      00AAF9 CD 85 5A         [ 4]   67     CALL STORE 
      00AAFC 81               [ 4]   68     RET 
                                     69 
                                     70 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     71 ;   FINIT ( -- )
                                     72 ;   initialize floating point 
                                     73 ;   library 
                                     74 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A7D                         75     _HEADER FINIT,5,"FINIT"
      00AAFD AA EA                    1         .word LINK 
                           002A7F     2         LINK=.
      00AAFF 05                       3         .byte 5  
      00AB00 46 49 4E 49 54           4         .ascii "FINIT"
      00AB05                          5         FINIT:
      00AB05 CD AA F1         [ 4]   76     CALL FRESET 
      00AB08 CD 86 E8         [ 4]   77     CALL BASE 
      00AB0B CD 85 71         [ 4]   78     CALL AT 
      00AB0E CD AA DF         [ 4]   79     CALL FBASE 
      00AB11 CD 85 5A         [ 4]   80     CALL STORE 
      00AB14 81               [ 4]   81     RET 
                                     82 
                                     83 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     84 ;    FER ( -- u )
                                     85 ;    return FPSW value 
                                     86 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A95                         87     _HEADER FER,3,"FER"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      00AB15 AA FF                    1         .word LINK 
                           002A97     2         LINK=.
      00AB17 03                       3         .byte 3  
      00AB18 46 45 52                 4         .ascii "FER"
      00AB1B                          5         FER:
      00AB1B CD AA CE         [ 4]   88     CALL FPSW 
      00AB1E CD 85 71         [ 4]   89     CALL AT 
      00AB21 81               [ 4]   90     RET 
                                     91 
                                     92 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     93 ;    FZE  ( -- z )
                                     94 ;    return FPSW zero flag 
                                     95 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002AA2                         96     _HEADER FZE,3,"FZE"
      00AB22 AB 17                    1         .word LINK 
                           002AA4     2         LINK=.
      00AB24 03                       3         .byte 3  
      00AB25 46 5A 45                 4         .ascii "FZE"
      00AB28                          5         FZE:
      00AB28 CD AA CE         [ 4]   97     CALL FPSW
      00AB2B CD 85 71         [ 4]   98     CALL AT  
      002AAE                         99     _DOLIT 1
      00AB2E CD 84 F3         [ 4]    1     CALL DOLIT 
      00AB31 00 01                    2     .word 1 
      00AB33 CD 86 77         [ 4]  100     CALL ANDD 
      00AB36 81               [ 4]  101     RET 
                                    102 
                                    103 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    104 ;    FNE ( -- n )
                                    105 ;    return FPSW negative flag 
                                    106 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002AB7                        107     _HEADER FNE,3,"FNE"
      00AB37 AB 24                    1         .word LINK 
                           002AB9     2         LINK=.
      00AB39 03                       3         .byte 3  
      00AB3A 46 4E 45                 4         .ascii "FNE"
      00AB3D                          5         FNE:
      00AB3D CD AA CE         [ 4]  108     CALL FPSW 
      00AB40 CD 85 71         [ 4]  109     CALL AT 
      002AC3                        110     _DOLIT 2 
      00AB43 CD 84 F3         [ 4]    1     CALL DOLIT 
      00AB46 00 02                    2     .word 2 
      00AB48 CD 86 77         [ 4]  111     CALL ANDD 
      00AB4B 81               [ 4]  112     RET 
                                    113 
                                    114 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    115 ;   FOV (A -- v )
                                    116 ;   return FPSW overflow flag 
                                    117 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002ACC                        118     _HEADER FOV,3,"FOV"
      00AB4C AB 39                    1         .word LINK 
                           002ACE     2         LINK=.
      00AB4E 03                       3         .byte 3  
      00AB4F 46 4F 56                 4         .ascii "FOV"
      00AB52                          5         FOV:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      00AB52 CD AA CE         [ 4]  119     CALL FPSW
      00AB55 CD 85 71         [ 4]  120     CALL AT  
      002AD8                        121     _DOLIT 4 
      00AB58 CD 84 F3         [ 4]    1     CALL DOLIT 
      00AB5B 00 04                    2     .word 4 
      00AB5D CD 86 77         [ 4]  122     CALL ANDD 
      00AB60 81               [ 4]  123     RET 
                                    124 
                                    125 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    126 ;   U> ( u1 u2 -- f )
                                    127 ;   f = true if u1>u2 
                                    128 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002AE1                        129     _HEADER UGREAT,2,"U>"
      00AB61 AB 4E                    1         .word LINK 
                           002AE3     2         LINK=.
      00AB63 02                       3         .byte 2  
      00AB64 55 3E                    4         .ascii "U>"
      00AB66                          5         UGREAT:
      00AB66 A6 00            [ 1]  130     LD A,#0
      00AB68 90 93            [ 1]  131     LDW Y,X 
      00AB6A 90 EE 02         [ 2]  132     LDW Y,(2,Y)
      00AB6D 90 BF 28         [ 2]  133     LDW YTEMP,Y 
      00AB70 90 93            [ 1]  134     LDW Y,X
      00AB72 1C 00 02         [ 2]  135     ADDW X,#2 
      00AB75 90 FE            [ 2]  136     LDW Y,(Y)
      00AB77 90 B3 28         [ 2]  137     CPW Y,YTEMP 
      00AB7A 2B 02            [ 1]  138     JRMI UGREAT1 
      00AB7C A6 FF            [ 1]  139     LD A,#0XFF 
      00AB7E                        140 UGREAT1:
      00AB7E F7               [ 1]  141     LD (X),A 
      00AB7F E7 01            [ 1]  142     LD (1,X),A 
      00AB81 81               [ 4]  143     RET 
                                    144 
                                    145 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    146 ;    SFZ ( f# -- f# )
                                    147 ;    set FPSW zero flag 
                                    148 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B02                        149     _HEADER SFZ,3,"SFZ"
      00AB82 AB 63                    1         .word LINK 
                           002B04     2         LINK=.
      00AB84 03                       3         .byte 3  
      00AB85 53 46 5A                 4         .ascii "SFZ"
      00AB88                          5         SFZ:
      00AB88 CD 88 32         [ 4]  150     CALL DDUP 
      00AB8B CD AB 1B         [ 4]  151     CALL FER 
      002B0E                        152     _DOLIT 0xfffe 
      00AB8E CD 84 F3         [ 4]    1     CALL DOLIT 
      00AB91 FF FE                    2     .word 0xfffe 
      00AB93 CD 86 77         [ 4]  153     CALL ANDD 
      00AB96 CD 85 E1         [ 4]  154     CALL TOR    
      002B19                        155     _DOLIT 0x807F 
      00AB99 CD 84 F3         [ 4]    1     CALL DOLIT 
      00AB9C 80 7F                    2     .word 0x807F 
      00AB9E CD 86 77         [ 4]  156     CALL ANDD 
      00ABA1 CD A5 51         [ 4]  157     CALL DZEQUAL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      002B24                        158     _DOLIT 1 
      00ABA4 CD 84 F3         [ 4]    1     CALL DOLIT 
      00ABA7 00 01                    2     .word 1 
      00ABA9 CD 86 77         [ 4]  159     CALL ANDD 
      00ABAC CD 85 C2         [ 4]  160     CALL RFROM 
      00ABAF CD 86 8B         [ 4]  161     CALL ORR 
      00ABB2 CD AA CE         [ 4]  162     CALL FPSW 
      00ABB5 CD 85 5A         [ 4]  163     CALL STORE 
      00ABB8 81               [ 4]  164     RET 
                                    165 
                                    166 
                                    167 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    168 ;   SFN ( f# -- f# )
                                    169 ;   set FPSW negative flag 
                                    170 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B39                        171     _HEADER SFN,3,"SFN"
      00ABB9 AB 84                    1         .word LINK 
                           002B3B     2         LINK=.
      00ABBB 03                       3         .byte 3  
      00ABBC 53 46 4E                 4         .ascii "SFN"
      00ABBF                          5         SFN:
      00ABBF CD 86 18         [ 4]  172     CALL DUPP  
      00ABC2 CD AB 1B         [ 4]  173     CALL FER 
      002B45                        174     _DOLIT 0xFFFD 
      00ABC5 CD 84 F3         [ 4]    1     CALL DOLIT 
      00ABC8 FF FD                    2     .word 0xFFFD 
      00ABCA CD 86 77         [ 4]  175     CALL ANDD  
      00ABCD CD 85 E1         [ 4]  176     CALL TOR 
      002B50                        177     _DOLIT 0x8000
      00ABD0 CD 84 F3         [ 4]    1     CALL DOLIT 
      00ABD3 80 00                    2     .word 0x8000 
      00ABD5 CD 86 77         [ 4]  178     CALL ANDD
      00ABD8 90 93            [ 1]  179     LDW Y,X 
      00ABDA 90 FE            [ 2]  180     LDW Y,(Y)
      00ABDC 98               [ 1]  181     RCF 
      00ABDD 90 59            [ 2]  182     RLCW Y 
      00ABDF 90 59            [ 2]  183     RLCW Y 
      00ABE1 90 59            [ 2]  184     RLCW Y 
      00ABE3 FF               [ 2]  185     LDW (X),Y 
      00ABE4 CD 85 C2         [ 4]  186     CALL RFROM 
      00ABE7 CD 86 8B         [ 4]  187     CALL ORR 
      00ABEA CD AA CE         [ 4]  188     CALL FPSW
      00ABED CD 85 5A         [ 4]  189     CALL STORE 
      00ABF0 81               [ 4]  190     RET 
                                    191 
                                    192 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    193 ;   SFV ( -- )
                                    194 ;   set overflow flag 
                                    195 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B71                        196     _HEADER SFV,3,"SFV"
      00ABF1 AB BB                    1         .word LINK 
                           002B73     2         LINK=.
      00ABF3 03                       3         .byte 3  
      00ABF4 53 46 56                 4         .ascii "SFV"
      00ABF7                          5         SFV:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      00ABF7 CD AA CE         [ 4]  197     CALL FPSW 
      00ABFA CD 85 71         [ 4]  198     CALL AT 
      002B7D                        199     _DOLIT 4 
      00ABFD CD 84 F3         [ 4]    1     CALL DOLIT 
      00AC00 00 04                    2     .word 4 
      00AC02 CD 86 8B         [ 4]  200     CALL ORR 
      00AC05 CD AA CE         [ 4]  201     CALL FPSW 
      00AC08 CD 85 5A         [ 4]  202     CALL STORE 
      00AC0B 81               [ 4]  203     RET 
                                    204 
                                    205 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    206 ;  @EXPONENT ( f# -- m e )
                                    207 ;  split float in mantissa/exponent 
                                    208 ;  m mantissa as a double 
                                    209 ;  e exponent as a single 
                                    210 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B8C                        211     _HEADER ATEXP,9,"@EXPONENT"             
      00AC0C AB F3                    1         .word LINK 
                           002B8E     2         LINK=.
      00AC0E 09                       3         .byte 9  
      00AC0F 40 45 58 50 4F 4E 45     4         .ascii "@EXPONENT"
             4E 54
      00AC18                          5         ATEXP:
      00AC18 CD AA F1         [ 4]  212     CALL FRESET
      00AC1B CD AB BF         [ 4]  213     CALL SFN
      00AC1E CD AB 88         [ 4]  214     CALL SFZ 
      00AC21 CD 86 18         [ 4]  215     CALL DUPP
      002BA4                        216     _DOLIT 0X7F80 
      00AC24 CD 84 F3         [ 4]    1     CALL DOLIT 
      00AC27 7F 80                    2     .word 0X7F80 
      00AC29 CD 86 77         [ 4]  217     CALL ANDD 
      002BAC                        218     _DOLIT 7 
      00AC2C CD 84 F3         [ 4]    1     CALL DOLIT 
      00AC2F 00 07                    2     .word 7 
      00AC31 CD 8B 7F         [ 4]  219     CALL RSHIFT
      002BB4                        220     _DOLIT 127 
      00AC34 CD 84 F3         [ 4]    1     CALL DOLIT 
      00AC37 00 7F                    2     .word 127 
      00AC39 CD 88 C0         [ 4]  221     CALL SUBB
      00AC3C CD 85 E1         [ 4]  222     CALL TOR 
      002BBF                        223     _DOLIT 0x7F
      00AC3F CD 84 F3         [ 4]    1     CALL DOLIT 
      00AC42 00 7F                    2     .word 0x7F 
      00AC44 CD 86 77         [ 4]  224     CALL ANDD  ; mantissa as double  
      00AC47 CD AB 3D         [ 4]  225     CALL FNE 
      002BCA                        226     _QBRAN POSMANT 
      00AC4A CD 85 26         [ 4]    1     CALL QBRAN
      00AC4D AC 52                    2     .word POSMANT
      00AC4F CD A5 6F         [ 4]  227     CALL DNEGAT 
      00AC52                        228 POSMANT:
      00AC52 CD 85 C2         [ 4]  229     CALL RFROM 
      00AC55 81               [ 4]  230     RET 
                                    231 
                                    232 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    233 ;    !EXPONENT ( m e -- f# )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



                                    234 ;    built float from mantissa/exponent 
                                    235 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BD6                        236     _HEADER STEXP,9,"!EXPONENT"
      00AC56 AC 0E                    1         .word LINK 
                           002BD8     2         LINK=.
      00AC58 09                       3         .byte 9  
      00AC59 21 45 58 50 4F 4E 45     4         .ascii "!EXPONENT"
             4E 54
      00AC62                          5         STEXP:
      00AC62 CD 86 18         [ 4]  237     CALL DUPP 
      00AC65 CD 88 DA         [ 4]  238     CALL ABSS 
      002BE8                        239     _DOLIT 127 
      00AC68 CD 84 F3         [ 4]    1     CALL DOLIT 
      00AC6B 00 7F                    2     .word 127 
      00AC6D CD AB 66         [ 4]  240     CALL UGREAT
      002BF0                        241     _QBRAN STEXP1
      00AC70 CD 85 26         [ 4]    1     CALL QBRAN
      00AC73 AC 78                    2     .word STEXP1
      00AC75 CD AB F7         [ 4]  242     CALL SFV  
      00AC78                        243 STEXP1:
      002BF8                        244     _DOLIT 127 
      00AC78 CD 84 F3         [ 4]    1     CALL DOLIT 
      00AC7B 00 7F                    2     .word 127 
      00AC7D CD 88 47         [ 4]  245     CALL PLUS 
      002C00                        246     _DOLIT 0XFF 
      00AC80 CD 84 F3         [ 4]    1     CALL DOLIT 
      00AC83 00 FF                    2     .word 0XFF 
      00AC85 CD 86 77         [ 4]  247     CALL ANDD 
      002C08                        248     _DOLIT 7 
      00AC88 CD 84 F3         [ 4]    1     CALL DOLIT 
      00AC8B 00 07                    2     .word 7 
      00AC8D CD 8B 63         [ 4]  249     CALL LSHIFT 
      00AC90 CD 85 E1         [ 4]  250     CALL TOR   ; R: e 
      00AC93 CD 86 18         [ 4]  251     CALL DUPP 
      002C16                        252     _DOLIT 0X8000 
      00AC96 CD 84 F3         [ 4]    1     CALL DOLIT 
      00AC99 80 00                    2     .word 0X8000 
      00AC9B CD 86 77         [ 4]  253     CALL ANDD 
      002C1E                        254     _QBRAN STEXP2 
      00AC9E CD 85 26         [ 4]    1     CALL QBRAN
      00ACA1 AC B4                    2     .word STEXP2
      002C23                        255     _DOLIT 0X8000 
      00ACA3 CD 84 F3         [ 4]    1     CALL DOLIT 
      00ACA6 80 00                    2     .word 0X8000 
      00ACA8 CD 85 C2         [ 4]  256     CALL RFROM 
      00ACAB CD 86 8B         [ 4]  257     CALL ORR
      00ACAE CD 85 E1         [ 4]  258     CALL TOR
      00ACB1 CD A5 6F         [ 4]  259     CALL DNEGAT  
      00ACB4                        260 STEXP2:
      00ACB4 CD 86 18         [ 4]  261     CALL DUPP 
      002C37                        262     _DOLIT 0X7F
      00ACB7 CD 84 F3         [ 4]    1     CALL DOLIT 
      00ACBA 00 7F                    2     .word 0X7F 
      00ACBC CD AB 66         [ 4]  263     CALL UGREAT 
      002C3F                        264     _QBRAN STEXP3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      00ACBF CD 85 26         [ 4]    1     CALL QBRAN
      00ACC2 AC C7                    2     .word STEXP3
      00ACC4 CD AB F7         [ 4]  265     CALL SFV 
      00ACC7                        266 STEXP3:
      002C47                        267     _DOLIT 0X7F 
      00ACC7 CD 84 F3         [ 4]    1     CALL DOLIT 
      00ACCA 00 7F                    2     .word 0X7F 
      00ACCC CD 86 77         [ 4]  268     CALL ANDD 
      00ACCF CD 85 C2         [ 4]  269     CALL RFROM 
      00ACD2 CD 86 8B         [ 4]  270     CALL ORR 
      00ACD5 CD AB 88         [ 4]  271     CALL SFZ 
      00ACD8 CD AB BF         [ 4]  272     CALL SFN 
      00ACDB 81               [ 4]  273     RET 
                                    274 
                                    275 
                                    276 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    277 ;   E. ( f# -- )
                                    278 ;   print float in scientific 
                                    279 ;   format 
                                    280 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C5C                        281     _HEADER EDOT,2,"E."
      00ACDC AC 58                    1         .word LINK 
                           002C5E     2         LINK=.
      00ACDE 02                       3         .byte 2  
      00ACDF 45 2E                    4         .ascii "E."
      00ACE1                          5         EDOT:
      00ACE1 CD 86 E8         [ 4]  282     CALL BASE 
      00ACE4 CD 85 71         [ 4]  283     CALL AT 
      00ACE7 CD 85 E1         [ 4]  284     CALL TOR 
      00ACEA CD AA DF         [ 4]  285     CALL FBASE 
      00ACED CD 85 71         [ 4]  286     CALL AT
      00ACF0 CD 86 E8         [ 4]  287     CALL BASE 
      00ACF3 CD 85 5A         [ 4]  288     CALL STORE 
      00ACF6 CD AC 18         [ 4]  289     CALL ATEXP ; m e 
      00ACF9                        290 EDOT0:
      00ACF9 CD 85 E1         [ 4]  291     CALL TOR   
      00ACFC CD AB 3D         [ 4]  292     CALL FNE 
      002C7F                        293     _QBRAN EDOT1
      00ACFF CD 85 26         [ 4]    1     CALL QBRAN
      00AD02 AD 07                    2     .word EDOT1
      00AD04 CD A5 6F         [ 4]  294     CALL DNEGAT
      00AD07                        295 EDOT1:
      00AD07 CD 8E F8         [ 4]  296     CALL SPACE 
      00AD0A CD 8D BC         [ 4]  297     CALL BDIGS     
      00AD0D                        298 EDOT2: 
      00AD0D CD A6 0A         [ 4]  299     CALL DDIG
      00AD10 CD 85 C2         [ 4]  300     CALL RFROM 
      00AD13 CD 8B 45         [ 4]  301     CALL ONEP 
      00AD16 CD 85 E1         [ 4]  302     CALL TOR 
      00AD19 CD 86 18         [ 4]  303     CALL DUPP
      002C9C                        304     _QBRAN EDOT3 
      00AD1C CD 85 26         [ 4]    1     CALL QBRAN
      00AD1F AD 26                    2     .word EDOT3
      002CA1                        305     _BRAN EDOT2  
      00AD21 CD 85 3D         [ 4]    1     CALL BRAN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      00AD24 AD 0D                    2     .word EDOT2 
      00AD26                        306 EDOT3:
      00AD26 CD 86 42         [ 4]  307     CALL OVER 
      00AD29 CD 86 E8         [ 4]  308     CALL BASE 
      00AD2C CD 85 71         [ 4]  309     CALL AT 
      00AD2F CD 89 07         [ 4]  310     CALL ULESS 
      002CB2                        311     _QBRAN EDOT2 
      00AD32 CD 85 26         [ 4]    1     CALL QBRAN
      00AD35 AD 0D                    2     .word EDOT2
      002CB7                        312     _DOLIT '.'
      00AD37 CD 84 F3         [ 4]    1     CALL DOLIT 
      00AD3A 00 2E                    2     .word '.' 
      00AD3C CD 8D CC         [ 4]  313     CALL HOLD  
      00AD3F CD A6 0A         [ 4]  314     CALL DDIG
      00AD42 CD AB 3D         [ 4]  315     CALL FNE 
      002CC5                        316     _QBRAN EDOT4 
      00AD45 CD 85 26         [ 4]    1     CALL QBRAN
      00AD48 AD 52                    2     .word EDOT4
      002CCA                        317     _DOLIT '-'
      00AD4A CD 84 F3         [ 4]    1     CALL DOLIT 
      00AD4D 00 2D                    2     .word '-' 
      00AD4F CD 8D CC         [ 4]  318     CALL HOLD 
      00AD52                        319 EDOT4:       
      00AD52 CD 8E 21         [ 4]  320     CALL EDIGS 
      00AD55 CD 8F 22         [ 4]  321     CALL TYPES
      00AD58 CD 85 C2         [ 4]  322     CALL RFROM 
      00AD5B CD 87 D5         [ 4]  323     CALL QDUP 
      002CDE                        324     _QBRAN EDOT5     
      00AD5E CD 85 26         [ 4]    1     CALL QBRAN
      00AD61 AD 6E                    2     .word EDOT5
      002CE3                        325     _DOLIT 'E'
      00AD63 CD 84 F3         [ 4]    1     CALL DOLIT 
      00AD66 00 45                    2     .word 'E' 
      00AD68 CD 84 B8         [ 4]  326     CALL EMIT 
      00AD6B CD 8F F9         [ 4]  327     CALL DOT
      00AD6E                        328 EDOT5: 
      00AD6E CD 85 C2         [ 4]  329     CALL RFROM 
      00AD71 CD 86 E8         [ 4]  330     CALL BASE 
      00AD74 CD 85 5A         [ 4]  331     CALL STORE  
      00AD77 81               [ 4]  332     RET 
                                    333 
                                    334 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                    335 ;   F. (f# -- )
                                    336 ;   print float in fixed
                                    337 ;   point format. 
                                    338 ;;;;;;;;;;;;;;;;;;;;;;;;;
      002CF8                        339     _HEADER FDOT,2,"F."
      00AD78 AC DE                    1         .word LINK 
                           002CFA     2         LINK=.
      00AD7A 02                       3         .byte 2  
      00AD7B 46 2E                    4         .ascii "F."
      00AD7D                          5         FDOT:
      00AD7D CD 86 E8         [ 4]  340     CALL BASE 
      00AD80 CD 85 71         [ 4]  341     CALL AT 
      00AD83 CD 85 E1         [ 4]  342     CALL TOR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      00AD86 CD AA DF         [ 4]  343     CALL FBASE 
      00AD89 CD 85 71         [ 4]  344     CALL AT
      00AD8C CD 86 E8         [ 4]  345     CALL BASE 
      00AD8F CD 85 5A         [ 4]  346     CALL STORE 
      00AD92 CD AC 18         [ 4]  347     CALL    ATEXP
      00AD95 CD 86 18         [ 4]  348     CALL    DUPP  
      00AD98 CD 88 DA         [ 4]  349     CALL    ABSS 
      002D1B                        350     _DOLIT  8
      00AD9B CD 84 F3         [ 4]    1     CALL DOLIT 
      00AD9E 00 08                    2     .word 8 
      00ADA0 CD 89 43         [ 4]  351     CALL    GREAT 
      002D23                        352     _QBRAN  FDOT1 
      00ADA3 CD 85 26         [ 4]    1     CALL QBRAN
      00ADA6 AD AB                    2     .word FDOT1
      00ADA8 CC AC F9         [ 2]  353     JP      EDOT0 
      00ADAB                        354 FDOT1:
      00ADAB CD 8E F8         [ 4]  355     CALL    SPACE 
      00ADAE CD 85 E1         [ 4]  356     CALL    TOR 
      00ADB1 CD AB 3D         [ 4]  357     CALL    FNE 
      002D34                        358     _QBRAN  FDOT0 
      00ADB4 CD 85 26         [ 4]    1     CALL QBRAN
      00ADB7 AD BC                    2     .word FDOT0
      00ADB9 CD A5 6F         [ 4]  359     CALL    DNEGAT 
      00ADBC                        360 FDOT0: 
      00ADBC CD 8D BC         [ 4]  361     CALL    BDIGS
      00ADBF CD 85 D5         [ 4]  362     CALL    RAT  
      00ADC2 CD 86 51         [ 4]  363     CALL    ZLESS 
      002D45                        364     _QBRAN  FDOT6 
      00ADC5 CD 85 26         [ 4]    1     CALL QBRAN
      00ADC8 AD F3                    2     .word FDOT6
      00ADCA                        365 FDOT2: ; e<0 
      00ADCA CD A6 0A         [ 4]  366     CALL    DDIG 
      00ADCD CD 85 C2         [ 4]  367     CALL    RFROM
      00ADD0 CD 8B 45         [ 4]  368     CALL    ONEP 
      00ADD3 CD 87 D5         [ 4]  369     CALL    QDUP 
      002D56                        370     _QBRAN  FDOT3 
      00ADD6 CD 85 26         [ 4]    1     CALL QBRAN
      00ADD9 AD E3                    2     .word FDOT3
      00ADDB CD 85 E1         [ 4]  371     CALL    TOR 
      002D5E                        372     _BRAN   FDOT2 
      00ADDE CD 85 3D         [ 4]    1     CALL BRAN 
      00ADE1 AD CA                    2     .word FDOT2 
      00ADE3                        373 FDOT3:
      002D63                        374     _DOLIT  '.' 
      00ADE3 CD 84 F3         [ 4]    1     CALL DOLIT 
      00ADE6 00 2E                    2     .word '.' 
      00ADE8 CD 8D CC         [ 4]  375     CALL    HOLD 
      00ADEB CD A6 23         [ 4]  376     CALL    DDIGS
      002D6E                        377     _BRAN   FDOT9  
      00ADEE CD 85 3D         [ 4]    1     CALL BRAN 
      00ADF1 AE 08                    2     .word FDOT9 
      00ADF3                        378 FDOT6: ; e>=0 
      002D73                        379     _BRAN   FDOT8
      00ADF3 CD 85 3D         [ 4]    1     CALL BRAN 
      00ADF6 AE 00                    2     .word FDOT8 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      00ADF8                        380 FDOT7:     
      002D78                        381     _DOLIT  '0'
      00ADF8 CD 84 F3         [ 4]    1     CALL DOLIT 
      00ADFB 00 30                    2     .word '0' 
      00ADFD CD 8D CC         [ 4]  382     CALL    HOLD 
      00AE00                        383 FDOT8:
      00AE00 CD 85 07         [ 4]  384     CALL    DONXT 
      00AE03 AD F8                  385     .word   FDOT7
      00AE05 CD A6 23         [ 4]  386     CALL    DDIGS 
      00AE08                        387 FDOT9:
      00AE08 CD AB 3D         [ 4]  388     CALL    FNE 
      002D8B                        389     _QBRAN  FDOT10 
      00AE0B CD 85 26         [ 4]    1     CALL QBRAN
      00AE0E AE 18                    2     .word FDOT10
      002D90                        390     _DOLIT '-' 
      00AE10 CD 84 F3         [ 4]    1     CALL DOLIT 
      00AE13 00 2D                    2     .word '-' 
      00AE15 CD 8D CC         [ 4]  391     CALL   HOLD 
      00AE18                        392 FDOT10:
      00AE18 CD 8E 21         [ 4]  393     CALL    EDIGS 
      00AE1B CD 8F 22         [ 4]  394     CALL    TYPES 
      00AE1E CD 85 C2         [ 4]  395     CALL    RFROM 
      00AE21 CD 86 E8         [ 4]  396     CALL    BASE 
      00AE24 CD 85 5A         [ 4]  397     CALL    STORE 
      00AE27 81               [ 4]  398     RET 
                                    399 
                                    400 
                                    401     
                                    402 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    403 ;   FLOAT? <string> ( a -- f T | a F )
                                    404 ;   convert <string> to float 
                                    405 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002DA8                        406     _HEADER FLOATQ,5,"FLOAT?"
      00AE28 AD 7A                    1         .word LINK 
                           002DAA     2         LINK=.
      00AE2A 05                       3         .byte 5  
      00AE2B 46 4C 4F 41 54 3F        4         .ascii "FLOAT?"
      00AE31                          5         FLOATQ:
                                    407 
      00AE31 81               [ 4]  408     RET 
                                    409 
                                    410 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    411 ;  LSCALE ( f# -- f# )
                                    412 ;  m *=fbase , e -= 1
                                    413 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002DB2                        414     _HEADER LSCALE,6,"LSCALE"
      00AE32 AE 2A                    1         .word LINK 
                           002DB4     2         LINK=.
      00AE34 06                       3         .byte 6  
      00AE35 4C 53 43 41 4C 45        4         .ascii "LSCALE"
      00AE3B                          5         LSCALE:
      00AE3B CD AC 18         [ 4]  415     CALL ATEXP 
      002DBE                        416     _DOLIT 1 
      00AE3E CD 84 F3         [ 4]    1     CALL DOLIT 
      00AE41 00 01                    2     .word 1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      00AE43 CD 88 C0         [ 4]  417     CALL SUBB 
      00AE46 CD 85 E1         [ 4]  418     CALL TOR
      00AE49 CD AA DF         [ 4]  419     CALL FBASE 
      00AE4C CD 85 71         [ 4]  420     CALL AT 
      00AE4F CD A6 71         [ 4]  421     CALL DSSTAR
      00AE52 CD 85 C2         [ 4]  422     CALL RFROM 
      00AE55 CD AC 62         [ 4]  423     CALL STEXP 
      00AE58 81               [ 4]  424     RET  
                                    425 
                                    426 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    427 ;  RSCALE ( f# -- f# )
                                    428 ;  m /=fbase , e+=1 
                                    429 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002DD9                        430     _HEADER RSCALE,6,"RSCALE"
      00AE59 AE 34                    1         .word LINK 
                           002DDB     2         LINK=.
      00AE5B 06                       3         .byte 6  
      00AE5C 52 53 43 41 4C 45        4         .ascii "RSCALE"
      00AE62                          5         RSCALE:
      00AE62 CD AC 18         [ 4]  431     CALL ATEXP 
      002DE5                        432     _DOLIT 1 
      00AE65 CD 84 F3         [ 4]    1     CALL DOLIT 
      00AE68 00 01                    2     .word 1 
      00AE6A CD 88 47         [ 4]  433     CALL PLUS 
      00AE6D CD 85 E1         [ 4]  434     CALL TOR 
      00AE70 CD AA DF         [ 4]  435     CALL FBASE 
      00AE73 CD 85 71         [ 4]  436     CALL AT 
      00AE76 CD A5 C9         [ 4]  437     CALL DSLMOD 
      00AE79 CD 87 E6         [ 4]  438     CALL ROT 
      00AE7C CD 86 0E         [ 4]  439     CALL DROP 
      00AE7F CD 85 C2         [ 4]  440     CALL RFROM 
      00AE82 CD AC 62         [ 4]  441     CALL STEXP 
      00AE85 81               [ 4]  442     RET 
                                    443 
                                    444 
                                    445 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    446 ;    F* ( f#1 f#2 -- f#3 )
                                    447 ;    float product 
                                    448 ;    f#3=f#1 * f#2 
                                    449 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002E06                        450     _HEADER FSTAR,2,"F*"
      00AE86 AE 5B                    1         .word LINK 
                           002E08     2         LINK=.
      00AE88 02                       3         .byte 2  
      00AE89 46 2A                    4         .ascii "F*"
      00AE8B                          5         FSTAR:
      00AE8B CD AC 18         [ 4]  451     CALL ATEXP 
      00AE8E CD 85 E1         [ 4]  452     CALL TOR 
      00AE91 CD A6 BA         [ 4]  453     CALL DSWAP 
      00AE94 CD AC 18         [ 4]  454     CALL ATEXP
      00AE97 CD 85 C2         [ 4]  455     CALL RFROM 
      00AE9A CD 88 47         [ 4]  456     CALL PLUS  
      00AE9D CD 85 E1         [ 4]  457     CALL TOR
      00AEA0 CD A9 B7         [ 4]  458     CALL DSTAR
      00AEA3 CD A5 B0         [ 4]  459     CALL DSIGN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      00AEA6 CD 88 05         [ 4]  460     CALL NROT 
      00AEA9 CD A5 99         [ 4]  461     CALL DABS 
      00AEAC                        462 FSTAR1:
      00AEAC CD 86 18         [ 4]  463     CALL DUPP
      002E2F                        464     _DOLIT 0X7F   
      00AEAF CD 84 F3         [ 4]    1     CALL DOLIT 
      00AEB2 00 7F                    2     .word 0X7F 
      00AEB4 CD 89 43         [ 4]  465     CALL GREAT 
      002E37                        466     _QBRAN FSTAR2 
      00AEB7 CD 85 26         [ 4]    1     CALL QBRAN
      00AEBA AE D9                    2     .word FSTAR2
      00AEBC CD AA DF         [ 4]  467     CALL FBASE 
      00AEBF CD 85 71         [ 4]  468     CALL AT 
      00AEC2 CD A5 C9         [ 4]  469     CALL DSLMOD 
      00AEC5 CD 87 E6         [ 4]  470     CALL ROT 
      00AEC8 CD 86 0E         [ 4]  471     CALL DROP
      00AECB CD 85 C2         [ 4]  472     CALL RFROM 
      00AECE CD 8B 45         [ 4]  473     CALL ONEP 
      00AED1 CD 85 E1         [ 4]  474     CALL TOR  
      002E54                        475     _BRAN FSTAR1
      00AED4 CD 85 3D         [ 4]    1     CALL BRAN 
      00AED7 AE AC                    2     .word FSTAR1 
      00AED9                        476 FSTAR2:
      00AED9 CD 87 E6         [ 4]  477     CALL ROT 
      002E5C                        478     _QBRAN FSTAR3 
      00AEDC CD 85 26         [ 4]    1     CALL QBRAN
      00AEDF AE E4                    2     .word FSTAR3
      00AEE1 CD 88 84         [ 4]  479     CALL DNEGA 
      00AEE4                        480 FSTAR3:     
      00AEE4 CD 85 C2         [ 4]  481     CALL RFROM 
      00AEE7 CD AC 62         [ 4]  482     CALL STEXP 
      00AEEA 81               [ 4]  483     RET 
                                    484 
                                    485 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    486 ;  F/ ( f#1 f#2 -- f#3 )
                                    487 ;  float division
                                    488 ;  f#3 = f#1/f#2
                                    489 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002E6B                        490     _HEADER FSLASH,2,"F/"
      00AEEB AE 88                    1         .word LINK 
                           002E6D     2         LINK=.
      00AEED 02                       3         .byte 2  
      00AEEE 46 2F                    4         .ascii "F/"
      00AEF0                          5         FSLASH:
      00AEF0 CD AC 18         [ 4]  491     CALL ATEXP  ; f#1 dm2 e2  
      00AEF3 CD 85 E1         [ 4]  492     CALL TOR    ; f#1 dm2   R: e2 
      00AEF6 CD A5 B0         [ 4]  493     CALL DSIGN  ; f#1 dm2 s2 
      00AEF9 CD 85 E1         [ 4]  494     CALL TOR    ; f#1 dm2  R: e2 s2 
      00AEFC CD A5 99         [ 4]  495     CALL DABS   ; f#1 +dm2 
      00AEFF CD A6 BA         [ 4]  496     CALL DSWAP  ; +dm2 f#1 
      00AF02 CD AC 18         [ 4]  497     CALL ATEXP  ; +dm2 dm1 e1 
      00AF05 CD 85 C2         [ 4]  498     CALL RFROM  ; +dm2 dm1 e1 s2 
      00AF08 CD 86 28         [ 4]  499     CALL SWAPP  ; +dm2 dm1 s1 e1 
      00AF0B CD 85 E1         [ 4]  500     CALL TOR    ; +dm2 dm1 s2 R: e2 e1  
      00AF0E CD 88 05         [ 4]  501     CALL NROT   ; +dm2 s2 dm1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      00AF11 CD A5 B0         [ 4]  502     CALL DSIGN  ; +dm2 s2 dm1 s1 
      00AF14 CD 88 05         [ 4]  503     CALL NROT   ; +dm2 s2 s1 dm1 
      00AF17 CD A5 99         [ 4]  504     CALL DABS   ; +dm2 s2 s1 +dm1  
      00AF1A CD 85 E1         [ 4]  505     CALL TOR    
      00AF1D CD 85 E1         [ 4]  506     CALL TOR    ; +dm2 s2 s1 R: e2 e1 +dm1  
      00AF20 CD 86 A0         [ 4]  507     CALL XORR   ; +dm2 s R: e2 e1 +dm1 
      00AF23 CD 88 05         [ 4]  508     CALL NROT   ; s +dm2 
      00AF26 CD 85 C2         [ 4]  509     CALL RFROM 
      00AF29 CD 85 C2         [ 4]  510     CALL RFROM  ; s +dm2 +dm1 
      00AF2C CD A6 BA         [ 4]  511     CALL DSWAP  ; s +dm1 +dm2 
      00AF2F                        512 FSLASH1:
      00AF2F CD 86 18         [ 4]  513     CALL DUPP 
      002EB2                        514     _QBRAN FSLASH4 
      00AF32 CD 85 26         [ 4]    1     CALL QBRAN
      00AF35 AF 66                    2     .word FSLASH4
      00AF37                        515 FSLASH2: 
                                    516 ; reduce divisor
      00AF37 CD AA DF         [ 4]  517     CALL FBASE 
      00AF3A CD 85 71         [ 4]  518     CALL AT 
      00AF3D CD A5 C9         [ 4]  519     CALL DSLMOD
      00AF40 CD 87 E6         [ 4]  520     CALL ROT 
      00AF43 CD 86 0E         [ 4]  521     CALL DROP ; drop remainder 
      00AF46 CD 85 E1         [ 4]  522     CALL TOR 
      00AF49 CD 85 E1         [ 4]  523     CALL TOR
                                    524 ; redure divident      
      00AF4C CD AA DF         [ 4]  525     CALL FBASE 
      00AF4F CD 85 71         [ 4]  526     CALL AT 
      00AF52 CD A5 C9         [ 4]  527     CALL DSLMOD 
      00AF55 CD 87 E6         [ 4]  528     CALL ROT    
      00AF58 CD 86 0E         [ 4]  529     CALL DROP    ; drop remainder 
      00AF5B CD 85 C2         [ 4]  530     CALL RFROM 
      00AF5E CD 85 C2         [ 4]  531     CALL RFROM   ; s +dm1 +dm2 
      002EE1                        532     _BRAN FSLASH1 
      00AF61 CD 85 3D         [ 4]    1     CALL BRAN 
      00AF64 AF 2F                    2     .word FSLASH1 
      00AF66                        533 FSLASH4:
      00AF66 CD 86 0E         [ 4]  534     CALL DROP   ; drop divisor hi, is 0 
      00AF69 CD A5 C9         [ 4]  535     CALL DSLMOD 
      00AF6C CD 99 EC         [ 4]  536 CALL DOTS 
                                    537 ; scale up dquot to include remainder 
      002EEF                        538     _DOLIT 2 
      00AF6F CD 84 F3         [ 4]    1     CALL DOLIT 
      00AF72 00 02                    2     .word 2 
      00AF74 CD 8C 0A         [ 4]  539     CALL PICK 
      00AF77 CD 88 05         [ 4]  540     CALL NROT  ; s r r dquot 
      00AF7A                        541 FSL1:
      002EFA                        542     _DOLIT 2
      00AF7A CD 84 F3         [ 4]    1     CALL DOLIT 
      00AF7D 00 02                    2     .word 2 
      00AF7F CD 8C 0A         [ 4]  543     CALL PICK 
      002F02                        544     _QBRAN FSL4 
      00AF82 CD 85 26         [ 4]    1     CALL QBRAN
      00AF85 AF AD                    2     .word FSL4
      00AF87 CD AA DF         [ 4]  545     CALL FBASE 
      00AF8A CD 85 71         [ 4]  546     CALL AT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      00AF8D CD A6 71         [ 4]  547     CALL DSSTAR
      00AF90 CD 85 C2         [ 4]  548     CALL RFROM 
      00AF93 CD 8B 52         [ 4]  549     CALL ONEM 
      00AF96 CD 85 E1         [ 4]  550     CALL TOR 
      00AF99 CD 87 E6         [ 4]  551     CALL ROT 
      00AF9C CD AA DF         [ 4]  552     CALL FBASE 
      00AF9F CD 85 71         [ 4]  553     CALL AT 
      00AFA2 CD 8A 6B         [ 4]  554     CALL SLASH 
      00AFA5 CD 88 05         [ 4]  555     CALL NROT 
      002F28                        556     _BRAN FSL1 
      00AFA8 CD 85 3D         [ 4]    1     CALL BRAN 
      00AFAB AF 7A                    2     .word FSL1 
      00AFAD                        557 FSL4:
      00AFAD CD 87 E6         [ 4]  558     CALL ROT
      00AFB0 CD 85 E1         [ 4]  559     CALL TOR 
      00AFB3 CD 87 E6         [ 4]  560     CALL ROT 
      00AFB6 CD 85 C2         [ 4]  561     CALL RFROM 
      00AFB9 CD AA 1F         [ 4]  562     CALL DPLUS  
      00AFBC CD 87 E6         [ 4]  563     CALL ROT    ; dquot s 
      002F3F                        564     _QBRAN FSLASH5 
      00AFBF CD 85 26         [ 4]    1     CALL QBRAN
      00AFC2 AF C7                    2     .word FSLASH5
      00AFC4 CD 88 84         [ 4]  565     CALL DNEGA  ; negate quotient 
      00AFC7                        566 FSLASH5:
      00AFC7 CD 85 C2         [ 4]  567     CALL RFROM 
      00AFCA CD 85 C2         [ 4]  568     CALL RFROM 
      00AFCD CD 88 47         [ 4]  569     CALL PLUS   
      00AFD0 CD AC 62         [ 4]  570     CALL STEXP 
      00AFD3 81               [ 4]  571     RET     
                                    572 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



                                   4779 .endif 
                                   4780 
                                   4781 ;===============================================================
                                   4782 
                           002E6D  4783 LASTN =	LINK   ;last name defined
                                   4784 
                                   4785 ; application code begin here
      00B000                       4786 	.bndry 128 ; align on flash block  
      00B000                       4787 app_space: 
                                   4788 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        000863 R   |   6 ABOR1      001344 R
  6 ABOR2      00135B R   |   6 ABORQ      00133C R   |   6 ABORT      00132D R
  6 ABRTQ      001618 R   |   6 ABSS       00085A R   |   6 ACCEP      0012C3 R
  6 ACCP1      0012CC R   |   6 ACCP2      0012F2 R   |   6 ACCP3      0012F5 R
  6 ACCP4      0012F7 R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
    ADC_CR1_=  000001     |     ADC_CR1_=  000004     |     ADC_CR1_=  000005 
    ADC_CR1_=  000006     |     ADC_CR2 =  005402     |     ADC_CR2_=  000003 
    ADC_CR2_=  000004     |     ADC_CR2_=  000005     |     ADC_CR2_=  000006 
    ADC_CR2_=  000001     |     ADC_CR3 =  005403     |     ADC_CR3_=  000007 
    ADC_CR3_=  000006     |     ADC_CSR =  005400     |     ADC_CSR_=  000006 
    ADC_CSR_=  000004     |     ADC_CSR_=  000000     |     ADC_CSR_=  000001 
    ADC_CSR_=  000002     |     ADC_CSR_=  000003     |     ADC_CSR_=  000007 
    ADC_CSR_=  000005     |     ADC_DRH =  005404     |     ADC_DRL =  005405 
    ADC_TDRH=  005406     |     ADC_TDRL=  005407     |   6 ADRADJ     000745 R
    AFR     =  004803     |     AFR0_ADC=  000000     |     AFR1_TIM=  000001 
    AFR2_CCO=  000002     |     AFR3_TIM=  000003     |     AFR4_TIM=  000004 
    AFR5_TIM=  000005     |     AFR6_I2C=  000006     |     AFR7_BEE=  000007 
  6 AFT        001603 R   |   6 AGAIN      001559 R   |   6 AHEAD      0015B6 R
  6 ALLOT      00146C R   |   6 ANDD       0005F7 R   |     APP_CP  =  004004 
    APP_LAST=  004000     |     APP_RUN =  004002     |     APP_VP  =  004006 
  6 AT         0004F1 R   |   6 ATEXE      000C55 R   |   6 ATEXP      002B98 R
  6 AUTORUN    00012B R   |     AWU_APR =  0050F1     |     AWU_CSR =  0050F0 
    AWU_TBR =  0050F2     |     B0_MASK =  000001     |     B115200 =  000006 
  6 B115K2     0003E2 R   |     B19200  =  000003     |   6 B19K2      0003BF R
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
  6 B2K4       000390 R   |     B2_MASK =  000004     |     B38400  =  000004 
    B3_MASK =  000008     |     B460800 =  000008     |     B4800   =  000001 
  6 B4K8       00039E R   |     B4_MASK =  000010     |     B57600  =  000005 
  6 B57K6      0003D0 R   |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
  6 B9K6       0003AE R   |   6 BACK1      00126B R   |   6 BASE       000668 R
    BASEE   =  00000A     |   6 BAUD       0003F2 R   |     BCNT    =  000001 
  6 BCOMP      0014AE R   |   6 BDIGS      000D3C R   |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
  6 BEGIN      00153B R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
  6 BKSLA      0010C0 R   |   6 BKSP       00123B R   |     BKSPP   =  000008 
  6 BLANK      000B24 R   |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |   6 BRAN       0004BD R   |     BTW     =  000001 
  6 BUF2ROW    002070 R   |   6 BYE        0000B8 R   |     CADR    =  000003 
    CALLL   =  0000CD     |   6 CALLOT     0022B9 R   |     CAN_DGR =  005426 
    CAN_FPSR=  005427     |     CAN_IER =  005425     |     CAN_MCR =  005420 
    CAN_MSR =  005421     |     CAN_P0  =  005428     |     CAN_P1  =  005429 
    CAN_P2  =  00542A     |     CAN_P3  =  00542B     |     CAN_P4  =  00542C 
    CAN_P5  =  00542D     |     CAN_P6  =  00542E     |     CAN_P7  =  00542F 
    CAN_P8  =  005430     |     CAN_P9  =  005431     |     CAN_PA  =  005432 
    CAN_PB  =  005433     |     CAN_PC  =  005434     |     CAN_PD  =  005435 
    CAN_PE  =  005436     |     CAN_PF  =  005437     |     CAN_RFR =  005424 
    CAN_TPR =  005423     |     CAN_TSR =  005422     |     CARRY   =  00002C 
    CASE_SEN=  000000     |   6 CAT        00050F R   |   6 CCOMMA     001490 R
    CC_C    =  000000     |     CC_H    =  000004     |     CC_I0   =  000003 
    CC_I1   =  000005     |     CC_N    =  000002     |     CC_V    =  000007 
    CC_Z    =  000001     |     CELLL   =  000002     |   6 CELLM      000AA9 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]

Symbol Table

  6 CELLP      000A9A R   |   6 CELLS      000AB8 R   |     CFG_GCR =  007F60 
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   6 CHAR1      000E92 R
  6 CHAR2      000E95 R   |   6 CHKIVEC    001F5E R   |     CLKOPT  =  004807 
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
    CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2     |   6 CMOV1      000C74 R
  6 CMOV2      000C8C R   |   6 CMOVE      000C6C R   |     CNTDWN  =  000034 
  6 CNTXT      0006EB R   |   6 COLD       001A5F R   |   6 COLD1      001A5F R
  6 COLON      0017B1 R   |   6 COMMA      001479 R   |   6 COMPI      0014BE R
    COMPO   =  000040     |   6 CONSTANT   00185B R   |   6 COUNT      000C08 R
  6 CPP        000707 R   |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
  6 CR         000EC0 R   |   6 CREAT      0017F7 R   |     CRR     =  00000D 
  6 CSTOR      0004FE R   |   6 CTABLE     0022DA R   |   6 CTAT       0022FB R
  6 CTINIT     002323 R   |   6 D2SLASH    002881 R   |   6 DABS       002519 R
  6 DABS1      002527 R   |   6 DAT        000BE8 R   |     DATSTK  =  001680 
  6 DCLZ       002668 R   |   6 DCLZ1      002671 R   |   6 DCLZ4      002677 R
  6 DCLZ8      002684 R   |   6 DCMP       002787 R   |   6 DCMP2      002793 R
  6 DCMP4      0027AE R   |   6 DCMP_EQU   0027A0 R   |   6 DCMP_GRE   0027AA R
  6 DCMP_SMA   0027A4 R   |   6 DCONST     001890 R   |   6 DDIG       00258A R
  6 DDIGS      0025A3 R   |   6 DDOT       0025BA R   |   6 DDOT0      0025CE R
  6 DDOT1      0025E4 R   |   6 DDROP      0007A7 R   |   6 DDSLMOD    0028D2 R
  6 DDSLMOD1   0028EF R   |   6 DDSTAR1    002956 R   |   6 DDSTAR2    002976 R
  6 DDSTAR3    002999 R   |   6 DDUP       0007B2 R   |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |   6 DECIM      000DEC R   |   6 DEPTH      000B73 R
  6 DEQU4      002720 R   |   6 DEQUAL     00270B R   |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   6 DGREAT     00272C R   |   6 DGREAT4    002741 R
  6 DGTQ1      000E31 R   |   6 DI         0000C6 R   |   6 DIG        000D65 R
  6 DIGIT      000D00 R   |   6 DIGS       000D76 R   |   6 DIGS1      000D76 R
  6 DIGS2      000D83 R   |   6 DIGTQ      000E00 R   |     DISCOVER=  000000 
  6 DLESS      00274D R   |   6 DLESS4     002762 R   |   6 DLITER     002841 R
  6 DLSHIFT    00289C R   |   6 DLSHIFT1   0028AD R   |   6 DLSHIFT2   0028C2 R
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   6 DN1        000821 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]

Symbol Table

  6 DNEG1      00250E R   |   6 DNEGA      000804 R   |   6 DNEGAT     0024EF R
  6 DOCONST    00187B R   |   6 DOLIT      000473 R   |   6 DONXT      000487 R
    DOORBELL=  000000     |   6 DOSTR      000ED6 R   |   6 DOT        000F79 R
  6 DOT1       000F8F R   |   6 DOTI1      0019E0 R   |   6 DOTID      0019CA R
  6 DOTO1      0013D0 R   |   6 DOTOK      0013B6 R   |   6 DOTPR      0010A2 R
  6 DOTQ       001632 R   |   6 DOTQP      000EFF R   |   6 DOTR       000F0D R
  6 DOTS       00196C R   |   6 DOTS1      001977 R   |   6 DOTS2      001980 R
  6 DOVAR      000658 R   |   6 DOVER      002868 R   |   6 DO_DCONS   0018B3 R
  6 DPLUS      00299F R   |   6 DPLUS1     0029C6 R   |   6 DRFROM     0027D7 R
  6 DROP       00058E R   |   6 DROT       0026D1 R   |   6 DSIGN      002530 R
  6 DSIGN1     00253A R   |   6 DSLMOD     002549 R   |   6 DSLMOD3    002564 R
  6 DSLMOD4    002570 R   |   6 DSLMODa    00256B R   |   6 DSLMODb    002576 R
  6 DSSTAR     0025F1 R   |   6 DSSTAR1    002608 R   |   6 DSSTAR3    002631 R
  6 DSTAR      002937 R   |   6 DSTOR      000BC2 R   |   6 DSUB       0029D1 R
  6 DSUB1      0029F8 R   |   6 DSWAP      00263A R   |   6 DTOR       0027B9 R
  6 DUMP       001922 R   |   6 DUMP1      001939 R   |   6 DUMP3      00195B R
  6 DUMPP      0018F1 R   |   6 DUPP       000598 R   |   6 DVARIA     0027F5 R
  6 DZEQUAL    0024D1 R   |   6 DZLESS     00276F R   |   6 DZLESS1    002779 R
  6 EDIGS      000DA1 R   |   6 EDOT       002C61 R   |   6 EDOT0      002C79 R
  6 EDOT1      002C87 R   |   6 EDOT2      002C8D R   |   6 EDOT3      002CA6 R
  6 EDOT4      002CD2 R   |   6 EDOT5      002CEE R   |   6 EECSTORE   001D0F R
  6 EEPCP      001B35 R   |   6 EEPLAST    001B08 R   |   6 EEPROM     001AF0 R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_R=  000010 
    EEPROM_S=  000800     |   6 EEPRUN     001B1F R   |   6 EEPVP      001B4B R
  6 EESTORE    001D5B R   |   6 EE_CCOMM   002025 R   |   6 EE_COMMA   002004 R
  6 EE_CREAD   001CA0 R   |   6 EE_READ    001C7E R   |   6 EI         0000BF R
  6 ELSEE      001591 R   |   6 EMIT       000438 R   |   6 ENEPER     002245 R
    EOL_CR  =  000001     |     EOL_LF  =  000000     |   6 EQ1        00087E R
  6 EQUAL      000868 R   |   6 ERASE      000CCE R   |     ERR     =  00001B 
  6 EVAL       0013F9 R   |   6 EVAL1      0013F9 R   |   6 EVAL2      001415 R
  6 EXE1       000C63 R   |   6 EXECU      0004CD R   |     EXT     =  000000 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |   6 EXTRC      000D28 R
  6 FADDR      0020F2 R   |   6 FARAT      001BB6 R   |   6 FARCAT     001BC2 R
  6 FBASE      002A5F R   |   6 FC_XOFF    000465 R   |   6 FC_XON     00044F R
  6 FDOT       002CFD R   |   6 FDOT0      002D3C R   |   6 FDOT1      002D2B R
  6 FDOT10     002D98 R   |   6 FDOT2      002D4A R   |   6 FDOT3      002D63 R
  6 FDOT6      002D73 R   |   6 FDOT7      002D78 R   |   6 FDOT8      002D80 R
  6 FDOT9      002D88 R   |   6 FER        002A9B R   |     FHSE    =  7A1200 
    FHSI    =  F42400     |   6 FILL       000C9B R   |   6 FILL1      000CB8 R
  6 FILL2      000CC1 R   |   6 FIND       001197 R   |   6 FIND1      0011B5 R
  6 FIND2      0011E3 R   |   6 FIND3      0011EF R   |   6 FIND4      001203 R
  6 FIND5      001210 R   |   6 FIND6      0011F4 R   |   6 FINIT      002A85 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_PU=  0000AE     |     FLASH_SI=  020000     |     FLASH_WS=  00480D 
  6 FLOATQ     002DB1 R   |     FLSI    =  01F400     |   6 FMOVE      0020FD R
  6 FMOVE2     00212E R   |   6 FNE        002ABD R   |   6 FOR        00150E R
  6 FORGET     00015C R   |   6 FORGET1    00018B R   |   6 FORGET2    000211 R
  6 FORGET4    00021A R   |   6 FORGET6    0001D3 R   |   6 FOV        002AD2 R
  6 FPSTOR     001AD1 R   |   6 FPSW       002A4E R   |     FPTR    =  000036 
  6 FREEVAR    000227 R   |   6 FREEVAR4   00025D R   |   6 FRESET     002A71 R
  6 FSL1       002EFA R   |   6 FSL4       002F2D R   |   6 FSLASH     002E70 R
  6 FSLASH1    002EAF R   |   6 FSLASH2    002EB7 R   |   6 FSLASH4    002EE6 R
  6 FSLASH5    002F47 R   |   6 FSTAR      002E0B R   |   6 FSTAR1     002E2C R
  6 FSTAR2     002E59 R   |   6 FSTAR3     002E64 R   |   6 FZE        002AA8 R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |   6 GREAT      0008C3 R   |   6 GREAT1     0008D9 R
  6 HDOT       000F5C R   |   6 HERE       000C1F R   |   6 HEX        000DD7 R
  6 HI         001A1C R   |   6 HLD        0006D8 R   |   6 HOLD       000D4C R
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
    I2C_WRIT=  000000     |   6 ICOLON     0017C2 R   |   6 IFETCH     00152C R
  6 IFF        001569 R   |   6 IFMOVE     0021D6 R   |   6 ILOG       002A05 R
  6 ILOG1      002A10 R   |   6 ILOG2      002A3D R   |     IMEDD   =  000080 
  6 IMMED      0017D4 R   |   6 INCH       00042C R   |   6 INC_FPTR   001C4B R
  6 INITOFS    00178A R   |   6 INN        000686 R   |     INPUT_DI=  000000 
    INPUT_EI=  000001     |     INPUT_FL=  000000     |     INPUT_PU=  000001 
  6 INTE1      001398 R   |   6 INTER      00136E R   |   6 INTQ       00237F R
    INT_ADC2=  000016     |     INT_AUAR=  000012     |     INT_AWU =  000001 
    INT_CAN_=  000008     |     INT_CAN_=  000009     |     INT_CLK =  000002 
    INT_EXTI=  000003     |     INT_EXTI=  000004     |     INT_EXTI=  000005 
    INT_EXTI=  000006     |     INT_EXTI=  000007     |     INT_FLAS=  000018 
    INT_I2C =  000013     |     INT_SPI =  00000A     |     INT_TIM1=  00000C 
    INT_TIM1=  00000B     |     INT_TIM2=  00000E     |     INT_TIM2=  00000D 
    INT_TIM3=  000010     |     INT_TIM3=  00000F     |     INT_TIM4=  000017 
    INT_TLI =  000000     |     INT_UART=  000011     |     INT_UART=  000015 
    INT_UART=  000014     |     INT_VECT=  008060     |     INT_VECT=  00800C 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]

Symbol Table

    INT_VECT=  008028     |     INT_VECT=  00802C     |     INT_VECT=  008010 
    INT_VECT=  008014     |     INT_VECT=  008018     |     INT_VECT=  00801C 
    INT_VECT=  008020     |     INT_VECT=  008024     |     INT_VECT=  008068 
    INT_VECT=  008054     |     INT_VECT=  008000     |     INT_VECT=  008030 
    INT_VECT=  008038     |     INT_VECT=  008034     |     INT_VECT=  008040 
    INT_VECT=  00803C     |     INT_VECT=  008048     |     INT_VECT=  008044 
    INT_VECT=  008064     |     INT_VECT=  008008     |     INT_VECT=  008004 
    INT_VECT=  008050     |     INT_VECT=  00804C     |     INT_VECT=  00805C 
    INT_VECT=  008058     |   6 INVER      0007E1 R   |     IPR0    =  000002 
    IPR1    =  000001     |     IPR2    =  000000     |     IPR3    =  000003 
    IPR_MASK=  000003     |     IRET_COD=  000080     |   6 ISEMI      00171F R
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |   6 JSRC       001774 R
  6 KEY        000E40 R   |   6 KTAP       001288 R   |   6 KTAP1      0012AB R
  6 KTAP2      0012AE R   |   6 LAST       000717 R   |   6 LASTN   =  002E6D R
  6 LBRAC      0013A5 R   |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |   6 LESS       0008A5 R   |     LF      =  00000A 
  6 LINK    =  002E6D R   |   6 LITER      0014E0 R   |   6 LN2S       0022A1 R
  6 LOCK       001C37 R   |   6 LOG2S      00228B R   |   6 LSCALE     002DBB R
  6 LSHIFT     000AE3 R   |   6 LSHIFT1    000AEC R   |   6 LSHIFT4    000AF4 R
  6 LT1        0008BB R   |     MASKK   =  001F7F     |   6 MAX        0008E3 R
  6 MAX1       0008F6 R   |   6 MIN        000900 R   |   6 MIN1       000913 R
  6 MMOD1      00099C R   |   6 MMOD2      0009B0 R   |   6 MMOD3      0009C7 R
  6 MMSM1      000957 R   |   6 MMSM3      00095B R   |   6 MMSM4      000967 R
  6 MMSMa      000962 R   |   6 MMSMb      00096D R   |   6 MODD       0009E1 R
  6 MONE       000B4A R   |     MS      =  000032     |   6 MSEC       0002D2 R
  6 MSMOD      00097F R   |   6 MSTA1      000A72 R   |   6 MSTAR      000A4F R
    NAFR    =  004804     |   6 NAMEQ      001230 R   |   6 NAMET      001141 R
    NCLKOPT =  004808     |   6 NDROT      002695 R   |   6 NEGAT      0007F2 R
  6 NEX1       000494 R   |   6 NEXT       00151D R   |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
  6 NROT       000785 R   |   6 NTIB       000696 R   |     NUBC    =  004802 
    NUCLEO  =  000001     |   6 NUFQ       000E56 R   |   6 NUFQ1      000E6F R
  6 NUMBQ      0023F1 R   |   6 NUMQ0      002432 R   |   6 NUMQ1      002454 R
  6 NUMQ3      002498 R   |   6 NUMQ4      0024B9 R   |   6 NUMQ8      0024C1 R
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   6 NonHandl   000000 R
  6 OFFSET     00073C R   |     OFS     =  000005     |   6 ONE        000B3C R
  6 ONEM       000AD2 R   |   6 ONEP       000AC5 R   |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTIMIZE=  000001     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   6 ORIG       00004B R   |   6 ORR        00060B R
  6 OUTPUT     00043D R   |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |   6 OVER       0005C2 R
  6 OVERT      0016ED R   |     PA      =  000000     |   6 PACKS      000CDF R
  6 PAD        000C30 R   |   6 PAREN      0010B1 R   |   6 PARS       000FAA R
  6 PARS1      000FD5 R   |   6 PARS2      001000 R   |   6 PARS3      001003 R
  6 PARS4      00100C R   |   6 PARS5      00102F R   |   6 PARS6      001044 R
  6 PARS7      001053 R   |   6 PARS8      001062 R   |   6 PARSE      001073 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]

Symbol Table

  6 PAUSE      0002E2 R   |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |   6 PDUM1      001904 R   |   6 PDUM2      001915 R
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
    PH_ODR  =  005023     |     PI      =  000028     |   6 PICK       000B8A R
  6 PII        002204 R   |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   6 PLUS       0007C7 R   |   6 PNAM1      0016A2 R
  6 POSMANT    002BD2 R   |   6 PRESE      001424 R   |     PROD1   =  000026 
    PROD2   =  000028     |     PROD3   =  00002A     |   6 PROTECTE   000203 R
  6 PSTOR      000BA1 R   |     PTR16   =  000037     |     PTR8    =  000038 
  6 PTRPLUS    001C63 R   |   6 QBRAN      0004A6 R   |   6 QDUP       000755 R
  6 QDUP1      00075F R   |   6 QKEY       00041A R   |   6 QSTAC      0013DC R
  6 QUERY      001308 R   |   6 QUEST      000F9C R   |   6 QUIT       001441 R
  6 QUIT1      001449 R   |   6 QUIT2      00144C R   |   6 RAM2EE     00209E R
    RAMBASE =  000000     |   6 RAMLAST    00072A R   |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   6 RANDOM     000280 R
  6 RAT        000555 R   |   6 RBRAC      001761 R   |   6 REPEA      0015E6 R
  6 RFREE      002085 R   |   6 RFROM      000542 R   |     ROP     =  004800 
  6 ROT        000766 R   |   6 ROW2BUF    002047 R   |     ROWBUFF =  001680 
    RP0     =  000030     |   6 RPAT       00051F R   |     RPP     =  0017FF 
  6 RPSTO      00052C R   |   6 RSCALE     002DE2 R   |   6 RSHIFT     000AFF R
  6 RSHIFT1    000B08 R   |   6 RSHIFT4    000B10 R   |     RST_SR  =  0050B3 
  6 RT12_2     002274 R   |   6 SAME1      00115F R   |   6 SAME2      001188 R
  6 SAMEQ      001157 R   |   6 SCOM1      0016D7 R   |   6 SCOM2      0016DA R
  6 SCOMP      0016B9 R   |   6 SEED       000267 R   |     SEEDX   =  00003A 
    SEEDY   =  00003C     |   6 SEMIS      0016FD R   |   6 SETISP     0000D2 R
  6 SET_RAML   001844 R   |   6 SFN        002B3F R   |     SFR_BASE=  005000 
    SFR_END =  0057FF     |   6 SFV        002B77 R   |   6 SFZ        002B08 R
  6 SIGN       000D8B R   |   6 SIGN1      000D9B R   |   6 SLASH      0009EB R
  6 SLMOD      0009CF R   |   6 SNAME      00166C R   |     SP0     =  00002E 
  6 SPACE      000E78 R   |   6 SPACS      000E87 R   |   6 SPAT       000578 R
    SPI_CR1 =  005200     |     SPI_CR2 =  005201     |     SPI_CRCP=  005205 
    SPI_DR  =  005204     |     SPI_ICR =  005202     |     SPI_RXCR=  005206 
    SPI_SR  =  005203     |     SPI_TXCR=  005207     |     SPP     =  001680 
    SPSAVE  =  000001     |   6 SPSTO      000585 R   |   6 SQRT10     00225D R
  6 SQRT2      00221B R   |   6 SQRT3      002232 R   |   6 SSMOD      000A7B R
    SSP     =  000001     |     STACK   =  0017FF     |   6 STAR       000A44 R
  6 STASL      000A8C R   |   6 STEXP      002BE2 R   |   6 STEXP1     002BF8 R
  6 STEXP2     002C34 R   |   6 STEXP3     002C47 R   |   6 STOD       000829 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]

Symbol Table

  6 STORE      0004DA R   |   6 STR        000DB9 R   |   6 STRCQ      0014EE R
  6 STRQ       001625 R   |   6 STRQP      000EF5 R   |   6 SUBB       000840 R
  6 SWAPP      0005A8 R   |     SWIM_CSR=  007F80     |   6 TAP        001272 R
  6 TBOOT      001A53 R   |   6 TBUF       0006A6 R   |     TBUFFBAS=  001680 
  6 TCHAR      000B5B R   |   6 TEMP       000677 R   |   6 TEVAL      0006C9 R
  6 TFLASH     0006B8 R   |   6 THENN      00157E R   |   6 TIB        000C41 R
    TIBB    =  001700     |     TIBBASE =  001700     |     TIC     =  000027 
  6 TICK       001458 R   |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM4_SR_=  000000     |   6 TIMEOUTQ   000312 R   |   6 TIMER      0002FC R
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
    TIM_CR1_=  000005     |     TIM_CR1_=  000004     |     TIM_CR1_=  000003 
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |   6 TNAM2      00199A R
  6 TNAM3      0019B8 R   |   6 TNAM4      0019BE R   |   6 TNAME      001997 R
  6 TOFLASH    000337 R   |   6 TOKEN      001133 R   |   6 TOR        000561 R
  6 TORAM      000377 R   |     TRUEE   =  00FFFF     |   6 TWOSL      000B17 R
  6 TYPE1      000EA7 R   |   6 TYPE2      000EB3 R   |   6 TYPES      000EA2 R
  6 Timer4Ha   000005 R   |     UART1   =  000000     |     UART1_BA=  005230 
    UART1_BR=  005232     |     UART1_BR=  005233     |     UART1_CR=  005234 
    UART1_CR=  005235     |     UART1_CR=  005236     |     UART1_CR=  005237 
    UART1_CR=  005238     |     UART1_DR=  005231     |     UART1_GT=  005239 
    UART1_PO=  000000     |     UART1_PS=  00523A     |     UART1_RX=  000004 
    UART1_SR=  005230     |     UART1_TX=  000005     |     UART3   =  000001 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]

Symbol Table

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
    UBC     =  004801     |     UCNTXT  =  000018     |     UCP     =  00001C 
    UCTIB   =  000010     |     UD1     =  000001     |     UD2     =  000002 
    UD3     =  000003     |     UD4     =  000004     |   6 UDOT       000F48 R
  6 UDOTR      000F28 R   |   6 UEND       000049 R   |     UFBASE  =  000008 
    UFPSW   =  00000A     |   6 UGREAT     002AE6 R   |   6 UGREAT1    002AFE R
    UHLD    =  000016     |     UINN    =  00000E     |     UINTER  =  000014 
    ULAST   =  00001E     |   6 ULES1      00089D R   |   6 ULESS      000887 R
  6 UMMOD      00093B R   |   6 UMSTA      0009FA R   |   6 UNIQ1      001663 R
  6 UNIQU      001644 R   |   6 UNLKEE     001BD1 R   |   6 UNLKFL     001BF0 R
  6 UNLOCK     001C0F R   |   6 UNTIL      001546 R   |     UOFFSET =  000020 
  6 UPDATCP    001B8E R   |   6 UPDATLAS   001B65 R   |   6 UPDATPTR   002191 R
  6 UPDATRUN   001B7D R   |   6 UPDATVP    001BA5 R   |   6 UPL1       00064C R
  6 UPLUS      000635 R   |     UPP     =  000006     |   6 UPPER      0010F6 R
  6 UPPER1     001119 R   |   6 UPPER2     001122 R   |     URLAST  =  000024 
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
    UTFLASH =  000022     |     UTIB    =  000012     |     UTMP    =  00000C 
  6 UTYP1      0018D4 R   |   6 UTYP2      0018E3 R   |   6 UTYPE      0018CF R
    UVP     =  00001A     |   6 UZERO      00002B R   |   6 VARIA      001811 R
    VAR_BASE=  000080     |     VAR_TOP =  0017BF     |     VER     =  000003 
  6 VPP        0006F9 R   |     VSIZE   =  000006     |     WANT_CON=  000001 
    WANT_DEB=  000000     |     WANT_DOU=  000001     |     WANT_FLO=  000001 
    WANT_SCA=  000001     |     WANT_SEE=  000000     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |   6 WHILE      0015CC R   |   6 WITHI      000920 R
  6 WORDD      0010DC R   |   6 WORDS      0019F4 R   |   6 WORS1      0019FA R
  6 WORS2      001A16 R   |   6 WR_BYTE    001CBA R   |   6 WR_WORD    001CDF R
  6 WTABLE     0022E9 R   |   6 WTAT       00230D R   |   6 WTINIT     002352 R
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |     XMEM_SIZ=  017830 
    XOFF    =  000013     |     XON     =  000011     |   6 XORR       000620 R
    XTEMP   =  000026     |     YTEMP   =  000028     |   6 ZEQ1       0024E1 R
  6 ZEQU1      0005ED R   |   6 ZEQUAL     0005E3 R   |   6 ZERO       000B31 R
  6 ZL1        0005DA R   |   6 ZLESS      0005D1 R   |   6 app_spac   002F80 R
  6 baudrate   00037D R   |   6 block_er   001DA5 R   |   6 clear_ra   000019 R
  6 clock_in   000066 R   |   6 copy_buf   001E05 R   |   6 copy_buf   001E24 R
  6 copy_pro   001E24 R   |     da      =  000002     |     db      =  000003 
    dc      =  000000     |     dd      =  000001     |   6 do2lit     00284C R
  6 erase_fl   001DC7 R   |   6 fmove_do   00217A R   |   6 main       000016 R
  6 next_row   002137 R   |   6 no_move    002181 R   |   6 parse_di   00239D R
  6 pristine   001EA5 R   |   6 proceed_   001DCA R   |   6 reboot     000329 R
  6 reset_ve   001F0C R   |   6 row_eras   001D85 R   |   6 row_eras   001DDE R
  6 row_eras   001E05 R   |   6 set_opti   001E79 R   |   6 set_vect   001FAD R
  6 uart_ini   000078 R   |   6 write_ro   001E49 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   2F80   flags    0

