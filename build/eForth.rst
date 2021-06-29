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
                           000008   113 UFPSW = UBASE+2  ; floating point state word 
                           00000A   114 UTMP = UFPSW+2    ; temporary storage
                           00000C   115 UINN = UTMP+2     ; >IN tib pointer 
                           00000E   116 UCTIB = UINN+2    ; tib count 
                           000010   117 UTIB = UCTIB+2    ; tib address 
                           000012   118 UINTER = UTIB+2   ; interpreter vector 
                           000014   119 UHLD = UINTER+2   ; hold 
                           000016   120 UCNTXT = UHLD+2   ; context, dictionary first link 
                           000018   121 UVP = UCNTXT+2    ; variable pointer 
                           00001A   122 UCP = UVP+2      ; code pointer
                           00001C   123 ULAST = UCP+2    ; last dictionary pointer 
                           00001E   124 UOFFSET = ULAST+2 ; distance between CP and VP to adjust jump address at compile time.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                           000020   125 UTFLASH = UOFFSET+2 ; select where between FLASH and RAM for compilation destination. 
                           000022   126 URLAST = UTFLASH+2 ; context for dictionary in RAM memory 
                                    127 
                                    128 ;******  System Variables  ******
                           000024   129 XTEMP	=	URLAST +2;address called by CREATE
                           000026   130 YTEMP	=	XTEMP+2	;address called by CREATE
                           000024   131 PROD1 = XTEMP	;space for UM*
                           000026   132 PROD2 = PROD1+2
                           000028   133 PROD3 = PROD2+2
                           00002A   134 CARRY = PROD3+2
                           00002C   135 SP0	= CARRY+2	;initial data stack pointer
                           00002E   136 RP0	= SP0+2		;initial return stack pointer
                           000030   137 MS    =   RP0+2         ; millisecond counter 
                           000032   138 CNTDWN =  MS+2          ; count down timer 
                           000034   139 FPTR = CNTDWN+2         ; 24 bits farptr 
                           000035   140 PTR16 = FPTR+1          ; middle byte of farptr 
                           000036   141 PTR8 = FPTR+2           ; least byte of farptr 
                           000038   142 SEEDX = PTR8+2          ; PRNG seed X 
                           00003A   143 SEEDY = SEEDX+2         ; PRNG seed Y 
                                    144 
                                    145 ; EEPROM persistant data  
                           004000   146 APP_LAST = EEPROM_BASE ; Application last word pointer  
                           004002   147 APP_RUN = APP_LAST+2   ; application autorun address 
                           004004   148 APP_CP = APP_RUN+2   ; free application space pointer 
                           004006   149 APP_VP = APP_CP+2  ; free data space pointer 
                                    150 
                                    151 
                                    152 ;***********************************************
                                    153 ;; Version control
                                    154 
                           000003   155 VER     =     3         ;major release version
                           000000   156 EXT     =     0         ;minor extension
                                    157 
                                    158 ;; Constants
                                    159 
                           00FFFF   160 TRUEE   =     0xFFFF      ;true flag
                                    161 
                           000040   162 COMPO   =     0x40     ;lexicon compile only bit
                           000080   163 IMEDD   =     0x80     ;lexicon immediate bit
                           001F7F   164 MASKK   =     0x1F7F  ;lexicon bit mask
                                    165 
                           000002   166 CELLL   =     2       ;size of a cell
                           00000A   167 BASEE   =     10      ;default radix
                           000008   168 BKSPP   =     8       ;back space
                           00000A   169 LF      =     10      ;line feed
                           00000D   170 CRR     =     13      ;carriage return
                           000011   171 XON     =     17
                           000013   172 XOFF    =     19
                           00001B   173 ERR     =     27      ;error escape
                           000027   174 TIC     =     39      ;tick
                           0000CD   175 CALLL   =     0xCD     ;CALL opcodes
                           000080   176 IRET_CODE =   0x80    ; IRET opcode 
                                    177 
                                    178         .macro _ledon
                                    179         .if NUCLEO
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



                                    180         bset PC_ODR,#LED2_BIT
                                    181         .else ;DISCOVERY 
                                    182         .if DISCOVERY
                                    183         bres PD_ODR,#LD1_BIT 
                                    184         .endif
                                    185         .endif
                                    186         .endm
                                    187 
                                    188         .macro _ledoff
                                    189         .if NUCLEO 
                                    190         bres PC_ODR,#LED2_BIT
                                    191         .else ;DISCOVERY 
                                    192         .if DISCOVERY
                                    193         bset PD_ODR,#LD1_BIT 
                                    194         .endif 
                                    195         .endif
                                    196         .endm
                                    197 
                                    198 ;**********************************************************
                                    199         .area DATA (ABS)
      000000                        200         .org RAMBASE 
                                    201 ;**********************************************************
                                    202 
                                    203 ;**********************************************************
                                    204         .area SSEG (ABS) ; STACK
      001700                        205         .org 0x1700
      001700                        206         .ds 256 
                                    207 ; space for DATSTK,TIB and STACK         
                                    208 ;**********************************************************
                                    209 
                                    210 ;**********************************************************
                                    211         .area HOME ; vectors table
                                    212 ;**********************************************************
      008000 82 00 80 96            213 	int main	        ; reset
      008004 82 00 80 80            214 	int NonHandledInterrupt	; trap
      008008 82 00 80 80            215 	int NonHandledInterrupt	; irq0
      00800C 82 00 80 80            216 	int NonHandledInterrupt	; irq1
      008010 82 00 80 80            217 	int NonHandledInterrupt	; irq2
      008014 82 00 80 80            218 	int NonHandledInterrupt	; irq3
      008018 82 00 80 80            219 	int NonHandledInterrupt	; irq4
      00801C 82 00 80 80            220 	int NonHandledInterrupt	; irq5
      008020 82 00 80 80            221 	int NonHandledInterrupt	; irq6
      008024 82 00 80 80            222 	int NonHandledInterrupt	; irq7
      008028 82 00 80 80            223 	int NonHandledInterrupt	; irq8
      00802C 82 00 80 80            224 	int NonHandledInterrupt	; irq9
      008030 82 00 80 80            225 	int NonHandledInterrupt	; irq10
      008034 82 00 80 80            226 	int NonHandledInterrupt	; irq11
      008038 82 00 80 80            227 	int NonHandledInterrupt	; irq12
      00803C 82 00 80 80            228 	int NonHandledInterrupt	; irq13
      008040 82 00 80 80            229 	int NonHandledInterrupt	; irq14
      008044 82 00 80 80            230 	int NonHandledInterrupt	; irq15
      008048 82 00 80 80            231 	int NonHandledInterrupt	; irq16
      00804C 82 00 80 80            232 	int NonHandledInterrupt	; irq17
      008050 82 00 80 80            233 	int NonHandledInterrupt	; irq18
      008054 82 00 80 80            234 	int NonHandledInterrupt	; irq19
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



      008058 82 00 80 80            235 	int NonHandledInterrupt	; irq20
      00805C 82 00 80 80            236 	int NonHandledInterrupt	; irq21
      008060 82 00 80 80            237 	int NonHandledInterrupt	; irq22
      008064 82 00 80 85            238 	int Timer4Handler	; irq23
      008068 82 00 80 80            239 	int NonHandledInterrupt	; irq24
      00806C 82 00 80 80            240 	int NonHandledInterrupt	; irq25
      008070 82 00 80 80            241 	int NonHandledInterrupt	; irq26
      008074 82 00 80 80            242 	int NonHandledInterrupt	; irq27
      008078 82 00 80 80            243 	int NonHandledInterrupt	; irq28
      00807C 82 00 80 80            244 	int NonHandledInterrupt	; irq29
                                    245 
                                    246 ;**********************************************************
                                    247         .area CODE
                                    248 ;**********************************************************
                                    249 
                                    250 ; non handled interrupt reset MCU
      008080                        251 NonHandledInterrupt:
      008080 A6 80            [ 1]  252         ld a, #0x80
      008082 C7 50 D1         [ 1]  253         ld WWDG_CR,a ; WWDG_CR used to reset mcu
                                    254 	;iret
                                    255 
                                    256 ; used for milliseconds counter 
                                    257 ; MS is 16 bits counter 
      008085                        258 Timer4Handler:
      008085 72 5F 53 42      [ 1]  259 	clr TIM4_SR 
      008089 BE 30            [ 2]  260         ldw x,MS 
      00808B 5C               [ 1]  261         incw x 
      00808C BF 30            [ 2]  262         ldw MS,x
      00808E BE 32            [ 2]  263         ldw x,CNTDWN 
      008090 27 03            [ 1]  264         jreq 1$
      008092 5A               [ 2]  265         decw x 
      008093 BF 32            [ 2]  266         ldw CNTDWN,x 
      008095                        267 1$:         
      008095 80               [11]  268         iret 
                                    269 
                                    270 
                                    271 ;; Main entry points and COLD start data
      008096                        272 main:
                                    273 ; clear all RAM
      008096 AE 00 00         [ 2]  274 	ldw X,#RAMBASE
      008099                        275 clear_ram0:
      008099 7F               [ 1]  276 	clr (X)
      00809A 5C               [ 1]  277 	incw X
      00809B A3 17 FF         [ 2]  278 	cpw X,#RAM_END
      00809E 23 F9            [ 2]  279 	jrule clear_ram0
      0080A0 AE 17 FF         [ 2]  280         ldw x,#RPP
      0080A3 94               [ 1]  281         ldw sp,x
                                    282 ; set SEEDX and SEEDY to 1 
      0080A4 3C 39            [ 1]  283         inc SEEDX+1 
      0080A6 3C 3B            [ 1]  284         inc SEEDY+1          
      0080A8 CC 80 C9         [ 2]  285 	jp ORIG
                                    286 
                                    287 ; COLD initialize these variables.
      0080AB                        288 UZERO:
      0080AB 00 0A                  289         .word      BASEE   ;BASE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



      0080AD 00 00                  290         .word      0       ; floating point state 
      0080AF 00 00                  291         .word      0       ;tmp
      0080B1 00 00                  292         .word      0       ;>IN
      0080B3 00 00                  293         .word      0       ;#TIB
      0080B5 17 00                  294         .word      TIBB    ;TIB
      0080B7 93 EC                  295         .word      INTER   ;'EVAL
      0080B9 00 00                  296         .word      0       ;HLD
      0080BB B2 86                  297         .word      LASTN  ;CNTXT pointer
      0080BD 00 80                  298         .word      VAR_BASE   ;variables free space pointer 
      0080BF B3 00                  299         .word      app_space ; FLASH free space pointer 
      0080C1 B2 86                  300         .word      LASTN   ;LAST
      0080C3 00 00                  301         .word      0        ; OFFSET 
      0080C5 00 00                  302         .word      0       ; TFLASH
                                    303 ;       .word      0       ; URLAST   
      0080C7 00 00                  304 UEND:   .word      0
                                    305 
      0080C9                        306 ORIG:   
                                    307 ; initialize SP
      0080C9 AE 17 FF         [ 2]  308         LDW     X,#STACK  ;initialize return stack
      0080CC 94               [ 1]  309         LDW     SP,X
      0080CD BF 2E            [ 2]  310         LDW     RP0,X
      0080CF AE 16 80         [ 2]  311         LDW     X,#DATSTK ;initialize data stack
      0080D2 BF 2C            [ 2]  312         LDW     SP0,X
                           000001   313 .if NUCLEO        
                                    314 ; initialize PC_5 as output to control LED2
                                    315 ; added by Picatout 
      0080D4 72 1A 50 0D      [ 1]  316         bset PC_CR1,#LED2_BIT
      0080D8 72 1A 50 0E      [ 1]  317         bset PC_CR2,#LED2_BIT
      0080DC 72 1A 50 0C      [ 1]  318         bset PC_DDR,#LED2_BIT
                                    319 .endif 
                           000000   320 .if DISCOVERY
                                    321         bset PD_CR1,#LD1_BIT
                                    322         bset PD_CR2,#LD1_BIT
                                    323         bset PD_DDR,#LD1_BIT 
                                    324 .endif
      000060                        325         _ledoff
                           000001     1         .if NUCLEO 
      0080E0 72 1B 50 0A      [ 1]    2         bres PC_ODR,#LED2_BIT
                           000000     3         .else ;DISCOVERY 
                                      4         .if DISCOVERY
                                      5         bset PD_ODR,#LD1_BIT 
                                      6         .endif 
                                      7         .endif
                                    326 ; initialize clock to HSI
                                    327 ; no divisor 16Mhz 
                                    328 ; Added by Picatout 
      0080E4                        329 clock_init:
      0080E4 72 5F 50 C6      [ 1]  330         clr CLK_CKDIVR
      0080E8 72 12 50 C5      [ 1]  331 	bset CLK_SWCR,#CLK_SWCR_SWEN
                           000001   332 .if NUCLEO|DOORBELL
      0080EC A6 E1            [ 1]  333 	ld a,#CLK_SWR_HSI
                           000000   334 .else ; DISCOVERY as 16Mhz crystal
                                    335 	ld a,#CLK_SWR_HSE
                                    336 .endif 
      0080EE C7 50 C4         [ 1]  337 	ld CLK_SWR,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      0080F1 C1 50 C3         [ 1]  338 1$:	cp a,CLK_CMSR
      0080F4 26 FB            [ 1]  339 	jrne 1$
                                    340         
                                    341 ; initialize UART, 115200 8N1
      0080F6                        342 uart_init:
                           000001   343 .if NUCLEO 
      0080F6 72 14 50 C7      [ 1]  344 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1
                                    345 	; configure tx pin
      0080FA 72 1A 50 02      [ 1]  346 	bset PA_DDR,#UART1_TX_PIN ; tx pin
      0080FE 72 1A 50 03      [ 1]  347 	bset PA_CR1,#UART1_TX_PIN ; push-pull output
      008102 72 1A 50 04      [ 1]  348 	bset PA_CR2,#UART1_TX_PIN ; fast output
                                    349 	; baud rate 115200 Fmaster=16Mhz  16000000/115200=139=0x8b
                           000000   350 .else ; DISCOVERY use UART2 
                                    351 	bset CLK_PCKENR1,#CLK_PCKENR1_UART2
                                    352 	; configure tx pin
                                    353 	bset PD_DDR,#UART2_TX_PIN ; tx pin
                                    354 	bset PD_CR1,#UART2_TX_PIN ; push-pull output
                                    355 	bset PD_CR2,#UART2_TX_PIN ; fast output
                                    356 .endif
                                    357 ; baud rate 115200 Fmaster=8Mhz  
      008106 35 0B 52 33      [ 1]  358 	mov UART_BRR2,#0x0b ; must be loaded first
      00810A 35 08 52 32      [ 1]  359 	mov UART_BRR1,#0x8
      00810E 35 0C 52 35      [ 1]  360 	mov UART_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));|(1<<UART_CR2_RIEN))
                                    361 ; initialize timer4, used for millisecond interrupt  
      008112 35 07 53 45      [ 1]  362 	mov TIM4_PSCR,#7 ; prescale 128  
      008116 35 7D 53 46      [ 1]  363 	mov TIM4_ARR,#125 ; set for 1msec.
      00811A 35 05 53 40      [ 1]  364 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      00811E 72 10 53 41      [ 1]  365 	bset TIM4_IER,#TIM4_IER_UIE 
                                    366 ; set TIM4 interrupt priority to highest
      008122 A6 3F            [ 1]  367         ld a,#~(IPR_MASK<<6)
      008124 C4 7F 75         [ 1]  368         and a,ITC_SPR6
      008127 AA C0            [ 1]  369         or a,#(IPR3<<6)
      008129 C7 7F 75         [ 1]  370         ld ITC_SPR6,a 
      00812C 9A               [ 1]  371         rim
      00812D CC 9A ED         [ 2]  372         jp  COLD   ;default=MN1
                                    373 
                                    374 
                                    375 ;; place MCU in sleep mode with
                                    376 ;; halt opcode 
                                    377 ;; BYE ( -- )
      008130 00 00                  378         .word 0
                           0000B2   379         LINK=.
      008132 03                     380         .byte 3 
      008133 42 59 45               381         .ascii "BYE"
      008136                        382 BYE: 
      008136 8E               [10]  383         halt 
      008137 81               [ 4]  384         ret 
                                    385 
                                    386 ; Enable interrupts 
                                    387 ; EI ( -- )
      008138 81 32                  388         .word LINK 
                           0000BA   389         LINK=.
      00813A 02                     390         .byte 2
      00813B 45 49                  391         .ascii "EI"
      00813D                        392 EI:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      00813D 9A               [ 1]  393         rim 
      00813E 81               [ 4]  394         ret 
                                    395 
                                    396 ; Disable interrupts
                                    397 ; DI ( -- )
      00813F 81 3A                  398         .word LINK 
                           0000C1   399         LINK=.
      008141 02                     400         .byte 2 
      008142 44 49                  401         .ascii "DI"
      008144                        402 DI:
      008144 9B               [ 1]  403         sim 
      008145 81               [ 4]  404         ret 
                                    405 
                                    406 ; set interrupt priority level 
                                    407 ; SET-ISP ( n1 n2 -- )
                                    408 ; n1 level {1..3}
                                    409 ; n2 vector {0..29}
      008146 81 41                  410         .word LINK 
                           0000C8   411         LINK=.
      008148 07                     412         .byte 7 
      008149 53 45 54 2D 49 53 50   413         .ascii "SET-ISP"
      008150                        414 SETISP:
      008150 90 93            [ 1]  415         ldw y,x 
      008152 90 FE            [ 2]  416         ldw y,(y)
      008154 A6 04            [ 1]  417         ld a,#4 ; 4 slot per register 
                                    418 ;  quotient select register, remainder select slot in register.        
      008156 90 62            [ 2]  419         div y,a ; register=ITC_SPR1[Y], lshift=2*A 
      008158 A4 03            [ 1]  420         and a,#3 
      00815A 48               [ 1]  421         sll a ; 2*SLOT  lshift 
      00815B 72 A9 7F 70      [ 2]  422         addw y,#ITC_SPR1 
      00815F FF               [ 2]  423         ldw (x),y  ; ( level reg -- )
      008160 90 5F            [ 1]  424         clrw y 
      008162 90 97            [ 1]  425         ld yl,a 
      008164 1D 00 02         [ 2]  426         subw x,#CELLL 
      008167 FF               [ 2]  427         ldw (x),y  ; ( level reg lshift -- )
      008168 90 93            [ 1]  428         ldw y,x 
      00816A 90 EE 02         [ 2]  429         ldw y,(2,y) 
      00816D 90 F6            [ 1]  430         ld a,(y)   ; reg_value
      00816F 1D 00 02         [ 2]  431         subw x,#CELLL 
      008172 FF               [ 2]  432         ldw (x),y ; ( level reg lshift rval -- )
      008173 CD 86 40         [ 4]  433         call OVER ; ( level reg lshift rval lshift -- )
      008176 CD 84 F1         [ 4]  434         call DOLIT 
      008179 00 03                  435         .word 3
      00817B CD 86 26         [ 4]  436         call SWAPP  ; ( level reg lshift rval 3 lshift )
      00817E CD 8B 61         [ 4]  437         call LSHIFT ; creat slot mask 
      008181 CD 88 5F         [ 4]  438         call INVER  ; ( level reg lshift rval mask )
      008184 CD 86 75         [ 4]  439         call ANDD ; ( level reg lshift slot_masked )
      008187 CD 85 DF         [ 4]  440         call TOR  ; ( level reg lshift -- R: slot_masked )
      00818A CD 87 E4         [ 4]  441         call ROT  ; ( reg lshift level )
      00818D CD 86 26         [ 4]  442         call SWAPP ; ( reg level lshift )
      008190 CD 8B 61         [ 4]  443         call LSHIFT  ; ( reg slot_level -- )
      008193 CD 85 C0         [ 4]  444         call RFROM ; ( reg slot_level masked_val )
      008196 CD 86 89         [ 4]  445         call ORR   ; ( reg updated_rval )
      008199 CD 86 26         [ 4]  446         call SWAPP 
      00819C CD 85 7C         [ 4]  447         call CSTOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



                                    448 
                                    449 ; sélectionne l'application 
                                    450 ; qui démarre automatique lors 
                                    451 ; d'un COLD start 
      00819F 81 48                  452         .word LINK 
                           000121   453         LINK=.
      0081A1 07                     454         .byte 7
      0081A2 41 55 54 4F 52 55 4E   455         .ascii "AUTORUN"
      0081A9                        456 AUTORUN:
      0081A9 CD 91 B1         [ 4]  457         call TOKEN 
      0081AC CD 86 16         [ 4]  458         call DUPP 
      0081AF CD 85 24         [ 4]  459         call QBRAN 
      0081B2 82 8F                  460         .word FORGET2
      0081B4 CD 92 AE         [ 4]  461         call NAMEQ
      0081B7 CD 87 D3         [ 4]  462         call QDUP 
      0081BA CD 85 24         [ 4]  463         call QBRAN 
      0081BD 82 8F                  464         .word FORGET2
      0081BF CD 86 0C         [ 4]  465         call DROP 
      0081C2 1D 00 04         [ 2]  466         subw x,#2*CELLL 
      0081C5 90 5F            [ 1]  467         clrw y 
      0081C7 FF               [ 2]  468         ldw (x),y 
      0081C8 90 AE 40 02      [ 2]  469         ldw y,#APP_RUN 
      0081CC EF 02            [ 2]  470         ldw (2,x),y 
      0081CE CC 9D E9         [ 2]  471         jp EESTORE 
                                    472 
                                    473 ;; Reset dictionary pointer before 
                                    474 ;; forgotten word. RAM space and 
                                    475 ;; interrupt vector defined after 
                                    476 ;; must be resetted also.
      0081D1 81 A1                  477         .word LINK 
                           000153   478         LINK=.
      0081D3 06                     479         .byte 6
      0081D4 46 4F 52 47 45 54      480         .ascii "FORGET" 
      0081DA                        481 FORGET: 
      0081DA CD 91 B1         [ 4]  482         call TOKEN
      0081DD CD 86 16         [ 4]  483         call DUPP 
      0081E0 CD 85 24         [ 4]  484         call QBRAN 
      0081E3 82 8F                  485         .word FORGET2
      0081E5 CD 92 AE         [ 4]  486         call NAMEQ ; ( a -- ca na | a F )
      0081E8 CD 87 D3         [ 4]  487         call QDUP 
      0081EB CD 85 24         [ 4]  488         call QBRAN 
      0081EE 82 8F                  489         .word FORGET2
                                    490 ; only forget users words 
      0081F0 CD 86 16         [ 4]  491         call DUPP ; ( ca na na )
      0081F3 CD 84 F1         [ 4]  492         call DOLIT 
      0081F6 B3 00                  493         .word app_space 
      0081F8 CD 86 26         [ 4]  494         call SWAPP 
      0081FB CD 89 05         [ 4]  495         call  ULESS 
      0081FE CD 85 24         [ 4]  496         call QBRAN 
      008201 82 51                  497         .word FORGET6 
                                    498 ; ( ca na -- )        
                                    499 ;reset ivec with address >= ca
      008203 CD 86 26         [ 4]  500         call SWAPP ; ( na ca -- ) 
      008206 CD 9F EC         [ 4]  501         call CHKIVEC ; ( na -- ) 
                                    502 ; start at LAST and link back to na 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



                                    503 ; if variable found reset VP at that point.
      008209                        504 FORGET1:
      008209 CD 87 95         [ 4]  505         call LAST 
      00820C CD 85 6F         [ 4]  506         call AT 
      00820F CD 86 16         [ 4]  507         call DUPP  ; ( -- na last last )
      008212 CD 82 A5         [ 4]  508         call FREEVAR ; ( -- na last )
      008215 CD 86 16         [ 4]  509         call DUPP 
      008218 CD 84 F1         [ 4]  510         call DOLIT 
      00821B 00 02                  511         .word 2 
      00821D CD 88 BE         [ 4]  512         call SUBB ; ( na last -- na last lfa ) link address 
      008220 CD 85 6F         [ 4]  513         call AT 
      008223 CD 86 16         [ 4]  514         call DUPP ; ( -- na last a a )
      008226 CD 87 69         [ 4]  515         call CNTXT 
      008229 CD 85 58         [ 4]  516         call STORE
      00822C CD 87 95         [ 4]  517         call LAST  
      00822F CD 85 58         [ 4]  518         call STORE ; ( --  na last )
      008232 CD 86 40         [ 4]  519         call OVER 
      008235 CD 88 E6         [ 4]  520         call EQUAL ; ( na last na -- na T|F ) 
      008238 CD 85 24         [ 4]  521         call QBRAN 
      00823B 82 09                  522         .word FORGET1 
                                    523 ; ( na -- )
      00823D CD 84 F1         [ 4]  524         call DOLIT 
      008240 00 02                  525         .word 2 
      008242 CD 88 BE         [ 4]  526         call SUBB 
      008245 CD 87 85         [ 4]  527         call CPP 
      008248 CD 85 58         [ 4]  528         call STORE  
      00824B CD 9C 1C         [ 4]  529         call UPDATCP 
      00824E CC 9B F3         [ 2]  530         jp UPDATLAST 
      008251                        531 FORGET6: ; tried to forget a RAM or system word 
                                    532 ; ( ca na -- )
      008251 1D 00 02         [ 2]  533         subw x,#CELLL 
      008254 90 BE 2C         [ 2]  534         ldw y,SP0 
      008257 FF               [ 2]  535         ldw (x),y  
      008258 CD 89 05         [ 4]  536         call ULESS
      00825B CD 85 24         [ 4]  537         call QBRAN 
      00825E 82 81                  538         .word PROTECTED 
      008260 CD 93 BA         [ 4]  539         call ABORQ 
      008263 1D                     540         .byte 29
      008264 20 46 6F 72 20 52 41   541         .ascii " For RAM definition do REBOOT"
             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      008281                        542 PROTECTED:
      008281 CD 93 BA         [ 4]  543         call ABORQ
      008284 0A                     544         .byte 10
      008285 20 50 72 6F 74 65 63   545         .ascii " Protected"
             74 65 64
      00828F                        546 FORGET2: ; no name or not found in dictionary 
      00828F CD 93 BA         [ 4]  547         call ABORQ
      008292 05                     548         .byte 5
      008293 20 77 68 61 74         549         .ascii " what"
      008298                        550 FORGET4:
      008298 CC 86 0C         [ 2]  551         jp DROP 
                                    552 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



                                    553 
                                    554 ;---------------------------------
                                    555 ; if na is variable 
                                    556 ; free variable data  
                                    557 ; FREEVAR ( na -- )
                                    558 ;---------------------------------
      00829B 81 D3                  559         .word LINK 
                           00021D   560         LINK=.
      00829D 07                     561         .byte 7 
      00829E 46 52 45 45 56 41 52   562         .ascii "FREEVAR"
      0082A5                        563 FREEVAR:
      0082A5 CD 86 16         [ 4]  564         call DUPP ; ( na na -- )
      0082A8 CD 85 8D         [ 4]  565         CALL CAT  ; ( na c -- )
      0082AB CD 8B 43         [ 4]  566         call ONEP ;
      0082AE CD 88 45         [ 4]  567         CALL PLUS ; ( na c+1 -- ca ) 
      0082B1 CD 8B 43         [ 4]  568         call ONEP ; ( ca+ -- ) to get routne address 
      0082B4 CD 86 16         [ 4]  569         call DUPP ; ( ca+ ca+ -- )
      0082B7 CD 85 6F         [ 4]  570         CALL AT   ; ( ca+ fnaddr -- ) ; fnaddr is routine address 
      0082BA CD 84 F1         [ 4]  571         call DOLIT 
      0082BD 86 D6                  572         .word DOVAR ; if routine address is DOVAR then variable 
      0082BF CD 88 E6         [ 4]  573         call EQUAL  ; ( ca+ fnaddr DOVAR -- ca+ T|F ) 
      0082C2 CD 85 24         [ 4]  574         call QBRAN 
      0082C5 82 DB                  575         .word FREEVAR4 
      0082C7 CD 84 F1         [ 4]  576         call DOLIT 
      0082CA 00 02                  577         .word 2 
      0082CC CD 88 45         [ 4]  578         call PLUS  ; ( ca+ 2 -- da ) da is data address 
      0082CF CD 85 6F         [ 4]  579         call AT 
      0082D2 CD 87 77         [ 4]  580         call VPP   
      0082D5 CD 85 58         [ 4]  581         call STORE 
      0082D8 CC 9C 33         [ 2]  582         jp UPDATVP 
      0082DB                        583 FREEVAR4: ; not variable
      0082DB CC 86 0C         [ 2]  584         jp  DROP 
                                    585 
                                    586 ;    SEED ( n -- )
                                    587 ; Initialize PRNG seed with n 
      0082DE 82 9D                  588         .word LINK 
                           000260   589         LINK=. 
      0082E0 04                     590         .byte 4 
      0082E1 53 45 45 44            591         .ascii "SEED" 
      0082E5                        592 SEED:
      0082E5 90 93            [ 1]  593         ldw y,x 
      0082E7 1C 00 02         [ 2]  594         addw x,#CELLL
      0082EA 90 FE            [ 2]  595         ldw y,(y)
      0082EC 90 9E            [ 1]  596         ld a,yh 
      0082EE B7 38            [ 1]  597         ld SEEDX,a 
      0082F0 90 9F            [ 1]  598         ld a,yl 
      0082F2 B7 3A            [ 1]  599         ld SEEDY,a 
      0082F4 81               [ 4]  600         ret 
                                    601 
                                    602 ;    RANDOM ( u1 -- u2 )
                                    603 ; Pseudo random number betwen 0 and u1-1
      0082F5 82 E0                  604         .word LINK 
                           000277   605         LINK=.
      0082F7 06                     606         .byte 6
      0082F8 52 41 4E 44 4F 4D      607         .ascii "RANDOM" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      0082FE                        608 RANDOM:
                                    609 ;local variable 
                           000001   610         SPSAVE=1
                           000002   611         VSIZE=2 
      0082FE 52 02            [ 2]  612         sub sp,#VSIZE
      008300 1F 01            [ 2]  613         ldw (SPSAVE,sp),x  
                                    614 ; XTEMP=(SEEDX<<5)^SEEDX 
      008302 90 93            [ 1]  615         ldw y,x 
      008304 90 FE            [ 2]  616         ldw y,(y)
      008306 90 BF 26         [ 2]  617         ldw YTEMP,y 
      008309 BE 38            [ 2]  618 	ldw x,SEEDX 
      00830B 58               [ 2]  619 	sllw x 
      00830C 58               [ 2]  620 	sllw x 
      00830D 58               [ 2]  621 	sllw x 
      00830E 58               [ 2]  622 	sllw x 
      00830F 58               [ 2]  623 	sllw x 
      008310 9E               [ 1]  624 	ld a,xh 
      008311 B8 38            [ 1]  625 	xor a,SEEDX 
      008313 B7 24            [ 1]  626 	ld XTEMP,a 
      008315 9F               [ 1]  627 	ld a,xl 
      008316 B8 39            [ 1]  628 	xor a,SEEDX+1 
      008318 B7 25            [ 1]  629 	ld XTEMP+1,a 
                                    630 ; SEEDX=SEEDY 
      00831A BE 3A            [ 2]  631 	ldw x,SEEDY 
      00831C BF 38            [ 2]  632 	ldw SEEDX,x  
                                    633 ; SEEDY=SEEDY^(SEEDY>>1)
      00831E 54               [ 2]  634 	srlw x 
      00831F 9E               [ 1]  635 	ld a,xh 
      008320 B8 3A            [ 1]  636 	xor a,SEEDY 
      008322 B7 3A            [ 1]  637 	ld SEEDY,a  
      008324 9F               [ 1]  638 	ld a,xl 
      008325 B8 3B            [ 1]  639 	xor a,SEEDY+1 
      008327 B7 3B            [ 1]  640 	ld SEEDY+1,a 
                                    641 ; XTEMP>>3 
      008329 BE 24            [ 2]  642 	ldw x,XTEMP 
      00832B 54               [ 2]  643 	srlw x 
      00832C 54               [ 2]  644 	srlw x 
      00832D 54               [ 2]  645 	srlw x 
                                    646 ; x=XTEMP^x 
      00832E 9E               [ 1]  647 	ld a,xh 
      00832F B8 24            [ 1]  648 	xor a,XTEMP 
      008331 95               [ 1]  649 	ld xh,a 
      008332 9F               [ 1]  650 	ld a,xl 
      008333 B8 25            [ 1]  651 	xor a,XTEMP+1  
      008335 97               [ 1]  652 	ld xl,a 
                                    653 ; SEEDY=x^SEEDY 
      008336 B8 3B            [ 1]  654 	xor a,SEEDY+1
      008338 97               [ 1]  655 	ld xl,a 
      008339 9E               [ 1]  656 	ld a,xh 
      00833A B8 3A            [ 1]  657 	xor a,SEEDY
      00833C 95               [ 1]  658 	ld xh,a 
      00833D BF 3A            [ 2]  659 	ldw SEEDY,x 
                                    660 ; return SEEDY modulo YTEMP  
      00833F 90 BE 26         [ 2]  661 	ldw y,YTEMP  
      008342 65               [ 2]  662 	divw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      008343 1E 01            [ 2]  663 	ldw x,(SPSAVE,sp)
      008345 FF               [ 2]  664         ldw (x),y 
      008346 5B 02            [ 2]  665         addw sp,#VSIZE 
      008348 81               [ 4]  666 	ret 
                                    667 
                                    668 
                                    669 ;;
                                    670 ;; get millisecond counter 
                                    671 ;; msec ( -- u )
                                    672 ;; Added by Picatout 2020-04-26
      008349 82 F7                  673         .word LINK  
                           0002CB   674         LINK = . 
      00834B 04                     675         .byte 4
      00834C 4D 53 45 43            676         .ascii "MSEC"
      008350                        677 MSEC: 
      008350 1D 00 02         [ 2]  678         subw x,#CELLL 
      008353 90 BE 30         [ 2]  679         ldw y,MS 
      008356 FF               [ 2]  680         ldw (x),y 
      008357 81               [ 4]  681         ret 
                                    682 
                                    683 ; suspend execution for u msec 
                                    684 ;  pause ( u -- )
      008358 83 4B                  685         .word LINK 
                           0002DA   686         LINK=.
      00835A 05                     687         .byte 5 
      00835B 50 41 55 53 45         688         .ascii "PAUSE"
      008360                        689 PAUSE:
      008360 90 93            [ 1]  690         ldw y,x
      008362 90 FE            [ 2]  691         ldw y,(y)
      008364 72 B9 00 30      [ 2]  692         addw y,MS 
      008368 8F               [10]  693 1$:     wfi  
      008369 90 B3 30         [ 2]  694         cpw y,MS  
      00836C 26 FA            [ 1]  695         jrne 1$        
      00836E 1C 00 02         [ 2]  696         addw x,#CELLL 
      008371 81               [ 4]  697         ret 
                                    698 
                                    699 ; initialize count down timer 
                                    700 ;  TIMER ( u -- )  milliseconds 
      008372 83 5A                  701         .word LINK 
                           0002F4   702         LINK=.
      008374 05                     703         .byte 5 
      008375 54 49 4D 45 52         704         .ascii "TIMER" 
      00837A                        705 TIMER:
      00837A 90 93            [ 1]  706         ldw y,x
      00837C 90 FE            [ 2]  707         ldw y,(y) 
      00837E 90 BF 32         [ 2]  708         ldw CNTDWN,y
      008381 1C 00 02         [ 2]  709         addw x,#CELLL 
      008384 81               [ 4]  710         ret 
                                    711 
                                    712 ; check for TIMER exiparition 
                                    713 ;  TIMEOUT? ( -- 0|-1 )
      008385 83 74                  714         .word LINK 
                           000307   715         LINK=. 
      008387 08                     716         .byte 8 
      008388 54 49 4D 45 4F 55 54   717         .ascii "TIMEOUT?"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal  3F-Bits]



             3F
      008390                        718 TIMEOUTQ: 
      008390 4F               [ 1]  719         clr a
      008391 1D 00 02         [ 2]  720         subw x,#CELLL 
      008394 90 BE 32         [ 2]  721         ldw y,CNTDWN 
      008397 26 01            [ 1]  722         jrne 1$ 
      008399 43               [ 1]  723         cpl a 
      00839A E7 01            [ 1]  724 1$:     ld (1,x),a 
      00839C F7               [ 1]  725         ld (x),a 
      00839D 81               [ 4]  726         ret         
                                    727 
                                    728 ; reboot MCU 
                                    729 ; REBOOT ( -- )
      00839E 83 87                  730         .word LINK 
                           000320   731         LINK=. 
      0083A0 06                     732         .byte 6 
      0083A1 52 45 42 4F 4F 54      733         .ascii "REBOOT"
      0083A7                        734 reboot:
      0083A7 CC 80 80         [ 2]  735         jp NonHandledInterrupt
                                    736 
                                    737 ; compile to flash memory 
                                    738 ; TO-FLASH ( -- )
      0083AA 83 A0                  739         .word LINK 
                           00032C   740         LINK=.
      0083AC 08                     741         .byte 8
      0083AD 54 4F 2D 46 4C 41 53   742         .ascii "TO-FLASH"
             48
      0083B5                        743 TOFLASH:
      0083B5 CD 87 A8         [ 4]  744         call RAMLAST 
      0083B8 CD 85 6F         [ 4]  745         call AT 
      0083BB CD 87 D3         [ 4]  746         call QDUP 
      0083BE CD 85 24         [ 4]  747         call QBRAN
      0083C1 83 E4                  748         .word 1$
      0083C3 CD 93 BA         [ 4]  749         call ABORQ 
      0083C6 1D                     750         .byte 29
      0083C7 20 4E 6F 74 20 77 68   751         .ascii " Not while definitions in RAM"   
             69 6C 65 20 64 65 66
             69 6E 69 74 69 6F 6E
             73 20 69 6E 20 52 41
             4D
      0083E4 90 AE FF FF      [ 2]  752 1$:     ldw y,#-1 
      0083E8 90 BF 20         [ 2]  753         ldw UTFLASH,y
      0083EB 81               [ 4]  754         ret 
                                    755 
                                    756 ; compile to RAM 
                                    757 ; TO-RAM ( -- )
      0083EC 83 AC                  758         .word LINK 
                           00036E   759         LINK=.
      0083EE 06                     760         .byte 6 
      0083EF 54 4F 2D 52 41 4D      761         .ascii "TO-RAM"
      0083F5                        762 TORAM:
      0083F5 90 5F            [ 1]  763         clrw y 
      0083F7 90 BF 20         [ 2]  764         ldw UTFLASH,y 
      0083FA 81               [ 4]  765         ret 
                                    766 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



                                    767 ;; BAUD RATE constants table
                                    768 ; values to put in BRR1 & BRR2 
      0083FB                        769 baudrate: 
      0083FB A0 1B                  770 	.byte 0xa0,0x1b ; 2400
      0083FD D0 05                  771 	.byte 0xd0,0x5  ; 4800 
      0083FF 68 03                  772 	.byte 0x68,0x3  ; 9600
      008401 34 01                  773 	.byte 0x34,0x1  ; 19200
      008403 11 06                  774 	.byte 0x11,0x6  ; 57600
      008405 08 0B                  775 	.byte 0x8,0xb   ; 115200
                                    776 
                                    777 ; BAUD RATE CONSTANTS names 
                                    778 ; 2400 baud
      008407 83 EE                  779 	.word LINK
                           000389   780 LINK	= .
      008409 04                     781 	.byte 4
      00840A 42 32 4B 34            782 	.ascii "B2K4" 
      00840E                        783 B2K4:
      00840E 1D 00 02         [ 2]  784 	subw x,#CELLL 
      008411 90 5F            [ 1]  785         clrw y
      008413 FF               [ 2]  786         ldw (x),y
      008414 81               [ 4]  787 	ret
                                    788 ; 4800 baud	
      008415 84 09                  789 	.word LINK
                           000397   790 LINK	= .
      008417 04                     791 	.byte 4
      008418 42 34 4B 38            792 	.ascii "B4K8" 
      00841C                        793 B4K8:
      00841C 1D 00 02         [ 2]  794         subw x,#CELLL 
      00841F 90 AE 00 02      [ 2]  795         ldw y,#2 
      008423 FF               [ 2]  796         ldw (x),y
      008424 81               [ 4]  797         ret 
                                    798 ; 9600 baud
      008425 84 17                  799 	.word LINK
                           0003A7   800 LINK	= .
      008427 04                     801 	.byte 4
      008428 42 39 4B 36            802 	.ascii "B9K6" 
      00842C                        803 B9K6:
      00842C 1D 00 02         [ 2]  804         subw x,#CELLL 
      00842F 90 AE 00 04      [ 2]  805         ldw y,#4 
      008433 FF               [ 2]  806         ldw (x),y 
      008434 81               [ 4]  807         ret 
                                    808 ; 19200 baud
      008435 84 27                  809 	.word LINK
                           0003B7   810 LINK	= .
      008437 05                     811 	.byte 5
      008438 42 31 39 4B 32         812 	.ascii "B19K2" 
      00843D                        813 B19K2:
      00843D 1D 00 02         [ 2]  814         subw x,#CELLL
      008440 90 AE 00 06      [ 2]  815         ldw y,#6 
      008444 FF               [ 2]  816         ldw (x),y 
      008445 81               [ 4]  817         ret 
                                    818 ; 57600 baud        
      008446 84 37                  819 	.word LINK
                           0003C8   820 LINK	= .
      008448 05                     821 	.byte 5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      008449 42 35 37 4B 36         822 	.ascii "B57K6" 
      00844E                        823 B57K6:
      00844E 1D 00 02         [ 2]  824         subw x,#CELLL 
      008451 90 AE 00 08      [ 2]  825         ldw y,#8 
      008455 FF               [ 2]  826         ldw (x),y 
      008456 81               [ 4]  827         ret 
                                    828 ; 115200 baud 
      008457 84 48                  829 	.word LINK
                           0003D9   830 LINK	= .
      008459 06                     831 	.byte 6
      00845A 42 31 31 35 4B 32      832 	.ascii "B115K2" 
      008460                        833 B115K2:
      008460 1D 00 02         [ 2]  834 	subw x,#CELLL 
      008463 90 AE 00 0A      [ 2]  835         ldw y,#10 
      008467 FF               [ 2]  836         ldw (x),y 
      008468 81               [ 4]  837         ret 
                                    838 	
                                    839 ;; set UART2 BAUD rate
                                    840 ;	BAUD ( u -- )
      008469 84 59                  841 	.word LINK 
                           0003EB   842 LINK	= .
      00846B 04                     843 	.byte 4
      00846C 42 41 55 44            844 	.ascii "BAUD" 
      008470                        845 BAUD:
      008470 1D 00 02         [ 2]  846 	subw x,#CELLL
      008473 90 AE 83 FB      [ 2]  847         ldw y,#baudrate 
      008477 FF               [ 2]  848         ldw (x),y 
      008478 CD 88 45         [ 4]  849         call PLUS
      00847B 90 93            [ 1]  850         ldw y,x  
      00847D 90 FE            [ 2]  851         ldw y,(y)
      00847F 90 F6            [ 1]  852         ld a,(y)
      008481 88               [ 1]  853         push a 
      008482 90 5C            [ 1]  854         incw y 
      008484 90 F6            [ 1]  855         ld a,(y)
      008486 C7 52 33         [ 1]  856         ld UART_BRR2,a 
      008489 84               [ 1]  857         pop a
      00848A C7 52 32         [ 1]  858         ld UART_BRR1,a 
      00848D 1C 00 02         [ 2]  859         addw x,#CELLL 
      008490 81               [ 4]  860         ret 
                                    861 
                                    862 ;; Device dependent I/O
                                    863 ;       ?RX     ( -- c T | F )
                                    864 ;         Return input byte and true, or false.
      008491 84 6B                  865         .word      LINK 
                           000413   866 LINK	= .
      008493 04                     867         .byte      4
      008494 3F 4B 45 59            868         .ascii     "?KEY"
      008498                        869 QKEY:
      008498 90 5F            [ 1]  870         CLRW Y 
      00849A 72 0B 52 30 0B   [ 2]  871         BTJF UART_SR,#UART_SR_RXNE,INCH   ;check status
      00849F C6 52 31         [ 1]  872         LD    A,UART_DR   ;get char in A
      0084A2 1D 00 02         [ 2]  873 	SUBW	X,#2
      0084A5 E7 01            [ 1]  874         LD     (1,X),A
      0084A7 7F               [ 1]  875 	CLR	(X)
      0084A8 90 53            [ 2]  876         CPLW     Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      0084AA                        877 INCH:
      0084AA 1D 00 02         [ 2]  878 		SUBW	X,#2
      0084AD FF               [ 2]  879         LDW     (X),Y
      0084AE 81               [ 4]  880         RET
                                    881 
                                    882 ;       TX!     ( c -- )
                                    883 ;       Send character c to  output device.
      0084AF 84 93                  884         .word      LINK
                           000431   885 LINK	= .
      0084B1 04                     886         .byte      4
      0084B2 45 4D 49 54            887         .ascii     "EMIT"
      0084B6                        888 EMIT:
      0084B6 E6 01            [ 1]  889         LD     A,(1,X)
      0084B8 1C 00 02         [ 2]  890 	ADDW	X,#2
      0084BB 72 0F 52 30 FB   [ 2]  891 OUTPUT: BTJF UART_SR,#UART_SR_TXE,OUTPUT  ;loop until tx empty 
      0084C0 C7 52 31         [ 1]  892         LD    UART_DR,A   ;send A
      0084C3 81               [ 4]  893         RET
                                    894 
                                    895 ;       FC-XON  ( -- )
                                    896 ;       send XON character 
      0084C4 84 B1                  897         .word LINK
                           000446   898 LINK    = .
      0084C6 06                     899         .byte 6 
      0084C7 46 43 2D 58 4F 4E      900         .ascii "FC-XON"
      0084CD                        901 FC_XON:
      0084CD 1D 00 02         [ 2]  902         subw x,#CELLL 
      0084D0 7F               [ 1]  903         clr (x)
      0084D1 A6 11            [ 1]  904         ld a,#XON 
      0084D3 E7 01            [ 1]  905         ld (1,x),a 
      0084D5 CD 84 B6         [ 4]  906         call EMIT 
      0084D8 81               [ 4]  907         ret 
                                    908 
                                    909 ;       FC-XOFF ( -- )
                                    910 ;       Send XOFF character 
      0084D9 84 C6                  911         .word LINK
                           00045B   912 LINK    = .
      0084DB 07                     913         .byte 7
      0084DC 46 43 2D 58 4F 46 46   914         .ascii "FC-XOFF"
      0084E3                        915 FC_XOFF:
      0084E3 1D 00 02         [ 2]  916         subw x,#CELLL 
      0084E6 7F               [ 1]  917         clr (x)
      0084E7 A6 13            [ 1]  918         ld a,#XOFF 
      0084E9 E7 01            [ 1]  919         ld (1,x),a 
      0084EB CD 84 B6         [ 4]  920         call EMIT 
      0084EE 81               [ 4]  921         ret
                                    922 
                                    923 ;; The kernel
                                    924 
                                    925 ;       doLIT   ( -- w )
                                    926 ;       Push an inline literal.
      0084EF 84 DB                  927         .word      LINK
                                    928 ;LINK	= 	.
                                    929 ;	.byte      COMPO+5
                                    930 ;        .ascii     "DOLIT"
      0084F1                        931 DOLIT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      0084F1 1D 00 02         [ 2]  932 	SUBW X,#2
      0084F4 16 01            [ 2]  933         ldw y,(1,sp)
      0084F6 90 FE            [ 2]  934         ldw y,(y)
      0084F8 FF               [ 2]  935         ldw (x),y
      0084F9 90 85            [ 2]  936         popw y 
      0084FB 90 EC 02         [ 2]  937         jp (2,y)
                                    938 
                                    939 ;       next    ( -- )
                                    940 ;       Code for  single index loop.
      0084FE 84 DB                  941         .word      LINK
                           000480   942 LINK	= 	.
      008500 44                     943 	.byte      COMPO+4
      008501 6E 65 78 74            944         .ascii     "next"
      008505                        945 DONXT:
      008505 16 03            [ 2]  946 	LDW Y,(3,SP)
      008507 90 5A            [ 2]  947 	DECW Y
      008509 2A 07            [ 1]  948 	JRPL NEX1 ; jump if N=0
      00850B 90 85            [ 2]  949 	POPW Y
      00850D 5B 02            [ 2]  950         addw sp,#2
      00850F 90 EC 02         [ 2]  951         JP (2,Y)
      008512                        952 NEX1:
      008512 17 03            [ 2]  953         LDW (3,SP),Y
      008514 90 85            [ 2]  954         POPW Y
      008516 90 FE            [ 2]  955 	LDW Y,(Y)
      008518 90 FC            [ 2]  956 	JP (Y)
                                    957 
                                    958 ;       ?branch ( f -- )
                                    959 ;       Branch if flag is zero.
      00851A 85 00                  960         .word      LINK
                           00049C   961 LINK	= 	.
      00851C 47                     962 	.byte      COMPO+7
      00851D 3F 42 52 41 4E 43 48   963         .ascii     "?BRANCH"
      008524                        964 QBRAN:	
      008524 90 93            [ 1]  965         LDW Y,X
      008526 1C 00 02         [ 2]  966 	ADDW X,#2
      008529 90 FE            [ 2]  967 	LDW Y,(Y)
      00852B 27 0E            [ 1]  968         JREQ     BRAN
      00852D 90 85            [ 2]  969 	POPW Y
      00852F 90 EC 02         [ 2]  970 	JP (2,Y)
                                    971         
                                    972 ;       branch  ( -- )
                                    973 ;       Branch to an inline address.
      008532 85 1C                  974         .word      LINK
                           0004B4   975 LINK	= 	.
      008534 46                     976 	.byte      COMPO+6
      008535 42 52 41 4E 43 48      977         .ascii     "BRANCH"
      00853B                        978 BRAN:
      00853B 90 85            [ 2]  979         POPW Y
      00853D 90 FE            [ 2]  980 	LDW Y,(Y)
      00853F 90 FC            [ 2]  981         JP     (Y)
                                    982 
                                    983 ;       EXECUTE ( ca -- )
                                    984 ;       Execute  word at ca.
      008541 85 34                  985         .word      LINK
                           0004C3   986 LINK	= 	.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      008543 07                     987         .byte       7
      008544 45 58 45 43 55 54 45   988         .ascii     "EXECUTE"
      00854B                        989 EXECU:
      00854B 90 93            [ 1]  990         LDW Y,X
      00854D 1C 00 02         [ 2]  991 	ADDW X,#2
      008550 90 FE            [ 2]  992 	LDW  Y,(Y)
      008552 90 FC            [ 2]  993         JP   (Y)
                                    994 
                           000001   995 OPTIMIZE = 1
                           000001   996 .if OPTIMIZE 
                                    997 ; remplacement de CALL EXIT par 
                                    998 ; le opcode de RET.
                                    999 ; Voir modification au code de ";"
                           000000  1000 .else 
                                   1001 ;       EXIT    ( -- )
                                   1002 ;       Terminate a colon definition.
                                   1003         .word      LINK
                                   1004 LINK = .
                                   1005         .byte      4
                                   1006         .ascii     "EXIT"
                                   1007 EXIT:
                                   1008         POPW Y
                                   1009         RET
                                   1010 .endif 
                                   1011 
                                   1012 ;       !       ( w a -- )
                                   1013 ;       Pop  data stack to memory.
      008554 85 43                 1014         .word      LINK
                           0004D6  1015 LINK = .
      008556 01                    1016         .byte      1
      008557 21                    1017         .ascii     "!"
      008558                       1018 STORE:
      008558 90 93            [ 1] 1019         LDW Y,X
      00855A 90 FE            [ 2] 1020         LDW Y,(Y)    ;Y=a
      00855C 90 BF 26         [ 2] 1021         LDW YTEMP,Y
      00855F 90 93            [ 1] 1022         LDW Y,X
      008561 90 EE 02         [ 2] 1023         LDW Y,(2,Y)
      008564 91 CF 26         [ 5] 1024         LDW [YTEMP],Y ;store w at a
      008567 1C 00 04         [ 2] 1025         ADDW X,#4 ; DDROP 
      00856A 81               [ 4] 1026         RET     
                                   1027 
                                   1028 ;       @       ( a -- w )
                                   1029 ;       Push memory location to stack.
      00856B 85 56                 1030         .word      LINK
                           0004ED  1031 LINK	= 	.
      00856D 01                    1032         .byte    1
      00856E 40                    1033         .ascii	"@"
      00856F                       1034 AT:
      00856F 90 93            [ 1] 1035         LDW Y,X     ;Y = a
      008571 90 FE            [ 2] 1036         LDW Y,(Y)   ; address 
      008573 90 FE            [ 2] 1037         LDW Y,(Y)   ; value 
      008575 FF               [ 2] 1038         LDW (X),Y ;w = @Y
      008576 81               [ 4] 1039         RET     
                                   1040 
                                   1041 ;       C!      ( c b -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



                                   1042 ;       Pop  data stack to byte memory.
      008577 85 6D                 1043         .word      LINK
                           0004F9  1044 LINK	= .
      008579 02                    1045         .byte      2
      00857A 43 21                 1046         .ascii     "C!"
      00857C                       1047 CSTOR:
      00857C 90 93            [ 1] 1048         LDW Y,X
      00857E 90 FE            [ 2] 1049 	LDW Y,(Y)    ;Y=b
      008580 E6 03            [ 1] 1050         LD A,(3,X)    ;D = c
      008582 90 F7            [ 1] 1051         LD  (Y),A     ;store c at b
      008584 1C 00 04         [ 2] 1052 	ADDW X,#4 ; DDROP 
      008587 81               [ 4] 1053         RET     
                                   1054 
                                   1055 ;       C@      ( b -- c )
                                   1056 ;       Push byte in memory to  stack.
      008588 85 79                 1057         .word      LINK
                           00050A  1058 LINK	= 	.
      00858A 02                    1059         .byte      2
      00858B 43 40                 1060         .ascii     "C@"
      00858D                       1061 CAT:
      00858D 90 93            [ 1] 1062         LDW Y,X     ;Y=b
      00858F 90 FE            [ 2] 1063         LDW Y,(Y)
      008591 90 F6            [ 1] 1064         LD A,(Y)
      008593 E7 01            [ 1] 1065         LD (1,X),A
      008595 7F               [ 1] 1066         CLR (X)
      008596 81               [ 4] 1067         RET     
                                   1068 
                                   1069 ;       RP@     ( -- a )
                                   1070 ;       Push current RP to data stack.
      008597 85 8A                 1071         .word      LINK
                           000519  1072 LINK	= .
      008599 03                    1073         .byte      3
      00859A 52 50 40              1074         .ascii     "RP@"
      00859D                       1075 RPAT:
      00859D 90 96            [ 1] 1076         LDW Y,SP    ;save return addr
      00859F 1D 00 02         [ 2] 1077         SUBW X,#2
      0085A2 FF               [ 2] 1078         LDW (X),Y
      0085A3 81               [ 4] 1079         RET     
                                   1080 
                                   1081 ;       RP!     ( a -- )
                                   1082 ;       Set  return stack pointer.
      0085A4 85 99                 1083         .word      LINK
                           000526  1084 LINK	= 	. 
      0085A6 43                    1085 	.byte      COMPO+3
      0085A7 52 50 21              1086         .ascii     "RP!"
      0085AA                       1087 RPSTO:
      0085AA 90 85            [ 2] 1088         POPW Y
      0085AC 90 BF 26         [ 2] 1089         LDW YTEMP,Y
      0085AF 90 93            [ 1] 1090         LDW Y,X
      0085B1 90 FE            [ 2] 1091         LDW Y,(Y)
      0085B3 90 94            [ 1] 1092         LDW SP,Y
      0085B5 1C 00 02         [ 2] 1093         ADDW x,#CELLL ; a was not dropped, Picatout 2020-05-24
      0085B8 92 CC 26         [ 5] 1094         JP [YTEMP]
                                   1095 
                                   1096 ;       R>      ( -- w )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



                                   1097 ;       Pop return stack to data stack.
      0085BB 85 A6                 1098         .word      LINK
                           00053D  1099 LINK	= 	. 
      0085BD 42                    1100 	.byte      COMPO+2
      0085BE 52 3E                 1101         .ascii     "R>"
      0085C0                       1102 RFROM:
      0085C0 90 85            [ 2] 1103         POPW Y    ;save return addr
      0085C2 90 BF 26         [ 2] 1104         LDW YTEMP,Y
      0085C5 90 85            [ 2] 1105         POPW Y
      0085C7 1D 00 02         [ 2] 1106         SUBW X,#2
      0085CA FF               [ 2] 1107         LDW (X),Y
      0085CB 92 CC 26         [ 5] 1108         JP [YTEMP]
                                   1109 
                                   1110 ;       R@      ( -- w )
                                   1111 ;       Copy top of return stack to stack.
      0085CE 85 BD                 1112         .word      LINK
                           000550  1113 LINK	= 	. 
      0085D0 02                    1114         .byte      2
      0085D1 52 40                 1115         .ascii     "R@"
      0085D3                       1116 RAT:
      0085D3 16 03            [ 2] 1117         ldw y,(3,sp)
      0085D5 1D 00 02         [ 2] 1118         subw x,#CELLL 
      0085D8 FF               [ 2] 1119         ldw (x),y 
      0085D9 81               [ 4] 1120         ret 
                                   1121 
                                   1122 ;       >R      ( w -- )
                                   1123 ;       Push data stack to return stack.
      0085DA 85 D0                 1124         .word      LINK
                           00055C  1125 LINK	= 	. 
      0085DC 42                    1126 	.byte      COMPO+2
      0085DD 3E 52                 1127         .ascii     ">R"
      0085DF                       1128 TOR:
      0085DF 90 85            [ 2] 1129         POPW Y    ;save return addr
      0085E1 90 BF 26         [ 2] 1130         LDW YTEMP,Y
      0085E4 90 93            [ 1] 1131         LDW Y,X
      0085E6 90 FE            [ 2] 1132         LDW Y,(Y)
      0085E8 90 89            [ 2] 1133         PUSHW Y    ;restore return addr
      0085EA 1C 00 02         [ 2] 1134         ADDW X,#2
      0085ED 92 CC 26         [ 5] 1135         JP [YTEMP]
                                   1136 
                                   1137 ;       SP@     ( -- a )
                                   1138 ;       Push current stack pointer.
      0085F0 85 DC                 1139         .word      LINK
                           000572  1140 LINK	= 	. 
      0085F2 03                    1141         .byte      3
      0085F3 53 50 40              1142         .ascii     "SP@"
      0085F6                       1143 SPAT:
      0085F6 90 93            [ 1] 1144 	LDW Y,X
      0085F8 1D 00 02         [ 2] 1145         SUBW X,#2
      0085FB FF               [ 2] 1146 	LDW (X),Y
      0085FC 81               [ 4] 1147         RET     
                                   1148 
                                   1149 ;       SP!     ( a -- )
                                   1150 ;       Set  data stack pointer.
      0085FD 85 F2                 1151         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



                           00057F  1152 LINK	= 	. 
      0085FF 03                    1153         .byte      3
      008600 53 50 21              1154         .ascii     "SP!"
      008603                       1155 SPSTO:
      008603 FE               [ 2] 1156         LDW     X,(X)     ;X = a
      008604 81               [ 4] 1157         RET     
                                   1158 
                                   1159 ;       DROP    ( w -- )
                                   1160 ;       Discard top stack item.
      008605 85 FF                 1161         .word      LINK
                           000587  1162 LINK	= 	. 
      008607 04                    1163         .byte      4
      008608 44 52 4F 50           1164         .ascii     "DROP"
      00860C                       1165 DROP:
      00860C 1C 00 02         [ 2] 1166         ADDW X,#2     
      00860F 81               [ 4] 1167         RET     
                                   1168 
                                   1169 ;       DUP     ( w -- w w )
                                   1170 ;       Duplicate  top stack item.
      008610 86 07                 1171         .word      LINK
                           000592  1172 LINK	= 	. 
      008612 03                    1173         .byte      3
      008613 44 55 50              1174         .ascii     "DUP"
      008616                       1175 DUPP:
      008616 90 93            [ 1] 1176 	LDW Y,X
      008618 1D 00 02         [ 2] 1177         SUBW X,#2
      00861B 90 FE            [ 2] 1178 	LDW Y,(Y)
      00861D FF               [ 2] 1179 	LDW (X),Y
      00861E 81               [ 4] 1180         RET     
                                   1181 
                                   1182 ;       SWAP    ( w1 w2 -- w2 w1 )
                                   1183 ;       Exchange top two stack items.
      00861F 86 12                 1184         .word      LINK
                           0005A1  1185 LINK	= 	. 
      008621 04                    1186         .byte      4
      008622 53 57 41 50           1187         .ascii     "SWAP"
      008626                       1188 SWAPP:
      008626 90 93            [ 1] 1189         LDW Y,X
      008628 90 FE            [ 2] 1190         LDW Y,(Y)
      00862A 90 BF 26         [ 2] 1191         LDW YTEMP,Y
      00862D 90 93            [ 1] 1192         LDW Y,X
      00862F 90 EE 02         [ 2] 1193         LDW Y,(2,Y)
      008632 FF               [ 2] 1194         LDW (X),Y
      008633 90 BE 26         [ 2] 1195         LDW Y,YTEMP
      008636 EF 02            [ 2] 1196         LDW (2,X),Y
      008638 81               [ 4] 1197         RET     
                                   1198 
                                   1199 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                   1200 ;       Copy second stack item to top.
      008639 86 21                 1201         .word      LINK
                           0005BB  1202 LINK	= . 
      00863B 04                    1203         .byte      4
      00863C 4F 56 45 52           1204         .ascii     "OVER"
      008640                       1205 OVER:
      008640 1D 00 02         [ 2] 1206         SUBW X,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      008643 90 93            [ 1] 1207         LDW Y,X
      008645 90 EE 04         [ 2] 1208         LDW Y,(4,Y)
      008648 FF               [ 2] 1209         LDW (X),Y
      008649 81               [ 4] 1210         RET     
                                   1211 
                                   1212 ;       0<      ( n -- t )
                                   1213 ;       Return true if n is negative.
      00864A 86 3B                 1214         .word      LINK
                           0005CC  1215 LINK	= . 
      00864C 02                    1216         .byte      2
      00864D 30 3C                 1217         .ascii     "0<"
      00864F                       1218 ZLESS:
      00864F A6 FF            [ 1] 1219         LD A,#0xFF
      008651 90 93            [ 1] 1220         LDW Y,X
      008653 90 FE            [ 2] 1221         LDW Y,(Y)
      008655 2B 01            [ 1] 1222         JRMI     ZL1
      008657 4F               [ 1] 1223         CLR A   ;false
      008658 F7               [ 1] 1224 ZL1:    LD     (X),A
      008659 E7 01            [ 1] 1225         LD (1,X),A
      00865B 81               [ 4] 1226 	RET     
                                   1227 
                                   1228 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1229 ;       0= ( n -- f )
                                   1230 ;   n==0?
                                   1231 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0005DC                       1232         _HEADER ZEQUAL,2,"0="
      00865C 86 4C                    1         .word LINK 
                           0005DE     2         LINK=.
      00865E 02                       3         .byte 2  
      00865F 30 3D                    4         .ascii "0="
      008661                          5         ZEQUAL:
      008661 A6 FF            [ 1] 1233         LD A,#0XFF 
      008663 90 93            [ 1] 1234         LDW Y,X 
      008665 90 FE            [ 2] 1235         LDW Y,(Y)
      008667 27 02            [ 1] 1236         JREQ ZEQU1 
      008669 A6 00            [ 1] 1237         LD A,#0 
      00866B                       1238 ZEQU1:  
      00866B F7               [ 1] 1239         LD (X),A 
      00866C E7 01            [ 1] 1240         LD (1,X),A         
      00866E 81               [ 4] 1241         RET 
                                   1242 
                                   1243 
                                   1244 ;       AND     ( w w -- w )
                                   1245 ;       Bitwise AND.
      00866F 86 5E                 1246         .word      LINK
                           0005F1  1247 LINK	= . 
      008671 03                    1248         .byte      3
      008672 41 4E 44              1249         .ascii     "AND"
      008675                       1250 ANDD:
      008675 F6               [ 1] 1251         LD  A,(X)    ;D=w
      008676 E4 02            [ 1] 1252         AND A,(2,X)
      008678 E7 02            [ 1] 1253         LD (2,X),A
      00867A E6 01            [ 1] 1254         LD A,(1,X)
      00867C E4 03            [ 1] 1255         AND A,(3,X)
      00867E E7 03            [ 1] 1256         LD (3,X),A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      008680 1C 00 02         [ 2] 1257         ADDW X,#2
      008683 81               [ 4] 1258         RET
                                   1259 
                                   1260 ;       OR      ( w w -- w )
                                   1261 ;       Bitwise inclusive OR.
      008684 86 71                 1262         .word      LINK
                           000606  1263 LINK = . 
      008686 02                    1264         .byte      2
      008687 4F 52                 1265         .ascii     "OR"
      008689                       1266 ORR:
      008689 F6               [ 1] 1267         LD A,(X)    ;D=w
      00868A EA 02            [ 1] 1268         OR A,(2,X)
      00868C E7 02            [ 1] 1269         LD (2,X),A
      00868E E6 01            [ 1] 1270         LD A,(1,X)
      008690 EA 03            [ 1] 1271         OR A,(3,X)
      008692 E7 03            [ 1] 1272         LD (3,X),A
      008694 1C 00 02         [ 2] 1273         ADDW X,#2
      008697 81               [ 4] 1274         RET
                                   1275 
                                   1276 ;       XOR     ( w w -- w )
                                   1277 ;       Bitwise exclusive OR.
      008698 86 86                 1278         .word      LINK
                           00061A  1279 LINK	= . 
      00869A 03                    1280         .byte      3
      00869B 58 4F 52              1281         .ascii     "XOR"
      00869E                       1282 XORR:
      00869E F6               [ 1] 1283         LD A,(X)    ;D=w
      00869F E8 02            [ 1] 1284         XOR A,(2,X)
      0086A1 E7 02            [ 1] 1285         LD (2,X),A
      0086A3 E6 01            [ 1] 1286         LD A,(1,X)
      0086A5 E8 03            [ 1] 1287         XOR A,(3,X)
      0086A7 E7 03            [ 1] 1288         LD (3,X),A
      0086A9 1C 00 02         [ 2] 1289         ADDW X,#2
      0086AC 81               [ 4] 1290         RET
                                   1291 
                                   1292 ;       UM+     ( u u -- udsum )
                                   1293 ;       Add two unsigned single
                                   1294 ;       and return a double sum.
      0086AD 86 9A                 1295         .word      LINK
                           00062F  1296 LINK	= . 
      0086AF 03                    1297         .byte      3
      0086B0 55 4D 2B              1298         .ascii     "UM+"
      0086B3                       1299 UPLUS:
      0086B3 A6 01            [ 1] 1300         LD A,#1
      0086B5 90 93            [ 1] 1301         LDW Y,X
      0086B7 90 EE 02         [ 2] 1302         LDW Y,(2,Y)
      0086BA 90 BF 26         [ 2] 1303         LDW YTEMP,Y
      0086BD 90 93            [ 1] 1304         LDW Y,X
      0086BF 90 FE            [ 2] 1305         LDW Y,(Y)
      0086C1 72 B9 00 26      [ 2] 1306         ADDW Y,YTEMP
      0086C5 EF 02            [ 2] 1307         LDW (2,X),Y
      0086C7 25 01            [ 1] 1308         JRC     UPL1
      0086C9 4F               [ 1] 1309         CLR A
      0086CA E7 01            [ 1] 1310 UPL1:   LD     (1,X),A
      0086CC 7F               [ 1] 1311         CLR (X)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      0086CD 81               [ 4] 1312         RET
                                   1313 
                                   1314 ;; System and user variables
                                   1315 
                                   1316 ;       doVAR   ( -- a )
                                   1317 ;       Code for VARIABLE and CREATE.
      0086CE 86 AF                 1318         .word      LINK
                           000650  1319 LINK	= . 
      0086D0 45                    1320 	.byte      COMPO+5
      0086D1 44 4F 56 41 52        1321         .ascii     "DOVAR"
      0086D6                       1322 DOVAR:
      0086D6 1D 00 02         [ 2] 1323 	SUBW X,#2
      0086D9 90 85            [ 2] 1324         POPW Y    ;get return addr (pfa)
      0086DB 90 FE            [ 2] 1325         LDW Y,(Y) ; indirect address 
      0086DD FF               [ 2] 1326         LDW (X),Y    ;push on stack
      0086DE 81               [ 4] 1327         RET     ;go to RET of EXEC
                                   1328 
                                   1329 ;       BASE    ( -- a )
                                   1330 ;       Radix base for numeric I/O.
      0086DF 86 D0                 1331         .word      LINK        
                           000661  1332 LINK = . 
      0086E1 04                    1333         .byte      4
      0086E2 42 41 53 45           1334         .ascii     "BASE"
      0086E6                       1335 BASE:
      0086E6 90 AE 00 06      [ 2] 1336 	LDW Y,#UBASE 
      0086EA 1D 00 02         [ 2] 1337 	SUBW X,#2
      0086ED FF               [ 2] 1338         LDW (X),Y
      0086EE 81               [ 4] 1339         RET
                                   1340 
                                   1341 ;       tmp     ( -- a )
                                   1342 ;       A temporary storage.
      0086EF 86 E1                 1343         .word      LINK
                                   1344         
                           000671  1345 LINK = . 
      0086F1 03                    1346 	.byte      3
      0086F2 54 4D 50              1347         .ascii     "TMP"
      0086F5                       1348 TEMP:
      0086F5 90 AE 00 0A      [ 2] 1349 	LDW Y,#UTMP
      0086F9 1D 00 02         [ 2] 1350 	SUBW X,#2
      0086FC FF               [ 2] 1351         LDW (X),Y
      0086FD 81               [ 4] 1352         RET
                                   1353 
                                   1354 ;       >IN     ( -- a )
                                   1355 ;        Hold parsing pointer.
      0086FE 86 F1                 1356         .word      LINK
                           000680  1357 LINK = . 
      008700 03                    1358         .byte      3
      008701 3E 49 4E              1359         .ascii    ">IN"
      008704                       1360 INN:
      008704 90 AE 00 0C      [ 2] 1361 	LDW Y,#UINN 
      008708 1D 00 02         [ 2] 1362 	SUBW X,#2
      00870B FF               [ 2] 1363         LDW (X),Y
      00870C 81               [ 4] 1364         RET
                                   1365 
                                   1366 ;       #TIB    ( -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



                                   1367 ;       Count in terminal input buffer.
      00870D 87 00                 1368         .word      LINK
                           00068F  1369 LINK = . 
      00870F 04                    1370         .byte      4
      008710 23 54 49 42           1371         .ascii     "#TIB"
      008714                       1372 NTIB:
      008714 90 AE 00 0E      [ 2] 1373 	LDW Y,#UCTIB 
      008718 1D 00 02         [ 2] 1374 	SUBW X,#2
      00871B FF               [ 2] 1375         LDW (X),Y
      00871C 81               [ 4] 1376         RET
                                   1377 
                                   1378 ;       TBUF ( -- a )
                                   1379 ;       address of 128 bytes transaction buffer 
      00871D 87 0F                 1380         .word LINK 
                           00069F  1381         LINK=.
      00871F 04                    1382         .byte 4 
      008720 54 42 55 46           1383         .ascii "TBUF"
      008724                       1384 TBUF:
      008724 90 AE 16 80      [ 2] 1385         ldw y,#ROWBUFF
      008728 1D 00 02         [ 2] 1386         subw x,#CELLL
      00872B FF               [ 2] 1387         ldw (x),y 
      00872C 81               [ 4] 1388         ret 
                                   1389 
                                   1390 ; systeme variable 
                                   1391 ; compilation destination 
                                   1392 ; TFLASH ( -- A )
      00872D 87 1F                 1393         .word LINK 
                           0006AF  1394         LINK=.
      00872F 06                    1395         .byte 6 
      008730 54 46 4C 41 53 48     1396         .ascii "TFLASH"         
      008736                       1397 TFLASH:
      008736 1D 00 02         [ 2] 1398         subw x,#CELLL 
      008739 90 AE 00 20      [ 2] 1399         ldw y,#UTFLASH
      00873D FF               [ 2] 1400         ldw (x),y 
      00873E 81               [ 4] 1401         ret 
                                   1402 
                                   1403 ;       "EVAL   ( -- a )
                                   1404 ;       Execution vector of EVAL.
      00873F 87 2F                 1405         .word      LINK
                           0006C1  1406 LINK = . 
      008741 05                    1407         .byte      5
      008742 27 45 56 41 4C        1408         .ascii     "'EVAL"
      008747                       1409 TEVAL:
      008747 90 AE 00 12      [ 2] 1410 	LDW Y,#UINTER 
      00874B 1D 00 02         [ 2] 1411 	SUBW X,#2
      00874E FF               [ 2] 1412         LDW (X),Y
      00874F 81               [ 4] 1413         RET
                                   1414 
                                   1415 ;       HLD     ( -- a )
                                   1416 ;       Hold a pointer of output string.
      008750 87 41                 1417         .word      LINK
                           0006D2  1418 LINK = . 
      008752 03                    1419         .byte      3
      008753 48 4C 44              1420         .ascii     "HLD"
      008756                       1421 HLD:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      008756 90 AE 00 14      [ 2] 1422 	LDW Y,#UHLD 
      00875A 1D 00 02         [ 2] 1423 	SUBW X,#2
      00875D FF               [ 2] 1424         LDW (X),Y
      00875E 81               [ 4] 1425         RET
                                   1426 
                                   1427 ;       CONTEXT ( -- a )
                                   1428 ;       Start vocabulary search.
      00875F 87 52                 1429         .word      LINK
                           0006E1  1430 LINK = . 
      008761 07                    1431         .byte      7
      008762 43 4F 4E 54 45 58 54  1432         .ascii     "CONTEXT"
      008769                       1433 CNTXT:
      008769 90 AE 00 16      [ 2] 1434 	LDW Y,#UCNTXT
      00876D 1D 00 02         [ 2] 1435 	SUBW X,#2
      008770 FF               [ 2] 1436         LDW (X),Y
      008771 81               [ 4] 1437         RET
                                   1438 
                                   1439 ;       VP      ( -- a )
                                   1440 ;       Point to top of variables
      008772 87 61                 1441         .word      LINK
                           0006F4  1442 LINK = . 
      008774 02                    1443         .byte      2
      008775 56 50                 1444         .ascii     "VP"
      008777                       1445 VPP:
      008777 90 AE 00 18      [ 2] 1446 	LDW Y,#UVP 
      00877B 1D 00 02         [ 2] 1447 	SUBW X,#2
      00877E FF               [ 2] 1448         LDW (X),Y
      00877F 81               [ 4] 1449         RET
                                   1450 
                                   1451 ;       CP    ( -- a )
                                   1452 ;       Pointer to top of FLASH 
      008780 87 74                 1453         .word LINK 
                           000702  1454         LINK=.
      008782 02                    1455         .byte 2 
      008783 43 50                 1456         .ascii "CP"
      008785                       1457 CPP: 
      008785 90 AE 00 1A      [ 2] 1458         ldw y,#UCP 
      008789 1D 00 02         [ 2] 1459         subw x,#CELLL 
      00878C FF               [ 2] 1460         ldw (x),y 
      00878D 81               [ 4] 1461         ret                
                                   1462 
                                   1463 ;       LAST    ( -- a )
                                   1464 ;       Point to last name in dictionary.
      00878E 87 82                 1465         .word      LINK
                           000710  1466 LINK = . 
      008790 04                    1467         .byte      4
      008791 4C 41 53 54           1468         .ascii     "LAST"
      008795                       1469 LAST:
      008795 90 AE 00 1C      [ 2] 1470 	LDW Y,#ULAST 
      008799 1D 00 02         [ 2] 1471 	SUBW X,#2
      00879C FF               [ 2] 1472         LDW (X),Y
      00879D 81               [ 4] 1473         RET
                                   1474 
                                   1475 ; address of system variable URLAST 
                                   1476 ;       RAMLAST ( -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



                                   1477 ; RAM dictionary context 
      00879E 87 90                 1478         .word LINK 
                           000720  1479         LINK=. 
      0087A0 07                    1480         .byte 7  
      0087A1 52 41 4D 4C 41 53 54  1481         .ascii "RAMLAST" 
      0087A8                       1482 RAMLAST: 
      0087A8 90 AE 00 22      [ 2] 1483         ldw y,#URLAST 
      0087AC 1D 00 02         [ 2] 1484         subw x,#CELLL 
      0087AF FF               [ 2] 1485         ldw (x),y 
      0087B0 81               [ 4] 1486         ret 
                                   1487 
                                   1488 ; OFFSET ( -- a )
                                   1489 ; address of system variable OFFSET 
      0087B1 87 A0                 1490         .word LINK 
                           000733  1491         LINK=.
      0087B3 06                    1492         .byte 6
      0087B4 4F 46 46 53 45 54     1493         .ascii "OFFSET" 
      0087BA                       1494 OFFSET: 
      0087BA 1D 00 02         [ 2] 1495         subw x,#CELLL
      0087BD 90 AE 00 1E      [ 2] 1496         ldw y,#UOFFSET 
      0087C1 FF               [ 2] 1497         ldw (x),y 
      0087C2 81               [ 4] 1498         ret 
                                   1499 
                                   1500 ; adjust jump address adding OFFSET
                                   1501 ; ADR-ADJ ( a -- a+offset )
      0087C3                       1502 ADRADJ: 
      0087C3 CD 87 BA         [ 4] 1503         call OFFSET 
      0087C6 CD 85 6F         [ 4] 1504         call AT 
      0087C9 CC 88 45         [ 2] 1505         jp PLUS 
                                   1506 
                                   1507 
                                   1508 ;; Common functions
                                   1509 
                                   1510 ;       ?DUP    ( w -- w w | 0 )
                                   1511 ;       Dup tos if its is not zero.
      0087CC 87 B3                 1512         .word      LINK
                           00074E  1513 LINK = . 
      0087CE 04                    1514         .byte      4
      0087CF 3F 44 55 50           1515         .ascii     "?DUP"
      0087D3                       1516 QDUP:
      0087D3 90 93            [ 1] 1517         LDW Y,X
      0087D5 90 FE            [ 2] 1518 	LDW Y,(Y)
      0087D7 27 04            [ 1] 1519         JREQ     QDUP1
      0087D9 1D 00 02         [ 2] 1520 	SUBW X,#2
      0087DC FF               [ 2] 1521         LDW (X),Y
      0087DD 81               [ 4] 1522 QDUP1:  RET
                                   1523 
                                   1524 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                   1525 ;       Rot 3rd item to top.
      0087DE 87 CE                 1526         .word      LINK
                           000760  1527 LINK = . 
      0087E0 03                    1528         .byte      3
      0087E1 52 4F 54              1529         .ascii     "ROT"
      0087E4                       1530 ROT:
      0087E4 90 93            [ 1] 1531         ldw y,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      0087E6 90 FE            [ 2] 1532         ldw y,(y)
      0087E8 90 89            [ 2] 1533         pushw y 
      0087EA 90 93            [ 1] 1534         ldw y,x 
      0087EC 90 EE 04         [ 2] 1535         ldw y,(4,y)
      0087EF FF               [ 2] 1536         ldw (x),y 
      0087F0 90 93            [ 1] 1537         ldw y,x 
      0087F2 90 EE 02         [ 2] 1538         ldw y,(2,y)
      0087F5 EF 04            [ 2] 1539         ldw (4,x),y 
      0087F7 90 85            [ 2] 1540         popw y 
      0087F9 EF 02            [ 2] 1541         ldw (2,x),y
      0087FB 81               [ 4] 1542         ret 
                                   1543 
                                   1544 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1545 ;    <ROT ( n1 n2 n3 -- n3 n1 n2 )
                                   1546 ;    rotate left 3 top elements 
                                   1547 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00077C                       1548     _HEADER NROT,4,"<ROT"
      0087FC 87 E0                    1         .word LINK 
                           00077E     2         LINK=.
      0087FE 04                       3         .byte 4  
      0087FF 3C 52 4F 54              4         .ascii "<ROT"
      008803                          5         NROT:
      008803 90 93            [ 1] 1549     LDW Y,X 
      008805 90 FE            [ 2] 1550     LDW Y,(Y)
      008807 90 BF 26         [ 2] 1551     LDW YTEMP,Y ; n3  
      00880A 90 93            [ 1] 1552     LDW Y,X 
      00880C 90 EE 02         [ 2] 1553     LDW Y,(2,Y) ; Y = n2 
      00880F FF               [ 2] 1554     LDW (X),Y   ; TOS = n2 
      008810 90 93            [ 1] 1555     LDW Y,X    
      008812 90 EE 04         [ 2] 1556     LDW Y,(4,Y) ; Y = n1 
      008815 EF 02            [ 2] 1557     LDW (2,X),Y ;   = n1 
      008817 90 BE 26         [ 2] 1558     LDW Y,YTEMP 
      00881A EF 04            [ 2] 1559     LDW (4,X),Y ; = n3 
      00881C 81               [ 4] 1560     RET 
                                   1561 
                                   1562 ;       2DROP   ( w w -- )
                                   1563 ;       Discard two items on stack.
      00881D 87 FE                 1564         .word      LINK
                           00079F  1565 LINK = . 
      00881F 05                    1566         .byte      5
      008820 32 44 52 4F 50        1567         .ascii     "2DROP"
      008825                       1568 DDROP:
      008825 1C 00 04         [ 2] 1569         ADDW X,#4
      008828 81               [ 4] 1570         RET
                                   1571 
                                   1572 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                   1573 ;       Duplicate top two items.
      008829 88 1F                 1574         .word      LINK
                           0007AB  1575 LINK = . 
      00882B 04                    1576         .byte      4
      00882C 32 44 55 50           1577         .ascii     "2DUP"
      008830                       1578 DDUP:
      008830 1D 00 04         [ 2] 1579         SUBW X,#4
      008833 90 93            [ 1] 1580         LDW Y,X
      008835 90 EE 06         [ 2] 1581         LDW Y,(6,Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      008838 EF 02            [ 2] 1582         LDW (2,X),Y
      00883A 90 93            [ 1] 1583         LDW Y,X
      00883C 90 EE 04         [ 2] 1584         LDW Y,(4,Y)
      00883F FF               [ 2] 1585         LDW (X),Y
      008840 81               [ 4] 1586         RET
                                   1587 
                                   1588 ;       +       ( w w -- sum )
                                   1589 ;       Add top two items.
      008841 88 2B                 1590         .word      LINK
                           0007C3  1591 LINK = . 
      008843 01                    1592         .byte      1
      008844 2B                    1593         .ascii     "+"
      008845                       1594 PLUS:
      008845 90 93            [ 1] 1595         LDW Y,X
      008847 90 FE            [ 2] 1596         LDW Y,(Y)
      008849 90 BF 26         [ 2] 1597         LDW YTEMP,Y
      00884C 1C 00 02         [ 2] 1598         ADDW X,#2
      00884F 90 93            [ 1] 1599         LDW Y,X
      008851 90 FE            [ 2] 1600         LDW Y,(Y)
      008853 72 B9 00 26      [ 2] 1601         ADDW Y,YTEMP
      008857 FF               [ 2] 1602         LDW (X),Y
      008858 81               [ 4] 1603         RET
                                   1604 
                                   1605 ;       NOT     ( w -- w )
                                   1606 ;       One's complement of tos.
      008859 88 43                 1607         .word      LINK
                           0007DB  1608 LINK = . 
      00885B 03                    1609         .byte      3
      00885C 4E 4F 54              1610         .ascii     "NOT"
      00885F                       1611 INVER:
      00885F 90 93            [ 1] 1612         LDW Y,X
      008861 90 FE            [ 2] 1613         LDW Y,(Y)
      008863 90 53            [ 2] 1614         CPLW Y
      008865 FF               [ 2] 1615         LDW (X),Y
      008866 81               [ 4] 1616         RET
                                   1617 
                                   1618 ;       NEGATE  ( n -- -n )
                                   1619 ;       Two's complement of tos.
      008867 88 5B                 1620         .word      LINK
                           0007E9  1621 LINK = . 
      008869 06                    1622         .byte      6
      00886A 4E 45 47 41 54 45     1623         .ascii     "NEGATE"
      008870                       1624 NEGAT:
      008870 90 93            [ 1] 1625         LDW Y,X
      008872 90 FE            [ 2] 1626         LDW Y,(Y)
      008874 90 50            [ 2] 1627         NEGW Y
      008876 FF               [ 2] 1628         LDW (X),Y
      008877 81               [ 4] 1629         RET
                                   1630 
                                   1631 ;       DNEGATE ( d -- -d )
                                   1632 ;       Two's complement of top double.
      008878 88 69                 1633         .word      LINK
                           0007FA  1634 LINK = . 
      00887A 07                    1635         .byte      7
      00887B 44 4E 45 47 41 54 45  1636         .ascii     "DNEGATE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      008882                       1637 DNEGA:
      008882 90 93            [ 1] 1638         LDW Y,X
      008884 90 FE            [ 2] 1639 	LDW Y,(Y)
      008886 90 53            [ 2] 1640         CPLW Y     
      008888 90 BF 26         [ 2] 1641 	LDW YTEMP,Y
      00888B 90 93            [ 1] 1642         LDW Y,X
      00888D 90 EE 02         [ 2] 1643         LDW Y,(2,Y)
      008890 90 53            [ 2] 1644         CPLW Y
      008892 72 A9 00 01      [ 2] 1645         addw y,#1
      008896 EF 02            [ 2] 1646         LDW (2,X),Y
      008898 90 BE 26         [ 2] 1647         LDW Y,YTEMP
      00889B 24 02            [ 1] 1648         JRNC DN1 
      00889D 90 5C            [ 1] 1649         INCW Y
      00889F FF               [ 2] 1650 DN1:    LDW (X),Y
      0088A0 81               [ 4] 1651         RET
                                   1652 
                                   1653 
                                   1654 ;       S>D ( n -- d )
                                   1655 ; convert single integer to double 
      0088A1 88 7A                 1656         .word LINK 
                           000823  1657         LINK=. 
      0088A3 03                    1658         .byte 3 
      0088A4 53 3E 44              1659         .ascii "S>D"
      0088A7                       1660 STOD: 
      0088A7 1D 00 02         [ 2] 1661         subw x,#CELLL 
      0088AA 90 5F            [ 1] 1662         clrw y 
      0088AC FF               [ 2] 1663         ldw (x),y 
      0088AD 90 93            [ 1] 1664         ldw y,x 
      0088AF 90 EE 02         [ 2] 1665         ldw y,(2,y)
      0088B2 2A 05            [ 1] 1666         jrpl 1$ 
      0088B4 90 AE FF FF      [ 2] 1667         ldw y,#-1
      0088B8 FF               [ 2] 1668         ldw (x),y 
      0088B9 81               [ 4] 1669 1$:     ret 
                                   1670 
                                   1671 
                                   1672 
                                   1673 
                                   1674 ;       -       ( n1 n2 -- n1-n2 )
                                   1675 ;       Subtraction.
      0088BA 88 A3                 1676         .word      LINK
                           00083C  1677 LINK = . 
      0088BC 01                    1678         .byte      1
      0088BD 2D                    1679         .ascii     "-"
      0088BE                       1680 SUBB:
      0088BE 90 93            [ 1] 1681         LDW Y,X
      0088C0 90 FE            [ 2] 1682         LDW Y,(Y)
      0088C2 90 BF 26         [ 2] 1683         LDW YTEMP,Y
      0088C5 1C 00 02         [ 2] 1684         ADDW X,#2
      0088C8 90 93            [ 1] 1685         LDW Y,X
      0088CA 90 FE            [ 2] 1686         LDW Y,(Y)
      0088CC 72 B2 00 26      [ 2] 1687         SUBW Y,YTEMP
      0088D0 FF               [ 2] 1688         LDW (X),Y
      0088D1 81               [ 4] 1689         RET
                                   1690 
                                   1691 ;       ABS     ( n -- n )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                                   1692 ;       Return  absolute value of n.
      0088D2 88 BC                 1693         .word      LINK
                           000854  1694 LINK = . 
      0088D4 03                    1695         .byte      3
      0088D5 41 42 53              1696         .ascii     "ABS"
      0088D8                       1697 ABSS:
      0088D8 90 93            [ 1] 1698         LDW Y,X
      0088DA 90 FE            [ 2] 1699 	LDW Y,(Y)
      0088DC 2A 03            [ 1] 1700         JRPL     AB1     ;negate:
      0088DE 90 50            [ 2] 1701         NEGW     Y     ;else negate hi byte
      0088E0 FF               [ 2] 1702         LDW (X),Y
      0088E1 81               [ 4] 1703 AB1:    RET
                                   1704 
                                   1705 ;       =       ( w w -- t )
                                   1706 ;       Return true if top two are =al.
      0088E2 88 D4                 1707         .word      LINK
                           000864  1708 LINK = . 
      0088E4 01                    1709         .byte      1
      0088E5 3D                    1710         .ascii     "="
      0088E6                       1711 EQUAL:
      0088E6 A6 FF            [ 1] 1712         LD A,#0xFF  ;true
      0088E8 90 93            [ 1] 1713         LDW Y,X    ;D = n2
      0088EA 90 FE            [ 2] 1714         LDW Y,(Y)
      0088EC 90 BF 26         [ 2] 1715         LDW YTEMP,Y
      0088EF 1C 00 02         [ 2] 1716         ADDW X,#2
      0088F2 90 93            [ 1] 1717         LDW Y,X
      0088F4 90 FE            [ 2] 1718         LDW Y,(Y)
      0088F6 90 B3 26         [ 2] 1719         CPW Y,YTEMP     ;if n2 <> n1
      0088F9 27 01            [ 1] 1720         JREQ     EQ1
      0088FB 4F               [ 1] 1721         CLR A
      0088FC F7               [ 1] 1722 EQ1:    LD (X),A
      0088FD E7 01            [ 1] 1723         LD (1,X),A
      0088FF 81               [ 4] 1724 	RET     
                                   1725 
                                   1726 ;       U<      ( u u -- t )
                                   1727 ;       Unsigned compare of top two items.
      008900 88 E4                 1728         .word      LINK
                           000882  1729 LINK = . 
      008902 02                    1730         .byte      2
      008903 55 3C                 1731         .ascii     "U<"
      008905                       1732 ULESS:
      008905 A6 FF            [ 1] 1733         LD A,#0xFF  ;true
      008907 90 93            [ 1] 1734         LDW Y,X    ;D = n2
      008909 90 FE            [ 2] 1735         LDW Y,(Y)
      00890B 90 BF 26         [ 2] 1736         LDW YTEMP,Y
      00890E 1C 00 02         [ 2] 1737         ADDW X,#2
      008911 90 93            [ 1] 1738         LDW Y,X
      008913 90 FE            [ 2] 1739         LDW Y,(Y)
      008915 90 B3 26         [ 2] 1740         CPW Y,YTEMP     ;if n2 <> n1
      008918 25 01            [ 1] 1741         JRULT     ULES1
      00891A 4F               [ 1] 1742         CLR A
      00891B F7               [ 1] 1743 ULES1:  LD (X),A
      00891C E7 01            [ 1] 1744         LD (1,X),A
      00891E 81               [ 4] 1745 	RET     
                                   1746 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                                   1747 ;       <       ( n1 n2 -- t )
                                   1748 ;       Signed compare of top two items.
      00891F 89 02                 1749         .word      LINK
                           0008A1  1750 LINK = . 
      008921 01                    1751         .byte      1
      008922 3C                    1752         .ascii     "<"
      008923                       1753 LESS:
      008923 A6 FF            [ 1] 1754         LD A,#0xFF  ;true
      008925 90 93            [ 1] 1755         LDW Y,X    ;D = n2
      008927 90 FE            [ 2] 1756         LDW Y,(Y)
      008929 90 BF 26         [ 2] 1757         LDW YTEMP,Y
      00892C 1C 00 02         [ 2] 1758         ADDW X,#2
      00892F 90 93            [ 1] 1759         LDW Y,X
      008931 90 FE            [ 2] 1760         LDW Y,(Y)
      008933 90 B3 26         [ 2] 1761         CPW Y,YTEMP     ;if n2 <> n1
      008936 2F 01            [ 1] 1762         JRSLT     LT1
      008938 4F               [ 1] 1763         CLR A
      008939 F7               [ 1] 1764 LT1:    LD (X),A
      00893A E7 01            [ 1] 1765         LD (1,X),A
      00893C 81               [ 4] 1766 	RET     
                                   1767 
                                   1768 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1769 ;       >   (n1 n2 -- f )
                                   1770 ;  signed compare n1 n2 
                                   1771 ;  true if n1 > n2 
                                   1772 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00893D 89 21                 1773         .word   LINK 
                           0008BF  1774         LINK = . 
      00893F 01                    1775         .byte 1
      008940 3E                    1776         .ascii ">"
      008941                       1777 GREAT:
      008941 A6 FF            [ 1] 1778         LD A,#0xFF ;
      008943 90 93            [ 1] 1779         LDW Y,X 
      008945 90 FE            [ 2] 1780         LDW Y,(Y)
      008947 90 BF 26         [ 2] 1781         LDW YTEMP,Y 
      00894A 1C 00 02         [ 2] 1782         ADDW X,#2 
      00894D 90 93            [ 1] 1783         LDW Y,X 
      00894F 90 FE            [ 2] 1784         LDW Y,(Y)
      008951 90 B3 26         [ 2] 1785         CPW  Y,YTEMP 
      008954 2C 01            [ 1] 1786         JRSGT GREAT1 
      008956 4F               [ 1] 1787         CLR  A
      008957                       1788 GREAT1:
      008957 F7               [ 1] 1789         LD (X),A 
      008958 E7 01            [ 1] 1790         LD (1,X),A 
      00895A 81               [ 4] 1791         RET 
                                   1792 
                                   1793 
                                   1794 ;       MAX     ( n n -- n )
                                   1795 ;       Return greater of two top items.
      00895B 89 3F                 1796         .word      LINK
                           0008DD  1797 LINK = . 
      00895D 03                    1798         .byte      3
      00895E 4D 41 58              1799         .ascii     "MAX"
      008961                       1800 MAX:
      008961 90 93            [ 1] 1801         LDW Y,X    ;D = n2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008963 90 EE 02         [ 2] 1802         LDW Y,(2,Y)
      008966 90 BF 26         [ 2] 1803         LDW YTEMP,Y
      008969 90 93            [ 1] 1804         LDW Y,X
      00896B 90 FE            [ 2] 1805         LDW Y,(Y)
      00896D 90 B3 26         [ 2] 1806         CPW Y,YTEMP     ;if n2 <> n1
      008970 2F 02            [ 1] 1807         JRSLT     MAX1
      008972 EF 02            [ 2] 1808         LDW (2,X),Y
      008974 1C 00 02         [ 2] 1809 MAX1:   ADDW X,#2
      008977 81               [ 4] 1810 	RET     
                                   1811 
                                   1812 ;       MIN     ( n n -- n )
                                   1813 ;       Return smaller of top two items.
      008978 89 5D                 1814         .word      LINK
                           0008FA  1815 LINK = . 
      00897A 03                    1816         .byte      3
      00897B 4D 49 4E              1817         .ascii     "MIN"
      00897E                       1818 MIN:
      00897E 90 93            [ 1] 1819         LDW Y,X    ;D = n2
      008980 90 EE 02         [ 2] 1820         LDW Y,(2,Y)
      008983 90 BF 26         [ 2] 1821         LDW YTEMP,Y
      008986 90 93            [ 1] 1822         LDW Y,X
      008988 90 FE            [ 2] 1823         LDW Y,(Y)
      00898A 90 B3 26         [ 2] 1824         CPW Y,YTEMP     ;if n2 <> n1
      00898D 2C 02            [ 1] 1825         JRSGT     MIN1
      00898F EF 02            [ 2] 1826         LDW (2,X),Y
      008991 1C 00 02         [ 2] 1827 MIN1:	ADDW X,#2
      008994 81               [ 4] 1828 	RET     
                                   1829 
                                   1830 ;       WITHIN  ( u ul uh -- t )
                                   1831 ;       Return true if u is within
                                   1832 ;       range of ul and uh. ( ul <= u < uh )
      008995 89 7A                 1833         .word      LINK
                           000917  1834 LINK = . 
      008997 06                    1835         .byte      6
      008998 57 49 54 48 49 4E     1836         .ascii     "WITHIN"
      00899E                       1837 WITHI:
      00899E CD 86 40         [ 4] 1838         CALL     OVER
      0089A1 CD 88 BE         [ 4] 1839         CALL     SUBB
      0089A4 CD 85 DF         [ 4] 1840         CALL     TOR
      0089A7 CD 88 BE         [ 4] 1841         CALL     SUBB
      0089AA CD 85 C0         [ 4] 1842         CALL     RFROM
      0089AD CC 89 05         [ 2] 1843         JP     ULESS
                                   1844 
                                   1845 ;; Divide
                                   1846 
                                   1847 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1848 ;       Unsigned divide of a double by a
                                   1849 ;       single. Return mod and quotient.
      0089B0 89 97                 1850         .word      LINK
                           000932  1851 LINK = . 
      0089B2 06                    1852         .byte      6
      0089B3 55 4D 2F 4D 4F 44     1853         .ascii     "UM/MOD"
                                   1854 ; 2021-02-22
                                   1855 ; changed algortihm for Jeeek one 
                                   1856 ; ref: https://github.com/TG9541/stm8ef/pull/406        
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      0089B9                       1857 UMMOD:
      0089B9 90 93            [ 1] 1858         LDW     Y,X             ; stack pointer to Y
      0089BB FE               [ 2] 1859         LDW     X,(X)           ; un
      0089BC BF 26            [ 2] 1860         LDW     YTEMP,X         ; save un
      0089BE 93               [ 1] 1861         LDW     X,Y
      0089BF 5C               [ 1] 1862         INCW    X               ; drop un
      0089C0 5C               [ 1] 1863         INCW    X
      0089C1 89               [ 2] 1864         PUSHW   X               ; save stack pointer
      0089C2 FE               [ 2] 1865         LDW     X,(X)           ; X=udh
      0089C3 90 EE 04         [ 2] 1866         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      0089C6 B3 26            [ 2] 1867         CPW     X,YTEMP
      0089C8 25 0B            [ 1] 1868         JRULT   MMSM1           ; X is still on the R-stack
      0089CA 85               [ 2] 1869         POPW    X               ; restore stack pointer
      0089CB 90 AE FF FF      [ 2] 1870         LDW     Y,#0xFFFF       ; overflow result:
      0089CF FF               [ 2] 1871         LDW     (X),Y           ; quotient max. 16 bit value
      0089D0 90 5F            [ 1] 1872         CLRW    Y
      0089D2 EF 02            [ 2] 1873         LDW     (2,X),Y         ; remainder 0
      0089D4 81               [ 4] 1874         RET
      0089D5                       1875 MMSM1:
      0089D5 A6 10            [ 1] 1876         LD      A,#16           ; loop count
      0089D7 90 58            [ 2] 1877         SLLW    Y               ; udl shift udl into udh
      0089D9                       1878 MMSM3:
      0089D9 59               [ 2] 1879         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      0089DA 25 04            [ 1] 1880         JRC     MMSMa           ; if carry out of rotate
      0089DC B3 26            [ 2] 1881         CPW     X,YTEMP         ; compare udh to un
      0089DE 25 05            [ 1] 1882         JRULT   MMSM4           ; can't subtract
      0089E0                       1883 MMSMa:
      0089E0 72 B0 00 26      [ 2] 1884         SUBW    X,YTEMP         ; can subtract
      0089E4 98               [ 1] 1885         RCF
      0089E5                       1886 MMSM4:
      0089E5 8C               [ 1] 1887         CCF                     ; quotient bit
      0089E6 90 59            [ 2] 1888         RLCW    Y               ; rotate into quotient, rotate out udl
      0089E8 4A               [ 1] 1889         DEC     A               ; repeat
      0089E9 26 EE            [ 1] 1890         JRNE    MMSM3           ; if A == 0
      0089EB                       1891 MMSMb:
      0089EB BF 26            [ 2] 1892         LDW     YTEMP,X         ; done, save remainder
      0089ED 85               [ 2] 1893         POPW    X               ; restore stack pointer
      0089EE FF               [ 2] 1894         LDW     (X),Y           ; save quotient
      0089EF 90 BE 26         [ 2] 1895         LDW     Y,YTEMP         ; remainder onto stack
      0089F2 EF 02            [ 2] 1896         LDW     (2,X),Y
      0089F4 81               [ 4] 1897         RET
                                   1898 
                                   1899 
                                   1900 ;----------------------------------------------	
                                   1901 ;       M/MOD   ( d n -- r q )
                                   1902 ;       Signed floored divide of double by
                                   1903 ;       single. Return mod and quotient.
                                   1904 ;----------------------------------------------	
      0089F5 89 B2                 1905         .word      LINK
                           000977  1906 LINK = . 
      0089F7 05                    1907         .byte      5
      0089F8 4D 2F 4D 4F 44        1908         .ascii     "M/MOD"
      0089FD                       1909 MSMOD:  
      0089FD CD 86 16         [ 4] 1910         CALL	DUPP
      008A00 CD 86 4F         [ 4] 1911         CALL	ZLESS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008A03 CD 86 16         [ 4] 1912         CALL	DUPP
      008A06 CD 85 DF         [ 4] 1913         CALL	TOR
      008A09 CD 85 24         [ 4] 1914         CALL	QBRAN
      008A0C 8A 1A                 1915         .word	MMOD1
      008A0E CD 88 70         [ 4] 1916         CALL	NEGAT
      008A11 CD 85 DF         [ 4] 1917         CALL	TOR
      008A14 CD 88 82         [ 4] 1918         CALL	DNEGA
      008A17 CD 85 C0         [ 4] 1919         CALL	RFROM
      008A1A CD 85 DF         [ 4] 1920 MMOD1:	CALL	TOR
      008A1D CD 86 16         [ 4] 1921         CALL	DUPP
      008A20 CD 86 4F         [ 4] 1922         CALL	ZLESS
      008A23 CD 85 24         [ 4] 1923         CALL	QBRAN
      008A26 8A 2E                 1924         .word	MMOD2
      008A28 CD 85 D3         [ 4] 1925         CALL	RAT
      008A2B CD 88 45         [ 4] 1926         CALL	PLUS
      008A2E CD 85 C0         [ 4] 1927 MMOD2:	CALL	RFROM
      008A31 CD 89 B9         [ 4] 1928         CALL	UMMOD
      008A34 CD 85 C0         [ 4] 1929         CALL	RFROM
      008A37 CD 85 24         [ 4] 1930         CALL	QBRAN
      008A3A 8A 45                 1931         .word	MMOD3
      008A3C CD 86 26         [ 4] 1932         CALL	SWAPP
      008A3F CD 88 70         [ 4] 1933         CALL	NEGAT
      008A42 CD 86 26         [ 4] 1934         CALL	SWAPP
      008A45 81               [ 4] 1935 MMOD3:	RET
                                   1936 
                                   1937 ;       /MOD    ( n n -- r q )
                                   1938 ;       Signed divide. Return mod and quotient.
      008A46 89 F7                 1939         .word      LINK
                           0009C8  1940 LINK = . 
      008A48 04                    1941         .byte      4
      008A49 2F 4D 4F 44           1942         .ascii     "/MOD"
      008A4D                       1943 SLMOD:
      008A4D CD 86 40         [ 4] 1944         CALL	OVER
      008A50 CD 86 4F         [ 4] 1945         CALL	ZLESS
      008A53 CD 86 26         [ 4] 1946         CALL	SWAPP
      008A56 CC 89 FD         [ 2] 1947         JP	MSMOD
                                   1948 
                                   1949 ;       MOD     ( n n -- r )
                                   1950 ;       Signed divide. Return mod only.
      008A59 8A 48                 1951         .word      LINK
                           0009DB  1952 LINK = . 
      008A5B 03                    1953         .byte      3
      008A5C 4D 4F 44              1954         .ascii     "MOD"
      008A5F                       1955 MODD:
      008A5F CD 8A 4D         [ 4] 1956 	CALL	SLMOD
      008A62 CC 86 0C         [ 2] 1957 	JP	DROP
                                   1958 
                                   1959 ;       /       ( n n -- q )
                                   1960 ;       Signed divide. Return quotient only.
      008A65 8A 5B                 1961         .word      LINK
                           0009E7  1962 LINK = . 
      008A67 01                    1963         .byte      1
      008A68 2F                    1964         .ascii     "/"
      008A69                       1965 SLASH:
      008A69 CD 8A 4D         [ 4] 1966         CALL	SLMOD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008A6C CD 86 26         [ 4] 1967         CALL	SWAPP
      008A6F CC 86 0C         [ 2] 1968         JP	DROP
                                   1969 
                                   1970 ;; Multiply
                                   1971 
                                   1972 ;       UM*     ( u u -- ud )
                                   1973 ;       Unsigned multiply. Return double product.
      008A72 8A 67                 1974         .word      LINK
                           0009F4  1975 LINK = . 
      008A74 03                    1976         .byte      3
      008A75 55 4D 2A              1977         .ascii     "UM*"
      008A78                       1978 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
                                   1979 ; take advantage of SP addressing modes
                                   1980 ; these PRODx in RAM are not required
                                   1981 ; the product is kept on stack as local variable 
                                   1982         ;; bytes offset on data stack 
                           000002  1983         da=2 
                           000003  1984         db=3 
                           000000  1985         dc=0 
                           000001  1986         dd=1 
                                   1987         ;; product bytes offset on return stack 
                           000001  1988         UD1=1  ; ud bits 31..24
                           000002  1989         UD2=2  ; ud bits 23..16
                           000003  1990         UD3=3  ; ud bits 15..8 
                           000004  1991         UD4=4  ; ud bits 7..0 
                                   1992         ;; local variable for product set to zero   
      008A78 90 5F            [ 1] 1993         clrw y 
      008A7A 90 89            [ 2] 1994         pushw y  ; bits 15..0
      008A7C 90 89            [ 2] 1995         pushw y  ; bits 31..16 
      008A7E E6 03            [ 1] 1996         ld a,(db,x) ; b 
      008A80 90 97            [ 1] 1997         ld yl,a 
      008A82 E6 01            [ 1] 1998         ld a,(dd,x)   ; d
      008A84 90 42            [ 4] 1999         mul y,a    ; b*d  
      008A86 17 03            [ 2] 2000         ldw (UD3,sp),y ; lowest weight product 
      008A88 E6 03            [ 1] 2001         ld a,(db,x)
      008A8A 90 97            [ 1] 2002         ld yl,a 
      008A8C E6 00            [ 1] 2003         ld a,(dc,x)
      008A8E 90 42            [ 4] 2004         mul y,a  ; b*c 
                                   2005         ;;; do the partial sum 
      008A90 72 F9 02         [ 2] 2006         addw y,(UD2,sp)
      008A93 4F               [ 1] 2007         clr a 
      008A94 49               [ 1] 2008         rlc a
      008A95 6B 01            [ 1] 2009         ld (UD1,sp),a 
      008A97 17 02            [ 2] 2010         ldw (UD2,sp),y 
      008A99 E6 02            [ 1] 2011         ld a,(da,x)
      008A9B 90 97            [ 1] 2012         ld yl,a 
      008A9D E6 01            [ 1] 2013         ld a,(dd,x)
      008A9F 90 42            [ 4] 2014         mul y,a   ; a*d 
                                   2015         ;; do partial sum 
      008AA1 72 F9 02         [ 2] 2016         addw y,(UD2,sp)
      008AA4 4F               [ 1] 2017         clr a 
      008AA5 19 01            [ 1] 2018         adc a,(UD1,sp)
      008AA7 6B 01            [ 1] 2019         ld (UD1,sp),a  
      008AA9 17 02            [ 2] 2020         ldw (UD2,sp),y 
      008AAB E6 02            [ 1] 2021         ld a,(da,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008AAD 90 97            [ 1] 2022         ld yl,a 
      008AAF E6 00            [ 1] 2023         ld a,(dc,x)
      008AB1 90 42            [ 4] 2024         mul y,a  ;  a*c highest weight product 
                                   2025         ;;; do partial sum 
      008AB3 72 F9 01         [ 2] 2026         addw y,(UD1,sp)
      008AB6 FF               [ 2] 2027         ldw (x),y  ; udh 
      008AB7 16 03            [ 2] 2028         ldw y,(UD3,sp)
      008AB9 EF 02            [ 2] 2029         ldw (2,x),y  ; udl  
      008ABB 5B 04            [ 2] 2030         addw sp,#4 ; drop local variable 
      008ABD 81               [ 4] 2031         ret  
                                   2032 
                                   2033 
                                   2034 ;       *       ( n n -- n )
                                   2035 ;       Signed multiply. Return single product.
      008ABE 8A 74                 2036         .word      LINK
                           000A40  2037 LINK = . 
      008AC0 01                    2038         .byte      1
      008AC1 2A                    2039         .ascii     "*"
      008AC2                       2040 STAR:
      008AC2 CD 8A 78         [ 4] 2041 	CALL	UMSTA
      008AC5 CC 86 0C         [ 2] 2042 	JP	DROP
                                   2043 
                                   2044 ;       M*      ( n n -- d )
                                   2045 ;       Signed multiply. Return double product.
      008AC8 8A C0                 2046         .word      LINK
                           000A4A  2047 LINK = . 
      008ACA 02                    2048         .byte      2
      008ACB 4D 2A                 2049         .ascii     "M*"
      008ACD                       2050 MSTAR:      
      008ACD CD 88 30         [ 4] 2051         CALL	DDUP
      008AD0 CD 86 9E         [ 4] 2052         CALL	XORR
      008AD3 CD 86 4F         [ 4] 2053         CALL	ZLESS
      008AD6 CD 85 DF         [ 4] 2054         CALL	TOR
      008AD9 CD 88 D8         [ 4] 2055         CALL	ABSS
      008ADC CD 86 26         [ 4] 2056         CALL	SWAPP
      008ADF CD 88 D8         [ 4] 2057         CALL	ABSS
      008AE2 CD 8A 78         [ 4] 2058         CALL	UMSTA
      008AE5 CD 85 C0         [ 4] 2059         CALL	RFROM
      008AE8 CD 85 24         [ 4] 2060         CALL	QBRAN
      008AEB 8A F0                 2061         .word	MSTA1
      008AED CD 88 82         [ 4] 2062         CALL	DNEGA
      008AF0 81               [ 4] 2063 MSTA1:	RET
                                   2064 
                                   2065 ;       */MOD   ( n1 n2 n3 -- r q )
                                   2066 ;       Multiply n1 and n2, then divide
                                   2067 ;       by n3. Return mod and quotient.
      008AF1 8A CA                 2068         .word      LINK
                           000A73  2069 LINK = . 
      008AF3 05                    2070         .byte      5
      008AF4 2A 2F 4D 4F 44        2071         .ascii     "*/MOD"
      008AF9                       2072 SSMOD:
      008AF9 CD 85 DF         [ 4] 2073         CALL     TOR
      008AFC CD 8A CD         [ 4] 2074         CALL     MSTAR
      008AFF CD 85 C0         [ 4] 2075         CALL     RFROM
      008B02 CC 89 FD         [ 2] 2076         JP     MSMOD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                                   2077 
                                   2078 ;       */      ( n1 n2 n3 -- q )
                                   2079 ;       Multiply n1 by n2, then divide
                                   2080 ;       by n3. Return quotient only.
      008B05 8A F3                 2081         .word      LINK
                           000A87  2082 LINK = . 
      008B07 02                    2083         .byte      2
      008B08 2A 2F                 2084         .ascii     "*/"
      008B0A                       2085 STASL:
      008B0A CD 8A F9         [ 4] 2086         CALL	SSMOD
      008B0D CD 86 26         [ 4] 2087         CALL	SWAPP
      008B10 CC 86 0C         [ 2] 2088         JP	DROP
                                   2089 
                                   2090 ;; Miscellaneous
                                   2091 
                                   2092 ;       CELL+   ( a -- a )
                                   2093 ;       Add cell size in byte to address.
      008B13 8B 07                 2094         .word      LINK
                           000A95  2095 LINK = . 
      008B15 02                    2096         .byte       2
      008B16 32 2B                 2097         .ascii     "2+"
      008B18                       2098 CELLP:
      008B18 90 93            [ 1] 2099         LDW Y,X
      008B1A 90 FE            [ 2] 2100 	LDW Y,(Y)
      008B1C 72 A9 00 02      [ 2] 2101         ADDW Y,#CELLL 
      008B20 FF               [ 2] 2102         LDW (X),Y
      008B21 81               [ 4] 2103         RET
                                   2104 
                                   2105 ;       CELL-   ( a -- a )
                                   2106 ;       Subtract 2 from address.
      008B22 8B 15                 2107         .word      LINK
                           000AA4  2108 LINK = . 
      008B24 02                    2109         .byte       2
      008B25 32 2D                 2110         .ascii     "2-"
      008B27                       2111 CELLM:
      008B27 90 93            [ 1] 2112         LDW Y,X
      008B29 90 FE            [ 2] 2113 	LDW Y,(Y)
      008B2B 72 A2 00 02      [ 2] 2114         SUBW Y,#CELLL
      008B2F FF               [ 2] 2115         LDW (X),Y
      008B30 81               [ 4] 2116         RET
                                   2117 
                                   2118 ;       CELLS   ( n -- n )
                                   2119 ;       Multiply tos by 2.
      008B31 8B 24                 2120         .word      LINK
                           000AB3  2121 LINK = . 
      008B33 02                    2122         .byte       2
      008B34 32 2A                 2123         .ascii     "2*"
      008B36                       2124 CELLS:
      008B36 90 93            [ 1] 2125         LDW Y,X
      008B38 90 FE            [ 2] 2126 	LDW Y,(Y)
      008B3A 90 58            [ 2] 2127         SLAW Y
      008B3C FF               [ 2] 2128         LDW (X),Y
      008B3D 81               [ 4] 2129         RET
                                   2130 
                                   2131 ;       1+      ( a -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                   2132 ;       Add cell size in byte to address.
      008B3E 8B 33                 2133         .word      LINK
                           000AC0  2134 LINK = . 
      008B40 02                    2135         .byte      2
      008B41 31 2B                 2136         .ascii     "1+"
      008B43                       2137 ONEP:
      008B43 90 93            [ 1] 2138         LDW Y,X
      008B45 90 FE            [ 2] 2139 	LDW Y,(Y)
      008B47 90 5C            [ 1] 2140         INCW Y
      008B49 FF               [ 2] 2141         LDW (X),Y
      008B4A 81               [ 4] 2142         RET
                                   2143 
                                   2144 ;       1-      ( a -- a )
                                   2145 ;       Subtract 2 from address.
      008B4B 8B 40                 2146         .word      LINK
                           000ACD  2147 LINK = . 
      008B4D 02                    2148         .byte      2
      008B4E 31 2D                 2149         .ascii     "1-"
      008B50                       2150 ONEM:
      008B50 90 93            [ 1] 2151         LDW Y,X
      008B52 90 FE            [ 2] 2152 	LDW Y,(Y)
      008B54 90 5A            [ 2] 2153         DECW Y
      008B56 FF               [ 2] 2154         LDW (X),Y
      008B57 81               [ 4] 2155         RET
                                   2156 
                                   2157 ;  shift left n times 
                                   2158 ; LSHIFT ( n1 n2 -- n1<<n2 )
      008B58 8B 4D                 2159         .word LINK 
                           000ADA  2160         LINK=.
      008B5A 06                    2161         .byte 6 
      008B5B 4C 53 48 49 46 54     2162         .ascii "LSHIFT"
      008B61                       2163 LSHIFT:
      008B61 E6 01            [ 1] 2164         ld a,(1,x)
      008B63 1C 00 02         [ 2] 2165         addw x,#CELLL 
      008B66 90 93            [ 1] 2166         ldw y,x 
      008B68 90 FE            [ 2] 2167         ldw y,(y)
      008B6A                       2168 LSHIFT1:
      008B6A 4D               [ 1] 2169         tnz a 
      008B6B 27 05            [ 1] 2170         jreq LSHIFT4 
      008B6D 90 58            [ 2] 2171         sllw y 
      008B6F 4A               [ 1] 2172         dec a 
      008B70 20 F8            [ 2] 2173         jra LSHIFT1 
      008B72                       2174 LSHIFT4:
      008B72 FF               [ 2] 2175         ldw (x),y 
      008B73 81               [ 4] 2176         ret 
                                   2177 
                                   2178 ; shift right n times                 
                                   2179 ; RSHIFT (n1 n2 -- n1>>n2 )
      008B74 8B 5A                 2180         .word LINK 
                           000AF6  2181         LINK=.
      008B76 06                    2182         .byte 6
      008B77 52 53 48 49 46 54     2183         .ascii "RSHIFT"
      008B7D                       2184 RSHIFT:
      008B7D E6 01            [ 1] 2185         ld a,(1,x)
      008B7F 1C 00 02         [ 2] 2186         addw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008B82 90 93            [ 1] 2187         ldw y,x 
      008B84 90 FE            [ 2] 2188         ldw y,(y)
      008B86                       2189 RSHIFT1:
      008B86 4D               [ 1] 2190         tnz a 
      008B87 27 05            [ 1] 2191         jreq RSHIFT4 
      008B89 90 54            [ 2] 2192         srlw y 
      008B8B 4A               [ 1] 2193         dec a 
      008B8C 20 F8            [ 2] 2194         jra RSHIFT1 
      008B8E                       2195 RSHIFT4:
      008B8E FF               [ 2] 2196         ldw (x),y 
      008B8F 81               [ 4] 2197         ret 
                                   2198 
                                   2199 
                                   2200 ;       2/      ( n -- n )
                                   2201 ;       divide  tos by 2.
      008B90 8B 76                 2202         .word      LINK
                           000B12  2203 LINK = . 
      008B92 02                    2204         .byte      2
      008B93 32 2F                 2205         .ascii     "2/"
      008B95                       2206 TWOSL:
      008B95 90 93            [ 1] 2207         LDW Y,X
      008B97 90 FE            [ 2] 2208 	LDW Y,(Y)
      008B99 90 57            [ 2] 2209         SRAW Y
      008B9B FF               [ 2] 2210         LDW (X),Y
      008B9C 81               [ 4] 2211         RET
                                   2212 
                                   2213 ;       BL      ( -- 32 )
                                   2214 ;       Return 32,  blank character.
      008B9D 8B 92                 2215         .word      LINK
                           000B1F  2216 LINK = . 
      008B9F 02                    2217         .byte      2
      008BA0 42 4C                 2218         .ascii     "BL"
      008BA2                       2219 BLANK:
      008BA2 1D 00 02         [ 2] 2220         SUBW X,#2
      008BA5 90 AE 00 20      [ 2] 2221 	LDW Y,#32
      008BA9 FF               [ 2] 2222         LDW (X),Y
      008BAA 81               [ 4] 2223         RET
                                   2224 
                                   2225 ;         0     ( -- 0)
                                   2226 ;         Return 0.
      008BAB 8B 9F                 2227         .word      LINK
                           000B2D  2228 LINK = . 
      008BAD 01                    2229         .byte       1
      008BAE 30                    2230         .ascii     "0"
      008BAF                       2231 ZERO:
      008BAF 1D 00 02         [ 2] 2232         SUBW X,#2
      008BB2 90 5F            [ 1] 2233 	CLRW Y
      008BB4 FF               [ 2] 2234         LDW (X),Y
      008BB5 81               [ 4] 2235         RET
                                   2236 
                                   2237 ;         1     ( -- 1)
                                   2238 ;         Return 1.
      008BB6 8B AD                 2239         .word      LINK
                           000B38  2240 LINK = . 
      008BB8 01                    2241         .byte       1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008BB9 31                    2242         .ascii     "1"
      008BBA                       2243 ONE:
      008BBA 1D 00 02         [ 2] 2244         SUBW X,#2
      008BBD 90 AE 00 01      [ 2] 2245 	LDW Y,#1
      008BC1 FF               [ 2] 2246         LDW (X),Y
      008BC2 81               [ 4] 2247         RET
                                   2248 
                                   2249 ;         -1    ( -- -1)
                                   2250 ;         Return 32,  blank character.
      008BC3 8B B8                 2251         .word      LINK
                           000B45  2252 LINK = . 
      008BC5 02                    2253         .byte       2
      008BC6 2D 31                 2254         .ascii     "-1"
      008BC8                       2255 MONE:
      008BC8 1D 00 02         [ 2] 2256         SUBW X,#2
      008BCB 90 AE FF FF      [ 2] 2257 	LDW Y,#0xFFFF
      008BCF FF               [ 2] 2258         LDW (X),Y
      008BD0 81               [ 4] 2259         RET
                                   2260 
                                   2261 ;       >CHAR   ( c -- c )
                                   2262 ;       Filter non-printing characters.
      008BD1 8B C5                 2263         .word      LINK
                           000B53  2264 LINK = . 
      008BD3 05                    2265         .byte      5
      008BD4 3E 43 48 41 52        2266         .ascii     ">CHAR"
      008BD9                       2267 TCHAR:
      008BD9 E6 01            [ 1] 2268         ld a,(1,x)
      008BDB A1 20            [ 1] 2269         cp a,#32  
      008BDD 2B 05            [ 1] 2270         jrmi 1$ 
      008BDF A1 7F            [ 1] 2271         cp a,#127 
      008BE1 2A 01            [ 1] 2272         jrpl 1$ 
      008BE3 81               [ 4] 2273         ret 
      008BE4 A6 5F            [ 1] 2274 1$:     ld a,#'_ 
      008BE6 E7 01            [ 1] 2275         ld (1,x),a 
      008BE8 81               [ 4] 2276         ret 
                                   2277 
                                   2278 ;       DEPTH   ( -- n )
                                   2279 ;       Return  depth of  data stack.
      008BE9 8B D3                 2280         .word      LINK
                           000B6B  2281 LINK = . 
      008BEB 05                    2282         .byte      5
      008BEC 44 45 50 54 48        2283         .ascii     "DEPTH"
      008BF1                       2284 DEPTH: 
      008BF1 90 BE 2C         [ 2] 2285         LDW Y,SP0    ;save data stack ptr
      008BF4 BF 24            [ 2] 2286 	LDW XTEMP,X
      008BF6 72 B2 00 24      [ 2] 2287         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008BFA 90 57            [ 2] 2288         SRAW Y    ;Y = #stack items
      008BFC 1D 00 02         [ 2] 2289 	SUBW X,#2
      008BFF FF               [ 2] 2290         LDW (X),Y     ; if neg, underflow
      008C00 81               [ 4] 2291         RET
                                   2292 
                                   2293 ;       PICK    ( ... +n -- ... w )
                                   2294 ;       Copy  nth stack item to tos.
      008C01 8B EB                 2295         .word      LINK
                           000B83  2296 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008C03 04                    2297         .byte      4
      008C04 50 49 43 4B           2298         .ascii     "PICK"
      008C08                       2299 PICK:
      008C08 90 93            [ 1] 2300         LDW Y,X   ;D = n1
      008C0A 90 FE            [ 2] 2301         LDW Y,(Y)
                                   2302 ; modified for standard compliance          
                                   2303 ; 0 PICK must be equivalent to DUP 
      008C0C 90 5C            [ 1] 2304         INCW Y 
      008C0E 90 58            [ 2] 2305         SLAW Y
      008C10 BF 24            [ 2] 2306         LDW XTEMP,X
      008C12 72 B9 00 24      [ 2] 2307         ADDW Y,XTEMP
      008C16 90 FE            [ 2] 2308         LDW Y,(Y)
      008C18 FF               [ 2] 2309         LDW (X),Y
      008C19 81               [ 4] 2310         RET
                                   2311 
                                   2312 ;; Memory access
                                   2313 
                                   2314 ;       +!      ( n a -- )
                                   2315 ;       Add n to  contents at address a.
      008C1A 8C 03                 2316         .word      LINK
                           000B9C  2317 LINK = . 
      008C1C 02                    2318         .byte      2
      008C1D 2B 21                 2319         .ascii     "+!"
      008C1F                       2320 PSTOR:
      008C1F 90 93            [ 1] 2321         ldw y,x 
      008C21 90 FE            [ 2] 2322         ldw y,(y)
      008C23 90 BF 26         [ 2] 2323         ldw YTEMP,y  ; address
      008C26 90 FE            [ 2] 2324         ldw y,(y)  
      008C28 90 89            [ 2] 2325         pushw y  ; value at address 
      008C2A 90 93            [ 1] 2326         ldw y,x 
      008C2C 90 EE 02         [ 2] 2327         ldw y,(2,y) ; n 
      008C2F 72 F9 01         [ 2] 2328         addw y,(1,sp) ; n+value
      008C32 91 CF 26         [ 5] 2329         ldw [YTEMP],y ;  a!
      008C35 90 85            [ 2] 2330         popw y    ;drop local var
      008C37 1C 00 04         [ 2] 2331         addw x,#4 ; DDROP 
      008C3A 81               [ 4] 2332         ret 
                                   2333 
                                   2334 ;       2!      ( d a -- )
                                   2335 ;       Store  double integer to address a.
      008C3B 8C 1C                 2336         .word      LINK
                           000BBD  2337 LINK = . 
      008C3D 02                    2338         .byte      2
      008C3E 32 21                 2339         .ascii     "2!"
      008C40                       2340 DSTOR:
      008C40 90 93            [ 1] 2341         ldw y,x 
      008C42 90 FE            [ 2] 2342         ldw y,(y)
      008C44 90 BF 26         [ 2] 2343         ldw YTEMP,y ; address 
      008C47 1C 00 02         [ 2] 2344         addw x,#CELLL ; drop a 
      008C4A 90 93            [ 1] 2345         ldw y,x 
      008C4C 90 FE            [ 2] 2346         ldw y,(y) ; hi word 
      008C4E 89               [ 2] 2347         pushw x 
      008C4F EE 02            [ 2] 2348         ldw x,(2,x) ; lo word 
      008C51 91 CF 26         [ 5] 2349         ldw [YTEMP],y
      008C54 90 93            [ 1] 2350         ldw y,x 
      008C56 AE 00 02         [ 2] 2351         ldw x,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008C59 92 DF 26         [ 5] 2352         ldw ([YTEMP],x),y 
      008C5C 85               [ 2] 2353         popw x 
      008C5D 1C 00 04         [ 2] 2354         addw x,#4 ; DDROP 
      008C60 81               [ 4] 2355         ret 
                                   2356 
                                   2357 ;       2@      ( a -- d )
                                   2358 ;       Fetch double integer from address a.
      008C61 8C 3D                 2359         .word      LINK
                           000BE3  2360 LINK = . 
      008C63 02                    2361         .byte      2
      008C64 32 40                 2362         .ascii     "2@"
      008C66                       2363 DAT:
      008C66 90 93            [ 1] 2364         ldw y,x 
      008C68 90 FE            [ 2] 2365         ldw y,(y) ;address 
      008C6A 90 BF 26         [ 2] 2366         ldw YTEMP,y 
      008C6D 1D 00 02         [ 2] 2367         subw x,#CELLL ; space for udh 
      008C70 91 CE 26         [ 5] 2368         ldw y,[YTEMP] ; udh 
      008C73 FF               [ 2] 2369         ldw (x),y 
      008C74 90 AE 00 02      [ 2] 2370         ldw y,#2
      008C78 91 DE 26         [ 5] 2371         ldw y,([YTEMP],y) ; udl 
      008C7B EF 02            [ 2] 2372         ldw (2,x),y
      008C7D 81               [ 4] 2373         ret 
                                   2374 
                                   2375 ;       COUNT   ( b -- b +n )
                                   2376 ;       Return count byte of a string
                                   2377 ;       and add 1 to byte address.
      008C7E 8C 63                 2378         .word      LINK
                           000C00  2379 LINK = . 
      008C80 05                    2380         .byte      5
      008C81 43 4F 55 4E 54        2381         .ascii     "COUNT"
      008C86                       2382 COUNT:
      008C86 90 93            [ 1] 2383         ldw y,x 
      008C88 90 FE            [ 2] 2384         ldw y,(y) ; address 
      008C8A 90 F6            [ 1] 2385         ld a,(y)  ; count 
      008C8C 90 5C            [ 1] 2386         incw y 
      008C8E FF               [ 2] 2387         ldw (x),y 
      008C8F 1D 00 02         [ 2] 2388         subw x,#CELLL 
      008C92 E7 01            [ 1] 2389         ld (1,x),a 
      008C94 7F               [ 1] 2390         clr (x)
      008C95 81               [ 4] 2391         ret 
                                   2392 
                                   2393 ;       HERE    ( -- a )
                                   2394 ;       Return  top of  variables
      008C96 8C 80                 2395         .word      LINK
                           000C18  2396 LINK = . 
      008C98 04                    2397         .byte      4
      008C99 48 45 52 45           2398         .ascii     "HERE"
      008C9D                       2399 HERE:
      008C9D 90 AE 00 18      [ 2] 2400       	ldw y,#UVP 
      008CA1 90 FE            [ 2] 2401         ldw y,(y)
      008CA3 1D 00 02         [ 2] 2402         subw x,#CELLL 
      008CA6 FF               [ 2] 2403         ldw (x),y 
      008CA7 81               [ 4] 2404         ret 
                                   2405 
                                   2406 ;       PAD     ( -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



                                   2407 ;       Return address of text buffer
                                   2408 ;       above  code dictionary.
      008CA8 8C 98                 2409         .word      LINK
                           000C2A  2410 LINK = . 
      008CAA 03                    2411         .byte      3
      008CAB 50 41 44              2412         .ascii     "PAD"
      008CAE                       2413 PAD:
      008CAE CD 8C 9D         [ 4] 2414         CALL     HERE
      008CB1 CD 84 F1         [ 4] 2415         CALL     DOLIT
      008CB4 00 50                 2416         .word      80
      008CB6 CC 88 45         [ 2] 2417         JP     PLUS
                                   2418 
                                   2419 ;       TIB     ( -- a )
                                   2420 ;       Return address of terminal input buffer.
      008CB9 8C AA                 2421         .word      LINK
                           000C3B  2422 LINK = . 
      008CBB 03                    2423         .byte      3
      008CBC 54 49 42              2424         .ascii     "TIB"
      008CBF                       2425 TIB:
      008CBF CD 87 14         [ 4] 2426         CALL     NTIB
      008CC2 CD 8B 18         [ 4] 2427         CALL     CELLP
      008CC5 CC 85 6F         [ 2] 2428         JP     AT
                                   2429 
                                   2430 ;       @EXECUTE        ( a -- )
                                   2431 ;       Execute vector stored in address a.
      008CC8 8C BB                 2432         .word      LINK
                           000C4A  2433 LINK = . 
      008CCA 08                    2434         .byte      8
      008CCB 40 45 58 45 43 55 54  2435         .ascii     "@EXECUTE"
             45
      008CD3                       2436 ATEXE:
      008CD3 CD 85 6F         [ 4] 2437         CALL     AT
      008CD6 CD 87 D3         [ 4] 2438         CALL     QDUP    ;?address or zero
      008CD9 CD 85 24         [ 4] 2439         CALL     QBRAN
      008CDC 8C E1                 2440         .word      EXE1
      008CDE CD 85 4B         [ 4] 2441         CALL     EXECU   ;execute if non-zero
      008CE1 81               [ 4] 2442 EXE1:   RET     ;do nothing if zero
                                   2443 
                                   2444 ;       CMOVE   ( b1 b2 u -- )
                                   2445 ;       Copy u bytes from b1 to b2.
      008CE2 8C CA                 2446         .word      LINK
                           000C64  2447 LINK = . 
      008CE4 05                    2448         .byte      5
      008CE5 43 4D 4F 56 45        2449         .ascii     "CMOVE"
      008CEA                       2450 CMOVE:
      008CEA CD 85 DF         [ 4] 2451         CALL	TOR
      008CED CD 85 3B         [ 4] 2452         CALL	BRAN
      008CF0 8D 0A                 2453         .word	CMOV2
      008CF2 CD 85 DF         [ 4] 2454 CMOV1:	CALL	TOR
      008CF5 CD 86 16         [ 4] 2455         CALL	DUPP
      008CF8 CD 85 8D         [ 4] 2456         CALL	CAT
      008CFB CD 85 D3         [ 4] 2457         CALL	RAT
      008CFE CD 85 7C         [ 4] 2458         CALL	CSTOR
      008D01 CD 8B 43         [ 4] 2459         CALL	ONEP
      008D04 CD 85 C0         [ 4] 2460         CALL	RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008D07 CD 8B 43         [ 4] 2461         CALL	ONEP
      008D0A CD 85 05         [ 4] 2462 CMOV2:	CALL	DONXT
      008D0D 8C F2                 2463         .word	CMOV1
      008D0F CC 88 25         [ 2] 2464         JP	DDROP
                                   2465 
                                   2466 ;       FILL    ( b u c -- )
                                   2467 ;       Fill u bytes of character c
                                   2468 ;       to area beginning at b.
      008D12 8C E4                 2469         .word       LINK
                           000C94  2470 LINK = . 
      008D14 04                    2471         .byte       4
      008D15 46 49 4C 4C           2472         .ascii     "FILL"
      008D19                       2473 FILL:
      008D19 90 93            [ 1] 2474         ldw y,x 
      008D1B 90 E6 01         [ 1] 2475         ld a,(1,y) ; c 
      008D1E 1C 00 02         [ 2] 2476         addw x,#CELLL ; drop c 
      008D21 90 93            [ 1] 2477         ldw y,x 
      008D23 90 FE            [ 2] 2478         ldw y,(y) ; count
      008D25 90 89            [ 2] 2479         pushw y 
      008D27 1C 00 02         [ 2] 2480         addw x,#CELLL ; drop u 
      008D2A 90 93            [ 1] 2481         ldw y,x 
      008D2C 1C 00 02         [ 2] 2482         addw x,#CELLL ; drop b 
      008D2F 90 FE            [ 2] 2483         ldw y,(y) ; address
      008D31 90 BF 26         [ 2] 2484         ldw YTEMP,y
      008D34 90 85            [ 2] 2485         popw y ; count 
      008D36                       2486 FILL1:  
      008D36 92 C7 26         [ 4] 2487         ld [YTEMP],a 
      008D39 3C 27            [ 1] 2488         inc YTEMP+1
      008D3B 24 02            [ 1] 2489         jrnc FILL2 
      008D3D 3C 26            [ 1] 2490         inc YTEMP
      008D3F                       2491 FILL2: 
      008D3F 90 5A            [ 2] 2492         decw y ; count 
      008D41 26 F3            [ 1] 2493         jrne FILL1  
      008D43 81               [ 4] 2494         ret 
                                   2495 
                                   2496 ;       ERASE   ( b u -- )
                                   2497 ;       Erase u bytes beginning at b.
      008D44 8D 14                 2498         .word      LINK
                           000CC6  2499 LINK = . 
      008D46 05                    2500         .byte      5
      008D47 45 52 41 53 45        2501         .ascii     "ERASE"
      008D4C                       2502 ERASE:
      008D4C 90 5F            [ 1] 2503         clrw y 
      008D4E 1D 00 02         [ 2] 2504         subw x,#CELLL 
      008D51 FF               [ 2] 2505         ldw (x),y 
      008D52 CC 8D 19         [ 2] 2506         jp FILL 
                                   2507 
                                   2508 
                                   2509 ;       PACK0   ( b u a -- a )
                                   2510 ;       Build a counted string with
                                   2511 ;       u characters from b. Null fill.
      008D55 8D 46                 2512         .word      LINK
                           000CD7  2513 LINK = . 
      008D57 05                    2514         .byte      5
      008D58 50 41 43 4B 30        2515         .ascii     "PACK0"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008D5D                       2516 PACKS:
      008D5D CD 86 16         [ 4] 2517         CALL     DUPP
      008D60 CD 85 DF         [ 4] 2518         CALL     TOR     ;strings only on cell boundary
      008D63 CD 88 30         [ 4] 2519         CALL     DDUP
      008D66 CD 85 7C         [ 4] 2520         CALL     CSTOR
      008D69 CD 8B 43         [ 4] 2521         CALL     ONEP ;save count
      008D6C CD 86 26         [ 4] 2522         CALL     SWAPP
      008D6F CD 8C EA         [ 4] 2523         CALL     CMOVE
      008D72 CD 85 C0         [ 4] 2524         CALL     RFROM
      008D75 81               [ 4] 2525         RET
                                   2526 
                                   2527 ;; Numeric output, single precision
                                   2528 
                                   2529 ;       DIGIT   ( u -- c )
                                   2530 ;       Convert digit u to a character.
      008D76 8D 57                 2531         .word      LINK
                           000CF8  2532 LINK = . 
      008D78 05                    2533         .byte      5
      008D79 44 49 47 49 54        2534         .ascii     "DIGIT"
      008D7E                       2535 DIGIT:
      008D7E CD 84 F1         [ 4] 2536         CALL	DOLIT
      008D81 00 09                 2537         .word	9
      008D83 CD 86 40         [ 4] 2538         CALL	OVER
      008D86 CD 89 23         [ 4] 2539         CALL	LESS
      008D89 CD 84 F1         [ 4] 2540         CALL	DOLIT
      008D8C 00 07                 2541         .word	7
      008D8E CD 86 75         [ 4] 2542         CALL	ANDD
      008D91 CD 88 45         [ 4] 2543         CALL	PLUS
      008D94 CD 84 F1         [ 4] 2544         CALL	DOLIT
      008D97 00 30                 2545         .word	48	;'0'
      008D99 CC 88 45         [ 2] 2546         JP	PLUS
                                   2547 
                                   2548 ;       EXTRACT ( n base -- n c )
                                   2549 ;       Extract least significant digit from n.
      008D9C 8D 78                 2550         .word      LINK
                           000D1E  2551 LINK = . 
      008D9E 07                    2552         .byte      7
      008D9F 45 58 54 52 41 43 54  2553         .ascii     "EXTRACT"
      008DA6                       2554 EXTRC:
      008DA6 CD 8B AF         [ 4] 2555         CALL     ZERO
      008DA9 CD 86 26         [ 4] 2556         CALL     SWAPP
      008DAC CD 89 B9         [ 4] 2557         CALL     UMMOD
      008DAF CD 86 26         [ 4] 2558         CALL     SWAPP
      008DB2 CC 8D 7E         [ 2] 2559         JP     DIGIT
                                   2560 
                                   2561 ;       <#      ( -- )
                                   2562 ;       Initiate  numeric output process.
      008DB5 8D 9E                 2563         .word      LINK
                           000D37  2564 LINK = . 
      008DB7 02                    2565         .byte      2
      008DB8 3C 23                 2566         .ascii     "<#"
      008DBA                       2567 BDIGS:
      008DBA CD 8C AE         [ 4] 2568         CALL     PAD
      008DBD CD 87 56         [ 4] 2569         CALL     HLD
      008DC0 CC 85 58         [ 2] 2570         JP     STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



                                   2571 
                                   2572 ;       HOLD    ( c -- )
                                   2573 ;       Insert a character into output string.
      008DC3 8D B7                 2574         .word      LINK
                           000D45  2575 LINK = . 
      008DC5 04                    2576         .byte      4
      008DC6 48 4F 4C 44           2577         .ascii     "HOLD"
      008DCA                       2578 HOLD:
      008DCA CD 87 56         [ 4] 2579         CALL     HLD
      008DCD CD 85 6F         [ 4] 2580         CALL     AT
      008DD0 CD 8B 50         [ 4] 2581         CALL     ONEM
      008DD3 CD 86 16         [ 4] 2582         CALL     DUPP
      008DD6 CD 87 56         [ 4] 2583         CALL     HLD
      008DD9 CD 85 58         [ 4] 2584         CALL     STORE
      008DDC CC 85 7C         [ 2] 2585         JP     CSTOR
                                   2586 
                                   2587 ;       #       ( u -- u )
                                   2588 ;       Extract one digit from u and
                                   2589 ;       append digit to output string.
      008DDF 8D C5                 2590         .word      LINK
                           000D61  2591 LINK = . 
      008DE1 01                    2592         .byte      1
      008DE2 23                    2593         .ascii     "#"
      008DE3                       2594 DIG:
      008DE3 CD 86 E6         [ 4] 2595         CALL     BASE
      008DE6 CD 85 6F         [ 4] 2596         CALL     AT
      008DE9 CD 8D A6         [ 4] 2597         CALL     EXTRC
      008DEC CC 8D CA         [ 2] 2598         JP     HOLD
                                   2599 
                                   2600 ;       #S      ( u -- 0 )
                                   2601 ;       Convert u until all digits
                                   2602 ;       are added to output string.
      008DEF 8D E1                 2603         .word      LINK
                           000D71  2604 LINK = . 
      008DF1 02                    2605         .byte      2
      008DF2 23 53                 2606         .ascii     "#S"
      008DF4                       2607 DIGS:
      008DF4 CD 8D E3         [ 4] 2608 DIGS1:  CALL     DIG
      008DF7 CD 86 16         [ 4] 2609         CALL     DUPP
      008DFA CD 85 24         [ 4] 2610         CALL     QBRAN
      008DFD 8E 01                 2611         .word      DIGS2
      008DFF 20 F3            [ 2] 2612         JRA     DIGS1
      008E01 81               [ 4] 2613 DIGS2:  RET
                                   2614 
                                   2615 ;       SIGN    ( n -- )
                                   2616 ;       Add a minus sign to
                                   2617 ;       numeric output string.
      008E02 8D F1                 2618         .word      LINK
                           000D84  2619 LINK = . 
      008E04 04                    2620         .byte      4
      008E05 53 49 47 4E           2621         .ascii     "SIGN"
      008E09                       2622 SIGN:
      008E09 CD 86 4F         [ 4] 2623         CALL     ZLESS
      008E0C CD 85 24         [ 4] 2624         CALL     QBRAN
      008E0F 8E 19                 2625         .word      SIGN1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008E11 CD 84 F1         [ 4] 2626         CALL     DOLIT
      008E14 00 2D                 2627         .word      45	;"-"
      008E16 CC 8D CA         [ 2] 2628         JP     HOLD
      008E19 81               [ 4] 2629 SIGN1:  RET
                                   2630 
                                   2631 ;       #>      ( w -- b u )
                                   2632 ;       Prepare output string.
      008E1A 8E 04                 2633         .word      LINK
                           000D9C  2634 LINK = . 
      008E1C 02                    2635         .byte      2
      008E1D 23 3E                 2636         .ascii     "#>"
      008E1F                       2637 EDIGS:
      008E1F CD 86 0C         [ 4] 2638         CALL     DROP
      008E22 CD 87 56         [ 4] 2639         CALL     HLD
      008E25 CD 85 6F         [ 4] 2640         CALL     AT
      008E28 CD 8C AE         [ 4] 2641         CALL     PAD
      008E2B CD 86 40         [ 4] 2642         CALL     OVER
      008E2E CC 88 BE         [ 2] 2643         JP     SUBB
                                   2644 
                                   2645 ;       str     ( w -- b u )
                                   2646 ;       Convert a signed integer
                                   2647 ;       to a numeric string.
      008E31 8E 1C                 2648         .word      LINK
                           000DB3  2649 LINK = . 
      008E33 03                    2650         .byte      3
      008E34 53 54 52              2651         .ascii     "STR"
      008E37                       2652 STR:
      008E37 CD 86 16         [ 4] 2653         CALL     DUPP
      008E3A CD 85 DF         [ 4] 2654         CALL     TOR
      008E3D CD 88 D8         [ 4] 2655         CALL     ABSS
      008E40 CD 8D BA         [ 4] 2656         CALL     BDIGS
      008E43 CD 8D F4         [ 4] 2657         CALL     DIGS
      008E46 CD 85 C0         [ 4] 2658         CALL     RFROM
      008E49 CD 8E 09         [ 4] 2659         CALL     SIGN
      008E4C CC 8E 1F         [ 2] 2660         JP     EDIGS
                                   2661 
                                   2662 ;       HEX     ( -- )
                                   2663 ;       Use radix 16 as base for
                                   2664 ;       numeric conversions.
      008E4F 8E 33                 2665         .word      LINK
                           000DD1  2666 LINK = . 
      008E51 03                    2667         .byte      3
      008E52 48 45 58              2668         .ascii     "HEX"
      008E55                       2669 HEX:
      008E55 CD 84 F1         [ 4] 2670         CALL     DOLIT
      008E58 00 10                 2671         .word      16
      008E5A CD 86 E6         [ 4] 2672         CALL     BASE
      008E5D CC 85 58         [ 2] 2673         JP     STORE
                                   2674 
                                   2675 ;       DECIMAL ( -- )
                                   2676 ;       Use radix 10 as base
                                   2677 ;       for numeric conversions.
      008E60 8E 51                 2678         .word      LINK
                           000DE2  2679 LINK = . 
      008E62 07                    2680         .byte      7
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008E63 44 45 43 49 4D 41 4C  2681         .ascii     "DECIMAL"
      008E6A                       2682 DECIM:
      008E6A CD 84 F1         [ 4] 2683         CALL     DOLIT
      008E6D 00 0A                 2684         .word      10
      008E6F CD 86 E6         [ 4] 2685         CALL     BASE
      008E72 CC 85 58         [ 2] 2686         JP     STORE
                                   2687 
                                   2688 ;; Numeric input, single precision
                                   2689 
                                   2690 ;       DIGIT?  ( c base -- u t )
                                   2691 ;       Convert a character to its numeric
                                   2692 ;       value. A flag indicates success.
      008E75 8E 62                 2693         .word      LINK
                           000DF7  2694 LINK = . 
      008E77 06                    2695         .byte       6
      008E78 44 49 47 49 54 3F     2696         .ascii     "DIGIT?"
      008E7E                       2697 DIGTQ:
      008E7E CD 85 DF         [ 4] 2698         CALL     TOR
      008E81 CD 84 F1         [ 4] 2699         CALL     DOLIT
      008E84 00 30                 2700         .word     48	; "0"
      008E86 CD 88 BE         [ 4] 2701         CALL     SUBB
      008E89 CD 84 F1         [ 4] 2702         CALL     DOLIT
      008E8C 00 09                 2703         .word      9
      008E8E CD 86 40         [ 4] 2704         CALL     OVER
      008E91 CD 89 23         [ 4] 2705         CALL     LESS
      008E94 CD 85 24         [ 4] 2706         CALL     QBRAN
      008E97 8E AF                 2707         .word      DGTQ1
      008E99 CD 84 F1         [ 4] 2708         CALL     DOLIT
      008E9C 00 07                 2709         .word      7
      008E9E CD 88 BE         [ 4] 2710         CALL     SUBB
      008EA1 CD 86 16         [ 4] 2711         CALL     DUPP
      008EA4 CD 84 F1         [ 4] 2712         CALL     DOLIT
      008EA7 00 0A                 2713         .word      10
      008EA9 CD 89 23         [ 4] 2714         CALL     LESS
      008EAC CD 86 89         [ 4] 2715         CALL     ORR
      008EAF CD 86 16         [ 4] 2716 DGTQ1:  CALL     DUPP
      008EB2 CD 85 C0         [ 4] 2717         CALL     RFROM
      008EB5 CC 89 05         [ 2] 2718         JP     ULESS
                                   2719 
                           000001  2720 .if  WANT_DOUBLE
                           000000  2721 .else 
                                   2722 ;       NUMBER? ( a -- n T | a F )
                                   2723 ;       Convert a number string to
                                   2724 ;       integer. Push a flag on tos.
                                   2725         .word      LINK
                                   2726 LINK = . 
                                   2727         .byte      7
                                   2728         .ascii     "NUMBER?"
                                   2729 NUMBQ:
                                   2730         CALL     BASE
                                   2731         CALL     AT
                                   2732         CALL     TOR
                                   2733         CALL     ZERO
                                   2734         CALL     OVER
                                   2735         CALL     COUNT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2736         CALL     OVER
                                   2737         CALL     CAT
                                   2738         CALL     DOLIT
                                   2739         .word     36	; "0x"
                                   2740         CALL     EQUAL
                                   2741         CALL     QBRAN
                                   2742         .word      NUMQ1
                                   2743         CALL     HEX
                                   2744         CALL     SWAPP
                                   2745         CALL     ONEP
                                   2746         CALL     SWAPP
                                   2747         CALL     ONEM
                                   2748 NUMQ1:  CALL     OVER
                                   2749         CALL     CAT
                                   2750         CALL     DOLIT
                                   2751         .word     45	; "-"
                                   2752         CALL     EQUAL
                                   2753         CALL     TOR
                                   2754         CALL     SWAPP
                                   2755         CALL     RAT
                                   2756         CALL     SUBB
                                   2757         CALL     SWAPP
                                   2758         CALL     RAT
                                   2759         CALL     PLUS
                                   2760         CALL     QDUP
                                   2761         CALL     QBRAN
                                   2762         .word      NUMQ6
                                   2763         CALL     ONEM
                                   2764         CALL     TOR
                                   2765 NUMQ2:  CALL     DUPP
                                   2766         CALL     TOR
                                   2767         CALL     CAT
                                   2768         CALL     BASE
                                   2769         CALL     AT
                                   2770         CALL     DIGTQ
                                   2771         CALL     QBRAN
                                   2772         .word      NUMQ4
                                   2773         CALL     SWAPP
                                   2774         CALL     BASE
                                   2775         CALL     AT
                                   2776         CALL     STAR
                                   2777         CALL     PLUS
                                   2778         CALL     RFROM
                                   2779         CALL     ONEP
                                   2780         CALL     DONXT
                                   2781         .word      NUMQ2
                                   2782         CALL     RAT
                                   2783         CALL     SWAPP
                                   2784         CALL     DROP
                                   2785         CALL     QBRAN
                                   2786         .word      NUMQ3
                                   2787         CALL     NEGAT
                                   2788 NUMQ3:  CALL     SWAPP
                                   2789         JRA     NUMQ5
                                   2790 NUMQ4:  CALL     RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2791         CALL     RFROM
                                   2792         CALL     DDROP
                                   2793         CALL     DDROP
                                   2794         CALL     ZERO
                                   2795 NUMQ5:  CALL     DUPP
                                   2796 NUMQ6:  CALL     RFROM
                                   2797         CALL     DDROP
                                   2798         CALL     RFROM
                                   2799         CALL     BASE
                                   2800         JP     STORE
                                   2801 .endif ; WANT_DOUBLE  
                                   2802 
                                   2803 ;; Basic I/O
                                   2804 
                                   2805 ;       KEY     ( -- c )
                                   2806 ;       Wait for and return an
                                   2807 ;       input character.
      008EB8 8E 77                 2808         .word      LINK
                           000E3A  2809 LINK = . 
      008EBA 03                    2810         .byte      3
      008EBB 4B 45 59              2811         .ascii     "KEY"
      008EBE                       2812 KEY:
      008EBE 72 0B 52 30 FB   [ 2] 2813         btjf UART_SR,#UART_SR_RXNE,. 
      008EC3 C6 52 31         [ 1] 2814         ld a,UART_DR 
      008EC6 1D 00 02         [ 2] 2815         subw x,#CELLL 
      008EC9 E7 01            [ 1] 2816         ld (1,x),a 
      008ECB 7F               [ 1] 2817         clr (x)
      008ECC 81               [ 4] 2818         ret 
                                   2819 
                                   2820 ;       NUF?    ( -- t )
                                   2821 ;       Return false if no input,
                                   2822 ;       else pause and if CR return true.
      008ECD 8E BA                 2823         .word      LINK
                           000E4F  2824 LINK = . 
      008ECF 04                    2825         .byte      4
      008ED0 4E 55 46 3F           2826         .ascii     "NUF?"
      008ED4                       2827 NUFQ:
      008ED4 CD 84 98         [ 4] 2828         CALL     QKEY
      008ED7 CD 86 16         [ 4] 2829         CALL     DUPP
      008EDA CD 85 24         [ 4] 2830         CALL     QBRAN
      008EDD 8E ED                 2831         .word    NUFQ1
      008EDF CD 88 25         [ 4] 2832         CALL     DDROP
      008EE2 CD 8E BE         [ 4] 2833         CALL     KEY
      008EE5 CD 84 F1         [ 4] 2834         CALL     DOLIT
      008EE8 00 0D                 2835         .word      CRR
      008EEA CC 88 E6         [ 2] 2836         JP     EQUAL
      008EED 81               [ 4] 2837 NUFQ1:  RET
                                   2838 
                                   2839 ;       SPACE   ( -- )
                                   2840 ;       Send  blank character to
                                   2841 ;       output device.
      008EEE 8E CF                 2842         .word      LINK
                           000E70  2843 LINK = . 
      008EF0 05                    2844         .byte      5
      008EF1 53 50 41 43 45        2845         .ascii     "SPACE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008EF6                       2846 SPACE:
      008EF6 CD 8B A2         [ 4] 2847         CALL     BLANK
      008EF9 CC 84 B6         [ 2] 2848         JP     EMIT
                                   2849 
                                   2850 ;       SPACES  ( +n -- )
                                   2851 ;       Send n spaces to output device.
      008EFC 8E F0                 2852         .word      LINK
                           000E7E  2853 LINK = . 
      008EFE 06                    2854         .byte      6
      008EFF 53 50 41 43 45 53     2855         .ascii     "SPACES"
      008F05                       2856 SPACS:
      008F05 CD 8B AF         [ 4] 2857         CALL     ZERO
      008F08 CD 89 61         [ 4] 2858         CALL     MAX
      008F0B CD 85 DF         [ 4] 2859         CALL     TOR
      008F0E 20 03            [ 2] 2860         JRA      CHAR2
      008F10 CD 8E F6         [ 4] 2861 CHAR1:  CALL     SPACE
      008F13 CD 85 05         [ 4] 2862 CHAR2:  CALL     DONXT
      008F16 8F 10                 2863         .word    CHAR1
      008F18 81               [ 4] 2864         RET
                                   2865 
                                   2866 ;       TYPE    ( b u -- )
                                   2867 ;       Output u characters from b.
      008F19 8E FE                 2868         .word      LINK
                           000E9B  2869 LINK = . 
      008F1B 04                    2870         .byte      4
      008F1C 54 59 50 45           2871         .ascii     "TYPE"
      008F20                       2872 TYPES:
      008F20 CD 85 DF         [ 4] 2873         CALL     TOR
      008F23 20 0C            [ 2] 2874         JRA     TYPE2
      008F25 CD 86 16         [ 4] 2875 TYPE1:  CALL     DUPP
      008F28 CD 85 8D         [ 4] 2876         CALL     CAT
      008F2B CD 84 B6         [ 4] 2877         CALL     EMIT
      008F2E CD 8B 43         [ 4] 2878         CALL     ONEP
      008F31 CD 85 05         [ 4] 2879 TYPE2:  CALL     DONXT
      008F34 8F 25                 2880         .word      TYPE1
      008F36 CC 86 0C         [ 2] 2881         JP     DROP
                                   2882 
                                   2883 ;       CR      ( -- )
                                   2884 ;       Output a carriage return
                                   2885 ;       and a line feed.
      008F39 8F 1B                 2886         .word      LINK
                           000EBB  2887 LINK = . 
      008F3B 02                    2888         .byte      2
      008F3C 43 52                 2889         .ascii     "CR"
      008F3E                       2890 CR:
      008F3E CD 84 F1         [ 4] 2891         CALL     DOLIT
      008F41 00 0D                 2892         .word      CRR
      008F43 CD 84 B6         [ 4] 2893         CALL     EMIT
      008F46 CD 84 F1         [ 4] 2894         CALL     DOLIT
      008F49 00 0A                 2895         .word      LF
      008F4B CC 84 B6         [ 2] 2896         JP     EMIT
                                   2897 
                                   2898 ;       do$     ( -- a )
                                   2899 ;       Return  address of a compiled
                                   2900 ;       string.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008F4E 8F 3B                 2901         .word      LINK
                           000ED0  2902 LINK = . 
      008F50 43                    2903 	.byte      COMPO+3
      008F51 44 4F 24              2904         .ascii     "DO$"
      008F54                       2905 DOSTR:
      008F54 CD 85 C0         [ 4] 2906         CALL     RFROM
      008F57 CD 85 D3         [ 4] 2907         CALL     RAT
      008F5A CD 85 C0         [ 4] 2908         CALL     RFROM
      008F5D CD 8C 86         [ 4] 2909         CALL     COUNT
      008F60 CD 88 45         [ 4] 2910         CALL     PLUS
      008F63 CD 85 DF         [ 4] 2911         CALL     TOR
      008F66 CD 86 26         [ 4] 2912         CALL     SWAPP
      008F69 CD 85 DF         [ 4] 2913         CALL     TOR
      008F6C 81               [ 4] 2914         RET
                                   2915 
                                   2916 ;       $"|     ( -- a )
                                   2917 ;       Run time routine compiled by $".
                                   2918 ;       Return address of a compiled string.
      008F6D 8F 50                 2919         .word      LINK
                           000EEF  2920 LINK = . 
      008F6F 43                    2921 	.byte      COMPO+3
      008F70 24 22 7C              2922         .byte     '$','"','|'
      008F73                       2923 STRQP:
      008F73 CD 8F 54         [ 4] 2924         CALL     DOSTR
      008F76 81               [ 4] 2925         RET
                                   2926 
                                   2927 ;       ."|     ( -- )
                                   2928 ;       Run time routine of ." .
                                   2929 ;       Output a compiled string.
      008F77 8F 6F                 2930         .word      LINK
                           000EF9  2931 LINK = . 
      008F79 43                    2932 	.byte      COMPO+3
      008F7A 2E 22 7C              2933         .byte     '.','"','|'
      008F7D                       2934 DOTQP:
      008F7D CD 8F 54         [ 4] 2935         CALL     DOSTR
      008F80 CD 8C 86         [ 4] 2936         CALL     COUNT
      008F83 CC 8F 20         [ 2] 2937         JP     TYPES
                                   2938 
                                   2939 ;       .R      ( n +n -- )
                                   2940 ;       Display an integer in a field
                                   2941 ;       of n columns, right justified.
      008F86 8F 79                 2942         .word      LINK
                           000F08  2943 LINK = . 
      008F88 02                    2944         .byte      2
      008F89 2E 52                 2945         .ascii     ".R"
      008F8B                       2946 DOTR:
      008F8B CD 85 DF         [ 4] 2947         CALL     TOR
      008F8E CD 8E 37         [ 4] 2948         CALL     STR
      008F91 CD 85 C0         [ 4] 2949         CALL     RFROM
      008F94 CD 86 40         [ 4] 2950         CALL     OVER
      008F97 CD 88 BE         [ 4] 2951         CALL     SUBB
      008F9A CD 8F 05         [ 4] 2952         CALL     SPACS
      008F9D CC 8F 20         [ 2] 2953         JP     TYPES
                                   2954 
                                   2955 ;       U.R     ( u +n -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                                   2956 ;       Display an unsigned integer
                                   2957 ;       in n column, right justified.
      008FA0 8F 88                 2958         .word      LINK
                           000F22  2959 LINK = . 
      008FA2 03                    2960         .byte      3
      008FA3 55 2E 52              2961         .ascii     "U.R"
      008FA6                       2962 UDOTR:
      008FA6 CD 85 DF         [ 4] 2963         CALL     TOR
      008FA9 CD 8D BA         [ 4] 2964         CALL     BDIGS
      008FAC CD 8D F4         [ 4] 2965         CALL     DIGS
      008FAF CD 8E 1F         [ 4] 2966         CALL     EDIGS
      008FB2 CD 85 C0         [ 4] 2967         CALL     RFROM
      008FB5 CD 86 40         [ 4] 2968         CALL     OVER
      008FB8 CD 88 BE         [ 4] 2969         CALL     SUBB
      008FBB CD 8F 05         [ 4] 2970         CALL     SPACS
      008FBE CC 8F 20         [ 2] 2971         JP     TYPES
                                   2972 
                                   2973 ;       U.      ( u -- )
                                   2974 ;       Display an unsigned integer
                                   2975 ;       in free format.
      008FC1 8F A2                 2976         .word      LINK
                           000F43  2977 LINK = . 
      008FC3 02                    2978         .byte      2
      008FC4 55 2E                 2979         .ascii     "U."
      008FC6                       2980 UDOT:
      008FC6 CD 8D BA         [ 4] 2981         CALL     BDIGS
      008FC9 CD 8D F4         [ 4] 2982         CALL     DIGS
      008FCC CD 8E 1F         [ 4] 2983         CALL     EDIGS
      008FCF CD 8E F6         [ 4] 2984         CALL     SPACE
      008FD2 CC 8F 20         [ 2] 2985         JP     TYPES
                                   2986 
                                   2987 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2988 ;   H. ( n -- )
                                   2989 ;   display n in hexadecimal 
                                   2990 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F55                       2991         _HEADER HDOT,2,"H."
      008FD5 8F C3                    1         .word LINK 
                           000F57     2         LINK=.
      008FD7 02                       3         .byte 2  
      008FD8 48 2E                    4         .ascii "H."
      008FDA                          5         HDOT:
      008FDA CD 86 E6         [ 4] 2992         CALL BASE 
      008FDD CD 85 6F         [ 4] 2993         CALL AT 
      008FE0 CD 85 DF         [ 4] 2994         CALL TOR 
      008FE3 CD 8E 55         [ 4] 2995         CALL HEX 
      008FE6 CD 8F C6         [ 4] 2996         CALL UDOT 
      008FE9 CD 85 C0         [ 4] 2997         CALL RFROM 
      008FEC CD 86 E6         [ 4] 2998         CALL BASE 
      008FEF CD 85 58         [ 4] 2999         CALL STORE 
      008FF2 81               [ 4] 3000         RET 
                                   3001 
                                   3002 
                                   3003 ;       .       ( w -- )
                                   3004 ;       Display an integer in free
                                   3005 ;       format, preceeded by a space.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      008FF3 8F D7                 3006         .word      LINK
                           000F75  3007 LINK = . 
      008FF5 01                    3008         .byte      1
      008FF6 2E                    3009         .ascii     "."
      008FF7                       3010 DOT:
      008FF7 CD 86 E6         [ 4] 3011         CALL     BASE
      008FFA CD 85 6F         [ 4] 3012         CALL     AT
      008FFD CD 84 F1         [ 4] 3013         CALL     DOLIT
      009000 00 0A                 3014         .word      10
      009002 CD 86 9E         [ 4] 3015         CALL     XORR    ;?decimal
      009005 CD 85 24         [ 4] 3016         CALL     QBRAN
      009008 90 0D                 3017         .word      DOT1
      00900A CC 8F C6         [ 2] 3018         JP     UDOT
      00900D CD 8E 37         [ 4] 3019 DOT1:   CALL     STR
      009010 CD 8E F6         [ 4] 3020         CALL     SPACE
      009013 CC 8F 20         [ 2] 3021         JP     TYPES
                                   3022 
                                   3023 ;       ?       ( a -- )
                                   3024 ;       Display contents in memory cell.
      009016 8F F5                 3025         .word      LINK
                                   3026         
                           000F98  3027 LINK = . 
      009018 01                    3028         .byte      1
      009019 3F                    3029         .ascii     "?"
      00901A                       3030 QUEST:
      00901A CD 85 6F         [ 4] 3031         CALL     AT
      00901D CC 8F F7         [ 2] 3032         JP     DOT
                                   3033 
                                   3034 ;; Parsing
                                   3035 
                                   3036 ;       parse   ( b u c -- b u delta ; <string> )
                                   3037 ;       Scan string delimited by c.
                                   3038 ;       Return found string and its offset.
      009020 90 18                 3039         .word      LINK
                           000FA2  3040 LINK = . 
      009022 05                    3041         .byte      5
      009023 70 61 72 73 65        3042         .ascii     "parse"
      009028                       3043 PARS:
      009028 CD 86 F5         [ 4] 3044         CALL     TEMP
      00902B CD 85 58         [ 4] 3045         CALL     STORE
      00902E CD 86 40         [ 4] 3046         CALL     OVER
      009031 CD 85 DF         [ 4] 3047         CALL     TOR
      009034 CD 86 16         [ 4] 3048         CALL     DUPP
      009037 CD 85 24         [ 4] 3049         CALL     QBRAN
      00903A 90 E0                 3050         .word    PARS8
      00903C CD 8B 50         [ 4] 3051         CALL     ONEM
      00903F CD 86 F5         [ 4] 3052         CALL     TEMP
      009042 CD 85 6F         [ 4] 3053         CALL     AT
      009045 CD 8B A2         [ 4] 3054         CALL     BLANK
      009048 CD 88 E6         [ 4] 3055         CALL     EQUAL
      00904B CD 85 24         [ 4] 3056         CALL     QBRAN
      00904E 90 81                 3057         .word      PARS3
      009050 CD 85 DF         [ 4] 3058         CALL     TOR
      009053 CD 8B A2         [ 4] 3059 PARS1:  CALL     BLANK
      009056 CD 86 40         [ 4] 3060         CALL     OVER
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      009059 CD 85 8D         [ 4] 3061         CALL     CAT     ;skip leading blanks ONLY
      00905C CD 88 BE         [ 4] 3062         CALL     SUBB
      00905F CD 86 4F         [ 4] 3063         CALL     ZLESS
      009062 CD 88 5F         [ 4] 3064         CALL     INVER
      009065 CD 85 24         [ 4] 3065         CALL     QBRAN
      009068 90 7E                 3066         .word      PARS2
      00906A CD 8B 43         [ 4] 3067         CALL     ONEP
      00906D CD 85 05         [ 4] 3068         CALL     DONXT
      009070 90 53                 3069         .word      PARS1
      009072 CD 85 C0         [ 4] 3070         CALL     RFROM
      009075 CD 86 0C         [ 4] 3071         CALL     DROP
      009078 CD 8B AF         [ 4] 3072         CALL     ZERO
      00907B CC 86 16         [ 2] 3073         JP     DUPP
      00907E CD 85 C0         [ 4] 3074 PARS2:  CALL     RFROM
      009081 CD 86 40         [ 4] 3075 PARS3:  CALL     OVER
      009084 CD 86 26         [ 4] 3076         CALL     SWAPP
      009087 CD 85 DF         [ 4] 3077         CALL     TOR
      00908A CD 86 F5         [ 4] 3078 PARS4:  CALL     TEMP
      00908D CD 85 6F         [ 4] 3079         CALL     AT
      009090 CD 86 40         [ 4] 3080         CALL     OVER
      009093 CD 85 8D         [ 4] 3081         CALL     CAT
      009096 CD 88 BE         [ 4] 3082         CALL     SUBB    ;scan for delimiter
      009099 CD 86 F5         [ 4] 3083         CALL     TEMP
      00909C CD 85 6F         [ 4] 3084         CALL     AT
      00909F CD 8B A2         [ 4] 3085         CALL     BLANK
      0090A2 CD 88 E6         [ 4] 3086         CALL     EQUAL
      0090A5 CD 85 24         [ 4] 3087         CALL     QBRAN
      0090A8 90 AD                 3088         .word      PARS5
      0090AA CD 86 4F         [ 4] 3089         CALL     ZLESS
      0090AD CD 85 24         [ 4] 3090 PARS5:  CALL     QBRAN
      0090B0 90 C2                 3091         .word      PARS6
      0090B2 CD 8B 43         [ 4] 3092         CALL     ONEP
      0090B5 CD 85 05         [ 4] 3093         CALL     DONXT
      0090B8 90 8A                 3094         .word      PARS4
      0090BA CD 86 16         [ 4] 3095         CALL     DUPP
      0090BD CD 85 DF         [ 4] 3096         CALL     TOR
      0090C0 20 0F            [ 2] 3097         JRA     PARS7
      0090C2 CD 85 C0         [ 4] 3098 PARS6:  CALL     RFROM
      0090C5 CD 86 0C         [ 4] 3099         CALL     DROP
      0090C8 CD 86 16         [ 4] 3100         CALL     DUPP
      0090CB CD 8B 43         [ 4] 3101         CALL     ONEP
      0090CE CD 85 DF         [ 4] 3102         CALL     TOR
      0090D1 CD 86 40         [ 4] 3103 PARS7:  CALL     OVER
      0090D4 CD 88 BE         [ 4] 3104         CALL     SUBB
      0090D7 CD 85 C0         [ 4] 3105         CALL     RFROM
      0090DA CD 85 C0         [ 4] 3106         CALL     RFROM
      0090DD CC 88 BE         [ 2] 3107         JP     SUBB
      0090E0 CD 86 40         [ 4] 3108 PARS8:  CALL     OVER
      0090E3 CD 85 C0         [ 4] 3109         CALL     RFROM
      0090E6 CC 88 BE         [ 2] 3110         JP     SUBB
                                   3111 
                                   3112 ;       PARSE   ( c -- b u ; <string> )
                                   3113 ;       Scan input stream and return
                                   3114 ;       counted string delimited by c.
      0090E9 90 22                 3115         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                           00106B  3116 LINK = . 
      0090EB 05                    3117         .byte      5
      0090EC 50 41 52 53 45        3118         .ascii     "PARSE"
      0090F1                       3119 PARSE:
      0090F1 CD 85 DF         [ 4] 3120         CALL     TOR
      0090F4 CD 8C BF         [ 4] 3121         CALL     TIB
      0090F7 CD 87 04         [ 4] 3122         CALL     INN
      0090FA CD 85 6F         [ 4] 3123         CALL     AT
      0090FD CD 88 45         [ 4] 3124         CALL     PLUS    ;current input buffer pointer
      009100 CD 87 14         [ 4] 3125         CALL     NTIB
      009103 CD 85 6F         [ 4] 3126         CALL     AT
      009106 CD 87 04         [ 4] 3127         CALL     INN
      009109 CD 85 6F         [ 4] 3128         CALL     AT
      00910C CD 88 BE         [ 4] 3129         CALL     SUBB    ;remaining count
      00910F CD 85 C0         [ 4] 3130         CALL     RFROM
      009112 CD 90 28         [ 4] 3131         CALL     PARS
      009115 CD 87 04         [ 4] 3132         CALL     INN
      009118 CC 8C 1F         [ 2] 3133         JP     PSTOR
                                   3134 
                                   3135 ;       .(      ( -- )
                                   3136 ;       Output following string up to next ) .
      00911B 90 EB                 3137         .word      LINK
                           00109D  3138 LINK = . 
      00911D 82                    3139 	.byte      IMEDD+2
      00911E 2E 28                 3140         .ascii     ".("
      009120                       3141 DOTPR:
      009120 CD 84 F1         [ 4] 3142         CALL     DOLIT
      009123 00 29                 3143         .word     41	; ")"
      009125 CD 90 F1         [ 4] 3144         CALL     PARSE
      009128 CC 8F 20         [ 2] 3145         JP     TYPES
                                   3146 
                                   3147 ;       (       ( -- )
                                   3148 ;       Ignore following string up to next ).
                                   3149 ;       A comment.
      00912B 91 1D                 3150         .word      LINK
                           0010AD  3151 LINK = . 
      00912D 81                    3152 	.byte      IMEDD+1
      00912E 28                    3153         .ascii     "("
      00912F                       3154 PAREN:
      00912F CD 84 F1         [ 4] 3155         CALL     DOLIT
      009132 00 29                 3156         .word     41	; ")"
      009134 CD 90 F1         [ 4] 3157         CALL     PARSE
      009137 CC 88 25         [ 2] 3158         JP     DDROP
                                   3159 
                                   3160 ;       \       ( -- )
                                   3161 ;       Ignore following text till
                                   3162 ;       end of line.
      00913A 91 2D                 3163         .word      LINK
                           0010BC  3164 LINK = . 
      00913C 81                    3165 	.byte      IMEDD+1
      00913D 5C                    3166         .ascii     "\"
      00913E                       3167 BKSLA:
      00913E 90 AE 00 0E      [ 2] 3168         ldw y,#UCTIB ; #TIB  
      009142 90 FE            [ 2] 3169         ldw y,(y)
      009144 90 89            [ 2] 3170         pushw y ; count in TIB 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      009146 90 AE 00 0C      [ 2] 3171         ldw y,#UINN ; >IN 
      00914A 90 BF 26         [ 2] 3172         ldw YTEMP,y
      00914D 90 85            [ 2] 3173         popw y 
      00914F 91 CF 26         [ 5] 3174         ldw [YTEMP],y
      009152 81               [ 4] 3175         ret 
                                   3176 
                                   3177 ;       WORD    ( c -- a ; <string> )
                                   3178 ;       Parse a word from input stream
                                   3179 ;       and copy it to code dictionary.
      009153 91 3C                 3180         .word      LINK
                           0010D5  3181 LINK = . 
      009155 04                    3182         .byte      4
      009156 57 4F 52 44           3183         .ascii     "WORD"
      00915A                       3184 WORDD:
      00915A CD 90 F1         [ 4] 3185         CALL     PARSE
      00915D CD 8C 9D         [ 4] 3186         CALL     HERE
      009160 CD 8B 18         [ 4] 3187         CALL     CELLP
                           000000  3188 .IF CASE_SENSE 
                                   3189         JP      PACKS 
                           000001  3190 .ELSE                 
      009163 CD 8D 5D         [ 4] 3191         CALL     PACKS
                                   3192 ; uppercase TOKEN 
      009166 CD 86 16         [ 4] 3193         CALL    DUPP 
      009169 CD 8C 86         [ 4] 3194         CALL    COUNT 
      00916C CD 85 DF         [ 4] 3195         CALL    TOR 
      00916F CD 85 3B         [ 4] 3196         CALL    BRAN 
      009172 91 A0                 3197         .word   UPPER2  
      009174                       3198 UPPER:
      009174 CD 86 16         [ 4] 3199         CALL    DUPP 
      009177 CD 85 8D         [ 4] 3200         CALL    CAT
      00917A CD 86 16         [ 4] 3201         CALL    DUPP 
      00917D CD 84 F1         [ 4] 3202         CALL   DOLIT
      009180 00 61                 3203         .word   'a' 
      009182 CD 84 F1         [ 4] 3204         CALL    DOLIT
      009185 00 7B                 3205         .word   'z'+1 
      009187 CD 89 9E         [ 4] 3206         CALL   WITHI 
      00918A CD 85 24         [ 4] 3207         CALL   QBRAN
      00918D 91 97                 3208         .word  UPPER1  
      00918F CD 84 F1         [ 4] 3209         CALL    DOLIT 
      009192 00 DF                 3210         .word   0xDF 
      009194 CD 86 75         [ 4] 3211         CALL    ANDD 
      009197                       3212 UPPER1:
      009197 CD 86 40         [ 4] 3213         CALL    OVER 
      00919A CD 85 7C         [ 4] 3214         CALL    CSTOR          
      00919D CD 8B 43         [ 4] 3215         CALL    ONEP 
      0091A0                       3216 UPPER2: 
      0091A0 CD 85 05         [ 4] 3217         CALL    DONXT
      0091A3 91 74                 3218         .word   UPPER  
      0091A5 CD 86 0C         [ 4] 3219         CALL    DROP  
      0091A8 81               [ 4] 3220         RET 
                                   3221 .ENDIF 
                                   3222 
                                   3223 ;       TOKEN   ( -- a ; <string> )
                                   3224 ;       Parse a word from input stream
                                   3225 ;       and copy it to name dictionary.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      0091A9 91 55                 3226         .word      LINK
                           00112B  3227 LINK = . 
      0091AB 05                    3228         .byte      5
      0091AC 54 4F 4B 45 4E        3229         .ascii     "TOKEN"
      0091B1                       3230 TOKEN:
      0091B1 CD 8B A2         [ 4] 3231         CALL     BLANK
      0091B4 CC 91 5A         [ 2] 3232         JP     WORDD
                                   3233 
                                   3234 ;; Dictionary search
                                   3235 
                                   3236 ;       NAME>   ( na -- ca )
                                   3237 ;       Return a code address given
                                   3238 ;       a name address.
      0091B7 91 AB                 3239         .word      LINK
                           001139  3240 LINK = . 
      0091B9 05                    3241         .byte      5
      0091BA 4E 41 4D 45 3E        3242         .ascii     "NAME>"
      0091BF                       3243 NAMET:
      0091BF CD 8C 86         [ 4] 3244         CALL     COUNT
      0091C2 CD 84 F1         [ 4] 3245         CALL     DOLIT
      0091C5 00 1F                 3246         .word      31
      0091C7 CD 86 75         [ 4] 3247         CALL     ANDD
      0091CA CC 88 45         [ 2] 3248         JP     PLUS
                                   3249 
                                   3250 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   3251 ;       Compare u cells in two
                                   3252 ;       strings. Return 0 if identical.
      0091CD 91 B9                 3253         .word      LINK
                           00114F  3254 LINK = . 
      0091CF 05                    3255         .byte       5
      0091D0 53 41 4D 45 3F        3256         .ascii     "SAME?"
      0091D5                       3257 SAMEQ:
      0091D5 CD 8B 50         [ 4] 3258         CALL     ONEM
      0091D8 CD 85 DF         [ 4] 3259         CALL     TOR
      0091DB 20 29            [ 2] 3260         JRA     SAME2
      0091DD CD 86 40         [ 4] 3261 SAME1:  CALL     OVER
      0091E0 CD 85 D3         [ 4] 3262         CALL     RAT
      0091E3 CD 88 45         [ 4] 3263         CALL     PLUS
      0091E6 CD 85 8D         [ 4] 3264         CALL     CAT
      0091E9 CD 86 40         [ 4] 3265         CALL     OVER
      0091EC CD 85 D3         [ 4] 3266         CALL     RAT
      0091EF CD 88 45         [ 4] 3267         CALL     PLUS
      0091F2 CD 85 8D         [ 4] 3268         CALL     CAT
      0091F5 CD 88 BE         [ 4] 3269         CALL     SUBB
      0091F8 CD 87 D3         [ 4] 3270         CALL     QDUP
      0091FB CD 85 24         [ 4] 3271         CALL     QBRAN
      0091FE 92 06                 3272         .word      SAME2
      009200 CD 85 C0         [ 4] 3273         CALL     RFROM
      009203 CC 86 0C         [ 2] 3274         JP     DROP
      009206 CD 85 05         [ 4] 3275 SAME2:  CALL     DONXT
      009209 91 DD                 3276         .word      SAME1
      00920B CC 8B AF         [ 2] 3277         JP     ZERO
                                   3278 
                                   3279 ;       find    ( a va -- ca na | a F )
                                   3280 ;       Search vocabulary for string.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                   3281 ;       Return ca and na if succeeded.
      00920E 91 CF                 3282         .word      LINK
                           001190  3283 LINK = . 
      009210 04                    3284         .byte      4
      009211 46 49 4E 44           3285         .ascii     "FIND"
      009215                       3286 FIND:
      009215 CD 86 26         [ 4] 3287         CALL     SWAPP
      009218 CD 86 16         [ 4] 3288         CALL     DUPP
      00921B CD 85 8D         [ 4] 3289         CALL     CAT
      00921E CD 86 F5         [ 4] 3290         CALL     TEMP
      009221 CD 85 58         [ 4] 3291         CALL     STORE
      009224 CD 86 16         [ 4] 3292         CALL     DUPP
      009227 CD 85 6F         [ 4] 3293         CALL     AT
      00922A CD 85 DF         [ 4] 3294         CALL     TOR
      00922D CD 8B 18         [ 4] 3295         CALL     CELLP
      009230 CD 86 26         [ 4] 3296         CALL     SWAPP
      009233 CD 85 6F         [ 4] 3297 FIND1:  CALL     AT
      009236 CD 86 16         [ 4] 3298         CALL     DUPP
      009239 CD 85 24         [ 4] 3299         CALL     QBRAN
      00923C 92 72                 3300         .word      FIND6
      00923E CD 86 16         [ 4] 3301         CALL     DUPP
      009241 CD 85 6F         [ 4] 3302         CALL     AT
      009244 CD 84 F1         [ 4] 3303         CALL     DOLIT
      009247 1F 7F                 3304         .word      MASKK
      009249 CD 86 75         [ 4] 3305         CALL     ANDD
      00924C CD 85 D3         [ 4] 3306         CALL     RAT
      00924F CD 86 9E         [ 4] 3307         CALL     XORR
      009252 CD 85 24         [ 4] 3308         CALL     QBRAN
      009255 92 61                 3309         .word      FIND2
      009257 CD 8B 18         [ 4] 3310         CALL     CELLP
      00925A CD 84 F1         [ 4] 3311         CALL     DOLIT
      00925D FF FF                 3312         .word     0xFFFF
      00925F 20 0C            [ 2] 3313         JRA     FIND3
      009261 CD 8B 18         [ 4] 3314 FIND2:  CALL     CELLP
      009264 CD 86 F5         [ 4] 3315         CALL     TEMP
      009267 CD 85 6F         [ 4] 3316         CALL     AT
      00926A CD 91 D5         [ 4] 3317         CALL     SAMEQ
      00926D CD 85 3B         [ 4] 3318 FIND3:  CALL     BRAN
      009270 92 81                 3319         .word      FIND4
      009272 CD 85 C0         [ 4] 3320 FIND6:  CALL     RFROM
      009275 CD 86 0C         [ 4] 3321         CALL     DROP
      009278 CD 86 26         [ 4] 3322         CALL     SWAPP
      00927B CD 8B 27         [ 4] 3323         CALL     CELLM
      00927E CC 86 26         [ 2] 3324         JP     SWAPP
      009281 CD 85 24         [ 4] 3325 FIND4:  CALL     QBRAN
      009284 92 8E                 3326         .word      FIND5
      009286 CD 8B 27         [ 4] 3327         CALL     CELLM
      009289 CD 8B 27         [ 4] 3328         CALL     CELLM
      00928C 20 A5            [ 2] 3329         JRA     FIND1
      00928E CD 85 C0         [ 4] 3330 FIND5:  CALL     RFROM
      009291 CD 86 0C         [ 4] 3331         CALL     DROP
      009294 CD 86 26         [ 4] 3332         CALL     SWAPP
      009297 CD 86 0C         [ 4] 3333         CALL     DROP
      00929A CD 8B 27         [ 4] 3334         CALL     CELLM
      00929D CD 86 16         [ 4] 3335         CALL     DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      0092A0 CD 91 BF         [ 4] 3336         CALL     NAMET
      0092A3 CC 86 26         [ 2] 3337         JP     SWAPP
                                   3338 
                                   3339 ;       NAME?   ( a -- ca na | a F )
                                   3340 ;       Search vocabularies for a string.
      0092A6 92 10                 3341         .word      LINK
                           001228  3342 LINK = . 
      0092A8 05                    3343         .byte      5
      0092A9 4E 41 4D 45 3F        3344         .ascii     "NAME?"
      0092AE                       3345 NAMEQ:
      0092AE CD 87 69         [ 4] 3346         CALL   CNTXT
      0092B1 CC 92 15         [ 2] 3347         JP     FIND
                                   3348 
                                   3349 ;; Terminal response
                                   3350 
                                   3351 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3352 ;       Backup cursor by one character.
      0092B4 92 A8                 3353         .word      LINK
                           001236  3354 LINK = . 
      0092B6 02                    3355         .byte      2
      0092B7 5E 48                 3356         .ascii     "^H"
      0092B9                       3357 BKSP:
      0092B9 CD 85 DF         [ 4] 3358         CALL     TOR
      0092BC CD 86 40         [ 4] 3359         CALL     OVER
      0092BF CD 85 C0         [ 4] 3360         CALL     RFROM
      0092C2 CD 86 26         [ 4] 3361         CALL     SWAPP
      0092C5 CD 86 40         [ 4] 3362         CALL     OVER
      0092C8 CD 86 9E         [ 4] 3363         CALL     XORR
      0092CB CD 85 24         [ 4] 3364         CALL     QBRAN
      0092CE 92 E9                 3365         .word      BACK1
      0092D0 CD 84 F1         [ 4] 3366         CALL     DOLIT
      0092D3 00 08                 3367         .word      BKSPP
      0092D5 CD 84 B6         [ 4] 3368         CALL     EMIT
      0092D8 CD 8B 50         [ 4] 3369         CALL     ONEM
      0092DB CD 8B A2         [ 4] 3370         CALL     BLANK
      0092DE CD 84 B6         [ 4] 3371         CALL     EMIT
      0092E1 CD 84 F1         [ 4] 3372         CALL     DOLIT
      0092E4 00 08                 3373         .word      BKSPP
      0092E6 CC 84 B6         [ 2] 3374         JP     EMIT
      0092E9 81               [ 4] 3375 BACK1:  RET
                                   3376 
                                   3377 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3378 ;       Accept and echo key stroke
                                   3379 ;       and bump cursor.
      0092EA 92 B6                 3380         .word      LINK
                           00126C  3381 LINK = . 
      0092EC 03                    3382         .byte      3
      0092ED 54 41 50              3383         .ascii     "TAP"
      0092F0                       3384 TAP:
      0092F0 CD 86 16         [ 4] 3385         CALL     DUPP
      0092F3 CD 84 B6         [ 4] 3386         CALL     EMIT
      0092F6 CD 86 40         [ 4] 3387         CALL     OVER
      0092F9 CD 85 7C         [ 4] 3388         CALL     CSTOR
      0092FC CC 8B 43         [ 2] 3389         JP     ONEP
                                   3390 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   3391 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3392 ;       Process a key stroke,
                                   3393 ;       CR,LF or backspace.
      0092FF 92 EC                 3394         .word      LINK
                           001281  3395 LINK = . 
      009301 04                    3396         .byte      4
      009302 4B 54 41 50           3397         .ascii     "KTAP"
      009306                       3398 KTAP:
      009306 CD 86 16         [ 4] 3399         CALL     DUPP
      009309 CD 84 F1         [ 4] 3400         CALL     DOLIT
                           000001  3401 .if EOL_CR
      00930C 00 0D                 3402         .word   CRR
                           000000  3403 .else ; EOL_LF 
                                   3404         .word   LF
                                   3405 .endif 
      00930E CD 86 9E         [ 4] 3406         CALL     XORR
      009311 CD 85 24         [ 4] 3407         CALL     QBRAN
      009314 93 2C                 3408         .word      KTAP2
      009316 CD 84 F1         [ 4] 3409         CALL     DOLIT
      009319 00 08                 3410         .word      BKSPP
      00931B CD 86 9E         [ 4] 3411         CALL     XORR
      00931E CD 85 24         [ 4] 3412         CALL     QBRAN
      009321 93 29                 3413         .word      KTAP1
      009323 CD 8B A2         [ 4] 3414         CALL     BLANK
      009326 CC 92 F0         [ 2] 3415         JP     TAP
      009329 CC 92 B9         [ 2] 3416 KTAP1:  JP     BKSP
      00932C CD 86 0C         [ 4] 3417 KTAP2:  CALL     DROP
      00932F CD 86 26         [ 4] 3418         CALL     SWAPP
      009332 CD 86 0C         [ 4] 3419         CALL     DROP
      009335 CC 86 16         [ 2] 3420         JP     DUPP
                                   3421 
                                   3422 ;       accept  ( b u -- b u )
                                   3423 ;       Accept characters to input
                                   3424 ;       buffer. Return with actual count.
      009338 93 01                 3425         .word      LINK
                           0012BA  3426 LINK = . 
      00933A 06                    3427         .byte      6
      00933B 41 43 43 45 50 54     3428         .ascii     "ACCEPT"
      009341                       3429 ACCEP:
      009341 CD 86 40         [ 4] 3430         CALL     OVER
      009344 CD 88 45         [ 4] 3431         CALL     PLUS
      009347 CD 86 40         [ 4] 3432         CALL     OVER
      00934A CD 88 30         [ 4] 3433 ACCP1:  CALL     DDUP
      00934D CD 86 9E         [ 4] 3434         CALL     XORR
      009350 CD 85 24         [ 4] 3435         CALL     QBRAN
      009353 93 75                 3436         .word      ACCP4
      009355 CD 8E BE         [ 4] 3437         CALL     KEY
      009358 CD 86 16         [ 4] 3438         CALL     DUPP
      00935B CD 8B A2         [ 4] 3439         CALL     BLANK
      00935E CD 84 F1         [ 4] 3440         CALL     DOLIT
      009361 00 7F                 3441         .word      127
      009363 CD 89 9E         [ 4] 3442         CALL     WITHI
      009366 CD 85 24         [ 4] 3443         CALL     QBRAN
      009369 93 70                 3444         .word      ACCP2
      00936B CD 92 F0         [ 4] 3445         CALL     TAP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      00936E 20 03            [ 2] 3446         JRA     ACCP3
      009370 CD 93 06         [ 4] 3447 ACCP2:  CALL     KTAP
      009373 20 D5            [ 2] 3448 ACCP3:  JRA     ACCP1
      009375 CD 86 0C         [ 4] 3449 ACCP4:  CALL     DROP
      009378 CD 86 40         [ 4] 3450         CALL     OVER
      00937B CC 88 BE         [ 2] 3451         JP     SUBB
                                   3452 
                                   3453 ;       QUERY   ( -- )
                                   3454 ;       Accept input stream to
                                   3455 ;       terminal input buffer.
      00937E 93 3A                 3456         .word      LINK
                                   3457         
                           001300  3458 LINK = . 
      009380 05                    3459         .byte      5
      009381 51 55 45 52 59        3460         .ascii     "QUERY"
      009386                       3461 QUERY:
      009386 CD 8C BF         [ 4] 3462         CALL     TIB
      009389 CD 84 F1         [ 4] 3463         CALL     DOLIT
      00938C 00 50                 3464         .word      80
      00938E CD 93 41         [ 4] 3465         CALL     ACCEP
      009391 CD 87 14         [ 4] 3466         CALL     NTIB
      009394 CD 85 58         [ 4] 3467         CALL     STORE
      009397 CD 86 0C         [ 4] 3468         CALL     DROP
      00939A CD 8B AF         [ 4] 3469         CALL     ZERO
      00939D CD 87 04         [ 4] 3470         CALL     INN
      0093A0 CC 85 58         [ 2] 3471         JP     STORE
                                   3472 
                                   3473 ;       ABORT   ( -- )
                                   3474 ;       Reset data stack and
                                   3475 ;       jump to QUIT.
      0093A3 93 80                 3476         .word      LINK
                           001325  3477 LINK = . 
      0093A5 05                    3478         .byte      5
      0093A6 41 42 4F 52 54        3479         .ascii     "ABORT"
      0093AB                       3480 ABORT:
      0093AB CD 94 A2         [ 4] 3481         CALL     PRESE
      0093AE CC 94 BF         [ 2] 3482         JP     QUIT
                                   3483 
                                   3484 ;       abort"  ( f -- )
                                   3485 ;       Run time routine of ABORT".
                                   3486 ;       Abort with a message.
      0093B1 93 A5                 3487         .word      LINK
                           001333  3488 LINK = . 
      0093B3 46                    3489 	.byte      COMPO+6
      0093B4 41 42 4F 52 54        3490         .ascii     "ABORT"
      0093B9 22                    3491         .byte      '"'
      0093BA                       3492 ABORQ:
      0093BA CD 85 24         [ 4] 3493         CALL     QBRAN
      0093BD 93 D9                 3494         .word      ABOR2   ;text flag
      0093BF CD 8F 54         [ 4] 3495         CALL     DOSTR
      0093C2 CD 8E F6         [ 4] 3496 ABOR1:  CALL     SPACE
      0093C5 CD 8C 86         [ 4] 3497         CALL     COUNT
      0093C8 CD 8F 20         [ 4] 3498         CALL     TYPES
      0093CB CD 84 F1         [ 4] 3499         CALL     DOLIT
      0093CE 00 3F                 3500         .word     63 ; "?"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      0093D0 CD 84 B6         [ 4] 3501         CALL     EMIT
      0093D3 CD 8F 3E         [ 4] 3502         CALL     CR
      0093D6 CC 93 AB         [ 2] 3503         JP     ABORT   ;pass error string
      0093D9 CD 8F 54         [ 4] 3504 ABOR2:  CALL     DOSTR
      0093DC CC 86 0C         [ 2] 3505         JP     DROP
                                   3506 
                                   3507 ;; The text interpreter
                                   3508 
                                   3509 ;       $INTERPRET      ( a -- )
                                   3510 ;       Interpret a word. If failed,
                                   3511 ;       try to convert it to an integer.
      0093DF 93 B3                 3512         .word      LINK
                           001361  3513 LINK = . 
      0093E1 0A                    3514         .byte      10
      0093E2 24 49 4E 54 45 52 50  3515         .ascii     "$INTERPRET"
             52 45 54
      0093EC                       3516 INTER:
      0093EC CD 92 AE         [ 4] 3517         CALL     NAMEQ
      0093EF CD 87 D3         [ 4] 3518         CALL     QDUP    ;?defined
      0093F2 CD 85 24         [ 4] 3519         CALL     QBRAN
      0093F5 94 16                 3520         .word      INTE1
      0093F7 CD 85 6F         [ 4] 3521         CALL     AT
      0093FA CD 84 F1         [ 4] 3522         CALL     DOLIT
      0093FD 40 00                 3523 	.word       0x4000	; COMPO*256
      0093FF CD 86 75         [ 4] 3524         CALL     ANDD    ;?compile only lexicon bits
      009402 CD 93 BA         [ 4] 3525         CALL     ABORQ
      009405 0D                    3526         .byte      13
      009406 20 63 6F 6D 70 69 6C  3527         .ascii     " compile only"
             65 20 6F 6E 6C 79
      009413 CC 85 4B         [ 2] 3528         JP     EXECU
      009416 CD A4 B6         [ 4] 3529 INTE1:  CALL     NUMBQ   ;convert a number
      009419 CD 85 24         [ 4] 3530         CALL     QBRAN
      00941C 93 C2                 3531         .word    ABOR1
      00941E 81               [ 4] 3532         RET
                                   3533 
                                   3534 ;       [       ( -- )
                                   3535 ;       Start  text interpreter.
      00941F 93 E1                 3536         .word      LINK
                           0013A1  3537 LINK = . 
      009421 81                    3538 	.byte      IMEDD+1
      009422 5B                    3539         .ascii     "["
      009423                       3540 LBRAC:
      009423 CD 84 F1         [ 4] 3541         CALL   DOLIT
      009426 93 EC                 3542         .word  INTER
      009428 CD 87 47         [ 4] 3543         CALL   TEVAL
      00942B CC 85 58         [ 2] 3544         JP     STORE
                                   3545 
                                   3546 ;       .OK     ( -- )
                                   3547 ;       Display 'ok' while interpreting.
      00942E 94 21                 3548         .word      LINK
                           0013B0  3549 LINK = . 
      009430 03                    3550         .byte      3
      009431 2E 4F 4B              3551         .ascii     ".OK"
      009434                       3552 DOTOK:
      009434 CD 84 F1         [ 4] 3553         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009437 93 EC                 3554         .word      INTER
      009439 CD 87 47         [ 4] 3555         CALL     TEVAL
      00943C CD 85 6F         [ 4] 3556         CALL     AT
      00943F CD 88 E6         [ 4] 3557         CALL     EQUAL
      009442 CD 85 24         [ 4] 3558         CALL     QBRAN
      009445 94 4E                 3559         .word      DOTO1
      009447 CD 8F 7D         [ 4] 3560         CALL     DOTQP
      00944A 03                    3561         .byte      3
      00944B 20 6F 6B              3562         .ascii     " ok"
      00944E CC 8F 3E         [ 2] 3563 DOTO1:  JP     CR
                                   3564 
                                   3565 ;       ?STACK  ( -- )
                                   3566 ;       Abort if stack underflows.
      009451 94 30                 3567         .word      LINK
                           0013D3  3568 LINK = . 
      009453 06                    3569         .byte      6
      009454 3F 53 54 41 43 4B     3570         .ascii     "?STACK"
      00945A                       3571 QSTAC: 
      00945A CD 8B F1         [ 4] 3572         CALL     DEPTH
      00945D CD 86 4F         [ 4] 3573         CALL     ZLESS   ;check only for underflow
      009460 CD 93 BA         [ 4] 3574         CALL     ABORQ
      009463 0B                    3575         .byte      11
      009464 20 75 6E 64 65 72 66  3576         .ascii     " underflow "
             6C 6F 77 20
      00946F 81               [ 4] 3577         RET
                                   3578 
                                   3579 ;       EVAL    ( -- )
                                   3580 ;       Interpret  input stream.
      009470 94 53                 3581         .word      LINK
                           0013F2  3582 LINK = . 
      009472 04                    3583         .byte      4
      009473 45 56 41 4C           3584         .ascii     "EVAL"
      009477                       3585 EVAL:
      009477 CD 91 B1         [ 4] 3586 EVAL1:  CALL     TOKEN
      00947A CD 86 16         [ 4] 3587         CALL     DUPP
      00947D CD 85 8D         [ 4] 3588         CALL     CAT     ;?input stream empty
      009480 CD 85 24         [ 4] 3589         CALL     QBRAN
      009483 94 93                 3590         .word    EVAL2
      009485 CD 87 47         [ 4] 3591         CALL     TEVAL
      009488 CD 8C D3         [ 4] 3592         CALL     ATEXE
      00948B CD 94 5A         [ 4] 3593         CALL     QSTAC   ;evaluate input, check stack
      00948E CD 85 3B         [ 4] 3594         CALL     BRAN
      009491 94 77                 3595         .word    EVAL1
      009493 CD 86 0C         [ 4] 3596 EVAL2:  CALL     DROP
      009496 CC 94 34         [ 2] 3597         JP       DOTOK
                                   3598 
                                   3599 ;       PRESET  ( -- )
                                   3600 ;       Reset data stack pointer and
                                   3601 ;       terminal input buffer.
      009499 94 72                 3602         .word      LINK
                           00141B  3603 LINK = . 
      00949B 06                    3604         .byte      6
      00949C 50 52 45 53 45 54     3605         .ascii     "PRESET"
      0094A2                       3606 PRESE:
      0094A2 CD 84 F1         [ 4] 3607         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0094A5 16 80                 3608         .word      SPP
      0094A7 CD 86 03         [ 4] 3609         CALL     SPSTO
      0094AA CD 84 F1         [ 4] 3610         CALL     DOLIT
      0094AD 17 00                 3611         .word      TIBB
      0094AF CD 87 14         [ 4] 3612         CALL     NTIB
      0094B2 CD 8B 18         [ 4] 3613         CALL     CELLP
      0094B5 CC 85 58         [ 2] 3614         JP     STORE
                                   3615 
                                   3616 ;       QUIT    ( -- )
                                   3617 ;       Reset return stack pointer
                                   3618 ;       and start text interpreter.
      0094B8 94 9B                 3619         .word      LINK
                           00143A  3620 LINK = . 
      0094BA 04                    3621         .byte      4
      0094BB 51 55 49 54           3622         .ascii     "QUIT"
      0094BF                       3623 QUIT:
      0094BF CD 84 F1         [ 4] 3624         CALL     DOLIT
      0094C2 17 FF                 3625         .word      RPP
      0094C4 CD 85 AA         [ 4] 3626         CALL     RPSTO   ;reset return stack pointer
      0094C7 CD 94 23         [ 4] 3627 QUIT1:  CALL     LBRAC   ;start interpretation
      0094CA CD 93 86         [ 4] 3628 QUIT2:  CALL     QUERY   ;get input
      0094CD CD 94 77         [ 4] 3629         CALL     EVAL
      0094D0 20 F8            [ 2] 3630         JRA     QUIT2   ;continue till error
                                   3631 
                                   3632 ;; The compiler
                                   3633 
                                   3634 ;       '       ( -- ca )
                                   3635 ;       Search vocabularies for
                                   3636 ;       next word in input stream.
      0094D2 94 BA                 3637         .word      LINK
                           001454  3638 LINK = . 
      0094D4 01                    3639         .byte      1
      0094D5 27                    3640         .ascii     "'"
      0094D6                       3641 TICK:
      0094D6 CD 91 B1         [ 4] 3642         CALL     TOKEN
      0094D9 CD 92 AE         [ 4] 3643         CALL     NAMEQ   ;?defined
      0094DC CD 85 24         [ 4] 3644         CALL     QBRAN
      0094DF 93 C2                 3645         .word      ABOR1
      0094E1 81               [ 4] 3646         RET     ;yes, push code address
                                   3647 
                                   3648 ;       ALLOT   ( n -- )
                                   3649 ;       Allocate n bytes to RAM 
      0094E2 94 D4                 3650         .word      LINK
                           001464  3651         LINK = . 
      0094E4 05                    3652         .byte      5
      0094E5 41 4C 4C 4F 54        3653         .ascii     "ALLOT"
      0094EA                       3654 ALLOT:
      0094EA CD 87 77         [ 4] 3655         CALL     VPP
                                   3656 ; must update APP_VP each time VP is modidied
      0094ED CD 8C 1F         [ 4] 3657         call PSTOR 
      0094F0 CC 9C 33         [ 2] 3658         jp UPDATVP 
                                   3659 
                                   3660 ;       ,       ( w -- )
                                   3661 ;         Compile an integer into
                                   3662 ;         variable space.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0094F3 94 E4                 3663         .word      LINK
                           001475  3664 LINK = . 
      0094F5 01                    3665         .byte      1
      0094F6 2C                    3666         .ascii     ","
      0094F7                       3667 COMMA:
      0094F7 CD 8C 9D         [ 4] 3668         CALL     HERE
      0094FA CD 86 16         [ 4] 3669         CALL     DUPP
      0094FD CD 8B 18         [ 4] 3670         CALL     CELLP   ;cell boundary
      009500 CD 87 77         [ 4] 3671         CALL     VPP
      009503 CD 85 58         [ 4] 3672         CALL     STORE
      009506 CC 85 58         [ 2] 3673         JP     STORE
                                   3674 
                                   3675 ;       C,      ( c -- )
                                   3676 ;       Compile a byte into
                                   3677 ;       variables space.
      009509 94 F5                 3678        .word      LINK
                           00148B  3679 LINK = . 
      00950B 02                    3680         .byte      2
      00950C 43 2C                 3681         .ascii     "C,"
      00950E                       3682 CCOMMA:
      00950E CD 8C 9D         [ 4] 3683         CALL     HERE
      009511 CD 86 16         [ 4] 3684         CALL     DUPP
      009514 CD 8B 43         [ 4] 3685         CALL     ONEP
      009517 CD 87 77         [ 4] 3686         CALL     VPP
      00951A CD 85 58         [ 4] 3687         CALL     STORE
      00951D CC 85 7C         [ 2] 3688         JP     CSTOR
                                   3689 
                                   3690 ;       [COMPILE]       ( -- ; <string> )
                                   3691 ;       Compile next immediate
                                   3692 ;       word into code dictionary.
      009520 95 0B                 3693         .word      LINK
                           0014A2  3694 LINK = . 
      009522 89                    3695 	.byte      IMEDD+9
      009523 5B 43 4F 4D 50 49 4C  3696         .ascii     "[COMPILE]"
             45 5D
      00952C                       3697 BCOMP:
      00952C CD 94 D6         [ 4] 3698         CALL     TICK
      00952F CC 98 02         [ 2] 3699         JP     JSRC
                                   3700 
                                   3701 ;       COMPILE ( -- )
                                   3702 ;       Compile next jsr in
                                   3703 ;       colon list to code dictionary.
      009532 95 22                 3704         .word      LINK
                           0014B4  3705 LINK = . 
      009534 47                    3706 	.byte      COMPO+7
      009535 43 4F 4D 50 49 4C 45  3707         .ascii     "COMPILE"
      00953C                       3708 COMPI:
      00953C CD 85 C0         [ 4] 3709         CALL     RFROM
      00953F CD 86 16         [ 4] 3710         CALL     DUPP
      009542 CD 85 6F         [ 4] 3711         CALL     AT
      009545 CD 98 02         [ 4] 3712         CALL     JSRC    ;compile subroutine
      009548 CD 8B 18         [ 4] 3713         CALL     CELLP
      00954B 90 93            [ 1] 3714         ldw y,x 
      00954D 90 FE            [ 2] 3715         ldw y,(y)
      00954F 1C 00 02         [ 2] 3716         addw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      009552 90 FC            [ 2] 3717         jp (y)
                                   3718 
                                   3719 ;       LITERAL ( w -- )
                                   3720 ;       Compile tos to dictionary
                                   3721 ;       as an integer literal.
      009554 95 34                 3722         .word      LINK
                           0014D6  3723 LINK = . 
      009556 87                    3724 	.byte      IMEDD+7
      009557 4C 49 54 45 52 41 4C  3725         .ascii     "LITERAL"
      00955E                       3726 LITER:
      00955E CD 95 3C         [ 4] 3727         CALL     COMPI
      009561 84 F1                 3728         .word DOLIT 
      009563 CC 94 F7         [ 2] 3729         JP     COMMA
                                   3730 
                                   3731 ;       $,"     ( -- )
                                   3732 ;       Compile a literal string
                                   3733 ;       up to next " .
      009566 95 56                 3734         .word      LINK
                           0014E8  3735 LINK = . 
      009568 03                    3736         .byte      3
      009569 24 2C 22              3737         .byte     '$',',','"'
      00956C                       3738 STRCQ:
      00956C CD 84 F1         [ 4] 3739         CALL     DOLIT
      00956F 00 22                 3740         .word     34	; "
      009571 CD 90 F1         [ 4] 3741         CALL     PARSE
      009574 CD 8C 9D         [ 4] 3742         CALL     HERE
      009577 CD 8D 5D         [ 4] 3743         CALL     PACKS   ;string to code dictionary
      00957A CD 8C 86         [ 4] 3744         CALL     COUNT
      00957D CD 88 45         [ 4] 3745         CALL     PLUS    ;calculate aligned end of string
      009580 CD 87 77         [ 4] 3746         CALL     VPP
      009583 CC 85 58         [ 2] 3747         JP     STORE
                                   3748 
                                   3749 ;; Structures
                                   3750 
                                   3751 ;       FOR     ( -- a )
                                   3752 ;       Start a FOR-NEXT loop
                                   3753 ;       structure in a colon definition.
      009586 95 68                 3754         .word      LINK
                           001508  3755 LINK = . 
      009588 83                    3756 	.byte      IMEDD+3
      009589 46 4F 52              3757         .ascii     "FOR"
      00958C                       3758 FOR:
      00958C CD 95 3C         [ 4] 3759         CALL     COMPI
      00958F 85 DF                 3760         .word TOR 
      009591 CC 8C 9D         [ 2] 3761         JP     HERE
                                   3762 
                                   3763 ;       NEXT    ( a -- )
                                   3764 ;       Terminate a FOR-NEXT loop.
      009594 95 88                 3765         .word      LINK
                           001516  3766 LINK = . 
      009596 84                    3767 	.byte      IMEDD+4
      009597 4E 45 58 54           3768         .ascii     "NEXT"
      00959B                       3769 NEXT:
      00959B CD 95 3C         [ 4] 3770         CALL     COMPI
      00959E 85 05                 3771         .word DONXT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0095A0 CD 87 C3         [ 4] 3772         call ADRADJ
      0095A3 CC 94 F7         [ 2] 3773         JP     COMMA
                                   3774 
                                   3775 ;       I ( -- n )
                                   3776 ;       stack FOR-NEXT COUNTER 
      0095A6 95 96                 3777         .word LINK 
                           001528  3778         LINK=.
      0095A8 01                    3779         .byte 1 
      0095A9 49                    3780         .ascii "I"
      0095AA                       3781 IFETCH: 
      0095AA 1D 00 02         [ 2] 3782         subw x,#CELLL 
      0095AD 16 03            [ 2] 3783         ldw y,(3,sp)
      0095AF FF               [ 2] 3784         ldw (x),y 
      0095B0 81               [ 4] 3785         ret 
                                   3786 
                                   3787 ;       BEGIN   ( -- a )
                                   3788 ;       Start an infinite or
                                   3789 ;       indefinite loop structure.
      0095B1 95 A8                 3790         .word      LINK
                           001533  3791 LINK = . 
      0095B3 85                    3792 	.byte      IMEDD+5
      0095B4 42 45 47 49 4E        3793         .ascii     "BEGIN"
      0095B9                       3794 BEGIN:
      0095B9 CC 8C 9D         [ 2] 3795         JP     HERE
                                   3796 
                                   3797 ;       UNTIL   ( a -- )
                                   3798 ;       Terminate a BEGIN-UNTIL
                                   3799 ;       indefinite loop structure.
      0095BC 95 B3                 3800         .word      LINK
                           00153E  3801 LINK = . 
      0095BE 85                    3802 	.byte      IMEDD+5
      0095BF 55 4E 54 49 4C        3803         .ascii     "UNTIL"
      0095C4                       3804 UNTIL:
      0095C4 CD 95 3C         [ 4] 3805         CALL     COMPI
      0095C7 85 24                 3806         .word    QBRAN 
      0095C9 CD 87 C3         [ 4] 3807         call ADRADJ
      0095CC CC 94 F7         [ 2] 3808         JP     COMMA
                                   3809 
                                   3810 ;       AGAIN   ( a -- )
                                   3811 ;       Terminate a BEGIN-AGAIN
                                   3812 ;       infinite loop structure.
      0095CF 95 BE                 3813         .word      LINK
                           001551  3814 LINK = . 
      0095D1 85                    3815 	.byte      IMEDD+5
      0095D2 41 47 41 49 4E        3816         .ascii     "AGAIN"
      0095D7                       3817 AGAIN:
      0095D7 CD 95 3C         [ 4] 3818         CALL     COMPI
      0095DA 85 3B                 3819         .word BRAN
      0095DC CD 87 C3         [ 4] 3820         call ADRADJ 
      0095DF CC 94 F7         [ 2] 3821         JP     COMMA
                                   3822 
                                   3823 ;       IF      ( -- A )
                                   3824 ;       Begin a conditional branch.
      0095E2 95 D1                 3825         .word      LINK
                           001564  3826 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0095E4 82                    3827 	.byte      IMEDD+2
      0095E5 49 46                 3828         .ascii     "IF"
      0095E7                       3829 IFF:
      0095E7 CD 95 3C         [ 4] 3830         CALL     COMPI
      0095EA 85 24                 3831         .word QBRAN
      0095EC CD 8C 9D         [ 4] 3832         CALL     HERE
      0095EF CD 8B AF         [ 4] 3833         CALL     ZERO
      0095F2 CC 94 F7         [ 2] 3834         JP     COMMA
                                   3835 
                                   3836 ;       THEN        ( A -- )
                                   3837 ;       Terminate a conditional branch structure.
      0095F5 95 E4                 3838         .word      LINK
                           001577  3839 LINK = . 
      0095F7 84                    3840 	.byte      IMEDD+4
      0095F8 54 48 45 4E           3841         .ascii     "THEN"
      0095FC                       3842 THENN:
      0095FC CD 8C 9D         [ 4] 3843         CALL     HERE
      0095FF CD 87 C3         [ 4] 3844         call ADRADJ 
      009602 CD 86 26         [ 4] 3845         CALL     SWAPP
      009605 CC 85 58         [ 2] 3846         JP     STORE
                                   3847 
                                   3848 ;       ELSE        ( A -- A )
                                   3849 ;       Start the false clause in an IF-ELSE-THEN structure.
      009608 95 F7                 3850         .word      LINK
                           00158A  3851 LINK = . 
      00960A 84                    3852 	.byte      IMEDD+4
      00960B 45 4C 53 45           3853         .ascii     "ELSE"
      00960F                       3854 ELSEE:
      00960F CD 95 3C         [ 4] 3855         CALL     COMPI
      009612 85 3B                 3856         .word BRAN
      009614 CD 8C 9D         [ 4] 3857         CALL     HERE
      009617 CD 8B AF         [ 4] 3858         CALL     ZERO
      00961A CD 94 F7         [ 4] 3859         CALL     COMMA
      00961D CD 86 26         [ 4] 3860         CALL     SWAPP
      009620 CD 8C 9D         [ 4] 3861         CALL     HERE
      009623 CD 87 C3         [ 4] 3862         call ADRADJ 
      009626 CD 86 26         [ 4] 3863         CALL     SWAPP
      009629 CC 85 58         [ 2] 3864         JP     STORE
                                   3865 
                                   3866 ;       AHEAD       ( -- A )
                                   3867 ;       Compile a forward branch instruction.
      00962C 96 0A                 3868         .word      LINK
                           0015AE  3869 LINK = . 
      00962E 85                    3870 	.byte      IMEDD+5
      00962F 41 48 45 41 44        3871         .ascii     "AHEAD"
      009634                       3872 AHEAD:
      009634 CD 95 3C         [ 4] 3873         CALL     COMPI
      009637 85 3B                 3874         .word BRAN
      009639 CD 8C 9D         [ 4] 3875         CALL     HERE
      00963C CD 8B AF         [ 4] 3876         CALL     ZERO
      00963F CC 94 F7         [ 2] 3877         JP     COMMA
                                   3878 
                                   3879 ;       WHILE       ( a -- A a )
                                   3880 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      009642 96 2E                 3881         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                           0015C4  3882 LINK = . 
      009644 85                    3883 	.byte      IMEDD+5
      009645 57 48 49 4C 45        3884         .ascii     "WHILE"
      00964A                       3885 WHILE:
      00964A CD 95 3C         [ 4] 3886         CALL     COMPI
      00964D 85 24                 3887         .word QBRAN
      00964F CD 8C 9D         [ 4] 3888         CALL     HERE
      009652 CD 8B AF         [ 4] 3889         CALL     ZERO
      009655 CD 94 F7         [ 4] 3890         CALL     COMMA
      009658 CC 86 26         [ 2] 3891         JP     SWAPP
                                   3892 
                                   3893 ;       REPEAT      ( A a -- )
                                   3894 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      00965B 96 44                 3895         .word      LINK
                           0015DD  3896 LINK = . 
      00965D 86                    3897         .byte      IMEDD+6
      00965E 52 45 50 45 41 54     3898         .ascii     "REPEAT"
      009664                       3899 REPEA:
      009664 CD 95 3C         [ 4] 3900         CALL     COMPI
      009667 85 3B                 3901         .word BRAN
      009669 CD 87 C3         [ 4] 3902         call ADRADJ 
      00966C CD 94 F7         [ 4] 3903         CALL     COMMA
      00966F CD 8C 9D         [ 4] 3904         CALL     HERE
      009672 CD 87 C3         [ 4] 3905         call ADRADJ 
      009675 CD 86 26         [ 4] 3906         CALL     SWAPP
      009678 CC 85 58         [ 2] 3907         JP     STORE
                                   3908 
                                   3909 ;       AFT         ( a -- a A )
                                   3910 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      00967B 96 5D                 3911         .word      LINK
                           0015FD  3912 LINK = . 
      00967D 83                    3913 	.byte      IMEDD+3
      00967E 41 46 54              3914         .ascii     "AFT"
      009681                       3915 AFT:
      009681 CD 86 0C         [ 4] 3916         CALL     DROP
      009684 CD 96 34         [ 4] 3917         CALL     AHEAD
      009687 CD 8C 9D         [ 4] 3918         CALL     HERE
      00968A CC 86 26         [ 2] 3919         JP     SWAPP
                                   3920 
                                   3921 ;       ABORT"      ( -- ; <string> )
                                   3922 ;       Conditional abort with an error message.
      00968D 96 7D                 3923         .word      LINK
                           00160F  3924 LINK = . 
      00968F 86                    3925 	.byte      IMEDD+6
      009690 41 42 4F 52 54        3926         .ascii     "ABORT"
      009695 22                    3927         .byte      '"'
      009696                       3928 ABRTQ:
      009696 CD 95 3C         [ 4] 3929         CALL     COMPI
      009699 93 BA                 3930         .word ABORQ
      00969B CC 95 6C         [ 2] 3931         JP     STRCQ
                                   3932 
                                   3933 ;       $"     ( -- ; <string> )
                                   3934 ;       Compile an inline string literal.
      00969E 96 8F                 3935         .word      LINK
                           001620  3936 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0096A0 82                    3937 	.byte      IMEDD+2
      0096A1 24 22                 3938         .byte     '$','"'
      0096A3                       3939 STRQ:
      0096A3 CD 95 3C         [ 4] 3940         CALL     COMPI
      0096A6 8F 73                 3941         .word STRQP 
      0096A8 CC 95 6C         [ 2] 3942         JP     STRCQ
                                   3943 
                                   3944 ;       ."          ( -- ; <string> )
                                   3945 ;       Compile an inline string literal to be typed out at run time.
      0096AB 96 A0                 3946         .word      LINK
                           00162D  3947 LINK = . 
      0096AD 82                    3948 	.byte      IMEDD+2
      0096AE 2E 22                 3949         .byte     '.','"'
      0096B0                       3950 DOTQ:
      0096B0 CD 95 3C         [ 4] 3951         CALL     COMPI
      0096B3 8F 7D                 3952         .word DOTQP 
      0096B5 CC 95 6C         [ 2] 3953         JP     STRCQ
                                   3954 
                                   3955 ;; Name compiler
                                   3956 
                                   3957 ;       ?UNIQUE ( a -- a )
                                   3958 ;       Display a warning message
                                   3959 ;       if word already exists.
      0096B8 96 AD                 3960         .word      LINK
                           00163A  3961 LINK = . 
      0096BA 07                    3962         .byte      7
      0096BB 3F 55 4E 49 51 55 45  3963         .ascii     "?UNIQUE"
      0096C2                       3964 UNIQU:
      0096C2 CD 86 16         [ 4] 3965         CALL     DUPP
      0096C5 CD 92 AE         [ 4] 3966         CALL     NAMEQ   ;?name exists
      0096C8 CD 85 24         [ 4] 3967         CALL     QBRAN
      0096CB 96 E1                 3968         .word      UNIQ1
      0096CD CD 8F 7D         [ 4] 3969         CALL     DOTQP   ;redef are OK
      0096D0 07                    3970         .byte       7
      0096D1 20 72 65 44 65 66 20  3971         .ascii     " reDef "       
      0096D8 CD 86 40         [ 4] 3972         CALL     OVER
      0096DB CD 8C 86         [ 4] 3973         CALL     COUNT
      0096DE CD 8F 20         [ 4] 3974         CALL     TYPES   ;just in case
      0096E1 CC 86 0C         [ 2] 3975 UNIQ1:  JP     DROP
                                   3976 
                                   3977 ;       $,n     ( na -- )
                                   3978 ;       Build a new dictionary name
                                   3979 ;       using string at na.
                                   3980 ; compile dans l'espace des variables 
      0096E4 96 BA                 3981         .word      LINK
                           001666  3982 LINK = . 
      0096E6 03                    3983         .byte      3
      0096E7 24 2C 6E              3984         .ascii     "$,n"
      0096EA                       3985 SNAME:
      0096EA CD 86 16         [ 4] 3986         CALL     DUPP
      0096ED CD 85 8D         [ 4] 3987         CALL     CAT     ;?null input
      0096F0 CD 85 24         [ 4] 3988         CALL     QBRAN
      0096F3 97 20                 3989         .word      PNAM1
      0096F5 CD 96 C2         [ 4] 3990         CALL     UNIQU   ;?redefinition
      0096F8 CD 86 16         [ 4] 3991         CALL     DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0096FB CD 8C 86         [ 4] 3992         CALL     COUNT
      0096FE CD 88 45         [ 4] 3993         CALL     PLUS
      009701 CD 87 77         [ 4] 3994         CALL     VPP
      009704 CD 85 58         [ 4] 3995         CALL     STORE
      009707 CD 86 16         [ 4] 3996         CALL     DUPP
      00970A CD 87 95         [ 4] 3997         CALL     LAST
      00970D CD 85 58         [ 4] 3998         CALL     STORE   ;save na for vocabulary link
      009710 CD 8B 27         [ 4] 3999         CALL     CELLM   ;link address
      009713 CD 87 69         [ 4] 4000         CALL     CNTXT
      009716 CD 85 6F         [ 4] 4001         CALL     AT
      009719 CD 86 26         [ 4] 4002         CALL     SWAPP
      00971C CD 85 58         [ 4] 4003         CALL     STORE
      00971F 81               [ 4] 4004         RET     ;save code pointer
      009720 CD 8F 73         [ 4] 4005 PNAM1:  CALL     STRQP
      009723 05                    4006         .byte      5
      009724 20 6E 61 6D 65        4007         .ascii     " name" ;null input
      009729 CC 93 C2         [ 2] 4008         JP     ABOR1
                                   4009 
                                   4010 ;; FORTH compiler
                                   4011 
                                   4012 ;       $COMPILE        ( a -- )
                                   4013 ;       Compile next word to
                                   4014 ;       dictionary as a token or literal.
      00972C 96 E6                 4015         .word      LINK
                           0016AE  4016 LINK = . 
      00972E 08                    4017         .byte      8
      00972F 24 43 4F 4D 50 49 4C  4018         .ascii     "$COMPILE"
             45
      009737                       4019 SCOMP:
      009737 CD 92 AE         [ 4] 4020         CALL     NAMEQ
      00973A CD 87 D3         [ 4] 4021         CALL     QDUP    ;?defined
      00973D CD 85 24         [ 4] 4022         CALL     QBRAN
      009740 97 58                 4023         .word      SCOM2
      009742 CD 85 6F         [ 4] 4024         CALL     AT
      009745 CD 84 F1         [ 4] 4025         CALL     DOLIT
      009748 80 00                 4026         .word     0x8000	;  IMEDD*256
      00974A CD 86 75         [ 4] 4027         CALL     ANDD    ;?immediate
      00974D CD 85 24         [ 4] 4028         CALL     QBRAN
      009750 97 55                 4029         .word      SCOM1
      009752 CC 85 4B         [ 2] 4030         JP     EXECU
      009755 CC 98 02         [ 2] 4031 SCOM1:  JP     JSRC
      009758 CD A4 B6         [ 4] 4032 SCOM2:  CALL     NUMBQ   ;try to convert to number
      00975B CD 87 D3         [ 4] 4033         CALL    QDUP  
      00975E CD 85 24         [ 4] 4034         CALL     QBRAN
      009761 93 C2                 4035         .word      ABOR1
      0016E3                       4036         _DOLIT  -1
      009763 CD 84 F1         [ 4]    1     CALL DOLIT 
      009766 FF FF                    2     .word -1 
      009768 CD 88 E6         [ 4] 4037         CALL    EQUAL
      0016EB                       4038         _QBRAN DLITER  
      00976B CD 85 24         [ 4]    1     CALL QBRAN
      00976E A9 06                    2     .word DLITER
      009770 CC 95 5E         [ 2] 4039         JP     LITER
                                   4040 
                                   4041 ;       OVERT   ( -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                   4042 ;       Link a new word into vocabulary.
      009773 97 2E                 4043         .word      LINK
                           0016F5  4044 LINK = . 
      009775 05                    4045         .byte      5
      009776 4F 56 45 52 54        4046         .ascii     "OVERT"
      00977B                       4047 OVERT:
      00977B CD 87 95         [ 4] 4048         CALL     LAST
      00977E CD 85 6F         [ 4] 4049         CALL     AT
      009781 CD 87 69         [ 4] 4050         CALL     CNTXT
      009784 CC 85 58         [ 2] 4051         JP     STORE
                                   4052 
                                   4053 ;       ;       ( -- )
                                   4054 ;       Terminate a colon definition.
      009787 97 75                 4055         .word      LINK
                           001709  4056 LINK = . 
      009789 C1                    4057 	.byte      IMEDD+COMPO+1
      00978A 3B                    4058         .ascii     ";"
      00978B                       4059 SEMIS:
                           000001  4060 .if OPTIMIZE ; more compact and faster
      00978B CD 84 F1         [ 4] 4061         call DOLIT 
      00978E 00 81                 4062         .word 0x81   ; opcode for RET 
      009790 CD 95 0E         [ 4] 4063         call CCOMMA 
                           000000  4064 .else
                                   4065         CALL     COMPI
                                   4066         .word EXIT 
                                   4067 .endif 
      009793 CD 94 23         [ 4] 4068         CALL     LBRAC
      009796 CD 97 7B         [ 4] 4069         call OVERT 
      009799 CD A1 8B         [ 4] 4070         CALL FMOVE
      00979C CD 87 D3         [ 4] 4071         call QDUP 
      00979F CD 85 24         [ 4] 4072         call QBRAN 
      0097A2 98 D2                 4073         .word SET_RAMLAST 
      0097A4 CD A2 1F         [ 4] 4074         CALL UPDATPTR
      0097A7 81               [ 4] 4075         RET 
                                   4076 
                                   4077 
                                   4078 ;       Terminate an ISR definition 
                                   4079 ;       retourn ca of ISR as double
                                   4080 ;       I; ( -- ud )
      0097A8 97 89                 4081         .word LINK 
                           00172A  4082         LINK=.
      0097AA C2                    4083         .byte 2+IMEDD+COMPO 
      0097AB 49 3B                 4084         .ascii "I;" 
      0097AD                       4085 ISEMI:
      0097AD 1D 00 02         [ 2] 4086         subw x,#CELLL  
      0097B0 90 AE 00 80      [ 2] 4087         ldw y,#IRET_CODE 
      0097B4 FF               [ 2] 4088         ldw (x),y 
      0097B5 CD 95 0E         [ 4] 4089         call CCOMMA
      0097B8 CD 94 23         [ 4] 4090         call LBRAC 
      0097BB CD A2 64         [ 4] 4091         call IFMOVE
      0097BE CD 87 D3         [ 4] 4092         call QDUP 
      0097C1 CD 85 24         [ 4] 4093         CALL QBRAN 
      0097C4 98 D2                 4094         .word SET_RAMLAST
      0097C6 CD 87 85         [ 4] 4095         CALL CPP
      0097C9 CD 85 6F         [ 4] 4096         call AT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      0097CC CD 86 26         [ 4] 4097         call SWAPP 
      0097CF CD 87 85         [ 4] 4098         CALL CPP 
      0097D2 CD 85 58         [ 4] 4099         call STORE 
      0097D5 CD 9C 1C         [ 4] 4100         call UPDATCP 
      0097D8 CD 9B D9         [ 4] 4101         call EEPVP 
      0097DB CD 86 0C         [ 4] 4102         call DROP 
      0097DE CD 85 6F         [ 4] 4103         call AT 
      0097E1 CD 87 77         [ 4] 4104         call VPP 
      0097E4 CD 85 58         [ 4] 4105         call STORE 
      0097E7 CC 8B AF         [ 2] 4106         jp ZERO
      0097EA 81               [ 4] 4107         ret           
                                   4108         
                                   4109 
                                   4110 ;       ]       ( -- )
                                   4111 ;       Start compiling words in
                                   4112 ;       input stream.
      0097EB 97 AA                 4113         .word      LINK
                           00176D  4114 LINK = . 
      0097ED 01                    4115         .byte      1
      0097EE 5D                    4116         .ascii     "]"
      0097EF                       4117 RBRAC:
      0097EF CD 84 F1         [ 4] 4118         CALL   DOLIT
      0097F2 97 37                 4119         .word  SCOMP
      0097F4 CD 87 47         [ 4] 4120         CALL   TEVAL
      0097F7 CC 85 58         [ 2] 4121         JP     STORE
                                   4122 
                                   4123 ;       CALL,    ( ca -- )
                                   4124 ;       Compile a subroutine call.
      0097FA 97 ED                 4125         .word      LINK
                           00177C  4126 LINK = . 
      0097FC 05                    4127         .byte      5
      0097FD 43 41 4C 4C 2C        4128         .ascii     "CALL,"
      009802                       4129 JSRC:
      009802 CD 84 F1         [ 4] 4130         CALL     DOLIT
      009805 00 CD                 4131         .word     CALLL     ;CALL
      009807 CD 95 0E         [ 4] 4132         CALL     CCOMMA
      00980A CC 94 F7         [ 2] 4133         JP     COMMA
                                   4134 
                                   4135 ;       INIT-OFS ( -- )
                                   4136 ;       compute offset to adjust jump address 
                                   4137 ;       set variable OFFSET 
      00980D 97 FC                 4138         .word LINK 
                           00178F  4139         LINK=.
      00980F 08                    4140         .byte 8 
      009810 49 4E 49 54 2D 4F 46  4141         .ascii "INIT-OFS" 
             53
      009818                       4142 INITOFS:
      009818 CD 87 36         [ 4] 4143         call TFLASH 
      00981B CD 85 6F         [ 4] 4144         CALL AT 
      00981E CD 86 16         [ 4] 4145         CALL DUPP 
      009821 CD 85 24         [ 4] 4146         call QBRAN
      009824 98 35                 4147         .word 1$
      009826 CD 86 0C         [ 4] 4148         call DROP  
      009829 CD 87 85         [ 4] 4149         call CPP 
      00982C CD 85 6F         [ 4] 4150         call AT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      00982F CD 8C 9D         [ 4] 4151         call HERE
      009832 CD 88 BE         [ 4] 4152         call SUBB 
      009835 CD 87 BA         [ 4] 4153 1$:     call OFFSET 
      009838 CC 85 58         [ 2] 4154         jp STORE  
                                   4155 
                                   4156 ;       :       ( -- ; <string> )
                                   4157 ;       Start a new colon definition
                                   4158 ;       using next word as its name.
      00983B 98 0F                 4159         .word      LINK
                           0017BD  4160 LINK = . 
      00983D 01                    4161         .byte      1
      00983E 3A                    4162         .ascii     ":"
      00983F                       4163 COLON:
      00983F CD 98 18         [ 4] 4164         call INITOFS       
      009842 CD 91 B1         [ 4] 4165         CALL   TOKEN
      009845 CD 96 EA         [ 4] 4166         CALL   SNAME
      009848 CC 97 EF         [ 2] 4167         JP     RBRAC
                                   4168 
                                   4169 ;       I:  ( -- )
                                   4170 ;       Start interrupt service routine definition
                                   4171 ;       those definition have no name.
      00984B 98 3D                 4172         .word LINK
                           0017CD  4173         LINK=.
      00984D 02                    4174         .byte 2 
      00984E 49 3A                 4175         .ascii "I:" 
      009850                       4176 ICOLON:
      009850 CD 98 18         [ 4] 4177         call INITOFS 
      009853 CC 97 EF         [ 2] 4178         jp RBRAC  
                                   4179 
                                   4180 ;       IMMEDIATE       ( -- )
                                   4181 ;       Make last compiled word
                                   4182 ;       an immediate word.
      009856 98 4D                 4183         .word      LINK
                           0017D8  4184 LINK = . 
      009858 09                    4185         .byte      9
      009859 49 4D 4D 45 44 49 41  4186         .ascii     "IMMEDIATE"
             54 45
      009862                       4187 IMMED:
      009862 CD 84 F1         [ 4] 4188         CALL     DOLIT
      009865 80 00                 4189         .word     0x8000	;  IMEDD*256
      009867 CD 87 95         [ 4] 4190         CALL     LAST
      00986A CD 85 6F         [ 4] 4191         CALL     AT
      00986D CD 85 6F         [ 4] 4192         CALL     AT
      009870 CD 86 89         [ 4] 4193         CALL     ORR
      009873 CD 87 95         [ 4] 4194         CALL     LAST
      009876 CD 85 6F         [ 4] 4195         CALL     AT
      009879 CC 85 58         [ 2] 4196         JP     STORE
                                   4197 
                                   4198 ;; Defining words
                                   4199 
                                   4200 ;       CREATE  ( -- ; <string> )
                                   4201 ;       Compile a new array
                                   4202 ;       without allocating space.
      00987C 98 58                 4203         .word      LINK
                           0017FE  4204 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      00987E 06                    4205         .byte      6
      00987F 43 52 45 41 54 45     4206         .ascii     "CREATE"
      009885                       4207 CREAT:
      009885 CD 91 B1         [ 4] 4208         CALL     TOKEN
      009888 CD 96 EA         [ 4] 4209         CALL     SNAME
      00988B CD 97 7B         [ 4] 4210         CALL     OVERT        
      00988E CD 95 3C         [ 4] 4211         CALL     COMPI 
      009891 86 D6                 4212         .word DOVAR 
      009893 81               [ 4] 4213         RET
                                   4214 
                                   4215 ;       VARIABLE        ( -- ; <string> )
                                   4216 ;       Compile a new variable
                                   4217 ;       initialized to 0.
      009894 98 7E                 4218         .word      LINK
                           001816  4219 LINK = . 
      009896 08                    4220         .byte      8
      009897 56 41 52 49 41 42 4C  4221         .ascii     "VARIABLE"
             45
      00989F                       4222 VARIA:
                                   4223 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      00989F CD 8C 9D         [ 4] 4224         CALL HERE
      0098A2 CD 86 16         [ 4] 4225         CALL DUPP 
      0098A5 CD 8B 18         [ 4] 4226         CALL CELLP
      0098A8 CD 87 77         [ 4] 4227         CALL VPP 
      0098AB CD 85 58         [ 4] 4228         CALL STORE
      0098AE CD 98 85         [ 4] 4229         CALL CREAT
      0098B1 CD 86 16         [ 4] 4230         CALL DUPP
      0098B4 CD 94 F7         [ 4] 4231         CALL COMMA
      0098B7 CD 8B AF         [ 4] 4232         CALL ZERO
      0098BA CD 86 26         [ 4] 4233         call SWAPP 
      0098BD CD 85 58         [ 4] 4234         CALL STORE
      0098C0 CD A1 8B         [ 4] 4235         CALL FMOVE ; move definition to FLASH
      0098C3 CD 87 D3         [ 4] 4236         CALL QDUP 
      0098C6 CD 85 24         [ 4] 4237         CALL QBRAN 
      0098C9 98 D2                 4238         .word SET_RAMLAST   
      0098CB CD 9C 33         [ 4] 4239         call UPDATVP  ; don't update if variable kept in RAM.
      0098CE CD A2 1F         [ 4] 4240         CALL UPDATPTR
      0098D1 81               [ 4] 4241         RET         
      0098D2                       4242 SET_RAMLAST: 
      0098D2 CD 87 95         [ 4] 4243         CALL LAST 
      0098D5 CD 85 6F         [ 4] 4244         CALL AT 
      0098D8 CD 87 A8         [ 4] 4245         CALL RAMLAST 
      0098DB CC 85 58         [ 2] 4246         jp STORE  
                                   4247 
                                   4248 
                                   4249 ;       CONSTANT  ( n -- ; <string> )
                                   4250 ;       Compile a new constant 
                                   4251 ;       n CONSTANT name 
      0098DE 98 96                 4252         .word LINK 
                           001860  4253         LINK=. 
      0098E0 08                    4254         .byte 8 
      0098E1 43 4F 4E 53 54 41 4E  4255         .ascii "CONSTANT" 
             54
      0098E9                       4256 CONSTANT:          
      0098E9 CD 91 B1         [ 4] 4257         CALL TOKEN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0098EC CD 96 EA         [ 4] 4258         CALL SNAME 
      0098EF CD 97 7B         [ 4] 4259         CALL OVERT 
      0098F2 CD 95 3C         [ 4] 4260         CALL COMPI 
      0098F5 99 09                 4261         .word DOCONST
      0098F7 CD 94 F7         [ 4] 4262         CALL COMMA 
      0098FA CD A1 8B         [ 4] 4263         CALL FMOVE
      0098FD CD 87 D3         [ 4] 4264         CALL QDUP 
      009900 CD 85 24         [ 4] 4265         CALL QBRAN 
      009903 98 D2                 4266         .word SET_RAMLAST  
      009905 CD A2 1F         [ 4] 4267         CALL UPDATPTR  
      009908 81               [ 4] 4268 1$:     RET          
                                   4269 
                                   4270 ; CONSTANT runtime semantic 
                                   4271 ; doCONST  ( -- n )
                                   4272 ;        .word LINK 
                                   4273 ;        LINK=.
                                   4274 ;        .byte 7
                                   4275 ;        .ascii "DOCONST"
      009909                       4276 DOCONST:
      009909 1D 00 02         [ 2] 4277         subw x,#CELLL
      00990C 90 85            [ 2] 4278         popw y 
      00990E 90 FE            [ 2] 4279         ldw y,(y) 
      009910 FF               [ 2] 4280         ldw (x),y 
      009911 81               [ 4] 4281         ret 
                                   4282 
                                   4283 ;----------------------------------
                                   4284 ; create double constant 
                                   4285 ; 2CONSTANT ( d -- ; <string> )
                                   4286 ;----------------------------------
      009912 98 E0                 4287     .word LINK 
                           001894  4288     LINK=.
      009914 09                    4289     .byte 9 
      009915 32 43 4F 4E 53 54 41  4290     .ascii "2CONSTANT"
             4E 54
      00991E                       4291 DCONST:
      00991E CD 91 B1         [ 4] 4292         CALL TOKEN
      009921 CD 96 EA         [ 4] 4293         CALL SNAME 
      009924 CD 97 7B         [ 4] 4294         CALL OVERT 
      009927 CD 95 3C         [ 4] 4295         CALL COMPI 
      00992A 99 41                 4296         .word DO_DCONST
      00992C CD 94 F7         [ 4] 4297         CALL COMMA
      00992F CD 94 F7         [ 4] 4298         CALL COMMA  
      009932 CD A1 8B         [ 4] 4299         CALL FMOVE
      009935 CD 87 D3         [ 4] 4300         CALL QDUP 
      009938 CD 85 24         [ 4] 4301         CALL QBRAN 
      00993B 98 D2                 4302         .word SET_RAMLAST  
      00993D CD A2 1F         [ 4] 4303         CALL UPDATPTR  
      009940 81               [ 4] 4304 1$:     RET          
                                   4305     
                                   4306 ;----------------------------------
                                   4307 ; runtime for DCONST 
                                   4308 ; stack double constant 
                                   4309 ; DO-DCONST ( -- d )
                                   4310 ;-----------------------------------
                                   4311 ;        .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   4312 ;        LINK=.
                                   4313 ;        .byte 9 
                                   4314 ;        .ascii "DO-DCONST"
      009941                       4315 DO_DCONST:
      009941 90 85            [ 2] 4316     popw y 
      009943 90 BF 26         [ 2] 4317     ldw YTEMP,y 
      009946 1D 00 04         [ 2] 4318     subw x,#2*CELLL 
      009949 90 FE            [ 2] 4319     ldw y,(y)
      00994B FF               [ 2] 4320     ldw (x),y 
      00994C 90 BE 26         [ 2] 4321     ldw y,YTEMP 
      00994F 90 EE 02         [ 2] 4322     ldw y,(2,y)
      009952 EF 02            [ 2] 4323     ldw (2,x),y 
      009954 81               [ 4] 4324     ret 
                                   4325 
                                   4326 ;; Tools
                                   4327 
                                   4328 ;       _TYPE   ( b u -- )
                                   4329 ;       Display a string. Filter
                                   4330 ;       non-printing characters.
      009955 99 14                 4331         .word      LINK
                           0018D7  4332 LINK = . 
      009957 05                    4333         .byte      5
      009958 5F 54 59 50 45        4334         .ascii     "_TYPE"
      00995D                       4335 UTYPE:
      00995D CD 85 DF         [ 4] 4336         CALL     TOR     ;start count down loop
      009960 20 0F            [ 2] 4337         JRA     UTYP2   ;skip first pass
      009962 CD 86 16         [ 4] 4338 UTYP1:  CALL     DUPP
      009965 CD 85 8D         [ 4] 4339         CALL     CAT
      009968 CD 8B D9         [ 4] 4340         CALL     TCHAR
      00996B CD 84 B6         [ 4] 4341         CALL     EMIT    ;display only printable
      00996E CD 8B 43         [ 4] 4342         CALL     ONEP    ;increment address
      009971 CD 85 05         [ 4] 4343 UTYP2:  CALL     DONXT
      009974 99 62                 4344         .word      UTYP1   ;loop till done
      009976 CC 86 0C         [ 2] 4345         JP     DROP
                                   4346 
                                   4347 ;       dm+     ( a u -- a )
                                   4348 ;       Dump u bytes from ,
                                   4349 ;       leaving a+u on  stack.
      009979 99 57                 4350         .word      LINK
                           0018FB  4351 LINK = . 
      00997B 03                    4352         .byte      3
      00997C 64 6D 2B              4353         .ascii     "dm+"
      00997F                       4354 DUMPP:
      00997F CD 86 40         [ 4] 4355         CALL     OVER
      009982 CD 84 F1         [ 4] 4356         CALL     DOLIT
      009985 00 04                 4357         .word      4
      009987 CD 8F A6         [ 4] 4358         CALL     UDOTR   ;display address
      00998A CD 8E F6         [ 4] 4359         CALL     SPACE
      00998D CD 85 DF         [ 4] 4360         CALL     TOR     ;start count down loop
      009990 20 11            [ 2] 4361         JRA     PDUM2   ;skip first pass
      009992 CD 86 16         [ 4] 4362 PDUM1:  CALL     DUPP
      009995 CD 85 8D         [ 4] 4363         CALL     CAT
      009998 CD 84 F1         [ 4] 4364         CALL     DOLIT
      00999B 00 03                 4365         .word      3
      00999D CD 8F A6         [ 4] 4366         CALL     UDOTR   ;display numeric data
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      0099A0 CD 8B 43         [ 4] 4367         CALL     ONEP    ;increment address
      0099A3 CD 85 05         [ 4] 4368 PDUM2:  CALL     DONXT
      0099A6 99 92                 4369         .word      PDUM1   ;loop till done
      0099A8 81               [ 4] 4370         RET
                                   4371 
                                   4372 ;       DUMP    ( a u -- )
                                   4373 ;       Dump u bytes from a,
                                   4374 ;       in a formatted manner.
      0099A9 99 7B                 4375         .word      LINK
                           00192B  4376 LINK = . 
      0099AB 04                    4377         .byte      4
      0099AC 44 55 4D 50           4378         .ascii     "DUMP"
      0099B0                       4379 DUMP:
      0099B0 CD 86 E6         [ 4] 4380         CALL     BASE
      0099B3 CD 85 6F         [ 4] 4381         CALL     AT
      0099B6 CD 85 DF         [ 4] 4382         CALL     TOR
      0099B9 CD 8E 55         [ 4] 4383         CALL     HEX     ;save radix, set hex
      0099BC CD 84 F1         [ 4] 4384         CALL     DOLIT
      0099BF 00 10                 4385         .word      16
      0099C1 CD 8A 69         [ 4] 4386         CALL     SLASH   ;change count to lines
      0099C4 CD 85 DF         [ 4] 4387         CALL     TOR     ;start count down loop
      0099C7 CD 8F 3E         [ 4] 4388 DUMP1:  CALL     CR
      0099CA CD 84 F1         [ 4] 4389         CALL     DOLIT
      0099CD 00 10                 4390         .word      16
      0099CF CD 88 30         [ 4] 4391         CALL     DDUP
      0099D2 CD 99 7F         [ 4] 4392         CALL     DUMPP   ;display numeric
      0099D5 CD 87 E4         [ 4] 4393         CALL     ROT
      0099D8 CD 87 E4         [ 4] 4394         CALL     ROT
      0099DB CD 8E F6         [ 4] 4395         CALL     SPACE
      0099DE CD 8E F6         [ 4] 4396         CALL     SPACE
      0099E1 CD 99 5D         [ 4] 4397         CALL     UTYPE   ;display printable characters
      0099E4 CD 85 05         [ 4] 4398         CALL     DONXT
      0099E7 99 C7                 4399         .word      DUMP1   ;loop till done
      0099E9 CD 86 0C         [ 4] 4400 DUMP3:  CALL     DROP
      0099EC CD 85 C0         [ 4] 4401         CALL     RFROM
      0099EF CD 86 E6         [ 4] 4402         CALL     BASE
      0099F2 CC 85 58         [ 2] 4403         JP     STORE   ;restore radix
                                   4404 
                                   4405 ;       .S      ( ... -- ... )
                                   4406 ;        Display  contents of stack.
      0099F5 99 AB                 4407         .word      LINK
                           001977  4408 LINK = . 
      0099F7 02                    4409         .byte      2
      0099F8 2E 53                 4410         .ascii     ".S"
      0099FA                       4411 DOTS:
      0099FA CD 8F 3E         [ 4] 4412         CALL     CR
      0099FD CD 8B F1         [ 4] 4413         CALL     DEPTH   ;stack depth
      009A00 CD 85 DF         [ 4] 4414         CALL     TOR     ;start count down loop
      009A03 20 09            [ 2] 4415         JRA     DOTS2   ;skip first pass
      009A05 CD 85 D3         [ 4] 4416 DOTS1:  CALL     RAT
      009A08 CD 8C 08         [ 4] 4417 	CALL     PICK
      009A0B CD 8F F7         [ 4] 4418         CALL     DOT     ;index stack, display contents
      009A0E CD 85 05         [ 4] 4419 DOTS2:  CALL     DONXT
      009A11 9A 05                 4420         .word      DOTS1   ;loop till done
      009A13 CD 8F 7D         [ 4] 4421         CALL     DOTQP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      009A16 05                    4422         .byte      5
      009A17 20 3C 73 70 20        4423         .ascii     " <sp "
      009A1C 81               [ 4] 4424         RET
                                   4425 
                                   4426 ;       >NAME   ( ca -- na | F )
                                   4427 ;       Convert code address
                                   4428 ;       to a name address.
      009A1D 99 F7                 4429         .word      LINK
                           00199F  4430 LINK = . 
      009A1F 05                    4431         .byte      5
      009A20 3E 4E 41 4D 45        4432         .ascii     ">NAME"
      009A25                       4433 TNAME:
      009A25 CD 87 69         [ 4] 4434         CALL     CNTXT   ;vocabulary link
      009A28 CD 85 6F         [ 4] 4435 TNAM2:  CALL     AT
      009A2B CD 86 16         [ 4] 4436         CALL     DUPP    ;?last word in a vocabulary
      009A2E CD 85 24         [ 4] 4437         CALL     QBRAN
      009A31 9A 4C                 4438         .word      TNAM4
      009A33 CD 88 30         [ 4] 4439         CALL     DDUP
      009A36 CD 91 BF         [ 4] 4440         CALL     NAMET
      009A39 CD 86 9E         [ 4] 4441         CALL     XORR    ;compare
      009A3C CD 85 24         [ 4] 4442         CALL     QBRAN
      009A3F 9A 46                 4443         .word      TNAM3
      009A41 CD 8B 27         [ 4] 4444         CALL     CELLM   ;continue with next word
      009A44 20 E2            [ 2] 4445         JRA     TNAM2
      009A46 CD 86 26         [ 4] 4446 TNAM3:  CALL     SWAPP
      009A49 CC 86 0C         [ 2] 4447         JP     DROP
      009A4C CD 88 25         [ 4] 4448 TNAM4:  CALL     DDROP
      009A4F CC 8B AF         [ 2] 4449         JP     ZERO
                                   4450 
                                   4451 ;       .ID     ( na -- )
                                   4452 ;        Display  name at address.
      009A52 9A 1F                 4453         .word      LINK
                           0019D4  4454 LINK = . 
      009A54 03                    4455         .byte      3
      009A55 2E 49 44              4456         .ascii     ".ID"
      009A58                       4457 DOTID:
      009A58 CD 87 D3         [ 4] 4458         CALL     QDUP    ;if zero no name
      009A5B CD 85 24         [ 4] 4459         CALL     QBRAN
      009A5E 9A 6E                 4460         .word      DOTI1
      009A60 CD 8C 86         [ 4] 4461         CALL     COUNT
      009A63 CD 84 F1         [ 4] 4462         CALL     DOLIT
      009A66 00 1F                 4463         .word      0x1F
      009A68 CD 86 75         [ 4] 4464         CALL     ANDD    ;mask lexicon bits
      009A6B CC 99 5D         [ 2] 4465         JP     UTYPE
      009A6E CD 8F 7D         [ 4] 4466 DOTI1:  CALL     DOTQP
      009A71 09                    4467         .byte      9
      009A72 20 6E 6F 4E 61 6D 65  4468         .ascii     " noName"
      009A79 81               [ 4] 4469         RET
                                   4470 
                           000000  4471 WANT_SEE=0
                           000000  4472 .if WANT_SEE 
                                   4473 ;       SEE     ( -- ; <string> )
                                   4474 ;       A simple decompiler.
                                   4475 ;       Updated for byte machines.
                                   4476         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   4477 LINK = . 
                                   4478         .byte      3
                                   4479         .ascii     "SEE"
                                   4480 SEE:
                                   4481         CALL     TICK    ;starting address
                                   4482         CALL     CR
                                   4483         CALL     ONEM
                                   4484 SEE1:   CALL     ONEP
                                   4485         CALL     DUPP
                                   4486         CALL     AT
                                   4487         CALL     DUPP
                                   4488         CALL     QBRAN
                                   4489         .word    SEE2
                                   4490         CALL     TNAME   ;?is it a name
                                   4491 SEE2:   CALL     QDUP    ;name address or zero
                                   4492         CALL     QBRAN
                                   4493         .word    SEE3
                                   4494         CALL     SPACE
                                   4495         CALL     DOTID   ;display name
                                   4496         CALL     ONEP
                                   4497         JRA      SEE4
                                   4498 SEE3:   CALL     DUPP
                                   4499         CALL     CAT
                                   4500         CALL     UDOT    ;display number
                                   4501 SEE4:   CALL     NUFQ    ;user control
                                   4502         CALL     QBRAN
                                   4503         .word    SEE1
                                   4504         JP     DROP
                                   4505 .endif ; WANT_SEE 
                                   4506 
                                   4507 ;       WORDS   ( -- )
                                   4508 ;       Display names in vocabulary.
      009A7A 9A 54                 4509         .word      LINK
                           0019FC  4510 LINK = . 
      009A7C 05                    4511         .byte      5
      009A7D 57 4F 52 44 53        4512         .ascii     "WORDS"
      009A82                       4513 WORDS:
      009A82 CD 8F 3E         [ 4] 4514         CALL     CR
      009A85 CD 87 69         [ 4] 4515         CALL     CNTXT   ;only in context
      009A88 CD 85 6F         [ 4] 4516 WORS1:  CALL     AT
      009A8B CD 87 D3         [ 4] 4517         CALL     QDUP    ;?at end of list
      009A8E CD 85 24         [ 4] 4518         CALL     QBRAN
      009A91 9A A4                 4519         .word      WORS2
      009A93 CD 86 16         [ 4] 4520         CALL     DUPP
      009A96 CD 8E F6         [ 4] 4521         CALL     SPACE
      009A99 CD 9A 58         [ 4] 4522         CALL     DOTID   ;display a name
      009A9C CD 8B 27         [ 4] 4523         CALL     CELLM
      009A9F CD 85 3B         [ 4] 4524         CALL     BRAN
      009AA2 9A 88                 4525         .word      WORS1
      009AA4 81               [ 4] 4526 WORS2:  RET
                                   4527 
                                   4528         
                                   4529 ;; Hardware reset
                                   4530 
                                   4531 ;       hi      ( -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   4532 ;       Display sign-on message.
      009AA5 9A 7C                 4533         .word      LINK
                           001A27  4534 LINK = . 
      009AA7 02                    4535         .byte      2
      009AA8 68 69                 4536         .ascii     "hi"
      009AAA                       4537 HI:
      009AAA CD 8F 3E         [ 4] 4538         CALL     CR
      009AAD CD 8F 7D         [ 4] 4539         CALL     DOTQP   ;initialize I/O
      009AB0 0F                    4540         .byte      15
      009AB1 73 74 6D 38 65 46 6F  4541         .ascii     "stm8eForth v"
             72 74 68 20 76
      009ABD 33                    4542 	.byte      VER+'0'
      009ABE 2E                    4543         .byte      '.' 
      009ABF 30                    4544 	.byte      EXT+'0' ;version
      009AC0 CD 8F 7D         [ 4] 4545         CALL    DOTQP
                           000001  4546 .if NUCLEO          
      009AC3 12                    4547         .byte 18
      009AC4 20 6F 6E 20 4E 55 43  4548         .ascii  " on NUCLEO-8S208RB"
             4C 45 4F 2D 38 53 32
             30 38 52 42
                                   4549 .endif
                           000000  4550 .if DISCOVERY
                                   4551         .byte 19
                                   4552         .ascii  " on STM8S-DISCOVERY"
                                   4553 .endif
                           000000  4554 .if DOORBELL
                                   4555         .byte 16
                                   4556         .ascii " on stm8s105k6b6"
                                   4557 .endif
      009AD6 CC 8F 3E         [ 2] 4558         JP     CR
                                   4559 
                           000000  4560 WANT_DEBUG=0
                           000000  4561 .if WANT_DEBUG 
                                   4562 ;       DEBUG      ( -- )
                                   4563 ;       Display sign-on message.
                                   4564 ;        .word      LINK
                                   4565 LINK = . 
                                   4566         .byte      5
                                   4567         .ascii     "DEBUG"
                                   4568 DEBUG:
                                   4569 	CALL DOLIT
                                   4570 	.word 0x65
                                   4571 	CALL EMIT
                                   4572 	CALL DOLIT
                                   4573 	.word 0
                                   4574  	CALL ZLESS 
                                   4575 	CALL DOLIT
                                   4576 	.word 0xFFFE
                                   4577 	CALL ZLESS 
                                   4578 	CALL UPLUS 
                                   4579  	CALL DROP 
                                   4580 	CALL DOLIT
                                   4581 	.word 3
                                   4582 	CALL UPLUS 
                                   4583 	CALL UPLUS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   4584  	CALL DROP
                                   4585 	CALL DOLIT
                                   4586 	.word 0x43
                                   4587 	CALL UPLUS 
                                   4588  	CALL DROP
                                   4589 	CALL EMIT
                                   4590 	CALL DOLIT
                                   4591 	.word 0x4F
                                   4592 	CALL DOLIT
                                   4593 	.word 0x6F
                                   4594  	CALL XORR
                                   4595 	CALL DOLIT
                                   4596 	.word 0xF0
                                   4597  	CALL ANDD
                                   4598 	CALL DOLIT
                                   4599 	.word 0x4F
                                   4600  	CALL ORR
                                   4601 	CALL EMIT
                                   4602 	CALL DOLIT
                                   4603 	.word 8
                                   4604 	CALL DOLIT
                                   4605 	.word 6
                                   4606  	CALL SWAPP
                                   4607 	CALL OVER
                                   4608 	CALL XORR
                                   4609 	CALL DOLIT
                                   4610 	.word 3
                                   4611 	CALL ANDD 
                                   4612 	CALL ANDD
                                   4613 	CALL DOLIT
                                   4614 	.word 0x70
                                   4615 	CALL UPLUS 
                                   4616 	CALL DROP
                                   4617 	CALL EMIT
                                   4618 	CALL DOLIT
                                   4619 	.word 0
                                   4620 	CALL QBRAN
                                   4621 	.word DEBUG1
                                   4622 	CALL DOLIT
                                   4623 	.word 0x3F
                                   4624 DEBUG1:
                                   4625 	CALL DOLIT
                                   4626 	.word 0xFFFF
                                   4627 	CALL QBRAN
                                   4628 	.word DEBUG2
                                   4629 	CALL DOLIT
                                   4630 	.word 0x74
                                   4631 	CALL BRAN
                                   4632 	.word DEBUG3
                                   4633 DEBUG2:
                                   4634 	CALL DOLIT
                                   4635 	.word 0x21
                                   4636 DEBUG3:
                                   4637 	CALL EMIT
                                   4638 	CALL DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4639 	.word 0x68
                                   4640 	CALL DOLIT
                                   4641 	.word 0x80
                                   4642 	CALL STORE
                                   4643 	CALL DOLIT
                                   4644 	.word 0x80
                                   4645 	CALL AT
                                   4646 	CALL EMIT
                                   4647 	CALL DOLIT
                                   4648 	.word 0x4D
                                   4649 	CALL TOR
                                   4650 	CALL RAT
                                   4651 	CALL RFROM
                                   4652 	CALL ANDD
                                   4653 	CALL EMIT
                                   4654 	CALL DOLIT
                                   4655 	.word 0x61
                                   4656 	CALL DOLIT
                                   4657 	.word 0xA
                                   4658 	CALL TOR
                                   4659 DEBUG4:
                                   4660 	CALL DOLIT
                                   4661 	.word 1
                                   4662 	CALL UPLUS 
                                   4663 	CALL DROP
                                   4664 	CALL DONXT
                                   4665 	.word DEBUG4
                                   4666 	CALL EMIT
                                   4667 	CALL DOLIT
                                   4668 	.word 0x656D
                                   4669 	CALL DOLIT
                                   4670 	.word 0x100
                                   4671 	CALL UMSTA
                                   4672 	CALL SWAPP
                                   4673 	CALL DOLIT
                                   4674 	.word 0x100
                                   4675 	CALL UMSTA
                                   4676 	CALL SWAPP 
                                   4677 	CALL DROP
                                   4678 	CALL EMIT
                                   4679 	CALL EMIT
                                   4680 	CALL DOLIT
                                   4681 	.word 0x2043
                                   4682 	CALL DOLIT
                                   4683 	.word 0
                                   4684 	CALL DOLIT
                                   4685 	.word 0x100
                                   4686 	CALL UMMOD
                                   4687 	CALL EMIT
                                   4688 	CALL EMIT
                                   4689 	;JP ORIG
                                   4690 	RET
                                   4691 .endif ; WANT_DEBUG 
                                   4692 
                                   4693 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   4694 ;       'BOOT   ( -- a )
                                   4695 ;       The application startup vector.
      009AD9 9A A7                 4696         .word      LINK
                           001A5B  4697 LINK = . 
      009ADB 05                    4698         .byte      5
      009ADC 27 42 4F 4F 54        4699         .ascii     "'BOOT"
      009AE1                       4700 TBOOT:
      009AE1 CD 86 D6         [ 4] 4701         CALL     DOVAR
      009AE4 40 02                 4702         .word    APP_RUN      ;application to boot
                                   4703 
                                   4704 ;       COLD    ( -- )
                                   4705 ;       The hilevel cold start s=ence.
      009AE6 9A DB                 4706         .word      LINK
                           001A68  4707         LINK = . 
      009AE8 04                    4708         .byte      4
      009AE9 43 4F 4C 44           4709         .ascii     "COLD"
      009AED                       4710 COLD:
                           000000  4711 .if WANT_DEBUG
                                   4712         CALL DEBUG
                                   4713 .endif ; WANT_DEBUG
      009AED CD 84 F1         [ 4] 4714 COLD1:  CALL     DOLIT
      009AF0 80 AB                 4715         .word      UZERO
      009AF2 CD 84 F1         [ 4] 4716 	CALL     DOLIT
      009AF5 00 06                 4717         .word      UPP
      009AF7 CD 84 F1         [ 4] 4718         CALL     DOLIT
      009AFA 00 1C                 4719 	.word      UEND-UZERO
      009AFC CD 8C EA         [ 4] 4720         CALL     CMOVE   ;initialize user area
                           000001  4721 .if WANT_FLOAT 
      009AFF CD AC 35         [ 4] 4722         CALL    FINIT 
                                   4723 .endif 
                                   4724 ; if APP_RUN==0 initialize with ca de 'hi'  
      009B02 90 CE 40 02      [ 2] 4725         ldw y,APP_RUN 
      009B06 26 0B            [ 1] 4726         jrne 0$
      009B08 1D 00 02         [ 2] 4727         subw x,#CELLL 
      009B0B 90 AE 9A AA      [ 2] 4728         ldw y,#HI  
      009B0F FF               [ 2] 4729         ldw (x),y
      009B10 CD 9C 0B         [ 4] 4730         call UPDATRUN 
      009B13                       4731 0$:        
                                   4732 ; update LAST with APP_LAST 
                                   4733 ; if APP_LAST > LAST else do the opposite
      009B13 90 CE 40 00      [ 2] 4734         ldw y,APP_LAST 
      009B17 90 B3 1C         [ 2] 4735         cpw y,ULAST 
      009B1A 22 05            [ 1] 4736         jrugt 1$ 
                                   4737 ; save LAST at APP_LAST  
      009B1C CD 9B F3         [ 4] 4738         call UPDATLAST 
      009B1F 20 06            [ 2] 4739         jra 2$
      009B21                       4740 1$: ; update LAST with APP_LAST 
      009B21 90 BF 1C         [ 2] 4741         ldw ULAST,y
      009B24 90 BF 16         [ 2] 4742         ldw UCNTXT,y
      009B27                       4743 2$:  
                                   4744 ; update APP_CP if < app_space 
      009B27 90 CE 40 04      [ 2] 4745         ldw y,APP_CP  
      009B2B 90 B3 1A         [ 2] 4746         cpw y,UCP   
      009B2E 24 06            [ 1] 4747         jruge 3$ 
      009B30 CD 9C 1C         [ 4] 4748         call UPDATCP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009B33 90 BE 1A         [ 2] 4749         ldw y,UCP   
      009B36                       4750 3$:
      009B36 90 BF 1A         [ 2] 4751         ldw UCP,y                 
                                   4752 ; update UVP with APP_VP  
                                   4753 ; if APP_VP>UVP else do the opposite 
      009B39 90 CE 40 06      [ 2] 4754         ldw y,APP_VP 
      009B3D 90 B3 18         [ 2] 4755         cpw y,UVP 
      009B40 22 05            [ 1] 4756         jrugt 4$
      009B42 CD 9C 33         [ 4] 4757         call UPDATVP 
      009B45 20 03            [ 2] 4758         jra 6$
      009B47                       4759 4$: ; update UVP with APP_VP 
      009B47 90 BF 18         [ 2] 4760         ldw UVP,y 
      009B4A                       4761 6$:      
      009B4A CD 94 A2         [ 4] 4762         CALL     PRESE   ;initialize data stack and TIB
      009B4D CD 9A E1         [ 4] 4763         CALL     TBOOT
      009B50 CD 8C D3         [ 4] 4764         CALL     ATEXE   ;application boot
      009B53 CD 97 7B         [ 4] 4765         CALL     OVERT
      009B56 CC 94 BF         [ 2] 4766         JP     QUIT    ;start interpretation
                                   4767 
                                   4768 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



                                   4769         .include "flash.asm"
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
      009B59 9A E8                   30     .word LINK 
                           001ADB    31     LINK=.
      009B5B 03                      32     .byte 3 
      009B5C 46 50 21                33     .ascii "FP!"
      009B5F                         34 FPSTOR:
      009B5F 90 93            [ 1]   35     ldw y,x
      009B61 90 FE            [ 2]   36     ldw y,(y)
      009B63 90 9F            [ 1]   37     ld a,yl 
      009B65 B7 34            [ 1]   38     ld FPTR,a 
      009B67 1C 00 02         [ 2]   39     addw x,#CELLL 
      009B6A 90 93            [ 1]   40     ldw y,x 
      009B6C 90 FE            [ 2]   41     ldw y,(y)
      009B6E 90 BF 35         [ 2]   42     ldw PTR16,y
      009B71 1C 00 02         [ 2]   43     addw x,#CELLL 
      009B74 81               [ 4]   44     ret 
                                     45 
                                     46 ;-----------------------------------
                                     47 ; return EEPROM base address 
                                     48 ; as a double 
                                     49 ;  EEPROM  ( -- ud )
                                     50 ;-----------------------------------
      009B75 9B 5B                   51     .word LINK 
                           001AF7    52 LINK=.
      009B77 06                      53     .byte 6 
      009B78 45 45 50 52 4F 4D       54     .ascii "EEPROM"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009B7E                         55 EEPROM: 
      009B7E 90 AE 40 00      [ 2]   56     ldw y,#EEPROM_BASE
      009B82 1D 00 04         [ 2]   57     subw x,#2*CELLL 
      009B85 EF 02            [ 2]   58     ldw (2,x),y 
      009B87 90 5F            [ 1]   59     clrw y 
      009B89 FF               [ 2]   60     ldw (x),y 
      009B8A 81               [ 4]   61     ret
                                     62 
                                     63 ;---------------------------------
                                     64 ; return APP_LAST pointer as double
                                     65 ; EEP-LAST ( -- ud )
                                     66 ;---------------------------------
      009B8B 9B 77                   67 	.word LINK 
                           001B0D    68 	LINK=.
      009B8D 08                      69 	.byte 8 
      009B8E 45 45 50 2D 4C 41 53    70 	.ascii "EEP-LAST"
             54
      009B96                         71 EEPLAST:
      009B96 1D 00 04         [ 2]   72 	subw x,#2*CELLL 
      009B99 90 AE 40 00      [ 2]   73 	ldw y,#APP_LAST 
      009B9D EF 02            [ 2]   74 	ldw (2,x),y 
      009B9F 90 5F            [ 1]   75 	clrw y 
      009BA1 FF               [ 2]   76 	ldw (x),y 
      009BA2 81               [ 4]   77 	ret 
                                     78 
                                     79 ;----------------------------------
                                     80 ; return APP_RUN pointer as double	
                                     81 ; EEP-RUN ( -- ud )
                                     82 ;-----------------------------------
      009BA3 9B 8D                   83 	.word LINK 
                           001B25    84 	LINK=.
      009BA5 07                      85 	.byte 7
      009BA6 45 45 50 2D 52 55 4E    86 	.ascii "EEP-RUN"
      009BAD                         87 EEPRUN:
      009BAD 1D 00 04         [ 2]   88 	subw x,#2*CELLL 
      009BB0 90 AE 40 02      [ 2]   89 	ldw y,#APP_RUN 
      009BB4 EF 02            [ 2]   90 	ldw (2,x),y 
      009BB6 90 5F            [ 1]   91 	clrw y 
      009BB8 FF               [ 2]   92 	ldw (x),y 
      009BB9 81               [ 4]   93 	ret 
                                     94 
                                     95 ;------------------------------------
                                     96 ; return APP_CP pointer as double 
                                     97 ; EEP-CP ( -- ud )
                                     98 ;------------------------------------
      009BBA 9B A5                   99 	.word LINK
                           001B3C   100 	LINK=.
      009BBC 06                     101 	.byte 6 
      009BBD 45 45 50 2D 43 50      102 	.ascii "EEP-CP"
      009BC3                        103 EEPCP:
      009BC3 1D 00 04         [ 2]  104 	subw x,#2*CELLL 
      009BC6 90 AE 40 04      [ 2]  105 	ldw y,#APP_CP  
      009BCA EF 02            [ 2]  106 	ldw (2,x),y 
      009BCC 90 5F            [ 1]  107 	clrw y 
      009BCE FF               [ 2]  108 	ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      009BCF 81               [ 4]  109 	ret 
                                    110 
                                    111 ;------------------------------------
                                    112 ; return APP_VP pointer as double 
                                    113 ; EEP-VP ( -- ud )
                                    114 ;-------------------------------------
      009BD0 9B BC                  115 	.word LINK
                           001B52   116 	LINK=.
      009BD2 06                     117 	.byte 6
      009BD3 45 45 50 2D 56 50      118 	.ascii "EEP-VP"
      009BD9                        119 EEPVP:
      009BD9 1D 00 04         [ 2]  120 	subw x,#2*CELLL 
      009BDC 90 AE 40 06      [ 2]  121 	ldw y,#APP_VP  
      009BE0 EF 02            [ 2]  122 	ldw (2,x),y 
      009BE2 90 5F            [ 1]  123 	clrw y 
      009BE4 FF               [ 2]  124 	ldw (x),y 
      009BE5 81               [ 4]  125 	ret 
                                    126 
                                    127 ;----------------------------------
                                    128 ; update APP_LAST with LAST 
                                    129 ; UPDAT-LAST ( -- )
                                    130 ;----------------------------------
      009BE6 9B D2                  131 	.word LINK 
                           001B68   132 	LINK=.
      009BE8 0A                     133 	.byte 10
      009BE9 55 50 44 41 54 2D 4C   134 	.ascii "UPDAT-LAST"
             41 53 54
      009BF3                        135 UPDATLAST:
      009BF3 CD 87 95         [ 4]  136 	call LAST
      009BF6 CD 85 6F         [ 4]  137 	call AT  
      009BF9 CD 9B 96         [ 4]  138 	call EEPLAST
      009BFC CC 9D E9         [ 2]  139 	jp EESTORE 
                                    140 
                                    141 ;---------------------------------
                                    142 ; update APP_RUN 
                                    143 ; UPDAT-RUN ( a -- )
                                    144 ;---------------------------------
      009BFF 9B E8                  145 	.word LINK
                           001B81   146 	LINK=.
      009C01 09                     147 	.byte 9
      009C02 55 50 44 41 54 2D 52   148 	.ascii "UPDAT-RUN"
             55 4E
      009C0B                        149 UPDATRUN:
      009C0B CD 9B AD         [ 4]  150 	call EEPRUN
      009C0E CC 9D E9         [ 2]  151 	jp EESTORE 
                                    152 	
                                    153 ;---------------------------------
                                    154 ; update APP_CP with CP 
                                    155 ; UPDAT-CP ( -- )
                                    156 ;---------------------------------
      009C11 9C 01                  157 	.word LINK 
                           001B93   158 	LINK=.
      009C13 08                     159 	.byte 8 
      009C14 55 50 44 41 54 2D 43   160 	.ascii "UPDAT-CP"
             50
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009C1C                        161 UPDATCP:
      009C1C CD 87 85         [ 4]  162 	call CPP 
      009C1F CD 85 6F         [ 4]  163 	call AT 
      009C22 CD 9B C3         [ 4]  164 	call EEPCP 
      009C25 CC 9D E9         [ 2]  165 	jp EESTORE 
                                    166 
                                    167 ;----------------------------------
                                    168 ; update APP_VP with VP 
                                    169 ; UPDAT-VP ( -- )
                                    170 ;----------------------------------
      009C28 9C 13                  171 	.word LINK
                           001BAA   172 	LINK=.
      009C2A 08                     173 	.byte 8 
      009C2B 55 50 44 41 54 2D 56   174 	.ascii "UPDAT-VP" 
             50
      009C33                        175 UPDATVP:
      009C33 CD 87 77         [ 4]  176 	call VPP 
      009C36 CD 85 6F         [ 4]  177 	call AT
      009C39 CD 9B D9         [ 4]  178 	call EEPVP 
      009C3C CC 9D E9         [ 2]  179 	jp EESTORE
                                    180 	
                           000001   181 .if NUCLEO
                                    182 ;----------------------------------
                                    183 ; fetch integer at address over 65535
                                    184 ;  F@   ( ud -- n )
                                    185 ;----------------------------------
      009C3F 9C 2A                  186     .word LINK 
                           001BC1   187 LINK=.
      009C41 02                     188     .byte 2
      009C42 46 40                  189     .ascii "F@"
      009C44                        190 FARAT:
      009C44 CD 9B 5F         [ 4]  191     call FPSTOR
      009C47 CC 9D 0C         [ 2]  192 	jp EE_READ 
                                    193 
                                    194 
                                    195 ;-------------------------------------
                                    196 ; fetch C at address over 65535 
                                    197 ; FC@ ( ud -- c)
                                    198 ;-------------------------------------
      009C4A 9C 41                  199     .word LINK
                           001BCC   200     LINK=.
      009C4C 03                     201     .byte 3 
      009C4D 46 43 40               202     .ascii "FC@" 
      009C50                        203 FARCAT:
      009C50 CD 9B 5F         [ 4]  204     call FPSTOR
      009C53 CC 9D 2E         [ 2]  205 	jp EE_CREAD  
                                    206 .endif ; NUCLEO 
                                    207 
                                    208 ;----------------------------------
                                    209 ; UNLOCK EEPROM/OPT for writing/erasing
                                    210 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    211 ;  UNLKEE   ( -- )
                                    212 ;----------------------------------
      009C56 9C 4C                  213     .word LINK 
                           001BD8   214 LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009C58 06                     215     .byte 6 
      009C59 55 4E 4C 4B 45 45      216     .ascii "UNLKEE"
      009C5F                        217 UNLKEE:
      009C5F 35 00 50 5B      [ 1]  218 	mov FLASH_CR2,#0 
      009C63 35 FF 50 5C      [ 1]  219 	mov FLASH_NCR2,#0xFF 
      009C67 35 AE 50 64      [ 1]  220 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009C6B 35 56 50 64      [ 1]  221     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009C6F 72 07 50 5F FB   [ 2]  222 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009C74 81               [ 4]  223 	ret
                                    224 
                                    225 ;----------------------------------
                                    226 ; UNLOCK FLASH for writing/erasing
                                    227 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    228 ; UNLKFL  ( -- )
                                    229 ;----------------------------------
      009C75 9C 58                  230     .word LINK 
                           001BF7   231 LINK=. 
      009C77 06                     232     .byte 6 
      009C78 55 4E 4C 4B 46 4C      233     .ascii "UNLKFL"    
      009C7E                        234 UNLKFL:
      009C7E 35 00 50 5B      [ 1]  235 	mov FLASH_CR2,#0 
      009C82 35 FF 50 5C      [ 1]  236 	mov FLASH_NCR2,#0xFF 
      009C86 35 56 50 62      [ 1]  237 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009C8A 35 AE 50 62      [ 1]  238 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009C8E 72 03 50 5F FB   [ 2]  239 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009C93 81               [ 4]  240 	ret
                                    241 
                                    242 ;-----------------------------
                                    243 ; UNLOCK FLASH or EEPROM 
                                    244 ; according to FPTR address 
                                    245 ;  UNLOCK ( -- )
                                    246 ;-----------------------------
      009C94 9C 77                  247 	.word LINK 
                           001C16   248 	LINK=.
      009C96 06                     249 	.byte 6
      009C97 55 4E 4C 4F 43 4B      250 	.ascii "UNLOCK"
      009C9D                        251 UNLOCK:
                                    252 ; put addr[15:0] in Y, for bounds check.
      009C9D 90 BE 35         [ 2]  253 	ldw y,PTR16   ; Y=addr15:0
                                    254 ; check addr[23:16], if <> 0 then it is extened flash memory
      009CA0 3D 34            [ 1]  255 	tnz FPTR 
      009CA2 26 16            [ 1]  256 	jrne 4$
      009CA4 90 A3 80 00      [ 2]  257     cpw y,#FLASH_BASE
      009CA8 24 10            [ 1]  258     jruge 4$
      009CAA 90 A3 40 00      [ 2]  259 	cpw y,#EEPROM_BASE  
      009CAE 25 0D            [ 1]  260     jrult 9$
      009CB0 90 A3 48 7F      [ 2]  261 	cpw y,#OPTION_END 
      009CB4 22 07            [ 1]  262 	jrugt 9$
      009CB6 CD 9C 5F         [ 4]  263 	call UNLKEE
      009CB9 81               [ 4]  264 	ret 
      009CBA CD 9C 7E         [ 4]  265 4$: call UNLKFL
      009CBD 81               [ 4]  266 9$: ret 
                                    267 
                                    268 ;-------------------------
                                    269 ; LOCK write access to 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                    270 ; FLASH and EEPROM 
                                    271 ; LOCK ( -- )
                                    272 ;-------------------------
      009CBE 9C 96                  273 	.word LINK 
                           001C40   274 	LINK=.
      009CC0 04                     275 	.byte 4 
      009CC1 4C 4F 43 4B            276 	.ascii "LOCK" 
      009CC5                        277 LOCK: 
      009CC5 72 13 50 5F      [ 1]  278 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009CC9 72 17 50 5F      [ 1]  279 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009CCD 81               [ 4]  280 	ret 
                                    281 
                                    282 ;-------------------------
                                    283 ; increment FPTR 
                                    284 ; INC-FPTR ( -- )
                                    285 ;-------------------------
      009CCE 9C C0                  286 	.word LINK 
                           001C50   287 	LINK=. 
      009CD0 08                     288 	.byte 8 
      009CD1 49 4E 43 2D 46 50 54   289 	.ascii "INC-FPTR" 
             52
      009CD9                        290 INC_FPTR:
      009CD9 3C 36            [ 1]  291 	inc PTR8 
      009CDB 26 0C            [ 1]  292 	jrne 1$
      009CDD 90 89            [ 2]  293 	pushw y 
      009CDF 90 BE 34         [ 2]  294 	ldw y,FPTR 
      009CE2 90 5C            [ 1]  295 	incw y 
      009CE4 90 BF 34         [ 2]  296 	ldw FPTR,y
      009CE7 90 85            [ 2]  297 	popw y  
      009CE9 81               [ 4]  298 1$: ret 
                                    299 
                                    300 ;------------------------------
                                    301 ; add u to FPTR 
                                    302 ; PTR+ ( u -- )
                                    303 ;------------------------------
      009CEA 9C D0                  304 	.word LINK 
                           001C6C   305 	LINK=.
      009CEC 04                     306 	.byte 4 
      009CED 50 54 52 2B            307 	.ascii "PTR+"
      009CF1                        308 PTRPLUS:
      009CF1 90 93            [ 1]  309 	ldw y,x 
      009CF3 1C 00 02         [ 2]  310 	addw x,#CELLL 
      009CF6 72 B9 00 35      [ 2]  311 	addw y,PTR16 
      009CFA 90 BF 35         [ 2]  312 	ldw PTR16,y  
      009CFD 24 02            [ 1]  313 	jrnc 1$
      009CFF 3C 34            [ 1]  314 	inc FPTR 
      009D01 81               [ 4]  315 1$: ret 
                                    316 
                                    317 ;---------------------------------
                                    318 ; read word at address pointed FPTR
                                    319 ; increment FPTR 
                                    320 ; EE-READ ( -- w )
                                    321 ;------------------------------------
      009D02 9C EC                  322 	.word LINK 
                           001C84   323 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009D04 07                     324 	.byte 7 
      009D05 45 45 2D 52 45 41 44   325 	.ascii "EE-READ"
      009D0C                        326 EE_READ:
      009D0C 1D 00 02         [ 2]  327 	subw x,#CELLL 
      009D0F 92 BC 00 34      [ 5]  328 	ldf a,[FPTR]
      009D13 90 95            [ 1]  329 	ld yh,a 
      009D15 CD 9C D9         [ 4]  330 	call INC_FPTR 
      009D18 92 BC 00 34      [ 5]  331 	ldf a,[FPTR]
      009D1C CD 9C D9         [ 4]  332 	call INC_FPTR 
      009D1F 90 97            [ 1]  333 	ld yl,a 
      009D21 FF               [ 2]  334 	ldw (x),y 
      009D22 81               [ 4]  335 	ret 
                                    336 
                                    337 ;---------------------------------------
                                    338 ; Read byte at address pointed by FPTR 
                                    339 ; EE-CREAD ( -- c )
                                    340 ;---------------------------------------
      009D23 9D 04                  341 	.word LINK 
                           001CA5   342 	LINK=.
      009D25 08                     343 	.byte 8
      009D26 45 45 2D 43 52 45 41   344 	.ascii "EE-CREAD" 
             44
      009D2E                        345 EE_CREAD:
      009D2E 1D 00 02         [ 2]  346 	subw x,#CELLL 
      009D31 92 BC 00 34      [ 5]  347 	ldf a,[FPTR]	
      009D35 CD 9C D9         [ 4]  348 	call INC_FPTR
      009D38 90 5F            [ 1]  349 	clrw y 
      009D3A 90 97            [ 1]  350 	ld yl,a 
      009D3C FF               [ 2]  351 	ldw (x),y 
      009D3D 81               [ 4]  352 	ret 
                                    353 
                                    354 ;----------------------------
                                    355 ; write a byte at address pointed 
                                    356 ; by FPTR and increment FPTR.
                                    357 ; Expect pointer already initialized 
                                    358 ; and memory unlocked 
                                    359 ; WR-BYTE ( c -- )
                                    360 ;----------------------------
      009D3E 9D 25                  361 	.word LINK 
                           001CC0   362 	LINK=. 
      009D40 07                     363 	.byte 7 
      009D41 57 52 2D 42 59 54 45   364 	.ascii "WR-BYTE" 
                                    365 
      009D48                        366 WR_BYTE:
      009D48 CD 84 E3         [ 4]  367 	call FC_XOFF
      009D4B 90 93            [ 1]  368 	ldw y,x 
      009D4D 90 FE            [ 2]  369 	ldw y,(y)
      009D4F 1C 00 02         [ 2]  370 	addw x,#CELLL 
      009D52 90 9F            [ 1]  371 	ld a,yl
      009D54 92 BD 00 34      [ 4]  372 	ldf [FPTR],a
      009D58 72 05 50 5F FB   [ 2]  373 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009D5D CD 84 CD         [ 4]  374 	call FC_XON
      009D60 CC 9C D9         [ 2]  375 	jp INC_FPTR 
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
      009D63 9D 40                  384 	.word LINK 
                           001CE5   385 	LINK=.
      009D65 07                     386 	.byte 7 
      009D66 57 52 2D 57 4F 52 44   387 	.ascii "WR-WORD" 
      009D6D                        388 WR_WORD:
      009D6D CD 84 E3         [ 4]  389 	call FC_XOFF
      009D70 90 93            [ 1]  390 	ldw y,x
      009D72 90 FE            [ 2]  391 	ldw y,(y)
      009D74 1C 00 02         [ 2]  392 	addw x,#CELLL 
      009D77 90 9E            [ 1]  393 	ld a,yh 
      009D79 92 BD 00 34      [ 4]  394 	ldf [FPTR],a
      009D7D 72 05 50 5F FB   [ 2]  395 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009D82 CD 9C D9         [ 4]  396 	call INC_FPTR 
      009D85 90 9F            [ 1]  397 	ld a,yl 
      009D87 92 BD 00 34      [ 4]  398 	ldf [FPTR],a
      009D8B 72 05 50 5F FB   [ 2]  399 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009D90 CD 84 CD         [ 4]  400 	call FC_XON
      009D93 CC 9C D9         [ 2]  401 	jp INC_FPTR 
                                    402 
                                    403 
                                    404 ;---------------------------------------
                                    405 ; write a byte to FLASH or EEPROM/OPTION  
                                    406 ; EEC!  (c ud -- )
                                    407 ;---------------------------------------
      009D96 9D 65                  408     .word LINK 
                           001D18   409 	LINK=.
      009D98 04                     410     .byte 4 
      009D99 45 45 43 21            411     .ascii "EEC!"
                                    412 	; local variables 
                           000001   413 	BTW = 1   ; byte to write offset on stack
                           000002   414     OPT = 2 
                           000002   415 	VSIZE = 2
      009D9D                        416 EECSTORE:
      009D9D 52 02            [ 2]  417 	sub sp,#VSIZE
      009D9F CD 9B 5F         [ 4]  418     call FPSTOR
      009DA2 E6 01            [ 1]  419 	ld a,(1,x)
      009DA4 43               [ 1]  420 	cpl a 
      009DA5 6B 01            [ 1]  421 	ld (BTW,sp),a ; byte to write 
      009DA7 0F 02            [ 1]  422 	clr (OPT,sp)  ; OPTION flag
      009DA9 CD 9C 9D         [ 4]  423 	call UNLOCK 
                                    424 	; check if option
      009DAC 3D 34            [ 1]  425 	tnz FPTR 
      009DAE 26 19            [ 1]  426 	jrne 2$
      009DB0 90 BE 35         [ 2]  427 	ldw y,PTR16 
      009DB3 90 A3 48 00      [ 2]  428 	cpw y,#OPTION_BASE
      009DB7 2B 10            [ 1]  429 	jrmi 2$
      009DB9 90 A3 48 80      [ 2]  430 	cpw y,#OPTION_END+1
      009DBD 2A 0A            [ 1]  431 	jrpl 2$
      009DBF 03 02            [ 1]  432 	cpl (OPT,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                    433 	; OPTION WRITE require this UNLOCK 
      009DC1 72 1E 50 5B      [ 1]  434     bset FLASH_CR2,#FLASH_CR2_OPT
      009DC5 72 1F 50 5C      [ 1]  435     bres FLASH_NCR2,#FLASH_CR2_OPT 
      009DC9                        436 2$: 
      009DC9 CD 9D 48         [ 4]  437 	call WR_BYTE 	
      009DCC 0D 02            [ 1]  438 	tnz (OPT,sp)
      009DCE 27 0D            [ 1]  439 	jreq 3$ 
      009DD0 7B 01            [ 1]  440     ld a,(BTW,sp)
      009DD2 90 5F            [ 1]  441     clrw y
      009DD4 90 97            [ 1]  442 	ld yl,a 
      009DD6 1D 00 02         [ 2]  443 	subw x,#CELLL 
      009DD9 FF               [ 2]  444 	ldw (x),y 
      009DDA CD 9D 48         [ 4]  445 	call WR_BYTE
      009DDD                        446 3$: 
      009DDD CD 9C C5         [ 4]  447 	call LOCK 
      009DE0 5B 02            [ 2]  448 	addw sp,#VSIZE 
      009DE2 81               [ 4]  449     ret
                                    450 
                                    451 ;------------------------------
                                    452 ; write integer in FLASH|EEPROM
                                    453 ; EE! ( n ud -- )
                                    454 ;------------------------------
      009DE3 9D 98                  455 	.word LINK 
                           001D65   456 	LINK=.
      009DE5 03                     457 	.byte 3 
      009DE6 45 45 21               458 	.ascii "EE!"
      009DE9                        459 EESTORE:
      009DE9 CD 9B 5F         [ 4]  460 	call FPSTOR 
      009DEC CD 9C 9D         [ 4]  461 	call UNLOCK 
      009DEF 90 93            [ 1]  462 	ldw y,x 
      009DF1 90 FE            [ 2]  463 	ldw y,(y)
      009DF3 90 89            [ 2]  464 	pushw y 
      009DF5 90 5E            [ 1]  465 	swapw y 
      009DF7 FF               [ 2]  466 	ldw (x),y 
      009DF8 CD 9D 48         [ 4]  467 	call WR_BYTE 
      009DFB 90 85            [ 2]  468 	popw y 
      009DFD 1D 00 02         [ 2]  469 	subw x,#CELLL
      009E00 FF               [ 2]  470 	ldw (x),y 
      009E01 CD 9D 48         [ 4]  471 	call WR_BYTE
      009E04 CC 9C C5         [ 2]  472 	jp LOCK 
                                    473 
                                    474 
                                    475 ;----------------------------
                                    476 ; Erase flash memory row 
                                    477 ; stm8s208 as 128 bytes rows
                                    478 ; ROW-ERASE ( ud -- )
                                    479 ;----------------------------
      009E07 9D E5                  480 	.word LINK 
                           001D89   481 	LINK=. 
      009E09 09                     482 	.byte 9 
      009E0A 52 4F 57 2D 45 52 41   483 	.ascii "ROW-ERASE" 
             53 45
      009E13                        484 row_erase:
      009E13 CD 84 E3         [ 4]  485 	call FC_XOFF
      009E16 CD 9B 5F         [ 4]  486 	call FPSTOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                    487 ;code must be execute from RAM 
                                    488 ;copy routine to PAD 
      009E19 1D 00 02         [ 2]  489 	subw x,#CELLL 
      009E1C 90 AE 9E 6C      [ 2]  490 	ldw y,#row_erase_proc
      009E20 FF               [ 2]  491 	ldw (x),y 
      009E21 CD 8C AE         [ 4]  492 	call PAD 
      009E24 90 AE 9E 93      [ 2]  493 	ldw y,#row_erase_proc_end 
      009E28 72 A2 9E 6C      [ 2]  494 	subw y,#row_erase_proc
      009E2C 1D 00 02         [ 2]  495 	subw x,#CELLL 
      009E2F FF               [ 2]  496 	ldw (x),y 
      009E30 CD 8C EA         [ 4]  497 	call CMOVE 
      009E33                        498 block_erase:
      009E33 90 BE 35         [ 2]  499 	ldw y,FPTR+1
      009E36 90 A3 B3 00      [ 2]  500 	cpw y,#app_space 
      009E3A 2A 19            [ 1]  501 	jrpl erase_flash 
                                    502 ; erase EEPROM block
      009E3C 90 A3 40 00      [ 2]  503 	cpw y,#EEPROM_BASE 
      009E40 24 04            [ 1]  504 	jruge 1$
      009E42 CD 84 CD         [ 4]  505 	call FC_XON
      009E45 81               [ 4]  506 	ret ; bad address 
      009E46 90 A3 47 FF      [ 2]  507 1$: cpw y,#EEPROM_END 
      009E4A 23 04            [ 2]  508 	jrule 2$ 
      009E4C CD 84 CD         [ 4]  509 	call FC_XON
      009E4F 81               [ 4]  510 	ret ; bad address 
      009E50                        511 2$:	
      009E50 CD 9C 5F         [ 4]  512 	call UNLKEE 
      009E53 20 03            [ 2]  513 	jra proceed_erase
                                    514 ; erase flash block:
      009E55                        515 erase_flash:
      009E55 CD 9C 7E         [ 4]  516 	call UNLKFL 
      009E58                        517 proceed_erase:
      009E58 CD 8C AE         [ 4]  518 	call PAD 
      009E5B 90 93            [ 1]  519 	ldw y,x
      009E5D 90 FE            [ 2]  520 	ldw y,(y)
      009E5F 1C 00 02         [ 2]  521 	addw x,#CELLL  
      009E62 90 FD            [ 4]  522 	call (y) 
      009E64 72 17 50 5F      [ 1]  523 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009E68 CD 84 CD         [ 4]  524 	call FC_XON
      009E6B 81               [ 4]  525 	ret 
                                    526 
                                    527 ; this routine is to be copied to PAD 
      009E6C                        528 row_erase_proc:
      009E6C 35 20 50 5B      [ 1]  529 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009E70 35 DF 50 5C      [ 1]  530 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009E74 4F               [ 1]  531 	clr a 
      009E75 90 5F            [ 1]  532 	clrw y 
      009E77 91 A7 00 34      [ 1]  533 	ldf ([FPTR],y),a
      009E7B 90 5C            [ 1]  534     incw y
      009E7D 91 A7 00 34      [ 1]  535 	ldf ([FPTR],y),a
      009E81 90 5C            [ 1]  536     incw y
      009E83 91 A7 00 34      [ 1]  537 	ldf ([FPTR],y),a
      009E87 90 5C            [ 1]  538     incw y
      009E89 91 A7 00 34      [ 1]  539 	ldf ([FPTR],y),a
      009E8D 72 05 50 5F FB   [ 2]  540 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009E92 81               [ 4]  541 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009E93                        542 row_erase_proc_end:
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
      009E93                        555 copy_buffer:
      009E93 4B 80            [ 1]  556 	push #BLOCK_SIZE  
                                    557 ;enable block programming 
      009E95 72 10 50 5B      [ 1]  558 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009E99 72 11 50 5C      [ 1]  559 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009E9D 90 5F            [ 1]  560 	clrw y
      009E9F F6               [ 1]  561 1$:	ld a,(x)
      009EA0 91 A7 00 34      [ 1]  562 	ldf ([FPTR],y),a
      009EA4 5C               [ 1]  563 	incw x 
      009EA5 90 5C            [ 1]  564 	incw y 
      009EA7 0A 01            [ 1]  565 	dec (BCNT,sp)
      009EA9 26 F4            [ 1]  566 	jrne 1$
                                    567 ; wait EOP bit 
      009EAB 72 05 50 5F FB   [ 2]  568 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009EB0 84               [ 1]  569 	pop a ; remove BCNT from stack 
      009EB1 81               [ 4]  570 	ret 
      009EB2                        571 copy_buffer_end:
                                    572 
                                    573 ;-------------------------
                                    574 ; move program_row to RAM 
                                    575 ; in TIB 
                                    576 ;------------------------
      009EB2                        577 copy_prog_to_ram:
      009EB2 1D 00 06         [ 2]  578 	subw x,#6
      009EB5 90 AE 9E 93      [ 2]  579 	ldw y,#copy_buffer 
      009EB9 EF 04            [ 2]  580 	ldw (4,x),y 
      009EBB 90 AE 17 00      [ 2]  581 	ldw y,#TIBBASE
      009EBF EF 02            [ 2]  582 	ldw (2,x),y 
      009EC1 90 AE 9E B2      [ 2]  583 	ldw y,#copy_buffer_end 
      009EC5 72 A2 9E 93      [ 2]  584 	subw y,#copy_buffer  
      009EC9 FF               [ 2]  585 	ldw (x),y 
      009ECA CD 8C EA         [ 4]  586 	call CMOVE 
      009ECD 81               [ 4]  587 	ret 
                                    588 
                                    589 
                                    590 ;-----------------------------
                                    591 ; write a row in FLASH/EEPROM 
                                    592 ; WR-ROW ( a ud -- )
                                    593 ; a -> address 128 byte buffer to write 
                                    594 ; ud ->  row address in FLASH|EEPROM 
                                    595 ;-----------------------------
      009ECE 9E 09                  596 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                           001E50   597 	LINK=.
      009ED0 06                     598 	.byte 6 
      009ED1 57 52 2D 52 4F 57      599 	.ascii "WR-ROW"
      009ED7                        600 write_row:
      009ED7 CD 84 E3         [ 4]  601 	call FC_XOFF
      009EDA CD 9B 5F         [ 4]  602 	call FPSTOR
                                    603 ; align to FLASH block 
      009EDD A6 80            [ 1]  604 	ld a,#0x80 
      009EDF B4 36            [ 1]  605 	and a,PTR8 
      009EE1 B7 36            [ 1]  606 	ld PTR8,a  
      009EE3 CD 9E B2         [ 4]  607 	call copy_prog_to_ram
      009EE6 CD 9C 9D         [ 4]  608 	call UNLOCK
      009EE9 90 93            [ 1]  609 	ldw y,x 
      009EEB 90 FE            [ 2]  610 	ldw y,(y)
      009EED 1C 00 02         [ 2]  611 	addw x,#CELLL 
      009EF0 89               [ 2]  612 	pushw x 
      009EF1 93               [ 1]  613 	ldw x,y ; buffer address in x 
      009EF2 CD 17 00         [ 4]  614 	call TIBBASE
      009EF5 CD 9C C5         [ 4]  615 	call LOCK
      009EF8 85               [ 2]  616 	popw x 
      009EF9 CD 84 CD         [ 4]  617 	call FC_XON 
      009EFC 81               [ 4]  618 	ret 
                                    619 
                                    620 ;-------------------------------------
                                    621 ; change value of OPTION register 
                                    622 ; SET-OPT (c n -- ) 
                                    623 ; c new value.
                                    624 ; n OPT  number {1..7}
                                    625 ;--------------------------------------
      009EFD 9E D0                  626 		.word LINK 
                           001E7F   627 		LINK=.
      009EFF 07                     628 		.byte 7 
      009F00 53 45 54 2D 4F 50 54   629 		.ascii "SET-OPT" 
      009F07                        630 set_option: 
      009F07 90 93            [ 1]  631 		ldw y,x 
      009F09 90 FE            [ 2]  632 		ldw y,(y)
      009F0B 27 06            [ 1]  633 		jreq 1$
      009F0D 90 A3 00 07      [ 2]  634 		cpw y,#7 
      009F11 23 04            [ 2]  635 		jrule 2$ 
                                    636 ; invalid OPTION number 		
      009F13 1C 00 04         [ 2]  637 1$:		addw x,#2*CELLL
      009F16 81               [ 4]  638 		ret
      009F17 90 58            [ 2]  639 2$:		sllw y 
      009F19 72 A9 47 FF      [ 2]  640 		addw y,#OPTION_BASE-1
      009F1D FF               [ 2]  641 		ldw (x),y 
      009F1E 1D 00 02         [ 2]  642 		subw x,#CELLL 
      009F21 90 5F            [ 1]  643 		clrw y 
      009F23 FF               [ 2]  644 		ldw (x),y 
      009F24 CD 9D 9D         [ 4]  645 		call EECSTORE
      009F27 81               [ 4]  646 		ret 
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
      009F28 9E FF                  655 	.word LINK  
                           001EAA   656 	LINK=.
      009F2A 08                     657 	.byte 8 
      009F2B 50 52 49 53 54 49 4E   658 	.ascii "PRISTINE"
             45
      009F33                        659 pristine:
                                    660 ;;; erase EEPROM
      009F33 CD 9B 7E         [ 4]  661 	call EEPROM 
      009F36 CD 88 30         [ 4]  662 1$:	call DDUP 
      009F39 CD 9E 13         [ 4]  663 	call row_erase
      009F3C 90 93            [ 1]  664 	ldw y,x 
      009F3E 90 EE 02         [ 2]  665 	ldw y,(2,y)
      009F41 72 A9 00 80      [ 2]  666 	addw y,#BLOCK_SIZE
      009F45 EF 02            [ 2]  667 	ldw (2,x),y
      009F47 90 A3 48 00      [ 2]  668 	cpw y,#OPTION_BASE 
      009F4B 25 E9            [ 1]  669 	jrult 1$
                                    670 ;;; reset OPTION to default values
      009F4D 90 AE 00 01      [ 2]  671 	ldw y,#1 ; OPT1 
      009F51 FF               [ 2]  672 2$:	ldw (x),y   
      009F52 90 5F            [ 1]  673 	clrw y 
      009F54 EF 02            [ 2]  674 	ldw (2,x),y  ; ( 0 1 -- ) 
      009F56 CD 88 30         [ 4]  675 	call DDUP    ; ( 0 1 0 1 -- )  
      009F59 CD 9F 07         [ 4]  676 	call set_option
      009F5C 90 93            [ 1]  677 	ldw y,x 
      009F5E 90 FE            [ 2]  678 	ldw y,(y)
      009F60 90 5C            [ 1]  679 	incw y  ; next OPTION 
      009F62 90 A3 00 08      [ 2]  680 	cpw y,#8 
      009F66 25 E9            [ 1]  681 	jrult 2$
                                    682 ;;; erase first row of app_space 	
      009F68 90 AE B3 00      [ 2]  683 	ldw y,#app_space
      009F6C EF 02            [ 2]  684 	ldw (2,x),y  
      009F6E 90 5F            [ 1]  685 	clrw y 
      009F70 FF               [ 2]  686 	ldw (x),y ; ( app_space 0 -- )
      009F71 CD 9E 13         [ 4]  687 	call row_erase 
                                    688 ; reset interrupt vectors 
      009F74 1D 00 02         [ 2]  689 	subw x,#CELLL 
      009F77 90 5F            [ 1]  690 	clrw y  
      009F79 FF               [ 2]  691 4$:	ldw (x),y  ; ( n -- ) int# 
      009F7A CD 86 16         [ 4]  692 	call DUPP  
      009F7D CD 9F 9A         [ 4]  693 	call reset_vector
      009F80 90 93            [ 1]  694 	ldw y,x 
      009F82 90 FE            [ 2]  695 	ldw y,(y)
      009F84 90 5C            [ 1]  696 	incw y   ; next vector 
      009F86 90 A3 00 19      [ 2]  697 	cpw y,#25 
      009F8A 25 ED            [ 1]  698 	jrult 4$
      009F8C CC 80 80         [ 2]  699 	jp NonHandledInterrupt ; reset MCU
                                    700 
                                    701 ;------------------------------
                                    702 ; reset an interrupt vector 
                                    703 ; to its initial value 
                                    704 ; i.e. NonHandledInterrupt
                                    705 ; RST-IVEC ( n -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                    706 ;-----------------------------
      009F8F 9F 2A                  707 	.word LINK 
                           001F11   708 	LINK=. 
      009F91 08                     709 	.byte 8 
      009F92 52 53 54 2D 49 56 45   710 	.ascii "RST-IVEC"
             43
      009F9A                        711 reset_vector:
      009F9A 90 93            [ 1]  712 	ldw y,x
      009F9C 1C 00 02         [ 2]  713 	addw x,#CELLL 
      009F9F 90 FE            [ 2]  714 	ldw y,(y)
      009FA1 90 A3 00 17      [ 2]  715 	cpw y,#23 
      009FA5 27 3A            [ 1]  716 	jreq 9$
      009FA7 90 A3 00 1D      [ 2]  717 	cpw y,#29 ; last vector
      009FAB 22 34            [ 1]  718 	jrugt 9$  
      009FAD 90 58            [ 2]  719 	sllw y 
      009FAF 90 58            [ 2]  720 	sllw y 
      009FB1 72 A9 80 08      [ 2]  721 	addw y,#0x8008 ; irq0 address 
      009FB5 90 BF 26         [ 2]  722 	ldw YTEMP,y
      009FB8 1D 00 06         [ 2]  723 	subw x,#3*CELLL 
      009FBB EF 02            [ 2]  724 	ldw (2,x),y 
      009FBD 90 5F            [ 1]  725 	clrw y
      009FBF FF               [ 2]  726 	ldw (x),y 
      009FC0 A6 82            [ 1]  727 	ld a,#0x82 
      009FC2 90 95            [ 1]  728 	ld yh,a
      009FC4 EF 04            [ 2]  729 	ldw (4,x),y
      009FC6 CD 9D E9         [ 4]  730 	call EESTORE
      009FC9 1D 00 06         [ 2]  731 	subw x,#3*CELLL
      009FCC 90 5F            [ 1]  732 	clrw y 
      009FCE FF               [ 2]  733 	ldw (x),y 
      009FCF 90 AE 80 80      [ 2]  734 	ldw y,#NonHandledInterrupt
      009FD3 EF 04            [ 2]  735 	ldw (4,x),y 
      009FD5 90 BE 26         [ 2]  736 	ldw y,YTEMP  
      009FD8 72 A9 00 02      [ 2]  737 	addw y,#2
      009FDC EF 02            [ 2]  738 	ldw (2,x),y 
      009FDE CD 9D E9         [ 4]  739 	call EESTORE
      009FE1 81               [ 4]  740 9$:	ret 
                                    741 
                                    742 
                                    743 ;------------------------------
                                    744 ; all interrupt vector with 
                                    745 ; an address >= a are resetted 
                                    746 ; to default
                                    747 ; CHKIVEC ( a -- )
                                    748 ;------------------------------
      009FE2 9F 91                  749 	.word LINK 
                           001F64   750 	LINK=.
      009FE4 07                     751 	.byte 7
      009FE5 43 48 4B 49 56 45 43   752 	.ascii "CHKIVEC"
                                    753 ;local variables 
                           000001   754 	SSP=1
                           000003   755 	CADR=3
                           000005   756 	OFS=5
                           000006   757 	VSIZE=6  
      009FEC                        758 CHKIVEC:
      009FEC 52 06            [ 2]  759 	sub sp,#VSIZE ;alloc local variables 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009FEE 90 93            [ 1]  760 	ldw y,x 
      009FF0 90 FE            [ 2]  761 	ldw y,(y)
      009FF2 17 03            [ 2]  762 	ldw (CADR,sp),y ; ca 
      009FF4 1F 01            [ 2]  763 	ldw (SSP,sp),x 
      009FF6 AE 80 0A         [ 2]  764 	ldw x,#0x800a ; irq0 address 
      009FF9 BF 35            [ 2]  765 	ldw PTR16,X
      009FFB AE FF FC         [ 2]  766 	ldw x,#-4 
      009FFE 1C 00 04         [ 2]  767 1$:	addw x,#4
      00A001 A3 00 78         [ 2]  768 	cpw x,#30*4 ; irq0-29 
      00A004 27 22            [ 1]  769 	jreq 9$
      00A006 90 93            [ 1]  770 	ldw y,x  
      00A008 91 D6 35         [ 4]  771 	ld a,([PTR16],y)
      00A00B 11 03            [ 1]  772 	cp a,(CADR,sp)
      00A00D 25 EF            [ 1]  773 	jrult 1$
      00A00F 90 5C            [ 1]  774 	incw y 
      00A011 91 D6 35         [ 4]  775 	ld a,([PTR16],y)
      00A014 11 04            [ 1]  776 	cp a,(CADR+1,sp) 
      00A016 25 E6            [ 1]  777 	jrult 1$ 
      00A018 1F 05            [ 2]  778 	ldw (OFS,sp),x 
      00A01A 54               [ 2]  779 	srlw x
      00A01B 54               [ 2]  780 	srlw x 
      00A01C 90 93            [ 1]  781 	ldw y,x 
      00A01E 1E 01            [ 2]  782 	ldw x,(SSP,sp)
      00A020 FF               [ 2]  783 	ldw (x),y
      00A021 CD 9F 9A         [ 4]  784 	call reset_vector
      00A024 1E 05            [ 2]  785 	ldw x,(OFS,sp) 
      00A026 20 D6            [ 2]  786 	jra 1$
      00A028 1E 01            [ 2]  787 9$:	ldw x,(SSP,sp) 
      00A02A 1C 00 02         [ 2]  788 	addw x,#CELLL 
      00A02D 5B 06            [ 2]  789 	addw sp,#VSIZE ; drop local variables  
      00A02F 81               [ 4]  790 	ret 
                                    791 
                                    792 ;------------------------------
                                    793 ; set interrupt vector 
                                    794 ; SET-IVEC ( ud n -- )
                                    795 ;  ud Handler address
                                    796 ;  n  vector # 0 .. 29 
                                    797 ;-----------------------------
      00A030 9F E4                  798 	.word LINK
                           001FB2   799 	LINK=.
      00A032 08                     800 	.byte 8 
      00A033 53 45 54 2D 49 56 45   801 	.ascii "SET-IVEC" 
             43
      00A03B                        802 set_vector:
      00A03B 90 93            [ 1]  803     ldw y,x 
      00A03D 1C 00 02         [ 2]  804 	addw x,#CELLL 
      00A040 90 FE            [ 2]  805 	ldw y,(y) ; vector #
      00A042 90 A3 00 1D      [ 2]  806 	cpw y,#29 ; last vector
      00A046 23 04            [ 2]  807 	jrule 2$
      00A048 1C 00 04         [ 2]  808 	addw x,#2*CELLL 
      00A04B 81               [ 4]  809 	ret
      00A04C 90 58            [ 2]  810 2$:	sllw y 
      00A04E 90 58            [ 2]  811 	sllw y 
      00A050 72 A9 80 08      [ 2]  812 	addw y,#0X8008 ; IRQ0 vector address 
      00A054 90 BF 26         [ 2]  813 	ldw YTEMP,y ; vector address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      00A057 A6 82            [ 1]  814 	ld a,#0x82 
      00A059 90 95            [ 1]  815 	ld yh,a 
      00A05B E6 01            [ 1]  816 	ld a,(1,x) ; isr address bits 23..16 
      00A05D 90 97            [ 1]  817 	ld yl,a 
                                    818 ;  write 0x82 + most significant byte of int address	
      00A05F 1D 00 06         [ 2]  819 	subw x,#3*CELLL 
      00A062 EF 04            [ 2]  820 	ldw (4,x),y 
      00A064 90 BE 26         [ 2]  821 	ldw y,YTEMP
      00A067 EF 02            [ 2]  822 	ldw (2,x),y ; vector address 
      00A069 90 5F            [ 1]  823 	clrw y 
      00A06B FF               [ 2]  824 	ldw (x),y   ; as a double 
      00A06C CD 9D E9         [ 4]  825 	call EESTORE 
      00A06F 90 93            [ 1]  826 	ldw y,x 
      00A071 90 EE 02         [ 2]  827 	ldw y,(2,y) ; bits 15..0 int vector 
      00A074 1D 00 06         [ 2]  828 	subw x,#3*CELLL 
      00A077 EF 04            [ 2]  829 	ldw (4,x),y 
      00A079 90 BE 26         [ 2]  830 	ldw y,YTEMP 
      00A07C 72 A9 00 02      [ 2]  831 	addw y,#2 
      00A080 EF 02            [ 2]  832 	ldw (2,x),y 
      00A082 90 5F            [ 1]  833 	clrw y 
      00A084 FF               [ 2]  834 	ldw (x),y 
      00A085 CD 9D E9         [ 4]  835 	call EESTORE
      00A088 1C 00 04         [ 2]  836 	addw x,#2*CELLL  
      00A08B 81               [ 4]  837 9$: ret 
                                    838 
                                    839 
                                    840 ;------------------------
                                    841 ; Compile word to flash
                                    842 ; EE, (w -- )
                                    843 ;-----------------------
      00A08C A0 32                  844 	.word LINK
                           00200E   845 	LINK=.
      00A08E 03                     846 	.byte 3
      00A08F 45 45 2C               847 	.ascii "EE,"
      00A092                        848 EE_COMMA:
      00A092 1D 00 04         [ 2]  849 	subw x,#2*CELLL 
      00A095 90 BE 1A         [ 2]  850 	ldw y,UCP
      00A098 90 89            [ 2]  851 	pushw y 
      00A09A EF 02            [ 2]  852 	ldw (2,x),y 
      00A09C 90 5F            [ 1]  853 	clrw y 
      00A09E FF               [ 2]  854 	ldw (x),y
      00A09F CD 9D E9         [ 4]  855 	call EESTORE
      00A0A2 90 85            [ 2]  856 	popw y 
      00A0A4 72 A9 00 02      [ 2]  857 	addw y,#2
      00A0A8 90 BF 1A         [ 2]  858 	ldw UCP,y
      00A0AB 81               [ 4]  859 	ret 
                                    860 
                                    861 
                                    862 ;-------------------------
                                    863 ; Compile byte to flash 
                                    864 ; EEC, ( c -- )	
                                    865 ;-------------------------
      00A0AC A0 8E                  866 	.word LINK 
                           00202E   867 	LINK=.
      00A0AE 04                     868 	.byte 4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      00A0AF 45 45 43 2C            869 	.ascii "EEC,"
      00A0B3                        870 EE_CCOMMA:
      00A0B3 1D 00 04         [ 2]  871 	subw x,#2*CELLL 
      00A0B6 90 BE 1A         [ 2]  872 	ldw y,UCP
      00A0B9 90 89            [ 2]  873 	pushw y 
      00A0BB EF 02            [ 2]  874 	ldw (2,x),y 
      00A0BD 90 5F            [ 1]  875 	clrw y 
      00A0BF FF               [ 2]  876 	ldw (x),y
      00A0C0 CD 9D 9D         [ 4]  877 	call EECSTORE
      00A0C3 90 85            [ 2]  878 	popw y 
      00A0C5 90 5C            [ 1]  879 	incw y 
      00A0C7 90 BF 1A         [ 2]  880 	ldw UCP,y
      00A0CA 81               [ 4]  881 	ret 
                                    882 
                                    883 
                                    884 ;--------------------------
                                    885 ; copy FLASH block to ROWBUF
                                    886 ; ROW>BUF ( ud -- )
                                    887 ;--------------------------
      00A0CB A0 AE                  888 	.word LINK 
                           00204D   889 	LINK=.
      00A0CD 07                     890 	.byte 7 
      00A0CE 52 4F 57 3E 42 55 46   891 	.ascii "ROW>BUF"
      00A0D5                        892 ROW2BUF: 
      00A0D5 CD 9B 5F         [ 4]  893 	call FPSTOR 
      00A0D8 A6 80            [ 1]  894 	ld a,#BLOCK_SIZE
      00A0DA 88               [ 1]  895 	push a 
      00A0DB B4 36            [ 1]  896 	and a,PTR8 ; block align 
      00A0DD B7 36            [ 1]  897 	ld PTR8,a
      00A0DF 90 AE 16 80      [ 2]  898 	ldw y,#ROWBUFF 
      00A0E3 92 BC 00 34      [ 5]  899 1$: ldf a,[FPTR]
      00A0E7 90 F7            [ 1]  900 	ld (y),a
      00A0E9 CD 9C D9         [ 4]  901 	call INC_FPTR
      00A0EC 90 5C            [ 1]  902 	incw y 
      00A0EE 0A 01            [ 1]  903 	dec (1,sp)
      00A0F0 26 F1            [ 1]  904 	jrne 1$ 
      00A0F2 84               [ 1]  905 	pop a 
      00A0F3 81               [ 4]  906 	ret 
                                    907 
                                    908 
                                    909 ;---------------------------
                                    910 ; copy ROWBUFF to flash 
                                    911 ; BUF>ROW ( ud -- )
                                    912 ; ud is row address as double 
                                    913 ;---------------------------
      00A0F4 A0 CD                  914 	.word LINK 
                           002076   915 	LINK=.
      00A0F6 07                     916 	.byte 7 
      00A0F7 42 55 46 3E 52 4F 57   917 	.ascii "BUF>ROW" 
      00A0FE                        918 BUF2ROW:
      00A0FE CD 87 24         [ 4]  919 	call TBUF ; ( ud rb -- )
      00A101 CD 87 E4         [ 4]  920 	call ROT 
      00A104 CD 87 E4         [ 4]  921 	call ROT  ; ( rb ud -- )
      00A107 CD 9E D7         [ 4]  922 	call write_row 
      00A10A 81               [ 4]  923 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



                                    924 
                                    925 ;---------------------------------
                                    926 ; how many byte free in that row 
                                    927 ; RFREE ( a -- n )
                                    928 ; a is least byte of target address
                                    929 ;----------------------------------
      00A10B A0 F6                  930 	.word LINK 
                           00208D   931 	LINK=.
      00A10D 05                     932 	.byte 5 
      00A10E 52 46 52 45 45         933 	.ascii "RFREE"
      00A113                        934 RFREE:
      00A113 E6 01            [ 1]  935 	ld a,(1,x)
      00A115 A4 7F            [ 1]  936 	and a,#BLOCK_SIZE-1 
      00A117 B7 26            [ 1]  937 	ld YTEMP,a 
      00A119 A6 80            [ 1]  938 	ld a,#BLOCK_SIZE 
      00A11B B0 26            [ 1]  939 	sub a,YTEMP 
      00A11D 90 5F            [ 1]  940 	clrw y 
      00A11F 90 97            [ 1]  941 	ld yl,a
      00A121 FF               [ 2]  942 	ldw (x),y 
      00A122 81               [ 4]  943 	ret 
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
      00A123 A1 0D                  954 	.word LINK 
                           0020A5   955 	LINK=. 
      00A125 06                     956 	.byte 6
      00A126 52 41 4D 3E 45 45      957 	.ascii "RAM>EE"
                                    958 	
      00A12C                        959 RAM2EE:
                                    960 ; copy ud on top 
      00A12C 90 93            [ 1]  961 	ldw y,x 
      00A12E 90 EE 06         [ 2]  962 	ldw y,(6,y) ; LSW of ud  
      00A131 90 BF 26         [ 2]  963 	ldw YTEMP,y 
      00A134 90 93            [ 1]  964 	ldw y,x 
      00A136 90 EE 04         [ 2]  965 	ldw y,(4,y)  ; MSW of ud 
      00A139 1D 00 04         [ 2]  966 	subw x,#2*CELLL 
      00A13C FF               [ 2]  967 	ldw (x),y 
      00A13D 90 BE 26         [ 2]  968 	ldw y,YTEMP 
      00A140 EF 02            [ 2]  969 	ldw (2,x),y 
      00A142 CD A0 D5         [ 4]  970 	call ROW2BUF 
      00A145 90 93            [ 1]  971 	ldw y,x 
      00A147 90 EE 06         [ 2]  972 	ldw y,(6,y)
      00A14A 90 89            [ 2]  973 	pushw y ; udl 
      00A14C 90 9F            [ 1]  974 	ld a,yl
      00A14E A4 7F            [ 1]  975 	and a,#BLOCK_SIZE-1 
      00A150 90 5F            [ 1]  976 	clrw y 
      00A152 90 97            [ 1]  977 	ld yl,a 
      00A154 72 A9 16 80      [ 2]  978 	addw y,#ROWBUFF 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      00A158 1D 00 02         [ 2]  979 	subw x,#CELLL 
      00A15B FF               [ 2]  980 	ldw (x),y  
      00A15C CD 86 26         [ 4]  981 	call SWAPP ;  ( ud a ra u -- )
      00A15F CD 85 C0         [ 4]  982 	call RFROM  
      00A162 CD A1 13         [ 4]  983 	call RFREE 
      00A165 CD 89 7E         [ 4]  984 	call MIN
      00A168 CD 86 16         [ 4]  985 	call DUPP 
      00A16B CD 85 DF         [ 4]  986 	call TOR  
      00A16E CD 8C EA         [ 4]  987 	call CMOVE
      00A171 CD A0 FE         [ 4]  988 	call BUF2ROW 
      00A174 CD 85 C0         [ 4]  989 	call RFROM 
      00A177 81               [ 4]  990 	ret 
                                    991 
                                    992 
                                    993 ;--------------------------
                                    994 ; expand 16 bit address 
                                    995 ; to 32 bit address 
                                    996 ; FADDR ( a -- ud )
                                    997 ;--------------------------
      00A178 A1 25                  998 	.word LINK 
                           0020FA   999 	LINK=. 
      00A17A 05                    1000 	.byte 5 
      00A17B 46 41 44 44 52        1001 	.ascii "FADDR"
      00A180                       1002 FADDR:
      00A180 CC 8B AF         [ 2] 1003 	jp ZERO 
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
      00A183 A1 7A                 1019 	.word LINK 
                           002105  1020 	LINK=.
      00A185 05                    1021 	.byte 5 
      00A186 46 4D 4F 56 45        1022 	.ascii "FMOVE" 
      00A18B                       1023 FMOVE:
      00A18B CD 87 36         [ 4] 1024 	call TFLASH 
      00A18E CD 85 6F         [ 4] 1025 	CALL AT 
      00A191 CD 85 24         [ 4] 1026 	CALL QBRAN 
      00A194 A2 0F                 1027 	.word no_move  
      00A196 CD 87 85         [ 4] 1028 	call CPP
      00A199 CD 85 6F         [ 4] 1029 	call AT  
      00A19C CD 86 16         [ 4] 1030 	call DUPP ; ( udl udl -- )
      00A19F CD 87 69         [ 4] 1031 	call CNTXT 
      00A1A2 CD 85 6F         [ 4] 1032 	call AT 
      00A1A5 CD 84 F1         [ 4] 1033 	call DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      00A1A8 00 02                 1034 	.word 2 
      00A1AA CD 88 BE         [ 4] 1035 	call SUBB ; ( udl udl a -- )
      00A1AD CD 86 26         [ 4] 1036 	call SWAPP 
      00A1B0 CD A1 80         [ 4] 1037 	call FADDR 
      00A1B3 CD 87 E4         [ 4] 1038 	call ROT  ; ( udl ud a -- )
      00A1B6 CD 86 16         [ 4] 1039 	call DUPP 
      00A1B9 CD 85 DF         [ 4] 1040 	call TOR    ; R: a 
      00A1BC                       1041 FMOVE2: 
      00A1BC CD 8C 9D         [ 4] 1042 	call HERE 
      00A1BF CD 85 D3         [ 4] 1043 	call RAT 
      00A1C2 CD 88 BE         [ 4] 1044 	call SUBB ; (udl ud a wl -- )
      00A1C5                       1045 next_row:
      00A1C5 CD 86 16         [ 4] 1046 	call DUPP 
      00A1C8 CD 85 DF         [ 4] 1047 	call TOR  ; ( udl ud a wl -- ) R: a wl
      00A1CB CD A1 2C         [ 4] 1048 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      00A1CE CD 86 16         [ 4] 1049 	call DUPP 
      00A1D1 CD 85 DF         [ 4] 1050 	call TOR
      00A1D4 CD 88 45         [ 4] 1051 	call PLUS  ; ( udl+ ) 
      00A1D7 CD 86 16         [ 4] 1052 	call DUPP 
      00A1DA CD 8B AF         [ 4] 1053 	call ZERO   ; ( udl+ ud -- )
      00A1DD CD 85 C0         [ 4] 1054 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      00A1E0 CD 85 C0         [ 4] 1055 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      00A1E3 CD 86 40         [ 4] 1056 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      00A1E6 CD 88 BE         [ 4] 1057 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      00A1E9 CD 86 16         [ 4] 1058 	call DUPP 
      00A1EC CD 85 24         [ 4] 1059 	call QBRAN
      00A1EF A2 08                 1060 	.word fmove_done 
      00A1F1 CD 86 26         [ 4] 1061 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      00A1F4 CD 85 C0         [ 4] 1062 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      00A1F7 CD 88 45         [ 4] 1063 	call PLUS  ; ( udl+2 ud wl- a+ )
      00A1FA CD 86 16         [ 4] 1064 	call DUPP 
      00A1FD CD 85 DF         [ 4] 1065 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      00A200 CD 86 26         [ 4] 1066 	call SWAPP 
      00A203 CD 85 3B         [ 4] 1067 	call BRAN
      00A206 A1 C5                 1068 	.word next_row  
      00A208                       1069 fmove_done:	
      00A208 CD 85 C0         [ 4] 1070 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      00A20B 1C 00 0A         [ 2] 1071 	addw x,#5*CELLL ; (  -- cp+ ) new CP 
      00A20E 81               [ 4] 1072  	ret  
      00A20F                       1073 no_move:
      00A20F CD 8B AF         [ 4] 1074 	call ZERO
      00A212 81               [ 4] 1075 	ret 
                                   1076 
                                   1077 ;------------------------------------------
                                   1078 ; adjust pointers after **FMOVE** operetion.
                                   1079 ; UPDAT-PTR ( cp+ -- )
                                   1080 ; cp+ is new CP position after FMOVE 
                                   1081 ;-------------------------------------------
      00A213 A1 85                 1082 	.word LINK 
                           002195  1083 	LINK=.
      00A215 09                    1084 	.byte 9
      00A216 55 50 44 41 54 2D 50  1085 	.ascii "UPDAT-PTR" 
             54 52
      00A21F                       1086 UPDATPTR:
                                   1087 ;reset VP to previous position  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      00A21F CD 9B D9         [ 4] 1088 	call EEPVP 
      00A222 CD 86 0C         [ 4] 1089 	call DROP 
      00A225 CD 85 6F         [ 4] 1090 	call AT
      00A228 CD 87 77         [ 4] 1091 	call VPP 
      00A22B CD 85 58         [ 4] 1092 	call STORE
                                   1093 ;update CONTEXT and LAST 
      00A22E CD 9B C3         [ 4] 1094 	call EEPCP 
      00A231 CD 86 0C         [ 4] 1095 	call DROP
      00A234 CD 85 6F         [ 4] 1096 	call AT
      00A237 CD 84 F1         [ 4] 1097 	call DOLIT 
      00A23A 00 02                 1098 	.word 2 
      00A23C CD 88 45         [ 4] 1099 	call PLUS 
      00A23F CD 86 16         [ 4] 1100 	call DUPP 
      00A242 CD 87 69         [ 4] 1101 	call CNTXT 
      00A245 CD 85 58         [ 4] 1102 	call STORE
      00A248 CD 87 95         [ 4] 1103 	call LAST
      00A24B CD 85 58         [ 4] 1104 	call STORE 
      00A24E CD 9B F3         [ 4] 1105 	call UPDATLAST 
                                   1106 ;update CP 
      00A251 CD 87 85         [ 4] 1107 	call CPP 
      00A254 CD 85 58         [ 4] 1108 	call STORE
      00A257 CD 9C 1C         [ 4] 1109 	call UPDATCP 
      00A25A 81               [ 4] 1110 	ret 
                                   1111 
                                   1112 ;-----------------------------
                                   1113 ; move interrupt sub-routine
                                   1114 ; in flash memory
                                   1115 ;----------------------------- 
      00A25B A2 15                 1116 	.word LINK 
                           0021DD  1117 	LINK=. 
      00A25D 06                    1118 	.byte 6
      00A25E 49 46 4D 4F 56 45     1119 	.ascii "IFMOVE" 
      00A264                       1120 IFMOVE:
      00A264 CD 87 36         [ 4] 1121 	call TFLASH 
      00A267 CD 85 6F         [ 4] 1122 	CALL AT 
      00A26A CD 85 24         [ 4] 1123 	CALL QBRAN 
      00A26D A2 0F                 1124 	.word no_move 
      00A26F CD 87 85         [ 4] 1125 	call CPP 
      00A272 CD 85 6F         [ 4] 1126 	call AT 
      00A275 CD 86 16         [ 4] 1127 	call DUPP ; ( udl udl -- )
      00A278 CD 9B D9         [ 4] 1128 	call EEPVP 
      00A27B CD 86 0C         [ 4] 1129 	call DROP
      00A27E CD 85 6F         [ 4] 1130 	call AT  ; ( udl udl a )
      00A281 CD 85 DF         [ 4] 1131 	call TOR 
      00A284 CD A1 80         [ 4] 1132 	call FADDR
      00A287 CD 85 D3         [ 4] 1133 	call RAT ; ( udl ud a -- ) R: a 
      00A28A CC A1 BC         [ 2] 1134 	jp FMOVE2 
                                   1135 
                                   1136 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                           000001  4770 .if WANT_SCALING_CONST 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                                   4771         .include "const_ratio.asm"
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
                                     31 
      00A28D A2 5D                   32         .word LINK 
                           00220F    33         LINK=.
      00A28F 02                      34         .byte 2
      00A290 50 49                   35         .ascii "PI" 
      00A292                         36 PII:
      00A292 1D 00 04         [ 2]   37         subw x,#2*CELLL 
      00A295 90 AE 01 63      [ 2]   38         ldw y,#355 
      00A299 EF 02            [ 2]   39         ldw (2,x),y 
      00A29B 90 AE 00 71      [ 2]   40         ldw y,#113 
      00A29F FF               [ 2]   41         ldw (x),y 
      00A2A0 81               [ 4]   42         ret 
                                     43 
                                     44 ;      SQRT2 ( -- 19601  13860 )
                                     45 ; precision: 1.5e-9 
                                     46 ; usage example to compute Voltage peek to peek from Vrms 
                                     47 ; : VPP SQRT2 */ 2 * ;
                                     48 ;
      00A2A1 A2 8F                   49         .word LINK 
                           002223    50         LINK=.
      00A2A3 05                      51         .byte 5 
      00A2A4 53 51 52 54 32          52         .ascii "SQRT2" 
      00A2A9                         53 SQRT2:
      00A2A9 1D 00 04         [ 2]   54         subw x,#2*CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      00A2AC 90 AE 4C 91      [ 2]   55         ldw y,#19601 
      00A2B0 EF 02            [ 2]   56         ldw (2,x),y 
      00A2B2 90 AE 36 24      [ 2]   57         ldw y,#13860 
      00A2B6 FF               [ 2]   58         ldw (x),y 
      00A2B7 81               [ 4]   59         ret 
                                     60 
                                     61 ;   SQRT3 ( -- 18817 10864 )
                                     62 ; precision: 1.1e-9
                                     63 ;
      00A2B8 A2 A3                   64         .word LINK 
                           00223A    65         LINK=.
      00A2BA 05                      66         .byte 5
      00A2BB 53 51 52 54 33          67         .ascii "SQRT3" 
      00A2C0                         68 SQRT3: 
      00A2C0 1D 00 04         [ 2]   69     subw x,#2*CELLL 
      00A2C3 90 AE 49 81      [ 2]   70     ldw y,#18817 
      00A2C7 EF 02            [ 2]   71     ldw (2,x),y 
      00A2C9 90 AE 2A 70      [ 2]   72     ldw y,#10864 
      00A2CD FF               [ 2]   73     ldw (x),y 
      00A2CE 81               [ 4]   74     ret 
                                     75 
                                     76 ;   E ( -- 28667 10546 )
                                     77 ; precision: 5.5e-9 
                                     78 ; natural log base 
      00A2CF A2 BA                   79         .word LINK 
                           002251    80         LINK=.
      00A2D1 01                      81         .byte 1
      00A2D2 45                      82         .ascii "E" 
      00A2D3                         83 ENEPER:
      00A2D3 1D 00 04         [ 2]   84     subw x,#2*CELLL 
      00A2D6 90 AE 6F FB      [ 2]   85     ldw y,#28667 
      00A2DA EF 02            [ 2]   86     ldw (2,x),y 
      00A2DC 90 AE 29 32      [ 2]   87     ldw y,#10546 
      00A2E0 FF               [ 2]   88     ldw (x),y 
      00A2E1 81               [ 4]   89     ret 
                                     90 
                                     91 ;   SQRT10 ( -- 22936 7253 )
                                     92 ; precision: 5.7e-9 
      00A2E2 A2 D1                   93         .word LINK 
                           002264    94         LINK=.
      00A2E4 06                      95         .byte 6 
      00A2E5 53 51 52 54 31 30       96         .ascii "SQRT10" 
      00A2EB                         97 SQRT10:
      00A2EB 1D 00 04         [ 2]   98     subw x,#2*CELLL
      00A2EE 90 AE 59 98      [ 2]   99     ldw y,#22936 
      00A2F2 EF 02            [ 2]  100     ldw (2,x),y 
      00A2F4 90 AE 1C 55      [ 2]  101     ldw y,#7253
      00A2F8 FF               [ 2]  102     ldw (x),y 
      00A2F9 81               [ 4]  103     ret 
                                    104 
                                    105 ;   12RT2 ( -- 26797 25293 )
                                    106 ; precision: 1.0e-9 
                                    107 ; used in music to compute well tempered scale
      00A2FA A2 E4                  108         .word LINK 
                           00227C   109         LINK=. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      00A2FC 05                     110         .byte 5 
      00A2FD 31 32 52 54 32         111         .ascii "12RT2"
      00A302                        112 RT12_2:
      00A302 1D 00 04         [ 2]  113     subw x,#2*CELLL 
      00A305 90 AE 68 AD      [ 2]  114     ldw y,#26797
      00A309 EF 02            [ 2]  115     ldw (2,x),y 
      00A30B 90 AE 62 CD      [ 2]  116     ldw y,#25293
      00A30F FF               [ 2]  117     ldw (x),y 
      00A310 81               [ 4]  118     ret 
                                    119 
                                    120 ;   LOG2s ( -- 2040 11103 )
                                    121 ; log(2)/1.6384
                                    122 ; precision: 1.1e-8
      00A311 A2 FC                  123         .word LINK 
                           002293   124         LINK=.
      00A313 05                     125         .byte 5 
      00A314 4C 4F 47 32 53         126         .ascii "LOG2S" 
      00A319                        127 LOG2S:
      00A319 1D 00 04         [ 2]  128     subw x,#2*CELLL
      00A31C 90 AE 07 F8      [ 2]  129     ldw y,#2040 
      00A320 EF 02            [ 2]  130     ldw (2,x),y 
      00A322 90 AE 2B 5F      [ 2]  131     ldw y,#11103 
      00A326 FF               [ 2]  132     ldw (x),y 
      00A327 81               [ 4]  133     ret 
                                    134 
                                    135 ;   LN2 ( -- 485 11464 )
                                    136 ; ln(2)/16.384 
                                    137 ; precision: 1.0e-7 
      00A328 A3 13                  138         .word LINK 
                           0022AA   139         LINK=.
      00A32A 04                     140         .byte 4 
      00A32B 4C 4E 32 53            141         .ascii "LN2S" 
      00A32F                        142 LN2S: 
      00A32F 1D 00 04         [ 2]  143     subw x,#2*CELLL
      00A332 90 AE 01 E5      [ 2]  144     ldw y,#485
      00A336 EF 02            [ 2]  145     ldw (2,x),y 
      00A338 90 AE 2C C8      [ 2]  146     ldw y,#11464 
      00A33C FF               [ 2]  147     ldw (x),y 
      00A33D 81               [ 4]  148     ret 
                                    149 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



                                   4772 .endif
                           000001  4773 .if WANT_CONST_TABLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



                                   4774         .include "ctable.asm"
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
      00A33E A3 2A                   32     .word LINK 
                           0022C0    33     LINK=.
      00A340 06                      34     .byte 6
      00A341 43 41 4C 4C 4F 54       35     .ascii "CALLOT"
      00A347                         36 CALLOT:
      00A347 CD 87 85         [ 4]   37     CALL CPP
      00A34A CD 86 16         [ 4]   38     CALL DUPP 
      00A34D CD 85 6F         [ 4]   39     CALL AT 
      00A350 CD 85 DF         [ 4]   40     CALL TOR 
      00A353 CD 8C 1F         [ 4]   41     CALL PSTOR 
      00A356 CD 9C 1C         [ 4]   42     CALL UPDATCP 
      00A359 CD 85 C0         [ 4]   43     CALL RFROM
      00A35C CC 8B AF         [ 2]   44     JP ZERO 
                                     45 
                                     46 ;------------------------------
                                     47 ; create constants bytes table 
                                     48 ; in persistant memory
                                     49 ;  CTABLE ( n+ -- ad ; <string> )
                                     50 ; n+ bytes reserved 
                                     51 ;-----------------------------
      00A35F A3 40                   52     .word LINK 
                           0022E1    53     LINK=.
      00A361 06                      54     .byte 6
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      00A362 43 54 41 42 4C 45       55     .ascii "CTABLE"
      00A368                         56 CTABLE:
      00A368 CD A3 47         [ 4]   57     CALL CALLOT     
      00A36B CC 99 1E         [ 2]   58     JP DCONST 
                                     59      
                                     60 
                                     61 ;--------------------------------
                                     62 ; create constants words table 
                                     63 ; in persistant memory 
                                     64 ; WTABLE ( n+ -- ad ; <string> )
                                     65 ; n+  words reserved  
                                     66 ;--------------------------------
      00A36E A3 61                   67     .word LINK 
                           0022F0    68     LINK=.
      00A370 06                      69     .byte 6
      00A371 57 54 41 42 4C 45       70     .ascii "WTABLE"
      00A377                         71 WTABLE:
      00A377 CD 8B 36         [ 4]   72     CALL CELLS  
      00A37A CD A3 47         [ 4]   73     CALL CALLOT 
      00A37D CC 99 1E         [ 2]   74     JP DCONST 
                                     75 
                                     76 ;---------------------------------
                                     77 ; stack an element of CTABLE 
                                     78 ; CTABL@ ( u ad -- c )
                                     79 ; u element order {0..size-1}
                                     80 ; a|ad table address 
                                     81 ;--------------------------------
      00A380 A3 70                   82     .word LINK 
                           002302    83     LINK=.
      00A382 06                      84     .byte 6
      00A383 43 54 41 42 4C 40       85     .ascii "CTABL@" 
      00A389                         86 CTAT:
      00A389 CD 9B 5F         [ 4]   87     call FPSTOR 
      00A38C CD 9C F1         [ 4]   88     call PTRPLUS 
      00A38F CC 9D 2E         [ 2]   89     jp EE_CREAD 
                                     90 
                                     91 ;---------------------------------
                                     92 ; stack an element of WTABLE 
                                     93 ; WTABL@ ( u ud -- w )
                                     94 ; u is element order {0..size-1}
                                     95 ; a|ud table address 
                                     96 ;----------------------------------
      00A392 A3 82                   97     .word LINK 
                           002314    98     LINK=.
      00A394 06                      99     .byte 6
      00A395 57 54 41 42 4C 40      100     .ascii "WTABL@" 
      00A39B                        101 WTAT:
      00A39B CD 9B 5F         [ 4]  102     call FPSTOR 
      00A39E CD 8B 36         [ 4]  103     call CELLS 
      00A3A1 CD 9C F1         [ 4]  104     call PTRPLUS 
      00A3A4 CD 9D 0C         [ 4]  105     call EE_READ 
      00A3A7 81               [ 4]  106     ret 
                                    107 
                                    108 ;--------------------------
                                    109 ; tool to initialize character table 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



                                    110 ; CTINIT ( ad -- )
                                    111 ; ad is table address 
                                    112 ;--------------------------
      00A3A8 A3 94                  113     .word LINK 
                           00232A   114     LINK=.
      00A3AA 06                     115     .byte 6 
      00A3AB 43 54 49 4E 49 54      116     .ascii "CTINIT"
      00A3B1                        117 CTINIT:
      00A3B1 CD 9B 5F         [ 4]  118     CALL FPSTOR
      00A3B4 CD 9C 9D         [ 4]  119     CALL UNLOCK
      00A3B7 CD 8B AF         [ 4]  120     CALL ZERO 
      00A3BA CD 8B 43         [ 4]  121 1$: CALL ONEP 
      00A3BD CD 86 16         [ 4]  122     CALL DUPP 
      00A3C0 CD A4 0D         [ 4]  123     CALL INTQ 
      00A3C3 CD 85 24         [ 4]  124     CALL QBRAN 
      00A3C6 A3 D0                  125     .word 2$
      00A3C8 CD 9D 48         [ 4]  126     call WR_BYTE 
      00A3CB CD 85 3B         [ 4]  127     CALL BRAN 
      00A3CE A3 BA                  128     .word 1$ 
      00A3D0 CD 88 25         [ 4]  129 2$: CALL DDROP 
      00A3D3 CD 9C C5         [ 4]  130     CALL LOCK 
      00A3D6 81               [ 4]  131     ret 
                                    132 
                                    133 ;--------------------------
                                    134 ; tool to initialize word table 
                                    135 ; WTINIT ( ad -- )
                                    136 ; ad is table address 
                                    137 ;--------------------------
      00A3D7 A3 AA                  138     .word LINK 
                           002359   139     LINK=.
      00A3D9 06                     140     .byte 6 
      00A3DA 57 54 49 4E 49 54      141     .ascii "WTINIT"
      00A3E0                        142 WTINIT:
      00A3E0 CD 9B 5F         [ 4]  143     CALL FPSTOR
      00A3E3 CD 9C 9D         [ 4]  144     CALL UNLOCK
      00A3E6 CD 8B AF         [ 4]  145     CALL ZERO 
      00A3E9 CD 8B 43         [ 4]  146 1$: CALL ONEP 
      00A3EC CD 86 16         [ 4]  147     CALL DUPP
      00A3EF CD A4 0D         [ 4]  148     CALL INTQ
      00A3F2 CD 85 24         [ 4]  149     CALL QBRAN 
      00A3F5 A3 FF                  150     .word 2$
      00A3F7 CD 9D 6D         [ 4]  151     call WR_WORD 
      00A3FA CD 85 3B         [ 4]  152     CALL BRAN 
      00A3FD A3 E9                  153     .word 1$ 
      00A3FF CD 88 25         [ 4]  154 2$: CALL DDROP 
      00A402 CD 9C C5         [ 4]  155     CALL LOCK 
      00A405 81               [ 4]  156     ret 
                                    157 
                                    158 ;------------------------
                                    159 ; Prompted input for integer 
                                    160 ; display n+ in bracket and
                                    161 ; '?' 
                                    162 ; [N]? ( n+ -- a )
                                    163 ;------------------------
      00A406 A3 D9                  164     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



                           002388   165     LINK=.
      00A408 04                     166     .byte 4
      00A409 5B 4E 5D 3F            167     .ascii "[N]?" 
      00A40D                        168 INTQ:
      00A40D CD 8F 3E         [ 4]  169     CALL CR 
      00A410 CD 84 F1         [ 4]  170     call DOLIT 
      00A413 00 5B                  171     .word '[
      00A415 CD 84 B6         [ 4]  172     CALL EMIT 
      00A418 CD 8F F7         [ 4]  173     CALL DOT 
      00A41B CD 8F 7D         [ 4]  174     CALL  DOTQP
      00A41E 03                     175     .byte 3
      00A41F 5D 3F 20               176     .ascii "]? " 
      00A422 CD 93 86         [ 4]  177     CALL QUERY 
      00A425 CD 91 B1         [ 4]  178     call TOKEN 
      00A428 CC A4 B6         [ 2]  179     jp NUMBQ
                                    180 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



                                   4775 .endif
                           000001  4776 .if WANT_DOUBLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



                                   4777         .include "double.asm"
                                      1 ;************************************
                                      2 ;    doubles integers library 
                                      3 ;    doubles are signed 32 bits 
                                      4 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      5 
                                      6 
                                      7     .module DOUBLE 
                                      8 
                                      9 ; check for negative sign 
                                     10 ; ajust pointer and cntr 
      00A42B                         11 nsign: ; a cntr -- a cntr f 
      00A42B CD 8B AF         [ 4]   12     CALL ZERO 
      00A42E CD 85 DF         [ 4]   13     CALL TOR  ; R: sign 
      00A431 CD 85 DF         [ 4]   14     CALL TOR  ; R: sign cntr 
      00A434 CD 86 16         [ 4]   15     CALL DUPP 
      00A437 CD 85 8D         [ 4]   16     CALL CAT 
      0023BA                         17     _DOLIT '-'
      00A43A CD 84 F1         [ 4]    1     CALL DOLIT 
      00A43D 00 2D                    2     .word '-' 
      00A43F CD 88 E6         [ 4]   18     CALL EQUAL 
      0023C2                         19     _QBRAN nsign1 
      00A442 CD 85 24         [ 4]    1     CALL QBRAN
      00A445 A4 5C                    2     .word nsign1
      00A447 CD 8B 43         [ 4]   20     CALL ONEP ; a+ 
      00A44A CD 85 C0         [ 4]   21     CALL RFROM 
      00A44D CD 8B 50         [ 4]   22     CALL ONEM ; cntr-
      00A450 CD 85 C0         [ 4]   23     CALL RFROM ; sign 
      00A453 CD 88 5F         [ 4]   24     CALL INVER ; -1
      00A456 CD 85 DF         [ 4]   25     CALL TOR   ; R: sign 
      00A459 CD 85 DF         [ 4]   26     CALL TOR   ; R: cntr 
      00A45C                         27 nsign1:
      00A45C CD 85 C0         [ 4]   28     CALL RFROM 
      00A45F CD 85 C0         [ 4]   29     CALL RFROM 
      00A462 81               [ 4]   30     RET 
                                     31 
                                     32 
                                     33 ; get all digits in row 
                                     34 ; stop at first non-digit or end of string 
                                     35 ; ( dlo dhi a cntr -- dlo dhi [ a+ cntr- | a+ 0 ] )
      00A463                         36 parse_digits:
      00A463                         37 1$:
      00A463 CD 86 16         [ 4]   38     CALL DUPP 
      0023E6                         39     _QBRAN 5$ 
      00A466 CD 85 24         [ 4]    1     CALL QBRAN
      00A469 A4 AB                    2     .word 5$
      00A46B CD 85 DF         [ 4]   40     CALL TOR   ; dlo dhi a R: cntr 
      00A46E CD 8C 86         [ 4]   41     CALL COUNT ; dlo dhi a+ char 
      00A471 CD 86 E6         [ 4]   42     CALL BASE 
      00A474 CD 85 6F         [ 4]   43     CALL AT 
      00A477 CD 8E 7E         [ 4]   44     CALL DIGTQ 
      0023FA                         45     _QBRAN 4$ ; not a digit
      00A47A CD 85 24         [ 4]    1     CALL QBRAN
      00A47D A4 A2                    2     .word 4$
      00A47F CD A8 66         [ 4]   46     CALL DTOR  ; dlo dhi R: cntr a+ c  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      00A482 CD 86 E6         [ 4]   47     CALL BASE 
      00A485 CD 85 6F         [ 4]   48     CALL AT 
      00A488 CD A6 A0         [ 4]   49     CALL DSSTAR
      00A48B CD 85 C0         [ 4]   50     CALL RFROM 
      00A48E CD 8B AF         [ 4]   51     CALL ZERO 
      00A491 CD AB 60         [ 4]   52     CALL DPLUS 
      00A494 CD 85 C0         [ 4]   53     CALL RFROM  ; dlo dhi a+ 
      00A497 CD 85 C0         [ 4]   54     CALL RFROM ; dlo dhi a+ cntr 
      00A49A CD 8B 50         [ 4]   55     CALL ONEM 
      00241D                         56     _BRAN 1$ ; dlo dhi a+ R: 
      00A49D CD 85 3B         [ 4]    1     CALL BRAN 
      00A4A0 A4 63                    2     .word 1$ 
      00A4A2 CD 86 0C         [ 4]   57 4$: CALL DROP  ; dlo dhi a+ 
      00A4A5 CD 8B 50         [ 4]   58     CALL ONEM  ; unget char 
      00A4A8 CD 85 C0         [ 4]   59     CALL RFROM ; dlo dhi a+ cntr-
      00A4AB                         60 5$:
      00A4AB 81               [ 4]   61     RET 
                                     62 
                                     63 
                                     64 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     65 ;   NUMBER? (a -- s -1 |d -2 | a F )
                                     66 ;   convert string to integer 
                                     67 ;   double begin with '#' 
                                     68 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00242C                         69     _HEADER NUMBQ,7,"NUMBER?"
      00A4AC A4 08                    1         .word LINK 
                           00242E     2         LINK=.
      00A4AE 07                       3         .byte 7  
      00A4AF 4E 55 4D 42 45 52 3F     4         .ascii "NUMBER?"
      00A4B6                          5         NUMBQ:
                                     70 ; save current base value 
      00A4B6 CD 86 E6         [ 4]   71     CALL BASE 
      00A4B9 CD 85 6F         [ 4]   72     CALL AT 
      00A4BC CD 85 DF         [ 4]   73     CALL TOR 
                                     74 ; initialize integer to 0     
      00A4BF 1D 00 04         [ 2]   75     SUBW X,#4 
      00A4C2 90 5F            [ 1]   76     CLRW Y 
      00A4C4 FF               [ 2]   77     LDW (X),Y 
      00A4C5 EF 02            [ 2]   78     LDW (2,X),Y ; a 0 0 R: base  
      002447                         79     _DOLIT 2 
      00A4C7 CD 84 F1         [ 4]    1     CALL DOLIT 
      00A4CA 00 02                    2     .word 2 
      00A4CC CD 8C 08         [ 4]   80     CALL PICK  ; a 0 0 a R: base    
      00A4CF CD 8C 86         [ 4]   81     CALL COUNT ; a 0 0 a+ n 
                                     82 ; check for '#' double integer 
      00A4D2 CD 86 40         [ 4]   83     CALL OVER  ; a 0 0 a+ n a+
      00A4D5 CD 85 8D         [ 4]   84     CALL CAT   ; a 0 0 a+ n c 
      002458                         85     _DOLIT '#' ; a 0 0 a+ n c '#' 
      00A4D8 CD 84 F1         [ 4]    1     CALL DOLIT 
      00A4DB 00 23                    2     .word '#' 
      00A4DD CD 88 E6         [ 4]   86     CALL EQUAL 
      00A4E0 CD 85 DF         [ 4]   87     CALL TOR   ; a 0 0 a+ n R: base d? 
      00A4E3 CD 85 D3         [ 4]   88     CALL RAT   ; a 0 0 a+ n d? R: base d?
      002466                         89     _QBRAN NUMQ0
      00A4E6 CD 85 24         [ 4]    1     CALL QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00A4E9 A4 F7                    2     .word NUMQ0
                                     90 ; update a and count
      00A4EB CD 86 26         [ 4]   91     CALL SWAPP 
      00A4EE CD 8B 43         [ 4]   92     CALL ONEP 
      00A4F1 CD 86 26         [ 4]   93     CALL SWAPP 
      00A4F4 CD 8B 50         [ 4]   94     CALL ONEM  ; a 0 0 a+ n- R: base d?
                                     95 ; check for '$' hexadecimal  
      00A4F7                         96 NUMQ0: 
      00A4F7 CD 86 40         [ 4]   97     CALL OVER   
      00A4FA CD 85 8D         [ 4]   98     CALL CAT   
      00247D                         99     _DOLIT '$'
      00A4FD CD 84 F1         [ 4]    1     CALL DOLIT 
      00A500 00 24                    2     .word '$' 
      00A502 CD 88 E6         [ 4]  100     CALL EQUAL ; a 0 0 a+ n- f  
      002485                        101     _QBRAN NUMQ1 
      00A505 CD 85 24         [ 4]    1     CALL QBRAN
      00A508 A5 19                    2     .word NUMQ1
      00A50A CD 8E 55         [ 4]  102     CALL HEX   ; switch to hexadecimal base 
                                    103 ; update a and count 
      00A50D CD 86 26         [ 4]  104     CALL SWAPP 
      00A510 CD 8B 43         [ 4]  105     CALL ONEP 
      00A513 CD 86 26         [ 4]  106     CALL SWAPP
      00A516 CD 8B 50         [ 4]  107     CALL ONEM ; a 0 0 a+ n-  R: base d?
                                    108 ; check for minus sign 
      00A519                        109 NUMQ1: 
      00A519 CD A4 2B         [ 4]  110     CALL nsign 
      00A51C CD 85 DF         [ 4]  111     CALL TOR ; R: base d? sign  
                                    112 ; check for end of string     
      00A51F CD 87 D3         [ 4]  113     CALL QDUP    ; a dlo dhi a+ cntr R: base d? sign 
      0024A2                        114     _QBRAN NUMQ4 ; yes , not a number 
      00A522 CD 85 24         [ 4]    1     CALL QBRAN
      00A525 A5 67                    2     .word NUMQ4
      00A527 CD A4 63         [ 4]  115     CALL parse_digits
      00A52A CD 87 D3         [ 4]  116     CALL QDUP 
      00A52D CD 86 61         [ 4]  117     CALL ZEQUAL  
      0024B0                        118     _QBRAN NUMQ4 ; error not end of string  ( a dlo dhi a+ R: base d? sign )
      00A530 CD 85 24         [ 4]    1     CALL QBRAN
      00A533 A5 67                    2     .word NUMQ4
      00A535 CD 86 0C         [ 4]  119     CALL DROP  ; a dlo dhi 
      00A538 CD 85 C0         [ 4]  120     CALL RFROM  ; a dlo dhi sign 
      0024BB                        121     _QBRAN NUMQ3
      00A53B CD 85 24         [ 4]    1     CALL QBRAN
      00A53E A5 43                    2     .word NUMQ3
      00A540 CD 88 82         [ 4]  122     CALL DNEGA
      00A543                        123 NUMQ3: 
      00A543 CD 87 E4         [ 4]  124     CALL ROT ; dlo dhi a  R: base d?
      00A546 CD 86 0C         [ 4]  125     CALL DROP
      0024C9                        126     _DOLIT -2  ; double return -2 flag 
      00A549 CD 84 F1         [ 4]    1     CALL DOLIT 
      00A54C FF FE                    2     .word -2 
      00A54E CD 85 C0         [ 4]  127     CALL RFROM ; dlo dhi d? R: base 
      00A551 CD 88 5F         [ 4]  128     CALL INVER 
      0024D4                        129     _QBRAN NUMQ8 
      00A554 CD 85 24         [ 4]    1     CALL QBRAN
      00A557 A5 70                    2     .word NUMQ8
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      00A559 CD 86 26         [ 4]  130     CALL SWAPP 
      00A55C CD 86 0C         [ 4]  131     CALL DROP
      00A55F CD 8B 43         [ 4]  132     CALL ONEP   ; single return -1 flag   
      0024E2                        133     _BRAN NUMQ8
      00A562 CD 85 3B         [ 4]    1     CALL BRAN 
      00A565 A5 70                    2     .word NUMQ8 
      00A567                        134 NUMQ4: ; not end of string error , ( a dlo dhi a+ cntr R: base d? sign )
                           000001   135 .if WANT_FLOAT
      00A567 CD 85 C0         [ 4]  136     CALL RFROM ; sign 
      00A56A CD 85 C0         [ 4]  137     CALL RFROM ; d? 
      00A56D CD AF B2         [ 4]  138     CALL FLOATQ ; ( a dlo dhi a+ cntr sign d? )    
                           000000   139 .else 
                                    140     ADDW X,#4 ; drop dhi a+  , ( a dlo R: base d? sign ) 
                                    141     ADDW SP,#4 ; drop d? sign  R: base 
                                    142     CLRW Y 
                                    143     LDW (X),Y ; dlo replaced by 0 ( -- a 0 R: base ) 
                                    144 .endif 
                                    145 ; restore original base value     
      00A570                        146 NUMQ8: 
      00A570 CD 85 C0         [ 4]  147     CALL RFROM 
      00A573 CD 86 E6         [ 4]  148     CALL BASE 
      00A576 CD 85 58         [ 4]  149     CALL STORE 
      00A579 81               [ 4]  150     RET 
                                    151 
                                    152 
                                    153 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    154 ;    D0= ( d -- 0|-1 )
                                    155 ;    check if double is 0 
                                    156 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0024FA                        157     _HEADER DZEQUAL,3,"D0="
      00A57A A4 AE                    1         .word LINK 
                           0024FC     2         LINK=.
      00A57C 03                       3         .byte 3  
      00A57D 44 30 3D                 4         .ascii "D0="
      00A580                          5         DZEQUAL:
      00A580 CD 86 89         [ 4]  158     CALL ORR 
      00A583 A6 FF            [ 1]  159     LD A,#0xFF
      00A585 90 93            [ 1]  160     LDW Y,X
      00A587 90 FE            [ 2]  161     LDW Y,(Y)
      00A589 90 A3 00 00      [ 2]  162     CPW Y,#0 
      00A58D 27 01            [ 1]  163     JREQ  ZEQ1
      00A58F 4F               [ 1]  164     CLR A   ;false
      00A590                        165 ZEQ1:
      00A590 F7               [ 1]  166     LD     (X),A
      00A591 E7 01            [ 1]  167     LD (1,X),A
      00A593 81               [ 4]  168 	RET     
                                    169     
                                    170 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    171 ;  DNEGATE ( d -- d )
                                    172 ;  negate double (2's complement)
                                    173 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002514                        174     _HEADER DNEGAT,7,"DNEGATE"
      00A594 A5 7C                    1         .word LINK 
                           002516     2         LINK=.
      00A596 07                       3         .byte 7  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00A597 44 4E 45 47 41 54 45     4         .ascii "DNEGATE"
      00A59E                          5         DNEGAT:
      00A59E CD 88 5F         [ 4]  175     CALL INVER
      00A5A1 CD 86 26         [ 4]  176     CALL SWAPP 
      00A5A4 CD 88 5F         [ 4]  177     CALL INVER 
      00A5A7 90 93            [ 1]  178     LDW  Y,X 
      00A5A9 90 FE            [ 2]  179     LDW Y,(Y)
      00A5AB 72 A9 00 01      [ 2]  180     ADDW Y,#1 
      00A5AF FF               [ 2]  181     LDW (X),Y 
      00A5B0 24 0B            [ 1]  182     JRNC DNEG1 
      00A5B2 90 93            [ 1]  183     LDW Y,X 
      00A5B4 90 EE 02         [ 2]  184     LDW Y,(2,Y)
      00A5B7 72 A9 00 01      [ 2]  185     ADDW Y,#1
      00A5BB EF 02            [ 2]  186     LDW (2,X),Y 
      00A5BD                        187 DNEG1:
      00A5BD CD 86 26         [ 4]  188     CALL SWAPP 
      00A5C0 81               [ 4]  189     RET      
                                    190 
                                    191 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    192 ;   DABS ( d -- d )
                                    193 ;   absolute value of double
                                    194 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002541                        195     _HEADER DABS,4,"DABS"
      00A5C1 A5 96                    1         .word LINK 
                           002543     2         LINK=.
      00A5C3 04                       3         .byte 4  
      00A5C4 44 41 42 53              4         .ascii "DABS"
      00A5C8                          5         DABS:
      00A5C8 CD 86 16         [ 4]  196     CALL DUPP 
      00A5CB CD 86 4F         [ 4]  197     CALL ZLESS 
      00254E                        198     _QBRAN DABS1 
      00A5CE CD 85 24         [ 4]    1     CALL QBRAN
      00A5D1 A5 D6                    2     .word DABS1
      00A5D3 CD 88 82         [ 4]  199     CALL DNEGA 
      00A5D6                        200 DABS1:
      00A5D6 81               [ 4]  201     RET 
                                    202 
                                    203 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    204 ;  DSIGN ( d -- d f )
                                    205 ;  sign of double 
                                    206 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002557                        207     _HEADER DSIGN,5,"DSIGN"
      00A5D7 A5 C3                    1         .word LINK 
                           002559     2         LINK=.
      00A5D9 05                       3         .byte 5  
      00A5DA 44 53 49 47 4E           4         .ascii "DSIGN"
      00A5DF                          5         DSIGN:
      00A5DF A6 00            [ 1]  208     LD A,#0 
      00A5E1 90 93            [ 1]  209     LDW Y,X 
      00A5E3 90 FE            [ 2]  210     LDW Y,(Y)
      00A5E5 2A 02            [ 1]  211     JRPL DSIGN1
      00A5E7 A6 FF            [ 1]  212     LD A,#0XFF 
      00A5E9                        213 DSIGN1:
      00A5E9 1D 00 02         [ 2]  214     SUBW X,#2 
      00A5EC F7               [ 1]  215     LD (X),A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00A5ED E7 01            [ 1]  216     LD (1,X),A 
      00A5EF 81               [ 4]  217     RET 
                                    218 
                                    219 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    220 ;   D/MOD ( d s - r qd )
                                    221 ;   unsigned divide double by single 
                                    222 ;   return double quotient 
                                    223 ;   and single remainder 
                                    224 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002570                        225     _HEADER DSLMOD,5,"D/MOD"
      00A5F0 A5 D9                    1         .word LINK 
                           002572     2         LINK=.
      00A5F2 05                       3         .byte 5  
      00A5F3 44 2F 4D 4F 44           4         .ascii "D/MOD"
      00A5F8                          5         DSLMOD:
      00A5F8 90 93            [ 1]  226         LDW     Y,X             ; stack pointer to Y
      00A5FA FE               [ 2]  227         LDW     X,(X)           ; un
      00A5FB BF 26            [ 2]  228         LDW     YTEMP,X         ; save un
      00A5FD 93               [ 1]  229         LDW     X,Y
      00A5FE 89               [ 2]  230         PUSHW   X               ; save stack pointer
      00A5FF 90 89            [ 2]  231         PUSHW   Y 
      00A601 EE 02            [ 2]  232         LDW     X,(2,X)           ; X=udh
      00A603 90 BE 26         [ 2]  233         LDW     Y,YTEMP         ; divisor 
      00A606 65               [ 2]  234         DIVW    X,Y 
      00A607 BF 24            [ 2]  235         LDW     XTEMP,X         ; QUOTIENT hi 
      00A609 93               [ 1]  236         LDW     X,Y             ; remainder in X 
      00A60A 90 85            [ 2]  237         POPW    Y 
      00A60C 90 EE 04         [ 2]  238         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      00A60F A6 10            [ 1]  239         LD      A,#16           ; loop count
      00A611 90 58            [ 2]  240         SLLW    Y               ; udl shift udl into udh
      00A613                        241 DSLMOD3:
      00A613 59               [ 2]  242         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      00A614 25 04            [ 1]  243         JRC     DSLMODa         ; if carry out of rotate
      00A616 B3 26            [ 2]  244         CPW     X,YTEMP         ; compare udh to un
      00A618 25 05            [ 1]  245         JRULT   DSLMOD4         ; can't subtract
      00A61A                        246 DSLMODa:
      00A61A 72 B0 00 26      [ 2]  247         SUBW    X,YTEMP         ; can subtract
      00A61E 98               [ 1]  248         RCF
      00A61F                        249 DSLMOD4:
      00A61F 8C               [ 1]  250         CCF                     ; quotient bit
      00A620 90 59            [ 2]  251         RLCW    Y               ; rotate into quotient, rotate out udl
      00A622 4A               [ 1]  252         DEC     A               ; repeat
      00A623 26 EE            [ 1]  253         JRNE    DSLMOD3           ; if A == 0
      00A625                        254 DSLMODb:
      00A625 BF 26            [ 2]  255         LDW     YTEMP,X         ; done, save remainder
      00A627 85               [ 2]  256         POPW    X               ; restore stack pointer
      00A628 EF 02            [ 2]  257         LDW     (2,X),Y           ; save quotient low 
      00A62A 90 BE 24         [ 2]  258         LDW     Y,XTEMP         ; quotient hi 
      00A62D FF               [ 2]  259         LDW     (X),Y           ; save quotient hi 
      00A62E 90 BE 26         [ 2]  260         LDW     Y,YTEMP         ; remainder onto stack
      00A631 EF 04            [ 2]  261         LDW     (4,X),Y
      00A633 81               [ 4]  262         RET 
                                    263 
                                    264 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    265 ;   D# ( d -- d )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



                                    266 ;   extract least digit 
                                    267 ;   from double integer 
                                    268 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025B4                        269     _HEADER DDIG,2,"D#"
      00A634 A5 F2                    1         .word LINK 
                           0025B6     2         LINK=.
      00A636 02                       3         .byte 2  
      00A637 44 23                    4         .ascii "D#"
      00A639                          5         DDIG:
      00A639 CD 86 E6         [ 4]  270     CALL BASE 
      00A63C CD 85 6F         [ 4]  271     CALL AT 
      00A63F CD A5 F8         [ 4]  272     CALL DSLMOD
      00A642 CD 87 E4         [ 4]  273     CALL ROT   
      00A645 CD 8D 7E         [ 4]  274     CALL DIGIT 
      00A648 CD 8D CA         [ 4]  275     CALL HOLD 
      00A64B 81               [ 4]  276     RET 
                                    277 
                                    278 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    279 ;    D#S ( d -- s )
                                    280 ;   extract digit from double 
                                    281 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025CC                        282     _HEADER DDIGS,3,"D#S"
      00A64C A6 36                    1         .word LINK 
                           0025CE     2         LINK=.
      00A64E 03                       3         .byte 3  
      00A64F 44 23 53                 4         .ascii "D#S"
      00A652                          5         DDIGS:
      00A652 CD A6 39         [ 4]  283     CALL    DDIG 
      00A655 CD 88 30         [ 4]  284     CALL    DDUP 
      00A658 CD A5 80         [ 4]  285     CALL    DZEQUAL
      0025DB                        286     _QBRAN  DDIGS 
      00A65B CD 85 24         [ 4]    1     CALL QBRAN
      00A65E A6 52                    2     .word DDIGS
      00A660 CD 86 0C         [ 4]  287     CALL    DROP 
      00A663 81               [ 4]  288     RET 
                                    289 
                                    290 
                                    291 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    292 ;   D. ( d -- )
                                    293 ;   display double integer 
                                    294 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025E4                        295     _HEADER DDOT,2,"D."
      00A664 A6 4E                    1         .word LINK 
                           0025E6     2         LINK=.
      00A666 02                       3         .byte 2  
      00A667 44 2E                    4         .ascii "D."
      00A669                          5         DDOT:
      00A669 CD 8E F6         [ 4]  296     CALL SPACE 
      00A66C CD A5 DF         [ 4]  297     CALL DSIGN 
      00A66F CD 85 DF         [ 4]  298     CALL TOR
      00A672 CD 85 D3         [ 4]  299     CALL RAT 
      0025F5                        300     _QBRAN DDOT0
      00A675 CD 85 24         [ 4]    1     CALL QBRAN
      00A678 A6 7D                    2     .word DDOT0
      00A67A CD 88 82         [ 4]  301     CALL DNEGA 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00A67D                        302 DDOT0:     
      00A67D CD 8D BA         [ 4]  303     CALL BDIGS 
      00A680 CD A6 52         [ 4]  304     CALL DDIGS 
      00A683 CD 85 C0         [ 4]  305     CALL RFROM 
      002606                        306     _QBRAN DDOT1 
      00A686 CD 85 24         [ 4]    1     CALL QBRAN
      00A689 A6 93                    2     .word DDOT1
      00260B                        307     _DOLIT '-' 
      00A68B CD 84 F1         [ 4]    1     CALL DOLIT 
      00A68E 00 2D                    2     .word '-' 
      00A690 CD 8D CA         [ 4]  308     CALL HOLD 
      00A693                        309 DDOT1: 
      00A693 CD 8E 1F         [ 4]  310     CALL EDIGS 
      00A696 CD 8F 20         [ 4]  311     CALL TYPES     
      00A699 81               [ 4]  312     RET 
                                    313 
                                    314 
                                    315 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    316 ; multiply double by single 
                                    317 ; return double 
                                    318 ;  ( d s -- d )
                                    319 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00261A                        320     _HEADER DSSTAR,3,"DS*"
      00A69A A6 66                    1         .word LINK 
                           00261C     2         LINK=.
      00A69C 03                       3         .byte 3  
      00A69D 44 53 2A                 4         .ascii "DS*"
      00A6A0                          5         DSSTAR:
                                    321 ;DSSTAR:
      00A6A0 CD 85 DF         [ 4]  322     CALL TOR
      00A6A3 CD 86 16         [ 4]  323     CALL DUPP 
      00A6A6 CD 86 4F         [ 4]  324     CALL ZLESS
      00A6A9 CD 86 16         [ 4]  325     CALL DUPP 
      00A6AC CD 85 DF         [ 4]  326     CALL TOR 
      00262F                        327     _QBRAN DSSTAR1 
      00A6AF CD 85 24         [ 4]    1     CALL QBRAN
      00A6B2 A6 B7                    2     .word DSSTAR1
      00A6B4 CD 88 82         [ 4]  328     CALL DNEGA 
      00A6B7                        329 DSSTAR1:
      00A6B7 CD 85 C0         [ 4]  330     CALL RFROM 
      00A6BA CD 88 03         [ 4]  331     CALL NROT       
      00A6BD CD 86 26         [ 4]  332     CALL SWAPP 
      00A6C0 CD 85 D3         [ 4]  333     CALL RAT 
      00A6C3 CD 8A 78         [ 4]  334     CALL UMSTA
      00A6C6 CD 87 E4         [ 4]  335     CALL ROT 
      00A6C9 CD 85 C0         [ 4]  336     CALL RFROM 
      00A6CC CD 8A 78         [ 4]  337     CALL UMSTA 
      00A6CF CD 86 0C         [ 4]  338     CALL DROP ; DROP OVERFLOW 
      00A6D2 CD 88 45         [ 4]  339     CALL PLUS 
      00A6D5 CD 87 E4         [ 4]  340     CALL ROT 
      002658                        341     _QBRAN DSSTAR3 
      00A6D8 CD 85 24         [ 4]    1     CALL QBRAN
      00A6DB A6 E0                    2     .word DSSTAR3
      00A6DD CD 88 82         [ 4]  342     CALL DNEGA 
      00A6E0                        343 DSSTAR3:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      00A6E0 81               [ 4]  344     RET 
                                    345 
                                    346 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    347 ;  2SWAP ( d1 d2 -- d2 d1 )
                                    348 ;  swap double 
                                    349 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002661                        350     _HEADER DSWAP,5,"2SWAP"
      00A6E1 A6 9C                    1         .word LINK 
                           002663     2         LINK=.
      00A6E3 05                       3         .byte 5  
      00A6E4 32 53 57 41 50           4         .ascii "2SWAP"
      00A6E9                          5         DSWAP:
      00A6E9 90 93            [ 1]  351     LDW Y,X 
      00A6EB 90 FE            [ 2]  352     LDW Y,(Y)
      00A6ED 90 BF 26         [ 2]  353     LDW YTEMP,Y ; d2 hi 
      00A6F0 90 93            [ 1]  354     LDW Y,X 
      00A6F2 90 EE 02         [ 2]  355     LDW Y,(2,Y)
      00A6F5 90 BF 24         [ 2]  356     LDW XTEMP,Y  ; d2 lo 
      00A6F8 90 93            [ 1]  357     LDW Y,X 
      00A6FA 90 EE 04         [ 2]  358     LDW Y,(4,Y)  ; d1 hi 
      00A6FD FF               [ 2]  359     LDW (X),Y 
      00A6FE 90 93            [ 1]  360     LDW Y,X
      00A700 90 EE 06         [ 2]  361     LDW Y,(6,Y)  ; d1 lo 
      00A703 EF 02            [ 2]  362     LDW (2,X),Y
      00A705 90 BE 26         [ 2]  363     LDW Y,YTEMP  
      00A708 EF 04            [ 2]  364     LDW (4,X),Y 
      00A70A 90 BE 24         [ 2]  365     LDW Y,XTEMP 
      00A70D EF 06            [ 2]  366     LDW (6,X),Y 
      00A70F 81               [ 4]  367     RET 
                                    368 
                                    369 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    370 ;    DCLZ ( d -- u )
                                    371 ;    double count leading zeros
                                    372 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002690                        373     _HEADER DCLZ,4,"DCLZ"
      00A710 A6 E3                    1         .word LINK 
                           002692     2         LINK=.
      00A712 04                       3         .byte 4  
      00A713 44 43 4C 5A              4         .ascii "DCLZ"
      00A717                          5         DCLZ:
      00A717 4F               [ 1]  374     CLR A 
      00A718 90 93            [ 1]  375     LDW Y,X 
      00A71A 90 FE            [ 2]  376     LDW Y,(Y)
      00A71C 2B 18            [ 1]  377     JRMI DCLZ8 ; no leading zero 
      00A71E 27 09            [ 1]  378     JREQ DCLZ4 ; >=16 
      00A720                        379 DCLZ1: ; <16
      00A720 90 58            [ 2]  380     SLLW Y
      00A722 4C               [ 1]  381     INC A 
      00A723 90 5D            [ 2]  382     TNZW Y 
      00A725 2B 0F            [ 1]  383     JRMI DCLZ8
      00A727 20 F7            [ 2]  384     JRA DCLZ1 
      00A729                        385 DCLZ4:
      00A729 A6 10            [ 1]  386     LD A,#16 
      00A72B 90 93            [ 1]  387     LDW Y,X 
      00A72D 90 EE 02         [ 2]  388     LDW Y,(2,Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      00A730 2B 04            [ 1]  389     JRMI DCLZ8 
      00A732 26 EC            [ 1]  390     JRNE DCLZ1 
      00A734 AB 10            [ 1]  391     ADD A,#16
      00A736                        392 DCLZ8: 
      00A736 1C 00 02         [ 2]  393     ADDW X,#2 
      00A739 90 5F            [ 1]  394     CLRW Y 
      00A73B 90 97            [ 1]  395     LD YL,A 
      00A73D FF               [ 2]  396     LDW (X),Y 
      00A73E 81               [ 4]  397     RET 
                                    398 
                                    399 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    400 ;   2<ROT ( d1 d2 d3 -- d3 d1 d2 )
                                    401 ;   rotate left doubles 
                                    402 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026BF                        403     _HEADER NDROT,5,"2<ROT"
      00A73F A7 12                    1         .word LINK 
                           0026C1     2         LINK=.
      00A741 05                       3         .byte 5  
      00A742 32 3C 52 4F 54           4         .ascii "2<ROT"
      00A747                          5         NDROT:
                                    404 ; save d3 in temp 
      00A747 90 93            [ 1]  405     LDW Y,X 
      00A749 90 FE            [ 2]  406     LDW Y,(Y)
      00A74B 90 BF 26         [ 2]  407     LDW YTEMP,Y  ; d3 hi 
      00A74E 90 93            [ 1]  408     LDW Y,X 
      00A750 90 EE 02         [ 2]  409     LDW Y,(2,Y)
      00A753 90 BF 24         [ 2]  410     LDW XTEMP,Y  ; d3 lo 
                                    411 ; put d2 in d1 slot 
      00A756 90 93            [ 1]  412     LDW Y,X 
      00A758 90 EE 04         [ 2]  413     LDW Y,(4,Y) 
      00A75B FF               [ 2]  414     LDW (X),Y   ; d2 hi 
      00A75C 90 93            [ 1]  415     LDW Y,X 
      00A75E 90 EE 06         [ 2]  416     LDW Y,(6,Y)
      00A761 EF 02            [ 2]  417     LDW (2,X),Y ; d2 lo
                                    418 ; put d1 in d2 slot 
      00A763 90 93            [ 1]  419     LDW Y,X 
      00A765 90 EE 08         [ 2]  420     LDW Y,(8,Y) 
      00A768 EF 04            [ 2]  421     LDW (4,X),Y ; d1 hi 
      00A76A 90 93            [ 1]  422     LDW Y,X 
      00A76C 90 EE 0A         [ 2]  423     LDW Y,(10,Y)
      00A76F EF 06            [ 2]  424     LDW (6,X),Y  ; d1 lo 
                                    425 ; put d3 in d1 slot 
      00A771 90 BE 26         [ 2]  426     LDW Y,YTEMP 
      00A774 EF 08            [ 2]  427     LDW (8,X),Y  ; d3 hi 
      00A776 90 BE 24         [ 2]  428     LDW Y,XTEMP 
      00A779 EF 0A            [ 2]  429     LDW (10,X),Y  ; d3 lo 
      00A77B 81               [ 4]  430     RET 
                                    431 
                                    432 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    433 ;   2ROT ( d1 d2 d3 -- d2 d3 d1 )
                                    434 ;   rotate right doubles 
                                    435 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026FC                        436     _HEADER DROT,4,"2ROT"
      00A77C A7 41                    1         .word LINK 
                           0026FE     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      00A77E 04                       3         .byte 4  
      00A77F 32 52 4F 54              4         .ascii "2ROT"
      00A783                          5         DROT:
                                    437 ; save d3 in temp 
      00A783 90 93            [ 1]  438     LDW Y,X 
      00A785 90 FE            [ 2]  439     LDW Y,(Y)
      00A787 90 BF 26         [ 2]  440     LDW YTEMP,Y ; d3 hi 
      00A78A 90 93            [ 1]  441     LDW Y,X 
      00A78C 90 EE 02         [ 2]  442     LDW Y,(2,Y)
      00A78F 90 BF 24         [ 2]  443     LDW XTEMP,Y ; d3 lo 
                                    444 ; put d1 in d3 slot 
      00A792 90 93            [ 1]  445     LDW Y,X 
      00A794 90 EE 08         [ 2]  446     LDW Y,(8,Y)
      00A797 FF               [ 2]  447     LDW (X),Y  ; d1 hi 
      00A798 90 93            [ 1]  448     LDW Y,X 
      00A79A 90 EE 0A         [ 2]  449     LDW Y,(10,Y) 
      00A79D EF 02            [ 2]  450     LDW (2,X),Y ; d1 lo 
                                    451 ; put d2 in d1 slot 
      00A79F 90 93            [ 1]  452     LDW Y,X 
      00A7A1 90 EE 04         [ 2]  453     LDW Y,(4,Y) ; d2 hi 
      00A7A4 EF 08            [ 2]  454     LDW (8,X),Y 
      00A7A6 90 93            [ 1]  455     LDW Y,X 
      00A7A8 90 EE 06         [ 2]  456     LDW Y,(6,Y) ; d2 lo 
      00A7AB EF 0A            [ 2]  457     LDW (10,X),Y 
                                    458 ; put d3 in d2 slot 
      00A7AD 90 BE 26         [ 2]  459     LDW Y,YTEMP 
      00A7B0 EF 04            [ 2]  460     LDW (4,X),Y 
      00A7B2 90 BE 24         [ 2]  461     LDW Y,XTEMP 
      00A7B5 EF 06            [ 2]  462     LDW (6,X),Y 
      00A7B7 81               [ 4]  463     RET 
                                    464 
                                    465 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    466 ;   D= ( d1 d2 -- f )
                                    467 ;   d1==d2?
                                    468 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002738                        469     _HEADER DEQUAL,2,"D="
      00A7B8 A7 7E                    1         .word LINK 
                           00273A     2         LINK=.
      00A7BA 02                       3         .byte 2  
      00A7BB 44 3D                    4         .ascii "D="
      00A7BD                          5         DEQUAL:
      00A7BD A6 00            [ 1]  470     LD A,#0 
      00A7BF 90 93            [ 1]  471     LDW Y,X 
      00A7C1 90 FE            [ 2]  472     LDW Y,(Y)
      00A7C3 E3 04            [ 2]  473     CPW Y,(4,X)
      00A7C5 26 0B            [ 1]  474     JRNE DEQU4 
      00A7C7 90 93            [ 1]  475     LDW Y,X 
      00A7C9 90 EE 02         [ 2]  476     LDW Y,(2,Y)
      00A7CC E3 06            [ 2]  477     CPW Y,(6,X)
      00A7CE 26 02            [ 1]  478     JRNE DEQU4 
      00A7D0 A6 FF            [ 1]  479     LD A,#0XFF
      00A7D2                        480 DEQU4:
      00A7D2 1C 00 06         [ 2]  481     ADDW X,#6
      00A7D5 F7               [ 1]  482     LD (X),A 
      00A7D6 E7 01            [ 1]  483     LD (1,X),A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      00A7D8 81               [ 4]  484     RET 
                                    485 
                                    486 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    487 ;   D> ( d1 d2 -- f )
                                    488 ;   d1>d2?
                                    489 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002759                        490     _HEADER DGREAT,2,"D>"
      00A7D9 A7 BA                    1         .word LINK 
                           00275B     2         LINK=.
      00A7DB 02                       3         .byte 2  
      00A7DC 44 3E                    4         .ascii "D>"
      00A7DE                          5         DGREAT:
      00A7DE A6 FF            [ 1]  491     LD A,#0XFF 
      00A7E0 90 93            [ 1]  492     LDW Y,X 
      00A7E2 90 EE 04         [ 2]  493     LDW Y,(4,Y)  ; d1 hi 
      00A7E5 F3               [ 2]  494     CPW Y,(X)    ; d2 hi 
      00A7E6 2C 0B            [ 1]  495     JRSGT DGREAT4 
      00A7E8 90 93            [ 1]  496     LDW Y,X 
      00A7EA 90 EE 06         [ 2]  497     LDW Y,(6,Y)
      00A7ED E3 02            [ 2]  498     CPW Y,(2,X)
      00A7EF 22 02            [ 1]  499     JRUGT DGREAT4 
      00A7F1 A6 00            [ 1]  500     LD A,#0
      00A7F3                        501 DGREAT4:
      00A7F3 1C 00 06         [ 2]  502     ADDW X,#6
      00A7F6 F7               [ 1]  503     LD (X),A 
      00A7F7 E7 01            [ 1]  504     LD (1,X),A 
      00A7F9 81               [ 4]  505     RET
                                    506 
                                    507 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    508 ;   D< ( d1 d2 -- f )
                                    509 ;   d1<d2? 
                                    510 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00277A                        511     _HEADER DLESS,2,"D<"
      00A7FA A7 DB                    1         .word LINK 
                           00277C     2         LINK=.
      00A7FC 02                       3         .byte 2  
      00A7FD 44 3C                    4         .ascii "D<"
      00A7FF                          5         DLESS:
      00A7FF CD AB 92         [ 4]  512     CALL DSUB
      002782                        513     _DOLIT 0 
      00A802 CD 84 F1         [ 4]    1     CALL DOLIT 
      00A805 00 00                    2     .word 0 
      00A807 CD 88 03         [ 4]  514     CALL NROT  
      00A80A CD A8 1C         [ 4]  515     CALL DZLESS 
      00278D                        516     _QBRAN DLESS4
      00A80D CD 85 24         [ 4]    1     CALL QBRAN
      00A810 A8 15                    2     .word DLESS4
      00A812 CD 88 5F         [ 4]  517     CALL INVER  
      00A815                        518 DLESS4:
      00A815 81               [ 4]  519     RET
                                    520 
                                    521 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    522 ;  D0< ( d -- f )
                                    523 ;  d<0? 
                                    524 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      002796                        525     _HEADER DZLESS,3,"D0<"
      00A816 A7 FC                    1         .word LINK 
                           002798     2         LINK=.
      00A818 03                       3         .byte 3  
      00A819 44 30 3C                 4         .ascii "D0<"
      00A81C                          5         DZLESS:
      00A81C A6 00            [ 1]  526     LD A,#0 
      00A81E 90 93            [ 1]  527     LDW Y,X 
      00A820 90 FE            [ 2]  528     LDW Y,(Y)
      00A822 2A 02            [ 1]  529     JRPL DZLESS1 
      00A824 A6 FF            [ 1]  530     LD A,#0XFF 
      00A826                        531 DZLESS1:
      00A826 1C 00 02         [ 2]  532     ADDW X,#2 
      00A829 F7               [ 1]  533     LD (X),A 
      00A82A E7 01            [ 1]  534     LD (1,X),A    
      00A82C 81               [ 4]  535     RET 
                                    536 
                                    537 
                                    538 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    539 ;  DCMP ( d1 d2 -- d1 d2 -1|0|1 )
                                    540 ; compare 2 doubles 
                                    541 ; keep the doubles 
                                    542 ; return flag: 
                                    543 ;    -1 if d1<d2 
                                    544 ;     0 if d1==d2
                                    545 ;     1 if d1>d2 
                                    546 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027AD                        547     _HEADER DCMP,4,"DCMP"
      00A82D A8 18                    1         .word LINK 
                           0027AF     2         LINK=.
      00A82F 04                       3         .byte 4  
      00A830 44 43 4D 50              4         .ascii "DCMP"
      00A834                          5         DCMP:
      00A834 90 93            [ 1]  548     LDW Y,X 
      00A836 90 EE 04         [ 2]  549     LDW Y,(4,Y)
      00A839 F3               [ 2]  550     CPW Y,(X) 
      00A83A 27 04            [ 1]  551     JREQ DCMP2 
      00A83C 2F 13            [ 1]  552     JRSLT DCMP_SMALL 
      00A83E 20 17            [ 2]  553     JRA  DCMP_GREAT 
      00A840                        554 DCMP2:    
      00A840 90 93            [ 1]  555     LDW Y,X 
      00A842 90 EE 06         [ 2]  556     LDW Y,(6,Y)
      00A845 E3 02            [ 2]  557     CPW Y,(2,X)
      00A847 27 04            [ 1]  558     JREQ DCMP_EQUAL  
      00A849 25 06            [ 1]  559     JRULT DCMP_SMALL 
      00A84B 20 0A            [ 2]  560     JRA DCMP_GREAT
      00A84D                        561 DCMP_EQUAL:
      00A84D 90 5F            [ 1]  562     CLRW Y 
      00A84F 20 0A            [ 2]  563     JRA DCMP4 
      00A851                        564 DCMP_SMALL:
      00A851 90 AE FF FF      [ 2]  565     LDW Y,#-1 
      00A855 20 04            [ 2]  566     JRA DCMP4 
      00A857                        567 DCMP_GREAT:
      00A857 90 AE 00 01      [ 2]  568     LDW Y,#1
      00A85B                        569 DCMP4:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      00A85B 1D 00 02         [ 2]  570     SUBW X,#2 
      00A85E FF               [ 2]  571     LDW (X),Y 
      00A85F 81               [ 4]  572     RET
                                    573 
                                    574 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    575 ;   2>R ( d -- R: d )
                                    576 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027E0                        577     _HEADER DTOR,3,"2>R"
      00A860 A8 2F                    1         .word LINK 
                           0027E2     2         LINK=.
      00A862 03                       3         .byte 3  
      00A863 32 3E 52                 4         .ascii "2>R"
      00A866                          5         DTOR:
      00A866 90 85            [ 2]  578     POPW Y 
      00A868 90 BF 26         [ 2]  579     LDW YTEMP,Y 
      00A86B 90 93            [ 1]  580     LDW Y,X 
      00A86D 90 EE 02         [ 2]  581     LDW Y,(2,Y)
      00A870 90 89            [ 2]  582     PUSHW Y   ; d low 
      00A872 90 93            [ 1]  583     LDW Y,X 
      00A874 90 FE            [ 2]  584     LDW Y,(Y)
      00A876 90 89            [ 2]  585     PUSHW Y   ; d hi 
      00A878 1C 00 04         [ 2]  586     ADDW X,#4  
      00A87B 92 CC 26         [ 5]  587     JP [YTEMP]
                                    588 
                                    589 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    590 ;  2R> ( -- d ) R: d --      
                                    591 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027FE                        592     _HEADER DRFROM,3,"2R>"
      00A87E A8 62                    1         .word LINK 
                           002800     2         LINK=.
      00A880 03                       3         .byte 3  
      00A881 32 52 3E                 4         .ascii "2R>"
      00A884                          5         DRFROM:
      00A884 90 85            [ 2]  593     POPW Y      ; d hi 
      00A886 90 BF 26         [ 2]  594     LDW YTEMP,Y 
      00A889 1D 00 04         [ 2]  595     SUBW X,#4
      00A88C 90 85            [ 2]  596     POPW Y       ; d hi 
      00A88E FF               [ 2]  597     LDW (X),Y 
      00A88F 90 85            [ 2]  598     POPW Y       ; d low  
      00A891 EF 02            [ 2]  599     LDW (2,X),Y 
      00A893 92 CC 26         [ 5]  600     JP [YTEMP]
                                    601     
                                    602 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    603 ;   2R@ ( -- d )
                                    604 ;   fecth a double from RSTACK
                                    605 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002816                        606     _HEADER DRAT,3,"2R@"
      00A896 A8 80                    1         .word LINK 
                           002818     2         LINK=.
      00A898 03                       3         .byte 3  
      00A899 32 52 40                 4         .ascii "2R@"
      00A89C                          5         DRAT:
      00A89C 90 85            [ 2]  607     POPW Y 
      00A89E 90 BF 26         [ 2]  608     LDW YTEMP,Y 
      00A8A1 1D 00 04         [ 2]  609     SUBW X,#4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      00A8A4 16 01            [ 2]  610     LDW Y,(1,SP)
      00A8A6 FF               [ 2]  611     LDW (X),Y 
      00A8A7 16 03            [ 2]  612     LDW Y,(3,SP)
      00A8A9 EF 02            [ 2]  613     LDW (2,X),Y 
      00A8AB 92 CC 26         [ 5]  614     JP [YTEMP]
                                    615 
                                    616 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    617 ;  2VARIABLE <name> 
                                    618 ;  create a double variable 
                                    619 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00282E                        620     _HEADER DVARIA,9,"2VARIABLE"
      00A8AE A8 98                    1         .word LINK 
                           002830     2         LINK=.
      00A8B0 09                       3         .byte 9  
      00A8B1 32 56 41 52 49 41 42     4         .ascii "2VARIABLE"
             4C 45
      00A8BA                          5         DVARIA:
      00A8BA CD 8C 9D         [ 4]  621         CALL HERE
      00A8BD CD 86 16         [ 4]  622         CALL DUPP
      002840                        623         _DOLIT 4  
      00A8C0 CD 84 F1         [ 4]    1     CALL DOLIT 
      00A8C3 00 04                    2     .word 4 
      00A8C5 CD 88 45         [ 4]  624         CALL PLUS 
      00A8C8 CD 87 77         [ 4]  625         CALL VPP 
      00A8CB CD 85 58         [ 4]  626         CALL STORE
      00A8CE CD 98 85         [ 4]  627         CALL CREAT
      00A8D1 CD 86 16         [ 4]  628         CALL DUPP
      00A8D4 CD 94 F7         [ 4]  629         CALL COMMA
      00A8D7 CD 8B AF         [ 4]  630         CALL ZERO
      00A8DA CD 86 40         [ 4]  631         CALL OVER 
      00A8DD CD 85 58         [ 4]  632         CALL STORE 
      00A8E0 CD 8B AF         [ 4]  633         CALL ZERO 
      00A8E3 CD 86 26         [ 4]  634         CALL SWAPP 
      00A8E6 CD 85 58         [ 4]  635         CALL STORE
      00A8E9 CD A1 8B         [ 4]  636         CALL FMOVE ; move definition to FLASH
      00A8EC CD 87 D3         [ 4]  637         CALL QDUP 
      00A8EF CD 85 24         [ 4]  638         CALL QBRAN 
      00A8F2 98 D2                  639         .word SET_RAMLAST   
      00A8F4 CD 9C 33         [ 4]  640         call UPDATVP  ; don't update if variable kept in RAM.
      00A8F7 CD A2 1F         [ 4]  641         CALL UPDATPTR
      00A8FA 81               [ 4]  642         RET         
                                    643 
                                    644 
                                    645 
                                    646 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    647 ;  2LITERAL ( d -- )
                                    648 ;  compile double literal 
                                    649 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00287B                        650     _HEADER DLITER,IMEDD+8,"2LITERAL"
      00A8FB A8 B0                    1         .word LINK 
                           00287D     2         LINK=.
      00A8FD 88                       3         .byte IMEDD+8  
      00A8FE 32 4C 49 54 45 52 41     4         .ascii "2LITERAL"
             4C
      00A906                          5         DLITER:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      00A906 CD 95 3C         [ 4]  651     CALL COMPI 
      00A909 A9 11                  652     .word do2lit 
      00A90B CD 94 F7         [ 4]  653     CALL COMMA 
      00A90E CC 94 F7         [ 2]  654     JP   COMMA 
                                    655 
                                    656 
                                    657 ; runtime for 2LITERAL 
      00A911                        658 do2lit:
      00A911 1D 00 04         [ 2]  659     SUBW X,#4 
      00A914 16 01            [ 2]  660     LDW Y,(1,SP)
      00A916 90 FE            [ 2]  661     LDW Y,(Y)
      00A918 FF               [ 2]  662     LDW (X),Y 
      00A919 16 01            [ 2]  663     LDW Y,(1,SP)
      00A91B 90 EE 02         [ 2]  664     LDW Y,(2,Y)
      00A91E EF 02            [ 2]  665     LDW (2,X),Y 
      00A920 90 85            [ 2]  666     POPW Y 
      00A922 90 EC 04         [ 2]  667     JP (4,Y)
                                    668 
                                    669 
                                    670 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    671 ;   2OVER ( d1 d2 -- d1 d2 d1 )
                                    672 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028A5                        673     _HEADER DOVER,5,"2OVER"
      00A925 A8 FD                    1         .word LINK 
                           0028A7     2         LINK=.
      00A927 05                       3         .byte 5  
      00A928 32 4F 56 45 52           4         .ascii "2OVER"
      00A92D                          5         DOVER:
      00A92D 90 93            [ 1]  674     LDW Y,X 
      00A92F 1D 00 04         [ 2]  675     SUBW X,#4 
      00A932 90 89            [ 2]  676     PUSHW Y 
      00A934 90 EE 04         [ 2]  677     LDW Y,(4,Y)  ; d1 hi 
      00A937 FF               [ 2]  678     LDW (X),Y 
      00A938 90 85            [ 2]  679     POPW Y 
      00A93A 90 EE 06         [ 2]  680     LDW Y,(6,Y)  ;d1 lo 
      00A93D EF 02            [ 2]  681     LDW (2,X),Y 
      00A93F 81               [ 4]  682     RET 
                                    683 
                                    684 
                                    685 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    686 ;   D2/ ( d -- d/2 )
                                    687 ;   divide double by 2 
                                    688 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028C0                        689     _HEADER D2SLASH,3,"D2/"
      00A940 A9 27                    1         .word LINK 
                           0028C2     2         LINK=.
      00A942 03                       3         .byte 3  
      00A943 44 32 2F                 4         .ascii "D2/"
      00A946                          5         D2SLASH:
      00A946 90 93            [ 1]  690     LDW Y,X 
      00A948 90 FE            [ 2]  691     LDW Y,(Y)
      00A94A 90 57            [ 2]  692     SRAW Y 
      00A94C FF               [ 2]  693     LDW (X),Y 
      00A94D 90 93            [ 1]  694     LDW Y,X 
      00A94F 90 EE 02         [ 2]  695     LDW Y,(2,Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      00A952 90 56            [ 2]  696     RRCW Y 
      00A954 EF 02            [ 2]  697     LDW (2,X),Y 
      00A956 81               [ 4]  698     RET
                                    699 
                                    700 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    701 ;  D2* ( d -- d*2 )
                                    702 ;  multiply double by 2 
                                    703 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028D7                        704     _HEADER D2STAR,3,"D2*"
      00A957 A9 42                    1         .word LINK 
                           0028D9     2         LINK=.
      00A959 03                       3         .byte 3  
      00A95A 44 32 2A                 4         .ascii "D2*"
      00A95D                          5         D2STAR:
      00A95D 90 93            [ 1]  705     LDW Y,X 
      00A95F 90 EE 02         [ 2]  706     LDW Y,(2,Y)
      00A962 98               [ 1]  707     RCF 
      00A963 90 59            [ 2]  708     RLCW Y 
      00A965 EF 02            [ 2]  709     LDW (2,X),Y 
      00A967 90 93            [ 1]  710     LDW Y,X 
      00A969 90 FE            [ 2]  711     LDW Y,(Y)
      00A96B 90 59            [ 2]  712     RLCW Y 
      00A96D FF               [ 2]  713     LDW (X),Y 
      00A96E 81               [ 4]  714     RET 
                                    715 
                                    716 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    717 ;   DLSHIFT ( d n -- d )
                                    718 ;   left shift double 
                                    719 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028EF                        720     _HEADER DLSHIFT,7,"DLSHIFT"
      00A96F A9 59                    1         .word LINK 
                           0028F1     2         LINK=.
      00A971 07                       3         .byte 7  
      00A972 44 4C 53 48 49 46 54     4         .ascii "DLSHIFT"
      00A979                          5         DLSHIFT:
      00A979 E6 01            [ 1]  721     LD A,(1,X) ; shift count 
      00A97B 1C 00 02         [ 2]  722     ADDW X,#2 
      00A97E 90 93            [ 1]  723     LDW Y,X 
      00A980 90 FE            [ 2]  724     LDW Y,(Y)
      00A982 90 BF 26         [ 2]  725     LDW YTEMP,Y  ; d hi 
      00A985 90 93            [ 1]  726     LDW Y,X 
      00A987 90 EE 02         [ 2]  727     LDW Y,(2,Y)  ; d low 
      00A98A                        728 DLSHIFT1:
      00A98A 4D               [ 1]  729     TNZ A 
      00A98B 27 12            [ 1]  730     JREQ DLSHIFT2 
      00A98D 98               [ 1]  731     RCF 
      00A98E 90 59            [ 2]  732     RLCW Y 
      00A990 90 89            [ 2]  733     PUSHW Y 
      00A992 90 BE 26         [ 2]  734     LDW Y,YTEMP 
      00A995 90 59            [ 2]  735     RLCW Y 
      00A997 90 BF 26         [ 2]  736     LDW YTEMP,Y 
      00A99A 90 85            [ 2]  737     POPW Y 
      00A99C 4A               [ 1]  738     DEC A 
      00A99D 20 EB            [ 2]  739     JRA DLSHIFT1 
      00A99F                        740 DLSHIFT2:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      00A99F EF 02            [ 2]  741     LDW (2,X),Y 
      00A9A1 90 BE 26         [ 2]  742     LDW Y,YTEMP 
      00A9A4 FF               [ 2]  743     LDW (X),Y 
      00A9A5 81               [ 4]  744     RET 
                                    745 
                                    746 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    747 ;  DD/MOD ( d1 d2 -- dr dq )
                                    748 ;  unsigned division double 
                                    749 ;  double.
                                    750 ;  return double quotient and 
                                    751 ;  double remainder 
                                    752 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002926                        753     _HEADER DDSLMOD,6,"DD/MOD"
      00A9A6 A9 71                    1         .word LINK 
                           002928     2         LINK=.
      00A9A8 06                       3         .byte 6  
      00A9A9 44 44 2F 4D 4F 44        4         .ascii "DD/MOD"
      00A9AF                          5         DDSLMOD:
      00A9AF CD 88 30         [ 4]  754     CALL DDUP 
      00A9B2 CD A7 17         [ 4]  755     CALL DCLZ 
      00A9B5 CD 86 16         [ 4]  756     CALL DUPP
      002938                        757     _DOLIT 16 
      00A9B8 CD 84 F1         [ 4]    1     CALL DOLIT 
      00A9BB 00 10                    2     .word 16 
      00A9BD CD 89 41         [ 4]  758     CALL GREAT 
      002940                        759     _QBRAN DDSLMOD1 
      00A9C0 CD 85 24         [ 4]    1     CALL QBRAN
      00A9C3 A9 CC                    2     .word DDSLMOD1
      00A9C5 CD 88 25         [ 4]  760     CALL DDROP 
      00A9C8 CD A5 F8         [ 4]  761     CALL DSLMOD 
      00A9CB 81               [ 4]  762     RET 
      00A9CC                        763 DDSLMOD1:
      00A9CC CD 86 16         [ 4]  764     CALL DUPP      
      00A9CF CD 85 DF         [ 4]  765     CALL TOR 
      00A9D2 CD A9 79         [ 4]  766     CALL DLSHIFT
      002955                        767     _DOLIT 32 
      00A9D5 CD 84 F1         [ 4]    1     CALL DOLIT 
      00A9D8 00 20                    2     .word 32 
      00A9DA CD 85 C0         [ 4]  768     CALL RFROM 
      00A9DD CD 88 BE         [ 4]  769     CALL SUBB 
      002960                        770     _DOLIT 5 
      00A9E0 CD 84 F1         [ 4]    1     CALL DOLIT 
      00A9E3 00 05                    2     .word 5 
      00A9E5 CD 8C 08         [ 4]  771     CALL PICK 
      002968                        772     _DOLIT 5 
      00A9E8 CD 84 F1         [ 4]    1     CALL DOLIT 
      00A9EB 00 05                    2     .word 5 
      00A9ED CD 8C 08         [ 4]  773     CALL PICK 
      00A9F0 CD A7 17         [ 4]  774     CALL DCLZ 
      00A9F3 CD 85 DF         [ 4]  775     CALL TOR 
      00A9F6 CD A6 E9         [ 4]  776     CALL DSWAP 
      00A9F9 CD 85 D3         [ 4]  777     CALL RAT 
      00A9FC CD A9 79         [ 4]  778     CALL DLSHIFT 
      00A9FF CD A6 E9         [ 4]  779     CALL DSWAP 
      00AA02 CD 85 C0         [ 4]  780     CALL RFROM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      00AA05 CD 85 C0         [ 4]  781     CALL RFROM 
      00AA08 CD 86 26         [ 4]  782     CALL SWAPP 
      00AA0B CD 88 BE         [ 4]  783     CALL SUBB ; number dividend left shift to do.
                                    784 
      00AA0E 81               [ 4]  785     RET 
                                    786 
                                    787 
                                    788 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    789 ;   D* ( d1 d2 -- d3 )
                                    790 ;   double product 
                                    791 ;   
                                    792 ;   d3 = d1 * d2
                                    793 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00298F                        794     _HEADER DSTAR,2,"D*"
      00AA0F A9 A8                    1         .word LINK 
                           002991     2         LINK=.
      00AA11 02                       3         .byte 2  
      00AA12 44 2A                    4         .ascii "D*"
      00AA14                          5         DSTAR:
      00AA14 CD 86 16         [ 4]  795     CALL DUPP 
      00AA17 CD 86 4F         [ 4]  796     CALL ZLESS  
      00AA1A CD 85 DF         [ 4]  797     CALL TOR    ; R: d2sign 
      00AA1D CD A5 C8         [ 4]  798     CALL DABS   
      00AA20 CD 85 C0         [ 4]  799     CALL RFROM 
      00AA23 CD 88 03         [ 4]  800     CALL NROT  ; d1 d2s ud2
      00AA26 CD A8 66         [ 4]  801     CALL DTOR  ; d1 d2s R: ud2  
      00AA29 CD 85 DF         [ 4]  802     CALL TOR   ; d1 R: ud2 d2s   
      00AA2C CD 86 16         [ 4]  803     CALL DUPP 
      00AA2F CD 86 4F         [ 4]  804     CALL ZLESS 
      00AA32 CD 85 C0         [ 4]  805     CALL RFROM 
      00AA35 CD 86 9E         [ 4]  806     CALL XORR   
      00AA38 CD 85 DF         [ 4]  807     CALL TOR   ; d1 R: ud2 prod_sign  
      00AA3B CD A5 C8         [ 4]  808     CALL DABS ; ud1 R: ud2 ps  
      00AA3E CD 85 C0         [ 4]  809     CALL RFROM  
      00AA41 CD 88 03         [ 4]  810     CALL NROT   ; ps ud1 
      00AA44 CD 88 30         [ 4]  811     CALL DDUP   ; ps ud1 ud1  
      00AA47 CD 85 C0         [ 4]  812     CALL RFROM  ; ps ud1 ud1 ud2hi 
      00AA4A CD A6 A0         [ 4]  813     CALL DSSTAR ; ps ud1 dprodhi 
                                    814 ; shift partial product 16 bits left 
      00AA4D CD 86 0C         [ 4]  815     CALL DROP   ; drop overflow 
      00AA50 CD 8B AF         [ 4]  816     CALL ZERO   ; ps ud1 prodhi 
      00AA53 CD 86 26         [ 4]  817     CALL SWAPP  
      00AA56 CD A6 E9         [ 4]  818     CALL DSWAP  ; ps dprodhi ud1 
      00AA59 CD 85 C0         [ 4]  819     CALL RFROM  ; ps dprodhi ud1 ud2lo
      00AA5C CD A6 A0         [ 4]  820     CALL DSSTAR ; ps  dprodhi dprodlo 
      00AA5F CD AB 60         [ 4]  821     CALL DPLUS
      00AA62 CD 87 E4         [ 4]  822     CALL ROT    ; dprod ps 
      0029E5                        823     _QBRAN DDSTAR3 
      00AA65 CD 85 24         [ 4]    1     CALL QBRAN
      00AA68 AA 6D                    2     .word DDSTAR3
      00AA6A CD 88 82         [ 4]  824     CALL DNEGA 
      00AA6D                        825 DDSTAR3:  
      00AA6D 81               [ 4]  826     RET 
                                    827 
                                    828 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



                                    829 ;   D/  ( d1 d2 -- d3 )
                                    830 ;   double division d3=d1/d2
                                    831 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0029EE                        832     _HEADER DSLASH,2,"D/"  
      00AA6E AA 11                    1         .word LINK 
                           0029F0     2         LINK=.
      00AA70 02                       3         .byte 2  
      00AA71 44 2F                    4         .ascii "D/"
      00AA73                          5         DSLASH:
      0029F3                        833     _DOLIT 0 
      00AA73 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AA76 00 00                    2     .word 0 
      00AA78 CD 85 DF         [ 4]  834     CALL TOR   ; R: sign 
      00AA7B 90 93            [ 1]  835     LDW Y,X     
      00AA7D 90 FE            [ 2]  836     LDW Y,(Y)
      00AA7F 2A 0C            [ 1]  837     JRPL DSLA1
      00AA81 CD 88 82         [ 4]  838     CALL DNEGA
      00AA84 CD 85 C0         [ 4]  839     CALL RFROM 
      00AA87 CD 88 5F         [ 4]  840     CALL INVER 
      00AA8A CD 85 DF         [ 4]  841     CALL TOR  ; sign inverted 
      00AA8D                        842 DSLA1:
      002A0D                        843     _DOLIT 2 
      00AA8D CD 84 F1         [ 4]    1     CALL DOLIT 
      00AA90 00 02                    2     .word 2 
      00AA92 CD 8C 08         [ 4]  844     CALL PICK 
      00AA95 CD 86 4F         [ 4]  845     CALL ZLESS 
      002A18                        846     _QBRAN DSLA2
      00AA98 CD 85 24         [ 4]    1     CALL QBRAN
      00AA9B AA AF                    2     .word DSLA2
      00AA9D CD A6 E9         [ 4]  847     CALL DSWAP 
      00AAA0 CD 88 82         [ 4]  848     CALL DNEGA
      00AAA3 CD A6 E9         [ 4]  849     CALL DSWAP       
      00AAA6 CD 85 C0         [ 4]  850     CALL RFROM 
      00AAA9 CD 88 5F         [ 4]  851     CALL INVER 
      00AAAC CD 85 DF         [ 4]  852     CALL TOR   ;  sign inverted again 
      00AAAF                        853 DSLA2:
                                    854 ; unsigned double division 
      00AAAF CD 8B AF         [ 4]  855     CALL ZERO 
      00AAB2 CD 8B AF         [ 4]  856     CALL ZERO
      00AAB5 CD A8 66         [ 4]  857     CALL DTOR ; quotient  R: sign qlo qhi 
      00AAB8 CD A9 2D         [ 4]  858     CALL DOVER 
      00AABB CD A7 17         [ 4]  859     CALL DCLZ ; n2, dividend leading zeros  
      00AABE CD 85 DF         [ 4]  860     CALL TOR 
      00AAC1 CD 88 30         [ 4]  861     CALL DDUP    
      00AAC4 CD A7 17         [ 4]  862     CALL DCLZ  ; n1, divisor leading zeros
      00AAC7 CD 85 C0         [ 4]  863     CALL RFROM ; n1 n2 
      00AACA CD 88 BE         [ 4]  864     CALL SUBB
      00AACD CD 86 16         [ 4]  865     CALL DUPP   
      00AAD0 CD 86 4F         [ 4]  866     CALL ZLESS 
      00AAD3 CD 88 5F         [ 4]  867     CALL INVER 
      002A56                        868     _QBRAN DSLA7 ; quotient is null 
      00AAD6 CD 85 24         [ 4]    1     CALL QBRAN
      00AAD9 AB 46                    2     .word DSLA7
      00AADB CD 86 16         [ 4]  869     CALL DUPP 
      00AADE CD 85 DF         [ 4]  870     CALL TOR    ; loop counter 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      00AAE1 CD 87 D3         [ 4]  871     CALL QDUP 
      002A64                        872     _QBRAN DSLA3
      00AAE4 CD 85 24         [ 4]    1     CALL QBRAN
      00AAE7 AA EC                    2     .word DSLA3
      00AAE9 CD A9 79         [ 4]  873     CALL DLSHIFT ; align divisor with dividend 
      00AAEC                        874 DSLA3: ; division loop 
      00AAEC 90 5F            [ 1]  875     CLRW Y 
      00AAEE 90 89            [ 2]  876     PUSHW Y  
      00AAF0 CD A9 2D         [ 4]  877     CALL DOVER 
      00AAF3 CD A9 2D         [ 4]  878     CALL DOVER 
      00AAF6 CD A7 FF         [ 4]  879     CALL DLESS 
      00AAF9 CD 88 5F         [ 4]  880     CALL INVER  
      002A7C                        881     _QBRAN DSLA4 
      00AAFC CD 85 24         [ 4]    1     CALL QBRAN
      00AAFF AB 15                    2     .word DSLA4
      00AB01 90 85            [ 2]  882     POPW Y 
      00AB03 72 A9 00 01      [ 2]  883     ADDW Y,#1 
      00AB07 90 89            [ 2]  884     PUSHW Y 
      00AB09 CD 88 30         [ 4]  885     CALL DDUP 
      00AB0C CD A8 66         [ 4]  886     CALL DTOR
      00AB0F CD AB 92         [ 4]  887     CALL DSUB
      00AB12 CD A8 84         [ 4]  888     CALL DRFROM  
      00AB15                        889 DSLA4: ; shift quotient and add 1 bit 
      00AB15 90 85            [ 2]  890     POPW Y 
      00AB17 90 BF 26         [ 2]  891     LDW YTEMP,Y 
      00AB1A 16 05            [ 2]  892     LDW Y,(5,SP) ; quotient low 
      00AB1C 98               [ 1]  893     RCF 
      00AB1D 90 59            [ 2]  894     RLCW Y
      00AB1F 17 05            [ 2]  895     LDW (5,SP),Y 
      00AB21 16 03            [ 2]  896     LDW Y,(3,SP) ; quotient hi 
      00AB23 90 59            [ 2]  897     RLCW Y 
      00AB25 17 03            [ 2]  898     LDW (3,SP),Y 
      00AB27 16 05            [ 2]  899     LDW Y,(5,SP) 
      00AB29 72 B9 00 26      [ 2]  900     ADDW Y,YTEMP
      00AB2D 17 05            [ 2]  901     LDW (5,SP),Y 
      00AB2F 16 01            [ 2]  902     LDW Y,(1,SP) ; loop counter 
      00AB31 90 5D            [ 2]  903     TNZW Y 
      00AB33 27 14            [ 1]  904     JREQ DSLA8
      00AB35 72 A2 00 01      [ 2]  905     SUBW Y,#1  
      00AB39 17 01            [ 2]  906     LDW (1,SP),Y  
                                    907 ; shift dividend left 1 bit      
      00AB3B CD A6 E9         [ 4]  908     CALL DSWAP 
      00AB3E CD A9 5D         [ 4]  909     CALL D2STAR 
      00AB41 CD A6 E9         [ 4]  910     CALL DSWAP 
      00AB44 20 A6            [ 2]  911     JRA DSLA3 
      00AB46                        912 DSLA7:
      00AB46 1C 00 02         [ 2]  913     ADDW X,#2 ; drop shift count  
      00AB49                        914 DSLA8:
      00AB49 1C 00 08         [ 2]  915     ADDW X,#8 ; drop remainder and divisor 
      00AB4C 5B 02            [ 2]  916     ADDW SP,#2 ; drop loop count on RSTACK 
                                    917     ; quotient replace dividend 
      00AB4E CD A8 84         [ 4]  918     CALL DRFROM 
      00AB51 90 85            [ 2]  919     POPW Y ; sign 
      00AB53 90 5D            [ 2]  920     TNZW Y 
      00AB55 27 03            [ 1]  921     JREQ DSLA9 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      00AB57 CD 88 82         [ 4]  922     CALL DNEGA 
      00AB5A                        923 DSLA9: 
      00AB5A 81               [ 4]  924     RET 
                                    925 
                                    926 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    927 ;   D+ ( d1 d2 -- d3 )
                                    928 ;   add 2 doubles 
                                    929 ;   d3=d1+d2 
                                    930 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002ADB                        931     _HEADER DPLUS,2,"D+"
      00AB5B AA 70                    1         .word LINK 
                           002ADD     2         LINK=.
      00AB5D 02                       3         .byte 2  
      00AB5E 44 2B                    4         .ascii "D+"
      00AB60                          5         DPLUS:
      00AB60 90 93            [ 1]  932     LDW Y,X 
      00AB62 90 FE            [ 2]  933     LDW Y,(Y)
      00AB64 90 BF 26         [ 2]  934     LDW YTEMP,Y ; d2 hi 
      00AB67 90 93            [ 1]  935     LDW Y,X 
      00AB69 90 EE 02         [ 2]  936     LDW Y,(2,Y)
      00AB6C 90 BF 24         [ 2]  937     LDW XTEMP,Y ; d2 lo 
      00AB6F 1C 00 04         [ 2]  938     ADDW X,#4 
      00AB72 90 93            [ 1]  939     LDW Y,X 
      00AB74 90 EE 02         [ 2]  940     LDW Y,(2,Y) ; d1 lo
      00AB77 72 B9 00 24      [ 2]  941     ADDW Y,XTEMP
      00AB7B EF 02            [ 2]  942     LDW (2,X),Y 
      00AB7D 90 93            [ 1]  943     LDW Y,X 
      00AB7F 90 FE            [ 2]  944     LDW Y,(Y) ; d1 hi 
      00AB81 24 04            [ 1]  945     JRNC DPLUS1 
      00AB83 72 A9 00 01      [ 2]  946     ADDW Y,#1 
      00AB87                        947 DPLUS1: 
      00AB87 72 B9 00 26      [ 2]  948     ADDW Y,YTEMP 
      00AB8B FF               [ 2]  949     LDW (X),Y 
      00AB8C 81               [ 4]  950     RET 
                                    951 
                                    952 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    953 ;   D- ( d1 d2 -- d3 )
                                    954 ;   d3=d1-d2 
                                    955 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B0D                        956     _HEADER DSUB,2,"D-"
      00AB8D AB 5D                    1         .word LINK 
                           002B0F     2         LINK=.
      00AB8F 02                       3         .byte 2  
      00AB90 44 2D                    4         .ascii "D-"
      00AB92                          5         DSUB:
      00AB92 90 93            [ 1]  957     LDW Y,X 
      00AB94 90 FE            [ 2]  958     LDW Y,(Y)
      00AB96 90 BF 26         [ 2]  959     LDW YTEMP,Y ; d2 hi 
      00AB99 90 93            [ 1]  960     LDW Y,X 
      00AB9B 90 EE 02         [ 2]  961     LDW Y,(2,Y)
      00AB9E 90 BF 24         [ 2]  962     LDW XTEMP,Y ; d2 lo 
      00ABA1 1C 00 04         [ 2]  963     ADDW X,#4 
      00ABA4 90 93            [ 1]  964     LDW Y,X 
      00ABA6 90 EE 02         [ 2]  965     LDW Y,(2,Y) ; d1 lo
      00ABA9 72 B2 00 24      [ 2]  966     SUBW Y,XTEMP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      00ABAD EF 02            [ 2]  967     LDW (2,X),Y 
      00ABAF 90 93            [ 1]  968     LDW Y,X 
      00ABB1 90 FE            [ 2]  969     LDW Y,(Y) ; d1 hi 
      00ABB3 24 04            [ 1]  970     JRNC DSUB1 
      00ABB5 72 A2 00 01      [ 2]  971     SUBW Y,#1 
      00ABB9                        972 DSUB1: 
      00ABB9 72 B2 00 26      [ 2]  973     SUBW Y,YTEMP 
      00ABBD FF               [ 2]  974     LDW (X),Y 
      00ABBE 81               [ 4]  975     RET 
                                    976 
                                    977 
                                    978 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    979 ;    ILOG ( ud base -- n )
                                    980 ;    integer part of double in base 
                                    981 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B3F                        982     _HEADER ILOG,4,"ILOG"
      00ABBF AB 8F                    1         .word LINK 
                           002B41     2         LINK=.
      00ABC1 04                       3         .byte 4  
      00ABC2 49 4C 4F 47              4         .ascii "ILOG"
      00ABC6                          5         ILOG:
      002B46                        983     _DOLIT 0 
      00ABC6 CD 84 F1         [ 4]    1     CALL DOLIT 
      00ABC9 00 00                    2     .word 0 
      00ABCB CD 85 DF         [ 4]  984     CALL TOR 
      00ABCE CD 88 03         [ 4]  985     CALL NROT 
      00ABD1                        986 ILOG1: 
      002B51                        987     _DOLIT 2 
      00ABD1 CD 84 F1         [ 4]    1     CALL DOLIT 
      00ABD4 00 02                    2     .word 2 
      00ABD6 CD 8C 08         [ 4]  988     CALL PICK 
      00ABD9 CD A5 F8         [ 4]  989     CALL DSLMOD 
      00ABDC CD 87 E4         [ 4]  990     CALL ROT 
      00ABDF CD 86 0C         [ 4]  991     CALL DROP 
      00ABE2 CD 88 30         [ 4]  992     CALL DDUP
      00ABE5 CD A5 80         [ 4]  993     CALL DZEQUAL 
      00ABE8 CD 88 5F         [ 4]  994     CALL INVER 
      002B6B                        995     _QBRAN ILOG2
      00ABEB CD 85 24         [ 4]    1     CALL QBRAN
      00ABEE AB FE                    2     .word ILOG2
      00ABF0 CD 85 C0         [ 4]  996     CALL RFROM 
      00ABF3 CD 8B 43         [ 4]  997     CALL ONEP 
      00ABF6 CD 85 DF         [ 4]  998     CALL TOR 
      002B79                        999     _BRAN ILOG1 
      00ABF9 CD 85 3B         [ 4]    1     CALL BRAN 
      00ABFC AB D1                    2     .word ILOG1 
      00ABFE                       1000 ILOG2:
      00ABFE CD 88 25         [ 4] 1001     CALL DDROP 
      00AC01 CD 86 0C         [ 4] 1002     CALL DROP 
      00AC04 CD 85 C0         [ 4] 1003     CALL RFROM 
      00AC07 81               [ 4] 1004     RET 
                                   1005 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



                                   4778 .endif 
                           000001  4779 .if WANT_FLOAT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



                                   4780         .include "float.asm"
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
      002B88                         43     _HEADER FPSW,4,"FPSW"
      00AC08 AB C1                    1         .word LINK 
                           002B8A     2         LINK=.
      00AC0A 04                       3         .byte 4  
      00AC0B 46 50 53 57              4         .ascii "FPSW"
      00AC0F                          5         FPSW:
      00AC0F 90 AE 00 08      [ 2]   44 	LDW Y,#UFPSW  
      00AC13 1D 00 02         [ 2]   45 	SUBW X,#2
      00AC16 FF               [ 2]   46     LDW (X),Y
      00AC17 81               [ 4]   47     RET
                                     48 
                                     49 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



                                     50 ;   FRESET ( -- )
                                     51 ;   reset FPSW variable 
                                     52 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
      002B98                         53     _HEADER FRESET,6,"FRESET"
      00AC18 AC 0A                    1         .word LINK 
                           002B9A     2         LINK=.
      00AC1A 06                       3         .byte 6  
      00AC1B 46 52 45 53 45 54        4         .ascii "FRESET"
      00AC21                          5         FRESET:
      002BA1                         54     _DOLIT 0 
      00AC21 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AC24 00 00                    2     .word 0 
      00AC26 CD AC 0F         [ 4]   55     CALL FPSW 
      00AC29 CD 85 58         [ 4]   56     CALL STORE 
      00AC2C 81               [ 4]   57     RET 
                                     58 
                                     59 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     60 ;   FINIT ( -- )
                                     61 ;   initialize floating point 
                                     62 ;   library 
                                     63 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BAD                         64     _HEADER FINIT,5,"FINIT"
      00AC2D AC 1A                    1         .word LINK 
                           002BAF     2         LINK=.
      00AC2F 05                       3         .byte 5  
      00AC30 46 49 4E 49 54           4         .ascii "FINIT"
      00AC35                          5         FINIT:
      00AC35 CD AC 21         [ 4]   65     CALL FRESET 
      00AC38 81               [ 4]   66     RET 
                                     67 
                                     68 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     69 ;    FER ( -- u )
                                     70 ;    return FPSW value 
                                     71 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BB9                         72     _HEADER FER,3,"FER"
      00AC39 AC 2F                    1         .word LINK 
                           002BBB     2         LINK=.
      00AC3B 03                       3         .byte 3  
      00AC3C 46 45 52                 4         .ascii "FER"
      00AC3F                          5         FER:
      00AC3F CD AC 0F         [ 4]   73     CALL FPSW 
      00AC42 CD 85 6F         [ 4]   74     CALL AT 
      00AC45 81               [ 4]   75     RET 
                                     76 
                                     77 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     78 ;    FZE  ( -- z )
                                     79 ;    return FPSW zero flag 
                                     80 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BC6                         81     _HEADER FZE,3,"FZE"
      00AC46 AC 3B                    1         .word LINK 
                           002BC8     2         LINK=.
      00AC48 03                       3         .byte 3  
      00AC49 46 5A 45                 4         .ascii "FZE"
      00AC4C                          5         FZE:
      00AC4C CD AC 0F         [ 4]   82     CALL FPSW
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      00AC4F CD 85 6F         [ 4]   83     CALL AT  
      002BD2                         84     _DOLIT 1
      00AC52 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AC55 00 01                    2     .word 1 
      00AC57 CD 86 75         [ 4]   85     CALL ANDD 
      00AC5A 81               [ 4]   86     RET 
                                     87 
                                     88 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     89 ;    FNE ( -- n )
                                     90 ;    return FPSW negative flag 
                                     91 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BDB                         92     _HEADER FNE,3,"FNE"
      00AC5B AC 48                    1         .word LINK 
                           002BDD     2         LINK=.
      00AC5D 03                       3         .byte 3  
      00AC5E 46 4E 45                 4         .ascii "FNE"
      00AC61                          5         FNE:
      00AC61 CD AC 0F         [ 4]   93     CALL FPSW 
      00AC64 CD 85 6F         [ 4]   94     CALL AT 
      002BE7                         95     _DOLIT 2 
      00AC67 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AC6A 00 02                    2     .word 2 
      00AC6C CD 86 75         [ 4]   96     CALL ANDD 
      00AC6F 81               [ 4]   97     RET 
                                     98 
                                     99 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    100 ;   FOV (A -- v )
                                    101 ;   return FPSW overflow flag 
                                    102 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BF0                        103     _HEADER FOV,3,"FOV"
      00AC70 AC 5D                    1         .word LINK 
                           002BF2     2         LINK=.
      00AC72 03                       3         .byte 3  
      00AC73 46 4F 56                 4         .ascii "FOV"
      00AC76                          5         FOV:
      00AC76 CD AC 0F         [ 4]  104     CALL FPSW
      00AC79 CD 85 6F         [ 4]  105     CALL AT  
      002BFC                        106     _DOLIT 4 
      00AC7C CD 84 F1         [ 4]    1     CALL DOLIT 
      00AC7F 00 04                    2     .word 4 
      00AC81 CD 86 75         [ 4]  107     CALL ANDD 
      00AC84 81               [ 4]  108     RET 
                                    109 
                                    110 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    111 ;   U> ( u1 u2 -- f )
                                    112 ;   f = true if u1>u2 
                                    113 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C05                        114     _HEADER UGREAT,2,"U>"
      00AC85 AC 72                    1         .word LINK 
                           002C07     2         LINK=.
      00AC87 02                       3         .byte 2  
      00AC88 55 3E                    4         .ascii "U>"
      00AC8A                          5         UGREAT:
      00AC8A A6 00            [ 1]  115     LD A,#0
      00AC8C 90 93            [ 1]  116     LDW Y,X 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      00AC8E 90 EE 02         [ 2]  117     LDW Y,(2,Y)
      00AC91 90 BF 26         [ 2]  118     LDW YTEMP,Y 
      00AC94 90 93            [ 1]  119     LDW Y,X
      00AC96 1C 00 02         [ 2]  120     ADDW X,#2 
      00AC99 90 FE            [ 2]  121     LDW Y,(Y)
      00AC9B 90 B3 26         [ 2]  122     CPW Y,YTEMP 
      00AC9E 2B 02            [ 1]  123     JRMI UGREAT1 
      00ACA0 A6 FF            [ 1]  124     LD A,#0XFF 
      00ACA2                        125 UGREAT1:
      00ACA2 F7               [ 1]  126     LD (X),A 
      00ACA3 E7 01            [ 1]  127     LD (1,X),A 
      00ACA5 81               [ 4]  128     RET 
                                    129 
                                    130 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    131 ;    SFZ ( f# -- f# )
                                    132 ;    set FPSW zero flag 
                                    133 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C26                        134     _HEADER SFZ,3,"SFZ"
      00ACA6 AC 87                    1         .word LINK 
                           002C28     2         LINK=.
      00ACA8 03                       3         .byte 3  
      00ACA9 53 46 5A                 4         .ascii "SFZ"
      00ACAC                          5         SFZ:
      00ACAC CD 88 30         [ 4]  135     CALL DDUP 
      00ACAF CD AC 3F         [ 4]  136     CALL FER 
      002C32                        137     _DOLIT 0xfffe 
      00ACB2 CD 84 F1         [ 4]    1     CALL DOLIT 
      00ACB5 FF FE                    2     .word 0xfffe 
      00ACB7 CD 86 75         [ 4]  138     CALL ANDD 
      00ACBA CD 85 DF         [ 4]  139     CALL TOR    
      002C3D                        140     _DOLIT 0x807F 
      00ACBD CD 84 F1         [ 4]    1     CALL DOLIT 
      00ACC0 80 7F                    2     .word 0x807F 
      00ACC2 CD 86 75         [ 4]  141     CALL ANDD 
      00ACC5 CD A5 80         [ 4]  142     CALL DZEQUAL 
      002C48                        143     _DOLIT 1 
      00ACC8 CD 84 F1         [ 4]    1     CALL DOLIT 
      00ACCB 00 01                    2     .word 1 
      00ACCD CD 86 75         [ 4]  144     CALL ANDD 
      00ACD0 CD 85 C0         [ 4]  145     CALL RFROM 
      00ACD3 CD 86 89         [ 4]  146     CALL ORR 
      00ACD6 CD AC 0F         [ 4]  147     CALL FPSW 
      00ACD9 CD 85 58         [ 4]  148     CALL STORE 
      00ACDC 81               [ 4]  149     RET 
                                    150 
                                    151 
                                    152 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    153 ;   SFN ( f# -- f# )
                                    154 ;   set FPSW negative flag 
                                    155 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C5D                        156     _HEADER SFN,3,"SFN"
      00ACDD AC A8                    1         .word LINK 
                           002C5F     2         LINK=.
      00ACDF 03                       3         .byte 3  
      00ACE0 53 46 4E                 4         .ascii "SFN"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      00ACE3                          5         SFN:
      00ACE3 CD 86 16         [ 4]  157     CALL DUPP  
      00ACE6 CD AC 3F         [ 4]  158     CALL FER 
      002C69                        159     _DOLIT 0xFFFD 
      00ACE9 CD 84 F1         [ 4]    1     CALL DOLIT 
      00ACEC FF FD                    2     .word 0xFFFD 
      00ACEE CD 86 75         [ 4]  160     CALL ANDD  
      00ACF1 CD 85 DF         [ 4]  161     CALL TOR 
      002C74                        162     _DOLIT 0x8000
      00ACF4 CD 84 F1         [ 4]    1     CALL DOLIT 
      00ACF7 80 00                    2     .word 0x8000 
      00ACF9 CD 86 75         [ 4]  163     CALL ANDD
      00ACFC 90 93            [ 1]  164     LDW Y,X 
      00ACFE 90 FE            [ 2]  165     LDW Y,(Y)
      00AD00 98               [ 1]  166     RCF 
      00AD01 90 59            [ 2]  167     RLCW Y 
      00AD03 90 59            [ 2]  168     RLCW Y 
      00AD05 90 59            [ 2]  169     RLCW Y 
      00AD07 FF               [ 2]  170     LDW (X),Y 
      00AD08 CD 85 C0         [ 4]  171     CALL RFROM 
      00AD0B CD 86 89         [ 4]  172     CALL ORR 
      00AD0E CD AC 0F         [ 4]  173     CALL FPSW
      00AD11 CD 85 58         [ 4]  174     CALL STORE 
      00AD14 81               [ 4]  175     RET 
                                    176 
                                    177 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    178 ;   SFV ( -- )
                                    179 ;   set overflow flag 
                                    180 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C95                        181     _HEADER SFV,3,"SFV"
      00AD15 AC DF                    1         .word LINK 
                           002C97     2         LINK=.
      00AD17 03                       3         .byte 3  
      00AD18 53 46 56                 4         .ascii "SFV"
      00AD1B                          5         SFV:
      00AD1B CD AC 0F         [ 4]  182     CALL FPSW 
      00AD1E CD 85 6F         [ 4]  183     CALL AT 
      002CA1                        184     _DOLIT 4 
      00AD21 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AD24 00 04                    2     .word 4 
      00AD26 CD 86 89         [ 4]  185     CALL ORR 
      00AD29 CD AC 0F         [ 4]  186     CALL FPSW 
      00AD2C CD 85 58         [ 4]  187     CALL STORE 
      00AD2F 81               [ 4]  188     RET 
                                    189 
                                    190 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    191 ;  @EXPONENT ( f# -- m e )
                                    192 ;  split float in mantissa/exponent 
                                    193 ;  m mantissa as a double 
                                    194 ;  e exponent as a single 
                                    195 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002CB0                        196     _HEADER ATEXP,9,"@EXPONENT"             
      00AD30 AD 17                    1         .word LINK 
                           002CB2     2         LINK=.
      00AD32 09                       3         .byte 9  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      00AD33 40 45 58 50 4F 4E 45     4         .ascii "@EXPONENT"
             4E 54
      00AD3C                          5         ATEXP:
      00AD3C CD AC 21         [ 4]  197     CALL FRESET
      00AD3F CD AC E3         [ 4]  198     CALL SFN
      00AD42 CD AC AC         [ 4]  199     CALL SFZ 
      00AD45 CD 86 16         [ 4]  200     CALL DUPP
      002CC8                        201     _DOLIT 0X7F80 
      00AD48 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AD4B 7F 80                    2     .word 0X7F80 
      00AD4D CD 86 75         [ 4]  202     CALL ANDD 
      002CD0                        203     _DOLIT 7 
      00AD50 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AD53 00 07                    2     .word 7 
      00AD55 CD 8B 7D         [ 4]  204     CALL RSHIFT
      002CD8                        205     _DOLIT 127 
      00AD58 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AD5B 00 7F                    2     .word 127 
      00AD5D CD 88 BE         [ 4]  206     CALL SUBB
      00AD60 CD 85 DF         [ 4]  207     CALL TOR 
      002CE3                        208     _DOLIT 0x7F
      00AD63 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AD66 00 7F                    2     .word 0x7F 
      00AD68 CD 86 75         [ 4]  209     CALL ANDD  ; mantissa as double  
      00AD6B CD AC 61         [ 4]  210     CALL FNE 
      002CEE                        211     _QBRAN POSMANT 
      00AD6E CD 85 24         [ 4]    1     CALL QBRAN
      00AD71 AD 76                    2     .word POSMANT
      00AD73 CD A5 9E         [ 4]  212     CALL DNEGAT 
      00AD76                        213 POSMANT:
      00AD76 CD 85 C0         [ 4]  214     CALL RFROM 
      00AD79 81               [ 4]  215     RET 
                                    216 
                                    217 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    218 ;    !EXPONENT ( m e -- f# )
                                    219 ;    built float from mantissa/exponent 
                                    220 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002CFA                        221     _HEADER STEXP,9,"!EXPONENT"
      00AD7A AD 32                    1         .word LINK 
                           002CFC     2         LINK=.
      00AD7C 09                       3         .byte 9  
      00AD7D 21 45 58 50 4F 4E 45     4         .ascii "!EXPONENT"
             4E 54
      00AD86                          5         STEXP:
      00AD86 CD 86 16         [ 4]  222     CALL DUPP 
      00AD89 CD 88 D8         [ 4]  223     CALL ABSS 
      002D0C                        224     _DOLIT 127 
      00AD8C CD 84 F1         [ 4]    1     CALL DOLIT 
      00AD8F 00 7F                    2     .word 127 
      00AD91 CD AC 8A         [ 4]  225     CALL UGREAT
      002D14                        226     _QBRAN STEXP1
      00AD94 CD 85 24         [ 4]    1     CALL QBRAN
      00AD97 AD 9C                    2     .word STEXP1
      00AD99 CD AD 1B         [ 4]  227     CALL SFV  
      00AD9C                        228 STEXP1:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      002D1C                        229     _DOLIT 127 
      00AD9C CD 84 F1         [ 4]    1     CALL DOLIT 
      00AD9F 00 7F                    2     .word 127 
      00ADA1 CD 88 45         [ 4]  230     CALL PLUS 
      002D24                        231     _DOLIT 0XFF 
      00ADA4 CD 84 F1         [ 4]    1     CALL DOLIT 
      00ADA7 00 FF                    2     .word 0XFF 
      00ADA9 CD 86 75         [ 4]  232     CALL ANDD 
      002D2C                        233     _DOLIT 7 
      00ADAC CD 84 F1         [ 4]    1     CALL DOLIT 
      00ADAF 00 07                    2     .word 7 
      00ADB1 CD 8B 61         [ 4]  234     CALL LSHIFT 
      00ADB4 CD 85 DF         [ 4]  235     CALL TOR   ; R: e 
      00ADB7 CD 86 16         [ 4]  236     CALL DUPP 
      002D3A                        237     _DOLIT 0X8000 
      00ADBA CD 84 F1         [ 4]    1     CALL DOLIT 
      00ADBD 80 00                    2     .word 0X8000 
      00ADBF CD 86 75         [ 4]  238     CALL ANDD 
      002D42                        239     _QBRAN STEXP2 
      00ADC2 CD 85 24         [ 4]    1     CALL QBRAN
      00ADC5 AD D8                    2     .word STEXP2
      002D47                        240     _DOLIT 0X8000 
      00ADC7 CD 84 F1         [ 4]    1     CALL DOLIT 
      00ADCA 80 00                    2     .word 0X8000 
      00ADCC CD 85 C0         [ 4]  241     CALL RFROM 
      00ADCF CD 86 89         [ 4]  242     CALL ORR
      00ADD2 CD 85 DF         [ 4]  243     CALL TOR
      00ADD5 CD A5 9E         [ 4]  244     CALL DNEGAT  
      00ADD8                        245 STEXP2:
      00ADD8 CD 86 16         [ 4]  246     CALL DUPP 
      002D5B                        247     _DOLIT 0X7F
      00ADDB CD 84 F1         [ 4]    1     CALL DOLIT 
      00ADDE 00 7F                    2     .word 0X7F 
      00ADE0 CD AC 8A         [ 4]  248     CALL UGREAT 
      002D63                        249     _QBRAN STEXP3 
      00ADE3 CD 85 24         [ 4]    1     CALL QBRAN
      00ADE6 AD EB                    2     .word STEXP3
      00ADE8 CD AD 1B         [ 4]  250     CALL SFV 
      00ADEB                        251 STEXP3:
      002D6B                        252     _DOLIT 0X7F 
      00ADEB CD 84 F1         [ 4]    1     CALL DOLIT 
      00ADEE 00 7F                    2     .word 0X7F 
      00ADF0 CD 86 75         [ 4]  253     CALL ANDD 
      00ADF3 CD 85 C0         [ 4]  254     CALL RFROM 
      00ADF6 CD 86 89         [ 4]  255     CALL ORR 
      00ADF9 CD AC AC         [ 4]  256     CALL SFZ 
      00ADFC CD AC E3         [ 4]  257     CALL SFN 
      00ADFF 81               [ 4]  258     RET 
                                    259 
                                    260 
                                    261 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    262 ;   E. ( f# -- )
                                    263 ;   print float in scientific 
                                    264 ;   format 
                                    265 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      002D80                        266     _HEADER EDOT,2,"E."
      00AE00 AD 7C                    1         .word LINK 
                           002D82     2         LINK=.
      00AE02 02                       3         .byte 2  
      00AE03 45 2E                    4         .ascii "E."
      00AE05                          5         EDOT:
      00AE05 CD 86 E6         [ 4]  267     CALL BASE 
      00AE08 CD 85 6F         [ 4]  268     CALL AT 
      00AE0B CD 85 DF         [ 4]  269     CALL TOR 
      002D8E                        270     _DOLIT 10 
      00AE0E CD 84 F1         [ 4]    1     CALL DOLIT 
      00AE11 00 0A                    2     .word 10 
      00AE13 CD 86 E6         [ 4]  271     CALL BASE 
      00AE16 CD 85 58         [ 4]  272     CALL STORE 
      00AE19 CD AD 3C         [ 4]  273     CALL ATEXP ; m e 
      00AE1C                        274 EDOT0:
      00AE1C CD 85 DF         [ 4]  275     CALL TOR   
      00AE1F CD AC 61         [ 4]  276     CALL FNE 
      002DA2                        277     _QBRAN EDOT1
      00AE22 CD 85 24         [ 4]    1     CALL QBRAN
      00AE25 AE 2A                    2     .word EDOT1
      00AE27 CD A5 9E         [ 4]  278     CALL DNEGAT
      00AE2A                        279 EDOT1:
      00AE2A CD 8E F6         [ 4]  280     CALL SPACE 
      00AE2D CD 8D BA         [ 4]  281     CALL BDIGS     
      00AE30                        282 EDOT2: 
      00AE30 CD A6 39         [ 4]  283     CALL DDIG
      00AE33 CD 85 C0         [ 4]  284     CALL RFROM 
      00AE36 CD 8B 43         [ 4]  285     CALL ONEP 
      00AE39 CD 85 DF         [ 4]  286     CALL TOR 
      00AE3C CD 86 16         [ 4]  287     CALL DUPP
      002DBF                        288     _QBRAN EDOT3 
      00AE3F CD 85 24         [ 4]    1     CALL QBRAN
      00AE42 AE 49                    2     .word EDOT3
      002DC4                        289     _BRAN EDOT2  
      00AE44 CD 85 3B         [ 4]    1     CALL BRAN 
      00AE47 AE 30                    2     .word EDOT2 
      00AE49                        290 EDOT3:
      00AE49 CD 86 40         [ 4]  291     CALL OVER 
      00AE4C CD 86 E6         [ 4]  292     CALL BASE 
      00AE4F CD 85 6F         [ 4]  293     CALL AT 
      00AE52 CD 89 05         [ 4]  294     CALL ULESS 
      002DD5                        295     _QBRAN EDOT2 
      00AE55 CD 85 24         [ 4]    1     CALL QBRAN
      00AE58 AE 30                    2     .word EDOT2
      002DDA                        296     _DOLIT '.'
      00AE5A CD 84 F1         [ 4]    1     CALL DOLIT 
      00AE5D 00 2E                    2     .word '.' 
      00AE5F CD 8D CA         [ 4]  297     CALL HOLD  
      00AE62 CD A6 39         [ 4]  298     CALL DDIG
      00AE65 CD AC 61         [ 4]  299     CALL FNE 
      002DE8                        300     _QBRAN EDOT4 
      00AE68 CD 85 24         [ 4]    1     CALL QBRAN
      00AE6B AE 75                    2     .word EDOT4
      002DED                        301     _DOLIT '-'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      00AE6D CD 84 F1         [ 4]    1     CALL DOLIT 
      00AE70 00 2D                    2     .word '-' 
      00AE72 CD 8D CA         [ 4]  302     CALL HOLD 
      00AE75                        303 EDOT4:       
      00AE75 CD 8E 1F         [ 4]  304     CALL EDIGS 
      00AE78 CD 8F 20         [ 4]  305     CALL TYPES
      00AE7B CD 85 C0         [ 4]  306     CALL RFROM 
      00AE7E CD 87 D3         [ 4]  307     CALL QDUP 
      002E01                        308     _QBRAN EDOT5     
      00AE81 CD 85 24         [ 4]    1     CALL QBRAN
      00AE84 AE 91                    2     .word EDOT5
      002E06                        309     _DOLIT 'E'
      00AE86 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AE89 00 45                    2     .word 'E' 
      00AE8B CD 84 B6         [ 4]  310     CALL EMIT 
      00AE8E CD 8F F7         [ 4]  311     CALL DOT
      00AE91                        312 EDOT5: 
      00AE91 CD 85 C0         [ 4]  313     CALL RFROM 
      00AE94 CD 86 E6         [ 4]  314     CALL BASE 
      00AE97 CD 85 58         [ 4]  315     CALL STORE  
      00AE9A 81               [ 4]  316     RET 
                                    317 
                                    318 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                    319 ;   F. (f# -- )
                                    320 ;   print float in fixed
                                    321 ;   point format. 
                                    322 ;;;;;;;;;;;;;;;;;;;;;;;;;
      002E1B                        323     _HEADER FDOT,2,"F."
      00AE9B AE 02                    1         .word LINK 
                           002E1D     2         LINK=.
      00AE9D 02                       3         .byte 2  
      00AE9E 46 2E                    4         .ascii "F."
      00AEA0                          5         FDOT:
      00AEA0 CD 86 E6         [ 4]  324     CALL BASE 
      00AEA3 CD 85 6F         [ 4]  325     CALL AT 
      00AEA6 CD 85 DF         [ 4]  326     CALL TOR 
      002E29                        327     _DOLIT 10 
      00AEA9 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AEAC 00 0A                    2     .word 10 
      00AEAE CD 86 E6         [ 4]  328     CALL BASE 
      00AEB1 CD 85 58         [ 4]  329     CALL STORE 
      00AEB4 CD AD 3C         [ 4]  330     CALL    ATEXP
      00AEB7 CD 86 16         [ 4]  331     CALL    DUPP  
      00AEBA CD 88 D8         [ 4]  332     CALL    ABSS 
      002E3D                        333     _DOLIT  8
      00AEBD CD 84 F1         [ 4]    1     CALL DOLIT 
      00AEC0 00 08                    2     .word 8 
      00AEC2 CD 89 41         [ 4]  334     CALL    GREAT 
      002E45                        335     _QBRAN  FDOT1 
      00AEC5 CD 85 24         [ 4]    1     CALL QBRAN
      00AEC8 AE CD                    2     .word FDOT1
      00AECA CC AE 1C         [ 2]  336     JP      EDOT0 
      00AECD                        337 FDOT1:
      00AECD CD 8E F6         [ 4]  338     CALL    SPACE 
      00AED0 CD 85 DF         [ 4]  339     CALL    TOR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      00AED3 CD AC 61         [ 4]  340     CALL    FNE 
      002E56                        341     _QBRAN  FDOT0 
      00AED6 CD 85 24         [ 4]    1     CALL QBRAN
      00AED9 AE DE                    2     .word FDOT0
      00AEDB CD A5 9E         [ 4]  342     CALL    DNEGAT 
      00AEDE                        343 FDOT0: 
      00AEDE CD 8D BA         [ 4]  344     CALL    BDIGS
      00AEE1 CD 85 D3         [ 4]  345     CALL    RAT  
      00AEE4 CD 86 4F         [ 4]  346     CALL    ZLESS 
      002E67                        347     _QBRAN  FDOT6 
      00AEE7 CD 85 24         [ 4]    1     CALL QBRAN
      00AEEA AF 15                    2     .word FDOT6
      00AEEC                        348 FDOT2: ; e<0 
      00AEEC CD A6 39         [ 4]  349     CALL    DDIG 
      00AEEF CD 85 C0         [ 4]  350     CALL    RFROM
      00AEF2 CD 8B 43         [ 4]  351     CALL    ONEP 
      00AEF5 CD 87 D3         [ 4]  352     CALL    QDUP 
      002E78                        353     _QBRAN  FDOT3 
      00AEF8 CD 85 24         [ 4]    1     CALL QBRAN
      00AEFB AF 05                    2     .word FDOT3
      00AEFD CD 85 DF         [ 4]  354     CALL    TOR 
      002E80                        355     _BRAN   FDOT2 
      00AF00 CD 85 3B         [ 4]    1     CALL BRAN 
      00AF03 AE EC                    2     .word FDOT2 
      00AF05                        356 FDOT3:
      002E85                        357     _DOLIT  '.' 
      00AF05 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AF08 00 2E                    2     .word '.' 
      00AF0A CD 8D CA         [ 4]  358     CALL    HOLD 
      00AF0D CD A6 52         [ 4]  359     CALL    DDIGS
      002E90                        360     _BRAN   FDOT9  
      00AF10 CD 85 3B         [ 4]    1     CALL BRAN 
      00AF13 AF 2A                    2     .word FDOT9 
      00AF15                        361 FDOT6: ; e>=0 
      002E95                        362     _BRAN   FDOT8
      00AF15 CD 85 3B         [ 4]    1     CALL BRAN 
      00AF18 AF 22                    2     .word FDOT8 
      00AF1A                        363 FDOT7:     
      002E9A                        364     _DOLIT  '0'
      00AF1A CD 84 F1         [ 4]    1     CALL DOLIT 
      00AF1D 00 30                    2     .word '0' 
      00AF1F CD 8D CA         [ 4]  365     CALL    HOLD 
      00AF22                        366 FDOT8:
      00AF22 CD 85 05         [ 4]  367     CALL    DONXT 
      00AF25 AF 1A                  368     .word   FDOT7
      00AF27 CD A6 52         [ 4]  369     CALL    DDIGS 
      00AF2A                        370 FDOT9:
      00AF2A CD AC 61         [ 4]  371     CALL    FNE 
      002EAD                        372     _QBRAN  FDOT10 
      00AF2D CD 85 24         [ 4]    1     CALL QBRAN
      00AF30 AF 3A                    2     .word FDOT10
      002EB2                        373     _DOLIT '-' 
      00AF32 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AF35 00 2D                    2     .word '-' 
      00AF37 CD 8D CA         [ 4]  374     CALL   HOLD 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      00AF3A                        375 FDOT10:
      00AF3A CD 8E 1F         [ 4]  376     CALL    EDIGS 
      00AF3D CD 8F 20         [ 4]  377     CALL    TYPES 
      00AF40 CD 85 C0         [ 4]  378     CALL    RFROM 
      00AF43 CD 86 E6         [ 4]  379     CALL    BASE 
      00AF46 CD 85 58         [ 4]  380     CALL    STORE 
      00AF49 81               [ 4]  381     RET 
                                    382 
                                    383 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    384 ; return parsed exponent or 
                                    385 ; 0 if failed
                                    386 ; at entry exprect *a=='E'    
                                    387 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00AF4A                        388 parse_exponent: ; a cntr -- e -1 | 0 
      00AF4A CD 85 DF         [ 4]  389     CALL TOR   ; R: cntr 
      00AF4D CD 86 16         [ 4]  390     CALL DUPP 
      00AF50 CD 85 8D         [ 4]  391     CALL CAT 
      002ED3                        392     _DOLIT 'E' 
      00AF53 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AF56 00 45                    2     .word 'E' 
      00AF58 CD 88 E6         [ 4]  393     CALL EQUAL 
      002EDB                        394     _QBRAN 1$
      00AF5B CD 85 24         [ 4]    1     CALL QBRAN
      00AF5E AF 8B                    2     .word 1$
      00AF60 CD 8B 43         [ 4]  395     CALL ONEP 
      00AF63 CD 85 C0         [ 4]  396     CALL RFROM  ; a cntr 
      00AF66 CD 8B 50         [ 4]  397     CALL ONEM
      00AF69 CD 86 16         [ 4]  398     CALL DUPP 
      002EEC                        399     _QBRAN 2$ ; a cntr 
      00AF6C CD 85 24         [ 4]    1     CALL QBRAN
      00AF6F AF 8E                    2     .word 2$
      00AF71 CD 8B AF         [ 4]  400     CALL ZERO
      00AF74 CD 86 16         [ 4]  401     CALL DUPP 
      00AF77 CD A6 E9         [ 4]  402     CALL DSWAP ; 0 0 a cntr  
      00AF7A CD A4 2B         [ 4]  403     CALL nsign 
      00AF7D CD 85 DF         [ 4]  404     CALL TOR   ; R: esign  
      00AF80 CD A4 63         [ 4]  405     CALL parse_digits
      002F03                        406     _QBRAN PARSEXP_SUCCESS ; parsed to end of string 
      00AF83 CD 85 24         [ 4]    1     CALL QBRAN
      00AF86 AF 95                    2     .word PARSEXP_SUCCESS
                                    407 ; failed invalid character
      00AF88 CD 88 25         [ 4]  408     CALL DDROP ; 0 a 
      00AF8B                        409 1$: 
      00AF8B CD 85 C0         [ 4]  410     CALL RFROM ; sign||cntr  
      00AF8E                        411 2$:
      00AF8E CD 88 25         [ 4]  412     CALL DDROP  ; a cntr || a sign || 0 cntr   
      00AF91 CD 8B AF         [ 4]  413     CALL ZERO   ; return only 0 
      00AF94 81               [ 4]  414     RET 
      00AF95                        415 PARSEXP_SUCCESS: 
      00AF95 CD 88 25         [ 4]  416     CALL DDROP ; drop dhi a 
      00AF98 CD 85 C0         [ 4]  417     CALL RFROM ; es 
      002F1B                        418     _QBRAN 1$
      00AF9B CD 85 24         [ 4]    1     CALL QBRAN
      00AF9E AF A3                    2     .word 1$
      00AFA0 CD 88 70         [ 4]  419     CALL NEGAT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      00AFA3                        420 1$:
      002F23                        421     _DOLIT -1 ; -- e -1 
      00AFA3 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AFA6 FF FF                    2     .word -1 
      00AFA8 81               [ 4]  422     RET 
                                    423 
                                    424 
                                    425 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    426 ;   FLOAT?  ( a dlo dhi a+ cntr sign d? -- f -3 | a 0 )
                                    427 ;   called by NUMBER? 
                                    428 ;   convert string to float 
                                    429 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002F29                        430     _HEADER FLOATQ,5,"FLOAT?"
      00AFA9 AE 9D                    1         .word LINK 
                           002F2B     2         LINK=.
      00AFAB 05                       3         .byte 5  
      00AFAC 46 4C 4F 41 54 3F        4         .ascii "FLOAT?"
      00AFB2                          5         FLOATQ:
      002F32                        431     _QBRAN FLOATQ0 
      00AFB2 CD 85 24         [ 4]    1     CALL QBRAN
      00AFB5 AF BC                    2     .word FLOATQ0
      002F37                        432     _BRAN FLOAT_ERROR  ; not a float, string start with '#'
      00AFB7 CD 85 3B         [ 4]    1     CALL BRAN 
      00AFBA B0 5B                    2     .word FLOAT_ERROR 
      00AFBC                        433 FLOATQ0:
                                    434 ; BASE must be 10 
      00AFBC CD 86 E6         [ 4]  435     CALL BASE 
      00AFBF CD 85 6F         [ 4]  436     CALL AT 
      002F42                        437     _DOLIT 10 
      00AFC2 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AFC5 00 0A                    2     .word 10 
      00AFC7 CD 88 E6         [ 4]  438     CALL EQUAL 
      002F4A                        439     _QBRAN FLOAT_ERROR 
      00AFCA CD 85 24         [ 4]    1     CALL QBRAN
      00AFCD B0 5B                    2     .word FLOAT_ERROR
                                    440 ; if float next char is '.' or 'E' 
      00AFCF CD 85 DF         [ 4]  441     CALL TOR ; R: sign  
      00AFD2 CD 85 DF         [ 4]  442     CALL TOR ; R: sign cntr 
      00AFD5 CD 86 16         [ 4]  443     CALL DUPP
      00AFD8 CD 85 8D         [ 4]  444     CALL CAT 
      002F5B                        445     _DOLIT '.' 
      00AFDB CD 84 F1         [ 4]    1     CALL DOLIT 
      00AFDE 00 2E                    2     .word '.' 
      00AFE0 CD 88 E6         [ 4]  446     CALL EQUAL 
      002F63                        447     _QBRAN FLOATQ1 ; not a dot 
      00AFE3 CD 85 24         [ 4]    1     CALL QBRAN
      00AFE6 B0 21                    2     .word FLOATQ1
      00AFE8 CD 8B 43         [ 4]  448     CALL ONEP 
      00AFEB CD 85 C0         [ 4]  449     CALL RFROM  ; dlo dhi a cntr R: sign  
      00AFEE CD 8B 50         [ 4]  450     CALL ONEM 
      00AFF1 CD 86 16         [ 4]  451     CALL DUPP 
      00AFF4 CD 85 DF         [ 4]  452     CALL TOR  ; R: sign cntr 
                                    453 ; parse fractional part
      00AFF7 CD A4 63         [ 4]  454     CALL parse_digits ; dlo dhi a cntr -- dm a cntr 
      00AFFA CD 86 16         [ 4]  455     CALL DUPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      00AFFD CD 85 C0         [ 4]  456     CALL RFROM 
      00B000 CD 86 26         [ 4]  457     CALL SWAPP 
      00B003 CD 88 BE         [ 4]  458     CALL SUBB ; fd -> fraction digits count 
      00B006 CD 85 DF         [ 4]  459     CALL TOR  ; dlo dhi a cntr R: sign fd 
      00B009 CD 86 16         [ 4]  460     CALL DUPP ; cntr cntr  
      002F8C                        461     _QBRAN 1$ ; end of string, no exponent
      00B00C CD 85 24         [ 4]    1     CALL QBRAN
      00B00F B0 16                    2     .word 1$
      002F91                        462     _BRAN FLOATQ2
      00B011 CD 85 3B         [ 4]    1     CALL BRAN 
      00B014 B0 2A                    2     .word FLOATQ2 
      00B016 CD 86 26         [ 4]  463 1$: CALL SWAPP 
      00B019 CD 86 0C         [ 4]  464     CALL DROP ; a
      002F9C                        465     _BRAN FLOATQ3        
      00B01C CD 85 3B         [ 4]    1     CALL BRAN 
      00B01F B0 32                    2     .word FLOATQ3 
      00B021                        466 FLOATQ1: ; must push fd==0 on RSTACK 
      00B021 CD 85 C0         [ 4]  467     CALL RFROM ; cntr 
      00B024 CD 8B AF         [ 4]  468     CALL ZERO  ; fd 
      00B027 CD 85 DF         [ 4]  469     CALL TOR   ; dm a cntr R: sign fd 
      00B02A                        470 FLOATQ2: 
      00B02A CD AF 4A         [ 4]  471     CALL parse_exponent 
      002FAD                        472     _QBRAN FLOAT_ERROR0 ; exponent expected 
      00B02D CD 85 24         [ 4]    1     CALL QBRAN
      00B030 B0 58                    2     .word FLOAT_ERROR0
      00B032                        473 FLOATQ3: ; dm 0 || dm e  
      00B032 CD 85 C0         [ 4]  474     CALL RFROM ;  fd  
      00B035 CD 88 BE         [ 4]  475     CALL SUBB  ; exp=e-fd 
      00B038 CD 88 03         [ 4]  476     CALL NROT 
      00B03B CD 85 C0         [ 4]  477     CALL RFROM  ; sign 
      002FBE                        478     _QBRAN FLOATQ4 
      00B03E CD 85 24         [ 4]    1     CALL QBRAN
      00B041 B0 46                    2     .word FLOATQ4
      00B043 CD 88 82         [ 4]  479     CALL DNEGA 
      00B046                        480 FLOATQ4:
      00B046 CD 87 E4         [ 4]  481     CALL ROT 
      00B049 CD AD 86         [ 4]  482     CALL STEXP 
      00B04C CD 87 E4         [ 4]  483     CALL ROT 
      00B04F CD 86 0C         [ 4]  484     CALL DROP 
      002FD2                        485     _DOLIT -3 
      00B052 CD 84 F1         [ 4]    1     CALL DOLIT 
      00B055 FF FD                    2     .word -3 
      00B057 81               [ 4]  486     RET       
      00B058                        487 FLOAT_ERROR0: 
      00B058 CD A8 84         [ 4]  488     CALL DRFROM ; sign df      
      00B05B                        489 FLOAT_ERROR: 
      00B05B CD 8B F1         [ 4]  490     CALL DEPTH 
      00B05E CD 8B 36         [ 4]  491     CALL CELLS 
      00B061 CD 85 F6         [ 4]  492     CALL SPAT 
      00B064 CD 86 26         [ 4]  493     CALL SWAPP 
      00B067 CD 88 45         [ 4]  494     CALL PLUS  
      00B06A CD 86 03         [ 4]  495     CALL SPSTO 
      002FED                        496     _DOLIT 0 
      00B06D CD 84 F1         [ 4]    1     CALL DOLIT 
      00B070 00 00                    2     .word 0 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      00B072 81               [ 4]  497     RET 
                                    498 
                                    499 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    500 ;  LSCALE ( f# -- f# )
                                    501 ;  m *=fbase , e -= 1
                                    502 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002FF3                        503     _HEADER LSCALE,6,"LSCALE"
      00B073 AF AB                    1         .word LINK 
                           002FF5     2         LINK=.
      00B075 06                       3         .byte 6  
      00B076 4C 53 43 41 4C 45        4         .ascii "LSCALE"
      00B07C                          5         LSCALE:
      00B07C CD AD 3C         [ 4]  504     CALL ATEXP 
      002FFF                        505     _DOLIT 1 
      00B07F CD 84 F1         [ 4]    1     CALL DOLIT 
      00B082 00 01                    2     .word 1 
      00B084 CD 88 BE         [ 4]  506     CALL SUBB 
      00B087 CD 85 DF         [ 4]  507     CALL TOR
      00300A                        508     _DOLIT 10 
      00B08A CD 84 F1         [ 4]    1     CALL DOLIT 
      00B08D 00 0A                    2     .word 10 
      00B08F CD A6 A0         [ 4]  509     CALL DSSTAR
      00B092 CD 85 C0         [ 4]  510     CALL RFROM 
      00B095 CD AD 86         [ 4]  511     CALL STEXP 
      00B098 81               [ 4]  512     RET  
                                    513 
                                    514 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    515 ;  RSCALE ( f# -- f# )
                                    516 ;  m /=fbase , e+=1 
                                    517 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003019                        518     _HEADER RSCALE,6,"RSCALE"
      00B099 B0 75                    1         .word LINK 
                           00301B     2         LINK=.
      00B09B 06                       3         .byte 6  
      00B09C 52 53 43 41 4C 45        4         .ascii "RSCALE"
      00B0A2                          5         RSCALE:
      00B0A2 CD AD 3C         [ 4]  519     CALL ATEXP 
      003025                        520     _DOLIT 1 
      00B0A5 CD 84 F1         [ 4]    1     CALL DOLIT 
      00B0A8 00 01                    2     .word 1 
      00B0AA CD 88 45         [ 4]  521     CALL PLUS 
      00B0AD CD 85 DF         [ 4]  522     CALL TOR 
      003030                        523     _DOLIT 10 
      00B0B0 CD 84 F1         [ 4]    1     CALL DOLIT 
      00B0B3 00 0A                    2     .word 10 
      00B0B5 CD A5 F8         [ 4]  524     CALL DSLMOD 
      00B0B8 CD 87 E4         [ 4]  525     CALL ROT 
      00B0BB CD 86 0C         [ 4]  526     CALL DROP 
      00B0BE CD 85 C0         [ 4]  527     CALL RFROM 
      00B0C1 CD AD 86         [ 4]  528     CALL STEXP 
      00B0C4 81               [ 4]  529     RET 
                                    530 
                                    531 
                                    532 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    533 ;    F* ( f#1 f#2 -- f#3 )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



                                    534 ;    float product 
                                    535 ;    f#3=f#1 * f#2 
                                    536 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003045                        537     _HEADER FSTAR,2,"F*"
      00B0C5 B0 9B                    1         .word LINK 
                           003047     2         LINK=.
      00B0C7 02                       3         .byte 2  
      00B0C8 46 2A                    4         .ascii "F*"
      00B0CA                          5         FSTAR:
      00B0CA CD AD 3C         [ 4]  538     CALL ATEXP ; f#1 m2 e2 
      00B0CD CD 85 DF         [ 4]  539     CALL TOR   
      00B0D0 CD A6 E9         [ 4]  540     CALL DSWAP ; m2 f#1
      00B0D3 CD AD 3C         [ 4]  541     CALL ATEXP ; m2 m1 e1 
      00B0D6 CD 85 C0         [ 4]  542     CALL RFROM ; m2 m1 e1 e2 
      00B0D9 CD 88 45         [ 4]  543     CALL PLUS  ; m2 m1 e 
      00B0DC CD 85 DF         [ 4]  544     CALL TOR
      00B0DF CD AA 14         [ 4]  545     CALL DSTAR ; m2 m1 m2*m1 
      00B0E2 CD A5 DF         [ 4]  546     CALL DSIGN 
      00B0E5 CD 88 03         [ 4]  547     CALL NROT 
      00B0E8 CD A5 C8         [ 4]  548     CALL DABS 
      00B0EB                        549 FSTAR1: ; scale down 32 bit to 24 bits 
      00B0EB CD 86 16         [ 4]  550     CALL DUPP
      00306E                        551     _DOLIT 0X7F   
      00B0EE CD 84 F1         [ 4]    1     CALL DOLIT 
      00B0F1 00 7F                    2     .word 0X7F 
      00B0F3 CD 89 41         [ 4]  552     CALL GREAT 
      003076                        553     _QBRAN FSTAR2 
      00B0F6 CD 85 24         [ 4]    1     CALL QBRAN
      00B0F9 B1 17                    2     .word FSTAR2
      00307B                        554     _DOLIT 10 
      00B0FB CD 84 F1         [ 4]    1     CALL DOLIT 
      00B0FE 00 0A                    2     .word 10 
      00B100 CD A5 F8         [ 4]  555     CALL DSLMOD 
      00B103 CD 87 E4         [ 4]  556     CALL ROT 
      00B106 CD 86 0C         [ 4]  557     CALL DROP
      00B109 CD 85 C0         [ 4]  558     CALL RFROM 
      00B10C CD 8B 43         [ 4]  559     CALL ONEP 
      00B10F CD 85 DF         [ 4]  560     CALL TOR  
      003092                        561     _BRAN FSTAR1
      00B112 CD 85 3B         [ 4]    1     CALL BRAN 
      00B115 B0 EB                    2     .word FSTAR1 
      00B117                        562 FSTAR2:
      00B117 CD 87 E4         [ 4]  563     CALL ROT 
      00309A                        564     _QBRAN FSTAR3 
      00B11A CD 85 24         [ 4]    1     CALL QBRAN
      00B11D B1 22                    2     .word FSTAR3
      00B11F CD 88 82         [ 4]  565     CALL DNEGA 
      00B122                        566 FSTAR3:     
      00B122 CD 85 C0         [ 4]  567     CALL RFROM 
      00B125 CD AD 86         [ 4]  568     CALL STEXP 
      00B128 81               [ 4]  569     RET 
                                    570 
                                    571 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    572 ;  F/ ( f#1 f#2 -- f#3 )
                                    573 ;  float division
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



                                    574 ;  f#3 = f#1/f#2
                                    575 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0030A9                        576     _HEADER FSLASH,2,"F/"
      00B129 B0 C7                    1         .word LINK 
                           0030AB     2         LINK=.
      00B12B 02                       3         .byte 2  
      00B12C 46 2F                    4         .ascii "F/"
      00B12E                          5         FSLASH:
      00B12E CD AD 3C         [ 4]  577     CALL ATEXP  ; f#1 dm2 e2  
      00B131 CD 85 DF         [ 4]  578     CALL TOR    ; f#1 dm2   R: e2 
      00B134 CD A5 DF         [ 4]  579     CALL DSIGN  ; f#1 dm2 s2 
      00B137 CD 85 DF         [ 4]  580     CALL TOR    ; f#1 dm2  R: e2 s2 
      00B13A CD A5 C8         [ 4]  581     CALL DABS   ; f#1 +dm2 
      00B13D CD A6 E9         [ 4]  582     CALL DSWAP  ; +dm2 f#1 
      00B140 CD AD 3C         [ 4]  583     CALL ATEXP  ; +dm2 dm1 e1 
      00B143 CD 85 C0         [ 4]  584     CALL RFROM  ; +dm2 dm1 e1 s2 
      00B146 CD 86 26         [ 4]  585     CALL SWAPP  ; +dm2 dm1 s1 e1 
      00B149 CD 85 DF         [ 4]  586     CALL TOR    ; +dm2 dm1 s2 R: e2 e1  
      00B14C CD 88 03         [ 4]  587     CALL NROT   ; +dm2 s2 dm1 
      00B14F CD A5 DF         [ 4]  588     CALL DSIGN  ; +dm2 s2 dm1 s1 
      00B152 CD 88 03         [ 4]  589     CALL NROT   ; +dm2 s2 s1 dm1 
      00B155 CD A5 C8         [ 4]  590     CALL DABS   ; +dm2 s2 s1 +dm1  
      00B158 CD 85 DF         [ 4]  591     CALL TOR    
      00B15B CD 85 DF         [ 4]  592     CALL TOR    ; +dm2 s2 s1 R: e2 e1 +dm1  
      00B15E CD 86 9E         [ 4]  593     CALL XORR   ; +dm2 s R: e2 e1 +dm1 
      00B161 CD 88 03         [ 4]  594     CALL NROT   ; s +dm2 
      00B164 CD 85 C0         [ 4]  595     CALL RFROM 
      00B167 CD 85 C0         [ 4]  596     CALL RFROM  ; s +dm2 +dm1 
      00B16A CD A6 E9         [ 4]  597     CALL DSWAP  ; s +dm1 +dm2 
      00B16D                        598 FSLASH1:
      00B16D CD 86 16         [ 4]  599     CALL DUPP 
      0030F0                        600     _QBRAN FSLASH4 
      00B170 CD 85 24         [ 4]    1     CALL QBRAN
      00B173 B1 A2                    2     .word FSLASH4
      00B175                        601 FSLASH2: 
                                    602 ; reduce divisor
      0030F5                        603     _DOLIT 10 
      00B175 CD 84 F1         [ 4]    1     CALL DOLIT 
      00B178 00 0A                    2     .word 10 
      00B17A CD A5 F8         [ 4]  604     CALL DSLMOD
      00B17D CD 87 E4         [ 4]  605     CALL ROT 
      00B180 CD 86 0C         [ 4]  606     CALL DROP ; drop remainder 
      00B183 CD 85 DF         [ 4]  607     CALL TOR 
      00B186 CD 85 DF         [ 4]  608     CALL TOR
                                    609 ; redure divident      
      003109                        610     _DOLIT 10 
      00B189 CD 84 F1         [ 4]    1     CALL DOLIT 
      00B18C 00 0A                    2     .word 10 
      00B18E CD A5 F8         [ 4]  611     CALL DSLMOD 
      00B191 CD 87 E4         [ 4]  612     CALL ROT    
      00B194 CD 86 0C         [ 4]  613     CALL DROP    ; drop remainder 
      00B197 CD 85 C0         [ 4]  614     CALL RFROM 
      00B19A CD 85 C0         [ 4]  615     CALL RFROM   ; s +dm1 +dm2 
      00311D                        616     _BRAN FSLASH1 
      00B19D CD 85 3B         [ 4]    1     CALL BRAN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



      00B1A0 B1 6D                    2     .word FSLASH1 
      00B1A2                        617 FSLASH4:
      00B1A2 CD 86 0C         [ 4]  618     CALL DROP   ; drop divisor hi, is 0 
      00B1A5 CD A5 F8         [ 4]  619     CALL DSLMOD 
                                    620 ; scale up dquot to include remainder 
      003128                        621     _DOLIT 2 
      00B1A8 CD 84 F1         [ 4]    1     CALL DOLIT 
      00B1AB 00 02                    2     .word 2 
      00B1AD CD 8C 08         [ 4]  622     CALL PICK 
      00B1B0 CD 88 03         [ 4]  623     CALL NROT  ; s r r dquot 
      00B1B3                        624 FSL1:
      003133                        625     _DOLIT 2
      00B1B3 CD 84 F1         [ 4]    1     CALL DOLIT 
      00B1B6 00 02                    2     .word 2 
      00B1B8 CD 8C 08         [ 4]  626     CALL PICK 
      00313B                        627     _QBRAN FSL4 
      00B1BB CD 85 24         [ 4]    1     CALL QBRAN
      00B1BE B1 E4                    2     .word FSL4
      003140                        628     _DOLIT 10 
      00B1C0 CD 84 F1         [ 4]    1     CALL DOLIT 
      00B1C3 00 0A                    2     .word 10 
      00B1C5 CD A6 A0         [ 4]  629     CALL DSSTAR
      00B1C8 CD 85 C0         [ 4]  630     CALL RFROM 
      00B1CB CD 8B 50         [ 4]  631     CALL ONEM 
      00B1CE CD 85 DF         [ 4]  632     CALL TOR 
      00B1D1 CD 87 E4         [ 4]  633     CALL ROT 
      003154                        634     _DOLIT 10 
      00B1D4 CD 84 F1         [ 4]    1     CALL DOLIT 
      00B1D7 00 0A                    2     .word 10 
      00B1D9 CD 8A 69         [ 4]  635     CALL SLASH 
      00B1DC CD 88 03         [ 4]  636     CALL NROT 
      00315F                        637     _BRAN FSL1 
      00B1DF CD 85 3B         [ 4]    1     CALL BRAN 
      00B1E2 B1 B3                    2     .word FSL1 
      00B1E4                        638 FSL4:
      00B1E4 CD 87 E4         [ 4]  639     CALL ROT
      00B1E7 CD 85 DF         [ 4]  640     CALL TOR 
      00B1EA CD 87 E4         [ 4]  641     CALL ROT 
      00B1ED CD 85 C0         [ 4]  642     CALL RFROM 
      00B1F0 CD AB 60         [ 4]  643     CALL DPLUS  
      00B1F3 CD 87 E4         [ 4]  644     CALL ROT    ; dquot s 
      003176                        645     _QBRAN FSLASH5 
      00B1F6 CD 85 24         [ 4]    1     CALL QBRAN
      00B1F9 B1 FE                    2     .word FSLASH5
      00B1FB CD 88 82         [ 4]  646     CALL DNEGA  ; negate quotient 
      00B1FE                        647 FSLASH5:
      00B1FE CD 85 C0         [ 4]  648     CALL RFROM 
      00B201 CD 85 C0         [ 4]  649     CALL RFROM 
      00B204 CD 88 45         [ 4]  650     CALL PLUS   
      00B207 CD AD 86         [ 4]  651     CALL STEXP 
      00B20A 81               [ 4]  652     RET     
                                    653 
                                    654 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    655 ;   SCALE> ( # -- #  )
                                    656 ;   scale down a double dividing it 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



                                    657 ;   by 10;  
                                    658 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00318B                        659     _HEADER SCALETO,6,"SCALE>"
      00B20B B1 2B                    1         .word LINK 
                           00318D     2         LINK=.
      00B20D 06                       3         .byte 6  
      00B20E 53 43 41 4C 45 3E        4         .ascii "SCALE>"
      00B214                          5         SCALETO:
      00B214 CD A5 DF         [ 4]  660     CALL DSIGN 
      00B217 CD 85 DF         [ 4]  661     CALL TOR 
      00B21A CD A5 C8         [ 4]  662     CALL DABS 
      00B21D                        663 SCAL1:
      00319D                        664     _DOLIT 10 
      00B21D CD 84 F1         [ 4]    1     CALL DOLIT 
      00B220 00 0A                    2     .word 10 
      00B222 CD A5 F8         [ 4]  665     CALL DSLMOD 
      00B225 CD 87 E4         [ 4]  666     CALL ROT  
      00B228 CD 86 0C         [ 4]  667     CALL DROP 
      00B22B CD 85 C0         [ 4]  668     CALL RFROM 
      0031AE                        669     _QBRAN SCAL2 
      00B22E CD 85 24         [ 4]    1     CALL QBRAN
      00B231 B2 36                    2     .word SCAL2
      00B233 CD A5 9E         [ 4]  670     CALL DNEGAT 
      00B236                        671 SCAL2: 
      00B236 81               [ 4]  672     RET 
                                    673 
                                    674 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    675 ;   D>F  ( # -- f# )
                                    676 ;   convert double to float 
                                    677 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0031B7                        678     _HEADER DTOF,3,"D>F"
      00B237 B2 0D                    1         .word LINK 
                           0031B9     2         LINK=.
      00B239 03                       3         .byte 3  
      00B23A 44 3E 46                 4         .ascii "D>F"
      00B23D                          5         DTOF:
      00B23D CD A5 DF         [ 4]  679     CALL DSIGN 
      00B240 CD 85 DF         [ 4]  680     CALL TOR
      00B243 CD A5 C8         [ 4]  681     CALL DABS  
      00B246 CD 8B AF         [ 4]  682     CALL ZERO 
      00B249 CD 88 03         [ 4]  683     CALL NROT
      00B24C                        684 DTOF1:      
      00B24C CD 88 30         [ 4]  685     CALL DDUP 
      0031CF                        686     _DOLIT 0XFFFF 
      00B24F CD 84 F1         [ 4]    1     CALL DOLIT 
      00B252 FF FF                    2     .word 0XFFFF 
      0031D4                        687     _DOLIT 0X7F 
      00B254 CD 84 F1         [ 4]    1     CALL DOLIT 
      00B257 00 7F                    2     .word 0X7F 
      00B259 CD A7 DE         [ 4]  688     CALL DGREAT 
      0031DC                        689     _QBRAN DTOF4
      00B25C CD 85 24         [ 4]    1     CALL QBRAN
      00B25F B2 72                    2     .word DTOF4
      00B261 CD 87 E4         [ 4]  690     CALL ROT 
      00B264 CD 8B 43         [ 4]  691     CALL ONEP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      00B267 CD 88 03         [ 4]  692     CALL NROT 
      00B26A CD B2 14         [ 4]  693     CALL SCALETO 
      0031ED                        694     _BRAN DTOF1 
      00B26D CD 85 3B         [ 4]    1     CALL BRAN 
      00B270 B2 4C                    2     .word DTOF1 
      00B272                        695 DTOF4:     
      00B272 CD 85 C0         [ 4]  696     CALL RFROM 
      0031F5                        697     _QBRAN DTOF6
      00B275 CD 85 24         [ 4]    1     CALL QBRAN
      00B278 B2 7D                    2     .word DTOF6
      00B27A CD A5 9E         [ 4]  698     CALL DNEGAT 
      00B27D                        699 DTOF6: 
      00B27D CD 87 E4         [ 4]  700     CALL ROT 
      00B280 CD AD 86         [ 4]  701     CALL STEXP 
      00B283 81               [ 4]  702     RET 
                                    703 
                                    704 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    705 ;   F>D  ( f# -- # )
                                    706 ;  convert float to double 
                                    707 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003204                        708     _HEADER FTOD,3,"F>D"
      00B284 B2 39                    1         .word LINK 
                           003206     2         LINK=.
      00B286 03                       3         .byte 3  
      00B287 46 3E 44                 4         .ascii "F>D"
      00B28A                          5         FTOD:
      00B28A CD AD 3C         [ 4]  709     CALL ATEXP 
      00B28D CD 87 D3         [ 4]  710     CALL QDUP
      003210                        711     _QBRAN FTOD8
      00B290 CD 85 24         [ 4]    1     CALL QBRAN
      00B293 B2 EC                    2     .word FTOD8
      00B295 CD 86 16         [ 4]  712     CALL DUPP   
      00B298 CD 86 4F         [ 4]  713     CALL ZLESS 
      00321B                        714     _QBRAN FTOD4 
      00B29B CD 85 24         [ 4]    1     CALL QBRAN
      00B29E B2 D4                    2     .word FTOD4
                                    715 ; negative exponent 
      00B2A0 CD 88 D8         [ 4]  716     CALL ABSS 
      00B2A3 CD 85 DF         [ 4]  717     CALL TOR
      003226                        718     _BRAN FTOD2  
      00B2A6 CD 85 3B         [ 4]    1     CALL BRAN 
      00B2A9 B2 C7                    2     .word FTOD2 
      00B2AB                        719 FTOD1:
      00B2AB CD 88 30         [ 4]  720     CALL DDUP 
      00B2AE CD A5 80         [ 4]  721     CALL DZEQUAL 
      00B2B1 CD 88 5F         [ 4]  722     CALL INVER 
      003234                        723     _QBRAN FTOD3 
      00B2B4 CD 85 24         [ 4]    1     CALL QBRAN
      00B2B7 B2 CD                    2     .word FTOD3
      003239                        724     _DOLIT 10 
      00B2B9 CD 84 F1         [ 4]    1     CALL DOLIT 
      00B2BC 00 0A                    2     .word 10 
      00B2BE CD A5 F8         [ 4]  725     CALL DSLMOD 
      00B2C1 CD 87 E4         [ 4]  726     CALL ROT 
      00B2C4 CD 86 0C         [ 4]  727     CALL DROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      00B2C7                        728 FTOD2:      
      003247                        729     _DONXT FTOD1
      00B2C7 CD 85 05         [ 4]    1     CALL DONXT 
      00B2CA B2 AB                    2     .word FTOD1 
      00B2CC 81               [ 4]  730     RET  
      00B2CD                        731 FTOD3: 
      00B2CD CD 85 C0         [ 4]  732     CALL RFROM 
      00B2D0 CD 86 0C         [ 4]  733     CALL DROP 
      00B2D3 81               [ 4]  734     RET 
                                    735 ; positive exponent 
      00B2D4                        736 FTOD4:
      00B2D4 CD 85 DF         [ 4]  737     CALL TOR 
      003257                        738     _BRAN FTOD6
      00B2D7 CD 85 3B         [ 4]    1     CALL BRAN 
      00B2DA B2 E7                    2     .word FTOD6 
      00B2DC                        739 FTOD5:
      00325C                        740     _DOLIT 10 
      00B2DC CD 84 F1         [ 4]    1     CALL DOLIT 
      00B2DF 00 0A                    2     .word 10 
      00B2E1 CD 8B AF         [ 4]  741     CALL ZERO 
      00B2E4 CD AA 14         [ 4]  742     CALL DSTAR 
      00B2E7                        743 FTOD6: 
      003267                        744     _DONXT FTOD5 
      00B2E7 CD 85 05         [ 4]    1     CALL DONXT 
      00B2EA B2 DC                    2     .word FTOD5 
      00B2EC                        745 FTOD8:     
      00B2EC 81               [ 4]  746     RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



                                   4781 .endif 
                                   4782 
                                   4783 ;===============================================================
                                   4784 
                           003206  4785 LASTN =	LINK   ;last name defined
                                   4786 
                                   4787 ; application code begin here
      00B300                       4788 	.bndry 128 ; align on flash block  
      00B300                       4789 app_space: 
                                   4790 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        000861 R   |   6 ABOR1      001342 R
  6 ABOR2      001359 R   |   6 ABORQ      00133A R   |   6 ABORT      00132B R
  6 ABRTQ      001616 R   |   6 ABSS       000858 R   |   6 ACCEP      0012C1 R
  6 ACCP1      0012CA R   |   6 ACCP2      0012F0 R   |   6 ACCP3      0012F3 R
  6 ACCP4      0012F5 R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
    ADC_CR1_=  000001     |     ADC_CR1_=  000004     |     ADC_CR1_=  000005 
    ADC_CR1_=  000006     |     ADC_CR2 =  005402     |     ADC_CR2_=  000003 
    ADC_CR2_=  000004     |     ADC_CR2_=  000005     |     ADC_CR2_=  000006 
    ADC_CR2_=  000001     |     ADC_CR3 =  005403     |     ADC_CR3_=  000007 
    ADC_CR3_=  000006     |     ADC_CSR =  005400     |     ADC_CSR_=  000006 
    ADC_CSR_=  000004     |     ADC_CSR_=  000000     |     ADC_CSR_=  000001 
    ADC_CSR_=  000002     |     ADC_CSR_=  000003     |     ADC_CSR_=  000007 
    ADC_CSR_=  000005     |     ADC_DRH =  005404     |     ADC_DRL =  005405 
    ADC_TDRH=  005406     |     ADC_TDRL=  005407     |   6 ADRADJ     000743 R
    AFR     =  004803     |     AFR0_ADC=  000000     |     AFR1_TIM=  000001 
    AFR2_CCO=  000002     |     AFR3_TIM=  000003     |     AFR4_TIM=  000004 
    AFR5_TIM=  000005     |     AFR6_I2C=  000006     |     AFR7_BEE=  000007 
  6 AFT        001601 R   |   6 AGAIN      001557 R   |   6 AHEAD      0015B4 R
  6 ALLOT      00146A R   |   6 ANDD       0005F5 R   |     APP_CP  =  004004 
    APP_LAST=  004000     |     APP_RUN =  004002     |     APP_VP  =  004006 
  6 AT         0004EF R   |   6 ATEXE      000C53 R   |   6 ATEXP      002CBC R
  6 AUTORUN    000129 R   |     AWU_APR =  0050F1     |     AWU_CSR =  0050F0 
    AWU_TBR =  0050F2     |     B0_MASK =  000001     |     B115200 =  000006 
  6 B115K2     0003E0 R   |     B19200  =  000003     |   6 B19K2      0003BD R
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
  6 B2K4       00038E R   |     B2_MASK =  000004     |     B38400  =  000004 
    B3_MASK =  000008     |     B460800 =  000008     |     B4800   =  000001 
  6 B4K8       00039C R   |     B4_MASK =  000010     |     B57600  =  000005 
  6 B57K6      0003CE R   |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
  6 B9K6       0003AC R   |   6 BACK1      001269 R   |   6 BASE       000666 R
    BASEE   =  00000A     |   6 BAUD       0003F0 R   |     BCNT    =  000001 
  6 BCOMP      0014AC R   |   6 BDIGS      000D3A R   |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
  6 BEGIN      001539 R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
  6 BKSLA      0010BE R   |   6 BKSP       001239 R   |     BKSPP   =  000008 
  6 BLANK      000B22 R   |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |   6 BRAN       0004BB R   |     BTW     =  000001 
  6 BUF2ROW    00207E R   |   6 BYE        0000B6 R   |     CADR    =  000003 
    CALLL   =  0000CD     |   6 CALLOT     0022C7 R   |     CAN_DGR =  005426 
    CAN_FPSR=  005427     |     CAN_IER =  005425     |     CAN_MCR =  005420 
    CAN_MSR =  005421     |     CAN_P0  =  005428     |     CAN_P1  =  005429 
    CAN_P2  =  00542A     |     CAN_P3  =  00542B     |     CAN_P4  =  00542C 
    CAN_P5  =  00542D     |     CAN_P6  =  00542E     |     CAN_P7  =  00542F 
    CAN_P8  =  005430     |     CAN_P9  =  005431     |     CAN_PA  =  005432 
    CAN_PB  =  005433     |     CAN_PC  =  005434     |     CAN_PD  =  005435 
    CAN_PE  =  005436     |     CAN_PF  =  005437     |     CAN_RFR =  005424 
    CAN_TPR =  005423     |     CAN_TSR =  005422     |     CARRY   =  00002A 
    CASE_SEN=  000000     |   6 CAT        00050D R   |   6 CCOMMA     00148E R
    CC_C    =  000000     |     CC_H    =  000004     |     CC_I0   =  000003 
    CC_I1   =  000005     |     CC_N    =  000002     |     CC_V    =  000007 
    CC_Z    =  000001     |     CELLL   =  000002     |   6 CELLM      000AA7 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]

Symbol Table

  6 CELLP      000A98 R   |   6 CELLS      000AB6 R   |     CFG_GCR =  007F60 
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   6 CHAR1      000E90 R
  6 CHAR2      000E93 R   |   6 CHKIVEC    001F6C R   |     CLKOPT  =  004807 
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
    CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2     |   6 CMOV1      000C72 R
  6 CMOV2      000C8A R   |   6 CMOVE      000C6A R   |     CNTDWN  =  000032 
  6 CNTXT      0006E9 R   |   6 COLD       001A6D R   |   6 COLD1      001A6D R
  6 COLON      0017BF R   |   6 COMMA      001477 R   |   6 COMPI      0014BC R
    COMPO   =  000040     |   6 CONSTANT   001869 R   |   6 COUNT      000C06 R
  6 CPP        000705 R   |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
  6 CR         000EBE R   |   6 CREAT      001805 R   |     CRR     =  00000D 
  6 CSTOR      0004FC R   |   6 CTABLE     0022E8 R   |   6 CTAT       002309 R
  6 CTINIT     002331 R   |   6 D2SLASH    0028C6 R   |   6 D2STAR     0028DD R
  6 DABS       002548 R   |   6 DABS1      002556 R   |   6 DAT        000BE6 R
    DATSTK  =  001680     |   6 DCLZ       002697 R   |   6 DCLZ1      0026A0 R
  6 DCLZ4      0026A9 R   |   6 DCLZ8      0026B6 R   |   6 DCMP       0027B4 R
  6 DCMP2      0027C0 R   |   6 DCMP4      0027DB R   |   6 DCMP_EQU   0027CD R
  6 DCMP_GRE   0027D7 R   |   6 DCMP_SMA   0027D1 R   |   6 DCONST     00189E R
  6 DDIG       0025B9 R   |   6 DDIGS      0025D2 R   |   6 DDOT       0025E9 R
  6 DDOT0      0025FD R   |   6 DDOT1      002613 R   |   6 DDROP      0007A5 R
  6 DDSLMOD    00292F R   |   6 DDSLMOD1   00294C R   |   6 DDSTAR3    0029ED R
  6 DDUP       0007B0 R   |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  6 DECIM      000DEA R   |   6 DEPTH      000B71 R   |   6 DEQU4      002752 R
  6 DEQUAL     00273D R   |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  6 DGREAT     00275E R   |   6 DGREAT4    002773 R   |   6 DGTQ1      000E2F R
  6 DI         0000C4 R   |   6 DIG        000D63 R   |   6 DIGIT      000CFE R
  6 DIGS       000D74 R   |   6 DIGS1      000D74 R   |   6 DIGS2      000D81 R
  6 DIGTQ      000DFE R   |     DISCOVER=  000000     |   6 DLESS      00277F R
  6 DLESS4     002795 R   |   6 DLITER     002886 R   |   6 DLSHIFT    0028F9 R
  6 DLSHIFT1   00290A R   |   6 DLSHIFT2   00291F R   |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |   6 DN1        00081F R   |   6 DNEG1      00253D R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]

Symbol Table

  6 DNEGA      000802 R   |   6 DNEGAT     00251E R   |   6 DOCONST    001889 R
  6 DOLIT      000471 R   |   6 DONXT      000485 R   |     DOORBELL=  000000 
  6 DOSTR      000ED4 R   |   6 DOT        000F77 R   |   6 DOT1       000F8D R
  6 DOTI1      0019EE R   |   6 DOTID      0019D8 R   |   6 DOTO1      0013CE R
  6 DOTOK      0013B4 R   |   6 DOTPR      0010A0 R   |   6 DOTQ       001630 R
  6 DOTQP      000EFD R   |   6 DOTR       000F0B R   |   6 DOTS       00197A R
  6 DOTS1      001985 R   |   6 DOTS2      00198E R   |   6 DOVAR      000656 R
  6 DOVER      0028AD R   |   6 DO_DCONS   0018C1 R   |   6 DPLUS      002AE0 R
  6 DPLUS1     002B07 R   |   6 DRAT       00281C R   |   6 DRFROM     002804 R
  6 DROP       00058C R   |   6 DROT       002703 R   |   6 DSIGN      00255F R
  6 DSIGN1     002569 R   |   6 DSLA1      002A0D R   |   6 DSLA2      002A2F R
  6 DSLA3      002A6C R   |   6 DSLA4      002A95 R   |   6 DSLA7      002AC6 R
  6 DSLA8      002AC9 R   |   6 DSLA9      002ADA R   |   6 DSLASH     0029F3 R
  6 DSLMOD     002578 R   |   6 DSLMOD3    002593 R   |   6 DSLMOD4    00259F R
  6 DSLMODa    00259A R   |   6 DSLMODb    0025A5 R   |   6 DSSTAR     002620 R
  6 DSSTAR1    002637 R   |   6 DSSTAR3    002660 R   |   6 DSTAR      002994 R
  6 DSTOR      000BC0 R   |   6 DSUB       002B12 R   |   6 DSUB1      002B39 R
  6 DSWAP      002669 R   |   6 DTOF       0031BD R   |   6 DTOF1      0031CC R
  6 DTOF4      0031F2 R   |   6 DTOF6      0031FD R   |   6 DTOR       0027E6 R
  6 DUMP       001930 R   |   6 DUMP1      001947 R   |   6 DUMP3      001969 R
  6 DUMPP      0018FF R   |   6 DUPP       000596 R   |   6 DVARIA     00283A R
  6 DZEQUAL    002500 R   |   6 DZLESS     00279C R   |   6 DZLESS1    0027A6 R
  6 EDIGS      000D9F R   |   6 EDOT       002D85 R   |   6 EDOT0      002D9C R
  6 EDOT1      002DAA R   |   6 EDOT2      002DB0 R   |   6 EDOT3      002DC9 R
  6 EDOT4      002DF5 R   |   6 EDOT5      002E11 R   |   6 EECSTORE   001D1D R
  6 EEPCP      001B43 R   |   6 EEPLAST    001B16 R   |   6 EEPROM     001AFE R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_R=  000010 
    EEPROM_S=  000800     |   6 EEPRUN     001B2D R   |   6 EEPVP      001B59 R
  6 EESTORE    001D69 R   |   6 EE_CCOMM   002033 R   |   6 EE_COMMA   002012 R
  6 EE_CREAD   001CAE R   |   6 EE_READ    001C8C R   |   6 EI         0000BD R
  6 ELSEE      00158F R   |   6 EMIT       000436 R   |   6 ENEPER     002253 R
    EOL_CR  =  000001     |     EOL_LF  =  000000     |   6 EQ1        00087C R
  6 EQUAL      000866 R   |   6 ERASE      000CCC R   |     ERR     =  00001B 
  6 EVAL       0013F7 R   |   6 EVAL1      0013F7 R   |   6 EVAL2      001413 R
  6 EXE1       000C61 R   |   6 EXECU      0004CB R   |     EXT     =  000000 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |   6 EXTRC      000D26 R
  6 FADDR      002100 R   |   6 FARAT      001BC4 R   |   6 FARCAT     001BD0 R
  6 FC_XOFF    000463 R   |   6 FC_XON     00044D R   |   6 FDOT       002E20 R
  6 FDOT0      002E5E R   |   6 FDOT1      002E4D R   |   6 FDOT10     002EBA R
  6 FDOT2      002E6C R   |   6 FDOT3      002E85 R   |   6 FDOT6      002E95 R
  6 FDOT7      002E9A R   |   6 FDOT8      002EA2 R   |   6 FDOT9      002EAA R
  6 FER        002BBF R   |     FHSE    =  7A1200     |     FHSI    =  F42400 
  6 FILL       000C99 R   |   6 FILL1      000CB6 R   |   6 FILL2      000CBF R
  6 FIND       001195 R   |   6 FIND1      0011B3 R   |   6 FIND2      0011E1 R
  6 FIND3      0011ED R   |   6 FIND4      001201 R   |   6 FIND5      00120E R
  6 FIND6      0011F2 R   |   6 FINIT      002BB5 R   |     FLASH_BA=  008000 
    FLASH_CR=  00505A     |     FLASH_CR=  000002     |     FLASH_CR=  000000 
    FLASH_CR=  000003     |     FLASH_CR=  000001     |     FLASH_CR=  00505B 
    FLASH_CR=  000005     |     FLASH_CR=  000004     |     FLASH_CR=  000007 
    FLASH_CR=  000000     |     FLASH_CR=  000006     |     FLASH_DU=  005064 
    FLASH_DU=  0000AE     |     FLASH_DU=  000056     |     FLASH_EN=  027FFF 
    FLASH_FP=  00505D     |     FLASH_FP=  000000     |     FLASH_FP=  000001 
    FLASH_FP=  000002     |     FLASH_FP=  000003     |     FLASH_FP=  000004 
    FLASH_FP=  000005     |     FLASH_IA=  00505F     |     FLASH_IA=  000003 
    FLASH_IA=  000002     |     FLASH_IA=  000006     |     FLASH_IA=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_IA=  000000     |     FLASH_NC=  00505C     |     FLASH_NF=  00505E 
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |   6 FLOATQ     002F32 R
  6 FLOATQ0    002F3C R   |   6 FLOATQ1    002FA1 R   |   6 FLOATQ2    002FAA R
  6 FLOATQ3    002FB2 R   |   6 FLOATQ4    002FC6 R   |   6 FLOAT_ER   002FDB R
  6 FLOAT_ER   002FD8 R   |     FLSI    =  01F400     |   6 FMOVE      00210B R
  6 FMOVE2     00213C R   |   6 FNE        002BE1 R   |   6 FOR        00150C R
  6 FORGET     00015A R   |   6 FORGET1    000189 R   |   6 FORGET2    00020F R
  6 FORGET4    000218 R   |   6 FORGET6    0001D1 R   |   6 FOV        002BF6 R
  6 FPSTOR     001ADF R   |   6 FPSW       002B8F R   |     FPTR    =  000034 
  6 FREEVAR    000225 R   |   6 FREEVAR4   00025B R   |   6 FRESET     002BA1 R
  6 FSL1       003133 R   |   6 FSL4       003164 R   |   6 FSLASH     0030AE R
  6 FSLASH1    0030ED R   |   6 FSLASH2    0030F5 R   |   6 FSLASH4    003122 R
  6 FSLASH5    00317E R   |   6 FSTAR      00304A R   |   6 FSTAR1     00306B R
  6 FSTAR2     003097 R   |   6 FSTAR3     0030A2 R   |   6 FTOD       00320A R
  6 FTOD1      00322B R   |   6 FTOD2      003247 R   |   6 FTOD3      00324D R
  6 FTOD4      003254 R   |   6 FTOD5      00325C R   |   6 FTOD6      003267 R
  6 FTOD8      00326C R   |   6 FZE        002BCC R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
  6 GREAT      0008C1 R   |   6 GREAT1     0008D7 R   |   6 HDOT       000F5A R
  6 HERE       000C1D R   |   6 HEX        000DD5 R   |   6 HI         001A2A R
  6 HLD        0006D6 R   |   6 HOLD       000D4A R   |     HSECNT  =  004809 
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
  6 ICOLON     0017D0 R   |   6 IFETCH     00152A R   |   6 IFF        001567 R
  6 IFMOVE     0021E4 R   |   6 ILOG       002B46 R   |   6 ILOG1      002B51 R
  6 ILOG2      002B7E R   |     IMEDD   =  000080     |   6 IMMED      0017E2 R
  6 INCH       00042A R   |   6 INC_FPTR   001C59 R   |   6 INITOFS    001798 R
  6 INN        000684 R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
    INPUT_FL=  000000     |     INPUT_PU=  000001     |   6 INTE1      001396 R
  6 INTER      00136C R   |   6 INTQ       00238D R   |     INT_ADC2=  000016 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]

Symbol Table

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
  6 INVER      0007DF R   |     IPR0    =  000002     |     IPR1    =  000001 
    IPR2    =  000000     |     IPR3    =  000003     |     IPR_MASK=  000003 
    IRET_COD=  000080     |   6 ISEMI      00172D R   |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   6 JSRC       001782 R   |   6 KEY        000E3E R
  6 KTAP       001286 R   |   6 KTAP1      0012A9 R   |   6 KTAP2      0012AC R
  6 LAST       000715 R   |   6 LASTN   =  003206 R   |   6 LBRAC      0013A3 R
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
  6 LESS       0008A3 R   |     LF      =  00000A     |   6 LINK    =  003206 R
  6 LITER      0014DE R   |   6 LN2S       0022AF R   |   6 LOCK       001C45 R
  6 LOG2S      002299 R   |   6 LSCALE     002FFC R   |   6 LSHIFT     000AE1 R
  6 LSHIFT1    000AEA R   |   6 LSHIFT4    000AF2 R   |   6 LT1        0008B9 R
    MASKK   =  001F7F     |   6 MAX        0008E1 R   |   6 MAX1       0008F4 R
  6 MIN        0008FE R   |   6 MIN1       000911 R   |   6 MMOD1      00099A R
  6 MMOD2      0009AE R   |   6 MMOD3      0009C5 R   |   6 MMSM1      000955 R
  6 MMSM3      000959 R   |   6 MMSM4      000965 R   |   6 MMSMa      000960 R
  6 MMSMb      00096B R   |   6 MODD       0009DF R   |   6 MONE       000B48 R
    MS      =  000030     |   6 MSEC       0002D0 R   |   6 MSMOD      00097D R
  6 MSTA1      000A70 R   |   6 MSTAR      000A4D R   |     NAFR    =  004804 
  6 NAMEQ      00122E R   |   6 NAMET      00113F R   |     NCLKOPT =  004808 
  6 NDROT      0026C7 R   |   6 NEGAT      0007F0 R   |   6 NEX1       000492 R
  6 NEXT       00151B R   |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   6 NROT       000783 R
  6 NTIB       000694 R   |     NUBC    =  004802     |     NUCLEO  =  000001 
  6 NUFQ       000E54 R   |   6 NUFQ1      000E6D R   |   6 NUMBQ      002436 R
  6 NUMQ0      002477 R   |   6 NUMQ1      002499 R   |   6 NUMQ3      0024C3 R
  6 NUMQ4      0024E7 R   |   6 NUMQ8      0024F0 R   |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   6 NonHandl   000000 R   |   6 OFFSET     00073A R
    OFS     =  000005     |   6 ONE        000B3A R   |   6 ONEM       000AD0 R
  6 ONEP       000AC3 R   |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTIMIZE=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]

Symbol Table

    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  6 ORIG       000049 R   |   6 ORR        000609 R   |   6 OUTPUT     00043B R
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |   6 OVER       0005C0 R   |   6 OVERT      0016FB R
    PA      =  000000     |   6 PACKS      000CDD R   |   6 PAD        000C2E R
  6 PAREN      0010AF R   |   6 PARS       000FA8 R   |   6 PARS1      000FD3 R
  6 PARS2      000FFE R   |   6 PARS3      001001 R   |   6 PARS4      00100A R
  6 PARS5      00102D R   |   6 PARS6      001042 R   |   6 PARS7      001051 R
  6 PARS8      001060 R   |   6 PARSE      001071 R   |   6 PARSEXP_   002F15 R
  6 PAUSE      0002E0 R   |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |   6 PDUM1      001912 R   |   6 PDUM2      001923 R
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
    PH_ODR  =  005023     |     PI      =  000028     |   6 PICK       000B88 R
  6 PII        002212 R   |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   6 PLUS       0007C5 R   |   6 PNAM1      0016A0 R
  6 POSMANT    002CF6 R   |   6 PRESE      001422 R   |     PROD1   =  000024 
    PROD2   =  000026     |     PROD3   =  000028     |   6 PROTECTE   000201 R
  6 PSTOR      000B9F R   |     PTR16   =  000035     |     PTR8    =  000036 
  6 PTRPLUS    001C71 R   |   6 QBRAN      0004A4 R   |   6 QDUP       000753 R
  6 QDUP1      00075D R   |   6 QKEY       000418 R   |   6 QSTAC      0013DA R
  6 QUERY      001306 R   |   6 QUEST      000F9A R   |   6 QUIT       00143F R
  6 QUIT1      001447 R   |   6 QUIT2      00144A R   |   6 RAM2EE     0020AC R
    RAMBASE =  000000     |   6 RAMLAST    000728 R   |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   6 RANDOM     00027E R
  6 RAT        000553 R   |   6 RBRAC      00176F R   |   6 REPEA      0015E4 R
  6 RFREE      002093 R   |   6 RFROM      000540 R   |     ROP     =  004800 
  6 ROT        000764 R   |   6 ROW2BUF    002055 R   |     ROWBUFF =  001680 
    RP0     =  00002E     |   6 RPAT       00051D R   |     RPP     =  0017FF 
  6 RPSTO      00052A R   |   6 RSCALE     003022 R   |   6 RSHIFT     000AFD R
  6 RSHIFT1    000B06 R   |   6 RSHIFT4    000B0E R   |     RST_SR  =  0050B3 
  6 RT12_2     002282 R   |   6 SAME1      00115D R   |   6 SAME2      001186 R
  6 SAMEQ      001155 R   |   6 SCAL1      00319D R   |   6 SCAL2      0031B6 R
  6 SCALETO    003194 R   |   6 SCOM1      0016D5 R   |   6 SCOM2      0016D8 R
  6 SCOMP      0016B7 R   |   6 SEED       000265 R   |     SEEDX   =  000038 
    SEEDY   =  00003A     |   6 SEMIS      00170B R   |   6 SETISP     0000D0 R
  6 SET_RAML   001852 R   |   6 SFN        002C63 R   |     SFR_BASE=  005000 
    SFR_END =  0057FF     |   6 SFV        002C9B R   |   6 SFZ        002C2C R
  6 SIGN       000D89 R   |   6 SIGN1      000D99 R   |   6 SLASH      0009E9 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]

Symbol Table

  6 SLMOD      0009CD R   |   6 SNAME      00166A R   |     SP0     =  00002C 
  6 SPACE      000E76 R   |   6 SPACS      000E85 R   |   6 SPAT       000576 R
    SPI_CR1 =  005200     |     SPI_CR2 =  005201     |     SPI_CRCP=  005205 
    SPI_DR  =  005204     |     SPI_ICR =  005202     |     SPI_RXCR=  005206 
    SPI_SR  =  005203     |     SPI_TXCR=  005207     |     SPP     =  001680 
    SPSAVE  =  000001     |   6 SPSTO      000583 R   |   6 SQRT10     00226B R
  6 SQRT2      002229 R   |   6 SQRT3      002240 R   |   6 SSMOD      000A79 R
    SSP     =  000001     |     STACK   =  0017FF     |   6 STAR       000A42 R
  6 STASL      000A8A R   |   6 STEXP      002D06 R   |   6 STEXP1     002D1C R
  6 STEXP2     002D58 R   |   6 STEXP3     002D6B R   |   6 STOD       000827 R
  6 STORE      0004D8 R   |   6 STR        000DB7 R   |   6 STRCQ      0014EC R
  6 STRQ       001623 R   |   6 STRQP      000EF3 R   |   6 SUBB       00083E R
  6 SWAPP      0005A6 R   |     SWIM_CSR=  007F80     |   6 TAP        001270 R
  6 TBOOT      001A61 R   |   6 TBUF       0006A4 R   |     TBUFFBAS=  001680 
  6 TCHAR      000B59 R   |   6 TEMP       000675 R   |   6 TEVAL      0006C7 R
  6 TFLASH     0006B6 R   |   6 THENN      00157C R   |   6 TIB        000C3F R
    TIBB    =  001700     |     TIBBASE =  001700     |     TIC     =  000027 
  6 TICK       001456 R   |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |   6 TNAM2      0019A8 R
  6 TNAM3      0019C6 R   |   6 TNAM4      0019CC R   |   6 TNAME      0019A5 R
  6 TOFLASH    000335 R   |   6 TOKEN      001131 R   |   6 TOR        00055F R
  6 TORAM      000375 R   |     TRUEE   =  00FFFF     |   6 TWOSL      000B15 R
  6 TYPE1      000EA5 R   |   6 TYPE2      000EB1 R   |   6 TYPES      000EA0 R
  6 Timer4Ha   000005 R   |     UART1   =  000000     |     UART1_BA=  005230 
    UART1_BR=  005232     |     UART1_BR=  005233     |     UART1_CR=  005234 
    UART1_CR=  005235     |     UART1_CR=  005236     |     UART1_CR=  005237 
    UART1_CR=  005238     |     UART1_DR=  005231     |     UART1_GT=  005239 
    UART1_PO=  000000     |     UART1_PS=  00523A     |     UART1_RX=  000004 
    UART1_SR=  005230     |     UART1_TX=  000005     |     UART3   =  000001 
    UART3_BA=  005240     |     UART3_BR=  005242     |     UART3_BR=  005243 
    UART3_CR=  005244     |     UART3_CR=  005245     |     UART3_CR=  005246 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]

Symbol Table

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
    UD3     =  000003     |     UD4     =  000004     |   6 UDOT       000F46 R
  6 UDOTR      000F26 R   |   6 UEND       000047 R   |     UFPSW   =  000008 
  6 UGREAT     002C0A R   |   6 UGREAT1    002C22 R   |     UHLD    =  000014 
    UINN    =  00000C     |     UINTER  =  000012     |     ULAST   =  00001C 
  6 ULES1      00089B R   |   6 ULESS      000885 R   |   6 UMMOD      000939 R
  6 UMSTA      0009F8 R   |   6 UNIQ1      001661 R   |   6 UNIQU      001642 R
  6 UNLKEE     001BDF R   |   6 UNLKFL     001BFE R   |   6 UNLOCK     001C1D R
  6 UNTIL      001544 R   |     UOFFSET =  00001E     |   6 UPDATCP    001B9C R
  6 UPDATLAS   001B73 R   |   6 UPDATPTR   00219F R   |   6 UPDATRUN   001B8B R
  6 UPDATVP    001BB3 R   |   6 UPL1       00064A R   |   6 UPLUS      000633 R
    UPP     =  000006     |   6 UPPER      0010F4 R   |   6 UPPER1     001117 R
  6 UPPER2     001120 R   |     URLAST  =  000022     |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |     UTFLASH =  000020 
    UTIB    =  000010     |     UTMP    =  00000A     |   6 UTYP1      0018E2 R
  6 UTYP2      0018F1 R   |   6 UTYPE      0018DD R   |     UVP     =  000018 
  6 UZERO      00002B R   |   6 VARIA      00181F R   |     VAR_BASE=  000080 
    VAR_TOP =  0017BF     |     VER     =  000003     |   6 VPP        0006F7 R
    VSIZE   =  000006     |     WANT_CON=  000001     |     WANT_DEB=  000000 
    WANT_DOU=  000001     |     WANT_FLO=  000001     |     WANT_SCA=  000001 
    WANT_SEE=  000000     |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
  6 WHILE      0015CA R   |   6 WITHI      00091E R   |   6 WORDD      0010DA R
  6 WORDS      001A02 R   |   6 WORS1      001A08 R   |   6 WORS2      001A24 R
  6 WR_BYTE    001CC8 R   |   6 WR_WORD    001CED R   |   6 WTABLE     0022F7 R
  6 WTAT       00231B R   |   6 WTINIT     002360 R   |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XMEM_SIZ=  017830     |     XOFF    =  000013 
    XON     =  000011     |   6 XORR       00061E R   |     XTEMP   =  000024 
    YTEMP   =  000026     |   6 ZEQ1       002510 R   |   6 ZEQU1      0005EB R
  6 ZEQUAL     0005E1 R   |   6 ZERO       000B2F R   |   6 ZL1        0005D8 R
  6 ZLESS      0005CF R   |   6 app_spac   003280 R   |   6 baudrate   00037B R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]

Symbol Table

  6 block_er   001DB3 R   |   6 clear_ra   000019 R   |   6 clock_in   000064 R
  6 copy_buf   001E13 R   |   6 copy_buf   001E32 R   |   6 copy_pro   001E32 R
    da      =  000002     |     db      =  000003     |     dc      =  000000 
    dd      =  000001     |   6 do2lit     002891 R   |   6 erase_fl   001DD5 R
  6 fmove_do   002188 R   |   6 main       000016 R   |   6 next_row   002145 R
  6 no_move    00218F R   |   6 nsign      0023AB R   |   6 nsign1     0023DC R
  6 parse_di   0023E3 R   |   6 parse_ex   002ECA R   |   6 pristine   001EB3 R
  6 proceed_   001DD8 R   |   6 reboot     000327 R   |   6 reset_ve   001F1A R
  6 row_eras   001D93 R   |   6 row_eras   001DEC R   |   6 row_eras   001E13 R
  6 set_opti   001E87 R   |   6 set_vect   001FBB R   |   6 uart_ini   000076 R
  6 write_ro   001E57 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   3280   flags    0

