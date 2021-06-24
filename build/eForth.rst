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
      0080B9 93 E1                  297         .word      INTER   ;'EVAL
      0080BB 00 00                  298         .word      0       ;HLD
      0080BD A9 E6                  299         .word      LASTN  ;CNTXT pointer
      0080BF 00 80                  300         .word      VAR_BASE   ;variables free space pointer 
      0080C1 AA 80                  301         .word      app_space ; FLASH free space pointer 
      0080C3 A9 E6                  302         .word      LASTN   ;LAST
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
      00812F CC 9A E5         [ 2]  374         jp  COLD   ;default=MN1
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
      008175 CD 86 48         [ 4]  435         call OVER ; ( level reg lshift rval lshift -- )
      008178 CD 84 F9         [ 4]  436         call DOLIT 
      00817B 00 03                  437         .word 3
      00817D CD 86 2E         [ 4]  438         call SWAPP  ; ( level reg lshift rval 3 lshift )
      008180 CD 8B 56         [ 4]  439         call LSHIFT ; creat slot mask 
      008183 CD 88 54         [ 4]  440         call INVER  ; ( level reg lshift rval mask )
      008186 CD 86 6A         [ 4]  441         call ANDD ; ( level reg lshift slot_masked )
      008189 CD 85 E7         [ 4]  442         call TOR  ; ( level reg lshift -- R: slot_masked )
      00818C CD 87 D9         [ 4]  443         call ROT  ; ( reg lshift level )
      00818F CD 86 2E         [ 4]  444         call SWAPP ; ( reg level lshift )
      008192 CD 8B 56         [ 4]  445         call LSHIFT  ; ( reg slot_level -- )
      008195 CD 85 C8         [ 4]  446         call RFROM ; ( reg slot_level masked_val )
      008198 CD 86 7E         [ 4]  447         call ORR   ; ( reg updated_rval )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      00819B CD 86 2E         [ 4]  448         call SWAPP 
      00819E CD 85 84         [ 4]  449         call CSTOR
                                    450 
                                    451 ; sélectionne l'application 
                                    452 ; qui démarre automatique lors 
                                    453 ; d'un COLD start 
      0081A1 81 4A                  454         .word LINK 
                           000123   455         LINK=.
      0081A3 07                     456         .byte 7
      0081A4 41 55 54 4F 52 55 4E   457         .ascii "AUTORUN"
      0081AB                        458 AUTORUN:
      0081AB CD 91 A6         [ 4]  459         call TOKEN 
      0081AE CD 86 1E         [ 4]  460         call DUPP 
      0081B1 CD 85 2C         [ 4]  461         call QBRAN 
      0081B4 82 91                  462         .word FORGET2
      0081B6 CD 92 A3         [ 4]  463         call NAMEQ
      0081B9 CD 87 C8         [ 4]  464         call QDUP 
      0081BC CD 85 2C         [ 4]  465         call QBRAN 
      0081BF 82 91                  466         .word FORGET2
      0081C1 CD 86 14         [ 4]  467         call DROP 
      0081C4 1D 00 04         [ 2]  468         subw x,#2*CELLL 
      0081C7 90 5F            [ 1]  469         clrw y 
      0081C9 FF               [ 2]  470         ldw (x),y 
      0081CA 90 AE 40 02      [ 2]  471         ldw y,#APP_RUN 
      0081CE EF 02            [ 2]  472         ldw (2,x),y 
      0081D0 CC 9D DE         [ 2]  473         jp EESTORE 
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
      0081DC CD 91 A6         [ 4]  484         call TOKEN
      0081DF CD 86 1E         [ 4]  485         call DUPP 
      0081E2 CD 85 2C         [ 4]  486         call QBRAN 
      0081E5 82 91                  487         .word FORGET2
      0081E7 CD 92 A3         [ 4]  488         call NAMEQ ; ( a -- ca na | a F )
      0081EA CD 87 C8         [ 4]  489         call QDUP 
      0081ED CD 85 2C         [ 4]  490         call QBRAN 
      0081F0 82 91                  491         .word FORGET2
                                    492 ; only forget users words 
      0081F2 CD 86 1E         [ 4]  493         call DUPP ; ( ca na na )
      0081F5 CD 84 F9         [ 4]  494         call DOLIT 
      0081F8 AA 80                  495         .word app_space 
      0081FA CD 86 2E         [ 4]  496         call SWAPP 
      0081FD CD 88 FA         [ 4]  497         call  ULESS 
      008200 CD 85 2C         [ 4]  498         call QBRAN 
      008203 82 53                  499         .word FORGET6 
                                    500 ; ( ca na -- )        
                                    501 ;reset ivec with address >= ca
      008205 CD 86 2E         [ 4]  502         call SWAPP ; ( na ca -- ) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      008208 CD 9F E1         [ 4]  503         call CHKIVEC ; ( na -- ) 
                                    504 ; start at LAST and link back to na 
                                    505 ; if variable found reset VP at that point.
      00820B                        506 FORGET1:
      00820B CD 87 8A         [ 4]  507         call LAST 
      00820E CD 85 77         [ 4]  508         call AT 
      008211 CD 86 1E         [ 4]  509         call DUPP  ; ( -- na last last )
      008214 CD 82 A7         [ 4]  510         call FREEVAR ; ( -- na last )
      008217 CD 86 1E         [ 4]  511         call DUPP 
      00821A CD 84 F9         [ 4]  512         call DOLIT 
      00821D 00 02                  513         .word 2 
      00821F CD 88 B3         [ 4]  514         call SUBB ; ( na last -- na last lfa ) link address 
      008222 CD 85 77         [ 4]  515         call AT 
      008225 CD 86 1E         [ 4]  516         call DUPP ; ( -- na last a a )
      008228 CD 87 5E         [ 4]  517         call CNTXT 
      00822B CD 85 60         [ 4]  518         call STORE
      00822E CD 87 8A         [ 4]  519         call LAST  
      008231 CD 85 60         [ 4]  520         call STORE ; ( --  na last )
      008234 CD 86 48         [ 4]  521         call OVER 
      008237 CD 88 DB         [ 4]  522         call EQUAL ; ( na last na -- na T|F ) 
      00823A CD 85 2C         [ 4]  523         call QBRAN 
      00823D 82 0B                  524         .word FORGET1 
                                    525 ; ( na -- )
      00823F CD 84 F9         [ 4]  526         call DOLIT 
      008242 00 02                  527         .word 2 
      008244 CD 88 B3         [ 4]  528         call SUBB 
      008247 CD 87 7A         [ 4]  529         call CPP 
      00824A CD 85 60         [ 4]  530         call STORE  
      00824D CD 9C 11         [ 4]  531         call UPDATCP 
      008250 CC 9B E8         [ 2]  532         jp UPDATLAST 
      008253                        533 FORGET6: ; tried to forget a RAM or system word 
                                    534 ; ( ca na -- )
      008253 1D 00 02         [ 2]  535         subw x,#CELLL 
      008256 90 BE 2E         [ 2]  536         ldw y,SP0 
      008259 FF               [ 2]  537         ldw (x),y  
      00825A CD 88 FA         [ 4]  538         call ULESS
      00825D CD 85 2C         [ 4]  539         call QBRAN 
      008260 82 83                  540         .word PROTECTED 
      008262 CD 93 AF         [ 4]  541         call ABORQ 
      008265 1D                     542         .byte 29
      008266 20 46 6F 72 20 52 41   543         .ascii " For RAM definition do REBOOT"
             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      008283                        544 PROTECTED:
      008283 CD 93 AF         [ 4]  545         call ABORQ
      008286 0A                     546         .byte 10
      008287 20 50 72 6F 74 65 63   547         .ascii " Protected"
             74 65 64
      008291                        548 FORGET2: ; no name or not found in dictionary 
      008291 CD 93 AF         [ 4]  549         call ABORQ
      008294 05                     550         .byte 5
      008295 20 77 68 61 74         551         .ascii " what"
      00829A                        552 FORGET4:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      00829A CC 86 14         [ 2]  553         jp DROP 
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
      0082A7 CD 86 1E         [ 4]  566         call DUPP ; ( na na -- )
      0082AA CD 85 95         [ 4]  567         CALL CAT  ; ( na c -- )
      0082AD CD 8B 38         [ 4]  568         call ONEP ;
      0082B0 CD 88 3A         [ 4]  569         CALL PLUS ; ( na c+1 -- ca ) 
      0082B3 CD 8B 38         [ 4]  570         call ONEP ; ( ca+ -- ) to get routne address 
      0082B6 CD 86 1E         [ 4]  571         call DUPP ; ( ca+ ca+ -- )
      0082B9 CD 85 77         [ 4]  572         CALL AT   ; ( ca+ fnaddr -- ) ; fnaddr is routine address 
      0082BC CD 84 F9         [ 4]  573         call DOLIT 
      0082BF 86 CB                  574         .word DOVAR ; if routine address is DOVAR then variable 
      0082C1 CD 88 DB         [ 4]  575         call EQUAL  ; ( ca+ fnaddr DOVAR -- ca+ T|F ) 
      0082C4 CD 85 2C         [ 4]  576         call QBRAN 
      0082C7 82 DD                  577         .word FREEVAR4 
      0082C9 CD 84 F9         [ 4]  578         call DOLIT 
      0082CC 00 02                  579         .word 2 
      0082CE CD 88 3A         [ 4]  580         call PLUS  ; ( ca+ 2 -- da ) da is data address 
      0082D1 CD 85 77         [ 4]  581         call AT 
      0082D4 CD 87 6C         [ 4]  582         call VPP   
      0082D7 CD 85 60         [ 4]  583         call STORE 
      0082DA CC 9C 28         [ 2]  584         jp UPDATVP 
      0082DD                        585 FREEVAR4: ; not variable
      0082DD CC 86 14         [ 2]  586         jp  DROP 
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
      0083B7 CD 87 9D         [ 4]  746         call RAMLAST 
      0083BA CD 85 77         [ 4]  747         call AT 
      0083BD CD 87 C8         [ 4]  748         call QDUP 
      0083C0 CD 85 2C         [ 4]  749         call QBRAN
      0083C3 83 E6                  750         .word 1$
      0083C5 CD 93 AF         [ 4]  751         call ABORQ 
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
      00847A CD 88 3A         [ 4]  851         call PLUS
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
                           000473   930 LINK	= 	.
      0084F3 45                     931 	.byte      COMPO+5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      0084F4 44 4F 4C 49 54         932         .ascii     "DOLIT"
      0084F9                        933 DOLIT:
      0084F9 1D 00 02         [ 2]  934 	SUBW X,#2
      0084FC 16 01            [ 2]  935         ldw y,(1,sp)
      0084FE 90 FE            [ 2]  936         ldw y,(y)
      008500 FF               [ 2]  937         ldw (x),y
      008501 90 85            [ 2]  938         popw y 
      008503 90 EC 02         [ 2]  939         jp (2,y)
                                    940 
                                    941 ;       next    ( -- )
                                    942 ;       Code for  single index loop.
      008506 84 F3                  943         .word      LINK
                           000488   944 LINK	= 	.
      008508 44                     945 	.byte      COMPO+4
      008509 6E 65 78 74            946         .ascii     "next"
      00850D                        947 DONXT:
      00850D 16 03            [ 2]  948 	LDW Y,(3,SP)
      00850F 90 5A            [ 2]  949 	DECW Y
      008511 2A 07            [ 1]  950 	JRPL NEX1 ; jump if N=0
      008513 90 85            [ 2]  951 	POPW Y
      008515 5B 02            [ 2]  952         addw sp,#2
      008517 90 EC 02         [ 2]  953         JP (2,Y)
      00851A                        954 NEX1:
      00851A 17 03            [ 2]  955         LDW (3,SP),Y
      00851C 90 85            [ 2]  956         POPW Y
      00851E 90 FE            [ 2]  957 	LDW Y,(Y)
      008520 90 FC            [ 2]  958 	JP (Y)
                                    959 
                                    960 ;       ?branch ( f -- )
                                    961 ;       Branch if flag is zero.
      008522 85 08                  962         .word      LINK
                           0004A4   963 LINK	= 	.
      008524 47                     964 	.byte      COMPO+7
      008525 3F 42 52 41 4E 43 48   965         .ascii     "?BRANCH"
      00852C                        966 QBRAN:	
      00852C 90 93            [ 1]  967         LDW Y,X
      00852E 1C 00 02         [ 2]  968 	ADDW X,#2
      008531 90 FE            [ 2]  969 	LDW Y,(Y)
      008533 27 0E            [ 1]  970         JREQ     BRAN
      008535 90 85            [ 2]  971 	POPW Y
      008537 90 EC 02         [ 2]  972 	JP (2,Y)
                                    973         
                                    974 ;       branch  ( -- )
                                    975 ;       Branch to an inline address.
      00853A 85 24                  976         .word      LINK
                           0004BC   977 LINK	= 	.
      00853C 46                     978 	.byte      COMPO+6
      00853D 42 52 41 4E 43 48      979         .ascii     "BRANCH"
      008543                        980 BRAN:
      008543 90 85            [ 2]  981         POPW Y
      008545 90 FE            [ 2]  982 	LDW Y,(Y)
      008547 90 FC            [ 2]  983         JP     (Y)
                                    984 
                                    985 ;       EXECUTE ( ca -- )
                                    986 ;       Execute  word at ca.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      008549 85 3C                  987         .word      LINK
                           0004CB   988 LINK	= 	.
      00854B 07                     989         .byte       7
      00854C 45 58 45 43 55 54 45   990         .ascii     "EXECUTE"
      008553                        991 EXECU:
      008553 90 93            [ 1]  992         LDW Y,X
      008555 1C 00 02         [ 2]  993 	ADDW X,#2
      008558 90 FE            [ 2]  994 	LDW  Y,(Y)
      00855A 90 FC            [ 2]  995         JP   (Y)
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
      00855C 85 4B                 1016         .word      LINK
                           0004DE  1017 LINK = .
      00855E 01                    1018         .byte      1
      00855F 21                    1019         .ascii     "!"
      008560                       1020 STORE:
      008560 90 93            [ 1] 1021         LDW Y,X
      008562 90 FE            [ 2] 1022         LDW Y,(Y)    ;Y=a
      008564 90 BF 28         [ 2] 1023         LDW YTEMP,Y
      008567 90 93            [ 1] 1024         LDW Y,X
      008569 90 EE 02         [ 2] 1025         LDW Y,(2,Y)
      00856C 91 CF 28         [ 5] 1026         LDW [YTEMP],Y ;store w at a
      00856F 1C 00 04         [ 2] 1027         ADDW X,#4 ; DDROP 
      008572 81               [ 4] 1028         RET     
                                   1029 
                                   1030 ;       @       ( a -- w )
                                   1031 ;       Push memory location to stack.
      008573 85 5E                 1032         .word      LINK
                           0004F5  1033 LINK	= 	.
      008575 01                    1034         .byte    1
      008576 40                    1035         .ascii	"@"
      008577                       1036 AT:
      008577 90 93            [ 1] 1037         LDW Y,X     ;Y = a
      008579 90 FE            [ 2] 1038         LDW Y,(Y)   ; address 
      00857B 90 FE            [ 2] 1039         LDW Y,(Y)   ; value 
      00857D FF               [ 2] 1040         LDW (X),Y ;w = @Y
      00857E 81               [ 4] 1041         RET     
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



                                   1042 
                                   1043 ;       C!      ( c b -- )
                                   1044 ;       Pop  data stack to byte memory.
      00857F 85 75                 1045         .word      LINK
                           000501  1046 LINK	= .
      008581 02                    1047         .byte      2
      008582 43 21                 1048         .ascii     "C!"
      008584                       1049 CSTOR:
      008584 90 93            [ 1] 1050         LDW Y,X
      008586 90 FE            [ 2] 1051 	LDW Y,(Y)    ;Y=b
      008588 E6 03            [ 1] 1052         LD A,(3,X)    ;D = c
      00858A 90 F7            [ 1] 1053         LD  (Y),A     ;store c at b
      00858C 1C 00 04         [ 2] 1054 	ADDW X,#4 ; DDROP 
      00858F 81               [ 4] 1055         RET     
                                   1056 
                                   1057 ;       C@      ( b -- c )
                                   1058 ;       Push byte in memory to  stack.
      008590 85 81                 1059         .word      LINK
                           000512  1060 LINK	= 	.
      008592 02                    1061         .byte      2
      008593 43 40                 1062         .ascii     "C@"
      008595                       1063 CAT:
      008595 90 93            [ 1] 1064         LDW Y,X     ;Y=b
      008597 90 FE            [ 2] 1065         LDW Y,(Y)
      008599 90 F6            [ 1] 1066         LD A,(Y)
      00859B E7 01            [ 1] 1067         LD (1,X),A
      00859D 7F               [ 1] 1068         CLR (X)
      00859E 81               [ 4] 1069         RET     
                                   1070 
                                   1071 ;       RP@     ( -- a )
                                   1072 ;       Push current RP to data stack.
      00859F 85 92                 1073         .word      LINK
                           000521  1074 LINK	= .
      0085A1 03                    1075         .byte      3
      0085A2 52 50 40              1076         .ascii     "RP@"
      0085A5                       1077 RPAT:
      0085A5 90 96            [ 1] 1078         LDW Y,SP    ;save return addr
      0085A7 1D 00 02         [ 2] 1079         SUBW X,#2
      0085AA FF               [ 2] 1080         LDW (X),Y
      0085AB 81               [ 4] 1081         RET     
                                   1082 
                                   1083 ;       RP!     ( a -- )
                                   1084 ;       Set  return stack pointer.
      0085AC 85 A1                 1085         .word      LINK
                           00052E  1086 LINK	= 	. 
      0085AE 43                    1087 	.byte      COMPO+3
      0085AF 52 50 21              1088         .ascii     "RP!"
      0085B2                       1089 RPSTO:
      0085B2 90 85            [ 2] 1090         POPW Y
      0085B4 90 BF 28         [ 2] 1091         LDW YTEMP,Y
      0085B7 90 93            [ 1] 1092         LDW Y,X
      0085B9 90 FE            [ 2] 1093         LDW Y,(Y)
      0085BB 90 94            [ 1] 1094         LDW SP,Y
      0085BD 1C 00 02         [ 2] 1095         ADDW x,#CELLL ; a was not dropped, Picatout 2020-05-24
      0085C0 92 CC 28         [ 5] 1096         JP [YTEMP]
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



                                   1097 
                                   1098 ;       R>      ( -- w )
                                   1099 ;       Pop return stack to data stack.
      0085C3 85 AE                 1100         .word      LINK
                           000545  1101 LINK	= 	. 
      0085C5 42                    1102 	.byte      COMPO+2
      0085C6 52 3E                 1103         .ascii     "R>"
      0085C8                       1104 RFROM:
      0085C8 90 85            [ 2] 1105         POPW Y    ;save return addr
      0085CA 90 BF 28         [ 2] 1106         LDW YTEMP,Y
      0085CD 90 85            [ 2] 1107         POPW Y
      0085CF 1D 00 02         [ 2] 1108         SUBW X,#2
      0085D2 FF               [ 2] 1109         LDW (X),Y
      0085D3 92 CC 28         [ 5] 1110         JP [YTEMP]
                                   1111 
                                   1112 ;       R@      ( -- w )
                                   1113 ;       Copy top of return stack to stack.
      0085D6 85 C5                 1114         .word      LINK
                           000558  1115 LINK	= 	. 
      0085D8 02                    1116         .byte      2
      0085D9 52 40                 1117         .ascii     "R@"
      0085DB                       1118 RAT:
      0085DB 16 03            [ 2] 1119         ldw y,(3,sp)
      0085DD 1D 00 02         [ 2] 1120         subw x,#CELLL 
      0085E0 FF               [ 2] 1121         ldw (x),y 
      0085E1 81               [ 4] 1122         ret 
                                   1123 
                                   1124 ;       >R      ( w -- )
                                   1125 ;       Push data stack to return stack.
      0085E2 85 D8                 1126         .word      LINK
                           000564  1127 LINK	= 	. 
      0085E4 42                    1128 	.byte      COMPO+2
      0085E5 3E 52                 1129         .ascii     ">R"
      0085E7                       1130 TOR:
      0085E7 90 85            [ 2] 1131         POPW Y    ;save return addr
      0085E9 90 BF 28         [ 2] 1132         LDW YTEMP,Y
      0085EC 90 93            [ 1] 1133         LDW Y,X
      0085EE 90 FE            [ 2] 1134         LDW Y,(Y)
      0085F0 90 89            [ 2] 1135         PUSHW Y    ;restore return addr
      0085F2 1C 00 02         [ 2] 1136         ADDW X,#2
      0085F5 92 CC 28         [ 5] 1137         JP [YTEMP]
                                   1138 
                                   1139 ;       SP@     ( -- a )
                                   1140 ;       Push current stack pointer.
      0085F8 85 E4                 1141         .word      LINK
                           00057A  1142 LINK	= 	. 
      0085FA 03                    1143         .byte      3
      0085FB 53 50 40              1144         .ascii     "SP@"
      0085FE                       1145 SPAT:
      0085FE 90 93            [ 1] 1146 	LDW Y,X
      008600 1D 00 02         [ 2] 1147         SUBW X,#2
      008603 FF               [ 2] 1148 	LDW (X),Y
      008604 81               [ 4] 1149         RET     
                                   1150 
                                   1151 ;       SP!     ( a -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



                                   1152 ;       Set  data stack pointer.
      008605 85 FA                 1153         .word      LINK
                           000587  1154 LINK	= 	. 
      008607 03                    1155         .byte      3
      008608 53 50 21              1156         .ascii     "SP!"
      00860B                       1157 SPSTO:
      00860B FE               [ 2] 1158         LDW     X,(X)     ;X = a
      00860C 81               [ 4] 1159         RET     
                                   1160 
                                   1161 ;       DROP    ( w -- )
                                   1162 ;       Discard top stack item.
      00860D 86 07                 1163         .word      LINK
                           00058F  1164 LINK	= 	. 
      00860F 04                    1165         .byte      4
      008610 44 52 4F 50           1166         .ascii     "DROP"
      008614                       1167 DROP:
      008614 1C 00 02         [ 2] 1168         ADDW X,#2     
      008617 81               [ 4] 1169         RET     
                                   1170 
                                   1171 ;       DUP     ( w -- w w )
                                   1172 ;       Duplicate  top stack item.
      008618 86 0F                 1173         .word      LINK
                           00059A  1174 LINK	= 	. 
      00861A 03                    1175         .byte      3
      00861B 44 55 50              1176         .ascii     "DUP"
      00861E                       1177 DUPP:
      00861E 90 93            [ 1] 1178 	LDW Y,X
      008620 1D 00 02         [ 2] 1179         SUBW X,#2
      008623 90 FE            [ 2] 1180 	LDW Y,(Y)
      008625 FF               [ 2] 1181 	LDW (X),Y
      008626 81               [ 4] 1182         RET     
                                   1183 
                                   1184 ;       SWAP    ( w1 w2 -- w2 w1 )
                                   1185 ;       Exchange top two stack items.
      008627 86 1A                 1186         .word      LINK
                           0005A9  1187 LINK	= 	. 
      008629 04                    1188         .byte      4
      00862A 53 57 41 50           1189         .ascii     "SWAP"
      00862E                       1190 SWAPP:
      00862E 90 93            [ 1] 1191         LDW Y,X
      008630 90 FE            [ 2] 1192         LDW Y,(Y)
      008632 90 BF 28         [ 2] 1193         LDW YTEMP,Y
      008635 90 93            [ 1] 1194         LDW Y,X
      008637 90 EE 02         [ 2] 1195         LDW Y,(2,Y)
      00863A FF               [ 2] 1196         LDW (X),Y
      00863B 90 BE 28         [ 2] 1197         LDW Y,YTEMP
      00863E EF 02            [ 2] 1198         LDW (2,X),Y
      008640 81               [ 4] 1199         RET     
                                   1200 
                                   1201 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                   1202 ;       Copy second stack item to top.
      008641 86 29                 1203         .word      LINK
                           0005C3  1204 LINK	= . 
      008643 04                    1205         .byte      4
      008644 4F 56 45 52           1206         .ascii     "OVER"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      008648                       1207 OVER:
      008648 1D 00 02         [ 2] 1208         SUBW X,#2
      00864B 90 93            [ 1] 1209         LDW Y,X
      00864D 90 EE 04         [ 2] 1210         LDW Y,(4,Y)
      008650 FF               [ 2] 1211         LDW (X),Y
      008651 81               [ 4] 1212         RET     
                                   1213 
                                   1214 ;       0<      ( n -- t )
                                   1215 ;       Return true if n is negative.
      008652 86 43                 1216         .word      LINK
                           0005D4  1217 LINK	= . 
      008654 02                    1218         .byte      2
      008655 30 3C                 1219         .ascii     "0<"
      008657                       1220 ZLESS:
      008657 A6 FF            [ 1] 1221         LD A,#0xFF
      008659 90 93            [ 1] 1222         LDW Y,X
      00865B 90 FE            [ 2] 1223         LDW Y,(Y)
      00865D 2B 01            [ 1] 1224         JRMI     ZL1
      00865F 4F               [ 1] 1225         CLR A   ;false
      008660 F7               [ 1] 1226 ZL1:    LD     (X),A
      008661 E7 01            [ 1] 1227         LD (1,X),A
      008663 81               [ 4] 1228 	RET     
                                   1229 
                                   1230 ;       AND     ( w w -- w )
                                   1231 ;       Bitwise AND.
      008664 86 54                 1232         .word      LINK
                           0005E6  1233 LINK	= . 
      008666 03                    1234         .byte      3
      008667 41 4E 44              1235         .ascii     "AND"
      00866A                       1236 ANDD:
      00866A F6               [ 1] 1237         LD  A,(X)    ;D=w
      00866B E4 02            [ 1] 1238         AND A,(2,X)
      00866D E7 02            [ 1] 1239         LD (2,X),A
      00866F E6 01            [ 1] 1240         LD A,(1,X)
      008671 E4 03            [ 1] 1241         AND A,(3,X)
      008673 E7 03            [ 1] 1242         LD (3,X),A
      008675 1C 00 02         [ 2] 1243         ADDW X,#2
      008678 81               [ 4] 1244         RET
                                   1245 
                                   1246 ;       OR      ( w w -- w )
                                   1247 ;       Bitwise inclusive OR.
      008679 86 66                 1248         .word      LINK
                           0005FB  1249 LINK = . 
      00867B 02                    1250         .byte      2
      00867C 4F 52                 1251         .ascii     "OR"
      00867E                       1252 ORR:
      00867E F6               [ 1] 1253         LD A,(X)    ;D=w
      00867F EA 02            [ 1] 1254         OR A,(2,X)
      008681 E7 02            [ 1] 1255         LD (2,X),A
      008683 E6 01            [ 1] 1256         LD A,(1,X)
      008685 EA 03            [ 1] 1257         OR A,(3,X)
      008687 E7 03            [ 1] 1258         LD (3,X),A
      008689 1C 00 02         [ 2] 1259         ADDW X,#2
      00868C 81               [ 4] 1260         RET
                                   1261 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



                                   1262 ;       XOR     ( w w -- w )
                                   1263 ;       Bitwise exclusive OR.
      00868D 86 7B                 1264         .word      LINK
                           00060F  1265 LINK	= . 
      00868F 03                    1266         .byte      3
      008690 58 4F 52              1267         .ascii     "XOR"
      008693                       1268 XORR:
      008693 F6               [ 1] 1269         LD A,(X)    ;D=w
      008694 E8 02            [ 1] 1270         XOR A,(2,X)
      008696 E7 02            [ 1] 1271         LD (2,X),A
      008698 E6 01            [ 1] 1272         LD A,(1,X)
      00869A E8 03            [ 1] 1273         XOR A,(3,X)
      00869C E7 03            [ 1] 1274         LD (3,X),A
      00869E 1C 00 02         [ 2] 1275         ADDW X,#2
      0086A1 81               [ 4] 1276         RET
                                   1277 
                                   1278 ;       UM+     ( u u -- udsum )
                                   1279 ;       Add two unsigned single
                                   1280 ;       and return a double sum.
      0086A2 86 8F                 1281         .word      LINK
                           000624  1282 LINK	= . 
      0086A4 03                    1283         .byte      3
      0086A5 55 4D 2B              1284         .ascii     "UM+"
      0086A8                       1285 UPLUS:
      0086A8 A6 01            [ 1] 1286         LD A,#1
      0086AA 90 93            [ 1] 1287         LDW Y,X
      0086AC 90 EE 02         [ 2] 1288         LDW Y,(2,Y)
      0086AF 90 BF 28         [ 2] 1289         LDW YTEMP,Y
      0086B2 90 93            [ 1] 1290         LDW Y,X
      0086B4 90 FE            [ 2] 1291         LDW Y,(Y)
      0086B6 72 B9 00 28      [ 2] 1292         ADDW Y,YTEMP
      0086BA EF 02            [ 2] 1293         LDW (2,X),Y
      0086BC 25 01            [ 1] 1294         JRC     UPL1
      0086BE 4F               [ 1] 1295         CLR A
      0086BF E7 01            [ 1] 1296 UPL1:   LD     (1,X),A
      0086C1 7F               [ 1] 1297         CLR (X)
      0086C2 81               [ 4] 1298         RET
                                   1299 
                                   1300 ;; System and user variables
                                   1301 
                                   1302 ;       doVAR   ( -- a )
                                   1303 ;       Code for VARIABLE and CREATE.
      0086C3 86 A4                 1304         .word      LINK
                           000645  1305 LINK	= . 
      0086C5 45                    1306 	.byte      COMPO+5
      0086C6 44 4F 56 41 52        1307         .ascii     "DOVAR"
      0086CB                       1308 DOVAR:
      0086CB 1D 00 02         [ 2] 1309 	SUBW X,#2
      0086CE 90 85            [ 2] 1310         POPW Y    ;get return addr (pfa)
      0086D0 90 FE            [ 2] 1311         LDW Y,(Y) ; indirect address 
      0086D2 FF               [ 2] 1312         LDW (X),Y    ;push on stack
      0086D3 81               [ 4] 1313         RET     ;go to RET of EXEC
                                   1314 
                                   1315 ;       BASE    ( -- a )
                                   1316 ;       Radix base for numeric I/O.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      0086D4 86 C5                 1317         .word      LINK        
                           000656  1318 LINK = . 
      0086D6 04                    1319         .byte      4
      0086D7 42 41 53 45           1320         .ascii     "BASE"
      0086DB                       1321 BASE:
      0086DB 90 AE 00 06      [ 2] 1322 	LDW Y,#UBASE 
      0086DF 1D 00 02         [ 2] 1323 	SUBW X,#2
      0086E2 FF               [ 2] 1324         LDW (X),Y
      0086E3 81               [ 4] 1325         RET
                                   1326 
                                   1327 ;       tmp     ( -- a )
                                   1328 ;       A temporary storage.
      0086E4 86 D6                 1329         .word      LINK
                                   1330         
                           000666  1331 LINK = . 
      0086E6 03                    1332 	.byte      3
      0086E7 54 4D 50              1333         .ascii     "TMP"
      0086EA                       1334 TEMP:
      0086EA 90 AE 00 0C      [ 2] 1335 	LDW Y,#UTMP
      0086EE 1D 00 02         [ 2] 1336 	SUBW X,#2
      0086F1 FF               [ 2] 1337         LDW (X),Y
      0086F2 81               [ 4] 1338         RET
                                   1339 
                                   1340 ;       >IN     ( -- a )
                                   1341 ;        Hold parsing pointer.
      0086F3 86 E6                 1342         .word      LINK
                           000675  1343 LINK = . 
      0086F5 03                    1344         .byte      3
      0086F6 3E 49 4E              1345         .ascii    ">IN"
      0086F9                       1346 INN:
      0086F9 90 AE 00 0E      [ 2] 1347 	LDW Y,#UINN 
      0086FD 1D 00 02         [ 2] 1348 	SUBW X,#2
      008700 FF               [ 2] 1349         LDW (X),Y
      008701 81               [ 4] 1350         RET
                                   1351 
                                   1352 ;       #TIB    ( -- a )
                                   1353 ;       Count in terminal input buffer.
      008702 86 F5                 1354         .word      LINK
                           000684  1355 LINK = . 
      008704 04                    1356         .byte      4
      008705 23 54 49 42           1357         .ascii     "#TIB"
      008709                       1358 NTIB:
      008709 90 AE 00 10      [ 2] 1359 	LDW Y,#UCTIB 
      00870D 1D 00 02         [ 2] 1360 	SUBW X,#2
      008710 FF               [ 2] 1361         LDW (X),Y
      008711 81               [ 4] 1362         RET
                                   1363 
                                   1364 ;       TBUF ( -- a )
                                   1365 ;       address of 128 bytes transaction buffer 
      008712 87 04                 1366         .word LINK 
                           000694  1367         LINK=.
      008714 04                    1368         .byte 4 
      008715 54 42 55 46           1369         .ascii "TBUF"
      008719                       1370 TBUF:
      008719 90 AE 16 80      [ 2] 1371         ldw y,#ROWBUFF
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      00871D 1D 00 02         [ 2] 1372         subw x,#CELLL
      008720 FF               [ 2] 1373         ldw (x),y 
      008721 81               [ 4] 1374         ret 
                                   1375 
                                   1376 ; systeme variable 
                                   1377 ; compilation destination 
                                   1378 ; TFLASH ( -- A )
      008722 87 14                 1379         .word LINK 
                           0006A4  1380         LINK=.
      008724 06                    1381         .byte 6 
      008725 54 46 4C 41 53 48     1382         .ascii "TFLASH"         
      00872B                       1383 TFLASH:
      00872B 1D 00 02         [ 2] 1384         subw x,#CELLL 
      00872E 90 AE 00 22      [ 2] 1385         ldw y,#UTFLASH
      008732 FF               [ 2] 1386         ldw (x),y 
      008733 81               [ 4] 1387         ret 
                                   1388 
                                   1389 ;       "EVAL   ( -- a )
                                   1390 ;       Execution vector of EVAL.
      008734 87 24                 1391         .word      LINK
                           0006B6  1392 LINK = . 
      008736 05                    1393         .byte      5
      008737 27 45 56 41 4C        1394         .ascii     "'EVAL"
      00873C                       1395 TEVAL:
      00873C 90 AE 00 14      [ 2] 1396 	LDW Y,#UINTER 
      008740 1D 00 02         [ 2] 1397 	SUBW X,#2
      008743 FF               [ 2] 1398         LDW (X),Y
      008744 81               [ 4] 1399         RET
                                   1400 
                                   1401 ;       HLD     ( -- a )
                                   1402 ;       Hold a pointer of output string.
      008745 87 36                 1403         .word      LINK
                           0006C7  1404 LINK = . 
      008747 03                    1405         .byte      3
      008748 48 4C 44              1406         .ascii     "HLD"
      00874B                       1407 HLD:
      00874B 90 AE 00 16      [ 2] 1408 	LDW Y,#UHLD 
      00874F 1D 00 02         [ 2] 1409 	SUBW X,#2
      008752 FF               [ 2] 1410         LDW (X),Y
      008753 81               [ 4] 1411         RET
                                   1412 
                                   1413 ;       CONTEXT ( -- a )
                                   1414 ;       Start vocabulary search.
      008754 87 47                 1415         .word      LINK
                           0006D6  1416 LINK = . 
      008756 07                    1417         .byte      7
      008757 43 4F 4E 54 45 58 54  1418         .ascii     "CONTEXT"
      00875E                       1419 CNTXT:
      00875E 90 AE 00 18      [ 2] 1420 	LDW Y,#UCNTXT
      008762 1D 00 02         [ 2] 1421 	SUBW X,#2
      008765 FF               [ 2] 1422         LDW (X),Y
      008766 81               [ 4] 1423         RET
                                   1424 
                                   1425 ;       VP      ( -- a )
                                   1426 ;       Point to top of variables
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      008767 87 56                 1427         .word      LINK
                           0006E9  1428 LINK = . 
      008769 02                    1429         .byte      2
      00876A 56 50                 1430         .ascii     "VP"
      00876C                       1431 VPP:
      00876C 90 AE 00 1A      [ 2] 1432 	LDW Y,#UVP 
      008770 1D 00 02         [ 2] 1433 	SUBW X,#2
      008773 FF               [ 2] 1434         LDW (X),Y
      008774 81               [ 4] 1435         RET
                                   1436 
                                   1437 ;       CP    ( -- a )
                                   1438 ;       Pointer to top of FLASH 
      008775 87 69                 1439         .word LINK 
                           0006F7  1440         LINK=.
      008777 02                    1441         .byte 2 
      008778 43 50                 1442         .ascii "CP"
      00877A                       1443 CPP: 
      00877A 90 AE 00 1C      [ 2] 1444         ldw y,#UCP 
      00877E 1D 00 02         [ 2] 1445         subw x,#CELLL 
      008781 FF               [ 2] 1446         ldw (x),y 
      008782 81               [ 4] 1447         ret                
                                   1448 
                                   1449 ;       LAST    ( -- a )
                                   1450 ;       Point to last name in dictionary.
      008783 87 77                 1451         .word      LINK
                           000705  1452 LINK = . 
      008785 04                    1453         .byte      4
      008786 4C 41 53 54           1454         .ascii     "LAST"
      00878A                       1455 LAST:
      00878A 90 AE 00 1E      [ 2] 1456 	LDW Y,#ULAST 
      00878E 1D 00 02         [ 2] 1457 	SUBW X,#2
      008791 FF               [ 2] 1458         LDW (X),Y
      008792 81               [ 4] 1459         RET
                                   1460 
                                   1461 ; address of system variable URLAST 
                                   1462 ;       RAMLAST ( -- a )
                                   1463 ; RAM dictionary context 
      008793 87 85                 1464         .word LINK 
                           000715  1465         LINK=. 
      008795 07                    1466         .byte 7  
      008796 52 41 4D 4C 41 53 54  1467         .ascii "RAMLAST" 
      00879D                       1468 RAMLAST: 
      00879D 90 AE 00 24      [ 2] 1469         ldw y,#URLAST 
      0087A1 1D 00 02         [ 2] 1470         subw x,#CELLL 
      0087A4 FF               [ 2] 1471         ldw (x),y 
      0087A5 81               [ 4] 1472         ret 
                                   1473 
                                   1474 ; OFFSET ( -- a )
                                   1475 ; address of system variable OFFSET 
      0087A6 87 95                 1476         .word LINK 
                           000728  1477         LINK=.
      0087A8 06                    1478         .byte 6
      0087A9 4F 46 46 53 45 54     1479         .ascii "OFFSET" 
      0087AF                       1480 OFFSET: 
      0087AF 1D 00 02         [ 2] 1481         subw x,#CELLL
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      0087B2 90 AE 00 20      [ 2] 1482         ldw y,#UOFFSET 
      0087B6 FF               [ 2] 1483         ldw (x),y 
      0087B7 81               [ 4] 1484         ret 
                                   1485 
                                   1486 ; adjust jump address adding OFFSET
                                   1487 ; ADR-ADJ ( a -- a+offset )
      0087B8                       1488 ADRADJ: 
      0087B8 CD 87 AF         [ 4] 1489         call OFFSET 
      0087BB CD 85 77         [ 4] 1490         call AT 
      0087BE CC 88 3A         [ 2] 1491         jp PLUS 
                                   1492 
                                   1493 
                                   1494 ;; Common functions
                                   1495 
                                   1496 ;       ?DUP    ( w -- w w | 0 )
                                   1497 ;       Dup tos if its is not zero.
      0087C1 87 A8                 1498         .word      LINK
                           000743  1499 LINK = . 
      0087C3 04                    1500         .byte      4
      0087C4 3F 44 55 50           1501         .ascii     "?DUP"
      0087C8                       1502 QDUP:
      0087C8 90 93            [ 1] 1503         LDW Y,X
      0087CA 90 FE            [ 2] 1504 	LDW Y,(Y)
      0087CC 27 04            [ 1] 1505         JREQ     QDUP1
      0087CE 1D 00 02         [ 2] 1506 	SUBW X,#2
      0087D1 FF               [ 2] 1507         LDW (X),Y
      0087D2 81               [ 4] 1508 QDUP1:  RET
                                   1509 
                                   1510 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                   1511 ;       Rot 3rd item to top.
      0087D3 87 C3                 1512         .word      LINK
                           000755  1513 LINK = . 
      0087D5 03                    1514         .byte      3
      0087D6 52 4F 54              1515         .ascii     "ROT"
      0087D9                       1516 ROT:
      0087D9 90 93            [ 1] 1517         ldw y,x 
      0087DB 90 FE            [ 2] 1518         ldw y,(y)
      0087DD 90 89            [ 2] 1519         pushw y 
      0087DF 90 93            [ 1] 1520         ldw y,x 
      0087E1 90 EE 04         [ 2] 1521         ldw y,(4,y)
      0087E4 FF               [ 2] 1522         ldw (x),y 
      0087E5 90 93            [ 1] 1523         ldw y,x 
      0087E7 90 EE 02         [ 2] 1524         ldw y,(2,y)
      0087EA EF 04            [ 2] 1525         ldw (4,x),y 
      0087EC 90 85            [ 2] 1526         popw y 
      0087EE EF 02            [ 2] 1527         ldw (2,x),y
      0087F0 81               [ 4] 1528         ret 
                                   1529 
                                   1530 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1531 ;    <ROT ( n1 n2 n3 -- n3 n1 n2 )
                                   1532 ;    rotate left 3 top elements 
                                   1533 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000771                       1534     _HEADER NROT,4,"<ROT"
      0087F1 87 D5                    1         .word LINK 
                           000773     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      0087F3 04                       3         .byte 4  
      0087F4 3C 52 4F 54              4         .ascii "<ROT"
      0087F8                          5         NROT:
      0087F8 90 93            [ 1] 1535     LDW Y,X 
      0087FA 90 FE            [ 2] 1536     LDW Y,(Y)
      0087FC 90 BF 28         [ 2] 1537     LDW YTEMP,Y ; n3  
      0087FF 90 93            [ 1] 1538     LDW Y,X 
      008801 90 EE 02         [ 2] 1539     LDW Y,(2,Y) ; Y = n2 
      008804 FF               [ 2] 1540     LDW (X),Y   ; TOS = n2 
      008805 90 93            [ 1] 1541     LDW Y,X    
      008807 90 EE 04         [ 2] 1542     LDW Y,(4,Y) ; Y = n1 
      00880A EF 02            [ 2] 1543     LDW (2,X),Y ;   = n1 
      00880C 90 BE 28         [ 2] 1544     LDW Y,YTEMP 
      00880F EF 04            [ 2] 1545     LDW (4,X),Y ; = n3 
      008811 81               [ 4] 1546     RET 
                                   1547 
                                   1548 ;       2DROP   ( w w -- )
                                   1549 ;       Discard two items on stack.
      008812 87 F3                 1550         .word      LINK
                           000794  1551 LINK = . 
      008814 05                    1552         .byte      5
      008815 32 44 52 4F 50        1553         .ascii     "2DROP"
      00881A                       1554 DDROP:
      00881A 1C 00 04         [ 2] 1555         ADDW X,#4
      00881D 81               [ 4] 1556         RET
                                   1557 
                                   1558 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                   1559 ;       Duplicate top two items.
      00881E 88 14                 1560         .word      LINK
                           0007A0  1561 LINK = . 
      008820 04                    1562         .byte      4
      008821 32 44 55 50           1563         .ascii     "2DUP"
      008825                       1564 DDUP:
      008825 1D 00 04         [ 2] 1565         SUBW X,#4
      008828 90 93            [ 1] 1566         LDW Y,X
      00882A 90 EE 06         [ 2] 1567         LDW Y,(6,Y)
      00882D EF 02            [ 2] 1568         LDW (2,X),Y
      00882F 90 93            [ 1] 1569         LDW Y,X
      008831 90 EE 04         [ 2] 1570         LDW Y,(4,Y)
      008834 FF               [ 2] 1571         LDW (X),Y
      008835 81               [ 4] 1572         RET
                                   1573 
                                   1574 ;       +       ( w w -- sum )
                                   1575 ;       Add top two items.
      008836 88 20                 1576         .word      LINK
                           0007B8  1577 LINK = . 
      008838 01                    1578         .byte      1
      008839 2B                    1579         .ascii     "+"
      00883A                       1580 PLUS:
      00883A 90 93            [ 1] 1581         LDW Y,X
      00883C 90 FE            [ 2] 1582         LDW Y,(Y)
      00883E 90 BF 28         [ 2] 1583         LDW YTEMP,Y
      008841 1C 00 02         [ 2] 1584         ADDW X,#2
      008844 90 93            [ 1] 1585         LDW Y,X
      008846 90 FE            [ 2] 1586         LDW Y,(Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      008848 72 B9 00 28      [ 2] 1587         ADDW Y,YTEMP
      00884C FF               [ 2] 1588         LDW (X),Y
      00884D 81               [ 4] 1589         RET
                                   1590 
                                   1591 ;       NOT     ( w -- w )
                                   1592 ;       One's complement of tos.
      00884E 88 38                 1593         .word      LINK
                           0007D0  1594 LINK = . 
      008850 03                    1595         .byte      3
      008851 4E 4F 54              1596         .ascii     "NOT"
      008854                       1597 INVER:
      008854 90 93            [ 1] 1598         LDW Y,X
      008856 90 FE            [ 2] 1599         LDW Y,(Y)
      008858 90 53            [ 2] 1600         CPLW Y
      00885A FF               [ 2] 1601         LDW (X),Y
      00885B 81               [ 4] 1602         RET
                                   1603 
                                   1604 ;       NEGATE  ( n -- -n )
                                   1605 ;       Two's complement of tos.
      00885C 88 50                 1606         .word      LINK
                           0007DE  1607 LINK = . 
      00885E 06                    1608         .byte      6
      00885F 4E 45 47 41 54 45     1609         .ascii     "NEGATE"
      008865                       1610 NEGAT:
      008865 90 93            [ 1] 1611         LDW Y,X
      008867 90 FE            [ 2] 1612         LDW Y,(Y)
      008869 90 50            [ 2] 1613         NEGW Y
      00886B FF               [ 2] 1614         LDW (X),Y
      00886C 81               [ 4] 1615         RET
                                   1616 
                                   1617 ;       DNEGATE ( d -- -d )
                                   1618 ;       Two's complement of top double.
      00886D 88 5E                 1619         .word      LINK
                           0007EF  1620 LINK = . 
      00886F 07                    1621         .byte      7
      008870 44 4E 45 47 41 54 45  1622         .ascii     "DNEGATE"
      008877                       1623 DNEGA:
      008877 90 93            [ 1] 1624         LDW Y,X
      008879 90 FE            [ 2] 1625 	LDW Y,(Y)
      00887B 90 53            [ 2] 1626         CPLW Y     
      00887D 90 BF 28         [ 2] 1627 	LDW YTEMP,Y
      008880 90 93            [ 1] 1628         LDW Y,X
      008882 90 EE 02         [ 2] 1629         LDW Y,(2,Y)
      008885 90 53            [ 2] 1630         CPLW Y
      008887 72 A9 00 01      [ 2] 1631         addw y,#1
      00888B EF 02            [ 2] 1632         LDW (2,X),Y
      00888D 90 BE 28         [ 2] 1633         LDW Y,YTEMP
      008890 24 02            [ 1] 1634         JRNC DN1 
      008892 90 5C            [ 1] 1635         INCW Y
      008894 FF               [ 2] 1636 DN1:    LDW (X),Y
      008895 81               [ 4] 1637         RET
                                   1638 
                                   1639 
                                   1640 ;       S>D ( n -- d )
                                   1641 ; convert single integer to double 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      008896 88 6F                 1642         .word LINK 
                           000818  1643         LINK=. 
      008898 03                    1644         .byte 3 
      008899 53 3E 44              1645         .ascii "S>D"
      00889C                       1646 STOD: 
      00889C 1D 00 02         [ 2] 1647         subw x,#CELLL 
      00889F 90 5F            [ 1] 1648         clrw y 
      0088A1 FF               [ 2] 1649         ldw (x),y 
      0088A2 90 93            [ 1] 1650         ldw y,x 
      0088A4 90 EE 02         [ 2] 1651         ldw y,(2,y)
      0088A7 2A 05            [ 1] 1652         jrpl 1$ 
      0088A9 90 AE FF FF      [ 2] 1653         ldw y,#-1
      0088AD FF               [ 2] 1654         ldw (x),y 
      0088AE 81               [ 4] 1655 1$:     ret 
                                   1656 
                                   1657 
                                   1658 
                                   1659 
                                   1660 ;       -       ( n1 n2 -- n1-n2 )
                                   1661 ;       Subtraction.
      0088AF 88 98                 1662         .word      LINK
                           000831  1663 LINK = . 
      0088B1 01                    1664         .byte      1
      0088B2 2D                    1665         .ascii     "-"
      0088B3                       1666 SUBB:
      0088B3 90 93            [ 1] 1667         LDW Y,X
      0088B5 90 FE            [ 2] 1668         LDW Y,(Y)
      0088B7 90 BF 28         [ 2] 1669         LDW YTEMP,Y
      0088BA 1C 00 02         [ 2] 1670         ADDW X,#2
      0088BD 90 93            [ 1] 1671         LDW Y,X
      0088BF 90 FE            [ 2] 1672         LDW Y,(Y)
      0088C1 72 B2 00 28      [ 2] 1673         SUBW Y,YTEMP
      0088C5 FF               [ 2] 1674         LDW (X),Y
      0088C6 81               [ 4] 1675         RET
                                   1676 
                                   1677 ;       ABS     ( n -- n )
                                   1678 ;       Return  absolute value of n.
      0088C7 88 B1                 1679         .word      LINK
                           000849  1680 LINK = . 
      0088C9 03                    1681         .byte      3
      0088CA 41 42 53              1682         .ascii     "ABS"
      0088CD                       1683 ABSS:
      0088CD 90 93            [ 1] 1684         LDW Y,X
      0088CF 90 FE            [ 2] 1685 	LDW Y,(Y)
      0088D1 2A 03            [ 1] 1686         JRPL     AB1     ;negate:
      0088D3 90 50            [ 2] 1687         NEGW     Y     ;else negate hi byte
      0088D5 FF               [ 2] 1688         LDW (X),Y
      0088D6 81               [ 4] 1689 AB1:    RET
                                   1690 
                                   1691 ;       =       ( w w -- t )
                                   1692 ;       Return true if top two are =al.
      0088D7 88 C9                 1693         .word      LINK
                           000859  1694 LINK = . 
      0088D9 01                    1695         .byte      1
      0088DA 3D                    1696         .ascii     "="
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      0088DB                       1697 EQUAL:
      0088DB A6 FF            [ 1] 1698         LD A,#0xFF  ;true
      0088DD 90 93            [ 1] 1699         LDW Y,X    ;D = n2
      0088DF 90 FE            [ 2] 1700         LDW Y,(Y)
      0088E1 90 BF 28         [ 2] 1701         LDW YTEMP,Y
      0088E4 1C 00 02         [ 2] 1702         ADDW X,#2
      0088E7 90 93            [ 1] 1703         LDW Y,X
      0088E9 90 FE            [ 2] 1704         LDW Y,(Y)
      0088EB 90 B3 28         [ 2] 1705         CPW Y,YTEMP     ;if n2 <> n1
      0088EE 27 01            [ 1] 1706         JREQ     EQ1
      0088F0 4F               [ 1] 1707         CLR A
      0088F1 F7               [ 1] 1708 EQ1:    LD (X),A
      0088F2 E7 01            [ 1] 1709         LD (1,X),A
      0088F4 81               [ 4] 1710 	RET     
                                   1711 
                                   1712 ;       U<      ( u u -- t )
                                   1713 ;       Unsigned compare of top two items.
      0088F5 88 D9                 1714         .word      LINK
                           000877  1715 LINK = . 
      0088F7 02                    1716         .byte      2
      0088F8 55 3C                 1717         .ascii     "U<"
      0088FA                       1718 ULESS:
      0088FA A6 FF            [ 1] 1719         LD A,#0xFF  ;true
      0088FC 90 93            [ 1] 1720         LDW Y,X    ;D = n2
      0088FE 90 FE            [ 2] 1721         LDW Y,(Y)
      008900 90 BF 28         [ 2] 1722         LDW YTEMP,Y
      008903 1C 00 02         [ 2] 1723         ADDW X,#2
      008906 90 93            [ 1] 1724         LDW Y,X
      008908 90 FE            [ 2] 1725         LDW Y,(Y)
      00890A 90 B3 28         [ 2] 1726         CPW Y,YTEMP     ;if n2 <> n1
      00890D 25 01            [ 1] 1727         JRULT     ULES1
      00890F 4F               [ 1] 1728         CLR A
      008910 F7               [ 1] 1729 ULES1:  LD (X),A
      008911 E7 01            [ 1] 1730         LD (1,X),A
      008913 81               [ 4] 1731 	RET     
                                   1732 
                                   1733 ;       <       ( n1 n2 -- t )
                                   1734 ;       Signed compare of top two items.
      008914 88 F7                 1735         .word      LINK
                           000896  1736 LINK = . 
      008916 01                    1737         .byte      1
      008917 3C                    1738         .ascii     "<"
      008918                       1739 LESS:
      008918 A6 FF            [ 1] 1740         LD A,#0xFF  ;true
      00891A 90 93            [ 1] 1741         LDW Y,X    ;D = n2
      00891C 90 FE            [ 2] 1742         LDW Y,(Y)
      00891E 90 BF 28         [ 2] 1743         LDW YTEMP,Y
      008921 1C 00 02         [ 2] 1744         ADDW X,#2
      008924 90 93            [ 1] 1745         LDW Y,X
      008926 90 FE            [ 2] 1746         LDW Y,(Y)
      008928 90 B3 28         [ 2] 1747         CPW Y,YTEMP     ;if n2 <> n1
      00892B 2F 01            [ 1] 1748         JRSLT     LT1
      00892D 4F               [ 1] 1749         CLR A
      00892E F7               [ 1] 1750 LT1:    LD (X),A
      00892F E7 01            [ 1] 1751         LD (1,X),A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008931 81               [ 4] 1752 	RET     
                                   1753 
                                   1754 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1755 ;       >   (n1 n2 -- f )
                                   1756 ;  signed compare n1 n2 
                                   1757 ;  true if n1 > n2 
                                   1758 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008932 89 16                 1759         .word   LINK 
                           0008B4  1760         LINK = . 
      008934 01                    1761         .byte 1
      008935 3E                    1762         .ascii ">"
      008936                       1763 GREAT:
      008936 A6 FF            [ 1] 1764         LD A,#0xFF ;
      008938 90 93            [ 1] 1765         LDW Y,X 
      00893A 90 FE            [ 2] 1766         LDW Y,(Y)
      00893C 90 BF 28         [ 2] 1767         LDW YTEMP,Y 
      00893F 1C 00 02         [ 2] 1768         ADDW X,#2 
      008942 90 93            [ 1] 1769         LDW Y,X 
      008944 90 FE            [ 2] 1770         LDW Y,(Y)
      008946 90 B3 28         [ 2] 1771         CPW  Y,YTEMP 
      008949 2C 01            [ 1] 1772         JRSGT GREAT1 
      00894B 4F               [ 1] 1773         CLR  A
      00894C                       1774 GREAT1:
      00894C F7               [ 1] 1775         LD (X),A 
      00894D E7 01            [ 1] 1776         LD (1,X),A 
      00894F 81               [ 4] 1777         RET 
                                   1778 
                                   1779 
                                   1780 ;       MAX     ( n n -- n )
                                   1781 ;       Return greater of two top items.
      008950 89 34                 1782         .word      LINK
                           0008D2  1783 LINK = . 
      008952 03                    1784         .byte      3
      008953 4D 41 58              1785         .ascii     "MAX"
      008956                       1786 MAX:
      008956 90 93            [ 1] 1787         LDW Y,X    ;D = n2
      008958 90 EE 02         [ 2] 1788         LDW Y,(2,Y)
      00895B 90 BF 28         [ 2] 1789         LDW YTEMP,Y
      00895E 90 93            [ 1] 1790         LDW Y,X
      008960 90 FE            [ 2] 1791         LDW Y,(Y)
      008962 90 B3 28         [ 2] 1792         CPW Y,YTEMP     ;if n2 <> n1
      008965 2F 02            [ 1] 1793         JRSLT     MAX1
      008967 EF 02            [ 2] 1794         LDW (2,X),Y
      008969 1C 00 02         [ 2] 1795 MAX1:   ADDW X,#2
      00896C 81               [ 4] 1796 	RET     
                                   1797 
                                   1798 ;       MIN     ( n n -- n )
                                   1799 ;       Return smaller of top two items.
      00896D 89 52                 1800         .word      LINK
                           0008EF  1801 LINK = . 
      00896F 03                    1802         .byte      3
      008970 4D 49 4E              1803         .ascii     "MIN"
      008973                       1804 MIN:
      008973 90 93            [ 1] 1805         LDW Y,X    ;D = n2
      008975 90 EE 02         [ 2] 1806         LDW Y,(2,Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008978 90 BF 28         [ 2] 1807         LDW YTEMP,Y
      00897B 90 93            [ 1] 1808         LDW Y,X
      00897D 90 FE            [ 2] 1809         LDW Y,(Y)
      00897F 90 B3 28         [ 2] 1810         CPW Y,YTEMP     ;if n2 <> n1
      008982 2C 02            [ 1] 1811         JRSGT     MIN1
      008984 EF 02            [ 2] 1812         LDW (2,X),Y
      008986 1C 00 02         [ 2] 1813 MIN1:	ADDW X,#2
      008989 81               [ 4] 1814 	RET     
                                   1815 
                                   1816 ;       WITHIN  ( u ul uh -- t )
                                   1817 ;       Return true if u is within
                                   1818 ;       range of ul and uh. ( ul <= u < uh )
      00898A 89 6F                 1819         .word      LINK
                           00090C  1820 LINK = . 
      00898C 06                    1821         .byte      6
      00898D 57 49 54 48 49 4E     1822         .ascii     "WITHIN"
      008993                       1823 WITHI:
      008993 CD 86 48         [ 4] 1824         CALL     OVER
      008996 CD 88 B3         [ 4] 1825         CALL     SUBB
      008999 CD 85 E7         [ 4] 1826         CALL     TOR
      00899C CD 88 B3         [ 4] 1827         CALL     SUBB
      00899F CD 85 C8         [ 4] 1828         CALL     RFROM
      0089A2 CC 88 FA         [ 2] 1829         JP     ULESS
                                   1830 
                                   1831 ;; Divide
                                   1832 
                                   1833 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1834 ;       Unsigned divide of a double by a
                                   1835 ;       single. Return mod and quotient.
      0089A5 89 8C                 1836         .word      LINK
                           000927  1837 LINK = . 
      0089A7 06                    1838         .byte      6
      0089A8 55 4D 2F 4D 4F 44     1839         .ascii     "UM/MOD"
                                   1840 ; 2021-02-22
                                   1841 ; changed algortihm for Jeeek one 
                                   1842 ; ref: https://github.com/TG9541/stm8ef/pull/406        
      0089AE                       1843 UMMOD:
      0089AE 90 93            [ 1] 1844         LDW     Y,X             ; stack pointer to Y
      0089B0 FE               [ 2] 1845         LDW     X,(X)           ; un
      0089B1 BF 28            [ 2] 1846         LDW     YTEMP,X         ; save un
      0089B3 93               [ 1] 1847         LDW     X,Y
      0089B4 5C               [ 1] 1848         INCW    X               ; drop un
      0089B5 5C               [ 1] 1849         INCW    X
      0089B6 89               [ 2] 1850         PUSHW   X               ; save stack pointer
      0089B7 FE               [ 2] 1851         LDW     X,(X)           ; X=udh
      0089B8 90 EE 04         [ 2] 1852         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      0089BB B3 28            [ 2] 1853         CPW     X,YTEMP
      0089BD 25 0B            [ 1] 1854         JRULT   MMSM1           ; X is still on the R-stack
      0089BF 85               [ 2] 1855         POPW    X               ; restore stack pointer
      0089C0 90 AE FF FF      [ 2] 1856         LDW     Y,#0xFFFF       ; overflow result:
      0089C4 FF               [ 2] 1857         LDW     (X),Y           ; quotient max. 16 bit value
      0089C5 90 5F            [ 1] 1858         CLRW    Y
      0089C7 EF 02            [ 2] 1859         LDW     (2,X),Y         ; remainder 0
      0089C9 81               [ 4] 1860         RET
      0089CA                       1861 MMSM1:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      0089CA A6 10            [ 1] 1862         LD      A,#16           ; loop count
      0089CC 90 58            [ 2] 1863         SLLW    Y               ; udl shift udl into udh
      0089CE                       1864 MMSM3:
      0089CE 59               [ 2] 1865         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      0089CF 25 04            [ 1] 1866         JRC     MMSMa           ; if carry out of rotate
      0089D1 B3 28            [ 2] 1867         CPW     X,YTEMP         ; compare udh to un
      0089D3 25 05            [ 1] 1868         JRULT   MMSM4           ; can't subtract
      0089D5                       1869 MMSMa:
      0089D5 72 B0 00 28      [ 2] 1870         SUBW    X,YTEMP         ; can subtract
      0089D9 98               [ 1] 1871         RCF
      0089DA                       1872 MMSM4:
      0089DA 8C               [ 1] 1873         CCF                     ; quotient bit
      0089DB 90 59            [ 2] 1874         RLCW    Y               ; rotate into quotient, rotate out udl
      0089DD 4A               [ 1] 1875         DEC     A               ; repeat
      0089DE 26 EE            [ 1] 1876         JRNE    MMSM3           ; if A == 0
      0089E0                       1877 MMSMb:
      0089E0 BF 28            [ 2] 1878         LDW     YTEMP,X         ; done, save remainder
      0089E2 85               [ 2] 1879         POPW    X               ; restore stack pointer
      0089E3 FF               [ 2] 1880         LDW     (X),Y           ; save quotient
      0089E4 90 BE 28         [ 2] 1881         LDW     Y,YTEMP         ; remainder onto stack
      0089E7 EF 02            [ 2] 1882         LDW     (2,X),Y
      0089E9 81               [ 4] 1883         RET
                                   1884 
                                   1885 
                                   1886 ;----------------------------------------------	
                                   1887 ;       M/MOD   ( d n -- r q )
                                   1888 ;       Signed floored divide of double by
                                   1889 ;       single. Return mod and quotient.
                                   1890 ;----------------------------------------------	
      0089EA 89 A7                 1891         .word      LINK
                           00096C  1892 LINK = . 
      0089EC 05                    1893         .byte      5
      0089ED 4D 2F 4D 4F 44        1894         .ascii     "M/MOD"
      0089F2                       1895 MSMOD:  
      0089F2 CD 86 1E         [ 4] 1896         CALL	DUPP
      0089F5 CD 86 57         [ 4] 1897         CALL	ZLESS
      0089F8 CD 86 1E         [ 4] 1898         CALL	DUPP
      0089FB CD 85 E7         [ 4] 1899         CALL	TOR
      0089FE CD 85 2C         [ 4] 1900         CALL	QBRAN
      008A01 8A 0F                 1901         .word	MMOD1
      008A03 CD 88 65         [ 4] 1902         CALL	NEGAT
      008A06 CD 85 E7         [ 4] 1903         CALL	TOR
      008A09 CD 88 77         [ 4] 1904         CALL	DNEGA
      008A0C CD 85 C8         [ 4] 1905         CALL	RFROM
      008A0F CD 85 E7         [ 4] 1906 MMOD1:	CALL	TOR
      008A12 CD 86 1E         [ 4] 1907         CALL	DUPP
      008A15 CD 86 57         [ 4] 1908         CALL	ZLESS
      008A18 CD 85 2C         [ 4] 1909         CALL	QBRAN
      008A1B 8A 23                 1910         .word	MMOD2
      008A1D CD 85 DB         [ 4] 1911         CALL	RAT
      008A20 CD 88 3A         [ 4] 1912         CALL	PLUS
      008A23 CD 85 C8         [ 4] 1913 MMOD2:	CALL	RFROM
      008A26 CD 89 AE         [ 4] 1914         CALL	UMMOD
      008A29 CD 85 C8         [ 4] 1915         CALL	RFROM
      008A2C CD 85 2C         [ 4] 1916         CALL	QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008A2F 8A 3A                 1917         .word	MMOD3
      008A31 CD 86 2E         [ 4] 1918         CALL	SWAPP
      008A34 CD 88 65         [ 4] 1919         CALL	NEGAT
      008A37 CD 86 2E         [ 4] 1920         CALL	SWAPP
      008A3A 81               [ 4] 1921 MMOD3:	RET
                                   1922 
                                   1923 ;       /MOD    ( n n -- r q )
                                   1924 ;       Signed divide. Return mod and quotient.
      008A3B 89 EC                 1925         .word      LINK
                           0009BD  1926 LINK = . 
      008A3D 04                    1927         .byte      4
      008A3E 2F 4D 4F 44           1928         .ascii     "/MOD"
      008A42                       1929 SLMOD:
      008A42 CD 86 48         [ 4] 1930         CALL	OVER
      008A45 CD 86 57         [ 4] 1931         CALL	ZLESS
      008A48 CD 86 2E         [ 4] 1932         CALL	SWAPP
      008A4B CC 89 F2         [ 2] 1933         JP	MSMOD
                                   1934 
                                   1935 ;       MOD     ( n n -- r )
                                   1936 ;       Signed divide. Return mod only.
      008A4E 8A 3D                 1937         .word      LINK
                           0009D0  1938 LINK = . 
      008A50 03                    1939         .byte      3
      008A51 4D 4F 44              1940         .ascii     "MOD"
      008A54                       1941 MODD:
      008A54 CD 8A 42         [ 4] 1942 	CALL	SLMOD
      008A57 CC 86 14         [ 2] 1943 	JP	DROP
                                   1944 
                                   1945 ;       /       ( n n -- q )
                                   1946 ;       Signed divide. Return quotient only.
      008A5A 8A 50                 1947         .word      LINK
                           0009DC  1948 LINK = . 
      008A5C 01                    1949         .byte      1
      008A5D 2F                    1950         .ascii     "/"
      008A5E                       1951 SLASH:
      008A5E CD 8A 42         [ 4] 1952         CALL	SLMOD
      008A61 CD 86 2E         [ 4] 1953         CALL	SWAPP
      008A64 CC 86 14         [ 2] 1954         JP	DROP
                                   1955 
                                   1956 ;; Multiply
                                   1957 
                                   1958 ;       UM*     ( u u -- ud )
                                   1959 ;       Unsigned multiply. Return double product.
      008A67 8A 5C                 1960         .word      LINK
                           0009E9  1961 LINK = . 
      008A69 03                    1962         .byte      3
      008A6A 55 4D 2A              1963         .ascii     "UM*"
      008A6D                       1964 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
                                   1965 ; take advantage of SP addressing modes
                                   1966 ; these PRODx in RAM are not required
                                   1967 ; the product is kept on stack as local variable 
                                   1968         ;; bytes offset on data stack 
                           000002  1969         da=2 
                           000003  1970         db=3 
                           000000  1971         dc=0 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                           000001  1972         dd=1 
                                   1973         ;; product bytes offset on return stack 
                           000001  1974         UD1=1  ; ud bits 31..24
                           000002  1975         UD2=2  ; ud bits 23..16
                           000003  1976         UD3=3  ; ud bits 15..8 
                           000004  1977         UD4=4  ; ud bits 7..0 
                                   1978         ;; local variable for product set to zero   
      008A6D 90 5F            [ 1] 1979         clrw y 
      008A6F 90 89            [ 2] 1980         pushw y  ; bits 15..0
      008A71 90 89            [ 2] 1981         pushw y  ; bits 31..16 
      008A73 E6 03            [ 1] 1982         ld a,(db,x) ; b 
      008A75 90 97            [ 1] 1983         ld yl,a 
      008A77 E6 01            [ 1] 1984         ld a,(dd,x)   ; d
      008A79 90 42            [ 4] 1985         mul y,a    ; b*d  
      008A7B 17 03            [ 2] 1986         ldw (UD3,sp),y ; lowest weight product 
      008A7D E6 03            [ 1] 1987         ld a,(db,x)
      008A7F 90 97            [ 1] 1988         ld yl,a 
      008A81 E6 00            [ 1] 1989         ld a,(dc,x)
      008A83 90 42            [ 4] 1990         mul y,a  ; b*c 
                                   1991         ;;; do the partial sum 
      008A85 72 F9 02         [ 2] 1992         addw y,(UD2,sp)
      008A88 4F               [ 1] 1993         clr a 
      008A89 49               [ 1] 1994         rlc a
      008A8A 6B 01            [ 1] 1995         ld (UD1,sp),a 
      008A8C 17 02            [ 2] 1996         ldw (UD2,sp),y 
      008A8E E6 02            [ 1] 1997         ld a,(da,x)
      008A90 90 97            [ 1] 1998         ld yl,a 
      008A92 E6 01            [ 1] 1999         ld a,(dd,x)
      008A94 90 42            [ 4] 2000         mul y,a   ; a*d 
                                   2001         ;; do partial sum 
      008A96 72 F9 02         [ 2] 2002         addw y,(UD2,sp)
      008A99 4F               [ 1] 2003         clr a 
      008A9A 19 01            [ 1] 2004         adc a,(UD1,sp)
      008A9C 6B 01            [ 1] 2005         ld (UD1,sp),a  
      008A9E 17 02            [ 2] 2006         ldw (UD2,sp),y 
      008AA0 E6 02            [ 1] 2007         ld a,(da,x)
      008AA2 90 97            [ 1] 2008         ld yl,a 
      008AA4 E6 00            [ 1] 2009         ld a,(dc,x)
      008AA6 90 42            [ 4] 2010         mul y,a  ;  a*c highest weight product 
                                   2011         ;;; do partial sum 
      008AA8 72 F9 01         [ 2] 2012         addw y,(UD1,sp)
      008AAB FF               [ 2] 2013         ldw (x),y  ; udh 
      008AAC 16 03            [ 2] 2014         ldw y,(UD3,sp)
      008AAE EF 02            [ 2] 2015         ldw (2,x),y  ; udl  
      008AB0 5B 04            [ 2] 2016         addw sp,#4 ; drop local variable 
      008AB2 81               [ 4] 2017         ret  
                                   2018 
                                   2019 
                                   2020 ;       *       ( n n -- n )
                                   2021 ;       Signed multiply. Return single product.
      008AB3 8A 69                 2022         .word      LINK
                           000A35  2023 LINK = . 
      008AB5 01                    2024         .byte      1
      008AB6 2A                    2025         .ascii     "*"
      008AB7                       2026 STAR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008AB7 CD 8A 6D         [ 4] 2027 	CALL	UMSTA
      008ABA CC 86 14         [ 2] 2028 	JP	DROP
                                   2029 
                                   2030 ;       M*      ( n n -- d )
                                   2031 ;       Signed multiply. Return double product.
      008ABD 8A B5                 2032         .word      LINK
                           000A3F  2033 LINK = . 
      008ABF 02                    2034         .byte      2
      008AC0 4D 2A                 2035         .ascii     "M*"
      008AC2                       2036 MSTAR:      
      008AC2 CD 88 25         [ 4] 2037         CALL	DDUP
      008AC5 CD 86 93         [ 4] 2038         CALL	XORR
      008AC8 CD 86 57         [ 4] 2039         CALL	ZLESS
      008ACB CD 85 E7         [ 4] 2040         CALL	TOR
      008ACE CD 88 CD         [ 4] 2041         CALL	ABSS
      008AD1 CD 86 2E         [ 4] 2042         CALL	SWAPP
      008AD4 CD 88 CD         [ 4] 2043         CALL	ABSS
      008AD7 CD 8A 6D         [ 4] 2044         CALL	UMSTA
      008ADA CD 85 C8         [ 4] 2045         CALL	RFROM
      008ADD CD 85 2C         [ 4] 2046         CALL	QBRAN
      008AE0 8A E5                 2047         .word	MSTA1
      008AE2 CD 88 77         [ 4] 2048         CALL	DNEGA
      008AE5 81               [ 4] 2049 MSTA1:	RET
                                   2050 
                                   2051 ;       */MOD   ( n1 n2 n3 -- r q )
                                   2052 ;       Multiply n1 and n2, then divide
                                   2053 ;       by n3. Return mod and quotient.
      008AE6 8A BF                 2054         .word      LINK
                           000A68  2055 LINK = . 
      008AE8 05                    2056         .byte      5
      008AE9 2A 2F 4D 4F 44        2057         .ascii     "*/MOD"
      008AEE                       2058 SSMOD:
      008AEE CD 85 E7         [ 4] 2059         CALL     TOR
      008AF1 CD 8A C2         [ 4] 2060         CALL     MSTAR
      008AF4 CD 85 C8         [ 4] 2061         CALL     RFROM
      008AF7 CC 89 F2         [ 2] 2062         JP     MSMOD
                                   2063 
                                   2064 ;       */      ( n1 n2 n3 -- q )
                                   2065 ;       Multiply n1 by n2, then divide
                                   2066 ;       by n3. Return quotient only.
      008AFA 8A E8                 2067         .word      LINK
                           000A7C  2068 LINK = . 
      008AFC 02                    2069         .byte      2
      008AFD 2A 2F                 2070         .ascii     "*/"
      008AFF                       2071 STASL:
      008AFF CD 8A EE         [ 4] 2072         CALL	SSMOD
      008B02 CD 86 2E         [ 4] 2073         CALL	SWAPP
      008B05 CC 86 14         [ 2] 2074         JP	DROP
                                   2075 
                                   2076 ;; Miscellaneous
                                   2077 
                                   2078 ;       CELL+   ( a -- a )
                                   2079 ;       Add cell size in byte to address.
      008B08 8A FC                 2080         .word      LINK
                           000A8A  2081 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008B0A 02                    2082         .byte       2
      008B0B 32 2B                 2083         .ascii     "2+"
      008B0D                       2084 CELLP:
      008B0D 90 93            [ 1] 2085         LDW Y,X
      008B0F 90 FE            [ 2] 2086 	LDW Y,(Y)
      008B11 72 A9 00 02      [ 2] 2087         ADDW Y,#CELLL 
      008B15 FF               [ 2] 2088         LDW (X),Y
      008B16 81               [ 4] 2089         RET
                                   2090 
                                   2091 ;       CELL-   ( a -- a )
                                   2092 ;       Subtract 2 from address.
      008B17 8B 0A                 2093         .word      LINK
                           000A99  2094 LINK = . 
      008B19 02                    2095         .byte       2
      008B1A 32 2D                 2096         .ascii     "2-"
      008B1C                       2097 CELLM:
      008B1C 90 93            [ 1] 2098         LDW Y,X
      008B1E 90 FE            [ 2] 2099 	LDW Y,(Y)
      008B20 72 A2 00 02      [ 2] 2100         SUBW Y,#CELLL
      008B24 FF               [ 2] 2101         LDW (X),Y
      008B25 81               [ 4] 2102         RET
                                   2103 
                                   2104 ;       CELLS   ( n -- n )
                                   2105 ;       Multiply tos by 2.
      008B26 8B 19                 2106         .word      LINK
                           000AA8  2107 LINK = . 
      008B28 02                    2108         .byte       2
      008B29 32 2A                 2109         .ascii     "2*"
      008B2B                       2110 CELLS:
      008B2B 90 93            [ 1] 2111         LDW Y,X
      008B2D 90 FE            [ 2] 2112 	LDW Y,(Y)
      008B2F 90 58            [ 2] 2113         SLAW Y
      008B31 FF               [ 2] 2114         LDW (X),Y
      008B32 81               [ 4] 2115         RET
                                   2116 
                                   2117 ;       1+      ( a -- a )
                                   2118 ;       Add cell size in byte to address.
      008B33 8B 28                 2119         .word      LINK
                           000AB5  2120 LINK = . 
      008B35 02                    2121         .byte      2
      008B36 31 2B                 2122         .ascii     "1+"
      008B38                       2123 ONEP:
      008B38 90 93            [ 1] 2124         LDW Y,X
      008B3A 90 FE            [ 2] 2125 	LDW Y,(Y)
      008B3C 90 5C            [ 1] 2126         INCW Y
      008B3E FF               [ 2] 2127         LDW (X),Y
      008B3F 81               [ 4] 2128         RET
                                   2129 
                                   2130 ;       1-      ( a -- a )
                                   2131 ;       Subtract 2 from address.
      008B40 8B 35                 2132         .word      LINK
                           000AC2  2133 LINK = . 
      008B42 02                    2134         .byte      2
      008B43 31 2D                 2135         .ascii     "1-"
      008B45                       2136 ONEM:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008B45 90 93            [ 1] 2137         LDW Y,X
      008B47 90 FE            [ 2] 2138 	LDW Y,(Y)
      008B49 90 5A            [ 2] 2139         DECW Y
      008B4B FF               [ 2] 2140         LDW (X),Y
      008B4C 81               [ 4] 2141         RET
                                   2142 
                                   2143 ;  shift left n times 
                                   2144 ; LSHIFT ( n1 n2 -- n1<<n2 )
      008B4D 8B 42                 2145         .word LINK 
                           000ACF  2146         LINK=.
      008B4F 06                    2147         .byte 6 
      008B50 4C 53 48 49 46 54     2148         .ascii "LSHIFT"
      008B56                       2149 LSHIFT:
      008B56 E6 01            [ 1] 2150         ld a,(1,x)
      008B58 1C 00 02         [ 2] 2151         addw x,#CELLL 
      008B5B 90 93            [ 1] 2152         ldw y,x 
      008B5D 90 FE            [ 2] 2153         ldw y,(y)
      008B5F                       2154 LSHIFT1:
      008B5F 4D               [ 1] 2155         tnz a 
      008B60 27 05            [ 1] 2156         jreq LSHIFT4 
      008B62 90 58            [ 2] 2157         sllw y 
      008B64 4A               [ 1] 2158         dec a 
      008B65 20 F8            [ 2] 2159         jra LSHIFT1 
      008B67                       2160 LSHIFT4:
      008B67 FF               [ 2] 2161         ldw (x),y 
      008B68 81               [ 4] 2162         ret 
                                   2163 
                                   2164 ; shift right n times                 
                                   2165 ; RSHIFT (n1 n2 -- n1>>n2 )
      008B69 8B 4F                 2166         .word LINK 
                           000AEB  2167         LINK=.
      008B6B 06                    2168         .byte 6
      008B6C 52 53 48 49 46 54     2169         .ascii "RSHIFT"
      008B72                       2170 RSHIFT:
      008B72 E6 01            [ 1] 2171         ld a,(1,x)
      008B74 1C 00 02         [ 2] 2172         addw x,#CELLL 
      008B77 90 93            [ 1] 2173         ldw y,x 
      008B79 90 FE            [ 2] 2174         ldw y,(y)
      008B7B                       2175 RSHIFT1:
      008B7B 4D               [ 1] 2176         tnz a 
      008B7C 27 05            [ 1] 2177         jreq RSHIFT4 
      008B7E 90 54            [ 2] 2178         srlw y 
      008B80 4A               [ 1] 2179         dec a 
      008B81 20 F8            [ 2] 2180         jra RSHIFT1 
      008B83                       2181 RSHIFT4:
      008B83 FF               [ 2] 2182         ldw (x),y 
      008B84 81               [ 4] 2183         ret 
                                   2184 
                                   2185 
                                   2186 ;       2/      ( n -- n )
                                   2187 ;       divide  tos by 2.
      008B85 8B 6B                 2188         .word      LINK
                           000B07  2189 LINK = . 
      008B87 02                    2190         .byte      2
      008B88 32 2F                 2191         .ascii     "2/"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008B8A                       2192 TWOSL:
      008B8A 90 93            [ 1] 2193         LDW Y,X
      008B8C 90 FE            [ 2] 2194 	LDW Y,(Y)
      008B8E 90 57            [ 2] 2195         SRAW Y
      008B90 FF               [ 2] 2196         LDW (X),Y
      008B91 81               [ 4] 2197         RET
                                   2198 
                                   2199 ;       BL      ( -- 32 )
                                   2200 ;       Return 32,  blank character.
      008B92 8B 87                 2201         .word      LINK
                           000B14  2202 LINK = . 
      008B94 02                    2203         .byte      2
      008B95 42 4C                 2204         .ascii     "BL"
      008B97                       2205 BLANK:
      008B97 1D 00 02         [ 2] 2206         SUBW X,#2
      008B9A 90 AE 00 20      [ 2] 2207 	LDW Y,#32
      008B9E FF               [ 2] 2208         LDW (X),Y
      008B9F 81               [ 4] 2209         RET
                                   2210 
                                   2211 ;         0     ( -- 0)
                                   2212 ;         Return 0.
      008BA0 8B 94                 2213         .word      LINK
                           000B22  2214 LINK = . 
      008BA2 01                    2215         .byte       1
      008BA3 30                    2216         .ascii     "0"
      008BA4                       2217 ZERO:
      008BA4 1D 00 02         [ 2] 2218         SUBW X,#2
      008BA7 90 5F            [ 1] 2219 	CLRW Y
      008BA9 FF               [ 2] 2220         LDW (X),Y
      008BAA 81               [ 4] 2221         RET
                                   2222 
                                   2223 ;         1     ( -- 1)
                                   2224 ;         Return 1.
      008BAB 8B A2                 2225         .word      LINK
                           000B2D  2226 LINK = . 
      008BAD 01                    2227         .byte       1
      008BAE 31                    2228         .ascii     "1"
      008BAF                       2229 ONE:
      008BAF 1D 00 02         [ 2] 2230         SUBW X,#2
      008BB2 90 AE 00 01      [ 2] 2231 	LDW Y,#1
      008BB6 FF               [ 2] 2232         LDW (X),Y
      008BB7 81               [ 4] 2233         RET
                                   2234 
                                   2235 ;         -1    ( -- -1)
                                   2236 ;         Return 32,  blank character.
      008BB8 8B AD                 2237         .word      LINK
                           000B3A  2238 LINK = . 
      008BBA 02                    2239         .byte       2
      008BBB 2D 31                 2240         .ascii     "-1"
      008BBD                       2241 MONE:
      008BBD 1D 00 02         [ 2] 2242         SUBW X,#2
      008BC0 90 AE FF FF      [ 2] 2243 	LDW Y,#0xFFFF
      008BC4 FF               [ 2] 2244         LDW (X),Y
      008BC5 81               [ 4] 2245         RET
                                   2246 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



                                   2247 ;       >CHAR   ( c -- c )
                                   2248 ;       Filter non-printing characters.
      008BC6 8B BA                 2249         .word      LINK
                           000B48  2250 LINK = . 
      008BC8 05                    2251         .byte      5
      008BC9 3E 43 48 41 52        2252         .ascii     ">CHAR"
      008BCE                       2253 TCHAR:
      008BCE E6 01            [ 1] 2254         ld a,(1,x)
      008BD0 A1 20            [ 1] 2255         cp a,#32  
      008BD2 2B 05            [ 1] 2256         jrmi 1$ 
      008BD4 A1 7F            [ 1] 2257         cp a,#127 
      008BD6 2A 01            [ 1] 2258         jrpl 1$ 
      008BD8 81               [ 4] 2259         ret 
      008BD9 A6 5F            [ 1] 2260 1$:     ld a,#'_ 
      008BDB E7 01            [ 1] 2261         ld (1,x),a 
      008BDD 81               [ 4] 2262         ret 
                                   2263 
                                   2264 ;       DEPTH   ( -- n )
                                   2265 ;       Return  depth of  data stack.
      008BDE 8B C8                 2266         .word      LINK
                           000B60  2267 LINK = . 
      008BE0 05                    2268         .byte      5
      008BE1 44 45 50 54 48        2269         .ascii     "DEPTH"
      008BE6                       2270 DEPTH: 
      008BE6 90 BE 2E         [ 2] 2271         LDW Y,SP0    ;save data stack ptr
      008BE9 BF 26            [ 2] 2272 	LDW XTEMP,X
      008BEB 72 B2 00 26      [ 2] 2273         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008BEF 90 57            [ 2] 2274         SRAW Y    ;Y = #stack items
      008BF1 1D 00 02         [ 2] 2275 	SUBW X,#2
      008BF4 FF               [ 2] 2276         LDW (X),Y     ; if neg, underflow
      008BF5 81               [ 4] 2277         RET
                                   2278 
                                   2279 ;       PICK    ( ... +n -- ... w )
                                   2280 ;       Copy  nth stack item to tos.
      008BF6 8B E0                 2281         .word      LINK
                           000B78  2282 LINK = . 
      008BF8 04                    2283         .byte      4
      008BF9 50 49 43 4B           2284         .ascii     "PICK"
      008BFD                       2285 PICK:
      008BFD 90 93            [ 1] 2286         LDW Y,X   ;D = n1
      008BFF 90 FE            [ 2] 2287         LDW Y,(Y)
                                   2288 ; modified for standard compliance          
                                   2289 ; 0 PICK must be equivalent to DUP 
      008C01 90 5C            [ 1] 2290         INCW Y 
      008C03 90 58            [ 2] 2291         SLAW Y
      008C05 BF 26            [ 2] 2292         LDW XTEMP,X
      008C07 72 B9 00 26      [ 2] 2293         ADDW Y,XTEMP
      008C0B 90 FE            [ 2] 2294         LDW Y,(Y)
      008C0D FF               [ 2] 2295         LDW (X),Y
      008C0E 81               [ 4] 2296         RET
                                   2297 
                                   2298 ;; Memory access
                                   2299 
                                   2300 ;       +!      ( n a -- )
                                   2301 ;       Add n to  contents at address a.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008C0F 8B F8                 2302         .word      LINK
                           000B91  2303 LINK = . 
      008C11 02                    2304         .byte      2
      008C12 2B 21                 2305         .ascii     "+!"
      008C14                       2306 PSTOR:
      008C14 90 93            [ 1] 2307         ldw y,x 
      008C16 90 FE            [ 2] 2308         ldw y,(y)
      008C18 90 BF 28         [ 2] 2309         ldw YTEMP,y  ; address
      008C1B 90 FE            [ 2] 2310         ldw y,(y)  
      008C1D 90 89            [ 2] 2311         pushw y  ; value at address 
      008C1F 90 93            [ 1] 2312         ldw y,x 
      008C21 90 EE 02         [ 2] 2313         ldw y,(2,y) ; n 
      008C24 72 F9 01         [ 2] 2314         addw y,(1,sp) ; n+value
      008C27 91 CF 28         [ 5] 2315         ldw [YTEMP],y ;  a!
      008C2A 90 85            [ 2] 2316         popw y    ;drop local var
      008C2C 1C 00 04         [ 2] 2317         addw x,#4 ; DDROP 
      008C2F 81               [ 4] 2318         ret 
                                   2319 
                                   2320 ;       2!      ( d a -- )
                                   2321 ;       Store  double integer to address a.
      008C30 8C 11                 2322         .word      LINK
                           000BB2  2323 LINK = . 
      008C32 02                    2324         .byte      2
      008C33 32 21                 2325         .ascii     "2!"
      008C35                       2326 DSTOR:
      008C35 90 93            [ 1] 2327         ldw y,x 
      008C37 90 FE            [ 2] 2328         ldw y,(y)
      008C39 90 BF 28         [ 2] 2329         ldw YTEMP,y ; address 
      008C3C 1C 00 02         [ 2] 2330         addw x,#CELLL ; drop a 
      008C3F 90 93            [ 1] 2331         ldw y,x 
      008C41 90 FE            [ 2] 2332         ldw y,(y) ; hi word 
      008C43 89               [ 2] 2333         pushw x 
      008C44 EE 02            [ 2] 2334         ldw x,(2,x) ; lo word 
      008C46 91 CF 28         [ 5] 2335         ldw [YTEMP],y
      008C49 90 93            [ 1] 2336         ldw y,x 
      008C4B AE 00 02         [ 2] 2337         ldw x,#2 
      008C4E 92 DF 28         [ 5] 2338         ldw ([YTEMP],x),y 
      008C51 85               [ 2] 2339         popw x 
      008C52 1C 00 04         [ 2] 2340         addw x,#4 ; DDROP 
      008C55 81               [ 4] 2341         ret 
                                   2342 
                                   2343 ;       2@      ( a -- d )
                                   2344 ;       Fetch double integer from address a.
      008C56 8C 32                 2345         .word      LINK
                           000BD8  2346 LINK = . 
      008C58 02                    2347         .byte      2
      008C59 32 40                 2348         .ascii     "2@"
      008C5B                       2349 DAT:
      008C5B 90 93            [ 1] 2350         ldw y,x 
      008C5D 90 FE            [ 2] 2351         ldw y,(y) ;address 
      008C5F 90 BF 28         [ 2] 2352         ldw YTEMP,y 
      008C62 1D 00 02         [ 2] 2353         subw x,#CELLL ; space for udh 
      008C65 91 CE 28         [ 5] 2354         ldw y,[YTEMP] ; udh 
      008C68 FF               [ 2] 2355         ldw (x),y 
      008C69 90 AE 00 02      [ 2] 2356         ldw y,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008C6D 91 DE 28         [ 5] 2357         ldw y,([YTEMP],y) ; udl 
      008C70 EF 02            [ 2] 2358         ldw (2,x),y
      008C72 81               [ 4] 2359         ret 
                                   2360 
                                   2361 ;       COUNT   ( b -- b +n )
                                   2362 ;       Return count byte of a string
                                   2363 ;       and add 1 to byte address.
      008C73 8C 58                 2364         .word      LINK
                           000BF5  2365 LINK = . 
      008C75 05                    2366         .byte      5
      008C76 43 4F 55 4E 54        2367         .ascii     "COUNT"
      008C7B                       2368 COUNT:
      008C7B 90 93            [ 1] 2369         ldw y,x 
      008C7D 90 FE            [ 2] 2370         ldw y,(y) ; address 
      008C7F 90 F6            [ 1] 2371         ld a,(y)  ; count 
      008C81 90 5C            [ 1] 2372         incw y 
      008C83 FF               [ 2] 2373         ldw (x),y 
      008C84 1D 00 02         [ 2] 2374         subw x,#CELLL 
      008C87 E7 01            [ 1] 2375         ld (1,x),a 
      008C89 7F               [ 1] 2376         clr (x)
      008C8A 81               [ 4] 2377         ret 
                                   2378 
                                   2379 ;       HERE    ( -- a )
                                   2380 ;       Return  top of  variables
      008C8B 8C 75                 2381         .word      LINK
                           000C0D  2382 LINK = . 
      008C8D 04                    2383         .byte      4
      008C8E 48 45 52 45           2384         .ascii     "HERE"
      008C92                       2385 HERE:
      008C92 90 AE 00 1A      [ 2] 2386       	ldw y,#UVP 
      008C96 90 FE            [ 2] 2387         ldw y,(y)
      008C98 1D 00 02         [ 2] 2388         subw x,#CELLL 
      008C9B FF               [ 2] 2389         ldw (x),y 
      008C9C 81               [ 4] 2390         ret 
                                   2391 
                                   2392 ;       PAD     ( -- a )
                                   2393 ;       Return address of text buffer
                                   2394 ;       above  code dictionary.
      008C9D 8C 8D                 2395         .word      LINK
                           000C1F  2396 LINK = . 
      008C9F 03                    2397         .byte      3
      008CA0 50 41 44              2398         .ascii     "PAD"
      008CA3                       2399 PAD:
      008CA3 CD 8C 92         [ 4] 2400         CALL     HERE
      008CA6 CD 84 F9         [ 4] 2401         CALL     DOLIT
      008CA9 00 50                 2402         .word      80
      008CAB CC 88 3A         [ 2] 2403         JP     PLUS
                                   2404 
                                   2405 ;       TIB     ( -- a )
                                   2406 ;       Return address of terminal input buffer.
      008CAE 8C 9F                 2407         .word      LINK
                           000C30  2408 LINK = . 
      008CB0 03                    2409         .byte      3
      008CB1 54 49 42              2410         .ascii     "TIB"
      008CB4                       2411 TIB:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008CB4 CD 87 09         [ 4] 2412         CALL     NTIB
      008CB7 CD 8B 0D         [ 4] 2413         CALL     CELLP
      008CBA CC 85 77         [ 2] 2414         JP     AT
                                   2415 
                                   2416 ;       @EXECUTE        ( a -- )
                                   2417 ;       Execute vector stored in address a.
      008CBD 8C B0                 2418         .word      LINK
                           000C3F  2419 LINK = . 
      008CBF 08                    2420         .byte      8
      008CC0 40 45 58 45 43 55 54  2421         .ascii     "@EXECUTE"
             45
      008CC8                       2422 ATEXE:
      008CC8 CD 85 77         [ 4] 2423         CALL     AT
      008CCB CD 87 C8         [ 4] 2424         CALL     QDUP    ;?address or zero
      008CCE CD 85 2C         [ 4] 2425         CALL     QBRAN
      008CD1 8C D6                 2426         .word      EXE1
      008CD3 CD 85 53         [ 4] 2427         CALL     EXECU   ;execute if non-zero
      008CD6 81               [ 4] 2428 EXE1:   RET     ;do nothing if zero
                                   2429 
                                   2430 ;       CMOVE   ( b1 b2 u -- )
                                   2431 ;       Copy u bytes from b1 to b2.
      008CD7 8C BF                 2432         .word      LINK
                           000C59  2433 LINK = . 
      008CD9 05                    2434         .byte      5
      008CDA 43 4D 4F 56 45        2435         .ascii     "CMOVE"
      008CDF                       2436 CMOVE:
      008CDF CD 85 E7         [ 4] 2437         CALL	TOR
      008CE2 CD 85 43         [ 4] 2438         CALL	BRAN
      008CE5 8C FF                 2439         .word	CMOV2
      008CE7 CD 85 E7         [ 4] 2440 CMOV1:	CALL	TOR
      008CEA CD 86 1E         [ 4] 2441         CALL	DUPP
      008CED CD 85 95         [ 4] 2442         CALL	CAT
      008CF0 CD 85 DB         [ 4] 2443         CALL	RAT
      008CF3 CD 85 84         [ 4] 2444         CALL	CSTOR
      008CF6 CD 8B 38         [ 4] 2445         CALL	ONEP
      008CF9 CD 85 C8         [ 4] 2446         CALL	RFROM
      008CFC CD 8B 38         [ 4] 2447         CALL	ONEP
      008CFF CD 85 0D         [ 4] 2448 CMOV2:	CALL	DONXT
      008D02 8C E7                 2449         .word	CMOV1
      008D04 CC 88 1A         [ 2] 2450         JP	DDROP
                                   2451 
                                   2452 ;       FILL    ( b u c -- )
                                   2453 ;       Fill u bytes of character c
                                   2454 ;       to area beginning at b.
      008D07 8C D9                 2455         .word       LINK
                           000C89  2456 LINK = . 
      008D09 04                    2457         .byte       4
      008D0A 46 49 4C 4C           2458         .ascii     "FILL"
      008D0E                       2459 FILL:
      008D0E 90 93            [ 1] 2460         ldw y,x 
      008D10 90 E6 01         [ 1] 2461         ld a,(1,y) ; c 
      008D13 1C 00 02         [ 2] 2462         addw x,#CELLL ; drop c 
      008D16 90 93            [ 1] 2463         ldw y,x 
      008D18 90 FE            [ 2] 2464         ldw y,(y) ; count
      008D1A 90 89            [ 2] 2465         pushw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008D1C 1C 00 02         [ 2] 2466         addw x,#CELLL ; drop u 
      008D1F 90 93            [ 1] 2467         ldw y,x 
      008D21 1C 00 02         [ 2] 2468         addw x,#CELLL ; drop b 
      008D24 90 FE            [ 2] 2469         ldw y,(y) ; address
      008D26 90 BF 28         [ 2] 2470         ldw YTEMP,y
      008D29 90 85            [ 2] 2471         popw y ; count 
      008D2B                       2472 FILL1:  
      008D2B 92 C7 28         [ 4] 2473         ld [YTEMP],a 
      008D2E 3C 29            [ 1] 2474         inc YTEMP+1
      008D30 24 02            [ 1] 2475         jrnc FILL2 
      008D32 3C 28            [ 1] 2476         inc YTEMP
      008D34                       2477 FILL2: 
      008D34 90 5A            [ 2] 2478         decw y ; count 
      008D36 26 F3            [ 1] 2479         jrne FILL1  
      008D38 81               [ 4] 2480         ret 
                                   2481 
                                   2482 ;       ERASE   ( b u -- )
                                   2483 ;       Erase u bytes beginning at b.
      008D39 8D 09                 2484         .word      LINK
                           000CBB  2485 LINK = . 
      008D3B 05                    2486         .byte      5
      008D3C 45 52 41 53 45        2487         .ascii     "ERASE"
      008D41                       2488 ERASE:
      008D41 90 5F            [ 1] 2489         clrw y 
      008D43 1D 00 02         [ 2] 2490         subw x,#CELLL 
      008D46 FF               [ 2] 2491         ldw (x),y 
      008D47 CC 8D 0E         [ 2] 2492         jp FILL 
                                   2493 
                                   2494 
                                   2495 ;       PACK0   ( b u a -- a )
                                   2496 ;       Build a counted string with
                                   2497 ;       u characters from b. Null fill.
      008D4A 8D 3B                 2498         .word      LINK
                           000CCC  2499 LINK = . 
      008D4C 05                    2500         .byte      5
      008D4D 50 41 43 4B 30        2501         .ascii     "PACK0"
      008D52                       2502 PACKS:
      008D52 CD 86 1E         [ 4] 2503         CALL     DUPP
      008D55 CD 85 E7         [ 4] 2504         CALL     TOR     ;strings only on cell boundary
      008D58 CD 88 25         [ 4] 2505         CALL     DDUP
      008D5B CD 85 84         [ 4] 2506         CALL     CSTOR
      008D5E CD 8B 38         [ 4] 2507         CALL     ONEP ;save count
      008D61 CD 86 2E         [ 4] 2508         CALL     SWAPP
      008D64 CD 8C DF         [ 4] 2509         CALL     CMOVE
      008D67 CD 85 C8         [ 4] 2510         CALL     RFROM
      008D6A 81               [ 4] 2511         RET
                                   2512 
                                   2513 ;; Numeric output, single precision
                                   2514 
                                   2515 ;       DIGIT   ( u -- c )
                                   2516 ;       Convert digit u to a character.
      008D6B 8D 4C                 2517         .word      LINK
                           000CED  2518 LINK = . 
      008D6D 05                    2519         .byte      5
      008D6E 44 49 47 49 54        2520         .ascii     "DIGIT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008D73                       2521 DIGIT:
      008D73 CD 84 F9         [ 4] 2522         CALL	DOLIT
      008D76 00 09                 2523         .word	9
      008D78 CD 86 48         [ 4] 2524         CALL	OVER
      008D7B CD 89 18         [ 4] 2525         CALL	LESS
      008D7E CD 84 F9         [ 4] 2526         CALL	DOLIT
      008D81 00 07                 2527         .word	7
      008D83 CD 86 6A         [ 4] 2528         CALL	ANDD
      008D86 CD 88 3A         [ 4] 2529         CALL	PLUS
      008D89 CD 84 F9         [ 4] 2530         CALL	DOLIT
      008D8C 00 30                 2531         .word	48	;'0'
      008D8E CC 88 3A         [ 2] 2532         JP	PLUS
                                   2533 
                                   2534 ;       EXTRACT ( n base -- n c )
                                   2535 ;       Extract least significant digit from n.
      008D91 8D 6D                 2536         .word      LINK
                           000D13  2537 LINK = . 
      008D93 07                    2538         .byte      7
      008D94 45 58 54 52 41 43 54  2539         .ascii     "EXTRACT"
      008D9B                       2540 EXTRC:
      008D9B CD 8B A4         [ 4] 2541         CALL     ZERO
      008D9E CD 86 2E         [ 4] 2542         CALL     SWAPP
      008DA1 CD 89 AE         [ 4] 2543         CALL     UMMOD
      008DA4 CD 86 2E         [ 4] 2544         CALL     SWAPP
      008DA7 CC 8D 73         [ 2] 2545         JP     DIGIT
                                   2546 
                                   2547 ;       <#      ( -- )
                                   2548 ;       Initiate  numeric output process.
      008DAA 8D 93                 2549         .word      LINK
                           000D2C  2550 LINK = . 
      008DAC 02                    2551         .byte      2
      008DAD 3C 23                 2552         .ascii     "<#"
      008DAF                       2553 BDIGS:
      008DAF CD 8C A3         [ 4] 2554         CALL     PAD
      008DB2 CD 87 4B         [ 4] 2555         CALL     HLD
      008DB5 CC 85 60         [ 2] 2556         JP     STORE
                                   2557 
                                   2558 ;       HOLD    ( c -- )
                                   2559 ;       Insert a character into output string.
      008DB8 8D AC                 2560         .word      LINK
                           000D3A  2561 LINK = . 
      008DBA 04                    2562         .byte      4
      008DBB 48 4F 4C 44           2563         .ascii     "HOLD"
      008DBF                       2564 HOLD:
      008DBF CD 87 4B         [ 4] 2565         CALL     HLD
      008DC2 CD 85 77         [ 4] 2566         CALL     AT
      008DC5 CD 8B 45         [ 4] 2567         CALL     ONEM
      008DC8 CD 86 1E         [ 4] 2568         CALL     DUPP
      008DCB CD 87 4B         [ 4] 2569         CALL     HLD
      008DCE CD 85 60         [ 4] 2570         CALL     STORE
      008DD1 CC 85 84         [ 2] 2571         JP     CSTOR
                                   2572 
                                   2573 ;       #       ( u -- u )
                                   2574 ;       Extract one digit from u and
                                   2575 ;       append digit to output string.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008DD4 8D BA                 2576         .word      LINK
                           000D56  2577 LINK = . 
      008DD6 01                    2578         .byte      1
      008DD7 23                    2579         .ascii     "#"
      008DD8                       2580 DIG:
      008DD8 CD 86 DB         [ 4] 2581         CALL     BASE
      008DDB CD 85 77         [ 4] 2582         CALL     AT
      008DDE CD 8D 9B         [ 4] 2583         CALL     EXTRC
      008DE1 CC 8D BF         [ 2] 2584         JP     HOLD
                                   2585 
                                   2586 ;       #S      ( u -- 0 )
                                   2587 ;       Convert u until all digits
                                   2588 ;       are added to output string.
      008DE4 8D D6                 2589         .word      LINK
                           000D66  2590 LINK = . 
      008DE6 02                    2591         .byte      2
      008DE7 23 53                 2592         .ascii     "#S"
      008DE9                       2593 DIGS:
      008DE9 CD 8D D8         [ 4] 2594 DIGS1:  CALL     DIG
      008DEC CD 86 1E         [ 4] 2595         CALL     DUPP
      008DEF CD 85 2C         [ 4] 2596         CALL     QBRAN
      008DF2 8D F6                 2597         .word      DIGS2
      008DF4 20 F3            [ 2] 2598         JRA     DIGS1
      008DF6 81               [ 4] 2599 DIGS2:  RET
                                   2600 
                                   2601 ;       SIGN    ( n -- )
                                   2602 ;       Add a minus sign to
                                   2603 ;       numeric output string.
      008DF7 8D E6                 2604         .word      LINK
                           000D79  2605 LINK = . 
      008DF9 04                    2606         .byte      4
      008DFA 53 49 47 4E           2607         .ascii     "SIGN"
      008DFE                       2608 SIGN:
      008DFE CD 86 57         [ 4] 2609         CALL     ZLESS
      008E01 CD 85 2C         [ 4] 2610         CALL     QBRAN
      008E04 8E 0E                 2611         .word      SIGN1
      008E06 CD 84 F9         [ 4] 2612         CALL     DOLIT
      008E09 00 2D                 2613         .word      45	;"-"
      008E0B CC 8D BF         [ 2] 2614         JP     HOLD
      008E0E 81               [ 4] 2615 SIGN1:  RET
                                   2616 
                                   2617 ;       #>      ( w -- b u )
                                   2618 ;       Prepare output string.
      008E0F 8D F9                 2619         .word      LINK
                           000D91  2620 LINK = . 
      008E11 02                    2621         .byte      2
      008E12 23 3E                 2622         .ascii     "#>"
      008E14                       2623 EDIGS:
      008E14 CD 86 14         [ 4] 2624         CALL     DROP
      008E17 CD 87 4B         [ 4] 2625         CALL     HLD
      008E1A CD 85 77         [ 4] 2626         CALL     AT
      008E1D CD 8C A3         [ 4] 2627         CALL     PAD
      008E20 CD 86 48         [ 4] 2628         CALL     OVER
      008E23 CC 88 B3         [ 2] 2629         JP     SUBB
                                   2630 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                   2631 ;       str     ( w -- b u )
                                   2632 ;       Convert a signed integer
                                   2633 ;       to a numeric string.
      008E26 8E 11                 2634         .word      LINK
                           000DA8  2635 LINK = . 
      008E28 03                    2636         .byte      3
      008E29 53 54 52              2637         .ascii     "STR"
      008E2C                       2638 STR:
      008E2C CD 86 1E         [ 4] 2639         CALL     DUPP
      008E2F CD 85 E7         [ 4] 2640         CALL     TOR
      008E32 CD 88 CD         [ 4] 2641         CALL     ABSS
      008E35 CD 8D AF         [ 4] 2642         CALL     BDIGS
      008E38 CD 8D E9         [ 4] 2643         CALL     DIGS
      008E3B CD 85 C8         [ 4] 2644         CALL     RFROM
      008E3E CD 8D FE         [ 4] 2645         CALL     SIGN
      008E41 CC 8E 14         [ 2] 2646         JP     EDIGS
                                   2647 
                                   2648 ;       HEX     ( -- )
                                   2649 ;       Use radix 16 as base for
                                   2650 ;       numeric conversions.
      008E44 8E 28                 2651         .word      LINK
                           000DC6  2652 LINK = . 
      008E46 03                    2653         .byte      3
      008E47 48 45 58              2654         .ascii     "HEX"
      008E4A                       2655 HEX:
      008E4A CD 84 F9         [ 4] 2656         CALL     DOLIT
      008E4D 00 10                 2657         .word      16
      008E4F CD 86 DB         [ 4] 2658         CALL     BASE
      008E52 CC 85 60         [ 2] 2659         JP     STORE
                                   2660 
                                   2661 ;       DECIMAL ( -- )
                                   2662 ;       Use radix 10 as base
                                   2663 ;       for numeric conversions.
      008E55 8E 46                 2664         .word      LINK
                           000DD7  2665 LINK = . 
      008E57 07                    2666         .byte      7
      008E58 44 45 43 49 4D 41 4C  2667         .ascii     "DECIMAL"
      008E5F                       2668 DECIM:
      008E5F CD 84 F9         [ 4] 2669         CALL     DOLIT
      008E62 00 0A                 2670         .word      10
      008E64 CD 86 DB         [ 4] 2671         CALL     BASE
      008E67 CC 85 60         [ 2] 2672         JP     STORE
                                   2673 
                                   2674 ;; Numeric input, single precision
                                   2675 
                                   2676 ;       DIGIT?  ( c base -- u t )
                                   2677 ;       Convert a character to its numeric
                                   2678 ;       value. A flag indicates success.
      008E6A 8E 57                 2679         .word      LINK
                           000DEC  2680 LINK = . 
      008E6C 06                    2681         .byte       6
      008E6D 44 49 47 49 54 3F     2682         .ascii     "DIGIT?"
      008E73                       2683 DIGTQ:
      008E73 CD 85 E7         [ 4] 2684         CALL     TOR
      008E76 CD 84 F9         [ 4] 2685         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008E79 00 30                 2686         .word     48	; "0"
      008E7B CD 88 B3         [ 4] 2687         CALL     SUBB
      008E7E CD 84 F9         [ 4] 2688         CALL     DOLIT
      008E81 00 09                 2689         .word      9
      008E83 CD 86 48         [ 4] 2690         CALL     OVER
      008E86 CD 89 18         [ 4] 2691         CALL     LESS
      008E89 CD 85 2C         [ 4] 2692         CALL     QBRAN
      008E8C 8E A4                 2693         .word      DGTQ1
      008E8E CD 84 F9         [ 4] 2694         CALL     DOLIT
      008E91 00 07                 2695         .word      7
      008E93 CD 88 B3         [ 4] 2696         CALL     SUBB
      008E96 CD 86 1E         [ 4] 2697         CALL     DUPP
      008E99 CD 84 F9         [ 4] 2698         CALL     DOLIT
      008E9C 00 0A                 2699         .word      10
      008E9E CD 89 18         [ 4] 2700         CALL     LESS
      008EA1 CD 86 7E         [ 4] 2701         CALL     ORR
      008EA4 CD 86 1E         [ 4] 2702 DGTQ1:  CALL     DUPP
      008EA7 CD 85 C8         [ 4] 2703         CALL     RFROM
      008EAA CC 88 FA         [ 2] 2704         JP     ULESS
                                   2705 
                           000001  2706 .if  WANT_DOUBLE
                           000000  2707 .else 
                                   2708 ;       NUMBER? ( a -- n T | a F )
                                   2709 ;       Convert a number string to
                                   2710 ;       integer. Push a flag on tos.
                                   2711         .word      LINK
                                   2712 LINK = . 
                                   2713         .byte      7
                                   2714         .ascii     "NUMBER?"
                                   2715 NUMBQ:
                                   2716         CALL     BASE
                                   2717         CALL     AT
                                   2718         CALL     TOR
                                   2719         CALL     ZERO
                                   2720         CALL     OVER
                                   2721         CALL     COUNT
                                   2722         CALL     OVER
                                   2723         CALL     CAT
                                   2724         CALL     DOLIT
                                   2725         .word     36	; "0x"
                                   2726         CALL     EQUAL
                                   2727         CALL     QBRAN
                                   2728         .word      NUMQ1
                                   2729         CALL     HEX
                                   2730         CALL     SWAPP
                                   2731         CALL     ONEP
                                   2732         CALL     SWAPP
                                   2733         CALL     ONEM
                                   2734 NUMQ1:  CALL     OVER
                                   2735         CALL     CAT
                                   2736         CALL     DOLIT
                                   2737         .word     45	; "-"
                                   2738         CALL     EQUAL
                                   2739         CALL     TOR
                                   2740         CALL     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2741         CALL     RAT
                                   2742         CALL     SUBB
                                   2743         CALL     SWAPP
                                   2744         CALL     RAT
                                   2745         CALL     PLUS
                                   2746         CALL     QDUP
                                   2747         CALL     QBRAN
                                   2748         .word      NUMQ6
                                   2749         CALL     ONEM
                                   2750         CALL     TOR
                                   2751 NUMQ2:  CALL     DUPP
                                   2752         CALL     TOR
                                   2753         CALL     CAT
                                   2754         CALL     BASE
                                   2755         CALL     AT
                                   2756         CALL     DIGTQ
                                   2757         CALL     QBRAN
                                   2758         .word      NUMQ4
                                   2759         CALL     SWAPP
                                   2760         CALL     BASE
                                   2761         CALL     AT
                                   2762         CALL     STAR
                                   2763         CALL     PLUS
                                   2764         CALL     RFROM
                                   2765         CALL     ONEP
                                   2766         CALL     DONXT
                                   2767         .word      NUMQ2
                                   2768         CALL     RAT
                                   2769         CALL     SWAPP
                                   2770         CALL     DROP
                                   2771         CALL     QBRAN
                                   2772         .word      NUMQ3
                                   2773         CALL     NEGAT
                                   2774 NUMQ3:  CALL     SWAPP
                                   2775         JRA     NUMQ5
                                   2776 NUMQ4:  CALL     RFROM
                                   2777         CALL     RFROM
                                   2778         CALL     DDROP
                                   2779         CALL     DDROP
                                   2780         CALL     ZERO
                                   2781 NUMQ5:  CALL     DUPP
                                   2782 NUMQ6:  CALL     RFROM
                                   2783         CALL     DDROP
                                   2784         CALL     RFROM
                                   2785         CALL     BASE
                                   2786         JP     STORE
                                   2787 .endif ; WANT_DOUBLE  
                                   2788 
                                   2789 ;; Basic I/O
                                   2790 
                                   2791 ;       KEY     ( -- c )
                                   2792 ;       Wait for and return an
                                   2793 ;       input character.
      008EAD 8E 6C                 2794         .word      LINK
                           000E2F  2795 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008EAF 03                    2796         .byte      3
      008EB0 4B 45 59              2797         .ascii     "KEY"
      008EB3                       2798 KEY:
      008EB3 72 0B 52 30 FB   [ 2] 2799         btjf UART_SR,#UART_SR_RXNE,. 
      008EB8 C6 52 31         [ 1] 2800         ld a,UART_DR 
      008EBB 1D 00 02         [ 2] 2801         subw x,#CELLL 
      008EBE E7 01            [ 1] 2802         ld (1,x),a 
      008EC0 7F               [ 1] 2803         clr (x)
      008EC1 81               [ 4] 2804         ret 
                                   2805 
                                   2806 ;       NUF?    ( -- t )
                                   2807 ;       Return false if no input,
                                   2808 ;       else pause and if CR return true.
      008EC2 8E AF                 2809         .word      LINK
                           000E44  2810 LINK = . 
      008EC4 04                    2811         .byte      4
      008EC5 4E 55 46 3F           2812         .ascii     "NUF?"
      008EC9                       2813 NUFQ:
      008EC9 CD 84 9A         [ 4] 2814         CALL     QKEY
      008ECC CD 86 1E         [ 4] 2815         CALL     DUPP
      008ECF CD 85 2C         [ 4] 2816         CALL     QBRAN
      008ED2 8E E2                 2817         .word    NUFQ1
      008ED4 CD 88 1A         [ 4] 2818         CALL     DDROP
      008ED7 CD 8E B3         [ 4] 2819         CALL     KEY
      008EDA CD 84 F9         [ 4] 2820         CALL     DOLIT
      008EDD 00 0D                 2821         .word      CRR
      008EDF CC 88 DB         [ 2] 2822         JP     EQUAL
      008EE2 81               [ 4] 2823 NUFQ1:  RET
                                   2824 
                                   2825 ;       SPACE   ( -- )
                                   2826 ;       Send  blank character to
                                   2827 ;       output device.
      008EE3 8E C4                 2828         .word      LINK
                           000E65  2829 LINK = . 
      008EE5 05                    2830         .byte      5
      008EE6 53 50 41 43 45        2831         .ascii     "SPACE"
      008EEB                       2832 SPACE:
      008EEB CD 8B 97         [ 4] 2833         CALL     BLANK
      008EEE CC 84 B8         [ 2] 2834         JP     EMIT
                                   2835 
                                   2836 ;       SPACES  ( +n -- )
                                   2837 ;       Send n spaces to output device.
      008EF1 8E E5                 2838         .word      LINK
                           000E73  2839 LINK = . 
      008EF3 06                    2840         .byte      6
      008EF4 53 50 41 43 45 53     2841         .ascii     "SPACES"
      008EFA                       2842 SPACS:
      008EFA CD 8B A4         [ 4] 2843         CALL     ZERO
      008EFD CD 89 56         [ 4] 2844         CALL     MAX
      008F00 CD 85 E7         [ 4] 2845         CALL     TOR
      008F03 20 03            [ 2] 2846         JRA      CHAR2
      008F05 CD 8E EB         [ 4] 2847 CHAR1:  CALL     SPACE
      008F08 CD 85 0D         [ 4] 2848 CHAR2:  CALL     DONXT
      008F0B 8F 05                 2849         .word    CHAR1
      008F0D 81               [ 4] 2850         RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                                   2851 
                                   2852 ;       TYPE    ( b u -- )
                                   2853 ;       Output u characters from b.
      008F0E 8E F3                 2854         .word      LINK
                           000E90  2855 LINK = . 
      008F10 04                    2856         .byte      4
      008F11 54 59 50 45           2857         .ascii     "TYPE"
      008F15                       2858 TYPES:
      008F15 CD 85 E7         [ 4] 2859         CALL     TOR
      008F18 20 0C            [ 2] 2860         JRA     TYPE2
      008F1A CD 86 1E         [ 4] 2861 TYPE1:  CALL     DUPP
      008F1D CD 85 95         [ 4] 2862         CALL     CAT
      008F20 CD 84 B8         [ 4] 2863         CALL     EMIT
      008F23 CD 8B 38         [ 4] 2864         CALL     ONEP
      008F26 CD 85 0D         [ 4] 2865 TYPE2:  CALL     DONXT
      008F29 8F 1A                 2866         .word      TYPE1
      008F2B CC 86 14         [ 2] 2867         JP     DROP
                                   2868 
                                   2869 ;       CR      ( -- )
                                   2870 ;       Output a carriage return
                                   2871 ;       and a line feed.
      008F2E 8F 10                 2872         .word      LINK
                           000EB0  2873 LINK = . 
      008F30 02                    2874         .byte      2
      008F31 43 52                 2875         .ascii     "CR"
      008F33                       2876 CR:
      008F33 CD 84 F9         [ 4] 2877         CALL     DOLIT
      008F36 00 0D                 2878         .word      CRR
      008F38 CD 84 B8         [ 4] 2879         CALL     EMIT
      008F3B CD 84 F9         [ 4] 2880         CALL     DOLIT
      008F3E 00 0A                 2881         .word      LF
      008F40 CC 84 B8         [ 2] 2882         JP     EMIT
                                   2883 
                                   2884 ;       do$     ( -- a )
                                   2885 ;       Return  address of a compiled
                                   2886 ;       string.
      008F43 8F 30                 2887         .word      LINK
                           000EC5  2888 LINK = . 
      008F45 43                    2889 	.byte      COMPO+3
      008F46 44 4F 24              2890         .ascii     "DO$"
      008F49                       2891 DOSTR:
      008F49 CD 85 C8         [ 4] 2892         CALL     RFROM
      008F4C CD 85 DB         [ 4] 2893         CALL     RAT
      008F4F CD 85 C8         [ 4] 2894         CALL     RFROM
      008F52 CD 8C 7B         [ 4] 2895         CALL     COUNT
      008F55 CD 88 3A         [ 4] 2896         CALL     PLUS
      008F58 CD 85 E7         [ 4] 2897         CALL     TOR
      008F5B CD 86 2E         [ 4] 2898         CALL     SWAPP
      008F5E CD 85 E7         [ 4] 2899         CALL     TOR
      008F61 81               [ 4] 2900         RET
                                   2901 
                                   2902 ;       $"|     ( -- a )
                                   2903 ;       Run time routine compiled by $".
                                   2904 ;       Return address of a compiled string.
      008F62 8F 45                 2905         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                           000EE4  2906 LINK = . 
      008F64 43                    2907 	.byte      COMPO+3
      008F65 24 22 7C              2908         .byte     '$','"','|'
      008F68                       2909 STRQP:
      008F68 CD 8F 49         [ 4] 2910         CALL     DOSTR
      008F6B 81               [ 4] 2911         RET
                                   2912 
                                   2913 ;       ."|     ( -- )
                                   2914 ;       Run time routine of ." .
                                   2915 ;       Output a compiled string.
      008F6C 8F 64                 2916         .word      LINK
                           000EEE  2917 LINK = . 
      008F6E 43                    2918 	.byte      COMPO+3
      008F6F 2E 22 7C              2919         .byte     '.','"','|'
      008F72                       2920 DOTQP:
      008F72 CD 8F 49         [ 4] 2921         CALL     DOSTR
      008F75 CD 8C 7B         [ 4] 2922         CALL     COUNT
      008F78 CC 8F 15         [ 2] 2923         JP     TYPES
                                   2924 
                                   2925 ;       .R      ( n +n -- )
                                   2926 ;       Display an integer in a field
                                   2927 ;       of n columns, right justified.
      008F7B 8F 6E                 2928         .word      LINK
                           000EFD  2929 LINK = . 
      008F7D 02                    2930         .byte      2
      008F7E 2E 52                 2931         .ascii     ".R"
      008F80                       2932 DOTR:
      008F80 CD 85 E7         [ 4] 2933         CALL     TOR
      008F83 CD 8E 2C         [ 4] 2934         CALL     STR
      008F86 CD 85 C8         [ 4] 2935         CALL     RFROM
      008F89 CD 86 48         [ 4] 2936         CALL     OVER
      008F8C CD 88 B3         [ 4] 2937         CALL     SUBB
      008F8F CD 8E FA         [ 4] 2938         CALL     SPACS
      008F92 CC 8F 15         [ 2] 2939         JP     TYPES
                                   2940 
                                   2941 ;       U.R     ( u +n -- )
                                   2942 ;       Display an unsigned integer
                                   2943 ;       in n column, right justified.
      008F95 8F 7D                 2944         .word      LINK
                           000F17  2945 LINK = . 
      008F97 03                    2946         .byte      3
      008F98 55 2E 52              2947         .ascii     "U.R"
      008F9B                       2948 UDOTR:
      008F9B CD 85 E7         [ 4] 2949         CALL     TOR
      008F9E CD 8D AF         [ 4] 2950         CALL     BDIGS
      008FA1 CD 8D E9         [ 4] 2951         CALL     DIGS
      008FA4 CD 8E 14         [ 4] 2952         CALL     EDIGS
      008FA7 CD 85 C8         [ 4] 2953         CALL     RFROM
      008FAA CD 86 48         [ 4] 2954         CALL     OVER
      008FAD CD 88 B3         [ 4] 2955         CALL     SUBB
      008FB0 CD 8E FA         [ 4] 2956         CALL     SPACS
      008FB3 CC 8F 15         [ 2] 2957         JP     TYPES
                                   2958 
                                   2959 ;       U.      ( u -- )
                                   2960 ;       Display an unsigned integer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                                   2961 ;       in free format.
      008FB6 8F 97                 2962         .word      LINK
                           000F38  2963 LINK = . 
      008FB8 02                    2964         .byte      2
      008FB9 55 2E                 2965         .ascii     "U."
      008FBB                       2966 UDOT:
      008FBB CD 8D AF         [ 4] 2967         CALL     BDIGS
      008FBE CD 8D E9         [ 4] 2968         CALL     DIGS
      008FC1 CD 8E 14         [ 4] 2969         CALL     EDIGS
      008FC4 CD 8E EB         [ 4] 2970         CALL     SPACE
      008FC7 CC 8F 15         [ 2] 2971         JP     TYPES
                                   2972 
                                   2973 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2974 ;   H. ( n -- )
                                   2975 ;   display n in hexadecimal 
                                   2976 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F4A                       2977         _HEADER HDOT,2,"H."
      008FCA 8F B8                    1         .word LINK 
                           000F4C     2         LINK=.
      008FCC 02                       3         .byte 2  
      008FCD 48 2E                    4         .ascii "H."
      008FCF                          5         HDOT:
      008FCF CD 86 DB         [ 4] 2978         CALL BASE 
      008FD2 CD 85 77         [ 4] 2979         CALL AT 
      008FD5 CD 85 E7         [ 4] 2980         CALL TOR 
      008FD8 CD 8E 4A         [ 4] 2981         CALL HEX 
      008FDB CD 8F BB         [ 4] 2982         CALL UDOT 
      008FDE CD 85 C8         [ 4] 2983         CALL RFROM 
      008FE1 CD 86 DB         [ 4] 2984         CALL BASE 
      008FE4 CD 85 60         [ 4] 2985         CALL STORE 
      008FE7 81               [ 4] 2986         RET 
                                   2987 
                                   2988 
                                   2989 ;       .       ( w -- )
                                   2990 ;       Display an integer in free
                                   2991 ;       format, preceeded by a space.
      008FE8 8F CC                 2992         .word      LINK
                           000F6A  2993 LINK = . 
      008FEA 01                    2994         .byte      1
      008FEB 2E                    2995         .ascii     "."
      008FEC                       2996 DOT:
      008FEC CD 86 DB         [ 4] 2997         CALL     BASE
      008FEF CD 85 77         [ 4] 2998         CALL     AT
      008FF2 CD 84 F9         [ 4] 2999         CALL     DOLIT
      008FF5 00 0A                 3000         .word      10
      008FF7 CD 86 93         [ 4] 3001         CALL     XORR    ;?decimal
      008FFA CD 85 2C         [ 4] 3002         CALL     QBRAN
      008FFD 90 02                 3003         .word      DOT1
      008FFF CC 8F BB         [ 2] 3004         JP     UDOT
      009002 CD 8E 2C         [ 4] 3005 DOT1:   CALL     STR
      009005 CD 8E EB         [ 4] 3006         CALL     SPACE
      009008 CC 8F 15         [ 2] 3007         JP     TYPES
                                   3008 
                                   3009 ;       ?       ( a -- )
                                   3010 ;       Display contents in memory cell.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      00900B 8F EA                 3011         .word      LINK
                                   3012         
                           000F8D  3013 LINK = . 
      00900D 01                    3014         .byte      1
      00900E 3F                    3015         .ascii     "?"
      00900F                       3016 QUEST:
      00900F CD 85 77         [ 4] 3017         CALL     AT
      009012 CC 8F EC         [ 2] 3018         JP     DOT
                                   3019 
                                   3020 ;; Parsing
                                   3021 
                                   3022 ;       parse   ( b u c -- b u delta ; <string> )
                                   3023 ;       Scan string delimited by c.
                                   3024 ;       Return found string and its offset.
      009015 90 0D                 3025         .word      LINK
                           000F97  3026 LINK = . 
      009017 05                    3027         .byte      5
      009018 70 61 72 73 65        3028         .ascii     "parse"
      00901D                       3029 PARS:
      00901D CD 86 EA         [ 4] 3030         CALL     TEMP
      009020 CD 85 60         [ 4] 3031         CALL     STORE
      009023 CD 86 48         [ 4] 3032         CALL     OVER
      009026 CD 85 E7         [ 4] 3033         CALL     TOR
      009029 CD 86 1E         [ 4] 3034         CALL     DUPP
      00902C CD 85 2C         [ 4] 3035         CALL     QBRAN
      00902F 90 D5                 3036         .word    PARS8
      009031 CD 8B 45         [ 4] 3037         CALL     ONEM
      009034 CD 86 EA         [ 4] 3038         CALL     TEMP
      009037 CD 85 77         [ 4] 3039         CALL     AT
      00903A CD 8B 97         [ 4] 3040         CALL     BLANK
      00903D CD 88 DB         [ 4] 3041         CALL     EQUAL
      009040 CD 85 2C         [ 4] 3042         CALL     QBRAN
      009043 90 76                 3043         .word      PARS3
      009045 CD 85 E7         [ 4] 3044         CALL     TOR
      009048 CD 8B 97         [ 4] 3045 PARS1:  CALL     BLANK
      00904B CD 86 48         [ 4] 3046         CALL     OVER
      00904E CD 85 95         [ 4] 3047         CALL     CAT     ;skip leading blanks ONLY
      009051 CD 88 B3         [ 4] 3048         CALL     SUBB
      009054 CD 86 57         [ 4] 3049         CALL     ZLESS
      009057 CD 88 54         [ 4] 3050         CALL     INVER
      00905A CD 85 2C         [ 4] 3051         CALL     QBRAN
      00905D 90 73                 3052         .word      PARS2
      00905F CD 8B 38         [ 4] 3053         CALL     ONEP
      009062 CD 85 0D         [ 4] 3054         CALL     DONXT
      009065 90 48                 3055         .word      PARS1
      009067 CD 85 C8         [ 4] 3056         CALL     RFROM
      00906A CD 86 14         [ 4] 3057         CALL     DROP
      00906D CD 8B A4         [ 4] 3058         CALL     ZERO
      009070 CC 86 1E         [ 2] 3059         JP     DUPP
      009073 CD 85 C8         [ 4] 3060 PARS2:  CALL     RFROM
      009076 CD 86 48         [ 4] 3061 PARS3:  CALL     OVER
      009079 CD 86 2E         [ 4] 3062         CALL     SWAPP
      00907C CD 85 E7         [ 4] 3063         CALL     TOR
      00907F CD 86 EA         [ 4] 3064 PARS4:  CALL     TEMP
      009082 CD 85 77         [ 4] 3065         CALL     AT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      009085 CD 86 48         [ 4] 3066         CALL     OVER
      009088 CD 85 95         [ 4] 3067         CALL     CAT
      00908B CD 88 B3         [ 4] 3068         CALL     SUBB    ;scan for delimiter
      00908E CD 86 EA         [ 4] 3069         CALL     TEMP
      009091 CD 85 77         [ 4] 3070         CALL     AT
      009094 CD 8B 97         [ 4] 3071         CALL     BLANK
      009097 CD 88 DB         [ 4] 3072         CALL     EQUAL
      00909A CD 85 2C         [ 4] 3073         CALL     QBRAN
      00909D 90 A2                 3074         .word      PARS5
      00909F CD 86 57         [ 4] 3075         CALL     ZLESS
      0090A2 CD 85 2C         [ 4] 3076 PARS5:  CALL     QBRAN
      0090A5 90 B7                 3077         .word      PARS6
      0090A7 CD 8B 38         [ 4] 3078         CALL     ONEP
      0090AA CD 85 0D         [ 4] 3079         CALL     DONXT
      0090AD 90 7F                 3080         .word      PARS4
      0090AF CD 86 1E         [ 4] 3081         CALL     DUPP
      0090B2 CD 85 E7         [ 4] 3082         CALL     TOR
      0090B5 20 0F            [ 2] 3083         JRA     PARS7
      0090B7 CD 85 C8         [ 4] 3084 PARS6:  CALL     RFROM
      0090BA CD 86 14         [ 4] 3085         CALL     DROP
      0090BD CD 86 1E         [ 4] 3086         CALL     DUPP
      0090C0 CD 8B 38         [ 4] 3087         CALL     ONEP
      0090C3 CD 85 E7         [ 4] 3088         CALL     TOR
      0090C6 CD 86 48         [ 4] 3089 PARS7:  CALL     OVER
      0090C9 CD 88 B3         [ 4] 3090         CALL     SUBB
      0090CC CD 85 C8         [ 4] 3091         CALL     RFROM
      0090CF CD 85 C8         [ 4] 3092         CALL     RFROM
      0090D2 CC 88 B3         [ 2] 3093         JP     SUBB
      0090D5 CD 86 48         [ 4] 3094 PARS8:  CALL     OVER
      0090D8 CD 85 C8         [ 4] 3095         CALL     RFROM
      0090DB CC 88 B3         [ 2] 3096         JP     SUBB
                                   3097 
                                   3098 ;       PARSE   ( c -- b u ; <string> )
                                   3099 ;       Scan input stream and return
                                   3100 ;       counted string delimited by c.
      0090DE 90 17                 3101         .word      LINK
                           001060  3102 LINK = . 
      0090E0 05                    3103         .byte      5
      0090E1 50 41 52 53 45        3104         .ascii     "PARSE"
      0090E6                       3105 PARSE:
      0090E6 CD 85 E7         [ 4] 3106         CALL     TOR
      0090E9 CD 8C B4         [ 4] 3107         CALL     TIB
      0090EC CD 86 F9         [ 4] 3108         CALL     INN
      0090EF CD 85 77         [ 4] 3109         CALL     AT
      0090F2 CD 88 3A         [ 4] 3110         CALL     PLUS    ;current input buffer pointer
      0090F5 CD 87 09         [ 4] 3111         CALL     NTIB
      0090F8 CD 85 77         [ 4] 3112         CALL     AT
      0090FB CD 86 F9         [ 4] 3113         CALL     INN
      0090FE CD 85 77         [ 4] 3114         CALL     AT
      009101 CD 88 B3         [ 4] 3115         CALL     SUBB    ;remaining count
      009104 CD 85 C8         [ 4] 3116         CALL     RFROM
      009107 CD 90 1D         [ 4] 3117         CALL     PARS
      00910A CD 86 F9         [ 4] 3118         CALL     INN
      00910D CC 8C 14         [ 2] 3119         JP     PSTOR
                                   3120 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                   3121 ;       .(      ( -- )
                                   3122 ;       Output following string up to next ) .
      009110 90 E0                 3123         .word      LINK
                           001092  3124 LINK = . 
      009112 82                    3125 	.byte      IMEDD+2
      009113 2E 28                 3126         .ascii     ".("
      009115                       3127 DOTPR:
      009115 CD 84 F9         [ 4] 3128         CALL     DOLIT
      009118 00 29                 3129         .word     41	; ")"
      00911A CD 90 E6         [ 4] 3130         CALL     PARSE
      00911D CC 8F 15         [ 2] 3131         JP     TYPES
                                   3132 
                                   3133 ;       (       ( -- )
                                   3134 ;       Ignore following string up to next ).
                                   3135 ;       A comment.
      009120 91 12                 3136         .word      LINK
                           0010A2  3137 LINK = . 
      009122 81                    3138 	.byte      IMEDD+1
      009123 28                    3139         .ascii     "("
      009124                       3140 PAREN:
      009124 CD 84 F9         [ 4] 3141         CALL     DOLIT
      009127 00 29                 3142         .word     41	; ")"
      009129 CD 90 E6         [ 4] 3143         CALL     PARSE
      00912C CC 88 1A         [ 2] 3144         JP     DDROP
                                   3145 
                                   3146 ;       \       ( -- )
                                   3147 ;       Ignore following text till
                                   3148 ;       end of line.
      00912F 91 22                 3149         .word      LINK
                           0010B1  3150 LINK = . 
      009131 81                    3151 	.byte      IMEDD+1
      009132 5C                    3152         .ascii     "\"
      009133                       3153 BKSLA:
      009133 90 AE 00 10      [ 2] 3154         ldw y,#UCTIB ; #TIB  
      009137 90 FE            [ 2] 3155         ldw y,(y)
      009139 90 89            [ 2] 3156         pushw y ; count in TIB 
      00913B 90 AE 00 0E      [ 2] 3157         ldw y,#UINN ; >IN 
      00913F 90 BF 28         [ 2] 3158         ldw YTEMP,y
      009142 90 85            [ 2] 3159         popw y 
      009144 91 CF 28         [ 5] 3160         ldw [YTEMP],y
      009147 81               [ 4] 3161         ret 
                                   3162 
                                   3163 ;       WORD    ( c -- a ; <string> )
                                   3164 ;       Parse a word from input stream
                                   3165 ;       and copy it to code dictionary.
      009148 91 31                 3166         .word      LINK
                           0010CA  3167 LINK = . 
      00914A 04                    3168         .byte      4
      00914B 57 4F 52 44           3169         .ascii     "WORD"
      00914F                       3170 WORDD:
      00914F CD 90 E6         [ 4] 3171         CALL     PARSE
      009152 CD 8C 92         [ 4] 3172         CALL     HERE
      009155 CD 8B 0D         [ 4] 3173         CALL     CELLP
                           000000  3174 .IF CASE_SENSE 
                                   3175         JP      PACKS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                           000001  3176 .ELSE                 
      009158 CD 8D 52         [ 4] 3177         CALL     PACKS
                                   3178 ; uppercase TOKEN 
      00915B CD 86 1E         [ 4] 3179         CALL    DUPP 
      00915E CD 8C 7B         [ 4] 3180         CALL    COUNT 
      009161 CD 85 E7         [ 4] 3181         CALL    TOR 
      009164 CD 85 43         [ 4] 3182         CALL    BRAN 
      009167 91 95                 3183         .word   UPPER2  
      009169                       3184 UPPER:
      009169 CD 86 1E         [ 4] 3185         CALL    DUPP 
      00916C CD 85 95         [ 4] 3186         CALL    CAT
      00916F CD 86 1E         [ 4] 3187         CALL    DUPP 
      009172 CD 84 F9         [ 4] 3188         CALL   DOLIT
      009175 00 61                 3189         .word   'a' 
      009177 CD 84 F9         [ 4] 3190         CALL    DOLIT
      00917A 00 7B                 3191         .word   'z'+1 
      00917C CD 89 93         [ 4] 3192         CALL   WITHI 
      00917F CD 85 2C         [ 4] 3193         CALL   QBRAN
      009182 91 8C                 3194         .word  UPPER1  
      009184 CD 84 F9         [ 4] 3195         CALL    DOLIT 
      009187 00 DF                 3196         .word   0xDF 
      009189 CD 86 6A         [ 4] 3197         CALL    ANDD 
      00918C                       3198 UPPER1:
      00918C CD 86 48         [ 4] 3199         CALL    OVER 
      00918F CD 85 84         [ 4] 3200         CALL    CSTOR          
      009192 CD 8B 38         [ 4] 3201         CALL    ONEP 
      009195                       3202 UPPER2: 
      009195 CD 85 0D         [ 4] 3203         CALL    DONXT
      009198 91 69                 3204         .word   UPPER  
      00919A CD 86 14         [ 4] 3205         CALL    DROP  
      00919D 81               [ 4] 3206         RET 
                                   3207 .ENDIF 
                                   3208 
                                   3209 ;       TOKEN   ( -- a ; <string> )
                                   3210 ;       Parse a word from input stream
                                   3211 ;       and copy it to name dictionary.
      00919E 91 4A                 3212         .word      LINK
                           001120  3213 LINK = . 
      0091A0 05                    3214         .byte      5
      0091A1 54 4F 4B 45 4E        3215         .ascii     "TOKEN"
      0091A6                       3216 TOKEN:
      0091A6 CD 8B 97         [ 4] 3217         CALL     BLANK
      0091A9 CC 91 4F         [ 2] 3218         JP     WORDD
                                   3219 
                                   3220 ;; Dictionary search
                                   3221 
                                   3222 ;       NAME>   ( na -- ca )
                                   3223 ;       Return a code address given
                                   3224 ;       a name address.
      0091AC 91 A0                 3225         .word      LINK
                           00112E  3226 LINK = . 
      0091AE 05                    3227         .byte      5
      0091AF 4E 41 4D 45 3E        3228         .ascii     "NAME>"
      0091B4                       3229 NAMET:
      0091B4 CD 8C 7B         [ 4] 3230         CALL     COUNT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      0091B7 CD 84 F9         [ 4] 3231         CALL     DOLIT
      0091BA 00 1F                 3232         .word      31
      0091BC CD 86 6A         [ 4] 3233         CALL     ANDD
      0091BF CC 88 3A         [ 2] 3234         JP     PLUS
                                   3235 
                                   3236 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   3237 ;       Compare u cells in two
                                   3238 ;       strings. Return 0 if identical.
      0091C2 91 AE                 3239         .word      LINK
                           001144  3240 LINK = . 
      0091C4 05                    3241         .byte       5
      0091C5 53 41 4D 45 3F        3242         .ascii     "SAME?"
      0091CA                       3243 SAMEQ:
      0091CA CD 8B 45         [ 4] 3244         CALL     ONEM
      0091CD CD 85 E7         [ 4] 3245         CALL     TOR
      0091D0 20 29            [ 2] 3246         JRA     SAME2
      0091D2 CD 86 48         [ 4] 3247 SAME1:  CALL     OVER
      0091D5 CD 85 DB         [ 4] 3248         CALL     RAT
      0091D8 CD 88 3A         [ 4] 3249         CALL     PLUS
      0091DB CD 85 95         [ 4] 3250         CALL     CAT
      0091DE CD 86 48         [ 4] 3251         CALL     OVER
      0091E1 CD 85 DB         [ 4] 3252         CALL     RAT
      0091E4 CD 88 3A         [ 4] 3253         CALL     PLUS
      0091E7 CD 85 95         [ 4] 3254         CALL     CAT
      0091EA CD 88 B3         [ 4] 3255         CALL     SUBB
      0091ED CD 87 C8         [ 4] 3256         CALL     QDUP
      0091F0 CD 85 2C         [ 4] 3257         CALL     QBRAN
      0091F3 91 FB                 3258         .word      SAME2
      0091F5 CD 85 C8         [ 4] 3259         CALL     RFROM
      0091F8 CC 86 14         [ 2] 3260         JP     DROP
      0091FB CD 85 0D         [ 4] 3261 SAME2:  CALL     DONXT
      0091FE 91 D2                 3262         .word      SAME1
      009200 CC 8B A4         [ 2] 3263         JP     ZERO
                                   3264 
                                   3265 ;       find    ( a va -- ca na | a F )
                                   3266 ;       Search vocabulary for string.
                                   3267 ;       Return ca and na if succeeded.
      009203 91 C4                 3268         .word      LINK
                           001185  3269 LINK = . 
      009205 04                    3270         .byte      4
      009206 46 49 4E 44           3271         .ascii     "FIND"
      00920A                       3272 FIND:
      00920A CD 86 2E         [ 4] 3273         CALL     SWAPP
      00920D CD 86 1E         [ 4] 3274         CALL     DUPP
      009210 CD 85 95         [ 4] 3275         CALL     CAT
      009213 CD 86 EA         [ 4] 3276         CALL     TEMP
      009216 CD 85 60         [ 4] 3277         CALL     STORE
      009219 CD 86 1E         [ 4] 3278         CALL     DUPP
      00921C CD 85 77         [ 4] 3279         CALL     AT
      00921F CD 85 E7         [ 4] 3280         CALL     TOR
      009222 CD 8B 0D         [ 4] 3281         CALL     CELLP
      009225 CD 86 2E         [ 4] 3282         CALL     SWAPP
      009228 CD 85 77         [ 4] 3283 FIND1:  CALL     AT
      00922B CD 86 1E         [ 4] 3284         CALL     DUPP
      00922E CD 85 2C         [ 4] 3285         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      009231 92 67                 3286         .word      FIND6
      009233 CD 86 1E         [ 4] 3287         CALL     DUPP
      009236 CD 85 77         [ 4] 3288         CALL     AT
      009239 CD 84 F9         [ 4] 3289         CALL     DOLIT
      00923C 1F 7F                 3290         .word      MASKK
      00923E CD 86 6A         [ 4] 3291         CALL     ANDD
      009241 CD 85 DB         [ 4] 3292         CALL     RAT
      009244 CD 86 93         [ 4] 3293         CALL     XORR
      009247 CD 85 2C         [ 4] 3294         CALL     QBRAN
      00924A 92 56                 3295         .word      FIND2
      00924C CD 8B 0D         [ 4] 3296         CALL     CELLP
      00924F CD 84 F9         [ 4] 3297         CALL     DOLIT
      009252 FF FF                 3298         .word     0xFFFF
      009254 20 0C            [ 2] 3299         JRA     FIND3
      009256 CD 8B 0D         [ 4] 3300 FIND2:  CALL     CELLP
      009259 CD 86 EA         [ 4] 3301         CALL     TEMP
      00925C CD 85 77         [ 4] 3302         CALL     AT
      00925F CD 91 CA         [ 4] 3303         CALL     SAMEQ
      009262 CD 85 43         [ 4] 3304 FIND3:  CALL     BRAN
      009265 92 76                 3305         .word      FIND4
      009267 CD 85 C8         [ 4] 3306 FIND6:  CALL     RFROM
      00926A CD 86 14         [ 4] 3307         CALL     DROP
      00926D CD 86 2E         [ 4] 3308         CALL     SWAPP
      009270 CD 8B 1C         [ 4] 3309         CALL     CELLM
      009273 CC 86 2E         [ 2] 3310         JP     SWAPP
      009276 CD 85 2C         [ 4] 3311 FIND4:  CALL     QBRAN
      009279 92 83                 3312         .word      FIND5
      00927B CD 8B 1C         [ 4] 3313         CALL     CELLM
      00927E CD 8B 1C         [ 4] 3314         CALL     CELLM
      009281 20 A5            [ 2] 3315         JRA     FIND1
      009283 CD 85 C8         [ 4] 3316 FIND5:  CALL     RFROM
      009286 CD 86 14         [ 4] 3317         CALL     DROP
      009289 CD 86 2E         [ 4] 3318         CALL     SWAPP
      00928C CD 86 14         [ 4] 3319         CALL     DROP
      00928F CD 8B 1C         [ 4] 3320         CALL     CELLM
      009292 CD 86 1E         [ 4] 3321         CALL     DUPP
      009295 CD 91 B4         [ 4] 3322         CALL     NAMET
      009298 CC 86 2E         [ 2] 3323         JP     SWAPP
                                   3324 
                                   3325 ;       NAME?   ( a -- ca na | a F )
                                   3326 ;       Search vocabularies for a string.
      00929B 92 05                 3327         .word      LINK
                           00121D  3328 LINK = . 
      00929D 05                    3329         .byte      5
      00929E 4E 41 4D 45 3F        3330         .ascii     "NAME?"
      0092A3                       3331 NAMEQ:
      0092A3 CD 87 5E         [ 4] 3332         CALL   CNTXT
      0092A6 CC 92 0A         [ 2] 3333         JP     FIND
                                   3334 
                                   3335 ;; Terminal response
                                   3336 
                                   3337 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3338 ;       Backup cursor by one character.
      0092A9 92 9D                 3339         .word      LINK
                           00122B  3340 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      0092AB 02                    3341         .byte      2
      0092AC 5E 48                 3342         .ascii     "^H"
      0092AE                       3343 BKSP:
      0092AE CD 85 E7         [ 4] 3344         CALL     TOR
      0092B1 CD 86 48         [ 4] 3345         CALL     OVER
      0092B4 CD 85 C8         [ 4] 3346         CALL     RFROM
      0092B7 CD 86 2E         [ 4] 3347         CALL     SWAPP
      0092BA CD 86 48         [ 4] 3348         CALL     OVER
      0092BD CD 86 93         [ 4] 3349         CALL     XORR
      0092C0 CD 85 2C         [ 4] 3350         CALL     QBRAN
      0092C3 92 DE                 3351         .word      BACK1
      0092C5 CD 84 F9         [ 4] 3352         CALL     DOLIT
      0092C8 00 08                 3353         .word      BKSPP
      0092CA CD 84 B8         [ 4] 3354         CALL     EMIT
      0092CD CD 8B 45         [ 4] 3355         CALL     ONEM
      0092D0 CD 8B 97         [ 4] 3356         CALL     BLANK
      0092D3 CD 84 B8         [ 4] 3357         CALL     EMIT
      0092D6 CD 84 F9         [ 4] 3358         CALL     DOLIT
      0092D9 00 08                 3359         .word      BKSPP
      0092DB CC 84 B8         [ 2] 3360         JP     EMIT
      0092DE 81               [ 4] 3361 BACK1:  RET
                                   3362 
                                   3363 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3364 ;       Accept and echo key stroke
                                   3365 ;       and bump cursor.
      0092DF 92 AB                 3366         .word      LINK
                           001261  3367 LINK = . 
      0092E1 03                    3368         .byte      3
      0092E2 54 41 50              3369         .ascii     "TAP"
      0092E5                       3370 TAP:
      0092E5 CD 86 1E         [ 4] 3371         CALL     DUPP
      0092E8 CD 84 B8         [ 4] 3372         CALL     EMIT
      0092EB CD 86 48         [ 4] 3373         CALL     OVER
      0092EE CD 85 84         [ 4] 3374         CALL     CSTOR
      0092F1 CC 8B 38         [ 2] 3375         JP     ONEP
                                   3376 
                                   3377 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3378 ;       Process a key stroke,
                                   3379 ;       CR,LF or backspace.
      0092F4 92 E1                 3380         .word      LINK
                           001276  3381 LINK = . 
      0092F6 04                    3382         .byte      4
      0092F7 4B 54 41 50           3383         .ascii     "KTAP"
      0092FB                       3384 KTAP:
      0092FB CD 86 1E         [ 4] 3385         CALL     DUPP
      0092FE CD 84 F9         [ 4] 3386         CALL     DOLIT
                           000001  3387 .if EOL_CR
      009301 00 0D                 3388         .word   CRR
                           000000  3389 .else ; EOL_LF 
                                   3390         .word   LF
                                   3391 .endif 
      009303 CD 86 93         [ 4] 3392         CALL     XORR
      009306 CD 85 2C         [ 4] 3393         CALL     QBRAN
      009309 93 21                 3394         .word      KTAP2
      00930B CD 84 F9         [ 4] 3395         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      00930E 00 08                 3396         .word      BKSPP
      009310 CD 86 93         [ 4] 3397         CALL     XORR
      009313 CD 85 2C         [ 4] 3398         CALL     QBRAN
      009316 93 1E                 3399         .word      KTAP1
      009318 CD 8B 97         [ 4] 3400         CALL     BLANK
      00931B CC 92 E5         [ 2] 3401         JP     TAP
      00931E CC 92 AE         [ 2] 3402 KTAP1:  JP     BKSP
      009321 CD 86 14         [ 4] 3403 KTAP2:  CALL     DROP
      009324 CD 86 2E         [ 4] 3404         CALL     SWAPP
      009327 CD 86 14         [ 4] 3405         CALL     DROP
      00932A CC 86 1E         [ 2] 3406         JP     DUPP
                                   3407 
                                   3408 ;       accept  ( b u -- b u )
                                   3409 ;       Accept characters to input
                                   3410 ;       buffer. Return with actual count.
      00932D 92 F6                 3411         .word      LINK
                           0012AF  3412 LINK = . 
      00932F 06                    3413         .byte      6
      009330 41 43 43 45 50 54     3414         .ascii     "ACCEPT"
      009336                       3415 ACCEP:
      009336 CD 86 48         [ 4] 3416         CALL     OVER
      009339 CD 88 3A         [ 4] 3417         CALL     PLUS
      00933C CD 86 48         [ 4] 3418         CALL     OVER
      00933F CD 88 25         [ 4] 3419 ACCP1:  CALL     DDUP
      009342 CD 86 93         [ 4] 3420         CALL     XORR
      009345 CD 85 2C         [ 4] 3421         CALL     QBRAN
      009348 93 6A                 3422         .word      ACCP4
      00934A CD 8E B3         [ 4] 3423         CALL     KEY
      00934D CD 86 1E         [ 4] 3424         CALL     DUPP
      009350 CD 8B 97         [ 4] 3425         CALL     BLANK
      009353 CD 84 F9         [ 4] 3426         CALL     DOLIT
      009356 00 7F                 3427         .word      127
      009358 CD 89 93         [ 4] 3428         CALL     WITHI
      00935B CD 85 2C         [ 4] 3429         CALL     QBRAN
      00935E 93 65                 3430         .word      ACCP2
      009360 CD 92 E5         [ 4] 3431         CALL     TAP
      009363 20 03            [ 2] 3432         JRA     ACCP3
      009365 CD 92 FB         [ 4] 3433 ACCP2:  CALL     KTAP
      009368 20 D5            [ 2] 3434 ACCP3:  JRA     ACCP1
      00936A CD 86 14         [ 4] 3435 ACCP4:  CALL     DROP
      00936D CD 86 48         [ 4] 3436         CALL     OVER
      009370 CC 88 B3         [ 2] 3437         JP     SUBB
                                   3438 
                                   3439 ;       QUERY   ( -- )
                                   3440 ;       Accept input stream to
                                   3441 ;       terminal input buffer.
      009373 93 2F                 3442         .word      LINK
                                   3443         
                           0012F5  3444 LINK = . 
      009375 05                    3445         .byte      5
      009376 51 55 45 52 59        3446         .ascii     "QUERY"
      00937B                       3447 QUERY:
      00937B CD 8C B4         [ 4] 3448         CALL     TIB
      00937E CD 84 F9         [ 4] 3449         CALL     DOLIT
      009381 00 50                 3450         .word      80
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      009383 CD 93 36         [ 4] 3451         CALL     ACCEP
      009386 CD 87 09         [ 4] 3452         CALL     NTIB
      009389 CD 85 60         [ 4] 3453         CALL     STORE
      00938C CD 86 14         [ 4] 3454         CALL     DROP
      00938F CD 8B A4         [ 4] 3455         CALL     ZERO
      009392 CD 86 F9         [ 4] 3456         CALL     INN
      009395 CC 85 60         [ 2] 3457         JP     STORE
                                   3458 
                                   3459 ;       ABORT   ( -- )
                                   3460 ;       Reset data stack and
                                   3461 ;       jump to QUIT.
      009398 93 75                 3462         .word      LINK
                           00131A  3463 LINK = . 
      00939A 05                    3464         .byte      5
      00939B 41 42 4F 52 54        3465         .ascii     "ABORT"
      0093A0                       3466 ABORT:
      0093A0 CD 94 97         [ 4] 3467         CALL     PRESE
      0093A3 CC 94 B4         [ 2] 3468         JP     QUIT
                                   3469 
                                   3470 ;       abort"  ( f -- )
                                   3471 ;       Run time routine of ABORT".
                                   3472 ;       Abort with a message.
      0093A6 93 9A                 3473         .word      LINK
                           001328  3474 LINK = . 
      0093A8 46                    3475 	.byte      COMPO+6
      0093A9 41 42 4F 52 54        3476         .ascii     "ABORT"
      0093AE 22                    3477         .byte      '"'
      0093AF                       3478 ABORQ:
      0093AF CD 85 2C         [ 4] 3479         CALL     QBRAN
      0093B2 93 CE                 3480         .word      ABOR2   ;text flag
      0093B4 CD 8F 49         [ 4] 3481         CALL     DOSTR
      0093B7 CD 8E EB         [ 4] 3482 ABOR1:  CALL     SPACE
      0093BA CD 8C 7B         [ 4] 3483         CALL     COUNT
      0093BD CD 8F 15         [ 4] 3484         CALL     TYPES
      0093C0 CD 84 F9         [ 4] 3485         CALL     DOLIT
      0093C3 00 3F                 3486         .word     63 ; "?"
      0093C5 CD 84 B8         [ 4] 3487         CALL     EMIT
      0093C8 CD 8F 33         [ 4] 3488         CALL     CR
      0093CB CC 93 A0         [ 2] 3489         JP     ABORT   ;pass error string
      0093CE CD 8F 49         [ 4] 3490 ABOR2:  CALL     DOSTR
      0093D1 CC 86 14         [ 2] 3491         JP     DROP
                                   3492 
                                   3493 ;; The text interpreter
                                   3494 
                                   3495 ;       $INTERPRET      ( a -- )
                                   3496 ;       Interpret a word. If failed,
                                   3497 ;       try to convert it to an integer.
      0093D4 93 A8                 3498         .word      LINK
                           001356  3499 LINK = . 
      0093D6 0A                    3500         .byte      10
      0093D7 24 49 4E 54 45 52 50  3501         .ascii     "$INTERPRET"
             52 45 54
      0093E1                       3502 INTER:
      0093E1 CD 92 A3         [ 4] 3503         CALL     NAMEQ
      0093E4 CD 87 C8         [ 4] 3504         CALL     QDUP    ;?defined
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      0093E7 CD 85 2C         [ 4] 3505         CALL     QBRAN
      0093EA 94 0B                 3506         .word      INTE1
      0093EC CD 85 77         [ 4] 3507         CALL     AT
      0093EF CD 84 F9         [ 4] 3508         CALL     DOLIT
      0093F2 40 00                 3509 	.word       0x4000	; COMPO*256
      0093F4 CD 86 6A         [ 4] 3510         CALL     ANDD    ;?compile only lexicon bits
      0093F7 CD 93 AF         [ 4] 3511         CALL     ABORQ
      0093FA 0D                    3512         .byte      13
      0093FB 20 63 6F 6D 70 69 6C  3513         .ascii     " compile only"
             65 20 6F 6E 6C 79
      009408 CC 85 53         [ 2] 3514         JP     EXECU
      00940B CD A4 2A         [ 4] 3515 INTE1:  CALL     NUMBQ   ;convert a number
      00940E CD 85 2C         [ 4] 3516         CALL     QBRAN
      009411 93 B7                 3517         .word    ABOR1
      009413 81               [ 4] 3518         RET
                                   3519 
                                   3520 ;       [       ( -- )
                                   3521 ;       Start  text interpreter.
      009414 93 D6                 3522         .word      LINK
                           001396  3523 LINK = . 
      009416 81                    3524 	.byte      IMEDD+1
      009417 5B                    3525         .ascii     "["
      009418                       3526 LBRAC:
      009418 CD 84 F9         [ 4] 3527         CALL   DOLIT
      00941B 93 E1                 3528         .word  INTER
      00941D CD 87 3C         [ 4] 3529         CALL   TEVAL
      009420 CC 85 60         [ 2] 3530         JP     STORE
                                   3531 
                                   3532 ;       .OK     ( -- )
                                   3533 ;       Display 'ok' while interpreting.
      009423 94 16                 3534         .word      LINK
                           0013A5  3535 LINK = . 
      009425 03                    3536         .byte      3
      009426 2E 4F 4B              3537         .ascii     ".OK"
      009429                       3538 DOTOK:
      009429 CD 84 F9         [ 4] 3539         CALL     DOLIT
      00942C 93 E1                 3540         .word      INTER
      00942E CD 87 3C         [ 4] 3541         CALL     TEVAL
      009431 CD 85 77         [ 4] 3542         CALL     AT
      009434 CD 88 DB         [ 4] 3543         CALL     EQUAL
      009437 CD 85 2C         [ 4] 3544         CALL     QBRAN
      00943A 94 43                 3545         .word      DOTO1
      00943C CD 8F 72         [ 4] 3546         CALL     DOTQP
      00943F 03                    3547         .byte      3
      009440 20 6F 6B              3548         .ascii     " ok"
      009443 CC 8F 33         [ 2] 3549 DOTO1:  JP     CR
                                   3550 
                                   3551 ;       ?STACK  ( -- )
                                   3552 ;       Abort if stack underflows.
      009446 94 25                 3553         .word      LINK
                           0013C8  3554 LINK = . 
      009448 06                    3555         .byte      6
      009449 3F 53 54 41 43 4B     3556         .ascii     "?STACK"
      00944F                       3557 QSTAC: 
      00944F CD 8B E6         [ 4] 3558         CALL     DEPTH
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009452 CD 86 57         [ 4] 3559         CALL     ZLESS   ;check only for underflow
      009455 CD 93 AF         [ 4] 3560         CALL     ABORQ
      009458 0B                    3561         .byte      11
      009459 20 75 6E 64 65 72 66  3562         .ascii     " underflow "
             6C 6F 77 20
      009464 81               [ 4] 3563         RET
                                   3564 
                                   3565 ;       EVAL    ( -- )
                                   3566 ;       Interpret  input stream.
      009465 94 48                 3567         .word      LINK
                           0013E7  3568 LINK = . 
      009467 04                    3569         .byte      4
      009468 45 56 41 4C           3570         .ascii     "EVAL"
      00946C                       3571 EVAL:
      00946C CD 91 A6         [ 4] 3572 EVAL1:  CALL     TOKEN
      00946F CD 86 1E         [ 4] 3573         CALL     DUPP
      009472 CD 85 95         [ 4] 3574         CALL     CAT     ;?input stream empty
      009475 CD 85 2C         [ 4] 3575         CALL     QBRAN
      009478 94 88                 3576         .word    EVAL2
      00947A CD 87 3C         [ 4] 3577         CALL     TEVAL
      00947D CD 8C C8         [ 4] 3578         CALL     ATEXE
      009480 CD 94 4F         [ 4] 3579         CALL     QSTAC   ;evaluate input, check stack
      009483 CD 85 43         [ 4] 3580         CALL     BRAN
      009486 94 6C                 3581         .word    EVAL1
      009488 CD 86 14         [ 4] 3582 EVAL2:  CALL     DROP
      00948B CC 94 29         [ 2] 3583         JP       DOTOK
                                   3584 
                                   3585 ;       PRESET  ( -- )
                                   3586 ;       Reset data stack pointer and
                                   3587 ;       terminal input buffer.
      00948E 94 67                 3588         .word      LINK
                           001410  3589 LINK = . 
      009490 06                    3590         .byte      6
      009491 50 52 45 53 45 54     3591         .ascii     "PRESET"
      009497                       3592 PRESE:
      009497 CD 84 F9         [ 4] 3593         CALL     DOLIT
      00949A 16 80                 3594         .word      SPP
      00949C CD 86 0B         [ 4] 3595         CALL     SPSTO
      00949F CD 84 F9         [ 4] 3596         CALL     DOLIT
      0094A2 17 00                 3597         .word      TIBB
      0094A4 CD 87 09         [ 4] 3598         CALL     NTIB
      0094A7 CD 8B 0D         [ 4] 3599         CALL     CELLP
      0094AA CC 85 60         [ 2] 3600         JP     STORE
                                   3601 
                                   3602 ;       QUIT    ( -- )
                                   3603 ;       Reset return stack pointer
                                   3604 ;       and start text interpreter.
      0094AD 94 90                 3605         .word      LINK
                           00142F  3606 LINK = . 
      0094AF 04                    3607         .byte      4
      0094B0 51 55 49 54           3608         .ascii     "QUIT"
      0094B4                       3609 QUIT:
      0094B4 CD 84 F9         [ 4] 3610         CALL     DOLIT
      0094B7 17 FF                 3611         .word      RPP
      0094B9 CD 85 B2         [ 4] 3612         CALL     RPSTO   ;reset return stack pointer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0094BC CD 94 18         [ 4] 3613 QUIT1:  CALL     LBRAC   ;start interpretation
      0094BF CD 93 7B         [ 4] 3614 QUIT2:  CALL     QUERY   ;get input
      0094C2 CD 94 6C         [ 4] 3615         CALL     EVAL
      0094C5 20 F8            [ 2] 3616         JRA     QUIT2   ;continue till error
                                   3617 
                                   3618 ;; The compiler
                                   3619 
                                   3620 ;       '       ( -- ca )
                                   3621 ;       Search vocabularies for
                                   3622 ;       next word in input stream.
      0094C7 94 AF                 3623         .word      LINK
                           001449  3624 LINK = . 
      0094C9 01                    3625         .byte      1
      0094CA 27                    3626         .ascii     "'"
      0094CB                       3627 TICK:
      0094CB CD 91 A6         [ 4] 3628         CALL     TOKEN
      0094CE CD 92 A3         [ 4] 3629         CALL     NAMEQ   ;?defined
      0094D1 CD 85 2C         [ 4] 3630         CALL     QBRAN
      0094D4 93 B7                 3631         .word      ABOR1
      0094D6 81               [ 4] 3632         RET     ;yes, push code address
                                   3633 
                                   3634 ;       ALLOT   ( n -- )
                                   3635 ;       Allocate n bytes to RAM 
      0094D7 94 C9                 3636         .word      LINK
                           001459  3637         LINK = . 
      0094D9 05                    3638         .byte      5
      0094DA 41 4C 4C 4F 54        3639         .ascii     "ALLOT"
      0094DF                       3640 ALLOT:
      0094DF CD 87 6C         [ 4] 3641         CALL     VPP
                                   3642 ; must update APP_VP each time VP is modidied
      0094E2 CD 8C 14         [ 4] 3643         call PSTOR 
      0094E5 CC 9C 28         [ 2] 3644         jp UPDATVP 
                                   3645 
                                   3646 ;       ,       ( w -- )
                                   3647 ;         Compile an integer into
                                   3648 ;         variable space.
      0094E8 94 D9                 3649         .word      LINK
                           00146A  3650 LINK = . 
      0094EA 01                    3651         .byte      1
      0094EB 2C                    3652         .ascii     ","
      0094EC                       3653 COMMA:
      0094EC CD 8C 92         [ 4] 3654         CALL     HERE
      0094EF CD 86 1E         [ 4] 3655         CALL     DUPP
      0094F2 CD 8B 0D         [ 4] 3656         CALL     CELLP   ;cell boundary
      0094F5 CD 87 6C         [ 4] 3657         CALL     VPP
      0094F8 CD 85 60         [ 4] 3658         CALL     STORE
      0094FB CC 85 60         [ 2] 3659         JP     STORE
                                   3660 
                                   3661 ;       C,      ( c -- )
                                   3662 ;       Compile a byte into
                                   3663 ;       variables space.
      0094FE 94 EA                 3664        .word      LINK
                           001480  3665 LINK = . 
      009500 02                    3666         .byte      2
      009501 43 2C                 3667         .ascii     "C,"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      009503                       3668 CCOMMA:
      009503 CD 8C 92         [ 4] 3669         CALL     HERE
      009506 CD 86 1E         [ 4] 3670         CALL     DUPP
      009509 CD 8B 38         [ 4] 3671         CALL     ONEP
      00950C CD 87 6C         [ 4] 3672         CALL     VPP
      00950F CD 85 60         [ 4] 3673         CALL     STORE
      009512 CC 85 84         [ 2] 3674         JP     CSTOR
                                   3675 
                                   3676 ;       [COMPILE]       ( -- ; <string> )
                                   3677 ;       Compile next immediate
                                   3678 ;       word into code dictionary.
      009515 95 00                 3679         .word      LINK
                           001497  3680 LINK = . 
      009517 89                    3681 	.byte      IMEDD+9
      009518 5B 43 4F 4D 50 49 4C  3682         .ascii     "[COMPILE]"
             45 5D
      009521                       3683 BCOMP:
      009521 CD 94 CB         [ 4] 3684         CALL     TICK
      009524 CC 97 E7         [ 2] 3685         JP     JSRC
                                   3686 
                                   3687 ;       COMPILE ( -- )
                                   3688 ;       Compile next jsr in
                                   3689 ;       colon list to code dictionary.
      009527 95 17                 3690         .word      LINK
                           0014A9  3691 LINK = . 
      009529 47                    3692 	.byte      COMPO+7
      00952A 43 4F 4D 50 49 4C 45  3693         .ascii     "COMPILE"
      009531                       3694 COMPI:
      009531 CD 85 C8         [ 4] 3695         CALL     RFROM
      009534 CD 86 1E         [ 4] 3696         CALL     DUPP
      009537 CD 85 77         [ 4] 3697         CALL     AT
      00953A CD 97 E7         [ 4] 3698         CALL     JSRC    ;compile subroutine
      00953D CD 8B 0D         [ 4] 3699         CALL     CELLP
      009540 90 93            [ 1] 3700         ldw y,x 
      009542 90 FE            [ 2] 3701         ldw y,(y)
      009544 1C 00 02         [ 2] 3702         addw x,#CELLL 
      009547 90 FC            [ 2] 3703         jp (y)
                                   3704 
                                   3705 ;       LITERAL ( w -- )
                                   3706 ;       Compile tos to dictionary
                                   3707 ;       as an integer literal.
      009549 95 29                 3708         .word      LINK
                           0014CB  3709 LINK = . 
      00954B 87                    3710 	.byte      IMEDD+7
      00954C 4C 49 54 45 52 41 4C  3711         .ascii     "LITERAL"
      009553                       3712 LITER:
      009553 CD 95 31         [ 4] 3713         CALL     COMPI
      009556 84 F9                 3714         .word DOLIT 
      009558 CC 94 EC         [ 2] 3715         JP     COMMA
                                   3716 
                                   3717 ;       $,"     ( -- )
                                   3718 ;       Compile a literal string
                                   3719 ;       up to next " .
      00955B 95 4B                 3720         .word      LINK
                           0014DD  3721 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      00955D 03                    3722         .byte      3
      00955E 24 2C 22              3723         .byte     '$',',','"'
      009561                       3724 STRCQ:
      009561 CD 84 F9         [ 4] 3725         CALL     DOLIT
      009564 00 22                 3726         .word     34	; "
      009566 CD 90 E6         [ 4] 3727         CALL     PARSE
      009569 CD 8C 92         [ 4] 3728         CALL     HERE
      00956C CD 8D 52         [ 4] 3729         CALL     PACKS   ;string to code dictionary
      00956F CD 8C 7B         [ 4] 3730         CALL     COUNT
      009572 CD 88 3A         [ 4] 3731         CALL     PLUS    ;calculate aligned end of string
      009575 CD 87 6C         [ 4] 3732         CALL     VPP
      009578 CC 85 60         [ 2] 3733         JP     STORE
                                   3734 
                                   3735 ;; Structures
                                   3736 
                                   3737 ;       FOR     ( -- a )
                                   3738 ;       Start a FOR-NEXT loop
                                   3739 ;       structure in a colon definition.
      00957B 95 5D                 3740         .word      LINK
                           0014FD  3741 LINK = . 
      00957D 83                    3742 	.byte      IMEDD+3
      00957E 46 4F 52              3743         .ascii     "FOR"
      009581                       3744 FOR:
      009581 CD 95 31         [ 4] 3745         CALL     COMPI
      009584 85 E7                 3746         .word TOR 
      009586 CC 8C 92         [ 2] 3747         JP     HERE
                                   3748 
                                   3749 ;       NEXT    ( a -- )
                                   3750 ;       Terminate a FOR-NEXT loop.
      009589 95 7D                 3751         .word      LINK
                           00150B  3752 LINK = . 
      00958B 84                    3753 	.byte      IMEDD+4
      00958C 4E 45 58 54           3754         .ascii     "NEXT"
      009590                       3755 NEXT:
      009590 CD 95 31         [ 4] 3756         CALL     COMPI
      009593 85 0D                 3757         .word DONXT 
      009595 CD 87 B8         [ 4] 3758         call ADRADJ
      009598 CC 94 EC         [ 2] 3759         JP     COMMA
                                   3760 
                                   3761 ;       I ( -- n )
                                   3762 ;       stack FOR-NEXT COUNTER 
      00959B 95 8B                 3763         .word LINK 
                           00151D  3764         LINK=.
      00959D 01                    3765         .byte 1 
      00959E 49                    3766         .ascii "I"
      00959F                       3767 IFETCH: 
      00959F 1D 00 02         [ 2] 3768         subw x,#CELLL 
      0095A2 16 03            [ 2] 3769         ldw y,(3,sp)
      0095A4 FF               [ 2] 3770         ldw (x),y 
      0095A5 81               [ 4] 3771         ret 
                                   3772 
                                   3773 ;       BEGIN   ( -- a )
                                   3774 ;       Start an infinite or
                                   3775 ;       indefinite loop structure.
      0095A6 95 9D                 3776         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                           001528  3777 LINK = . 
      0095A8 85                    3778 	.byte      IMEDD+5
      0095A9 42 45 47 49 4E        3779         .ascii     "BEGIN"
      0095AE                       3780 BEGIN:
      0095AE CC 8C 92         [ 2] 3781         JP     HERE
                                   3782 
                                   3783 ;       UNTIL   ( a -- )
                                   3784 ;       Terminate a BEGIN-UNTIL
                                   3785 ;       indefinite loop structure.
      0095B1 95 A8                 3786         .word      LINK
                           001533  3787 LINK = . 
      0095B3 85                    3788 	.byte      IMEDD+5
      0095B4 55 4E 54 49 4C        3789         .ascii     "UNTIL"
      0095B9                       3790 UNTIL:
      0095B9 CD 95 31         [ 4] 3791         CALL     COMPI
      0095BC 85 2C                 3792         .word    QBRAN 
      0095BE CD 87 B8         [ 4] 3793         call ADRADJ
      0095C1 CC 94 EC         [ 2] 3794         JP     COMMA
                                   3795 
                                   3796 ;       AGAIN   ( a -- )
                                   3797 ;       Terminate a BEGIN-AGAIN
                                   3798 ;       infinite loop structure.
      0095C4 95 B3                 3799         .word      LINK
                           001546  3800 LINK = . 
      0095C6 85                    3801 	.byte      IMEDD+5
      0095C7 41 47 41 49 4E        3802         .ascii     "AGAIN"
      0095CC                       3803 AGAIN:
      0095CC CD 95 31         [ 4] 3804         CALL     COMPI
      0095CF 85 43                 3805         .word BRAN
      0095D1 CD 87 B8         [ 4] 3806         call ADRADJ 
      0095D4 CC 94 EC         [ 2] 3807         JP     COMMA
                                   3808 
                                   3809 ;       IF      ( -- A )
                                   3810 ;       Begin a conditional branch.
      0095D7 95 C6                 3811         .word      LINK
                           001559  3812 LINK = . 
      0095D9 82                    3813 	.byte      IMEDD+2
      0095DA 49 46                 3814         .ascii     "IF"
      0095DC                       3815 IFF:
      0095DC CD 95 31         [ 4] 3816         CALL     COMPI
      0095DF 85 2C                 3817         .word QBRAN
      0095E1 CD 8C 92         [ 4] 3818         CALL     HERE
      0095E4 CD 8B A4         [ 4] 3819         CALL     ZERO
      0095E7 CC 94 EC         [ 2] 3820         JP     COMMA
                                   3821 
                                   3822 ;       THEN        ( A -- )
                                   3823 ;       Terminate a conditional branch structure.
      0095EA 95 D9                 3824         .word      LINK
                           00156C  3825 LINK = . 
      0095EC 84                    3826 	.byte      IMEDD+4
      0095ED 54 48 45 4E           3827         .ascii     "THEN"
      0095F1                       3828 THENN:
      0095F1 CD 8C 92         [ 4] 3829         CALL     HERE
      0095F4 CD 87 B8         [ 4] 3830         call ADRADJ 
      0095F7 CD 86 2E         [ 4] 3831         CALL     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0095FA CC 85 60         [ 2] 3832         JP     STORE
                                   3833 
                                   3834 ;       ELSE        ( A -- A )
                                   3835 ;       Start the false clause in an IF-ELSE-THEN structure.
      0095FD 95 EC                 3836         .word      LINK
                           00157F  3837 LINK = . 
      0095FF 84                    3838 	.byte      IMEDD+4
      009600 45 4C 53 45           3839         .ascii     "ELSE"
      009604                       3840 ELSEE:
      009604 CD 95 31         [ 4] 3841         CALL     COMPI
      009607 85 43                 3842         .word BRAN
      009609 CD 8C 92         [ 4] 3843         CALL     HERE
      00960C CD 8B A4         [ 4] 3844         CALL     ZERO
      00960F CD 94 EC         [ 4] 3845         CALL     COMMA
      009612 CD 86 2E         [ 4] 3846         CALL     SWAPP
      009615 CD 8C 92         [ 4] 3847         CALL     HERE
      009618 CD 87 B8         [ 4] 3848         call ADRADJ 
      00961B CD 86 2E         [ 4] 3849         CALL     SWAPP
      00961E CC 85 60         [ 2] 3850         JP     STORE
                                   3851 
                                   3852 ;       AHEAD       ( -- A )
                                   3853 ;       Compile a forward branch instruction.
      009621 95 FF                 3854         .word      LINK
                           0015A3  3855 LINK = . 
      009623 85                    3856 	.byte      IMEDD+5
      009624 41 48 45 41 44        3857         .ascii     "AHEAD"
      009629                       3858 AHEAD:
      009629 CD 95 31         [ 4] 3859         CALL     COMPI
      00962C 85 43                 3860         .word BRAN
      00962E CD 8C 92         [ 4] 3861         CALL     HERE
      009631 CD 8B A4         [ 4] 3862         CALL     ZERO
      009634 CC 94 EC         [ 2] 3863         JP     COMMA
                                   3864 
                                   3865 ;       WHILE       ( a -- A a )
                                   3866 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      009637 96 23                 3867         .word      LINK
                           0015B9  3868 LINK = . 
      009639 85                    3869 	.byte      IMEDD+5
      00963A 57 48 49 4C 45        3870         .ascii     "WHILE"
      00963F                       3871 WHILE:
      00963F CD 95 31         [ 4] 3872         CALL     COMPI
      009642 85 2C                 3873         .word QBRAN
      009644 CD 8C 92         [ 4] 3874         CALL     HERE
      009647 CD 8B A4         [ 4] 3875         CALL     ZERO
      00964A CD 94 EC         [ 4] 3876         CALL     COMMA
      00964D CC 86 2E         [ 2] 3877         JP     SWAPP
                                   3878 
                                   3879 ;       REPEAT      ( A a -- )
                                   3880 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      009650 96 39                 3881         .word      LINK
                           0015D2  3882 LINK = . 
      009652 86                    3883         .byte      IMEDD+6
      009653 52 45 50 45 41 54     3884         .ascii     "REPEAT"
      009659                       3885 REPEA:
      009659 CD 95 31         [ 4] 3886         CALL     COMPI
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      00965C 85 43                 3887         .word BRAN
      00965E CD 87 B8         [ 4] 3888         call ADRADJ 
      009661 CD 94 EC         [ 4] 3889         CALL     COMMA
      009664 CD 8C 92         [ 4] 3890         CALL     HERE
      009667 CD 87 B8         [ 4] 3891         call ADRADJ 
      00966A CD 86 2E         [ 4] 3892         CALL     SWAPP
      00966D CC 85 60         [ 2] 3893         JP     STORE
                                   3894 
                                   3895 ;       AFT         ( a -- a A )
                                   3896 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      009670 96 52                 3897         .word      LINK
                           0015F2  3898 LINK = . 
      009672 83                    3899 	.byte      IMEDD+3
      009673 41 46 54              3900         .ascii     "AFT"
      009676                       3901 AFT:
      009676 CD 86 14         [ 4] 3902         CALL     DROP
      009679 CD 96 29         [ 4] 3903         CALL     AHEAD
      00967C CD 8C 92         [ 4] 3904         CALL     HERE
      00967F CC 86 2E         [ 2] 3905         JP     SWAPP
                                   3906 
                                   3907 ;       ABORT"      ( -- ; <string> )
                                   3908 ;       Conditional abort with an error message.
      009682 96 72                 3909         .word      LINK
                           001604  3910 LINK = . 
      009684 86                    3911 	.byte      IMEDD+6
      009685 41 42 4F 52 54        3912         .ascii     "ABORT"
      00968A 22                    3913         .byte      '"'
      00968B                       3914 ABRTQ:
      00968B CD 95 31         [ 4] 3915         CALL     COMPI
      00968E 93 AF                 3916         .word ABORQ
      009690 CC 95 61         [ 2] 3917         JP     STRCQ
                                   3918 
                                   3919 ;       $"     ( -- ; <string> )
                                   3920 ;       Compile an inline string literal.
      009693 96 84                 3921         .word      LINK
                           001615  3922 LINK = . 
      009695 82                    3923 	.byte      IMEDD+2
      009696 24 22                 3924         .byte     '$','"'
      009698                       3925 STRQ:
      009698 CD 95 31         [ 4] 3926         CALL     COMPI
      00969B 8F 68                 3927         .word STRQP 
      00969D CC 95 61         [ 2] 3928         JP     STRCQ
                                   3929 
                                   3930 ;       ."          ( -- ; <string> )
                                   3931 ;       Compile an inline string literal to be typed out at run time.
      0096A0 96 95                 3932         .word      LINK
                           001622  3933 LINK = . 
      0096A2 82                    3934 	.byte      IMEDD+2
      0096A3 2E 22                 3935         .byte     '.','"'
      0096A5                       3936 DOTQ:
      0096A5 CD 95 31         [ 4] 3937         CALL     COMPI
      0096A8 8F 72                 3938         .word DOTQP 
      0096AA CC 95 61         [ 2] 3939         JP     STRCQ
                                   3940 
                                   3941 ;; Name compiler
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



                                   3942 
                                   3943 ;       ?UNIQUE ( a -- a )
                                   3944 ;       Display a warning message
                                   3945 ;       if word already exists.
      0096AD 96 A2                 3946         .word      LINK
                           00162F  3947 LINK = . 
      0096AF 07                    3948         .byte      7
      0096B0 3F 55 4E 49 51 55 45  3949         .ascii     "?UNIQUE"
      0096B7                       3950 UNIQU:
      0096B7 CD 86 1E         [ 4] 3951         CALL     DUPP
      0096BA CD 92 A3         [ 4] 3952         CALL     NAMEQ   ;?name exists
      0096BD CD 85 2C         [ 4] 3953         CALL     QBRAN
      0096C0 96 D6                 3954         .word      UNIQ1
      0096C2 CD 8F 72         [ 4] 3955         CALL     DOTQP   ;redef are OK
      0096C5 07                    3956         .byte       7
      0096C6 20 72 65 44 65 66 20  3957         .ascii     " reDef "       
      0096CD CD 86 48         [ 4] 3958         CALL     OVER
      0096D0 CD 8C 7B         [ 4] 3959         CALL     COUNT
      0096D3 CD 8F 15         [ 4] 3960         CALL     TYPES   ;just in case
      0096D6 CC 86 14         [ 2] 3961 UNIQ1:  JP     DROP
                                   3962 
                                   3963 ;       $,n     ( na -- )
                                   3964 ;       Build a new dictionary name
                                   3965 ;       using string at na.
                                   3966 ; compile dans l'espace des variables 
      0096D9 96 AF                 3967         .word      LINK
                           00165B  3968 LINK = . 
      0096DB 03                    3969         .byte      3
      0096DC 24 2C 6E              3970         .ascii     "$,n"
      0096DF                       3971 SNAME:
      0096DF CD 86 1E         [ 4] 3972         CALL     DUPP
      0096E2 CD 85 95         [ 4] 3973         CALL     CAT     ;?null input
      0096E5 CD 85 2C         [ 4] 3974         CALL     QBRAN
      0096E8 97 15                 3975         .word      PNAM1
      0096EA CD 96 B7         [ 4] 3976         CALL     UNIQU   ;?redefinition
      0096ED CD 86 1E         [ 4] 3977         CALL     DUPP
      0096F0 CD 8C 7B         [ 4] 3978         CALL     COUNT
      0096F3 CD 88 3A         [ 4] 3979         CALL     PLUS
      0096F6 CD 87 6C         [ 4] 3980         CALL     VPP
      0096F9 CD 85 60         [ 4] 3981         CALL     STORE
      0096FC CD 86 1E         [ 4] 3982         CALL     DUPP
      0096FF CD 87 8A         [ 4] 3983         CALL     LAST
      009702 CD 85 60         [ 4] 3984         CALL     STORE   ;save na for vocabulary link
      009705 CD 8B 1C         [ 4] 3985         CALL     CELLM   ;link address
      009708 CD 87 5E         [ 4] 3986         CALL     CNTXT
      00970B CD 85 77         [ 4] 3987         CALL     AT
      00970E CD 86 2E         [ 4] 3988         CALL     SWAPP
      009711 CD 85 60         [ 4] 3989         CALL     STORE
      009714 81               [ 4] 3990         RET     ;save code pointer
      009715 CD 8F 68         [ 4] 3991 PNAM1:  CALL     STRQP
      009718 05                    3992         .byte      5
      009719 20 6E 61 6D 65        3993         .ascii     " name" ;null input
      00971E CC 93 B7         [ 2] 3994         JP     ABOR1
                                   3995 
                                   3996 ;; FORTH compiler
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



                                   3997 
                                   3998 ;       $COMPILE        ( a -- )
                                   3999 ;       Compile next word to
                                   4000 ;       dictionary as a token or literal.
      009721 96 DB                 4001         .word      LINK
                           0016A3  4002 LINK = . 
      009723 08                    4003         .byte      8
      009724 24 43 4F 4D 50 49 4C  4004         .ascii     "$COMPILE"
             45
      00972C                       4005 SCOMP:
      00972C CD 92 A3         [ 4] 4006         CALL     NAMEQ
      00972F CD 87 C8         [ 4] 4007         CALL     QDUP    ;?defined
      009732 CD 85 2C         [ 4] 4008         CALL     QBRAN
      009735 97 4D                 4009         .word      SCOM2
      009737 CD 85 77         [ 4] 4010         CALL     AT
      00973A CD 84 F9         [ 4] 4011         CALL     DOLIT
      00973D 80 00                 4012         .word     0x8000	;  IMEDD*256
      00973F CD 86 6A         [ 4] 4013         CALL     ANDD    ;?immediate
      009742 CD 85 2C         [ 4] 4014         CALL     QBRAN
      009745 97 4A                 4015         .word      SCOM1
      009747 CC 85 53         [ 2] 4016         JP     EXECU
      00974A CC 97 E7         [ 2] 4017 SCOM1:  JP     JSRC
      00974D CD A4 2A         [ 4] 4018 SCOM2:  CALL     NUMBQ   ;try to convert to number
      009750 CD 85 2C         [ 4] 4019         CALL     QBRAN
      009753 93 B7                 4020         .word      ABOR1
      009755 CC 95 53         [ 2] 4021         JP     LITER
                                   4022 
                                   4023 ;       OVERT   ( -- )
                                   4024 ;       Link a new word into vocabulary.
      009758 97 23                 4025         .word      LINK
                           0016DA  4026 LINK = . 
      00975A 05                    4027         .byte      5
      00975B 4F 56 45 52 54        4028         .ascii     "OVERT"
      009760                       4029 OVERT:
      009760 CD 87 8A         [ 4] 4030         CALL     LAST
      009763 CD 85 77         [ 4] 4031         CALL     AT
      009766 CD 87 5E         [ 4] 4032         CALL     CNTXT
      009769 CC 85 60         [ 2] 4033         JP     STORE
                                   4034 
                                   4035 ;       ;       ( -- )
                                   4036 ;       Terminate a colon definition.
      00976C 97 5A                 4037         .word      LINK
                           0016EE  4038 LINK = . 
      00976E C1                    4039 	.byte      IMEDD+COMPO+1
      00976F 3B                    4040         .ascii     ";"
      009770                       4041 SEMIS:
                           000001  4042 .if OPTIMIZE ; more compact and faster
      009770 CD 84 F9         [ 4] 4043         call DOLIT 
      009773 00 81                 4044         .word 0x81   ; opcode for RET 
      009775 CD 95 03         [ 4] 4045         call CCOMMA 
                           000000  4046 .else
                                   4047         CALL     COMPI
                                   4048         .word EXIT 
                                   4049 .endif 
      009778 CD 94 18         [ 4] 4050         CALL     LBRAC
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      00977B CD 97 60         [ 4] 4051         call OVERT 
      00977E CD A1 80         [ 4] 4052         CALL FMOVE
      009781 CD 87 C8         [ 4] 4053         call QDUP 
      009784 CD 85 2C         [ 4] 4054         call QBRAN 
      009787 98 B7                 4055         .word SET_RAMLAST 
      009789 CD A2 14         [ 4] 4056         CALL UPDATPTR
      00978C 81               [ 4] 4057         RET 
                                   4058 
                                   4059 
                                   4060 ;       Terminate an ISR definition 
                                   4061 ;       retourn ca of ISR as double
                                   4062 ;       I; ( -- ud )
      00978D 97 6E                 4063         .word LINK 
                           00170F  4064         LINK=.
      00978F C2                    4065         .byte 2+IMEDD+COMPO 
      009790 49 3B                 4066         .ascii "I;" 
      009792                       4067 ISEMI:
      009792 1D 00 02         [ 2] 4068         subw x,#CELLL  
      009795 90 AE 00 80      [ 2] 4069         ldw y,#IRET_CODE 
      009799 FF               [ 2] 4070         ldw (x),y 
      00979A CD 95 03         [ 4] 4071         call CCOMMA
      00979D CD 94 18         [ 4] 4072         call LBRAC 
      0097A0 CD A2 59         [ 4] 4073         call IFMOVE
      0097A3 CD 87 C8         [ 4] 4074         call QDUP 
      0097A6 CD 85 2C         [ 4] 4075         CALL QBRAN 
      0097A9 98 B7                 4076         .word SET_RAMLAST
      0097AB CD 87 7A         [ 4] 4077         CALL CPP
      0097AE CD 85 77         [ 4] 4078         call AT 
      0097B1 CD 86 2E         [ 4] 4079         call SWAPP 
      0097B4 CD 87 7A         [ 4] 4080         CALL CPP 
      0097B7 CD 85 60         [ 4] 4081         call STORE 
      0097BA CD 9C 11         [ 4] 4082         call UPDATCP 
      0097BD CD 9B CE         [ 4] 4083         call EEPVP 
      0097C0 CD 86 14         [ 4] 4084         call DROP 
      0097C3 CD 85 77         [ 4] 4085         call AT 
      0097C6 CD 87 6C         [ 4] 4086         call VPP 
      0097C9 CD 85 60         [ 4] 4087         call STORE 
      0097CC CC 8B A4         [ 2] 4088         jp ZERO
      0097CF 81               [ 4] 4089         ret           
                                   4090         
                                   4091 
                                   4092 ;       ]       ( -- )
                                   4093 ;       Start compiling words in
                                   4094 ;       input stream.
      0097D0 97 8F                 4095         .word      LINK
                           001752  4096 LINK = . 
      0097D2 01                    4097         .byte      1
      0097D3 5D                    4098         .ascii     "]"
      0097D4                       4099 RBRAC:
      0097D4 CD 84 F9         [ 4] 4100         CALL   DOLIT
      0097D7 97 2C                 4101         .word  SCOMP
      0097D9 CD 87 3C         [ 4] 4102         CALL   TEVAL
      0097DC CC 85 60         [ 2] 4103         JP     STORE
                                   4104 
                                   4105 ;       CALL,    ( ca -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                                   4106 ;       Compile a subroutine call.
      0097DF 97 D2                 4107         .word      LINK
                           001761  4108 LINK = . 
      0097E1 05                    4109         .byte      5
      0097E2 43 41 4C 4C 2C        4110         .ascii     "CALL,"
      0097E7                       4111 JSRC:
      0097E7 CD 84 F9         [ 4] 4112         CALL     DOLIT
      0097EA 00 CD                 4113         .word     CALLL     ;CALL
      0097EC CD 95 03         [ 4] 4114         CALL     CCOMMA
      0097EF CC 94 EC         [ 2] 4115         JP     COMMA
                                   4116 
                                   4117 ;       INIT-OFS ( -- )
                                   4118 ;       compute offset to adjust jump address 
                                   4119 ;       set variable OFFSET 
      0097F2 97 E1                 4120         .word LINK 
                           001774  4121         LINK=.
      0097F4 08                    4122         .byte 8 
      0097F5 49 4E 49 54 2D 4F 46  4123         .ascii "INIT-OFS" 
             53
      0097FD                       4124 INITOFS:
      0097FD CD 87 2B         [ 4] 4125         call TFLASH 
      009800 CD 85 77         [ 4] 4126         CALL AT 
      009803 CD 86 1E         [ 4] 4127         CALL DUPP 
      009806 CD 85 2C         [ 4] 4128         call QBRAN
      009809 98 1A                 4129         .word 1$
      00980B CD 86 14         [ 4] 4130         call DROP  
      00980E CD 87 7A         [ 4] 4131         call CPP 
      009811 CD 85 77         [ 4] 4132         call AT 
      009814 CD 8C 92         [ 4] 4133         call HERE
      009817 CD 88 B3         [ 4] 4134         call SUBB 
      00981A CD 87 AF         [ 4] 4135 1$:     call OFFSET 
      00981D CC 85 60         [ 2] 4136         jp STORE  
                                   4137 
                                   4138 ;       :       ( -- ; <string> )
                                   4139 ;       Start a new colon definition
                                   4140 ;       using next word as its name.
      009820 97 F4                 4141         .word      LINK
                           0017A2  4142 LINK = . 
      009822 01                    4143         .byte      1
      009823 3A                    4144         .ascii     ":"
      009824                       4145 COLON:
      009824 CD 97 FD         [ 4] 4146         call INITOFS       
      009827 CD 91 A6         [ 4] 4147         CALL   TOKEN
      00982A CD 96 DF         [ 4] 4148         CALL   SNAME
      00982D CC 97 D4         [ 2] 4149         JP     RBRAC
                                   4150 
                                   4151 ;       I:  ( -- )
                                   4152 ;       Start interrupt service routine definition
                                   4153 ;       those definition have no name.
      009830 98 22                 4154         .word LINK
                           0017B2  4155         LINK=.
      009832 02                    4156         .byte 2 
      009833 49 3A                 4157         .ascii "I:" 
      009835                       4158 ICOLON:
      009835 CD 97 FD         [ 4] 4159         call INITOFS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      009838 CC 97 D4         [ 2] 4160         jp RBRAC  
                                   4161 
                                   4162 ;       IMMEDIATE       ( -- )
                                   4163 ;       Make last compiled word
                                   4164 ;       an immediate word.
      00983B 98 32                 4165         .word      LINK
                           0017BD  4166 LINK = . 
      00983D 09                    4167         .byte      9
      00983E 49 4D 4D 45 44 49 41  4168         .ascii     "IMMEDIATE"
             54 45
      009847                       4169 IMMED:
      009847 CD 84 F9         [ 4] 4170         CALL     DOLIT
      00984A 80 00                 4171         .word     0x8000	;  IMEDD*256
      00984C CD 87 8A         [ 4] 4172         CALL     LAST
      00984F CD 85 77         [ 4] 4173         CALL     AT
      009852 CD 85 77         [ 4] 4174         CALL     AT
      009855 CD 86 7E         [ 4] 4175         CALL     ORR
      009858 CD 87 8A         [ 4] 4176         CALL     LAST
      00985B CD 85 77         [ 4] 4177         CALL     AT
      00985E CC 85 60         [ 2] 4178         JP     STORE
                                   4179 
                                   4180 ;; Defining words
                                   4181 
                                   4182 ;       CREATE  ( -- ; <string> )
                                   4183 ;       Compile a new array
                                   4184 ;       without allocating space.
      009861 98 3D                 4185         .word      LINK
                           0017E3  4186 LINK = . 
      009863 06                    4187         .byte      6
      009864 43 52 45 41 54 45     4188         .ascii     "CREATE"
      00986A                       4189 CREAT:
      00986A CD 91 A6         [ 4] 4190         CALL     TOKEN
      00986D CD 96 DF         [ 4] 4191         CALL     SNAME
      009870 CD 97 60         [ 4] 4192         CALL     OVERT        
      009873 CD 95 31         [ 4] 4193         CALL     COMPI 
      009876 86 CB                 4194         .word DOVAR 
      009878 81               [ 4] 4195         RET
                                   4196 
                                   4197 ;       VARIABLE        ( -- ; <string> )
                                   4198 ;       Compile a new variable
                                   4199 ;       initialized to 0.
      009879 98 63                 4200         .word      LINK
                           0017FB  4201 LINK = . 
      00987B 08                    4202         .byte      8
      00987C 56 41 52 49 41 42 4C  4203         .ascii     "VARIABLE"
             45
      009884                       4204 VARIA:
                                   4205 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      009884 CD 8C 92         [ 4] 4206         CALL HERE
      009887 CD 86 1E         [ 4] 4207         CALL DUPP 
      00988A CD 8B 0D         [ 4] 4208         CALL CELLP
      00988D CD 87 6C         [ 4] 4209         CALL VPP 
      009890 CD 85 60         [ 4] 4210         CALL STORE
      009893 CD 98 6A         [ 4] 4211         CALL CREAT
      009896 CD 86 1E         [ 4] 4212         CALL DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      009899 CD 94 EC         [ 4] 4213         CALL COMMA
      00989C CD 8B A4         [ 4] 4214         CALL ZERO
      00989F CD 86 2E         [ 4] 4215         call SWAPP 
      0098A2 CD 85 60         [ 4] 4216         CALL STORE
      0098A5 CD A1 80         [ 4] 4217         CALL FMOVE ; move definition to FLASH
      0098A8 CD 87 C8         [ 4] 4218         CALL QDUP 
      0098AB CD 85 2C         [ 4] 4219         CALL QBRAN 
      0098AE 98 B7                 4220         .word SET_RAMLAST   
      0098B0 CD 9C 28         [ 4] 4221         call UPDATVP  ; don't update if variable kept in RAM.
      0098B3 CD A2 14         [ 4] 4222         CALL UPDATPTR
      0098B6 81               [ 4] 4223         RET         
      0098B7                       4224 SET_RAMLAST: 
      0098B7 CD 87 8A         [ 4] 4225         CALL LAST 
      0098BA CD 85 77         [ 4] 4226         CALL AT 
      0098BD CD 87 9D         [ 4] 4227         CALL RAMLAST 
      0098C0 CC 85 60         [ 2] 4228         jp STORE  
                                   4229 
                                   4230 
                                   4231 ;       CONSTANT  ( n -- ; <string> )
                                   4232 ;       Compile a new constant 
                                   4233 ;       n CONSTANT name 
      0098C3 98 7B                 4234         .word LINK 
                           001845  4235         LINK=. 
      0098C5 08                    4236         .byte 8 
      0098C6 43 4F 4E 53 54 41 4E  4237         .ascii "CONSTANT" 
             54
      0098CE                       4238 CONSTANT:          
      0098CE CD 91 A6         [ 4] 4239         CALL TOKEN
      0098D1 CD 96 DF         [ 4] 4240         CALL SNAME 
      0098D4 CD 97 60         [ 4] 4241         CALL OVERT 
      0098D7 CD 95 31         [ 4] 4242         CALL COMPI 
      0098DA 98 F8                 4243         .word DOCONST
      0098DC CD 94 EC         [ 4] 4244         CALL COMMA 
      0098DF CD A1 80         [ 4] 4245         CALL FMOVE
      0098E2 CD 87 C8         [ 4] 4246         CALL QDUP 
      0098E5 CD 85 2C         [ 4] 4247         CALL QBRAN 
      0098E8 98 B7                 4248         .word SET_RAMLAST  
      0098EA CD A2 14         [ 4] 4249         CALL UPDATPTR  
      0098ED 81               [ 4] 4250 1$:     RET          
                                   4251 
                                   4252 ; CONSTANT runtime semantic 
                                   4253 ; doCONST  ( -- n )
      0098EE 98 C5                 4254         .word LINK 
                           001870  4255         LINK=.
      0098F0 07                    4256         .byte 7
      0098F1 44 4F 43 4F 4E 53 54  4257         .ascii "DOCONST"
      0098F8                       4258 DOCONST:
      0098F8 1D 00 02         [ 2] 4259         subw x,#CELLL
      0098FB 90 85            [ 2] 4260         popw y 
      0098FD 90 FE            [ 2] 4261         ldw y,(y) 
      0098FF FF               [ 2] 4262         ldw (x),y 
      009900 81               [ 4] 4263         ret 
                                   4264 
                                   4265 ;----------------------------------
                                   4266 ; create double constant 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                   4267 ; DCONST ( d -- ; <string> )
                                   4268 ;----------------------------------
      009901 98 F0                 4269     .word LINK 
                           001883  4270     LINK=.
      009903 06                    4271     .byte 6 
      009904 44 43 4F 4E 53 54     4272     .ascii "DCONST"
      00990A                       4273 DCONST:
      00990A CD 91 A6         [ 4] 4274         CALL TOKEN
      00990D CD 96 DF         [ 4] 4275         CALL SNAME 
      009910 CD 97 60         [ 4] 4276         CALL OVERT 
      009913 CD 95 31         [ 4] 4277         CALL COMPI 
      009916 99 39                 4278         .word DO_DCONST
      009918 CD 94 EC         [ 4] 4279         CALL COMMA
      00991B CD 94 EC         [ 4] 4280         CALL COMMA  
      00991E CD A1 80         [ 4] 4281         CALL FMOVE
      009921 CD 87 C8         [ 4] 4282         CALL QDUP 
      009924 CD 85 2C         [ 4] 4283         CALL QBRAN 
      009927 98 B7                 4284         .word SET_RAMLAST  
      009929 CD A2 14         [ 4] 4285         CALL UPDATPTR  
      00992C 81               [ 4] 4286 1$:     RET          
                                   4287     
                                   4288 ;----------------------------------
                                   4289 ; runtime for DCONST 
                                   4290 ; stack double constant 
                                   4291 ; DO-DCONST ( -- d )
                                   4292 ;-----------------------------------
      00992D 99 03                 4293         .word LINK 
                           0018AF  4294         LINK=.
      00992F 09                    4295         .byte 9 
      009930 44 4F 2D 44 43 4F 4E  4296         .ascii "DO-DCONST"
             53 54
      009939                       4297 DO_DCONST:
      009939 90 85            [ 2] 4298     popw y 
      00993B 90 BF 28         [ 2] 4299     ldw YTEMP,y 
      00993E 1D 00 04         [ 2] 4300     subw x,#2*CELLL 
      009941 90 FE            [ 2] 4301     ldw y,(y)
      009943 FF               [ 2] 4302     ldw (x),y 
      009944 90 BE 28         [ 2] 4303     ldw y,YTEMP 
      009947 90 EE 02         [ 2] 4304     ldw y,(2,y)
      00994A EF 02            [ 2] 4305     ldw (2,x),y 
      00994C 81               [ 4] 4306     ret 
                                   4307 
                                   4308 ;; Tools
                                   4309 
                                   4310 ;       _TYPE   ( b u -- )
                                   4311 ;       Display a string. Filter
                                   4312 ;       non-printing characters.
      00994D 99 2F                 4313         .word      LINK
                           0018CF  4314 LINK = . 
      00994F 05                    4315         .byte      5
      009950 5F 54 59 50 45        4316         .ascii     "_TYPE"
      009955                       4317 UTYPE:
      009955 CD 85 E7         [ 4] 4318         CALL     TOR     ;start count down loop
      009958 20 0F            [ 2] 4319         JRA     UTYP2   ;skip first pass
      00995A CD 86 1E         [ 4] 4320 UTYP1:  CALL     DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      00995D CD 85 95         [ 4] 4321         CALL     CAT
      009960 CD 8B CE         [ 4] 4322         CALL     TCHAR
      009963 CD 84 B8         [ 4] 4323         CALL     EMIT    ;display only printable
      009966 CD 8B 38         [ 4] 4324         CALL     ONEP    ;increment address
      009969 CD 85 0D         [ 4] 4325 UTYP2:  CALL     DONXT
      00996C 99 5A                 4326         .word      UTYP1   ;loop till done
      00996E CC 86 14         [ 2] 4327         JP     DROP
                                   4328 
                                   4329 ;       dm+     ( a u -- a )
                                   4330 ;       Dump u bytes from ,
                                   4331 ;       leaving a+u on  stack.
      009971 99 4F                 4332         .word      LINK
                           0018F3  4333 LINK = . 
      009973 03                    4334         .byte      3
      009974 64 6D 2B              4335         .ascii     "dm+"
      009977                       4336 DUMPP:
      009977 CD 86 48         [ 4] 4337         CALL     OVER
      00997A CD 84 F9         [ 4] 4338         CALL     DOLIT
      00997D 00 04                 4339         .word      4
      00997F CD 8F 9B         [ 4] 4340         CALL     UDOTR   ;display address
      009982 CD 8E EB         [ 4] 4341         CALL     SPACE
      009985 CD 85 E7         [ 4] 4342         CALL     TOR     ;start count down loop
      009988 20 11            [ 2] 4343         JRA     PDUM2   ;skip first pass
      00998A CD 86 1E         [ 4] 4344 PDUM1:  CALL     DUPP
      00998D CD 85 95         [ 4] 4345         CALL     CAT
      009990 CD 84 F9         [ 4] 4346         CALL     DOLIT
      009993 00 03                 4347         .word      3
      009995 CD 8F 9B         [ 4] 4348         CALL     UDOTR   ;display numeric data
      009998 CD 8B 38         [ 4] 4349         CALL     ONEP    ;increment address
      00999B CD 85 0D         [ 4] 4350 PDUM2:  CALL     DONXT
      00999E 99 8A                 4351         .word      PDUM1   ;loop till done
      0099A0 81               [ 4] 4352         RET
                                   4353 
                                   4354 ;       DUMP    ( a u -- )
                                   4355 ;       Dump u bytes from a,
                                   4356 ;       in a formatted manner.
      0099A1 99 73                 4357         .word      LINK
                           001923  4358 LINK = . 
      0099A3 04                    4359         .byte      4
      0099A4 44 55 4D 50           4360         .ascii     "DUMP"
      0099A8                       4361 DUMP:
      0099A8 CD 86 DB         [ 4] 4362         CALL     BASE
      0099AB CD 85 77         [ 4] 4363         CALL     AT
      0099AE CD 85 E7         [ 4] 4364         CALL     TOR
      0099B1 CD 8E 4A         [ 4] 4365         CALL     HEX     ;save radix, set hex
      0099B4 CD 84 F9         [ 4] 4366         CALL     DOLIT
      0099B7 00 10                 4367         .word      16
      0099B9 CD 8A 5E         [ 4] 4368         CALL     SLASH   ;change count to lines
      0099BC CD 85 E7         [ 4] 4369         CALL     TOR     ;start count down loop
      0099BF CD 8F 33         [ 4] 4370 DUMP1:  CALL     CR
      0099C2 CD 84 F9         [ 4] 4371         CALL     DOLIT
      0099C5 00 10                 4372         .word      16
      0099C7 CD 88 25         [ 4] 4373         CALL     DDUP
      0099CA CD 99 77         [ 4] 4374         CALL     DUMPP   ;display numeric
      0099CD CD 87 D9         [ 4] 4375         CALL     ROT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      0099D0 CD 87 D9         [ 4] 4376         CALL     ROT
      0099D3 CD 8E EB         [ 4] 4377         CALL     SPACE
      0099D6 CD 8E EB         [ 4] 4378         CALL     SPACE
      0099D9 CD 99 55         [ 4] 4379         CALL     UTYPE   ;display printable characters
      0099DC CD 85 0D         [ 4] 4380         CALL     DONXT
      0099DF 99 BF                 4381         .word      DUMP1   ;loop till done
      0099E1 CD 86 14         [ 4] 4382 DUMP3:  CALL     DROP
      0099E4 CD 85 C8         [ 4] 4383         CALL     RFROM
      0099E7 CD 86 DB         [ 4] 4384         CALL     BASE
      0099EA CC 85 60         [ 2] 4385         JP     STORE   ;restore radix
                                   4386 
                                   4387 ;       .S      ( ... -- ... )
                                   4388 ;        Display  contents of stack.
      0099ED 99 A3                 4389         .word      LINK
                           00196F  4390 LINK = . 
      0099EF 02                    4391         .byte      2
      0099F0 2E 53                 4392         .ascii     ".S"
      0099F2                       4393 DOTS:
      0099F2 CD 8F 33         [ 4] 4394         CALL     CR
      0099F5 CD 8B E6         [ 4] 4395         CALL     DEPTH   ;stack depth
      0099F8 CD 85 E7         [ 4] 4396         CALL     TOR     ;start count down loop
      0099FB 20 09            [ 2] 4397         JRA     DOTS2   ;skip first pass
      0099FD CD 85 DB         [ 4] 4398 DOTS1:  CALL     RAT
      009A00 CD 8B FD         [ 4] 4399 	CALL     PICK
      009A03 CD 8F EC         [ 4] 4400         CALL     DOT     ;index stack, display contents
      009A06 CD 85 0D         [ 4] 4401 DOTS2:  CALL     DONXT
      009A09 99 FD                 4402         .word      DOTS1   ;loop till done
      009A0B CD 8F 72         [ 4] 4403         CALL     DOTQP
      009A0E 05                    4404         .byte      5
      009A0F 20 3C 73 70 20        4405         .ascii     " <sp "
      009A14 81               [ 4] 4406         RET
                                   4407 
                                   4408 ;       >NAME   ( ca -- na | F )
                                   4409 ;       Convert code address
                                   4410 ;       to a name address.
      009A15 99 EF                 4411         .word      LINK
                           001997  4412 LINK = . 
      009A17 05                    4413         .byte      5
      009A18 3E 4E 41 4D 45        4414         .ascii     ">NAME"
      009A1D                       4415 TNAME:
      009A1D CD 87 5E         [ 4] 4416         CALL     CNTXT   ;vocabulary link
      009A20 CD 85 77         [ 4] 4417 TNAM2:  CALL     AT
      009A23 CD 86 1E         [ 4] 4418         CALL     DUPP    ;?last word in a vocabulary
      009A26 CD 85 2C         [ 4] 4419         CALL     QBRAN
      009A29 9A 44                 4420         .word      TNAM4
      009A2B CD 88 25         [ 4] 4421         CALL     DDUP
      009A2E CD 91 B4         [ 4] 4422         CALL     NAMET
      009A31 CD 86 93         [ 4] 4423         CALL     XORR    ;compare
      009A34 CD 85 2C         [ 4] 4424         CALL     QBRAN
      009A37 9A 3E                 4425         .word      TNAM3
      009A39 CD 8B 1C         [ 4] 4426         CALL     CELLM   ;continue with next word
      009A3C 20 E2            [ 2] 4427         JRA     TNAM2
      009A3E CD 86 2E         [ 4] 4428 TNAM3:  CALL     SWAPP
      009A41 CC 86 14         [ 2] 4429         JP     DROP
      009A44 CD 88 1A         [ 4] 4430 TNAM4:  CALL     DDROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      009A47 CC 8B A4         [ 2] 4431         JP     ZERO
                                   4432 
                                   4433 ;       .ID     ( na -- )
                                   4434 ;        Display  name at address.
      009A4A 9A 17                 4435         .word      LINK
                           0019CC  4436 LINK = . 
      009A4C 03                    4437         .byte      3
      009A4D 2E 49 44              4438         .ascii     ".ID"
      009A50                       4439 DOTID:
      009A50 CD 87 C8         [ 4] 4440         CALL     QDUP    ;if zero no name
      009A53 CD 85 2C         [ 4] 4441         CALL     QBRAN
      009A56 9A 66                 4442         .word      DOTI1
      009A58 CD 8C 7B         [ 4] 4443         CALL     COUNT
      009A5B CD 84 F9         [ 4] 4444         CALL     DOLIT
      009A5E 00 1F                 4445         .word      0x1F
      009A60 CD 86 6A         [ 4] 4446         CALL     ANDD    ;mask lexicon bits
      009A63 CC 99 55         [ 2] 4447         JP     UTYPE
      009A66 CD 8F 72         [ 4] 4448 DOTI1:  CALL     DOTQP
      009A69 09                    4449         .byte      9
      009A6A 20 6E 6F 4E 61 6D 65  4450         .ascii     " noName"
      009A71 81               [ 4] 4451         RET
                                   4452 
                           000000  4453 WANT_SEE=0
                           000000  4454 .if WANT_SEE 
                                   4455 ;       SEE     ( -- ; <string> )
                                   4456 ;       A simple decompiler.
                                   4457 ;       Updated for byte machines.
                                   4458         .word      LINK
                                   4459 LINK = . 
                                   4460         .byte      3
                                   4461         .ascii     "SEE"
                                   4462 SEE:
                                   4463         CALL     TICK    ;starting address
                                   4464         CALL     CR
                                   4465         CALL     ONEM
                                   4466 SEE1:   CALL     ONEP
                                   4467         CALL     DUPP
                                   4468         CALL     AT
                                   4469         CALL     DUPP
                                   4470         CALL     QBRAN
                                   4471         .word    SEE2
                                   4472         CALL     TNAME   ;?is it a name
                                   4473 SEE2:   CALL     QDUP    ;name address or zero
                                   4474         CALL     QBRAN
                                   4475         .word    SEE3
                                   4476         CALL     SPACE
                                   4477         CALL     DOTID   ;display name
                                   4478         CALL     ONEP
                                   4479         JRA      SEE4
                                   4480 SEE3:   CALL     DUPP
                                   4481         CALL     CAT
                                   4482         CALL     UDOT    ;display number
                                   4483 SEE4:   CALL     NUFQ    ;user control
                                   4484         CALL     QBRAN
                                   4485         .word    SEE1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   4486         JP     DROP
                                   4487 .endif ; WANT_SEE 
                                   4488 
                                   4489 ;       WORDS   ( -- )
                                   4490 ;       Display names in vocabulary.
      009A72 9A 4C                 4491         .word      LINK
                           0019F4  4492 LINK = . 
      009A74 05                    4493         .byte      5
      009A75 57 4F 52 44 53        4494         .ascii     "WORDS"
      009A7A                       4495 WORDS:
      009A7A CD 8F 33         [ 4] 4496         CALL     CR
      009A7D CD 87 5E         [ 4] 4497         CALL     CNTXT   ;only in context
      009A80 CD 85 77         [ 4] 4498 WORS1:  CALL     AT
      009A83 CD 87 C8         [ 4] 4499         CALL     QDUP    ;?at end of list
      009A86 CD 85 2C         [ 4] 4500         CALL     QBRAN
      009A89 9A 9C                 4501         .word      WORS2
      009A8B CD 86 1E         [ 4] 4502         CALL     DUPP
      009A8E CD 8E EB         [ 4] 4503         CALL     SPACE
      009A91 CD 9A 50         [ 4] 4504         CALL     DOTID   ;display a name
      009A94 CD 8B 1C         [ 4] 4505         CALL     CELLM
      009A97 CD 85 43         [ 4] 4506         CALL     BRAN
      009A9A 9A 80                 4507         .word      WORS1
      009A9C 81               [ 4] 4508 WORS2:  RET
                                   4509 
                                   4510         
                                   4511 ;; Hardware reset
                                   4512 
                                   4513 ;       hi      ( -- )
                                   4514 ;       Display sign-on message.
      009A9D 9A 74                 4515         .word      LINK
                           001A1F  4516 LINK = . 
      009A9F 02                    4517         .byte      2
      009AA0 68 69                 4518         .ascii     "hi"
      009AA2                       4519 HI:
      009AA2 CD 8F 33         [ 4] 4520         CALL     CR
      009AA5 CD 8F 72         [ 4] 4521         CALL     DOTQP   ;initialize I/O
      009AA8 0F                    4522         .byte      15
      009AA9 73 74 6D 38 65 46 6F  4523         .ascii     "stm8eForth v"
             72 74 68 20 76
      009AB5 33                    4524 	.byte      VER+'0'
      009AB6 2E                    4525         .byte      '.' 
      009AB7 30                    4526 	.byte      EXT+'0' ;version
      009AB8 CD 8F 72         [ 4] 4527         CALL    DOTQP
                           000001  4528 .if NUCLEO          
      009ABB 12                    4529         .byte 18
      009ABC 20 6F 6E 20 4E 55 43  4530         .ascii  " on NUCLEO-8S208RB"
             4C 45 4F 2D 38 53 32
             30 38 52 42
                                   4531 .endif
                           000000  4532 .if DISCOVERY
                                   4533         .byte 19
                                   4534         .ascii  " on STM8S-DISCOVERY"
                                   4535 .endif
                           000000  4536 .if DOORBELL
                                   4537         .byte 16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   4538         .ascii " on stm8s105k6b6"
                                   4539 .endif
      009ACE CC 8F 33         [ 2] 4540         JP     CR
                                   4541 
                           000000  4542 WANT_DEBUG=0
                           000000  4543 .if WANT_DEBUG 
                                   4544 ;       DEBUG      ( -- )
                                   4545 ;       Display sign-on message.
                                   4546 ;        .word      LINK
                                   4547 LINK = . 
                                   4548         .byte      5
                                   4549         .ascii     "DEBUG"
                                   4550 DEBUG:
                                   4551 	CALL DOLIT
                                   4552 	.word 0x65
                                   4553 	CALL EMIT
                                   4554 	CALL DOLIT
                                   4555 	.word 0
                                   4556  	CALL ZLESS 
                                   4557 	CALL DOLIT
                                   4558 	.word 0xFFFE
                                   4559 	CALL ZLESS 
                                   4560 	CALL UPLUS 
                                   4561  	CALL DROP 
                                   4562 	CALL DOLIT
                                   4563 	.word 3
                                   4564 	CALL UPLUS 
                                   4565 	CALL UPLUS 
                                   4566  	CALL DROP
                                   4567 	CALL DOLIT
                                   4568 	.word 0x43
                                   4569 	CALL UPLUS 
                                   4570  	CALL DROP
                                   4571 	CALL EMIT
                                   4572 	CALL DOLIT
                                   4573 	.word 0x4F
                                   4574 	CALL DOLIT
                                   4575 	.word 0x6F
                                   4576  	CALL XORR
                                   4577 	CALL DOLIT
                                   4578 	.word 0xF0
                                   4579  	CALL ANDD
                                   4580 	CALL DOLIT
                                   4581 	.word 0x4F
                                   4582  	CALL ORR
                                   4583 	CALL EMIT
                                   4584 	CALL DOLIT
                                   4585 	.word 8
                                   4586 	CALL DOLIT
                                   4587 	.word 6
                                   4588  	CALL SWAPP
                                   4589 	CALL OVER
                                   4590 	CALL XORR
                                   4591 	CALL DOLIT
                                   4592 	.word 3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   4593 	CALL ANDD 
                                   4594 	CALL ANDD
                                   4595 	CALL DOLIT
                                   4596 	.word 0x70
                                   4597 	CALL UPLUS 
                                   4598 	CALL DROP
                                   4599 	CALL EMIT
                                   4600 	CALL DOLIT
                                   4601 	.word 0
                                   4602 	CALL QBRAN
                                   4603 	.word DEBUG1
                                   4604 	CALL DOLIT
                                   4605 	.word 0x3F
                                   4606 DEBUG1:
                                   4607 	CALL DOLIT
                                   4608 	.word 0xFFFF
                                   4609 	CALL QBRAN
                                   4610 	.word DEBUG2
                                   4611 	CALL DOLIT
                                   4612 	.word 0x74
                                   4613 	CALL BRAN
                                   4614 	.word DEBUG3
                                   4615 DEBUG2:
                                   4616 	CALL DOLIT
                                   4617 	.word 0x21
                                   4618 DEBUG3:
                                   4619 	CALL EMIT
                                   4620 	CALL DOLIT
                                   4621 	.word 0x68
                                   4622 	CALL DOLIT
                                   4623 	.word 0x80
                                   4624 	CALL STORE
                                   4625 	CALL DOLIT
                                   4626 	.word 0x80
                                   4627 	CALL AT
                                   4628 	CALL EMIT
                                   4629 	CALL DOLIT
                                   4630 	.word 0x4D
                                   4631 	CALL TOR
                                   4632 	CALL RAT
                                   4633 	CALL RFROM
                                   4634 	CALL ANDD
                                   4635 	CALL EMIT
                                   4636 	CALL DOLIT
                                   4637 	.word 0x61
                                   4638 	CALL DOLIT
                                   4639 	.word 0xA
                                   4640 	CALL TOR
                                   4641 DEBUG4:
                                   4642 	CALL DOLIT
                                   4643 	.word 1
                                   4644 	CALL UPLUS 
                                   4645 	CALL DROP
                                   4646 	CALL DONXT
                                   4647 	.word DEBUG4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4648 	CALL EMIT
                                   4649 	CALL DOLIT
                                   4650 	.word 0x656D
                                   4651 	CALL DOLIT
                                   4652 	.word 0x100
                                   4653 	CALL UMSTA
                                   4654 	CALL SWAPP
                                   4655 	CALL DOLIT
                                   4656 	.word 0x100
                                   4657 	CALL UMSTA
                                   4658 	CALL SWAPP 
                                   4659 	CALL DROP
                                   4660 	CALL EMIT
                                   4661 	CALL EMIT
                                   4662 	CALL DOLIT
                                   4663 	.word 0x2043
                                   4664 	CALL DOLIT
                                   4665 	.word 0
                                   4666 	CALL DOLIT
                                   4667 	.word 0x100
                                   4668 	CALL UMMOD
                                   4669 	CALL EMIT
                                   4670 	CALL EMIT
                                   4671 	;JP ORIG
                                   4672 	RET
                                   4673 .endif ; WANT_DEBUG 
                                   4674 
                                   4675 
                                   4676 ;       'BOOT   ( -- a )
                                   4677 ;       The application startup vector.
      009AD1 9A 9F                 4678         .word      LINK
                           001A53  4679 LINK = . 
      009AD3 05                    4680         .byte      5
      009AD4 27 42 4F 4F 54        4681         .ascii     "'BOOT"
      009AD9                       4682 TBOOT:
      009AD9 CD 86 CB         [ 4] 4683         CALL     DOVAR
      009ADC 40 02                 4684         .word    APP_RUN      ;application to boot
                                   4685 
                                   4686 ;       COLD    ( -- )
                                   4687 ;       The hilevel cold start s=ence.
      009ADE 9A D3                 4688         .word      LINK
                           001A60  4689         LINK = . 
      009AE0 04                    4690         .byte      4
      009AE1 43 4F 4C 44           4691         .ascii     "COLD"
      009AE5                       4692 COLD:
                           000000  4693 .if WANT_DEBUG
                                   4694         CALL DEBUG
                                   4695 .endif ; WANT_DEBUG
      009AE5 CD 84 F9         [ 4] 4696 COLD1:  CALL     DOLIT
      009AE8 80 AB                 4697         .word      UZERO
      009AEA CD 84 F9         [ 4] 4698 	CALL     DOLIT
      009AED 00 06                 4699         .word      UPP
      009AEF CD 84 F9         [ 4] 4700         CALL     DOLIT
      009AF2 00 1E                 4701 	.word      UEND-UZERO
      009AF4 CD 8C DF         [ 4] 4702         CALL     CMOVE   ;initialize user area
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                           000000  4703 .if WANT_FLOAT 
                                   4704         CALL    FINIT 
                                   4705 .endif 
                                   4706 ; if APP_RUN==0 initialize with ca de 'hi'  
      009AF7 90 CE 40 02      [ 2] 4707         ldw y,APP_RUN 
      009AFB 26 0B            [ 1] 4708         jrne 0$
      009AFD 1D 00 02         [ 2] 4709         subw x,#CELLL 
      009B00 90 AE 9A A2      [ 2] 4710         ldw y,#HI  
      009B04 FF               [ 2] 4711         ldw (x),y
      009B05 CD 9C 00         [ 4] 4712         call UPDATRUN 
      009B08                       4713 0$:        
                                   4714 ; update LAST with APP_LAST 
                                   4715 ; if APP_LAST > LAST else do the opposite
      009B08 90 CE 40 00      [ 2] 4716         ldw y,APP_LAST 
      009B0C 90 B3 1E         [ 2] 4717         cpw y,ULAST 
      009B0F 22 05            [ 1] 4718         jrugt 1$ 
                                   4719 ; save LAST at APP_LAST  
      009B11 CD 9B E8         [ 4] 4720         call UPDATLAST 
      009B14 20 06            [ 2] 4721         jra 2$
      009B16                       4722 1$: ; update LAST with APP_LAST 
      009B16 90 BF 1E         [ 2] 4723         ldw ULAST,y
      009B19 90 BF 18         [ 2] 4724         ldw UCNTXT,y
      009B1C                       4725 2$:  
                                   4726 ; update APP_CP if < app_space 
      009B1C 90 CE 40 04      [ 2] 4727         ldw y,APP_CP  
      009B20 90 B3 1C         [ 2] 4728         cpw y,UCP   
      009B23 24 06            [ 1] 4729         jruge 3$ 
      009B25 CD 9C 11         [ 4] 4730         call UPDATCP
      009B28 90 BE 1C         [ 2] 4731         ldw y,UCP   
      009B2B                       4732 3$:
      009B2B 90 BF 1C         [ 2] 4733         ldw UCP,y                 
                                   4734 ; update UVP with APP_VP  
                                   4735 ; if APP_VP>UVP else do the opposite 
      009B2E 90 CE 40 06      [ 2] 4736         ldw y,APP_VP 
      009B32 90 B3 1A         [ 2] 4737         cpw y,UVP 
      009B35 22 05            [ 1] 4738         jrugt 4$
      009B37 CD 9C 28         [ 4] 4739         call UPDATVP 
      009B3A 20 03            [ 2] 4740         jra 6$
      009B3C                       4741 4$: ; update UVP with APP_VP 
      009B3C 90 BF 1A         [ 2] 4742         ldw UVP,y 
      009B3F                       4743 6$:      
      009B3F CD 94 97         [ 4] 4744         CALL     PRESE   ;initialize data stack and TIB
      009B42 CD 9A D9         [ 4] 4745         CALL     TBOOT
      009B45 CD 8C C8         [ 4] 4746         CALL     ATEXE   ;application boot
      009B48 CD 97 60         [ 4] 4747         CALL     OVERT
      009B4B CC 94 B4         [ 2] 4748         JP     QUIT    ;start interpretation
                                   4749 
                                   4750 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                                   4751         .include "flash.asm"
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
      009B4E 9A E0                   30     .word LINK 
                           001AD0    31     LINK=.
      009B50 03                      32     .byte 3 
      009B51 46 50 21                33     .ascii "FP!"
      009B54                         34 FPSTOR:
      009B54 90 93            [ 1]   35     ldw y,x
      009B56 90 FE            [ 2]   36     ldw y,(y)
      009B58 90 9F            [ 1]   37     ld a,yl 
      009B5A B7 36            [ 1]   38     ld FPTR,a 
      009B5C 1C 00 02         [ 2]   39     addw x,#CELLL 
      009B5F 90 93            [ 1]   40     ldw y,x 
      009B61 90 FE            [ 2]   41     ldw y,(y)
      009B63 90 BF 37         [ 2]   42     ldw PTR16,y
      009B66 1C 00 02         [ 2]   43     addw x,#CELLL 
      009B69 81               [ 4]   44     ret 
                                     45 
                                     46 ;-----------------------------------
                                     47 ; return EEPROM base address 
                                     48 ; as a double 
                                     49 ;  EEPROM  ( -- ud )
                                     50 ;-----------------------------------
      009B6A 9B 50                   51     .word LINK 
                           001AEC    52 LINK=.
      009B6C 06                      53     .byte 6 
      009B6D 45 45 50 52 4F 4D       54     .ascii "EEPROM"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009B73                         55 EEPROM: 
      009B73 90 AE 40 00      [ 2]   56     ldw y,#EEPROM_BASE
      009B77 1D 00 04         [ 2]   57     subw x,#2*CELLL 
      009B7A EF 02            [ 2]   58     ldw (2,x),y 
      009B7C 90 5F            [ 1]   59     clrw y 
      009B7E FF               [ 2]   60     ldw (x),y 
      009B7F 81               [ 4]   61     ret
                                     62 
                                     63 ;---------------------------------
                                     64 ; return APP_LAST pointer as double
                                     65 ; EEP-LAST ( -- ud )
                                     66 ;---------------------------------
      009B80 9B 6C                   67 	.word LINK 
                           001B02    68 	LINK=.
      009B82 08                      69 	.byte 8 
      009B83 45 45 50 2D 4C 41 53    70 	.ascii "EEP-LAST"
             54
      009B8B                         71 EEPLAST:
      009B8B 1D 00 04         [ 2]   72 	subw x,#2*CELLL 
      009B8E 90 AE 40 00      [ 2]   73 	ldw y,#APP_LAST 
      009B92 EF 02            [ 2]   74 	ldw (2,x),y 
      009B94 90 5F            [ 1]   75 	clrw y 
      009B96 FF               [ 2]   76 	ldw (x),y 
      009B97 81               [ 4]   77 	ret 
                                     78 
                                     79 ;----------------------------------
                                     80 ; return APP_RUN pointer as double	
                                     81 ; EEP-RUN ( -- ud )
                                     82 ;-----------------------------------
      009B98 9B 82                   83 	.word LINK 
                           001B1A    84 	LINK=.
      009B9A 07                      85 	.byte 7
      009B9B 45 45 50 2D 52 55 4E    86 	.ascii "EEP-RUN"
      009BA2                         87 EEPRUN:
      009BA2 1D 00 04         [ 2]   88 	subw x,#2*CELLL 
      009BA5 90 AE 40 02      [ 2]   89 	ldw y,#APP_RUN 
      009BA9 EF 02            [ 2]   90 	ldw (2,x),y 
      009BAB 90 5F            [ 1]   91 	clrw y 
      009BAD FF               [ 2]   92 	ldw (x),y 
      009BAE 81               [ 4]   93 	ret 
                                     94 
                                     95 ;------------------------------------
                                     96 ; return APP_CP pointer as double 
                                     97 ; EEP-CP ( -- ud )
                                     98 ;------------------------------------
      009BAF 9B 9A                   99 	.word LINK
                           001B31   100 	LINK=.
      009BB1 06                     101 	.byte 6 
      009BB2 45 45 50 2D 43 50      102 	.ascii "EEP-CP"
      009BB8                        103 EEPCP:
      009BB8 1D 00 04         [ 2]  104 	subw x,#2*CELLL 
      009BBB 90 AE 40 04      [ 2]  105 	ldw y,#APP_CP  
      009BBF EF 02            [ 2]  106 	ldw (2,x),y 
      009BC1 90 5F            [ 1]  107 	clrw y 
      009BC3 FF               [ 2]  108 	ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009BC4 81               [ 4]  109 	ret 
                                    110 
                                    111 ;------------------------------------
                                    112 ; return APP_VP pointer as double 
                                    113 ; EEP-VP ( -- ud )
                                    114 ;-------------------------------------
      009BC5 9B B1                  115 	.word LINK
                           001B47   116 	LINK=.
      009BC7 06                     117 	.byte 6
      009BC8 45 45 50 2D 56 50      118 	.ascii "EEP-VP"
      009BCE                        119 EEPVP:
      009BCE 1D 00 04         [ 2]  120 	subw x,#2*CELLL 
      009BD1 90 AE 40 06      [ 2]  121 	ldw y,#APP_VP  
      009BD5 EF 02            [ 2]  122 	ldw (2,x),y 
      009BD7 90 5F            [ 1]  123 	clrw y 
      009BD9 FF               [ 2]  124 	ldw (x),y 
      009BDA 81               [ 4]  125 	ret 
                                    126 
                                    127 ;----------------------------------
                                    128 ; update APP_LAST with LAST 
                                    129 ; UPDAT-LAST ( -- )
                                    130 ;----------------------------------
      009BDB 9B C7                  131 	.word LINK 
                           001B5D   132 	LINK=.
      009BDD 0A                     133 	.byte 10
      009BDE 55 50 44 41 54 2D 4C   134 	.ascii "UPDAT-LAST"
             41 53 54
      009BE8                        135 UPDATLAST:
      009BE8 CD 87 8A         [ 4]  136 	call LAST
      009BEB CD 85 77         [ 4]  137 	call AT  
      009BEE CD 9B 8B         [ 4]  138 	call EEPLAST
      009BF1 CC 9D DE         [ 2]  139 	jp EESTORE 
                                    140 
                                    141 ;---------------------------------
                                    142 ; update APP_RUN 
                                    143 ; UPDAT-RUN ( a -- )
                                    144 ;---------------------------------
      009BF4 9B DD                  145 	.word LINK
                           001B76   146 	LINK=.
      009BF6 09                     147 	.byte 9
      009BF7 55 50 44 41 54 2D 52   148 	.ascii "UPDAT-RUN"
             55 4E
      009C00                        149 UPDATRUN:
      009C00 CD 9B A2         [ 4]  150 	call EEPRUN
      009C03 CC 9D DE         [ 2]  151 	jp EESTORE 
                                    152 	
                                    153 ;---------------------------------
                                    154 ; update APP_CP with CP 
                                    155 ; UPDAT-CP ( -- )
                                    156 ;---------------------------------
      009C06 9B F6                  157 	.word LINK 
                           001B88   158 	LINK=.
      009C08 08                     159 	.byte 8 
      009C09 55 50 44 41 54 2D 43   160 	.ascii "UPDAT-CP"
             50
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      009C11                        161 UPDATCP:
      009C11 CD 87 7A         [ 4]  162 	call CPP 
      009C14 CD 85 77         [ 4]  163 	call AT 
      009C17 CD 9B B8         [ 4]  164 	call EEPCP 
      009C1A CC 9D DE         [ 2]  165 	jp EESTORE 
                                    166 
                                    167 ;----------------------------------
                                    168 ; update APP_VP with VP 
                                    169 ; UPDAT-VP ( -- )
                                    170 ;----------------------------------
      009C1D 9C 08                  171 	.word LINK
                           001B9F   172 	LINK=.
      009C1F 08                     173 	.byte 8 
      009C20 55 50 44 41 54 2D 56   174 	.ascii "UPDAT-VP" 
             50
      009C28                        175 UPDATVP:
      009C28 CD 87 6C         [ 4]  176 	call VPP 
      009C2B CD 85 77         [ 4]  177 	call AT
      009C2E CD 9B CE         [ 4]  178 	call EEPVP 
      009C31 CC 9D DE         [ 2]  179 	jp EESTORE
                                    180 	
                           000001   181 .if NUCLEO
                                    182 ;----------------------------------
                                    183 ; fetch integer at address over 65535
                                    184 ;  F@   ( ud -- n )
                                    185 ;----------------------------------
      009C34 9C 1F                  186     .word LINK 
                           001BB6   187 LINK=.
      009C36 02                     188     .byte 2
      009C37 46 40                  189     .ascii "F@"
      009C39                        190 FARAT:
      009C39 CD 9B 54         [ 4]  191     call FPSTOR
      009C3C CC 9D 01         [ 2]  192 	jp EE_READ 
                                    193 
                                    194 
                                    195 ;-------------------------------------
                                    196 ; fetch C at address over 65535 
                                    197 ; FC@ ( ud -- c)
                                    198 ;-------------------------------------
      009C3F 9C 36                  199     .word LINK
                           001BC1   200     LINK=.
      009C41 03                     201     .byte 3 
      009C42 46 43 40               202     .ascii "FC@" 
      009C45                        203 FARCAT:
      009C45 CD 9B 54         [ 4]  204     call FPSTOR
      009C48 CC 9D 23         [ 2]  205 	jp EE_CREAD  
                                    206 .endif ; NUCLEO 
                                    207 
                                    208 ;----------------------------------
                                    209 ; UNLOCK EEPROM/OPT for writing/erasing
                                    210 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    211 ;  UNLKEE   ( -- )
                                    212 ;----------------------------------
      009C4B 9C 41                  213     .word LINK 
                           001BCD   214 LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009C4D 06                     215     .byte 6 
      009C4E 55 4E 4C 4B 45 45      216     .ascii "UNLKEE"
      009C54                        217 UNLKEE:
      009C54 35 00 50 5B      [ 1]  218 	mov FLASH_CR2,#0 
      009C58 35 FF 50 5C      [ 1]  219 	mov FLASH_NCR2,#0xFF 
      009C5C 35 AE 50 64      [ 1]  220 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009C60 35 56 50 64      [ 1]  221     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009C64 72 07 50 5F FB   [ 2]  222 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009C69 81               [ 4]  223 	ret
                                    224 
                                    225 ;----------------------------------
                                    226 ; UNLOCK FLASH for writing/erasing
                                    227 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    228 ; UNLKFL  ( -- )
                                    229 ;----------------------------------
      009C6A 9C 4D                  230     .word LINK 
                           001BEC   231 LINK=. 
      009C6C 06                     232     .byte 6 
      009C6D 55 4E 4C 4B 46 4C      233     .ascii "UNLKFL"    
      009C73                        234 UNLKFL:
      009C73 35 00 50 5B      [ 1]  235 	mov FLASH_CR2,#0 
      009C77 35 FF 50 5C      [ 1]  236 	mov FLASH_NCR2,#0xFF 
      009C7B 35 56 50 62      [ 1]  237 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009C7F 35 AE 50 62      [ 1]  238 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009C83 72 03 50 5F FB   [ 2]  239 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009C88 81               [ 4]  240 	ret
                                    241 
                                    242 ;-----------------------------
                                    243 ; UNLOCK FLASH or EEPROM 
                                    244 ; according to FPTR address 
                                    245 ;  UNLOCK ( -- )
                                    246 ;-----------------------------
      009C89 9C 6C                  247 	.word LINK 
                           001C0B   248 	LINK=.
      009C8B 06                     249 	.byte 6
      009C8C 55 4E 4C 4F 43 4B      250 	.ascii "UNLOCK"
      009C92                        251 UNLOCK:
                                    252 ; put addr[15:0] in Y, for bounds check.
      009C92 90 BE 37         [ 2]  253 	ldw y,PTR16   ; Y=addr15:0
                                    254 ; check addr[23:16], if <> 0 then it is extened flash memory
      009C95 3D 36            [ 1]  255 	tnz FPTR 
      009C97 26 16            [ 1]  256 	jrne 4$
      009C99 90 A3 80 00      [ 2]  257     cpw y,#FLASH_BASE
      009C9D 24 10            [ 1]  258     jruge 4$
      009C9F 90 A3 40 00      [ 2]  259 	cpw y,#EEPROM_BASE  
      009CA3 25 0D            [ 1]  260     jrult 9$
      009CA5 90 A3 48 7F      [ 2]  261 	cpw y,#OPTION_END 
      009CA9 22 07            [ 1]  262 	jrugt 9$
      009CAB CD 9C 54         [ 4]  263 	call UNLKEE
      009CAE 81               [ 4]  264 	ret 
      009CAF CD 9C 73         [ 4]  265 4$: call UNLKFL
      009CB2 81               [ 4]  266 9$: ret 
                                    267 
                                    268 ;-------------------------
                                    269 ; LOCK write access to 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



                                    270 ; FLASH and EEPROM 
                                    271 ; LOCK ( -- )
                                    272 ;-------------------------
      009CB3 9C 8B                  273 	.word LINK 
                           001C35   274 	LINK=.
      009CB5 04                     275 	.byte 4 
      009CB6 4C 4F 43 4B            276 	.ascii "LOCK" 
      009CBA                        277 LOCK: 
      009CBA 72 13 50 5F      [ 1]  278 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009CBE 72 17 50 5F      [ 1]  279 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009CC2 81               [ 4]  280 	ret 
                                    281 
                                    282 ;-------------------------
                                    283 ; increment FPTR 
                                    284 ; INC-FPTR ( -- )
                                    285 ;-------------------------
      009CC3 9C B5                  286 	.word LINK 
                           001C45   287 	LINK=. 
      009CC5 08                     288 	.byte 8 
      009CC6 49 4E 43 2D 46 50 54   289 	.ascii "INC-FPTR" 
             52
      009CCE                        290 INC_FPTR:
      009CCE 3C 38            [ 1]  291 	inc PTR8 
      009CD0 26 0C            [ 1]  292 	jrne 1$
      009CD2 90 89            [ 2]  293 	pushw y 
      009CD4 90 BE 36         [ 2]  294 	ldw y,FPTR 
      009CD7 90 5C            [ 1]  295 	incw y 
      009CD9 90 BF 36         [ 2]  296 	ldw FPTR,y
      009CDC 90 85            [ 2]  297 	popw y  
      009CDE 81               [ 4]  298 1$: ret 
                                    299 
                                    300 ;------------------------------
                                    301 ; add u to FPTR 
                                    302 ; PTR+ ( u -- )
                                    303 ;------------------------------
      009CDF 9C C5                  304 	.word LINK 
                           001C61   305 	LINK=.
      009CE1 04                     306 	.byte 4 
      009CE2 50 54 52 2B            307 	.ascii "PTR+"
      009CE6                        308 PTRPLUS:
      009CE6 90 93            [ 1]  309 	ldw y,x 
      009CE8 1C 00 02         [ 2]  310 	addw x,#CELLL 
      009CEB 72 B9 00 37      [ 2]  311 	addw y,PTR16 
      009CEF 90 BF 37         [ 2]  312 	ldw PTR16,y  
      009CF2 24 02            [ 1]  313 	jrnc 1$
      009CF4 3C 36            [ 1]  314 	inc FPTR 
      009CF6 81               [ 4]  315 1$: ret 
                                    316 
                                    317 ;---------------------------------
                                    318 ; read word at address pointed FPTR
                                    319 ; increment FPTR 
                                    320 ; EE-READ ( -- w )
                                    321 ;------------------------------------
      009CF7 9C E1                  322 	.word LINK 
                           001C79   323 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009CF9 07                     324 	.byte 7 
      009CFA 45 45 2D 52 45 41 44   325 	.ascii "EE-READ"
      009D01                        326 EE_READ:
      009D01 1D 00 02         [ 2]  327 	subw x,#CELLL 
      009D04 92 BC 00 36      [ 5]  328 	ldf a,[FPTR]
      009D08 90 95            [ 1]  329 	ld yh,a 
      009D0A CD 9C CE         [ 4]  330 	call INC_FPTR 
      009D0D 92 BC 00 36      [ 5]  331 	ldf a,[FPTR]
      009D11 CD 9C CE         [ 4]  332 	call INC_FPTR 
      009D14 90 97            [ 1]  333 	ld yl,a 
      009D16 FF               [ 2]  334 	ldw (x),y 
      009D17 81               [ 4]  335 	ret 
                                    336 
                                    337 ;---------------------------------------
                                    338 ; Read byte at address pointed by FPTR 
                                    339 ; EE-CREAD ( -- c )
                                    340 ;---------------------------------------
      009D18 9C F9                  341 	.word LINK 
                           001C9A   342 	LINK=.
      009D1A 08                     343 	.byte 8
      009D1B 45 45 2D 43 52 45 41   344 	.ascii "EE-CREAD" 
             44
      009D23                        345 EE_CREAD:
      009D23 1D 00 02         [ 2]  346 	subw x,#CELLL 
      009D26 92 BC 00 36      [ 5]  347 	ldf a,[FPTR]	
      009D2A CD 9C CE         [ 4]  348 	call INC_FPTR
      009D2D 90 5F            [ 1]  349 	clrw y 
      009D2F 90 97            [ 1]  350 	ld yl,a 
      009D31 FF               [ 2]  351 	ldw (x),y 
      009D32 81               [ 4]  352 	ret 
                                    353 
                                    354 ;----------------------------
                                    355 ; write a byte at address pointed 
                                    356 ; by FPTR and increment FPTR.
                                    357 ; Expect pointer already initialized 
                                    358 ; and memory unlocked 
                                    359 ; WR-BYTE ( c -- )
                                    360 ;----------------------------
      009D33 9D 1A                  361 	.word LINK 
                           001CB5   362 	LINK=. 
      009D35 07                     363 	.byte 7 
      009D36 57 52 2D 42 59 54 45   364 	.ascii "WR-BYTE" 
                                    365 
      009D3D                        366 WR_BYTE:
      009D3D CD 84 E5         [ 4]  367 	call FC_XOFF
      009D40 90 93            [ 1]  368 	ldw y,x 
      009D42 90 FE            [ 2]  369 	ldw y,(y)
      009D44 1C 00 02         [ 2]  370 	addw x,#CELLL 
      009D47 90 9F            [ 1]  371 	ld a,yl
      009D49 92 BD 00 36      [ 4]  372 	ldf [FPTR],a
      009D4D 72 05 50 5F FB   [ 2]  373 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009D52 CD 84 CF         [ 4]  374 	call FC_XON
      009D55 CC 9C CE         [ 2]  375 	jp INC_FPTR 
                                    376 
                                    377 ;---------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                    378 ; write a word at address pointed 
                                    379 ; by FPTR and increment FPTR 
                                    380 ; Expect pointer already initialzed 
                                    381 ; and memory unlocked 
                                    382 ; WR-WORD ( w -- )
                                    383 ;---------------------------------------
      009D58 9D 35                  384 	.word LINK 
                           001CDA   385 	LINK=.
      009D5A 07                     386 	.byte 7 
      009D5B 57 52 2D 57 4F 52 44   387 	.ascii "WR-WORD" 
      009D62                        388 WR_WORD:
      009D62 CD 84 E5         [ 4]  389 	call FC_XOFF
      009D65 90 93            [ 1]  390 	ldw y,x
      009D67 90 FE            [ 2]  391 	ldw y,(y)
      009D69 1C 00 02         [ 2]  392 	addw x,#CELLL 
      009D6C 90 9E            [ 1]  393 	ld a,yh 
      009D6E 92 BD 00 36      [ 4]  394 	ldf [FPTR],a
      009D72 72 05 50 5F FB   [ 2]  395 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009D77 CD 9C CE         [ 4]  396 	call INC_FPTR 
      009D7A 90 9F            [ 1]  397 	ld a,yl 
      009D7C 92 BD 00 36      [ 4]  398 	ldf [FPTR],a
      009D80 72 05 50 5F FB   [ 2]  399 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009D85 CD 84 CF         [ 4]  400 	call FC_XON
      009D88 CC 9C CE         [ 2]  401 	jp INC_FPTR 
                                    402 
                                    403 
                                    404 ;---------------------------------------
                                    405 ; write a byte to FLASH or EEPROM/OPTION  
                                    406 ; EEC!  (c ud -- )
                                    407 ;---------------------------------------
      009D8B 9D 5A                  408     .word LINK 
                           001D0D   409 	LINK=.
      009D8D 04                     410     .byte 4 
      009D8E 45 45 43 21            411     .ascii "EEC!"
                                    412 	; local variables 
                           000001   413 	BTW = 1   ; byte to write offset on stack
                           000002   414     OPT = 2 
                           000002   415 	VSIZE = 2
      009D92                        416 EECSTORE:
      009D92 52 02            [ 2]  417 	sub sp,#VSIZE
      009D94 CD 9B 54         [ 4]  418     call FPSTOR
      009D97 E6 01            [ 1]  419 	ld a,(1,x)
      009D99 43               [ 1]  420 	cpl a 
      009D9A 6B 01            [ 1]  421 	ld (BTW,sp),a ; byte to write 
      009D9C 0F 02            [ 1]  422 	clr (OPT,sp)  ; OPTION flag
      009D9E CD 9C 92         [ 4]  423 	call UNLOCK 
                                    424 	; check if option
      009DA1 3D 36            [ 1]  425 	tnz FPTR 
      009DA3 26 19            [ 1]  426 	jrne 2$
      009DA5 90 BE 37         [ 2]  427 	ldw y,PTR16 
      009DA8 90 A3 48 00      [ 2]  428 	cpw y,#OPTION_BASE
      009DAC 2B 10            [ 1]  429 	jrmi 2$
      009DAE 90 A3 48 80      [ 2]  430 	cpw y,#OPTION_END+1
      009DB2 2A 0A            [ 1]  431 	jrpl 2$
      009DB4 03 02            [ 1]  432 	cpl (OPT,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                    433 	; OPTION WRITE require this UNLOCK 
      009DB6 72 1E 50 5B      [ 1]  434     bset FLASH_CR2,#FLASH_CR2_OPT
      009DBA 72 1F 50 5C      [ 1]  435     bres FLASH_NCR2,#FLASH_CR2_OPT 
      009DBE                        436 2$: 
      009DBE CD 9D 3D         [ 4]  437 	call WR_BYTE 	
      009DC1 0D 02            [ 1]  438 	tnz (OPT,sp)
      009DC3 27 0D            [ 1]  439 	jreq 3$ 
      009DC5 7B 01            [ 1]  440     ld a,(BTW,sp)
      009DC7 90 5F            [ 1]  441     clrw y
      009DC9 90 97            [ 1]  442 	ld yl,a 
      009DCB 1D 00 02         [ 2]  443 	subw x,#CELLL 
      009DCE FF               [ 2]  444 	ldw (x),y 
      009DCF CD 9D 3D         [ 4]  445 	call WR_BYTE
      009DD2                        446 3$: 
      009DD2 CD 9C BA         [ 4]  447 	call LOCK 
      009DD5 5B 02            [ 2]  448 	addw sp,#VSIZE 
      009DD7 81               [ 4]  449     ret
                                    450 
                                    451 ;------------------------------
                                    452 ; write integer in FLASH|EEPROM
                                    453 ; EE! ( n ud -- )
                                    454 ;------------------------------
      009DD8 9D 8D                  455 	.word LINK 
                           001D5A   456 	LINK=.
      009DDA 03                     457 	.byte 3 
      009DDB 45 45 21               458 	.ascii "EE!"
      009DDE                        459 EESTORE:
      009DDE CD 9B 54         [ 4]  460 	call FPSTOR 
      009DE1 CD 9C 92         [ 4]  461 	call UNLOCK 
      009DE4 90 93            [ 1]  462 	ldw y,x 
      009DE6 90 FE            [ 2]  463 	ldw y,(y)
      009DE8 90 89            [ 2]  464 	pushw y 
      009DEA 90 5E            [ 1]  465 	swapw y 
      009DEC FF               [ 2]  466 	ldw (x),y 
      009DED CD 9D 3D         [ 4]  467 	call WR_BYTE 
      009DF0 90 85            [ 2]  468 	popw y 
      009DF2 1D 00 02         [ 2]  469 	subw x,#CELLL
      009DF5 FF               [ 2]  470 	ldw (x),y 
      009DF6 CD 9D 3D         [ 4]  471 	call WR_BYTE
      009DF9 CC 9C BA         [ 2]  472 	jp LOCK 
                                    473 
                                    474 
                                    475 ;----------------------------
                                    476 ; Erase flash memory row 
                                    477 ; stm8s208 as 128 bytes rows
                                    478 ; ROW-ERASE ( ud -- )
                                    479 ;----------------------------
      009DFC 9D DA                  480 	.word LINK 
                           001D7E   481 	LINK=. 
      009DFE 09                     482 	.byte 9 
      009DFF 52 4F 57 2D 45 52 41   483 	.ascii "ROW-ERASE" 
             53 45
      009E08                        484 row_erase:
      009E08 CD 84 E5         [ 4]  485 	call FC_XOFF
      009E0B CD 9B 54         [ 4]  486 	call FPSTOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                    487 ;code must be execute from RAM 
                                    488 ;copy routine to PAD 
      009E0E 1D 00 02         [ 2]  489 	subw x,#CELLL 
      009E11 90 AE 9E 61      [ 2]  490 	ldw y,#row_erase_proc
      009E15 FF               [ 2]  491 	ldw (x),y 
      009E16 CD 8C A3         [ 4]  492 	call PAD 
      009E19 90 AE 9E 88      [ 2]  493 	ldw y,#row_erase_proc_end 
      009E1D 72 A2 9E 61      [ 2]  494 	subw y,#row_erase_proc
      009E21 1D 00 02         [ 2]  495 	subw x,#CELLL 
      009E24 FF               [ 2]  496 	ldw (x),y 
      009E25 CD 8C DF         [ 4]  497 	call CMOVE 
      009E28                        498 block_erase:
      009E28 90 BE 37         [ 2]  499 	ldw y,FPTR+1
      009E2B 90 A3 AA 80      [ 2]  500 	cpw y,#app_space 
      009E2F 2A 19            [ 1]  501 	jrpl erase_flash 
                                    502 ; erase EEPROM block
      009E31 90 A3 40 00      [ 2]  503 	cpw y,#EEPROM_BASE 
      009E35 24 04            [ 1]  504 	jruge 1$
      009E37 CD 84 CF         [ 4]  505 	call FC_XON
      009E3A 81               [ 4]  506 	ret ; bad address 
      009E3B 90 A3 47 FF      [ 2]  507 1$: cpw y,#EEPROM_END 
      009E3F 23 04            [ 2]  508 	jrule 2$ 
      009E41 CD 84 CF         [ 4]  509 	call FC_XON
      009E44 81               [ 4]  510 	ret ; bad address 
      009E45                        511 2$:	
      009E45 CD 9C 54         [ 4]  512 	call UNLKEE 
      009E48 20 03            [ 2]  513 	jra proceed_erase
                                    514 ; erase flash block:
      009E4A                        515 erase_flash:
      009E4A CD 9C 73         [ 4]  516 	call UNLKFL 
      009E4D                        517 proceed_erase:
      009E4D CD 8C A3         [ 4]  518 	call PAD 
      009E50 90 93            [ 1]  519 	ldw y,x
      009E52 90 FE            [ 2]  520 	ldw y,(y)
      009E54 1C 00 02         [ 2]  521 	addw x,#CELLL  
      009E57 90 FD            [ 4]  522 	call (y) 
      009E59 72 17 50 5F      [ 1]  523 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009E5D CD 84 CF         [ 4]  524 	call FC_XON
      009E60 81               [ 4]  525 	ret 
                                    526 
                                    527 ; this routine is to be copied to PAD 
      009E61                        528 row_erase_proc:
      009E61 35 20 50 5B      [ 1]  529 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009E65 35 DF 50 5C      [ 1]  530 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009E69 4F               [ 1]  531 	clr a 
      009E6A 90 5F            [ 1]  532 	clrw y 
      009E6C 91 A7 00 36      [ 1]  533 	ldf ([FPTR],y),a
      009E70 90 5C            [ 1]  534     incw y
      009E72 91 A7 00 36      [ 1]  535 	ldf ([FPTR],y),a
      009E76 90 5C            [ 1]  536     incw y
      009E78 91 A7 00 36      [ 1]  537 	ldf ([FPTR],y),a
      009E7C 90 5C            [ 1]  538     incw y
      009E7E 91 A7 00 36      [ 1]  539 	ldf ([FPTR],y),a
      009E82 72 05 50 5F FB   [ 2]  540 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009E87 81               [ 4]  541 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009E88                        542 row_erase_proc_end:
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
      009E88                        555 copy_buffer:
      009E88 4B 80            [ 1]  556 	push #BLOCK_SIZE  
                                    557 ;enable block programming 
      009E8A 72 10 50 5B      [ 1]  558 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009E8E 72 11 50 5C      [ 1]  559 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009E92 90 5F            [ 1]  560 	clrw y
      009E94 F6               [ 1]  561 1$:	ld a,(x)
      009E95 91 A7 00 36      [ 1]  562 	ldf ([FPTR],y),a
      009E99 5C               [ 1]  563 	incw x 
      009E9A 90 5C            [ 1]  564 	incw y 
      009E9C 0A 01            [ 1]  565 	dec (BCNT,sp)
      009E9E 26 F4            [ 1]  566 	jrne 1$
                                    567 ; wait EOP bit 
      009EA0 72 05 50 5F FB   [ 2]  568 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009EA5 84               [ 1]  569 	pop a ; remove BCNT from stack 
      009EA6 81               [ 4]  570 	ret 
      009EA7                        571 copy_buffer_end:
                                    572 
                                    573 ;-------------------------
                                    574 ; move program_row to RAM 
                                    575 ; in TIB 
                                    576 ;------------------------
      009EA7                        577 copy_prog_to_ram:
      009EA7 1D 00 06         [ 2]  578 	subw x,#6
      009EAA 90 AE 9E 88      [ 2]  579 	ldw y,#copy_buffer 
      009EAE EF 04            [ 2]  580 	ldw (4,x),y 
      009EB0 90 AE 17 00      [ 2]  581 	ldw y,#TIBBASE
      009EB4 EF 02            [ 2]  582 	ldw (2,x),y 
      009EB6 90 AE 9E A7      [ 2]  583 	ldw y,#copy_buffer_end 
      009EBA 72 A2 9E 88      [ 2]  584 	subw y,#copy_buffer  
      009EBE FF               [ 2]  585 	ldw (x),y 
      009EBF CD 8C DF         [ 4]  586 	call CMOVE 
      009EC2 81               [ 4]  587 	ret 
                                    588 
                                    589 
                                    590 ;-----------------------------
                                    591 ; write a row in FLASH/EEPROM 
                                    592 ; WR-ROW ( a ud -- )
                                    593 ; a -> address 128 byte buffer to write 
                                    594 ; ud ->  row address in FLASH|EEPROM 
                                    595 ;-----------------------------
      009EC3 9D FE                  596 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                           001E45   597 	LINK=.
      009EC5 06                     598 	.byte 6 
      009EC6 57 52 2D 52 4F 57      599 	.ascii "WR-ROW"
      009ECC                        600 write_row:
      009ECC CD 84 E5         [ 4]  601 	call FC_XOFF
      009ECF CD 9B 54         [ 4]  602 	call FPSTOR
                                    603 ; align to FLASH block 
      009ED2 A6 80            [ 1]  604 	ld a,#0x80 
      009ED4 B4 38            [ 1]  605 	and a,PTR8 
      009ED6 B7 38            [ 1]  606 	ld PTR8,a  
      009ED8 CD 9E A7         [ 4]  607 	call copy_prog_to_ram
      009EDB CD 9C 92         [ 4]  608 	call UNLOCK
      009EDE 90 93            [ 1]  609 	ldw y,x 
      009EE0 90 FE            [ 2]  610 	ldw y,(y)
      009EE2 1C 00 02         [ 2]  611 	addw x,#CELLL 
      009EE5 89               [ 2]  612 	pushw x 
      009EE6 93               [ 1]  613 	ldw x,y ; buffer address in x 
      009EE7 CD 17 00         [ 4]  614 	call TIBBASE
      009EEA CD 9C BA         [ 4]  615 	call LOCK
      009EED 85               [ 2]  616 	popw x 
      009EEE CD 84 CF         [ 4]  617 	call FC_XON 
      009EF1 81               [ 4]  618 	ret 
                                    619 
                                    620 ;-------------------------------------
                                    621 ; change value of OPTION register 
                                    622 ; SET-OPT (c n -- ) 
                                    623 ; c new value.
                                    624 ; n OPT  number {1..7}
                                    625 ;--------------------------------------
      009EF2 9E C5                  626 		.word LINK 
                           001E74   627 		LINK=.
      009EF4 07                     628 		.byte 7 
      009EF5 53 45 54 2D 4F 50 54   629 		.ascii "SET-OPT" 
      009EFC                        630 set_option: 
      009EFC 90 93            [ 1]  631 		ldw y,x 
      009EFE 90 FE            [ 2]  632 		ldw y,(y)
      009F00 27 06            [ 1]  633 		jreq 1$
      009F02 90 A3 00 07      [ 2]  634 		cpw y,#7 
      009F06 23 04            [ 2]  635 		jrule 2$ 
                                    636 ; invalid OPTION number 		
      009F08 1C 00 04         [ 2]  637 1$:		addw x,#2*CELLL
      009F0B 81               [ 4]  638 		ret
      009F0C 90 58            [ 2]  639 2$:		sllw y 
      009F0E 72 A9 47 FF      [ 2]  640 		addw y,#OPTION_BASE-1
      009F12 FF               [ 2]  641 		ldw (x),y 
      009F13 1D 00 02         [ 2]  642 		subw x,#CELLL 
      009F16 90 5F            [ 1]  643 		clrw y 
      009F18 FF               [ 2]  644 		ldw (x),y 
      009F19 CD 9D 92         [ 4]  645 		call EECSTORE
      009F1C 81               [ 4]  646 		ret 
                                    647 
                                    648 
                                    649 
                                    650 ;--------------------------------------
                                    651 ; reset system to its original state 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                    652 ; before any user modification
                                    653 ; PRISTINE ( -- )
                                    654 ;-------------------------------------
      009F1D 9E F4                  655 	.word LINK  
                           001E9F   656 	LINK=.
      009F1F 08                     657 	.byte 8 
      009F20 50 52 49 53 54 49 4E   658 	.ascii "PRISTINE"
             45
      009F28                        659 pristine:
                                    660 ;;; erase EEPROM
      009F28 CD 9B 73         [ 4]  661 	call EEPROM 
      009F2B CD 88 25         [ 4]  662 1$:	call DDUP 
      009F2E CD 9E 08         [ 4]  663 	call row_erase
      009F31 90 93            [ 1]  664 	ldw y,x 
      009F33 90 EE 02         [ 2]  665 	ldw y,(2,y)
      009F36 72 A9 00 80      [ 2]  666 	addw y,#BLOCK_SIZE
      009F3A EF 02            [ 2]  667 	ldw (2,x),y
      009F3C 90 A3 48 00      [ 2]  668 	cpw y,#OPTION_BASE 
      009F40 25 E9            [ 1]  669 	jrult 1$
                                    670 ;;; reset OPTION to default values
      009F42 90 AE 00 01      [ 2]  671 	ldw y,#1 ; OPT1 
      009F46 FF               [ 2]  672 2$:	ldw (x),y   
      009F47 90 5F            [ 1]  673 	clrw y 
      009F49 EF 02            [ 2]  674 	ldw (2,x),y  ; ( 0 1 -- ) 
      009F4B CD 88 25         [ 4]  675 	call DDUP    ; ( 0 1 0 1 -- )  
      009F4E CD 9E FC         [ 4]  676 	call set_option
      009F51 90 93            [ 1]  677 	ldw y,x 
      009F53 90 FE            [ 2]  678 	ldw y,(y)
      009F55 90 5C            [ 1]  679 	incw y  ; next OPTION 
      009F57 90 A3 00 08      [ 2]  680 	cpw y,#8 
      009F5B 25 E9            [ 1]  681 	jrult 2$
                                    682 ;;; erase first row of app_space 	
      009F5D 90 AE AA 80      [ 2]  683 	ldw y,#app_space
      009F61 EF 02            [ 2]  684 	ldw (2,x),y  
      009F63 90 5F            [ 1]  685 	clrw y 
      009F65 FF               [ 2]  686 	ldw (x),y ; ( app_space 0 -- )
      009F66 CD 9E 08         [ 4]  687 	call row_erase 
                                    688 ; reset interrupt vectors 
      009F69 1D 00 02         [ 2]  689 	subw x,#CELLL 
      009F6C 90 5F            [ 1]  690 	clrw y  
      009F6E FF               [ 2]  691 4$:	ldw (x),y  ; ( n -- ) int# 
      009F6F CD 86 1E         [ 4]  692 	call DUPP  
      009F72 CD 9F 8F         [ 4]  693 	call reset_vector
      009F75 90 93            [ 1]  694 	ldw y,x 
      009F77 90 FE            [ 2]  695 	ldw y,(y)
      009F79 90 5C            [ 1]  696 	incw y   ; next vector 
      009F7B 90 A3 00 19      [ 2]  697 	cpw y,#25 
      009F7F 25 ED            [ 1]  698 	jrult 4$
      009F81 CC 80 80         [ 2]  699 	jp NonHandledInterrupt ; reset MCU
                                    700 
                                    701 ;------------------------------
                                    702 ; reset an interrupt vector 
                                    703 ; to its initial value 
                                    704 ; i.e. NonHandledInterrupt
                                    705 ; RST-IVEC ( n -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                                    706 ;-----------------------------
      009F84 9F 1F                  707 	.word LINK 
                           001F06   708 	LINK=. 
      009F86 08                     709 	.byte 8 
      009F87 52 53 54 2D 49 56 45   710 	.ascii "RST-IVEC"
             43
      009F8F                        711 reset_vector:
      009F8F 90 93            [ 1]  712 	ldw y,x
      009F91 1C 00 02         [ 2]  713 	addw x,#CELLL 
      009F94 90 FE            [ 2]  714 	ldw y,(y)
      009F96 90 A3 00 17      [ 2]  715 	cpw y,#23 
      009F9A 27 3A            [ 1]  716 	jreq 9$
      009F9C 90 A3 00 1D      [ 2]  717 	cpw y,#29 ; last vector
      009FA0 22 34            [ 1]  718 	jrugt 9$  
      009FA2 90 58            [ 2]  719 	sllw y 
      009FA4 90 58            [ 2]  720 	sllw y 
      009FA6 72 A9 80 08      [ 2]  721 	addw y,#0x8008 ; irq0 address 
      009FAA 90 BF 28         [ 2]  722 	ldw YTEMP,y
      009FAD 1D 00 06         [ 2]  723 	subw x,#3*CELLL 
      009FB0 EF 02            [ 2]  724 	ldw (2,x),y 
      009FB2 90 5F            [ 1]  725 	clrw y
      009FB4 FF               [ 2]  726 	ldw (x),y 
      009FB5 A6 82            [ 1]  727 	ld a,#0x82 
      009FB7 90 95            [ 1]  728 	ld yh,a
      009FB9 EF 04            [ 2]  729 	ldw (4,x),y
      009FBB CD 9D DE         [ 4]  730 	call EESTORE
      009FBE 1D 00 06         [ 2]  731 	subw x,#3*CELLL
      009FC1 90 5F            [ 1]  732 	clrw y 
      009FC3 FF               [ 2]  733 	ldw (x),y 
      009FC4 90 AE 80 80      [ 2]  734 	ldw y,#NonHandledInterrupt
      009FC8 EF 04            [ 2]  735 	ldw (4,x),y 
      009FCA 90 BE 28         [ 2]  736 	ldw y,YTEMP  
      009FCD 72 A9 00 02      [ 2]  737 	addw y,#2
      009FD1 EF 02            [ 2]  738 	ldw (2,x),y 
      009FD3 CD 9D DE         [ 4]  739 	call EESTORE
      009FD6 81               [ 4]  740 9$:	ret 
                                    741 
                                    742 
                                    743 ;------------------------------
                                    744 ; all interrupt vector with 
                                    745 ; an address >= a are resetted 
                                    746 ; to default
                                    747 ; CHKIVEC ( a -- )
                                    748 ;------------------------------
      009FD7 9F 86                  749 	.word LINK 
                           001F59   750 	LINK=.
      009FD9 07                     751 	.byte 7
      009FDA 43 48 4B 49 56 45 43   752 	.ascii "CHKIVEC"
                                    753 ;local variables 
                           000001   754 	SSP=1
                           000003   755 	CADR=3
                           000005   756 	OFS=5
                           000006   757 	VSIZE=6  
      009FE1                        758 CHKIVEC:
      009FE1 52 06            [ 2]  759 	sub sp,#VSIZE ;alloc local variables 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009FE3 90 93            [ 1]  760 	ldw y,x 
      009FE5 90 FE            [ 2]  761 	ldw y,(y)
      009FE7 17 03            [ 2]  762 	ldw (CADR,sp),y ; ca 
      009FE9 1F 01            [ 2]  763 	ldw (SSP,sp),x 
      009FEB AE 80 0A         [ 2]  764 	ldw x,#0x800a ; irq0 address 
      009FEE BF 37            [ 2]  765 	ldw PTR16,X
      009FF0 AE FF FC         [ 2]  766 	ldw x,#-4 
      009FF3 1C 00 04         [ 2]  767 1$:	addw x,#4
      009FF6 A3 00 78         [ 2]  768 	cpw x,#30*4 ; irq0-29 
      009FF9 27 22            [ 1]  769 	jreq 9$
      009FFB 90 93            [ 1]  770 	ldw y,x  
      009FFD 91 D6 37         [ 4]  771 	ld a,([PTR16],y)
      00A000 11 03            [ 1]  772 	cp a,(CADR,sp)
      00A002 25 EF            [ 1]  773 	jrult 1$
      00A004 90 5C            [ 1]  774 	incw y 
      00A006 91 D6 37         [ 4]  775 	ld a,([PTR16],y)
      00A009 11 04            [ 1]  776 	cp a,(CADR+1,sp) 
      00A00B 25 E6            [ 1]  777 	jrult 1$ 
      00A00D 1F 05            [ 2]  778 	ldw (OFS,sp),x 
      00A00F 54               [ 2]  779 	srlw x
      00A010 54               [ 2]  780 	srlw x 
      00A011 90 93            [ 1]  781 	ldw y,x 
      00A013 1E 01            [ 2]  782 	ldw x,(SSP,sp)
      00A015 FF               [ 2]  783 	ldw (x),y
      00A016 CD 9F 8F         [ 4]  784 	call reset_vector
      00A019 1E 05            [ 2]  785 	ldw x,(OFS,sp) 
      00A01B 20 D6            [ 2]  786 	jra 1$
      00A01D 1E 01            [ 2]  787 9$:	ldw x,(SSP,sp) 
      00A01F 1C 00 02         [ 2]  788 	addw x,#CELLL 
      00A022 5B 06            [ 2]  789 	addw sp,#VSIZE ; drop local variables  
      00A024 81               [ 4]  790 	ret 
                                    791 
                                    792 ;------------------------------
                                    793 ; set interrupt vector 
                                    794 ; SET-IVEC ( ud n -- )
                                    795 ;  ud Handler address
                                    796 ;  n  vector # 0 .. 29 
                                    797 ;-----------------------------
      00A025 9F D9                  798 	.word LINK
                           001FA7   799 	LINK=.
      00A027 08                     800 	.byte 8 
      00A028 53 45 54 2D 49 56 45   801 	.ascii "SET-IVEC" 
             43
      00A030                        802 set_vector:
      00A030 90 93            [ 1]  803     ldw y,x 
      00A032 1C 00 02         [ 2]  804 	addw x,#CELLL 
      00A035 90 FE            [ 2]  805 	ldw y,(y) ; vector #
      00A037 90 A3 00 1D      [ 2]  806 	cpw y,#29 ; last vector
      00A03B 23 04            [ 2]  807 	jrule 2$
      00A03D 1C 00 04         [ 2]  808 	addw x,#2*CELLL 
      00A040 81               [ 4]  809 	ret
      00A041 90 58            [ 2]  810 2$:	sllw y 
      00A043 90 58            [ 2]  811 	sllw y 
      00A045 72 A9 80 08      [ 2]  812 	addw y,#0X8008 ; IRQ0 vector address 
      00A049 90 BF 28         [ 2]  813 	ldw YTEMP,y ; vector address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      00A04C A6 82            [ 1]  814 	ld a,#0x82 
      00A04E 90 95            [ 1]  815 	ld yh,a 
      00A050 E6 01            [ 1]  816 	ld a,(1,x) ; isr address bits 23..16 
      00A052 90 97            [ 1]  817 	ld yl,a 
                                    818 ;  write 0x82 + most significant byte of int address	
      00A054 1D 00 06         [ 2]  819 	subw x,#3*CELLL 
      00A057 EF 04            [ 2]  820 	ldw (4,x),y 
      00A059 90 BE 28         [ 2]  821 	ldw y,YTEMP
      00A05C EF 02            [ 2]  822 	ldw (2,x),y ; vector address 
      00A05E 90 5F            [ 1]  823 	clrw y 
      00A060 FF               [ 2]  824 	ldw (x),y   ; as a double 
      00A061 CD 9D DE         [ 4]  825 	call EESTORE 
      00A064 90 93            [ 1]  826 	ldw y,x 
      00A066 90 EE 02         [ 2]  827 	ldw y,(2,y) ; bits 15..0 int vector 
      00A069 1D 00 06         [ 2]  828 	subw x,#3*CELLL 
      00A06C EF 04            [ 2]  829 	ldw (4,x),y 
      00A06E 90 BE 28         [ 2]  830 	ldw y,YTEMP 
      00A071 72 A9 00 02      [ 2]  831 	addw y,#2 
      00A075 EF 02            [ 2]  832 	ldw (2,x),y 
      00A077 90 5F            [ 1]  833 	clrw y 
      00A079 FF               [ 2]  834 	ldw (x),y 
      00A07A CD 9D DE         [ 4]  835 	call EESTORE
      00A07D 1C 00 04         [ 2]  836 	addw x,#2*CELLL  
      00A080 81               [ 4]  837 9$: ret 
                                    838 
                                    839 
                                    840 ;------------------------
                                    841 ; Compile word to flash
                                    842 ; EE, (w -- )
                                    843 ;-----------------------
      00A081 A0 27                  844 	.word LINK
                           002003   845 	LINK=.
      00A083 03                     846 	.byte 3
      00A084 45 45 2C               847 	.ascii "EE,"
      00A087                        848 EE_COMMA:
      00A087 1D 00 04         [ 2]  849 	subw x,#2*CELLL 
      00A08A 90 BE 1C         [ 2]  850 	ldw y,UCP
      00A08D 90 89            [ 2]  851 	pushw y 
      00A08F EF 02            [ 2]  852 	ldw (2,x),y 
      00A091 90 5F            [ 1]  853 	clrw y 
      00A093 FF               [ 2]  854 	ldw (x),y
      00A094 CD 9D DE         [ 4]  855 	call EESTORE
      00A097 90 85            [ 2]  856 	popw y 
      00A099 72 A9 00 02      [ 2]  857 	addw y,#2
      00A09D 90 BF 1C         [ 2]  858 	ldw UCP,y
      00A0A0 81               [ 4]  859 	ret 
                                    860 
                                    861 
                                    862 ;-------------------------
                                    863 ; Compile byte to flash 
                                    864 ; EEC, ( c -- )	
                                    865 ;-------------------------
      00A0A1 A0 83                  866 	.word LINK 
                           002023   867 	LINK=.
      00A0A3 04                     868 	.byte 4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      00A0A4 45 45 43 2C            869 	.ascii "EEC,"
      00A0A8                        870 EE_CCOMMA:
      00A0A8 1D 00 04         [ 2]  871 	subw x,#2*CELLL 
      00A0AB 90 BE 1C         [ 2]  872 	ldw y,UCP
      00A0AE 90 89            [ 2]  873 	pushw y 
      00A0B0 EF 02            [ 2]  874 	ldw (2,x),y 
      00A0B2 90 5F            [ 1]  875 	clrw y 
      00A0B4 FF               [ 2]  876 	ldw (x),y
      00A0B5 CD 9D 92         [ 4]  877 	call EECSTORE
      00A0B8 90 85            [ 2]  878 	popw y 
      00A0BA 90 5C            [ 1]  879 	incw y 
      00A0BC 90 BF 1C         [ 2]  880 	ldw UCP,y
      00A0BF 81               [ 4]  881 	ret 
                                    882 
                                    883 
                                    884 ;--------------------------
                                    885 ; copy FLASH block to ROWBUF
                                    886 ; ROW>BUF ( ud -- )
                                    887 ;--------------------------
      00A0C0 A0 A3                  888 	.word LINK 
                           002042   889 	LINK=.
      00A0C2 07                     890 	.byte 7 
      00A0C3 52 4F 57 3E 42 55 46   891 	.ascii "ROW>BUF"
      00A0CA                        892 ROW2BUF: 
      00A0CA CD 9B 54         [ 4]  893 	call FPSTOR 
      00A0CD A6 80            [ 1]  894 	ld a,#BLOCK_SIZE
      00A0CF 88               [ 1]  895 	push a 
      00A0D0 B4 38            [ 1]  896 	and a,PTR8 ; block align 
      00A0D2 B7 38            [ 1]  897 	ld PTR8,a
      00A0D4 90 AE 16 80      [ 2]  898 	ldw y,#ROWBUFF 
      00A0D8 92 BC 00 36      [ 5]  899 1$: ldf a,[FPTR]
      00A0DC 90 F7            [ 1]  900 	ld (y),a
      00A0DE CD 9C CE         [ 4]  901 	call INC_FPTR
      00A0E1 90 5C            [ 1]  902 	incw y 
      00A0E3 0A 01            [ 1]  903 	dec (1,sp)
      00A0E5 26 F1            [ 1]  904 	jrne 1$ 
      00A0E7 84               [ 1]  905 	pop a 
      00A0E8 81               [ 4]  906 	ret 
                                    907 
                                    908 
                                    909 ;---------------------------
                                    910 ; copy ROWBUFF to flash 
                                    911 ; BUF>ROW ( ud -- )
                                    912 ; ud is row address as double 
                                    913 ;---------------------------
      00A0E9 A0 C2                  914 	.word LINK 
                           00206B   915 	LINK=.
      00A0EB 07                     916 	.byte 7 
      00A0EC 42 55 46 3E 52 4F 57   917 	.ascii "BUF>ROW" 
      00A0F3                        918 BUF2ROW:
      00A0F3 CD 87 19         [ 4]  919 	call TBUF ; ( ud rb -- )
      00A0F6 CD 87 D9         [ 4]  920 	call ROT 
      00A0F9 CD 87 D9         [ 4]  921 	call ROT  ; ( rb ud -- )
      00A0FC CD 9E CC         [ 4]  922 	call write_row 
      00A0FF 81               [ 4]  923 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                                    924 
                                    925 ;---------------------------------
                                    926 ; how many byte free in that row 
                                    927 ; RFREE ( a -- n )
                                    928 ; a is least byte of target address
                                    929 ;----------------------------------
      00A100 A0 EB                  930 	.word LINK 
                           002082   931 	LINK=.
      00A102 05                     932 	.byte 5 
      00A103 52 46 52 45 45         933 	.ascii "RFREE"
      00A108                        934 RFREE:
      00A108 E6 01            [ 1]  935 	ld a,(1,x)
      00A10A A4 7F            [ 1]  936 	and a,#BLOCK_SIZE-1 
      00A10C B7 28            [ 1]  937 	ld YTEMP,a 
      00A10E A6 80            [ 1]  938 	ld a,#BLOCK_SIZE 
      00A110 B0 28            [ 1]  939 	sub a,YTEMP 
      00A112 90 5F            [ 1]  940 	clrw y 
      00A114 90 97            [ 1]  941 	ld yl,a
      00A116 FF               [ 2]  942 	ldw (x),y 
      00A117 81               [ 4]  943 	ret 
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
      00A118 A1 02                  954 	.word LINK 
                           00209A   955 	LINK=. 
      00A11A 06                     956 	.byte 6
      00A11B 52 41 4D 3E 45 45      957 	.ascii "RAM>EE"
                                    958 	
      00A121                        959 RAM2EE:
                                    960 ; copy ud on top 
      00A121 90 93            [ 1]  961 	ldw y,x 
      00A123 90 EE 06         [ 2]  962 	ldw y,(6,y) ; LSW of ud  
      00A126 90 BF 28         [ 2]  963 	ldw YTEMP,y 
      00A129 90 93            [ 1]  964 	ldw y,x 
      00A12B 90 EE 04         [ 2]  965 	ldw y,(4,y)  ; MSW of ud 
      00A12E 1D 00 04         [ 2]  966 	subw x,#2*CELLL 
      00A131 FF               [ 2]  967 	ldw (x),y 
      00A132 90 BE 28         [ 2]  968 	ldw y,YTEMP 
      00A135 EF 02            [ 2]  969 	ldw (2,x),y 
      00A137 CD A0 CA         [ 4]  970 	call ROW2BUF 
      00A13A 90 93            [ 1]  971 	ldw y,x 
      00A13C 90 EE 06         [ 2]  972 	ldw y,(6,y)
      00A13F 90 89            [ 2]  973 	pushw y ; udl 
      00A141 90 9F            [ 1]  974 	ld a,yl
      00A143 A4 7F            [ 1]  975 	and a,#BLOCK_SIZE-1 
      00A145 90 5F            [ 1]  976 	clrw y 
      00A147 90 97            [ 1]  977 	ld yl,a 
      00A149 72 A9 16 80      [ 2]  978 	addw y,#ROWBUFF 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      00A14D 1D 00 02         [ 2]  979 	subw x,#CELLL 
      00A150 FF               [ 2]  980 	ldw (x),y  
      00A151 CD 86 2E         [ 4]  981 	call SWAPP ;  ( ud a ra u -- )
      00A154 CD 85 C8         [ 4]  982 	call RFROM  
      00A157 CD A1 08         [ 4]  983 	call RFREE 
      00A15A CD 89 73         [ 4]  984 	call MIN
      00A15D CD 86 1E         [ 4]  985 	call DUPP 
      00A160 CD 85 E7         [ 4]  986 	call TOR  
      00A163 CD 8C DF         [ 4]  987 	call CMOVE
      00A166 CD A0 F3         [ 4]  988 	call BUF2ROW 
      00A169 CD 85 C8         [ 4]  989 	call RFROM 
      00A16C 81               [ 4]  990 	ret 
                                    991 
                                    992 
                                    993 ;--------------------------
                                    994 ; expand 16 bit address 
                                    995 ; to 32 bit address 
                                    996 ; FADDR ( a -- ud )
                                    997 ;--------------------------
      00A16D A1 1A                  998 	.word LINK 
                           0020EF   999 	LINK=. 
      00A16F 05                    1000 	.byte 5 
      00A170 46 41 44 44 52        1001 	.ascii "FADDR"
      00A175                       1002 FADDR:
      00A175 CC 8B A4         [ 2] 1003 	jp ZERO 
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
      00A178 A1 6F                 1019 	.word LINK 
                           0020FA  1020 	LINK=.
      00A17A 05                    1021 	.byte 5 
      00A17B 46 4D 4F 56 45        1022 	.ascii "FMOVE" 
      00A180                       1023 FMOVE:
      00A180 CD 87 2B         [ 4] 1024 	call TFLASH 
      00A183 CD 85 77         [ 4] 1025 	CALL AT 
      00A186 CD 85 2C         [ 4] 1026 	CALL QBRAN 
      00A189 A2 04                 1027 	.word no_move  
      00A18B CD 87 7A         [ 4] 1028 	call CPP
      00A18E CD 85 77         [ 4] 1029 	call AT  
      00A191 CD 86 1E         [ 4] 1030 	call DUPP ; ( udl udl -- )
      00A194 CD 87 5E         [ 4] 1031 	call CNTXT 
      00A197 CD 85 77         [ 4] 1032 	call AT 
      00A19A CD 84 F9         [ 4] 1033 	call DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      00A19D 00 02                 1034 	.word 2 
      00A19F CD 88 B3         [ 4] 1035 	call SUBB ; ( udl udl a -- )
      00A1A2 CD 86 2E         [ 4] 1036 	call SWAPP 
      00A1A5 CD A1 75         [ 4] 1037 	call FADDR 
      00A1A8 CD 87 D9         [ 4] 1038 	call ROT  ; ( udl ud a -- )
      00A1AB CD 86 1E         [ 4] 1039 	call DUPP 
      00A1AE CD 85 E7         [ 4] 1040 	call TOR    ; R: a 
      00A1B1                       1041 FMOVE2: 
      00A1B1 CD 8C 92         [ 4] 1042 	call HERE 
      00A1B4 CD 85 DB         [ 4] 1043 	call RAT 
      00A1B7 CD 88 B3         [ 4] 1044 	call SUBB ; (udl ud a wl -- )
      00A1BA                       1045 next_row:
      00A1BA CD 86 1E         [ 4] 1046 	call DUPP 
      00A1BD CD 85 E7         [ 4] 1047 	call TOR  ; ( udl ud a wl -- ) R: a wl
      00A1C0 CD A1 21         [ 4] 1048 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      00A1C3 CD 86 1E         [ 4] 1049 	call DUPP 
      00A1C6 CD 85 E7         [ 4] 1050 	call TOR
      00A1C9 CD 88 3A         [ 4] 1051 	call PLUS  ; ( udl+ ) 
      00A1CC CD 86 1E         [ 4] 1052 	call DUPP 
      00A1CF CD 8B A4         [ 4] 1053 	call ZERO   ; ( udl+ ud -- )
      00A1D2 CD 85 C8         [ 4] 1054 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      00A1D5 CD 85 C8         [ 4] 1055 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      00A1D8 CD 86 48         [ 4] 1056 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      00A1DB CD 88 B3         [ 4] 1057 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      00A1DE CD 86 1E         [ 4] 1058 	call DUPP 
      00A1E1 CD 85 2C         [ 4] 1059 	call QBRAN
      00A1E4 A1 FD                 1060 	.word fmove_done 
      00A1E6 CD 86 2E         [ 4] 1061 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      00A1E9 CD 85 C8         [ 4] 1062 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      00A1EC CD 88 3A         [ 4] 1063 	call PLUS  ; ( udl+2 ud wl- a+ )
      00A1EF CD 86 1E         [ 4] 1064 	call DUPP 
      00A1F2 CD 85 E7         [ 4] 1065 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      00A1F5 CD 86 2E         [ 4] 1066 	call SWAPP 
      00A1F8 CD 85 43         [ 4] 1067 	call BRAN
      00A1FB A1 BA                 1068 	.word next_row  
      00A1FD                       1069 fmove_done:	
      00A1FD CD 85 C8         [ 4] 1070 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      00A200 1C 00 0A         [ 2] 1071 	addw x,#5*CELLL ; (  -- cp+ ) new CP 
      00A203 81               [ 4] 1072  	ret  
      00A204                       1073 no_move:
      00A204 CD 8B A4         [ 4] 1074 	call ZERO
      00A207 81               [ 4] 1075 	ret 
                                   1076 
                                   1077 ;------------------------------------------
                                   1078 ; adjust pointers after **FMOVE** operetion.
                                   1079 ; UPDAT-PTR ( cp+ -- )
                                   1080 ; cp+ is new CP position after FMOVE 
                                   1081 ;-------------------------------------------
      00A208 A1 7A                 1082 	.word LINK 
                           00218A  1083 	LINK=.
      00A20A 09                    1084 	.byte 9
      00A20B 55 50 44 41 54 2D 50  1085 	.ascii "UPDAT-PTR" 
             54 52
      00A214                       1086 UPDATPTR:
                                   1087 ;reset VP to previous position  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      00A214 CD 9B CE         [ 4] 1088 	call EEPVP 
      00A217 CD 86 14         [ 4] 1089 	call DROP 
      00A21A CD 85 77         [ 4] 1090 	call AT
      00A21D CD 87 6C         [ 4] 1091 	call VPP 
      00A220 CD 85 60         [ 4] 1092 	call STORE
                                   1093 ;update CONTEXT and LAST 
      00A223 CD 9B B8         [ 4] 1094 	call EEPCP 
      00A226 CD 86 14         [ 4] 1095 	call DROP
      00A229 CD 85 77         [ 4] 1096 	call AT
      00A22C CD 84 F9         [ 4] 1097 	call DOLIT 
      00A22F 00 02                 1098 	.word 2 
      00A231 CD 88 3A         [ 4] 1099 	call PLUS 
      00A234 CD 86 1E         [ 4] 1100 	call DUPP 
      00A237 CD 87 5E         [ 4] 1101 	call CNTXT 
      00A23A CD 85 60         [ 4] 1102 	call STORE
      00A23D CD 87 8A         [ 4] 1103 	call LAST
      00A240 CD 85 60         [ 4] 1104 	call STORE 
      00A243 CD 9B E8         [ 4] 1105 	call UPDATLAST 
                                   1106 ;update CP 
      00A246 CD 87 7A         [ 4] 1107 	call CPP 
      00A249 CD 85 60         [ 4] 1108 	call STORE
      00A24C CD 9C 11         [ 4] 1109 	call UPDATCP 
      00A24F 81               [ 4] 1110 	ret 
                                   1111 
                                   1112 ;-----------------------------
                                   1113 ; move interrupt sub-routine
                                   1114 ; in flash memory
                                   1115 ;----------------------------- 
      00A250 A2 0A                 1116 	.word LINK 
                           0021D2  1117 	LINK=. 
      00A252 06                    1118 	.byte 6
      00A253 49 46 4D 4F 56 45     1119 	.ascii "IFMOVE" 
      00A259                       1120 IFMOVE:
      00A259 CD 87 2B         [ 4] 1121 	call TFLASH 
      00A25C CD 85 77         [ 4] 1122 	CALL AT 
      00A25F CD 85 2C         [ 4] 1123 	CALL QBRAN 
      00A262 A2 04                 1124 	.word no_move 
      00A264 CD 87 7A         [ 4] 1125 	call CPP 
      00A267 CD 85 77         [ 4] 1126 	call AT 
      00A26A CD 86 1E         [ 4] 1127 	call DUPP ; ( udl udl -- )
      00A26D CD 9B CE         [ 4] 1128 	call EEPVP 
      00A270 CD 86 14         [ 4] 1129 	call DROP
      00A273 CD 85 77         [ 4] 1130 	call AT  ; ( udl udl a )
      00A276 CD 85 E7         [ 4] 1131 	call TOR 
      00A279 CD A1 75         [ 4] 1132 	call FADDR
      00A27C CD 85 DB         [ 4] 1133 	call RAT ; ( udl ud a -- ) R: a 
      00A27F CC A1 B1         [ 2] 1134 	jp FMOVE2 
                                   1135 
                                   1136 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



                           000001  4752 .if WANT_SCALING_CONST 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                                   4753         .include "const_ratio.asm"
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
      00A282 A2 52                   31         .word LINK 
                           002204    32         LINK=.
      00A284 02                      33         .byte 2
      00A285 50 49                   34         .ascii "PI" 
      00A287                         35 PII:
      00A287 1D 00 04         [ 2]   36         subw x,#2*CELLL 
      00A28A 90 AE 01 63      [ 2]   37         ldw y,#355 
      00A28E EF 02            [ 2]   38         ldw (2,x),y 
      00A290 90 AE 00 71      [ 2]   39         ldw y,#113 
      00A294 FF               [ 2]   40         ldw (x),y 
      00A295 81               [ 4]   41         ret 
                                     42 
                                     43 ;      SQRT2 ( -- 19601  13860 )
                                     44 ; precision: 1.5e-9 
                                     45 ; usage example to compute Voltage peek to peek from Vrms 
                                     46 ; : VPP SQRT2 */ 2 * ;
                                     47 ;
      00A296 A2 84                   48         .word LINK 
                           002218    49         LINK=.
      00A298 05                      50         .byte 5 
      00A299 53 51 52 54 32          51         .ascii "SQRT2" 
      00A29E                         52 SQRT2:
      00A29E 1D 00 04         [ 2]   53         subw x,#2*CELLL 
      00A2A1 90 AE 4C 91      [ 2]   54         ldw y,#19601 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      00A2A5 EF 02            [ 2]   55         ldw (2,x),y 
      00A2A7 90 AE 36 24      [ 2]   56         ldw y,#13860 
      00A2AB FF               [ 2]   57         ldw (x),y 
      00A2AC 81               [ 4]   58         ret 
                                     59 
                                     60 ;   SQRT3 ( -- 18817 10864 )
                                     61 ; precision: 1.1e-9
                                     62 ;
      00A2AD A2 98                   63         .word LINK 
                           00222F    64         LINK=.
      00A2AF 05                      65         .byte 5
      00A2B0 53 51 52 54 33          66         .ascii "SQRT3" 
      00A2B5                         67 SQRT3: 
      00A2B5 1D 00 04         [ 2]   68     subw x,#2*CELLL 
      00A2B8 90 AE 49 81      [ 2]   69     ldw y,#18817 
      00A2BC EF 02            [ 2]   70     ldw (2,x),y 
      00A2BE 90 AE 2A 70      [ 2]   71     ldw y,#10864 
      00A2C2 FF               [ 2]   72     ldw (x),y 
      00A2C3 81               [ 4]   73     ret 
                                     74 
                                     75 ;   E ( -- 28667 10546 )
                                     76 ; precision: 5.5e-9 
                                     77 ; natural log base 
      00A2C4 A2 AF                   78         .word LINK 
                           002246    79         LINK=.
      00A2C6 01                      80         .byte 1
      00A2C7 45                      81         .ascii "E" 
      00A2C8                         82 ENEPER:
      00A2C8 1D 00 04         [ 2]   83     subw x,#2*CELLL 
      00A2CB 90 AE 6F FB      [ 2]   84     ldw y,#28667 
      00A2CF EF 02            [ 2]   85     ldw (2,x),y 
      00A2D1 90 AE 29 32      [ 2]   86     ldw y,#10546 
      00A2D5 FF               [ 2]   87     ldw (x),y 
      00A2D6 81               [ 4]   88     ret 
                                     89 
                                     90 ;   SQRT10 ( -- 22936 7253 )
                                     91 ; precision: 5.7e-9 
      00A2D7 A2 C6                   92         .word LINK 
                           002259    93         LINK=.
      00A2D9 06                      94         .byte 6 
      00A2DA 53 51 52 54 31 30       95         .ascii "SQRT10" 
      00A2E0                         96 SQRT10:
      00A2E0 1D 00 04         [ 2]   97     subw x,#2*CELLL
      00A2E3 90 AE 59 98      [ 2]   98     ldw y,#22936 
      00A2E7 EF 02            [ 2]   99     ldw (2,x),y 
      00A2E9 90 AE 1C 55      [ 2]  100     ldw y,#7253
      00A2ED FF               [ 2]  101     ldw (x),y 
      00A2EE 81               [ 4]  102     ret 
                                    103 
                                    104 ;   12RT2 ( -- 26797 25293 )
                                    105 ; precision: 1.0e-9 
                                    106 ; used in music to compute well tempered scale
      00A2EF A2 D9                  107         .word LINK 
                           002271   108         LINK=. 
      00A2F1 05                     109         .byte 5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      00A2F2 31 32 52 54 32         110         .ascii "12RT2"
      00A2F7                        111 RT12_2:
      00A2F7 1D 00 04         [ 2]  112     subw x,#2*CELLL 
      00A2FA 90 AE 68 AD      [ 2]  113     ldw y,#26797
      00A2FE EF 02            [ 2]  114     ldw (2,x),y 
      00A300 90 AE 62 CD      [ 2]  115     ldw y,#25293
      00A304 FF               [ 2]  116     ldw (x),y 
      00A305 81               [ 4]  117     ret 
                                    118 
                                    119 ;   LOG2s ( -- 2040 11103 )
                                    120 ; log(2)/1.6384
                                    121 ; precision: 1.1e-8
      00A306 A2 F1                  122         .word LINK 
                           002288   123         LINK=.
      00A308 05                     124         .byte 5 
      00A309 4C 4F 47 32 53         125         .ascii "LOG2S" 
      00A30E                        126 LOG2S:
      00A30E 1D 00 04         [ 2]  127     subw x,#2*CELLL
      00A311 90 AE 07 F8      [ 2]  128     ldw y,#2040 
      00A315 EF 02            [ 2]  129     ldw (2,x),y 
      00A317 90 AE 2B 5F      [ 2]  130     ldw y,#11103 
      00A31B FF               [ 2]  131     ldw (x),y 
      00A31C 81               [ 4]  132     ret 
                                    133 
                                    134 ;   LN2 ( -- 485 11464 )
                                    135 ; ln(2)/16.384 
                                    136 ; precision: 1.0e-7 
      00A31D A3 08                  137         .word LINK 
                           00229F   138         LINK=.
      00A31F 04                     139         .byte 4 
      00A320 4C 4E 32 53            140         .ascii "LN2S" 
      00A324                        141 LN2S: 
      00A324 1D 00 04         [ 2]  142     subw x,#2*CELLL
      00A327 90 AE 01 E5      [ 2]  143     ldw y,#485
      00A32B EF 02            [ 2]  144     ldw (2,x),y 
      00A32D 90 AE 2C C8      [ 2]  145     ldw y,#11464 
      00A331 FF               [ 2]  146     ldw (x),y 
      00A332 81               [ 4]  147     ret 
                                    148 
                                    149 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



                                   4754 .endif
                           000001  4755 .if WANT_CONST_TABLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



                                   4756         .include "ctable.asm"
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
      00A333 A3 1F                   32     .word LINK 
                           0022B5    33     LINK=.
      00A335 06                      34     .byte 6
      00A336 43 41 4C 4C 4F 54       35     .ascii "CALLOT"
      00A33C                         36 CALLOT:
      00A33C CD 87 7A         [ 4]   37     CALL CPP
      00A33F CD 86 1E         [ 4]   38     CALL DUPP 
      00A342 CD 85 77         [ 4]   39     CALL AT 
      00A345 CD 85 E7         [ 4]   40     CALL TOR 
      00A348 CD 8C 14         [ 4]   41     CALL PSTOR 
      00A34B CD 9C 11         [ 4]   42     CALL UPDATCP 
      00A34E CD 85 C8         [ 4]   43     CALL RFROM
      00A351 CC 8B A4         [ 2]   44     JP ZERO 
                                     45 
                                     46 ;------------------------------
                                     47 ; create constants bytes table 
                                     48 ; in persistant memory
                                     49 ;  CTABLE ( n+ -- ad ; <string> )
                                     50 ; n+ bytes reserved 
                                     51 ;-----------------------------
      00A354 A3 35                   52     .word LINK 
                           0022D6    53     LINK=.
      00A356 06                      54     .byte 6
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      00A357 43 54 41 42 4C 45       55     .ascii "CTABLE"
      00A35D                         56 CTABLE:
      00A35D CD A3 3C         [ 4]   57     CALL CALLOT     
      00A360 CC 99 0A         [ 2]   58     JP DCONST 
                                     59      
                                     60 
                                     61 ;--------------------------------
                                     62 ; create constants words table 
                                     63 ; in persistant memory 
                                     64 ; WTABLE ( n+ -- ad ; <string> )
                                     65 ; n+  words reserved  
                                     66 ;--------------------------------
      00A363 A3 56                   67     .word LINK 
                           0022E5    68     LINK=.
      00A365 06                      69     .byte 6
      00A366 57 54 41 42 4C 45       70     .ascii "WTABLE"
      00A36C                         71 WTABLE:
      00A36C CD 8B 2B         [ 4]   72     CALL CELLS  
      00A36F CD A3 3C         [ 4]   73     CALL CALLOT 
      00A372 CC 99 0A         [ 2]   74     JP DCONST 
                                     75 
                                     76 ;---------------------------------
                                     77 ; stack an element of CTABLE 
                                     78 ; CTABL@ ( u ad -- c )
                                     79 ; u element order {0..size-1}
                                     80 ; a|ad table address 
                                     81 ;--------------------------------
      00A375 A3 65                   82     .word LINK 
                           0022F7    83     LINK=.
      00A377 06                      84     .byte 6
      00A378 43 54 41 42 4C 40       85     .ascii "CTABL@" 
      00A37E                         86 CTAT:
      00A37E CD 9B 54         [ 4]   87     call FPSTOR 
      00A381 CD 9C E6         [ 4]   88     call PTRPLUS 
      00A384 CC 9D 23         [ 2]   89     jp EE_CREAD 
                                     90 
                                     91 ;---------------------------------
                                     92 ; stack an element of WTABLE 
                                     93 ; WTABL@ ( u ud -- w )
                                     94 ; u is element order {0..size-1}
                                     95 ; a|ud table address 
                                     96 ;----------------------------------
      00A387 A3 77                   97     .word LINK 
                           002309    98     LINK=.
      00A389 06                      99     .byte 6
      00A38A 57 54 41 42 4C 40      100     .ascii "WTABL@" 
      00A390                        101 WTAT:
      00A390 CD 9B 54         [ 4]  102     call FPSTOR 
      00A393 CD 8B 2B         [ 4]  103     call CELLS 
      00A396 CD 9C E6         [ 4]  104     call PTRPLUS 
      00A399 CD 9D 01         [ 4]  105     call EE_READ 
      00A39C 81               [ 4]  106     ret 
                                    107 
                                    108 ;--------------------------
                                    109 ; tool to initialize character table 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



                                    110 ; CTINIT ( ad -- )
                                    111 ; ad is table address 
                                    112 ;--------------------------
      00A39D A3 89                  113     .word LINK 
                           00231F   114     LINK=.
      00A39F 06                     115     .byte 6 
      00A3A0 43 54 49 4E 49 54      116     .ascii "CTINIT"
      00A3A6                        117 CTINIT:
      00A3A6 CD 9B 54         [ 4]  118     CALL FPSTOR
      00A3A9 CD 9C 92         [ 4]  119     CALL UNLOCK
      00A3AC CD 8B A4         [ 4]  120     CALL ZERO 
      00A3AF CD 8B 38         [ 4]  121 1$: CALL ONEP 
      00A3B2 CD 86 1E         [ 4]  122     CALL DUPP 
      00A3B5 CD A4 02         [ 4]  123     CALL INTQ 
      00A3B8 CD 85 2C         [ 4]  124     CALL QBRAN 
      00A3BB A3 C5                  125     .word 2$
      00A3BD CD 9D 3D         [ 4]  126     call WR_BYTE 
      00A3C0 CD 85 43         [ 4]  127     CALL BRAN 
      00A3C3 A3 AF                  128     .word 1$ 
      00A3C5 CD 88 1A         [ 4]  129 2$: CALL DDROP 
      00A3C8 CD 9C BA         [ 4]  130     CALL LOCK 
      00A3CB 81               [ 4]  131     ret 
                                    132 
                                    133 ;--------------------------
                                    134 ; tool to initialize word table 
                                    135 ; WTINIT ( ad -- )
                                    136 ; ad is table address 
                                    137 ;--------------------------
      00A3CC A3 9F                  138     .word LINK 
                           00234E   139     LINK=.
      00A3CE 06                     140     .byte 6 
      00A3CF 57 54 49 4E 49 54      141     .ascii "WTINIT"
      00A3D5                        142 WTINIT:
      00A3D5 CD 9B 54         [ 4]  143     CALL FPSTOR
      00A3D8 CD 9C 92         [ 4]  144     CALL UNLOCK
      00A3DB CD 8B A4         [ 4]  145     CALL ZERO 
      00A3DE CD 8B 38         [ 4]  146 1$: CALL ONEP 
      00A3E1 CD 86 1E         [ 4]  147     CALL DUPP
      00A3E4 CD A4 02         [ 4]  148     CALL INTQ
      00A3E7 CD 85 2C         [ 4]  149     CALL QBRAN 
      00A3EA A3 F4                  150     .word 2$
      00A3EC CD 9D 62         [ 4]  151     call WR_WORD 
      00A3EF CD 85 43         [ 4]  152     CALL BRAN 
      00A3F2 A3 DE                  153     .word 1$ 
      00A3F4 CD 88 1A         [ 4]  154 2$: CALL DDROP 
      00A3F7 CD 9C BA         [ 4]  155     CALL LOCK 
      00A3FA 81               [ 4]  156     ret 
                                    157 
                                    158 ;------------------------
                                    159 ; Prompted input for integer 
                                    160 ; display n+ in bracket and
                                    161 ; '?' 
                                    162 ; [N]? ( n+ -- a )
                                    163 ;------------------------
      00A3FB A3 CE                  164     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



                           00237D   165     LINK=.
      00A3FD 04                     166     .byte 4
      00A3FE 5B 4E 5D 3F            167     .ascii "[N]?" 
      00A402                        168 INTQ:
      00A402 CD 8F 33         [ 4]  169     CALL CR 
      00A405 CD 84 F9         [ 4]  170     call DOLIT 
      00A408 00 5B                  171     .word '[
      00A40A CD 84 B8         [ 4]  172     CALL EMIT 
      00A40D CD 8F EC         [ 4]  173     CALL DOT 
      00A410 CD 8F 72         [ 4]  174     CALL  DOTQP
      00A413 03                     175     .byte 3
      00A414 5D 3F 20               176     .ascii "]? " 
      00A417 CD 93 7B         [ 4]  177     CALL QUERY 
      00A41A CD 91 A6         [ 4]  178     call TOKEN 
      00A41D CC A4 2A         [ 2]  179     jp NUMBQ
                                    180 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



                                   4757 .endif
                           000001  4758 .if WANT_DOUBLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



                                   4759         .include "double.asm"
                                      1 ;************************************
                                      2 ;    doubles integers library 
                                      3 ;    doubles are signed 32 bits 
                                      4 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      5 
                                      6     .module DOUBLE 
                                      7 
                                      8 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      9 ;   NUMBER? (a -- s|d T | a F )
                                     10 ;   convert string to integer 
                                     11 ;   double begin with '!' 
                                     12 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0023A0                         13     _HEADER NUMBQ,7,"NUMBER?"
      00A420 A3 FD                    1         .word LINK 
                           0023A2     2         LINK=.
      00A422 07                       3         .byte 7  
      00A423 4E 55 4D 42 45 52 3F     4         .ascii "NUMBER?"
      00A42A                          5         NUMBQ:
                                     14 ; save current base value 
      00A42A CD 86 DB         [ 4]   15     CALL BASE 
      00A42D CD 85 77         [ 4]   16     CALL AT 
      00A430 CD 85 E7         [ 4]   17     CALL TOR 
                                     18 ; initialize integer to 0     
      00A433 1D 00 04         [ 2]   19     SUBW X,#4 
      00A436 90 5F            [ 1]   20     CLRW Y 
      00A438 FF               [ 2]   21     LDW (X),Y 
      00A439 EF 02            [ 2]   22     LDW (2,X),Y ; a 0 0 R: base  
      0023BB                         23     _DOLIT 2 
      00A43B CD 84 F9         [ 4]    1     CALL DOLIT 
      00A43E 00 02                    2     .word 2 
      00A440 CD 8B FD         [ 4]   24     CALL PICK  ; a 0 0 a R: base    
      00A443 CD 8C 7B         [ 4]   25     CALL COUNT ; a 0 0 a+ n 
                                     26 ; check for '!' double integer 
      00A446 CD 86 48         [ 4]   27     CALL OVER  ; a 0 0 a+ n a+
      00A449 CD 85 95         [ 4]   28     CALL CAT   ; a 0 0 a+ n c 
      0023CC                         29     _DOLIT '!' ; a 0 0 a+ n c '!' 
      00A44C CD 84 F9         [ 4]    1     CALL DOLIT 
      00A44F 00 21                    2     .word '!' 
      00A451 CD 88 DB         [ 4]   30     CALL EQUAL 
      00A454 CD 85 E7         [ 4]   31     CALL TOR   ; a 0 0 a+ n R: base d? 
      00A457 CD 85 DB         [ 4]   32     CALL RAT   ; a 0 0 a+ n d? R: base d?
      0023DA                         33     _QBRAN NUMQ0
      00A45A CD 85 2C         [ 4]    1     CALL QBRAN
      00A45D A4 6B                    2     .word NUMQ0
                                     34 ; update a and count
      00A45F CD 86 2E         [ 4]   35     CALL SWAPP 
      00A462 CD 8B 38         [ 4]   36     CALL ONEP 
      00A465 CD 86 2E         [ 4]   37     CALL SWAPP 
      00A468 CD 8B 45         [ 4]   38     CALL ONEM  ; a 0 0 a+ n- R: base d?
                                     39 ; check for '$' hexadecimal  
      00A46B                         40 NUMQ0: 
      00A46B CD 86 48         [ 4]   41     CALL OVER   
      00A46E CD 85 95         [ 4]   42     CALL CAT   
      0023F1                         43     _DOLIT '$'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      00A471 CD 84 F9         [ 4]    1     CALL DOLIT 
      00A474 00 24                    2     .word '$' 
      00A476 CD 88 DB         [ 4]   44     CALL EQUAL ; a 0 0 a+ n- f  
      0023F9                         45     _QBRAN NUMQ1 
      00A479 CD 85 2C         [ 4]    1     CALL QBRAN
      00A47C A4 8D                    2     .word NUMQ1
      00A47E CD 8E 4A         [ 4]   46     CALL HEX   ; switch to hexadecimal base 
                                     47 ; update a and count 
      00A481 CD 86 2E         [ 4]   48     CALL SWAPP 
      00A484 CD 8B 38         [ 4]   49     CALL ONEP 
      00A487 CD 86 2E         [ 4]   50     CALL SWAPP
      00A48A CD 8B 45         [ 4]   51     CALL ONEM ; a 0 0 a+ n-  R: base d?
                                     52 ; check for minus sign 
      00A48D                         53 NUMQ1:    
      00A48D CD 86 48         [ 4]   54     CALL OVER 
      00A490 CD 85 95         [ 4]   55     CALL CAT   
      002413                         56     _DOLIT '-' 
      00A493 CD 84 F9         [ 4]    1     CALL DOLIT 
      00A496 00 2D                    2     .word '-' 
      00A498 CD 88 DB         [ 4]   57     CALL EQUAL 
      00A49B CD 85 E7         [ 4]   58     CALL TOR ; R: base d? sign  
                                     59 ; update a and n, if sign==0 no change  
      00A49E CD 85 DB         [ 4]   60     CALL RAT   
      00A4A1 CD 88 3A         [ 4]   61     CALL PLUS  
      00A4A4 CD 86 2E         [ 4]   62     CALL SWAPP 
      00A4A7 CD 85 DB         [ 4]   63     CALL RAT 
      00A4AA CD 88 B3         [ 4]   64     CALL SUBB  
      00A4AD CD 86 2E         [ 4]   65     CALL SWAPP 
                                     66 ; check for end of string     
      00A4B0 CD 87 C8         [ 4]   67     CALL QDUP    ; count==0?
      002433                         68     _QBRAN NUMQ6 ; yes , not a number 
      00A4B3 CD 85 2C         [ 4]    1     CALL QBRAN
      00A4B6 A5 34                    2     .word NUMQ6
                                     69 ; initialize loop counter 
      00A4B8 CD 8B 45         [ 4]   70     CALL ONEM    ; n-1 
      00A4BB CD 85 E7         [ 4]   71     CALL TOR     ; loop counter 
                                     72 ; parse digits loop 
      00A4BE                         73 NUMQ2:   ; a dlo dhi a+ R: base d? sign cntr  
      00A4BE CD 86 1E         [ 4]   74     CALL DUPP 
      00A4C1 CD 85 E7         [ 4]   75     CALL TOR   ; a dlo dhi a+ R: base d? sign cntr a+ 
      00A4C4 CD 85 95         [ 4]   76     CALL CAT 
      00A4C7 CD 86 DB         [ 4]   77     CALL BASE 
      00A4CA CD 85 77         [ 4]   78     CALL AT 
      00A4CD CD 8E 73         [ 4]   79     CALL DIGTQ  ; a dlo dhi u f R: base d? sign cntr a+  
      002450                         80     _QBRAN NUMQ4 ; not digit  
      00A4D0 CD 85 2C         [ 4]    1     CALL QBRAN
      00A4D3 A5 24                    2     .word NUMQ4
      00A4D5 CD 85 E7         [ 4]   81     CALL TOR    ; a dlo dhi R: base d? sign cntr a+ digit   
      00A4D8 CD 86 DB         [ 4]   82     CALL BASE 
      00A4DB CD 85 77         [ 4]   83     CALL AT 
      00A4DE CD A6 69         [ 4]   84     CALL DSSTAR 
      00A4E1 CD 85 C8         [ 4]   85     CALL RFROM 
      00A4E4 CD 8B A4         [ 4]   86     CALL ZERO 
      00A4E7 CD A9 85         [ 4]   87     CALL DPLUS  
      00A4EA CD 85 C8         [ 4]   88     CALL RFROM  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      00A4ED CD 8B 38         [ 4]   89     CALL ONEP    ; a dlo dhi a+ R: base d? sign cntr 
      002470                         90     _DONXT NUMQ2 
      00A4F0 CD 85 0D         [ 4]    1     CALL DONXT 
      00A4F3 A4 BE                    2     .word NUMQ2 
      00A4F5 CD 86 14         [ 4]   91     CALL DROP   ; a dlo dhi R: base d? sign 
      00A4F8 CD 85 C8         [ 4]   92     CALL RFROM  
      00247B                         93     _QBRAN NUMQ3
      00A4FB CD 85 2C         [ 4]    1     CALL QBRAN
      00A4FE A5 03                    2     .word NUMQ3
      00A500 CD 88 77         [ 4]   94     CALL DNEGA
      00A503                         95 NUMQ3: 
      00A503 CD 87 D9         [ 4]   96     CALL ROT ; dlo dhi a  R: base d?
      00A506 CD 86 14         [ 4]   97     CALL DROP 
      002489                         98     _DOLIT -1 
      00A509 CD 84 F9         [ 4]    1     CALL DOLIT 
      00A50C FF FF                    2     .word -1 
      00A50E CD 85 C8         [ 4]   99     CALL RFROM ; dlo dhi -1 d? R: base 
      00A511 CD 88 54         [ 4]  100     CALL INVER 
      002494                        101     _QBRAN NUMQ8 
      00A514 CD 85 2C         [ 4]    1     CALL QBRAN
      00A517 A5 39                    2     .word NUMQ8
      00A519 CD 86 2E         [ 4]  102     CALL SWAPP 
      00A51C CD 86 14         [ 4]  103     CALL DROP 
      00249F                        104     _BRAN NUMQ8 
      00A51F CD 85 43         [ 4]    1     CALL BRAN 
      00A522 A5 39                    2     .word NUMQ8 
      00A524                        105 NUMQ4: ; 'u' not digit error , ( a dlo dhi u R: base d? sign cntr a+ )
      00A524 1C 00 04         [ 2]  106     ADDW X,#4 ; drop dhi u, ( a dlo R: base d? sign cntr a+ ) 
      00A527 5B 08            [ 2]  107     ADDW SP,#8 ; drop d? sign cntr a+  R: base 
      00A529 90 5F            [ 1]  108     CLRW Y 
      00A52B FF               [ 2]  109     LDW (X),Y ; dlo replaced by 0 ( -- a 0 R: base ) 
      0024AC                        110     _BRAN NUMQ8 
      00A52C CD 85 43         [ 4]    1     CALL BRAN 
      00A52F A5 39                    2     .word NUMQ8 
      00A531                        111 NUMQ5: 
      00A531 CD 86 1E         [ 4]  112     CALL DUPP  ; a 0 dlo dlo 
                                    113 ; no digits error 
      00A534                        114 NUMQ6: ;   a 0 0 a+ R: base d? sign 
      00A534 1C 00 04         [ 2]  115     ADDW X,#4 ; a 0 R: base d? sign 
      00A537 5B 04            [ 2]  116     ADDW SP,#4  ; a 0 R: base 
                                    117 ; restore original base value     
      00A539                        118 NUMQ8: 
      00A539 CD 85 C8         [ 4]  119     CALL RFROM 
      00A53C CD 86 DB         [ 4]  120     CALL BASE 
      00A53F CD 85 60         [ 4]  121     CALL STORE 
      00A542 81               [ 4]  122     RET 
                                    123 
                                    124 
                                    125 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    126 ;    D0= ( d -- 0|-1 )
                                    127 ;    check if double is 0 
                                    128 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0024C3                        129     _HEADER DZEQUAL,3,"D0="
      00A543 A4 22                    1         .word LINK 
                           0024C5     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00A545 03                       3         .byte 3  
      00A546 44 30 3D                 4         .ascii "D0="
      00A549                          5         DZEQUAL:
      00A549 CD 86 7E         [ 4]  130     CALL ORR 
      00A54C A6 FF            [ 1]  131     LD A,#0xFF
      00A54E 90 93            [ 1]  132     LDW Y,X
      00A550 90 FE            [ 2]  133     LDW Y,(Y)
      00A552 90 A3 00 00      [ 2]  134     CPW Y,#0 
      00A556 27 01            [ 1]  135     JREQ  ZEQ1
      00A558 4F               [ 1]  136     CLR A   ;false
      00A559                        137 ZEQ1:
      00A559 F7               [ 1]  138     LD     (X),A
      00A55A E7 01            [ 1]  139     LD (1,X),A
      00A55C 81               [ 4]  140 	RET     
                                    141     
                                    142 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    143 ;  DNEGATE ( d -- d )
                                    144 ;  negate double (2's complement)
                                    145 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0024DD                        146     _HEADER DNEGAT,7,"DNEGATE"
      00A55D A5 45                    1         .word LINK 
                           0024DF     2         LINK=.
      00A55F 07                       3         .byte 7  
      00A560 44 4E 45 47 41 54 45     4         .ascii "DNEGATE"
      00A567                          5         DNEGAT:
      00A567 CD 88 54         [ 4]  147     CALL INVER
      00A56A CD 86 2E         [ 4]  148     CALL SWAPP 
      00A56D CD 88 54         [ 4]  149     CALL INVER 
      00A570 90 93            [ 1]  150     LDW  Y,X 
      00A572 90 FE            [ 2]  151     LDW Y,(Y)
      00A574 72 A9 00 01      [ 2]  152     ADDW Y,#1 
      00A578 FF               [ 2]  153     LDW (X),Y 
      00A579 24 0B            [ 1]  154     JRNC DNEG1 
      00A57B 90 93            [ 1]  155     LDW Y,X 
      00A57D 90 EE 02         [ 2]  156     LDW Y,(2,Y)
      00A580 72 A9 00 01      [ 2]  157     ADDW Y,#1
      00A584 EF 02            [ 2]  158     LDW (2,X),Y 
      00A586                        159 DNEG1:
      00A586 CD 86 2E         [ 4]  160     CALL SWAPP 
      00A589 81               [ 4]  161     RET      
                                    162 
                                    163 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    164 ;   DABS ( d -- d )
                                    165 ;   absolute value of double
                                    166 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00250A                        167     _HEADER DABS,4,"DABS"
      00A58A A5 5F                    1         .word LINK 
                           00250C     2         LINK=.
      00A58C 04                       3         .byte 4  
      00A58D 44 41 42 53              4         .ascii "DABS"
      00A591                          5         DABS:
      00A591 CD 86 1E         [ 4]  168     CALL DUPP 
      00A594 CD 86 57         [ 4]  169     CALL ZLESS 
      002517                        170     _QBRAN DABS1 
      00A597 CD 85 2C         [ 4]    1     CALL QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      00A59A A5 9F                    2     .word DABS1
      00A59C CD 88 77         [ 4]  171     CALL DNEGA 
      00A59F                        172 DABS1:
      00A59F 81               [ 4]  173     RET 
                                    174 
                                    175 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    176 ;  DSIGN ( d -- d f )
                                    177 ;  sign of double 
                                    178 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002520                        179     _HEADER DSIGN,5,"DSIGN"
      00A5A0 A5 8C                    1         .word LINK 
                           002522     2         LINK=.
      00A5A2 05                       3         .byte 5  
      00A5A3 44 53 49 47 4E           4         .ascii "DSIGN"
      00A5A8                          5         DSIGN:
      00A5A8 A6 00            [ 1]  180     LD A,#0 
      00A5AA 90 93            [ 1]  181     LDW Y,X 
      00A5AC 90 FE            [ 2]  182     LDW Y,(Y)
      00A5AE 2A 02            [ 1]  183     JRPL DSIGN1
      00A5B0 A6 FF            [ 1]  184     LD A,#0XFF 
      00A5B2                        185 DSIGN1:
      00A5B2 1D 00 02         [ 2]  186     SUBW X,#2 
      00A5B5 F7               [ 1]  187     LD (X),A 
      00A5B6 E7 01            [ 1]  188     LD (1,X),A 
      00A5B8 81               [ 4]  189     RET 
                                    190 
                                    191 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    192 ;   D/MOD ( d s - r qd )
                                    193 ;   unsigned divide double by single 
                                    194 ;   return double quotient 
                                    195 ;   and single remainder 
                                    196 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002539                        197     _HEADER DSLMOD,5,"D/MOD"
      00A5B9 A5 A2                    1         .word LINK 
                           00253B     2         LINK=.
      00A5BB 05                       3         .byte 5  
      00A5BC 44 2F 4D 4F 44           4         .ascii "D/MOD"
      00A5C1                          5         DSLMOD:
      00A5C1 90 93            [ 1]  198         LDW     Y,X             ; stack pointer to Y
      00A5C3 FE               [ 2]  199         LDW     X,(X)           ; un
      00A5C4 BF 28            [ 2]  200         LDW     YTEMP,X         ; save un
      00A5C6 93               [ 1]  201         LDW     X,Y
      00A5C7 89               [ 2]  202         PUSHW   X               ; save stack pointer
      00A5C8 90 89            [ 2]  203         PUSHW   Y 
      00A5CA EE 02            [ 2]  204         LDW     X,(2,X)           ; X=udh
      00A5CC 90 BE 28         [ 2]  205         LDW     Y,YTEMP         ; divisor 
      00A5CF 65               [ 2]  206         DIVW    X,Y 
      00A5D0 BF 26            [ 2]  207         LDW     XTEMP,X         ; QUOTIENT hi 
      00A5D2 93               [ 1]  208         LDW     X,Y             ; remainder in X 
      00A5D3 90 85            [ 2]  209         POPW    Y 
      00A5D5 90 EE 04         [ 2]  210         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      00A5D8 A6 10            [ 1]  211         LD      A,#16           ; loop count
      00A5DA 90 58            [ 2]  212         SLLW    Y               ; udl shift udl into udh
      00A5DC                        213 DSLMOD3:
      00A5DC 59               [ 2]  214         RLCW    X               ; rotate udl bit into uhdh (= remainder)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00A5DD 25 04            [ 1]  215         JRC     DSLMODa         ; if carry out of rotate
      00A5DF B3 28            [ 2]  216         CPW     X,YTEMP         ; compare udh to un
      00A5E1 25 05            [ 1]  217         JRULT   DSLMOD4         ; can't subtract
      00A5E3                        218 DSLMODa:
      00A5E3 72 B0 00 28      [ 2]  219         SUBW    X,YTEMP         ; can subtract
      00A5E7 98               [ 1]  220         RCF
      00A5E8                        221 DSLMOD4:
      00A5E8 8C               [ 1]  222         CCF                     ; quotient bit
      00A5E9 90 59            [ 2]  223         RLCW    Y               ; rotate into quotient, rotate out udl
      00A5EB 4A               [ 1]  224         DEC     A               ; repeat
      00A5EC 26 EE            [ 1]  225         JRNE    DSLMOD3           ; if A == 0
      00A5EE                        226 DSLMODb:
      00A5EE BF 28            [ 2]  227         LDW     YTEMP,X         ; done, save remainder
      00A5F0 85               [ 2]  228         POPW    X               ; restore stack pointer
      00A5F1 EF 02            [ 2]  229         LDW     (2,X),Y           ; save quotient low 
      00A5F3 90 BE 26         [ 2]  230         LDW     Y,XTEMP         ; quotient hi 
      00A5F6 FF               [ 2]  231         LDW     (X),Y           ; save quotient hi 
      00A5F7 90 BE 28         [ 2]  232         LDW     Y,YTEMP         ; remainder onto stack
      00A5FA EF 04            [ 2]  233         LDW     (4,X),Y
      00A5FC 81               [ 4]  234         RET 
                                    235 
                                    236 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    237 ;   D# ( d -- d )
                                    238 ;   extract least digit 
                                    239 ;   from double integer 
                                    240 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00257D                        241     _HEADER DDIG,2,"D#"
      00A5FD A5 BB                    1         .word LINK 
                           00257F     2         LINK=.
      00A5FF 02                       3         .byte 2  
      00A600 44 23                    4         .ascii "D#"
      00A602                          5         DDIG:
      00A602 CD 86 DB         [ 4]  242     CALL BASE 
      00A605 CD 85 77         [ 4]  243     CALL AT 
      00A608 CD A5 C1         [ 4]  244     CALL DSLMOD
      00A60B CD 87 D9         [ 4]  245     CALL ROT   
      00A60E CD 8D 73         [ 4]  246     CALL DIGIT 
      00A611 CD 8D BF         [ 4]  247     CALL HOLD 
      00A614 81               [ 4]  248     RET 
                                    249 
                                    250 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    251 ;    D#S ( d -- s )
                                    252 ;   extract digit from double 
                                    253 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002595                        254     _HEADER DDIGS,3,"D#S"
      00A615 A5 FF                    1         .word LINK 
                           002597     2         LINK=.
      00A617 03                       3         .byte 3  
      00A618 44 23 53                 4         .ascii "D#S"
      00A61B                          5         DDIGS:
      00A61B CD A6 02         [ 4]  255     CALL    DDIG 
      00A61E CD 88 25         [ 4]  256     CALL    DDUP 
      00A621 CD A5 49         [ 4]  257     CALL    DZEQUAL
      0025A4                        258     _QBRAN  DDIGS 
      00A624 CD 85 2C         [ 4]    1     CALL QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00A627 A6 1B                    2     .word DDIGS
      00A629 CD 86 14         [ 4]  259     CALL    DROP 
      00A62C 81               [ 4]  260     RET 
                                    261 
                                    262 
                                    263 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    264 ;   D. ( d -- )
                                    265 ;   display double integer 
                                    266 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025AD                        267     _HEADER DDOT,2,"D."
      00A62D A6 17                    1         .word LINK 
                           0025AF     2         LINK=.
      00A62F 02                       3         .byte 2  
      00A630 44 2E                    4         .ascii "D."
      00A632                          5         DDOT:
      00A632 CD 8E EB         [ 4]  268     CALL SPACE 
      00A635 CD A5 A8         [ 4]  269     CALL DSIGN 
      00A638 CD 85 E7         [ 4]  270     CALL TOR
      00A63B CD 85 DB         [ 4]  271     CALL RAT 
      0025BE                        272     _QBRAN DDOT0
      00A63E CD 85 2C         [ 4]    1     CALL QBRAN
      00A641 A6 46                    2     .word DDOT0
      00A643 CD 88 77         [ 4]  273     CALL DNEGA 
      00A646                        274 DDOT0:     
      00A646 CD 8D AF         [ 4]  275     CALL BDIGS 
      00A649 CD A6 1B         [ 4]  276     CALL DDIGS 
      00A64C CD 85 C8         [ 4]  277     CALL RFROM 
      0025CF                        278     _QBRAN DDOT1 
      00A64F CD 85 2C         [ 4]    1     CALL QBRAN
      00A652 A6 5C                    2     .word DDOT1
      0025D4                        279     _DOLIT '-' 
      00A654 CD 84 F9         [ 4]    1     CALL DOLIT 
      00A657 00 2D                    2     .word '-' 
      00A659 CD 8D BF         [ 4]  280     CALL HOLD 
      00A65C                        281 DDOT1: 
      00A65C CD 8E 14         [ 4]  282     CALL EDIGS 
      00A65F CD 8F 15         [ 4]  283     CALL TYPES     
      00A662 81               [ 4]  284     RET 
                                    285 
                                    286 
                                    287 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    288 ; multiply double by single 
                                    289 ; return double 
                                    290 ;  ( d s -- d )
                                    291 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025E3                        292     _HEADER DSSTAR,3,"DS*"
      00A663 A6 2F                    1         .word LINK 
                           0025E5     2         LINK=.
      00A665 03                       3         .byte 3  
      00A666 44 53 2A                 4         .ascii "DS*"
      00A669                          5         DSSTAR:
                                    293 ;DSSTAR:
      00A669 CD 85 E7         [ 4]  294     CALL TOR
      00A66C CD 86 1E         [ 4]  295     CALL DUPP 
      00A66F CD 86 57         [ 4]  296     CALL ZLESS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      00A672 CD 86 1E         [ 4]  297     CALL DUPP 
      00A675 CD 85 E7         [ 4]  298     CALL TOR 
      0025F8                        299     _QBRAN DSSTAR1 
      00A678 CD 85 2C         [ 4]    1     CALL QBRAN
      00A67B A6 80                    2     .word DSSTAR1
      00A67D CD 88 77         [ 4]  300     CALL DNEGA 
      00A680                        301 DSSTAR1:
      00A680 CD 85 C8         [ 4]  302     CALL RFROM 
      00A683 CD 87 F8         [ 4]  303     CALL NROT       
      00A686 CD 86 2E         [ 4]  304     CALL SWAPP 
      00A689 CD 85 DB         [ 4]  305     CALL RAT 
      00A68C CD 8A 6D         [ 4]  306     CALL UMSTA
      00A68F CD 87 D9         [ 4]  307     CALL ROT 
      00A692 CD 85 C8         [ 4]  308     CALL RFROM 
      00A695 CD 8A 6D         [ 4]  309     CALL UMSTA 
      00A698 CD 86 14         [ 4]  310     CALL DROP ; DROP OVERFLOW 
      00A69B CD 88 3A         [ 4]  311     CALL PLUS 
      00A69E CD 87 D9         [ 4]  312     CALL ROT 
      002621                        313     _QBRAN DSSTAR3 
      00A6A1 CD 85 2C         [ 4]    1     CALL QBRAN
      00A6A4 A6 A9                    2     .word DSSTAR3
      00A6A6 CD 88 77         [ 4]  314     CALL DNEGA 
      00A6A9                        315 DSSTAR3:
      00A6A9 81               [ 4]  316     RET 
                                    317 
                                    318 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    319 ;  2SWAP ( d1 d2 -- d2 d1 )
                                    320 ;  swap double 
                                    321 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00262A                        322     _HEADER DSWAP,5,"2SWAP"
      00A6AA A6 65                    1         .word LINK 
                           00262C     2         LINK=.
      00A6AC 05                       3         .byte 5  
      00A6AD 32 53 57 41 50           4         .ascii "2SWAP"
      00A6B2                          5         DSWAP:
      00A6B2 90 93            [ 1]  323     LDW Y,X 
      00A6B4 90 FE            [ 2]  324     LDW Y,(Y)
      00A6B6 90 BF 28         [ 2]  325     LDW YTEMP,Y ; d2 hi 
      00A6B9 90 93            [ 1]  326     LDW Y,X 
      00A6BB 90 EE 02         [ 2]  327     LDW Y,(2,Y)
      00A6BE 90 BF 26         [ 2]  328     LDW XTEMP,Y  ; d2 lo 
      00A6C1 90 93            [ 1]  329     LDW Y,X 
      00A6C3 90 EE 04         [ 2]  330     LDW Y,(4,Y)  ; d1 hi 
      00A6C6 FF               [ 2]  331     LDW (X),Y 
      00A6C7 90 93            [ 1]  332     LDW Y,X
      00A6C9 90 EE 06         [ 2]  333     LDW Y,(6,Y)  ; d1 lo 
      00A6CC EF 02            [ 2]  334     LDW (2,X),Y
      00A6CE 90 BE 28         [ 2]  335     LDW Y,YTEMP  
      00A6D1 EF 04            [ 2]  336     LDW (4,X),Y 
      00A6D3 90 BE 26         [ 2]  337     LDW Y,XTEMP 
      00A6D6 EF 06            [ 2]  338     LDW (6,X),Y 
      00A6D8 81               [ 4]  339     RET 
                                    340 
                                    341 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    342 ;    DCLZ ( d -- u )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



                                    343 ;    double count leading zeros
                                    344 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002659                        345     _HEADER DCLZ,4,"DCLZ"
      00A6D9 A6 AC                    1         .word LINK 
                           00265B     2         LINK=.
      00A6DB 04                       3         .byte 4  
      00A6DC 44 43 4C 5A              4         .ascii "DCLZ"
      00A6E0                          5         DCLZ:
      00A6E0 4F               [ 1]  346     CLR A 
      00A6E1 90 93            [ 1]  347     LDW Y,X 
      00A6E3 90 FE            [ 2]  348     LDW Y,(Y)
      00A6E5 2B 15            [ 1]  349     JRMI DCLZ8 ; no leading zero 
      00A6E7 27 06            [ 1]  350     JREQ DCLZ4 ; >=16 
      00A6E9                        351 DCLZ1: ; <16
      00A6E9 90 58            [ 2]  352     SLLW Y 
      00A6EB 2B 0F            [ 1]  353     JRMI DCLZ8 
      00A6ED 20 FA            [ 2]  354     JRA DCLZ1 
      00A6EF                        355 DCLZ4:
      00A6EF A6 10            [ 1]  356     LD A,#16 
      00A6F1 90 93            [ 1]  357     LDW Y,X 
      00A6F3 90 EE 02         [ 2]  358     LDW Y,(2,Y)
      00A6F6 2B 04            [ 1]  359     JRMI DCLZ8 
      00A6F8 26 EF            [ 1]  360     JRNE DCLZ1 
      00A6FA AB 10            [ 1]  361     ADD A,#16
      00A6FC                        362 DCLZ8: 
      00A6FC 1C 00 02         [ 2]  363     ADDW X,#2 
      00A6FF 90 5F            [ 1]  364     CLRW Y 
      00A701 90 97            [ 1]  365     LD YL,A 
      00A703 FF               [ 2]  366     LDW (X),Y 
      00A704 81               [ 4]  367     RET 
                                    368 
                                    369 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    370 ;   <2ROT ( d1 d2 d3 -- d3 d1 d2 )
                                    371 ;   rotate left doubles 
                                    372 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002685                        373     _HEADER NDROT,5,"<2ROT"
      00A705 A6 DB                    1         .word LINK 
                           002687     2         LINK=.
      00A707 05                       3         .byte 5  
      00A708 3C 32 52 4F 54           4         .ascii "<2ROT"
      00A70D                          5         NDROT:
                                    374 ; save d3 in temp 
      00A70D 90 93            [ 1]  375     LDW Y,X 
      00A70F 90 FE            [ 2]  376     LDW Y,(Y)
      00A711 90 BF 28         [ 2]  377     LDW YTEMP,Y  ; d3 hi 
      00A714 90 93            [ 1]  378     LDW Y,X 
      00A716 90 EE 02         [ 2]  379     LDW Y,(2,Y)
      00A719 90 BF 26         [ 2]  380     LDW XTEMP,Y  ; d3 lo 
                                    381 ; put d2 in d1 slot 
      00A71C 90 93            [ 1]  382     LDW Y,X 
      00A71E 90 EE 04         [ 2]  383     LDW Y,(4,Y) 
      00A721 FF               [ 2]  384     LDW (X),Y   ; d2 hi 
      00A722 90 93            [ 1]  385     LDW Y,X 
      00A724 90 EE 06         [ 2]  386     LDW Y,(6,Y)
      00A727 EF 02            [ 2]  387     LDW (2,X),Y ; d2 lo
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



                                    388 ; put d1 in d2 slot 
      00A729 90 93            [ 1]  389     LDW Y,X 
      00A72B 90 EE 08         [ 2]  390     LDW Y,(8,Y) 
      00A72E EF 04            [ 2]  391     LDW (4,X),Y ; d1 hi 
      00A730 90 93            [ 1]  392     LDW Y,X 
      00A732 90 EE 0A         [ 2]  393     LDW Y,(10,Y)
      00A735 EF 06            [ 2]  394     LDW (6,X),Y  ; d1 lo 
                                    395 ; put d3 in d1 slot 
      00A737 90 BE 28         [ 2]  396     LDW Y,YTEMP 
      00A73A EF 08            [ 2]  397     LDW (8,X),Y  ; d3 hi 
      00A73C 90 BE 26         [ 2]  398     LDW Y,XTEMP 
      00A73F EF 0A            [ 2]  399     LDW (10,X),Y  ; d3 lo 
      00A741 81               [ 4]  400     RET 
                                    401 
                                    402 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    403 ;   2ROT ( d1 d2 d3 -- d2 d3 d1 )
                                    404 ;   rotate right doubles 
                                    405 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026C2                        406     _HEADER DROT,4,"2ROT"
      00A742 A7 07                    1         .word LINK 
                           0026C4     2         LINK=.
      00A744 04                       3         .byte 4  
      00A745 32 52 4F 54              4         .ascii "2ROT"
      00A749                          5         DROT:
                                    407 ; save d3 in temp 
      00A749 90 93            [ 1]  408     LDW Y,X 
      00A74B 90 FE            [ 2]  409     LDW Y,(Y)
      00A74D 90 BF 28         [ 2]  410     LDW YTEMP,Y ; d3 hi 
      00A750 90 93            [ 1]  411     LDW Y,X 
      00A752 90 EE 02         [ 2]  412     LDW Y,(2,Y)
      00A755 90 BF 26         [ 2]  413     LDW XTEMP,Y ; d3 lo 
                                    414 ; put d1 in d3 slot 
      00A758 90 93            [ 1]  415     LDW Y,X 
      00A75A 90 EE 08         [ 2]  416     LDW Y,(8,Y)
      00A75D FF               [ 2]  417     LDW (X),Y  ; d1 hi 
      00A75E 90 93            [ 1]  418     LDW Y,X 
      00A760 90 EE 0A         [ 2]  419     LDW Y,(10,Y) 
      00A763 EF 02            [ 2]  420     LDW (2,X),Y ; d1 lo 
                                    421 ; put d2 in d1 slot 
      00A765 90 93            [ 1]  422     LDW Y,X 
      00A767 90 EE 04         [ 2]  423     LDW Y,(4,Y) ; d2 hi 
      00A76A EF 08            [ 2]  424     LDW (8,X),Y 
      00A76C 90 93            [ 1]  425     LDW Y,X 
      00A76E 90 EE 06         [ 2]  426     LDW Y,(6,Y) ; d2 lo 
      00A771 EF 0A            [ 2]  427     LDW (10,X),Y 
                                    428 ; put d3 in d2 slot 
      00A773 90 BE 28         [ 2]  429     LDW Y,YTEMP 
      00A776 EF 04            [ 2]  430     LDW (4,X),Y 
      00A778 90 BE 26         [ 2]  431     LDW Y,XTEMP 
      00A77B EF 06            [ 2]  432     LDW (6,X),Y 
      00A77D 81               [ 4]  433     RET 
                                    434 
                                    435 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    436 ;   D= ( d1 d2 -- f )
                                    437 ;   d1==d2?
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



                                    438 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026FE                        439     _HEADER DEQUAL,2,"D="
      00A77E A7 44                    1         .word LINK 
                           002700     2         LINK=.
      00A780 02                       3         .byte 2  
      00A781 44 3D                    4         .ascii "D="
      00A783                          5         DEQUAL:
      00A783 A6 00            [ 1]  440     LD A,#0 
      00A785 90 93            [ 1]  441     LDW Y,X 
      00A787 90 FE            [ 2]  442     LDW Y,(Y)
      00A789 E3 04            [ 2]  443     CPW Y,(4,X)
      00A78B 26 0B            [ 1]  444     JRNE DEQU4 
      00A78D 90 93            [ 1]  445     LDW Y,X 
      00A78F 90 EE 02         [ 2]  446     LDW Y,(2,Y)
      00A792 E3 06            [ 2]  447     CPW Y,(6,X)
      00A794 26 02            [ 1]  448     JRNE DEQU4 
      00A796 A6 FF            [ 1]  449     LD A,#0XFF
      00A798                        450 DEQU4:
      00A798 1C 00 06         [ 2]  451     ADDW X,#6
      00A79B F7               [ 1]  452     LD (X),A 
      00A79C E7 01            [ 1]  453     LD (1,X),A 
      00A79E 81               [ 4]  454     RET 
                                    455 
                                    456 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    457 ;   D> ( d1 d2 -- f )
                                    458 ;   d1>d2?
                                    459 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00271F                        460     _HEADER DGREAT,2,"D>"
      00A79F A7 80                    1         .word LINK 
                           002721     2         LINK=.
      00A7A1 02                       3         .byte 2  
      00A7A2 44 3E                    4         .ascii "D>"
      00A7A4                          5         DGREAT:
      00A7A4 A6 00            [ 1]  461     LD A,#0 
      00A7A6 90 93            [ 1]  462     LDW Y,X 
      00A7A8 90 EE 04         [ 2]  463     LDW Y,(4,Y)  ; d1 hi 
      00A7AB F3               [ 2]  464     CPW Y,(X)    ; d2 hi 
      00A7AC 2F 0B            [ 1]  465     JRSLT DGREAT4 
      00A7AE 90 93            [ 1]  466     LDW Y,X 
      00A7B0 90 EE 06         [ 2]  467     LDW Y,(6,Y)
      00A7B3 E3 02            [ 2]  468     CPW Y,(2,X)
      00A7B5 2D 02            [ 1]  469     JRSLE DGREAT4 
      00A7B7 A6 FF            [ 1]  470     LD A,#0XFF
      00A7B9                        471 DGREAT4:
      00A7B9 1C 00 06         [ 2]  472     ADDW X,#6
      00A7BC F7               [ 1]  473     LD (X),A 
      00A7BD E7 01            [ 1]  474     LD (1,X),A 
      00A7BF 81               [ 4]  475     RET
                                    476 
                                    477 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    478 ;   D< ( d1 d2 -- f )
                                    479 ;   d1<d2? 
                                    480 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002740                        481     _HEADER DLESS,2,"D<"
      00A7C0 A7 A1                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



                           002742     2         LINK=.
      00A7C2 02                       3         .byte 2  
      00A7C3 44 3C                    4         .ascii "D<"
      00A7C5                          5         DLESS:
      00A7C5 A6 00            [ 1]  482     LD A,#0 
      00A7C7 90 93            [ 1]  483     LDW Y,X 
      00A7C9 90 EE 04         [ 2]  484     LDW Y,(4,Y)
      00A7CC F3               [ 2]  485     CPW Y,(X)
      00A7CD 2C 0B            [ 1]  486     JRSGT DLESS4 
      00A7CF 90 93            [ 1]  487     LDW Y,X 
      00A7D1 90 EE 06         [ 2]  488     LDW Y,(6,Y)
      00A7D4 E3 02            [ 2]  489     CPW Y,(2,X)
      00A7D6 2E C0            [ 1]  490     JRSGE DEQU4 
      00A7D8 A6 FF            [ 1]  491     LD A,#0XFF
      00A7DA                        492 DLESS4:
      00A7DA 1C 00 06         [ 2]  493     ADDW X,#6
      00A7DD F7               [ 1]  494     LD (X),A 
      00A7DE E7 01            [ 1]  495     LD (1,X),A 
      00A7E0 81               [ 4]  496     RET
                                    497 
                                    498 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    499 ;  D0< ( d -- f )
                                    500 ;  d<0? 
                                    501 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002761                        502     _HEADER DZLESS,3,"D0<"
      00A7E1 A7 C2                    1         .word LINK 
                           002763     2         LINK=.
      00A7E3 03                       3         .byte 3  
      00A7E4 44 30 3C                 4         .ascii "D0<"
      00A7E7                          5         DZLESS:
      00A7E7 A6 00            [ 1]  503     LD A,#0 
      00A7E9 90 93            [ 1]  504     LDW Y,X 
      00A7EB 90 FE            [ 2]  505     LDW Y,(Y)
      00A7ED 2A 02            [ 1]  506     JRPL DZLESS1 
      00A7EF A6 FF            [ 1]  507     LD A,#0XFF 
      00A7F1                        508 DZLESS1:
      00A7F1 1C 00 02         [ 2]  509     ADDW X,#2 
      00A7F4 F7               [ 1]  510     LD (X),A 
      00A7F5 E7 01            [ 1]  511     LD (1,X),A    
      00A7F7 81               [ 4]  512     RET 
                                    513 
                                    514 
                                    515 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    516 ;  DCMP ( d1 d2 -- d1 d2 -1|0|1 )
                                    517 ; compare 2 doubles 
                                    518 ; keep the doubles 
                                    519 ; return flag: 
                                    520 ;    -1 if d1<d2 
                                    521 ;     0 if d1==d2
                                    522 ;     1 if d1>d2 
                                    523 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002778                        524     _HEADER DCMP,4,"DCMP"
      00A7F8 A7 E3                    1         .word LINK 
                           00277A     2         LINK=.
      00A7FA 04                       3         .byte 4  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      00A7FB 44 43 4D 50              4         .ascii "DCMP"
      00A7FF                          5         DCMP:
      00A7FF 90 93            [ 1]  525     LDW Y,X 
      00A801 90 EE 04         [ 2]  526     LDW Y,(4,Y)
      00A804 F3               [ 2]  527     CPW Y,(X) 
      00A805 27 04            [ 1]  528     JREQ DCMP2 
      00A807 2F 13            [ 1]  529     JRSLT DCMP_SMALL 
      00A809 20 17            [ 2]  530     JRA  DCMP_GREAT 
      00A80B                        531 DCMP2:    
      00A80B 90 93            [ 1]  532     LDW Y,X 
      00A80D 90 EE 06         [ 2]  533     LDW Y,(6,Y)
      00A810 E3 02            [ 2]  534     CPW Y,(2,X)
      00A812 27 04            [ 1]  535     JREQ DCMP_EQUAL  
      00A814 25 06            [ 1]  536     JRULT DCMP_SMALL 
      00A816 20 0A            [ 2]  537     JRA DCMP_GREAT
      00A818                        538 DCMP_EQUAL:
      00A818 90 5F            [ 1]  539     CLRW Y 
      00A81A 20 0A            [ 2]  540     JRA DCMP4 
      00A81C                        541 DCMP_SMALL:
      00A81C 90 AE FF FF      [ 2]  542     LDW Y,#-1 
      00A820 20 04            [ 2]  543     JRA DCMP4 
      00A822                        544 DCMP_GREAT:
      00A822 90 AE 00 01      [ 2]  545     LDW Y,#1
      00A826                        546 DCMP4:
      00A826 1D 00 02         [ 2]  547     SUBW X,#2 
      00A829 FF               [ 2]  548     LDW (X),Y 
      00A82A 81               [ 4]  549     RET
                                    550 
                                    551 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    552 ;   D>R ( d -- R: d )
                                    553 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027AB                        554     _HEADER DTOR,3,"D>R"
      00A82B A7 FA                    1         .word LINK 
                           0027AD     2         LINK=.
      00A82D 03                       3         .byte 3  
      00A82E 44 3E 52                 4         .ascii "D>R"
      00A831                          5         DTOR:
      00A831 90 85            [ 2]  555     POPW Y 
      00A833 90 BF 28         [ 2]  556     LDW YTEMP,Y 
      00A836 90 93            [ 1]  557     LDW Y,X 
      00A838 90 EE 02         [ 2]  558     LDW Y,(2,Y)
      00A83B 90 89            [ 2]  559     PUSHW Y   ; d low 
      00A83D 90 93            [ 1]  560     LDW Y,X 
      00A83F 90 FE            [ 2]  561     LDW Y,(Y)
      00A841 90 89            [ 2]  562     PUSHW Y   ; d hi 
      00A843 1C 00 04         [ 2]  563     ADDW X,#4  
      00A846 92 CC 28         [ 5]  564     JP [YTEMP]
                                    565 
                                    566 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    567 ;  DR> ( -- d ) R: d --      
                                    568 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027C9                        569     _HEADER DRFROM,3,"DR>"
      00A849 A8 2D                    1         .word LINK 
                           0027CB     2         LINK=.
      00A84B 03                       3         .byte 3  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      00A84C 44 52 3E                 4         .ascii "DR>"
      00A84F                          5         DRFROM:
      00A84F 90 85            [ 2]  570     POPW Y      ; d hi 
      00A851 90 BF 28         [ 2]  571     LDW YTEMP,Y 
      00A854 1D 00 04         [ 2]  572     SUBW X,#4
      00A857 90 85            [ 2]  573     POPW Y       ; d hi 
      00A859 FF               [ 2]  574     LDW (X),Y 
      00A85A 90 85            [ 2]  575     POPW Y       ; d low  
      00A85C EF 02            [ 2]  576     LDW (2,X),Y 
      00A85E 92 CC 28         [ 5]  577     JP [YTEMP]
                                    578     
                                    579 
                                    580 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    581 ;   D2/ ( d -- d/2 )
                                    582 ;   divide double by 2 
                                    583 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027E1                        584     _HEADER D2SLASH,3,"D2/"
      00A861 A8 4B                    1         .word LINK 
                           0027E3     2         LINK=.
      00A863 03                       3         .byte 3  
      00A864 44 32 2F                 4         .ascii "D2/"
      00A867                          5         D2SLASH:
      00A867 90 93            [ 1]  585     LDW Y,X 
      00A869 90 FE            [ 2]  586     LDW Y,(Y)
      00A86B 90 57            [ 2]  587     SRAW Y 
      00A86D FF               [ 2]  588     LDW (X),Y 
      00A86E 90 93            [ 1]  589     LDW Y,X 
      00A870 90 EE 02         [ 2]  590     LDW Y,(2,Y)
      00A873 90 56            [ 2]  591     RRCW Y 
      00A875 EF 02            [ 2]  592     LDW (2,X),Y 
      00A877 81               [ 4]  593     RET
                                    594 
                                    595 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    596 ;   DLSHIFT ( d n -- d )
                                    597 ;   left shift double 
                                    598 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027F8                        599     _HEADER DLSHIFT,7,"DLSHIFT"
      00A878 A8 63                    1         .word LINK 
                           0027FA     2         LINK=.
      00A87A 07                       3         .byte 7  
      00A87B 44 4C 53 48 49 46 54     4         .ascii "DLSHIFT"
      00A882                          5         DLSHIFT:
      00A882 E6 01            [ 1]  600     LD A,(1,X) ; shift count 
      00A884 1C 00 02         [ 2]  601     ADDW X,#2 
      00A887 90 93            [ 1]  602     LDW Y,X 
      00A889 90 FE            [ 2]  603     LDW Y,(Y)
      00A88B 90 BF 28         [ 2]  604     LDW YTEMP,Y  ; d hi 
      00A88E 90 93            [ 1]  605     LDW Y,X 
      00A890 90 EE 02         [ 2]  606     LDW Y,(2,Y)  ; d low 
      00A893                        607 DLSHIFT1:
      00A893 4D               [ 1]  608     TNZ A 
      00A894 27 12            [ 1]  609     JREQ DLSHIFT2 
      00A896 98               [ 1]  610     RCF 
      00A897 90 59            [ 2]  611     RLCW Y 
      00A899 90 89            [ 2]  612     PUSHW Y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      00A89B 90 BE 28         [ 2]  613     LDW Y,YTEMP 
      00A89E 90 59            [ 2]  614     RLCW Y 
      00A8A0 90 BF 28         [ 2]  615     LDW YTEMP,Y 
      00A8A3 90 85            [ 2]  616     POPW Y 
      00A8A5 4A               [ 1]  617     DEC A 
      00A8A6 20 EB            [ 2]  618     JRA DLSHIFT1 
      00A8A8                        619 DLSHIFT2:
      00A8A8 EF 02            [ 2]  620     LDW (2,X),Y 
      00A8AA 90 BE 28         [ 2]  621     LDW Y,YTEMP 
      00A8AD FF               [ 2]  622     LDW (X),Y 
      00A8AE 81               [ 4]  623     RET 
                                    624 
                                    625 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    626 ;  DD/MOD ( d1 d2 -- dr dq )
                                    627 ;  unsigned division double 
                                    628 ;  double.
                                    629 ;  return double quotient and 
                                    630 ;  double remainder 
                                    631 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00282F                        632     _HEADER DDSLMOD,6,"DD/MOD"
      00A8AF A8 7A                    1         .word LINK 
                           002831     2         LINK=.
      00A8B1 06                       3         .byte 6  
      00A8B2 44 44 2F 4D 4F 44        4         .ascii "DD/MOD"
      00A8B8                          5         DDSLMOD:
      00A8B8 CD 88 25         [ 4]  633     CALL DDUP 
      00A8BB CD A6 E0         [ 4]  634     CALL DCLZ 
      00A8BE CD 86 1E         [ 4]  635     CALL DUPP
      002841                        636     _DOLIT 16 
      00A8C1 CD 84 F9         [ 4]    1     CALL DOLIT 
      00A8C4 00 10                    2     .word 16 
      00A8C6 CD 89 36         [ 4]  637     CALL GREAT 
      002849                        638     _QBRAN DDSLMOD1 
      00A8C9 CD 85 2C         [ 4]    1     CALL QBRAN
      00A8CC A8 D5                    2     .word DDSLMOD1
      00A8CE CD 88 1A         [ 4]  639     CALL DDROP 
      00A8D1 CD A5 C1         [ 4]  640     CALL DSLMOD 
      00A8D4 81               [ 4]  641     RET 
      00A8D5                        642 DDSLMOD1:
      00A8D5 CD 86 1E         [ 4]  643     CALL DUPP      
      00A8D8 CD 85 E7         [ 4]  644     CALL TOR 
      00A8DB CD A8 82         [ 4]  645     CALL DLSHIFT
      00285E                        646     _DOLIT 32 
      00A8DE CD 84 F9         [ 4]    1     CALL DOLIT 
      00A8E1 00 20                    2     .word 32 
      00A8E3 CD 85 C8         [ 4]  647     CALL RFROM 
      00A8E6 CD 88 B3         [ 4]  648     CALL SUBB 
      002869                        649     _DOLIT 5 
      00A8E9 CD 84 F9         [ 4]    1     CALL DOLIT 
      00A8EC 00 05                    2     .word 5 
      00A8EE CD 8B FD         [ 4]  650     CALL PICK 
      002871                        651     _DOLIT 5 
      00A8F1 CD 84 F9         [ 4]    1     CALL DOLIT 
      00A8F4 00 05                    2     .word 5 
      00A8F6 CD 8B FD         [ 4]  652     CALL PICK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      00A8F9 CD A6 E0         [ 4]  653     CALL DCLZ 
      00A8FC CD 85 E7         [ 4]  654     CALL TOR 
      00A8FF CD A6 B2         [ 4]  655     CALL DSWAP 
      00A902 CD 85 DB         [ 4]  656     CALL RAT 
      00A905 CD A8 82         [ 4]  657     CALL DLSHIFT 
      00A908 CD A6 B2         [ 4]  658     CALL DSWAP 
      00A90B CD 85 C8         [ 4]  659     CALL RFROM 
      00A90E CD 85 C8         [ 4]  660     CALL RFROM 
      00A911 CD 86 2E         [ 4]  661     CALL SWAPP 
      00A914 CD 88 B3         [ 4]  662     CALL SUBB ; number dividend left shift to do.
                                    663 
      00A917 81               [ 4]  664     RET 
                                    665 
                                    666 
                                    667 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    668 ;   D* ( d1 d2 -- d3 )
                                    669 ;   double product 
                                    670 ;   
                                    671 ;   d3 = d1 * d2
                                    672 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002898                        673     _HEADER DSTAR,2,"D*"
      00A918 A8 B1                    1         .word LINK 
                           00289A     2         LINK=.
      00A91A 02                       3         .byte 2  
      00A91B 44 2A                    4         .ascii "D*"
      00A91D                          5         DSTAR:
      00289D                        674     _DOLIT 0 
      00A91D CD 84 F9         [ 4]    1     CALL DOLIT 
      00A920 00 00                    2     .word 0 
      00A922 CD 87 F8         [ 4]  675     CALL NROT  
      00A925 CD 86 1E         [ 4]  676     CALL DUPP 
      00A928 CD 86 57         [ 4]  677     CALL ZLESS 
      0028AB                        678     _QBRAN DDSTAR1 
      00A92B CD 85 2C         [ 4]    1     CALL QBRAN
      00A92E A9 3C                    2     .word DDSTAR1
      00A930 CD 88 77         [ 4]  679     CALL DNEGA 
      00A933 CD 87 D9         [ 4]  680     CALL ROT  
      00A936 CD 88 54         [ 4]  681     CALL INVER 
      00A939 CD 87 F8         [ 4]  682     CALL NROT  
      00A93C                        683 DDSTAR1:
      00A93C CD 85 E7         [ 4]  684     CALL TOR 
      00A93F CD 85 E7         [ 4]  685     CALL TOR
      00A942 CD 87 F8         [ 4]  686     CALL NROT  
      00A945 CD 86 1E         [ 4]  687     CALL DUPP 
      00A948 CD 86 57         [ 4]  688     CALL ZLESS 
      0028CB                        689     _QBRAN DDSTAR2 
      00A94B CD 85 2C         [ 4]    1     CALL QBRAN
      00A94E A9 5C                    2     .word DDSTAR2
      00A950 CD 88 77         [ 4]  690     CALL DNEGA 
      00A953 CD 87 D9         [ 4]  691     CALL ROT
      00A956 CD 88 54         [ 4]  692     CALL INVER 
      00A959 CD 87 F8         [ 4]  693     CALL NROT 
      00A95C                        694 DDSTAR2:
      00A95C CD 88 25         [ 4]  695     CALL DDUP 
      00A95F CD 85 C8         [ 4]  696     CALL RFROM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      00A962 CD A6 69         [ 4]  697     CALL DSSTAR 
      00A965 CD A6 B2         [ 4]  698     CALL DSWAP 
      00A968 CD 85 C8         [ 4]  699     CALL RFROM 
      00A96B CD A6 69         [ 4]  700     CALL DSSTAR 
      00A96E CD 86 14         [ 4]  701     CALL DROP
      00A971 CD 88 3A         [ 4]  702     CALL PLUS
      00A974 CD 87 D9         [ 4]  703     CALL ROT 
      0028F7                        704     _QBRAN DDSTAR3 
      00A977 CD 85 2C         [ 4]    1     CALL QBRAN
      00A97A A9 7F                    2     .word DDSTAR3
      00A97C CD 88 77         [ 4]  705     CALL DNEGA 
      00A97F                        706 DDSTAR3:  
      00A97F 81               [ 4]  707     RET 
                                    708 
                                    709 
                                    710 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    711 ;   D+ ( d1 d2 -- d3 )
                                    712 ;   add 2 doubles 
                                    713 ;   d3=d1+d2 
                                    714 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002900                        715     _HEADER DPLUS,2,"D+"
      00A980 A9 1A                    1         .word LINK 
                           002902     2         LINK=.
      00A982 02                       3         .byte 2  
      00A983 44 2B                    4         .ascii "D+"
      00A985                          5         DPLUS:
      00A985 90 93            [ 1]  716     LDW Y,X 
      00A987 90 FE            [ 2]  717     LDW Y,(Y)
      00A989 90 BF 28         [ 2]  718     LDW YTEMP,Y ; d2 hi 
      00A98C 90 93            [ 1]  719     LDW Y,X 
      00A98E 90 EE 02         [ 2]  720     LDW Y,(2,Y)
      00A991 90 BF 26         [ 2]  721     LDW XTEMP,Y ; d2 lo 
      00A994 1C 00 04         [ 2]  722     ADDW X,#4 
      00A997 90 93            [ 1]  723     LDW Y,X 
      00A999 90 EE 02         [ 2]  724     LDW Y,(2,Y) ; d1 lo
      00A99C 72 B9 00 26      [ 2]  725     ADDW Y,XTEMP
      00A9A0 EF 02            [ 2]  726     LDW (2,X),Y 
      00A9A2 90 93            [ 1]  727     LDW Y,X 
      00A9A4 90 FE            [ 2]  728     LDW Y,(Y) ; d1 hi 
      00A9A6 24 04            [ 1]  729     JRNC DPLUS1 
      00A9A8 72 A9 00 01      [ 2]  730     ADDW Y,#1 
      00A9AC                        731 DPLUS1: 
      00A9AC 72 B9 00 28      [ 2]  732     ADDW Y,YTEMP 
      00A9B0 FF               [ 2]  733     LDW (X),Y 
      00A9B1 81               [ 4]  734     RET 
                                    735 
                                    736 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    737 ;   D- ( d1 d2 -- d3 )
                                    738 ;   d3=d1-d2 
                                    739 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002932                        740     _HEADER DSUB,2,"D-"
      00A9B2 A9 82                    1         .word LINK 
                           002934     2         LINK=.
      00A9B4 02                       3         .byte 2  
      00A9B5 44 2D                    4         .ascii "D-"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      00A9B7                          5         DSUB:
      00A9B7 90 93            [ 1]  741     LDW Y,X 
      00A9B9 90 FE            [ 2]  742     LDW Y,(Y)
      00A9BB 90 BF 28         [ 2]  743     LDW YTEMP,Y ; d2 hi 
      00A9BE 90 93            [ 1]  744     LDW Y,X 
      00A9C0 90 EE 02         [ 2]  745     LDW Y,(2,Y)
      00A9C3 90 BF 26         [ 2]  746     LDW XTEMP,Y ; d2 lo 
      00A9C6 1C 00 04         [ 2]  747     ADDW X,#4 
      00A9C9 90 93            [ 1]  748     LDW Y,X 
      00A9CB 90 EE 02         [ 2]  749     LDW Y,(2,Y) ; d1 lo
      00A9CE 72 B2 00 26      [ 2]  750     SUBW Y,XTEMP
      00A9D2 EF 02            [ 2]  751     LDW (2,X),Y 
      00A9D4 90 93            [ 1]  752     LDW Y,X 
      00A9D6 90 FE            [ 2]  753     LDW Y,(Y) ; d1 hi 
      00A9D8 24 04            [ 1]  754     JRNC DSUB1 
      00A9DA 72 A2 00 01      [ 2]  755     SUBW Y,#1 
      00A9DE                        756 DSUB1: 
      00A9DE 72 B2 00 28      [ 2]  757     SUBW Y,YTEMP 
      00A9E2 FF               [ 2]  758     LDW (X),Y 
      00A9E3 81               [ 4]  759     RET 
                                    760 
                                    761 
                                    762 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    763 ;    ILOG ( ud base -- n )
                                    764 ;    integer part of double in base 
                                    765 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002964                        766     _HEADER ILOG,4,"ILOG"
      00A9E4 A9 B4                    1         .word LINK 
                           002966     2         LINK=.
      00A9E6 04                       3         .byte 4  
      00A9E7 49 4C 4F 47              4         .ascii "ILOG"
      00A9EB                          5         ILOG:
      00296B                        767     _DOLIT 0 
      00A9EB CD 84 F9         [ 4]    1     CALL DOLIT 
      00A9EE 00 00                    2     .word 0 
      00A9F0 CD 85 E7         [ 4]  768     CALL TOR 
      00A9F3 CD 87 F8         [ 4]  769     CALL NROT 
      00A9F6                        770 ILOG1: 
      002976                        771     _DOLIT 2 
      00A9F6 CD 84 F9         [ 4]    1     CALL DOLIT 
      00A9F9 00 02                    2     .word 2 
      00A9FB CD 8B FD         [ 4]  772     CALL PICK 
      00A9FE CD A5 C1         [ 4]  773     CALL DSLMOD 
      00AA01 CD 87 D9         [ 4]  774     CALL ROT 
      00AA04 CD 86 14         [ 4]  775     CALL DROP 
      00AA07 CD 88 25         [ 4]  776     CALL DDUP
      00AA0A CD A5 49         [ 4]  777     CALL DZEQUAL 
      00AA0D CD 88 54         [ 4]  778     CALL INVER 
      002990                        779     _QBRAN ILOG2
      00AA10 CD 85 2C         [ 4]    1     CALL QBRAN
      00AA13 AA 23                    2     .word ILOG2
      00AA15 CD 85 C8         [ 4]  780     CALL RFROM 
      00AA18 CD 8B 38         [ 4]  781     CALL ONEP 
      00AA1B CD 85 E7         [ 4]  782     CALL TOR 
      00299E                        783     _BRAN ILOG1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      00AA1E CD 85 43         [ 4]    1     CALL BRAN 
      00AA21 A9 F6                    2     .word ILOG1 
      00AA23                        784 ILOG2:
      00AA23 CD 88 1A         [ 4]  785     CALL DDROP 
      00AA26 CD 86 14         [ 4]  786     CALL DROP 
      00AA29 CD 85 C8         [ 4]  787     CALL RFROM 
      00AA2C 81               [ 4]  788     RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



                                   4760 .endif 
                           000000  4761 .if WANT_FLOAT 
                                   4762         .include "float.asm"
                                   4763 .endif 
                                   4764 
                                   4765 ;===============================================================
                                   4766 
                           002966  4767 LASTN =	LINK   ;last name defined
                                   4768 
                                   4769 ; application code begin here
      00AA80                       4770 	.bndry 128 ; align on flash block  
      00AA80                       4771 app_space: 
                                   4772 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        000856 R   |   6 ABOR1      001337 R
  6 ABOR2      00134E R   |   6 ABORQ      00132F R   |   6 ABORT      001320 R
  6 ABRTQ      00160B R   |   6 ABSS       00084D R   |   6 ACCEP      0012B6 R
  6 ACCP1      0012BF R   |   6 ACCP2      0012E5 R   |   6 ACCP3      0012E8 R
  6 ACCP4      0012EA R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
    ADC_CR1_=  000001     |     ADC_CR1_=  000004     |     ADC_CR1_=  000005 
    ADC_CR1_=  000006     |     ADC_CR2 =  005402     |     ADC_CR2_=  000003 
    ADC_CR2_=  000004     |     ADC_CR2_=  000005     |     ADC_CR2_=  000006 
    ADC_CR2_=  000001     |     ADC_CR3 =  005403     |     ADC_CR3_=  000007 
    ADC_CR3_=  000006     |     ADC_CSR =  005400     |     ADC_CSR_=  000006 
    ADC_CSR_=  000004     |     ADC_CSR_=  000000     |     ADC_CSR_=  000001 
    ADC_CSR_=  000002     |     ADC_CSR_=  000003     |     ADC_CSR_=  000007 
    ADC_CSR_=  000005     |     ADC_DRH =  005404     |     ADC_DRL =  005405 
    ADC_TDRH=  005406     |     ADC_TDRL=  005407     |   6 ADRADJ     000738 R
    AFR     =  004803     |     AFR0_ADC=  000000     |     AFR1_TIM=  000001 
    AFR2_CCO=  000002     |     AFR3_TIM=  000003     |     AFR4_TIM=  000004 
    AFR5_TIM=  000005     |     AFR6_I2C=  000006     |     AFR7_BEE=  000007 
  6 AFT        0015F6 R   |   6 AGAIN      00154C R   |   6 AHEAD      0015A9 R
  6 ALLOT      00145F R   |   6 ANDD       0005EA R   |     APP_CP  =  004004 
    APP_LAST=  004000     |     APP_RUN =  004002     |     APP_VP  =  004006 
  6 AT         0004F7 R   |   6 ATEXE      000C48 R   |   6 AUTORUN    00012B R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |   6 B115K2     0003E2 R
    B19200  =  000003     |   6 B19K2      0003BF R   |     B1_MASK =  000002 
    B230400 =  000007     |     B2400   =  000000     |   6 B2K4       000390 R
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |   6 B4K8       00039E R
    B4_MASK =  000010     |     B57600  =  000005     |   6 B57K6      0003D0 R
    B5_MASK =  000020     |     B6_MASK =  000040     |     B7_MASK =  000080 
    B921600 =  000009     |     B9600   =  000002     |   6 B9K6       0003AE R
  6 BACK1      00125E R   |   6 BASE       00065B R   |     BASEE   =  00000A 
  6 BAUD       0003F2 R   |     BCNT    =  000001     |   6 BCOMP      0014A1 R
  6 BDIGS      000D2F R   |     BEEP_BIT=  000004     |     BEEP_CSR=  0050F3 
    BEEP_MAS=  000010     |     BEEP_POR=  00000F     |   6 BEGIN      00152E R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |   6 BKSLA      0010B3 R
  6 BKSP       00122E R   |     BKSPP   =  000008     |   6 BLANK      000B17 R
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
  6 BRAN       0004C3 R   |     BTW     =  000001     |   6 BUF2ROW    002073 R
  6 BYE        0000B8 R   |     CADR    =  000003     |     CALLL   =  0000CD 
  6 CALLOT     0022BC R   |     CAN_DGR =  005426     |     CAN_FPSR=  005427 
    CAN_IER =  005425     |     CAN_MCR =  005420     |     CAN_MSR =  005421 
    CAN_P0  =  005428     |     CAN_P1  =  005429     |     CAN_P2  =  00542A 
    CAN_P3  =  00542B     |     CAN_P4  =  00542C     |     CAN_P5  =  00542D 
    CAN_P6  =  00542E     |     CAN_P7  =  00542F     |     CAN_P8  =  005430 
    CAN_P9  =  005431     |     CAN_PA  =  005432     |     CAN_PB  =  005433 
    CAN_PC  =  005434     |     CAN_PD  =  005435     |     CAN_PE  =  005436 
    CAN_PF  =  005437     |     CAN_RFR =  005424     |     CAN_TPR =  005423 
    CAN_TSR =  005422     |     CARRY   =  00002C     |     CASE_SEN=  000000 
  6 CAT        000515 R   |   6 CCOMMA     001483 R   |     CC_C    =  000000 
    CC_H    =  000004     |     CC_I0   =  000003     |     CC_I1   =  000005 
    CC_N    =  000002     |     CC_V    =  000007     |     CC_Z    =  000001 
    CELLL   =  000002     |   6 CELLM      000A9C R   |   6 CELLP      000A8D R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]

Symbol Table

  6 CELLS      000AAB R   |     CFG_GCR =  007F60     |     CFG_GCR_=  000001 
    CFG_GCR_=  000000     |   6 CHAR1      000E85 R   |   6 CHAR2      000E88 R
  6 CHKIVEC    001F61 R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
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
    CLK_SWR_=  0000D2     |   6 CMOV1      000C67 R   |   6 CMOV2      000C7F R
  6 CMOVE      000C5F R   |     CNTDWN  =  000034     |   6 CNTXT      0006DE R
  6 COLD       001A65 R   |   6 COLD1      001A65 R   |   6 COLON      0017A4 R
  6 COMMA      00146C R   |   6 COMPI      0014B1 R   |     COMPO   =  000040 
  6 CONSTANT   00184E R   |   6 COUNT      000BFB R   |   6 CPP        0006FA R
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |   6 CR         000EB3 R
  6 CREAT      0017EA R   |     CRR     =  00000D     |   6 CSTOR      000504 R
  6 CTABLE     0022DD R   |   6 CTAT       0022FE R   |   6 CTINIT     002326 R
  6 D2SLASH    0027E7 R   |   6 DABS       002511 R   |   6 DABS1      00251F R
  6 DAT        000BDB R   |     DATSTK  =  001680     |   6 DCLZ       002660 R
  6 DCLZ1      002669 R   |   6 DCLZ4      00266F R   |   6 DCLZ8      00267C R
  6 DCMP       00277F R   |   6 DCMP2      00278B R   |   6 DCMP4      0027A6 R
  6 DCMP_EQU   002798 R   |   6 DCMP_GRE   0027A2 R   |   6 DCMP_SMA   00279C R
  6 DCONST     00188A R   |   6 DDIG       002582 R   |   6 DDIGS      00259B R
  6 DDOT       0025B2 R   |   6 DDOT0      0025C6 R   |   6 DDOT1      0025DC R
  6 DDROP      00079A R   |   6 DDSLMOD    002838 R   |   6 DDSLMOD1   002855 R
  6 DDSTAR1    0028BC R   |   6 DDSTAR2    0028DC R   |   6 DDSTAR3    0028FF R
  6 DDUP       0007A5 R   |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  6 DECIM      000DDF R   |   6 DEPTH      000B66 R   |   6 DEQU4      002718 R
  6 DEQUAL     002703 R   |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  6 DGREAT     002724 R   |   6 DGREAT4    002739 R   |   6 DGTQ1      000E24 R
  6 DI         0000C6 R   |   6 DIG        000D58 R   |   6 DIGIT      000CF3 R
  6 DIGS       000D69 R   |   6 DIGS1      000D69 R   |   6 DIGS2      000D76 R
  6 DIGTQ      000DF3 R   |     DISCOVER=  000000     |   6 DLESS      002745 R
  6 DLESS4     00275A R   |   6 DLSHIFT    002802 R   |   6 DLSHIFT1   002813 R
  6 DLSHIFT2   002828 R   |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  6 DN1        000814 R   |   6 DNEG1      002506 R   |   6 DNEGA      0007F7 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]

Symbol Table

  6 DNEGAT     0024E7 R   |   6 DOCONST    001878 R   |   6 DOLIT      000479 R
  6 DONXT      00048D R   |     DOORBELL=  000000     |   6 DOSTR      000EC9 R
  6 DOT        000F6C R   |   6 DOT1       000F82 R   |   6 DOTI1      0019E6 R
  6 DOTID      0019D0 R   |   6 DOTO1      0013C3 R   |   6 DOTOK      0013A9 R
  6 DOTPR      001095 R   |   6 DOTQ       001625 R   |   6 DOTQP      000EF2 R
  6 DOTR       000F00 R   |   6 DOTS       001972 R   |   6 DOTS1      00197D R
  6 DOTS2      001986 R   |   6 DOVAR      00064B R   |   6 DO_DCONS   0018B9 R
  6 DPLUS      002905 R   |   6 DPLUS1     00292C R   |   6 DRFROM     0027CF R
  6 DROP       000594 R   |   6 DROT       0026C9 R   |   6 DSIGN      002528 R
  6 DSIGN1     002532 R   |   6 DSLMOD     002541 R   |   6 DSLMOD3    00255C R
  6 DSLMOD4    002568 R   |   6 DSLMODa    002563 R   |   6 DSLMODb    00256E R
  6 DSSTAR     0025E9 R   |   6 DSSTAR1    002600 R   |   6 DSSTAR3    002629 R
  6 DSTAR      00289D R   |   6 DSTOR      000BB5 R   |   6 DSUB       002937 R
  6 DSUB1      00295E R   |   6 DSWAP      002632 R   |   6 DTOR       0027B1 R
  6 DUMP       001928 R   |   6 DUMP1      00193F R   |   6 DUMP3      001961 R
  6 DUMPP      0018F7 R   |   6 DUPP       00059E R   |   6 DZEQUAL    0024C9 R
  6 DZLESS     002767 R   |   6 DZLESS1    002771 R   |   6 EDIGS      000D94 R
  6 EECSTORE   001D12 R   |   6 EEPCP      001B38 R   |   6 EEPLAST    001B0B R
  6 EEPROM     001AF3 R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_R=  000010     |     EEPROM_S=  000800     |   6 EEPRUN     001B22 R
  6 EEPVP      001B4E R   |   6 EESTORE    001D5E R   |   6 EE_CCOMM   002028 R
  6 EE_COMMA   002007 R   |   6 EE_CREAD   001CA3 R   |   6 EE_READ    001C81 R
  6 EI         0000BF R   |   6 ELSEE      001584 R   |   6 EMIT       000438 R
  6 ENEPER     002248 R   |     EOL_CR  =  000001     |     EOL_LF  =  000000 
  6 EQ1        000871 R   |   6 EQUAL      00085B R   |   6 ERASE      000CC1 R
    ERR     =  00001B     |   6 EVAL       0013EC R   |   6 EVAL1      0013EC R
  6 EVAL2      001408 R   |   6 EXE1       000C56 R   |   6 EXECU      0004D3 R
    EXT     =  000000     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
  6 EXTRC      000D1B R   |   6 FADDR      0020F5 R   |   6 FARAT      001BB9 R
  6 FARCAT     001BC5 R   |   6 FC_XOFF    000465 R   |   6 FC_XON     00044F R
    FHSE    =  7A1200     |     FHSI    =  F42400     |   6 FILL       000C8E R
  6 FILL1      000CAB R   |   6 FILL2      000CB4 R   |   6 FIND       00118A R
  6 FIND1      0011A8 R   |   6 FIND2      0011D6 R   |   6 FIND3      0011E2 R
  6 FIND4      0011F6 R   |   6 FIND5      001203 R   |   6 FIND6      0011E7 R
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
    FLSI    =  01F400     |   6 FMOVE      002100 R   |   6 FMOVE2     002131 R
  6 FOR        001501 R   |   6 FORGET     00015C R   |   6 FORGET1    00018B R
  6 FORGET2    000211 R   |   6 FORGET4    00021A R   |   6 FORGET6    0001D3 R
  6 FPSTOR     001AD4 R   |     FPTR    =  000036     |   6 FREEVAR    000227 R
  6 FREEVAR4   00025D R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |   6 GREAT      0008B6 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]

Symbol Table

  6 GREAT1     0008CC R   |   6 HDOT       000F4F R   |   6 HERE       000C12 R
  6 HEX        000DCA R   |   6 HI         001A22 R   |   6 HLD        0006CB R
  6 HOLD       000D3F R   |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
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
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   6 ICOLON     0017B5 R
  6 IFETCH     00151F R   |   6 IFF        00155C R   |   6 IFMOVE     0021D9 R
  6 ILOG       00296B R   |   6 ILOG1      002976 R   |   6 ILOG2      0029A3 R
    IMEDD   =  000080     |   6 IMMED      0017C7 R   |   6 INCH       00042C R
  6 INC_FPTR   001C4E R   |   6 INITOFS    00177D R   |   6 INN        000679 R
    INPUT_DI=  000000     |     INPUT_EI=  000001     |     INPUT_FL=  000000 
    INPUT_PU=  000001     |   6 INTE1      00138B R   |   6 INTER      001361 R
  6 INTQ       002382 R   |     INT_ADC2=  000016     |     INT_AUAR=  000012 
    INT_AWU =  000001     |     INT_CAN_=  000008     |     INT_CAN_=  000009 
    INT_CLK =  000002     |     INT_EXTI=  000003     |     INT_EXTI=  000004 
    INT_EXTI=  000005     |     INT_EXTI=  000006     |     INT_EXTI=  000007 
    INT_FLAS=  000018     |     INT_I2C =  000013     |     INT_SPI =  00000A 
    INT_TIM1=  00000C     |     INT_TIM1=  00000B     |     INT_TIM2=  00000E 
    INT_TIM2=  00000D     |     INT_TIM3=  000010     |     INT_TIM3=  00000F 
    INT_TIM4=  000017     |     INT_TLI =  000000     |     INT_UART=  000011 
    INT_UART=  000015     |     INT_UART=  000014     |     INT_VECT=  008060 
    INT_VECT=  00800C     |     INT_VECT=  008028     |     INT_VECT=  00802C 
    INT_VECT=  008010     |     INT_VECT=  008014     |     INT_VECT=  008018 
    INT_VECT=  00801C     |     INT_VECT=  008020     |     INT_VECT=  008024 
    INT_VECT=  008068     |     INT_VECT=  008054     |     INT_VECT=  008000 
    INT_VECT=  008030     |     INT_VECT=  008038     |     INT_VECT=  008034 
    INT_VECT=  008040     |     INT_VECT=  00803C     |     INT_VECT=  008048 
    INT_VECT=  008044     |     INT_VECT=  008064     |     INT_VECT=  008008 
    INT_VECT=  008004     |     INT_VECT=  008050     |     INT_VECT=  00804C 
    INT_VECT=  00805C     |     INT_VECT=  008058     |   6 INVER      0007D4 R
    IPR0    =  000002     |     IPR1    =  000001     |     IPR2    =  000000 
    IPR3    =  000003     |     IPR_MASK=  000003     |     IRET_COD=  000080 
  6 ISEMI      001712 R   |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]

Symbol Table

    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  6 JSRC       001767 R   |   6 KEY        000E33 R   |   6 KTAP       00127B R
  6 KTAP1      00129E R   |   6 KTAP2      0012A1 R   |   6 LAST       00070A R
  6 LASTN   =  002966 R   |   6 LBRAC      001398 R   |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |   6 LESS       000898 R
    LF      =  00000A     |   6 LINK    =  002966 R   |   6 LITER      0014D3 R
  6 LN2S       0022A4 R   |   6 LOCK       001C3A R   |   6 LOG2S      00228E R
  6 LSHIFT     000AD6 R   |   6 LSHIFT1    000ADF R   |   6 LSHIFT4    000AE7 R
  6 LT1        0008AE R   |     MASKK   =  001F7F     |   6 MAX        0008D6 R
  6 MAX1       0008E9 R   |   6 MIN        0008F3 R   |   6 MIN1       000906 R
  6 MMOD1      00098F R   |   6 MMOD2      0009A3 R   |   6 MMOD3      0009BA R
  6 MMSM1      00094A R   |   6 MMSM3      00094E R   |   6 MMSM4      00095A R
  6 MMSMa      000955 R   |   6 MMSMb      000960 R   |   6 MODD       0009D4 R
  6 MONE       000B3D R   |     MS      =  000032     |   6 MSEC       0002D2 R
  6 MSMOD      000972 R   |   6 MSTA1      000A65 R   |   6 MSTAR      000A42 R
    NAFR    =  004804     |   6 NAMEQ      001223 R   |   6 NAMET      001134 R
    NCLKOPT =  004808     |   6 NDROT      00268D R   |   6 NEGAT      0007E5 R
  6 NEX1       00049A R   |   6 NEXT       001510 R   |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
  6 NROT       000778 R   |   6 NTIB       000689 R   |     NUBC    =  004802 
    NUCLEO  =  000001     |   6 NUFQ       000E49 R   |   6 NUFQ1      000E62 R
  6 NUMBQ      0023AA R   |   6 NUMQ0      0023EB R   |   6 NUMQ1      00240D R
  6 NUMQ2      00243E R   |   6 NUMQ3      002483 R   |   6 NUMQ4      0024A4 R
  6 NUMQ5      0024B1 R   |   6 NUMQ6      0024B4 R   |   6 NUMQ8      0024B9 R
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   6 NonHandl   000000 R
  6 OFFSET     00072F R   |     OFS     =  000005     |   6 ONE        000B2F R
  6 ONEM       000AC5 R   |   6 ONEP       000AB8 R   |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTIMIZE=  000001     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   6 ORIG       00004B R   |   6 ORR        0005FE R
  6 OUTPUT     00043D R   |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |   6 OVER       0005C8 R
  6 OVERT      0016E0 R   |     PA      =  000000     |   6 PACKS      000CD2 R
  6 PAD        000C23 R   |   6 PAREN      0010A4 R   |   6 PARS       000F9D R
  6 PARS1      000FC8 R   |   6 PARS2      000FF3 R   |   6 PARS3      000FF6 R
  6 PARS4      000FFF R   |   6 PARS5      001022 R   |   6 PARS6      001037 R
  6 PARS7      001046 R   |   6 PARS8      001055 R   |   6 PARSE      001066 R
  6 PAUSE      0002E2 R   |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |   6 PDUM1      00190A R   |   6 PDUM2      00191B R
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |     PE_BASE =  005014     |     PE_CR1  =  005017 
    PE_CR2  =  005018     |     PE_DDR  =  005016     |     PE_IDR  =  005015 
    PE_ODR  =  005014     |     PF      =  000019     |     PF_BASE =  005019 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]

Symbol Table

    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_BASE =  00501E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |   6 PICK       000B7D R
  6 PII        002207 R   |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   6 PLUS       0007BA R   |   6 PNAM1      001695 R
  6 PRESE      001417 R   |     PROD1   =  000026     |     PROD2   =  000028 
    PROD3   =  00002A     |   6 PROTECTE   000203 R   |   6 PSTOR      000B94 R
    PTR16   =  000037     |     PTR8    =  000038     |   6 PTRPLUS    001C66 R
  6 QBRAN      0004AC R   |   6 QDUP       000748 R   |   6 QDUP1      000752 R
  6 QKEY       00041A R   |   6 QSTAC      0013CF R   |   6 QUERY      0012FB R
  6 QUEST      000F8F R   |   6 QUIT       001434 R   |   6 QUIT1      00143C R
  6 QUIT2      00143F R   |   6 RAM2EE     0020A1 R   |     RAMBASE =  000000 
  6 RAMLAST    00071D R   |     RAM_BASE=  000000     |     RAM_END =  0017FF 
    RAM_SIZE=  001800     |   6 RANDOM     000280 R   |   6 RAT        00055B R
  6 RBRAC      001754 R   |   6 REPEA      0015D9 R   |   6 RFREE      002088 R
  6 RFROM      000548 R   |     ROP     =  004800     |   6 ROT        000759 R
  6 ROW2BUF    00204A R   |     ROWBUFF =  001680     |     RP0     =  000030 
  6 RPAT       000525 R   |     RPP     =  0017FF     |   6 RPSTO      000532 R
  6 RSHIFT     000AF2 R   |   6 RSHIFT1    000AFB R   |   6 RSHIFT4    000B03 R
    RST_SR  =  0050B3     |   6 RT12_2     002277 R   |   6 SAME1      001152 R
  6 SAME2      00117B R   |   6 SAMEQ      00114A R   |   6 SCOM1      0016CA R
  6 SCOM2      0016CD R   |   6 SCOMP      0016AC R   |   6 SEED       000267 R
    SEEDX   =  00003A     |     SEEDY   =  00003C     |   6 SEMIS      0016F0 R
  6 SETISP     0000D2 R   |   6 SET_RAML   001837 R   |     SFR_BASE=  005000 
    SFR_END =  0057FF     |   6 SIGN       000D7E R   |   6 SIGN1      000D8E R
  6 SLASH      0009DE R   |   6 SLMOD      0009C2 R   |   6 SNAME      00165F R
    SP0     =  00002E     |   6 SPACE      000E6B R   |   6 SPACS      000E7A R
  6 SPAT       00057E R   |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
    SPP     =  001680     |     SPSAVE  =  000001     |   6 SPSTO      00058B R
  6 SQRT10     002260 R   |   6 SQRT2      00221E R   |   6 SQRT3      002235 R
  6 SSMOD      000A6E R   |     SSP     =  000001     |     STACK   =  0017FF 
  6 STAR       000A37 R   |   6 STASL      000A7F R   |   6 STOD       00081C R
  6 STORE      0004E0 R   |   6 STR        000DAC R   |   6 STRCQ      0014E1 R
  6 STRQ       001618 R   |   6 STRQP      000EE8 R   |   6 SUBB       000833 R
  6 SWAPP      0005AE R   |     SWIM_CSR=  007F80     |   6 TAP        001265 R
  6 TBOOT      001A59 R   |   6 TBUF       000699 R   |     TBUFFBAS=  001680 
  6 TCHAR      000B4E R   |   6 TEMP       00066A R   |   6 TEVAL      0006BC R
  6 TFLASH     0006AB R   |   6 THENN      001571 R   |   6 TIB        000C34 R
    TIBB    =  001700     |     TIBBASE =  001700     |     TIC     =  000027 
  6 TICK       00144B R   |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
    TIM1_BKR=  00526D     |     TIM1_CCE=  00525C     |     TIM1_CCE=  00525D 
    TIM1_CCM=  005258     |     TIM1_CCM=  000000     |     TIM1_CCM=  000001 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000003 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000004 
    TIM1_CCM=  000005     |     TIM1_CCM=  000006     |     TIM1_CCM=  000003 
    TIM1_CCM=  005259     |     TIM1_CCM=  000000     |     TIM1_CCM=  000001 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]

Symbol Table

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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |   6 TNAM2      0019A0 R
  6 TNAM3      0019BE R   |   6 TNAM4      0019C4 R   |   6 TNAME      00199D R
  6 TOFLASH    000337 R   |   6 TOKEN      001126 R   |   6 TOR        000567 R
  6 TORAM      000377 R   |     TRUEE   =  00FFFF     |   6 TWOSL      000B0A R
  6 TYPE1      000E9A R   |   6 TYPE2      000EA6 R   |   6 TYPES      000E95 R
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
    UD3     =  000003     |     UD4     =  000004     |   6 UDOT       000F3B R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]

Symbol Table

  6 UDOTR      000F1B R   |   6 UEND       000049 R   |     UFBASE  =  000008 
    UFPSW   =  00000A     |     UHLD    =  000016     |     UINN    =  00000E 
    UINTER  =  000014     |     ULAST   =  00001E     |   6 ULES1      000890 R
  6 ULESS      00087A R   |   6 UMMOD      00092E R   |   6 UMSTA      0009ED R
  6 UNIQ1      001656 R   |   6 UNIQU      001637 R   |   6 UNLKEE     001BD4 R
  6 UNLKFL     001BF3 R   |   6 UNLOCK     001C12 R   |   6 UNTIL      001539 R
    UOFFSET =  000020     |   6 UPDATCP    001B91 R   |   6 UPDATLAS   001B68 R
  6 UPDATPTR   002194 R   |   6 UPDATRUN   001B80 R   |   6 UPDATVP    001BA8 R
  6 UPL1       00063F R   |   6 UPLUS      000628 R   |     UPP     =  000006 
  6 UPPER      0010E9 R   |   6 UPPER1     00110C R   |   6 UPPER2     001115 R
    URLAST  =  000024     |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     UTFLASH =  000022     |     UTIB    =  000012 
    UTMP    =  00000C     |   6 UTYP1      0018DA R   |   6 UTYP2      0018E9 R
  6 UTYPE      0018D5 R   |     UVP     =  00001A     |   6 UZERO      00002B R
  6 VARIA      001804 R   |     VAR_BASE=  000080     |     VAR_TOP =  0017BF 
    VER     =  000003     |   6 VPP        0006EC R   |     VSIZE   =  000006 
    WANT_CON=  000001     |     WANT_DEB=  000000     |     WANT_DOU=  000001 
    WANT_FLO=  000000     |     WANT_SCA=  000001     |     WANT_SEE=  000000 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |   6 WHILE      0015BF R
  6 WITHI      000913 R   |   6 WORDD      0010CF R   |   6 WORDS      0019FA R
  6 WORS1      001A00 R   |   6 WORS2      001A1C R   |   6 WR_BYTE    001CBD R
  6 WR_WORD    001CE2 R   |   6 WTABLE     0022EC R   |   6 WTAT       002310 R
  6 WTINIT     002355 R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XMEM_SIZ=  017830     |     XOFF    =  000013     |     XON     =  000011 
  6 XORR       000613 R   |     XTEMP   =  000026     |     YTEMP   =  000028 
  6 ZEQ1       0024D9 R   |   6 ZERO       000B24 R   |   6 ZL1        0005E0 R
  6 ZLESS      0005D7 R   |   6 app_spac   002A00 R   |   6 baudrate   00037D R
  6 block_er   001DA8 R   |   6 clear_ra   000019 R   |   6 clock_in   000066 R
  6 copy_buf   001E08 R   |   6 copy_buf   001E27 R   |   6 copy_pro   001E27 R
    da      =  000002     |     db      =  000003     |     dc      =  000000 
    dd      =  000001     |   6 erase_fl   001DCA R   |   6 fmove_do   00217D R
  6 main       000016 R   |   6 next_row   00213A R   |   6 no_move    002184 R
  6 pristine   001EA8 R   |   6 proceed_   001DCD R   |   6 reboot     000329 R
  6 reset_ve   001F0F R   |   6 row_eras   001D88 R   |   6 row_eras   001DE1 R
  6 row_eras   001E08 R   |   6 set_opti   001E7C R   |   6 set_vect   001FB0 R
  6 uart_ini   000078 R   |   6 write_ro   001E4C R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   2A00   flags    0

