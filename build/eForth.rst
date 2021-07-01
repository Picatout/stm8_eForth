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
      0080B7 94 24                  295         .word      INTER   ;'EVAL
      0080B9 00 00                  296         .word      0       ;HLD
      0080BB B2 EE                  297         .word      LASTN  ;CNTXT pointer
      0080BD 00 80                  298         .word      VAR_BASE   ;variables free space pointer 
      0080BF B4 00                  299         .word      app_space ; FLASH free space pointer 
      0080C1 B2 EE                  300         .word      LASTN   ;LAST
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
      00812D CC 9B 25         [ 2]  372         jp  COLD   ;default=MN1
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
      008173 CD 86 58         [ 4]  433         call OVER ; ( level reg lshift rval lshift -- )
      008176 CD 84 F1         [ 4]  434         call DOLIT 
      008179 00 03                  435         .word 3
      00817B CD 86 3E         [ 4]  436         call SWAPP  ; ( level reg lshift rval 3 lshift )
      00817E CD 8B 99         [ 4]  437         call LSHIFT ; creat slot mask 
      008181 CD 88 77         [ 4]  438         call INVER  ; ( level reg lshift rval mask )
      008184 CD 86 8D         [ 4]  439         call ANDD ; ( level reg lshift slot_masked )
      008187 CD 85 F7         [ 4]  440         call TOR  ; ( level reg lshift -- R: slot_masked )
      00818A CD 87 FC         [ 4]  441         call ROT  ; ( reg lshift level )
      00818D CD 86 3E         [ 4]  442         call SWAPP ; ( reg level lshift )
      008190 CD 8B 99         [ 4]  443         call LSHIFT  ; ( reg slot_level -- )
      008193 CD 85 D8         [ 4]  444         call RFROM ; ( reg slot_level masked_val )
      008196 CD 86 A1         [ 4]  445         call ORR   ; ( reg updated_rval )
      008199 CD 86 3E         [ 4]  446         call SWAPP 
      00819C CD 85 94         [ 4]  447         call CSTOR
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
      0081A9 CD 91 E9         [ 4]  457         call TOKEN 
      0081AC CD 86 2E         [ 4]  458         call DUPP 
      0081AF CD 85 24         [ 4]  459         call QBRAN 
      0081B2 82 8F                  460         .word FORGET2
      0081B4 CD 92 E6         [ 4]  461         call NAMEQ
      0081B7 CD 87 EB         [ 4]  462         call QDUP 
      0081BA CD 85 24         [ 4]  463         call QBRAN 
      0081BD 82 8F                  464         .word FORGET2
      0081BF CD 86 24         [ 4]  465         call DROP 
      0081C2 1D 00 04         [ 2]  466         subw x,#2*CELLL 
      0081C5 90 5F            [ 1]  467         clrw y 
      0081C7 FF               [ 2]  468         ldw (x),y 
      0081C8 90 AE 40 02      [ 2]  469         ldw y,#APP_RUN 
      0081CC EF 02            [ 2]  470         ldw (2,x),y 
      0081CE CC 9E 21         [ 2]  471         jp EESTORE 
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
      0081DA CD 91 E9         [ 4]  482         call TOKEN
      0081DD CD 86 2E         [ 4]  483         call DUPP 
      0081E0 CD 85 24         [ 4]  484         call QBRAN 
      0081E3 82 8F                  485         .word FORGET2
      0081E5 CD 92 E6         [ 4]  486         call NAMEQ ; ( a -- ca na | a F )
      0081E8 CD 87 EB         [ 4]  487         call QDUP 
      0081EB CD 85 24         [ 4]  488         call QBRAN 
      0081EE 82 8F                  489         .word FORGET2
                                    490 ; only forget users words 
      0081F0 CD 86 2E         [ 4]  491         call DUPP ; ( ca na na )
      0081F3 CD 84 F1         [ 4]  492         call DOLIT 
      0081F6 B4 00                  493         .word app_space 
      0081F8 CD 86 3E         [ 4]  494         call SWAPP 
      0081FB CD 89 1D         [ 4]  495         call  ULESS 
      0081FE CD 85 24         [ 4]  496         call QBRAN 
      008201 82 51                  497         .word FORGET6 
                                    498 ; ( ca na -- )        
                                    499 ;reset ivec with address >= ca
      008203 CD 86 3E         [ 4]  500         call SWAPP ; ( na ca -- ) 
      008206 CD A0 24         [ 4]  501         call CHKIVEC ; ( na -- ) 
                                    502 ; start at LAST and link back to na 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



                                    503 ; if variable found reset VP at that point.
      008209                        504 FORGET1:
      008209 CD 87 AD         [ 4]  505         call LAST 
      00820C CD 85 87         [ 4]  506         call AT 
      00820F CD 86 2E         [ 4]  507         call DUPP  ; ( -- na last last )
      008212 CD 82 A5         [ 4]  508         call FREEVAR ; ( -- na last )
      008215 CD 86 2E         [ 4]  509         call DUPP 
      008218 CD 84 F1         [ 4]  510         call DOLIT 
      00821B 00 02                  511         .word 2 
      00821D CD 88 D6         [ 4]  512         call SUBB ; ( na last -- na last lfa ) link address 
      008220 CD 85 87         [ 4]  513         call AT 
      008223 CD 86 2E         [ 4]  514         call DUPP ; ( -- na last a a )
      008226 CD 87 81         [ 4]  515         call CNTXT 
      008229 CD 85 70         [ 4]  516         call STORE
      00822C CD 87 AD         [ 4]  517         call LAST  
      00822F CD 85 70         [ 4]  518         call STORE ; ( --  na last )
      008232 CD 86 58         [ 4]  519         call OVER 
      008235 CD 88 FE         [ 4]  520         call EQUAL ; ( na last na -- na T|F ) 
      008238 CD 85 24         [ 4]  521         call QBRAN 
      00823B 82 09                  522         .word FORGET1 
                                    523 ; ( na -- )
      00823D CD 84 F1         [ 4]  524         call DOLIT 
      008240 00 02                  525         .word 2 
      008242 CD 88 D6         [ 4]  526         call SUBB 
      008245 CD 87 9D         [ 4]  527         call CPP 
      008248 CD 85 70         [ 4]  528         call STORE  
      00824B CD 9C 54         [ 4]  529         call UPDATCP 
      00824E CC 9C 2B         [ 2]  530         jp UPDATLAST 
      008251                        531 FORGET6: ; tried to forget a RAM or system word 
                                    532 ; ( ca na -- )
      008251 1D 00 02         [ 2]  533         subw x,#CELLL 
      008254 90 BE 2C         [ 2]  534         ldw y,SP0 
      008257 FF               [ 2]  535         ldw (x),y  
      008258 CD 89 1D         [ 4]  536         call ULESS
      00825B CD 85 24         [ 4]  537         call QBRAN 
      00825E 82 81                  538         .word PROTECTED 
      008260 CD 93 F2         [ 4]  539         call ABORQ 
      008263 1D                     540         .byte 29
      008264 20 46 6F 72 20 52 41   541         .ascii " For RAM definition do REBOOT"
             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      008281                        542 PROTECTED:
      008281 CD 93 F2         [ 4]  543         call ABORQ
      008284 0A                     544         .byte 10
      008285 20 50 72 6F 74 65 63   545         .ascii " Protected"
             74 65 64
      00828F                        546 FORGET2: ; no name or not found in dictionary 
      00828F CD 93 F2         [ 4]  547         call ABORQ
      008292 05                     548         .byte 5
      008293 20 77 68 61 74         549         .ascii " what"
      008298                        550 FORGET4:
      008298 CC 86 24         [ 2]  551         jp DROP 
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
      0082A5 CD 86 2E         [ 4]  564         call DUPP ; ( na na -- )
      0082A8 CD 85 A5         [ 4]  565         CALL CAT  ; ( na c -- )
      0082AB CD 8B 7B         [ 4]  566         call ONEP ;
      0082AE CD 88 5D         [ 4]  567         CALL PLUS ; ( na c+1 -- ca ) 
      0082B1 CD 8B 7B         [ 4]  568         call ONEP ; ( ca+ -- ) to get routne address 
      0082B4 CD 86 2E         [ 4]  569         call DUPP ; ( ca+ ca+ -- )
      0082B7 CD 85 87         [ 4]  570         CALL AT   ; ( ca+ fnaddr -- ) ; fnaddr is routine address 
      0082BA CD 84 F1         [ 4]  571         call DOLIT 
      0082BD 86 EE                  572         .word DOVAR ; if routine address is DOVAR then variable 
      0082BF CD 88 FE         [ 4]  573         call EQUAL  ; ( ca+ fnaddr DOVAR -- ca+ T|F ) 
      0082C2 CD 85 24         [ 4]  574         call QBRAN 
      0082C5 82 DB                  575         .word FREEVAR4 
      0082C7 CD 84 F1         [ 4]  576         call DOLIT 
      0082CA 00 02                  577         .word 2 
      0082CC CD 88 5D         [ 4]  578         call PLUS  ; ( ca+ 2 -- da ) da is data address 
      0082CF CD 85 87         [ 4]  579         call AT 
      0082D2 CD 87 8F         [ 4]  580         call VPP   
      0082D5 CD 85 70         [ 4]  581         call STORE 
      0082D8 CC 9C 6B         [ 2]  582         jp UPDATVP 
      0082DB                        583 FREEVAR4: ; not variable
      0082DB CC 86 24         [ 2]  584         jp  DROP 
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
      0083B5 CD 87 C0         [ 4]  744         call RAMLAST 
      0083B8 CD 85 87         [ 4]  745         call AT 
      0083BB CD 87 EB         [ 4]  746         call QDUP 
      0083BE CD 85 24         [ 4]  747         call QBRAN
      0083C1 83 E4                  748         .word 1$
      0083C3 CD 93 F2         [ 4]  749         call ABORQ 
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
      008478 CD 88 5D         [ 4]  849         call PLUS
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
      00852B 27 26            [ 1]  968         JREQ     BRAN
      00852D 90 85            [ 2]  969 	POPW Y
      00852F 90 EC 02         [ 2]  970 	JP (2,Y)
                                    971 
                                    972 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    973 ;  TBRANCH ( f -- )
                                    974 ;  branch if f==TRUE 
                                    975 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0004B2                        976         _HEADER TBRAN,COMPO+7,"TBRANCH"
      008532 85 1C                    1         .word LINK 
                           0004B4     2         LINK=.
      008534 47                       3         .byte COMPO+7  
      008535 54 42 52 41 4E 43 48     4         .ascii "TBRANCH"
      00853C                          5         TBRAN:
      00853C 90 93            [ 1]  977         LDW Y,X 
      00853E 1C 00 02         [ 2]  978         ADDW X,#2 
      008541 90 FE            [ 2]  979         LDW Y,(Y)
      008543 26 0E            [ 1]  980         JRNE BRAN 
      008545 90 85            [ 2]  981         POPW Y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      008547 90 EC 02         [ 2]  982         JP (2,Y)
                                    983 
                                    984 
                                    985 ;       branch  ( -- )
                                    986 ;       Branch to an inline address.
      00854A 85 34                  987         .word      LINK
                           0004CC   988 LINK	= 	.
      00854C 46                     989 	.byte      COMPO+6
      00854D 42 52 41 4E 43 48      990         .ascii     "BRANCH"
      008553                        991 BRAN:
      008553 90 85            [ 2]  992         POPW Y
      008555 90 FE            [ 2]  993 	LDW Y,(Y)
      008557 90 FC            [ 2]  994         JP     (Y)
                                    995 
                                    996 ;       EXECUTE ( ca -- )
                                    997 ;       Execute  word at ca.
      008559 85 4C                  998         .word      LINK
                           0004DB   999 LINK	= 	.
      00855B 07                    1000         .byte       7
      00855C 45 58 45 43 55 54 45  1001         .ascii     "EXECUTE"
      008563                       1002 EXECU:
      008563 90 93            [ 1] 1003         LDW Y,X
      008565 1C 00 02         [ 2] 1004 	ADDW X,#2
      008568 90 FE            [ 2] 1005 	LDW  Y,(Y)
      00856A 90 FC            [ 2] 1006         JP   (Y)
                                   1007 
                           000001  1008 OPTIMIZE = 1
                           000001  1009 .if OPTIMIZE 
                                   1010 ; remplacement de CALL EXIT par 
                                   1011 ; le opcode de RET.
                                   1012 ; Voir modification au code de ";"
                           000000  1013 .else 
                                   1014 ;       EXIT    ( -- )
                                   1015 ;       Terminate a colon definition.
                                   1016         .word      LINK
                                   1017 LINK = .
                                   1018         .byte      4
                                   1019         .ascii     "EXIT"
                                   1020 EXIT:
                                   1021         POPW Y
                                   1022         RET
                                   1023 .endif 
                                   1024 
                                   1025 ;       !       ( w a -- )
                                   1026 ;       Pop  data stack to memory.
      00856C 85 5B                 1027         .word      LINK
                           0004EE  1028 LINK = .
      00856E 01                    1029         .byte      1
      00856F 21                    1030         .ascii     "!"
      008570                       1031 STORE:
      008570 90 93            [ 1] 1032         LDW Y,X
      008572 90 FE            [ 2] 1033         LDW Y,(Y)    ;Y=a
      008574 90 BF 26         [ 2] 1034         LDW YTEMP,Y
      008577 90 93            [ 1] 1035         LDW Y,X
      008579 90 EE 02         [ 2] 1036         LDW Y,(2,Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      00857C 91 CF 26         [ 5] 1037         LDW [YTEMP],Y ;store w at a
      00857F 1C 00 04         [ 2] 1038         ADDW X,#4 ; DDROP 
      008582 81               [ 4] 1039         RET     
                                   1040 
                                   1041 ;       @       ( a -- w )
                                   1042 ;       Push memory location to stack.
      008583 85 6E                 1043         .word      LINK
                           000505  1044 LINK	= 	.
      008585 01                    1045         .byte    1
      008586 40                    1046         .ascii	"@"
      008587                       1047 AT:
      008587 90 93            [ 1] 1048         LDW Y,X     ;Y = a
      008589 90 FE            [ 2] 1049         LDW Y,(Y)   ; address 
      00858B 90 FE            [ 2] 1050         LDW Y,(Y)   ; value 
      00858D FF               [ 2] 1051         LDW (X),Y ;w = @Y
      00858E 81               [ 4] 1052         RET     
                                   1053 
                                   1054 ;       C!      ( c b -- )
                                   1055 ;       Pop  data stack to byte memory.
      00858F 85 85                 1056         .word      LINK
                           000511  1057 LINK	= .
      008591 02                    1058         .byte      2
      008592 43 21                 1059         .ascii     "C!"
      008594                       1060 CSTOR:
      008594 90 93            [ 1] 1061         LDW Y,X
      008596 90 FE            [ 2] 1062 	LDW Y,(Y)    ;Y=b
      008598 E6 03            [ 1] 1063         LD A,(3,X)    ;D = c
      00859A 90 F7            [ 1] 1064         LD  (Y),A     ;store c at b
      00859C 1C 00 04         [ 2] 1065 	ADDW X,#4 ; DDROP 
      00859F 81               [ 4] 1066         RET     
                                   1067 
                                   1068 ;       C@      ( b -- c )
                                   1069 ;       Push byte in memory to  stack.
      0085A0 85 91                 1070         .word      LINK
                           000522  1071 LINK	= 	.
      0085A2 02                    1072         .byte      2
      0085A3 43 40                 1073         .ascii     "C@"
      0085A5                       1074 CAT:
      0085A5 90 93            [ 1] 1075         LDW Y,X     ;Y=b
      0085A7 90 FE            [ 2] 1076         LDW Y,(Y)
      0085A9 90 F6            [ 1] 1077         LD A,(Y)
      0085AB E7 01            [ 1] 1078         LD (1,X),A
      0085AD 7F               [ 1] 1079         CLR (X)
      0085AE 81               [ 4] 1080         RET     
                                   1081 
                                   1082 ;       RP@     ( -- a )
                                   1083 ;       Push current RP to data stack.
      0085AF 85 A2                 1084         .word      LINK
                           000531  1085 LINK	= .
      0085B1 03                    1086         .byte      3
      0085B2 52 50 40              1087         .ascii     "RP@"
      0085B5                       1088 RPAT:
      0085B5 90 96            [ 1] 1089         LDW Y,SP    ;save return addr
      0085B7 1D 00 02         [ 2] 1090         SUBW X,#2
      0085BA FF               [ 2] 1091         LDW (X),Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      0085BB 81               [ 4] 1092         RET     
                                   1093 
                                   1094 ;       RP!     ( a -- )
                                   1095 ;       Set  return stack pointer.
      0085BC 85 B1                 1096         .word      LINK
                           00053E  1097 LINK	= 	. 
      0085BE 43                    1098 	.byte      COMPO+3
      0085BF 52 50 21              1099         .ascii     "RP!"
      0085C2                       1100 RPSTO:
      0085C2 90 85            [ 2] 1101         POPW Y
      0085C4 90 BF 26         [ 2] 1102         LDW YTEMP,Y
      0085C7 90 93            [ 1] 1103         LDW Y,X
      0085C9 90 FE            [ 2] 1104         LDW Y,(Y)
      0085CB 90 94            [ 1] 1105         LDW SP,Y
      0085CD 1C 00 02         [ 2] 1106         ADDW x,#CELLL ; a was not dropped, Picatout 2020-05-24
      0085D0 92 CC 26         [ 5] 1107         JP [YTEMP]
                                   1108 
                                   1109 ;       R>      ( -- w )
                                   1110 ;       Pop return stack to data stack.
      0085D3 85 BE                 1111         .word      LINK
                           000555  1112 LINK	= 	. 
      0085D5 42                    1113 	.byte      COMPO+2
      0085D6 52 3E                 1114         .ascii     "R>"
      0085D8                       1115 RFROM:
      0085D8 90 85            [ 2] 1116         POPW Y    ;save return addr
      0085DA 90 BF 26         [ 2] 1117         LDW YTEMP,Y
      0085DD 90 85            [ 2] 1118         POPW Y
      0085DF 1D 00 02         [ 2] 1119         SUBW X,#2
      0085E2 FF               [ 2] 1120         LDW (X),Y
      0085E3 92 CC 26         [ 5] 1121         JP [YTEMP]
                                   1122 
                                   1123 ;       R@      ( -- w )
                                   1124 ;       Copy top of return stack to stack.
      0085E6 85 D5                 1125         .word      LINK
                           000568  1126 LINK	= 	. 
      0085E8 02                    1127         .byte      2
      0085E9 52 40                 1128         .ascii     "R@"
      0085EB                       1129 RAT:
      0085EB 16 03            [ 2] 1130         ldw y,(3,sp)
      0085ED 1D 00 02         [ 2] 1131         subw x,#CELLL 
      0085F0 FF               [ 2] 1132         ldw (x),y 
      0085F1 81               [ 4] 1133         ret 
                                   1134 
                                   1135 ;       >R      ( w -- )
                                   1136 ;       Push data stack to return stack.
      0085F2 85 E8                 1137         .word      LINK
                           000574  1138 LINK	= 	. 
      0085F4 42                    1139 	.byte      COMPO+2
      0085F5 3E 52                 1140         .ascii     ">R"
      0085F7                       1141 TOR:
      0085F7 90 85            [ 2] 1142         POPW Y    ;save return addr
      0085F9 90 BF 26         [ 2] 1143         LDW YTEMP,Y
      0085FC 90 93            [ 1] 1144         LDW Y,X
      0085FE 90 FE            [ 2] 1145         LDW Y,(Y)
      008600 90 89            [ 2] 1146         PUSHW Y    ;restore return addr
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008602 1C 00 02         [ 2] 1147         ADDW X,#2
      008605 92 CC 26         [ 5] 1148         JP [YTEMP]
                                   1149 
                                   1150 ;       SP@     ( -- a )
                                   1151 ;       Push current stack pointer.
      008608 85 F4                 1152         .word      LINK
                           00058A  1153 LINK	= 	. 
      00860A 03                    1154         .byte      3
      00860B 53 50 40              1155         .ascii     "SP@"
      00860E                       1156 SPAT:
      00860E 90 93            [ 1] 1157 	LDW Y,X
      008610 1D 00 02         [ 2] 1158         SUBW X,#2
      008613 FF               [ 2] 1159 	LDW (X),Y
      008614 81               [ 4] 1160         RET     
                                   1161 
                                   1162 ;       SP!     ( a -- )
                                   1163 ;       Set  data stack pointer.
      008615 86 0A                 1164         .word      LINK
                           000597  1165 LINK	= 	. 
      008617 03                    1166         .byte      3
      008618 53 50 21              1167         .ascii     "SP!"
      00861B                       1168 SPSTO:
      00861B FE               [ 2] 1169         LDW     X,(X)     ;X = a
      00861C 81               [ 4] 1170         RET     
                                   1171 
                                   1172 ;       DROP    ( w -- )
                                   1173 ;       Discard top stack item.
      00861D 86 17                 1174         .word      LINK
                           00059F  1175 LINK	= 	. 
      00861F 04                    1176         .byte      4
      008620 44 52 4F 50           1177         .ascii     "DROP"
      008624                       1178 DROP:
      008624 1C 00 02         [ 2] 1179         ADDW X,#2     
      008627 81               [ 4] 1180         RET     
                                   1181 
                                   1182 ;       DUP     ( w -- w w )
                                   1183 ;       Duplicate  top stack item.
      008628 86 1F                 1184         .word      LINK
                           0005AA  1185 LINK	= 	. 
      00862A 03                    1186         .byte      3
      00862B 44 55 50              1187         .ascii     "DUP"
      00862E                       1188 DUPP:
      00862E 90 93            [ 1] 1189 	LDW Y,X
      008630 1D 00 02         [ 2] 1190         SUBW X,#2
      008633 90 FE            [ 2] 1191 	LDW Y,(Y)
      008635 FF               [ 2] 1192 	LDW (X),Y
      008636 81               [ 4] 1193         RET     
                                   1194 
                                   1195 ;       SWAP    ( w1 w2 -- w2 w1 )
                                   1196 ;       Exchange top two stack items.
      008637 86 2A                 1197         .word      LINK
                           0005B9  1198 LINK	= 	. 
      008639 04                    1199         .byte      4
      00863A 53 57 41 50           1200         .ascii     "SWAP"
      00863E                       1201 SWAPP:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      00863E 90 93            [ 1] 1202         LDW Y,X
      008640 90 FE            [ 2] 1203         LDW Y,(Y)
      008642 90 BF 26         [ 2] 1204         LDW YTEMP,Y
      008645 90 93            [ 1] 1205         LDW Y,X
      008647 90 EE 02         [ 2] 1206         LDW Y,(2,Y)
      00864A FF               [ 2] 1207         LDW (X),Y
      00864B 90 BE 26         [ 2] 1208         LDW Y,YTEMP
      00864E EF 02            [ 2] 1209         LDW (2,X),Y
      008650 81               [ 4] 1210         RET     
                                   1211 
                                   1212 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                   1213 ;       Copy second stack item to top.
      008651 86 39                 1214         .word      LINK
                           0005D3  1215 LINK	= . 
      008653 04                    1216         .byte      4
      008654 4F 56 45 52           1217         .ascii     "OVER"
      008658                       1218 OVER:
      008658 1D 00 02         [ 2] 1219         SUBW X,#2
      00865B 90 93            [ 1] 1220         LDW Y,X
      00865D 90 EE 04         [ 2] 1221         LDW Y,(4,Y)
      008660 FF               [ 2] 1222         LDW (X),Y
      008661 81               [ 4] 1223         RET     
                                   1224 
                                   1225 ;       0<      ( n -- t )
                                   1226 ;       Return true if n is negative.
      008662 86 53                 1227         .word      LINK
                           0005E4  1228 LINK	= . 
      008664 02                    1229         .byte      2
      008665 30 3C                 1230         .ascii     "0<"
      008667                       1231 ZLESS:
      008667 A6 FF            [ 1] 1232         LD A,#0xFF
      008669 90 93            [ 1] 1233         LDW Y,X
      00866B 90 FE            [ 2] 1234         LDW Y,(Y)
      00866D 2B 01            [ 1] 1235         JRMI     ZL1
      00866F 4F               [ 1] 1236         CLR A   ;false
      008670 F7               [ 1] 1237 ZL1:    LD     (X),A
      008671 E7 01            [ 1] 1238         LD (1,X),A
      008673 81               [ 4] 1239 	RET     
                                   1240 
                                   1241 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1242 ;       0= ( n -- f )
                                   1243 ;   n==0?
                                   1244 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0005F4                       1245         _HEADER ZEQUAL,2,"0="
      008674 86 64                    1         .word LINK 
                           0005F6     2         LINK=.
      008676 02                       3         .byte 2  
      008677 30 3D                    4         .ascii "0="
      008679                          5         ZEQUAL:
      008679 A6 FF            [ 1] 1246         LD A,#0XFF 
      00867B 90 93            [ 1] 1247         LDW Y,X 
      00867D 90 FE            [ 2] 1248         LDW Y,(Y)
      00867F 27 02            [ 1] 1249         JREQ ZEQU1 
      008681 A6 00            [ 1] 1250         LD A,#0 
      008683                       1251 ZEQU1:  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      008683 F7               [ 1] 1252         LD (X),A 
      008684 E7 01            [ 1] 1253         LD (1,X),A         
      008686 81               [ 4] 1254         RET 
                                   1255 
                                   1256 
                                   1257 ;       AND     ( w w -- w )
                                   1258 ;       Bitwise AND.
      008687 86 76                 1259         .word      LINK
                           000609  1260 LINK	= . 
      008689 03                    1261         .byte      3
      00868A 41 4E 44              1262         .ascii     "AND"
      00868D                       1263 ANDD:
      00868D F6               [ 1] 1264         LD  A,(X)    ;D=w
      00868E E4 02            [ 1] 1265         AND A,(2,X)
      008690 E7 02            [ 1] 1266         LD (2,X),A
      008692 E6 01            [ 1] 1267         LD A,(1,X)
      008694 E4 03            [ 1] 1268         AND A,(3,X)
      008696 E7 03            [ 1] 1269         LD (3,X),A
      008698 1C 00 02         [ 2] 1270         ADDW X,#2
      00869B 81               [ 4] 1271         RET
                                   1272 
                                   1273 ;       OR      ( w w -- w )
                                   1274 ;       Bitwise inclusive OR.
      00869C 86 89                 1275         .word      LINK
                           00061E  1276 LINK = . 
      00869E 02                    1277         .byte      2
      00869F 4F 52                 1278         .ascii     "OR"
      0086A1                       1279 ORR:
      0086A1 F6               [ 1] 1280         LD A,(X)    ;D=w
      0086A2 EA 02            [ 1] 1281         OR A,(2,X)
      0086A4 E7 02            [ 1] 1282         LD (2,X),A
      0086A6 E6 01            [ 1] 1283         LD A,(1,X)
      0086A8 EA 03            [ 1] 1284         OR A,(3,X)
      0086AA E7 03            [ 1] 1285         LD (3,X),A
      0086AC 1C 00 02         [ 2] 1286         ADDW X,#2
      0086AF 81               [ 4] 1287         RET
                                   1288 
                                   1289 ;       XOR     ( w w -- w )
                                   1290 ;       Bitwise exclusive OR.
      0086B0 86 9E                 1291         .word      LINK
                           000632  1292 LINK	= . 
      0086B2 03                    1293         .byte      3
      0086B3 58 4F 52              1294         .ascii     "XOR"
      0086B6                       1295 XORR:
      0086B6 F6               [ 1] 1296         LD A,(X)    ;D=w
      0086B7 E8 02            [ 1] 1297         XOR A,(2,X)
      0086B9 E7 02            [ 1] 1298         LD (2,X),A
      0086BB E6 01            [ 1] 1299         LD A,(1,X)
      0086BD E8 03            [ 1] 1300         XOR A,(3,X)
      0086BF E7 03            [ 1] 1301         LD (3,X),A
      0086C1 1C 00 02         [ 2] 1302         ADDW X,#2
      0086C4 81               [ 4] 1303         RET
                                   1304 
                                   1305 ;       UM+     ( u u -- udsum )
                                   1306 ;       Add two unsigned single
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



                                   1307 ;       and return a double sum.
      0086C5 86 B2                 1308         .word      LINK
                           000647  1309 LINK	= . 
      0086C7 03                    1310         .byte      3
      0086C8 55 4D 2B              1311         .ascii     "UM+"
      0086CB                       1312 UPLUS:
      0086CB A6 01            [ 1] 1313         LD A,#1
      0086CD 90 93            [ 1] 1314         LDW Y,X
      0086CF 90 EE 02         [ 2] 1315         LDW Y,(2,Y)
      0086D2 90 BF 26         [ 2] 1316         LDW YTEMP,Y
      0086D5 90 93            [ 1] 1317         LDW Y,X
      0086D7 90 FE            [ 2] 1318         LDW Y,(Y)
      0086D9 72 B9 00 26      [ 2] 1319         ADDW Y,YTEMP
      0086DD EF 02            [ 2] 1320         LDW (2,X),Y
      0086DF 25 01            [ 1] 1321         JRC     UPL1
      0086E1 4F               [ 1] 1322         CLR A
      0086E2 E7 01            [ 1] 1323 UPL1:   LD     (1,X),A
      0086E4 7F               [ 1] 1324         CLR (X)
      0086E5 81               [ 4] 1325         RET
                                   1326 
                                   1327 ;; System and user variables
                                   1328 
                                   1329 ;       doVAR   ( -- a )
                                   1330 ;       Code for VARIABLE and CREATE.
      0086E6 86 C7                 1331         .word      LINK
                           000668  1332 LINK	= . 
      0086E8 45                    1333 	.byte      COMPO+5
      0086E9 44 4F 56 41 52        1334         .ascii     "DOVAR"
      0086EE                       1335 DOVAR:
      0086EE 1D 00 02         [ 2] 1336 	SUBW X,#2
      0086F1 90 85            [ 2] 1337         POPW Y    ;get return addr (pfa)
      0086F3 90 FE            [ 2] 1338         LDW Y,(Y) ; indirect address 
      0086F5 FF               [ 2] 1339         LDW (X),Y    ;push on stack
      0086F6 81               [ 4] 1340         RET     ;go to RET of EXEC
                                   1341 
                                   1342 ;       BASE    ( -- a )
                                   1343 ;       Radix base for numeric I/O.
      0086F7 86 E8                 1344         .word      LINK        
                           000679  1345 LINK = . 
      0086F9 04                    1346         .byte      4
      0086FA 42 41 53 45           1347         .ascii     "BASE"
      0086FE                       1348 BASE:
      0086FE 90 AE 00 06      [ 2] 1349 	LDW Y,#UBASE 
      008702 1D 00 02         [ 2] 1350 	SUBW X,#2
      008705 FF               [ 2] 1351         LDW (X),Y
      008706 81               [ 4] 1352         RET
                                   1353 
                                   1354 ;       tmp     ( -- a )
                                   1355 ;       A temporary storage.
      008707 86 F9                 1356         .word      LINK
                                   1357         
                           000689  1358 LINK = . 
      008709 03                    1359 	.byte      3
      00870A 54 4D 50              1360         .ascii     "TMP"
      00870D                       1361 TEMP:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      00870D 90 AE 00 0A      [ 2] 1362 	LDW Y,#UTMP
      008711 1D 00 02         [ 2] 1363 	SUBW X,#2
      008714 FF               [ 2] 1364         LDW (X),Y
      008715 81               [ 4] 1365         RET
                                   1366 
                                   1367 ;       >IN     ( -- a )
                                   1368 ;        Hold parsing pointer.
      008716 87 09                 1369         .word      LINK
                           000698  1370 LINK = . 
      008718 03                    1371         .byte      3
      008719 3E 49 4E              1372         .ascii    ">IN"
      00871C                       1373 INN:
      00871C 90 AE 00 0C      [ 2] 1374 	LDW Y,#UINN 
      008720 1D 00 02         [ 2] 1375 	SUBW X,#2
      008723 FF               [ 2] 1376         LDW (X),Y
      008724 81               [ 4] 1377         RET
                                   1378 
                                   1379 ;       #TIB    ( -- a )
                                   1380 ;       Count in terminal input buffer.
      008725 87 18                 1381         .word      LINK
                           0006A7  1382 LINK = . 
      008727 04                    1383         .byte      4
      008728 23 54 49 42           1384         .ascii     "#TIB"
      00872C                       1385 NTIB:
      00872C 90 AE 00 0E      [ 2] 1386 	LDW Y,#UCTIB 
      008730 1D 00 02         [ 2] 1387 	SUBW X,#2
      008733 FF               [ 2] 1388         LDW (X),Y
      008734 81               [ 4] 1389         RET
                                   1390 
                                   1391 ;       TBUF ( -- a )
                                   1392 ;       address of 128 bytes transaction buffer 
      008735 87 27                 1393         .word LINK 
                           0006B7  1394         LINK=.
      008737 04                    1395         .byte 4 
      008738 54 42 55 46           1396         .ascii "TBUF"
      00873C                       1397 TBUF:
      00873C 90 AE 16 80      [ 2] 1398         ldw y,#ROWBUFF
      008740 1D 00 02         [ 2] 1399         subw x,#CELLL
      008743 FF               [ 2] 1400         ldw (x),y 
      008744 81               [ 4] 1401         ret 
                                   1402 
                                   1403 ; systeme variable 
                                   1404 ; compilation destination 
                                   1405 ; TFLASH ( -- A )
      008745 87 37                 1406         .word LINK 
                           0006C7  1407         LINK=.
      008747 06                    1408         .byte 6 
      008748 54 46 4C 41 53 48     1409         .ascii "TFLASH"         
      00874E                       1410 TFLASH:
      00874E 1D 00 02         [ 2] 1411         subw x,#CELLL 
      008751 90 AE 00 20      [ 2] 1412         ldw y,#UTFLASH
      008755 FF               [ 2] 1413         ldw (x),y 
      008756 81               [ 4] 1414         ret 
                                   1415 
                                   1416 ;       "EVAL   ( -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



                                   1417 ;       Execution vector of EVAL.
      008757 87 47                 1418         .word      LINK
                           0006D9  1419 LINK = . 
      008759 05                    1420         .byte      5
      00875A 27 45 56 41 4C        1421         .ascii     "'EVAL"
      00875F                       1422 TEVAL:
      00875F 90 AE 00 12      [ 2] 1423 	LDW Y,#UINTER 
      008763 1D 00 02         [ 2] 1424 	SUBW X,#2
      008766 FF               [ 2] 1425         LDW (X),Y
      008767 81               [ 4] 1426         RET
                                   1427 
                                   1428 ;       HLD     ( -- a )
                                   1429 ;       Hold a pointer of output string.
      008768 87 59                 1430         .word      LINK
                           0006EA  1431 LINK = . 
      00876A 03                    1432         .byte      3
      00876B 48 4C 44              1433         .ascii     "HLD"
      00876E                       1434 HLD:
      00876E 90 AE 00 14      [ 2] 1435 	LDW Y,#UHLD 
      008772 1D 00 02         [ 2] 1436 	SUBW X,#2
      008775 FF               [ 2] 1437         LDW (X),Y
      008776 81               [ 4] 1438         RET
                                   1439 
                                   1440 ;       CONTEXT ( -- a )
                                   1441 ;       Start vocabulary search.
      008777 87 6A                 1442         .word      LINK
                           0006F9  1443 LINK = . 
      008779 07                    1444         .byte      7
      00877A 43 4F 4E 54 45 58 54  1445         .ascii     "CONTEXT"
      008781                       1446 CNTXT:
      008781 90 AE 00 16      [ 2] 1447 	LDW Y,#UCNTXT
      008785 1D 00 02         [ 2] 1448 	SUBW X,#2
      008788 FF               [ 2] 1449         LDW (X),Y
      008789 81               [ 4] 1450         RET
                                   1451 
                                   1452 ;       VP      ( -- a )
                                   1453 ;       Point to top of variables
      00878A 87 79                 1454         .word      LINK
                           00070C  1455 LINK = . 
      00878C 02                    1456         .byte      2
      00878D 56 50                 1457         .ascii     "VP"
      00878F                       1458 VPP:
      00878F 90 AE 00 18      [ 2] 1459 	LDW Y,#UVP 
      008793 1D 00 02         [ 2] 1460 	SUBW X,#2
      008796 FF               [ 2] 1461         LDW (X),Y
      008797 81               [ 4] 1462         RET
                                   1463 
                                   1464 ;       CP    ( -- a )
                                   1465 ;       Pointer to top of FLASH 
      008798 87 8C                 1466         .word LINK 
                           00071A  1467         LINK=.
      00879A 02                    1468         .byte 2 
      00879B 43 50                 1469         .ascii "CP"
      00879D                       1470 CPP: 
      00879D 90 AE 00 1A      [ 2] 1471         ldw y,#UCP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      0087A1 1D 00 02         [ 2] 1472         subw x,#CELLL 
      0087A4 FF               [ 2] 1473         ldw (x),y 
      0087A5 81               [ 4] 1474         ret                
                                   1475 
                                   1476 ;       LAST    ( -- a )
                                   1477 ;       Point to last name in dictionary.
      0087A6 87 9A                 1478         .word      LINK
                           000728  1479 LINK = . 
      0087A8 04                    1480         .byte      4
      0087A9 4C 41 53 54           1481         .ascii     "LAST"
      0087AD                       1482 LAST:
      0087AD 90 AE 00 1C      [ 2] 1483 	LDW Y,#ULAST 
      0087B1 1D 00 02         [ 2] 1484 	SUBW X,#2
      0087B4 FF               [ 2] 1485         LDW (X),Y
      0087B5 81               [ 4] 1486         RET
                                   1487 
                                   1488 ; address of system variable URLAST 
                                   1489 ;       RAMLAST ( -- a )
                                   1490 ; RAM dictionary context 
      0087B6 87 A8                 1491         .word LINK 
                           000738  1492         LINK=. 
      0087B8 07                    1493         .byte 7  
      0087B9 52 41 4D 4C 41 53 54  1494         .ascii "RAMLAST" 
      0087C0                       1495 RAMLAST: 
      0087C0 90 AE 00 22      [ 2] 1496         ldw y,#URLAST 
      0087C4 1D 00 02         [ 2] 1497         subw x,#CELLL 
      0087C7 FF               [ 2] 1498         ldw (x),y 
      0087C8 81               [ 4] 1499         ret 
                                   1500 
                                   1501 ; OFFSET ( -- a )
                                   1502 ; address of system variable OFFSET 
      0087C9 87 B8                 1503         .word LINK 
                           00074B  1504         LINK=.
      0087CB 06                    1505         .byte 6
      0087CC 4F 46 46 53 45 54     1506         .ascii "OFFSET" 
      0087D2                       1507 OFFSET: 
      0087D2 1D 00 02         [ 2] 1508         subw x,#CELLL
      0087D5 90 AE 00 1E      [ 2] 1509         ldw y,#UOFFSET 
      0087D9 FF               [ 2] 1510         ldw (x),y 
      0087DA 81               [ 4] 1511         ret 
                                   1512 
                                   1513 ; adjust jump address adding OFFSET
                                   1514 ; ADR-ADJ ( a -- a+offset )
      0087DB                       1515 ADRADJ: 
      0087DB CD 87 D2         [ 4] 1516         call OFFSET 
      0087DE CD 85 87         [ 4] 1517         call AT 
      0087E1 CC 88 5D         [ 2] 1518         jp PLUS 
                                   1519 
                                   1520 
                                   1521 ;; Common functions
                                   1522 
                                   1523 ;       ?DUP    ( w -- w w | 0 )
                                   1524 ;       Dup tos if its is not zero.
      0087E4 87 CB                 1525         .word      LINK
                           000766  1526 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      0087E6 04                    1527         .byte      4
      0087E7 3F 44 55 50           1528         .ascii     "?DUP"
      0087EB                       1529 QDUP:
      0087EB 90 93            [ 1] 1530         LDW Y,X
      0087ED 90 FE            [ 2] 1531 	LDW Y,(Y)
      0087EF 27 04            [ 1] 1532         JREQ     QDUP1
      0087F1 1D 00 02         [ 2] 1533 	SUBW X,#2
      0087F4 FF               [ 2] 1534         LDW (X),Y
      0087F5 81               [ 4] 1535 QDUP1:  RET
                                   1536 
                                   1537 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                   1538 ;       Rot 3rd item to top.
      0087F6 87 E6                 1539         .word      LINK
                           000778  1540 LINK = . 
      0087F8 03                    1541         .byte      3
      0087F9 52 4F 54              1542         .ascii     "ROT"
      0087FC                       1543 ROT:
      0087FC 90 93            [ 1] 1544         ldw y,x 
      0087FE 90 FE            [ 2] 1545         ldw y,(y)
      008800 90 89            [ 2] 1546         pushw y 
      008802 90 93            [ 1] 1547         ldw y,x 
      008804 90 EE 04         [ 2] 1548         ldw y,(4,y)
      008807 FF               [ 2] 1549         ldw (x),y 
      008808 90 93            [ 1] 1550         ldw y,x 
      00880A 90 EE 02         [ 2] 1551         ldw y,(2,y)
      00880D EF 04            [ 2] 1552         ldw (4,x),y 
      00880F 90 85            [ 2] 1553         popw y 
      008811 EF 02            [ 2] 1554         ldw (2,x),y
      008813 81               [ 4] 1555         ret 
                                   1556 
                                   1557 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1558 ;    <ROT ( n1 n2 n3 -- n3 n1 n2 )
                                   1559 ;    rotate left 3 top elements 
                                   1560 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000794                       1561     _HEADER NROT,4,"<ROT"
      008814 87 F8                    1         .word LINK 
                           000796     2         LINK=.
      008816 04                       3         .byte 4  
      008817 3C 52 4F 54              4         .ascii "<ROT"
      00881B                          5         NROT:
      00881B 90 93            [ 1] 1562     LDW Y,X 
      00881D 90 FE            [ 2] 1563     LDW Y,(Y)
      00881F 90 BF 26         [ 2] 1564     LDW YTEMP,Y ; n3  
      008822 90 93            [ 1] 1565     LDW Y,X 
      008824 90 EE 02         [ 2] 1566     LDW Y,(2,Y) ; Y = n2 
      008827 FF               [ 2] 1567     LDW (X),Y   ; TOS = n2 
      008828 90 93            [ 1] 1568     LDW Y,X    
      00882A 90 EE 04         [ 2] 1569     LDW Y,(4,Y) ; Y = n1 
      00882D EF 02            [ 2] 1570     LDW (2,X),Y ;   = n1 
      00882F 90 BE 26         [ 2] 1571     LDW Y,YTEMP 
      008832 EF 04            [ 2] 1572     LDW (4,X),Y ; = n3 
      008834 81               [ 4] 1573     RET 
                                   1574 
                                   1575 ;       2DROP   ( w w -- )
                                   1576 ;       Discard two items on stack.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      008835 88 16                 1577         .word      LINK
                           0007B7  1578 LINK = . 
      008837 05                    1579         .byte      5
      008838 32 44 52 4F 50        1580         .ascii     "2DROP"
      00883D                       1581 DDROP:
      00883D 1C 00 04         [ 2] 1582         ADDW X,#4
      008840 81               [ 4] 1583         RET
                                   1584 
                                   1585 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                   1586 ;       Duplicate top two items.
      008841 88 37                 1587         .word      LINK
                           0007C3  1588 LINK = . 
      008843 04                    1589         .byte      4
      008844 32 44 55 50           1590         .ascii     "2DUP"
      008848                       1591 DDUP:
      008848 1D 00 04         [ 2] 1592         SUBW X,#4
      00884B 90 93            [ 1] 1593         LDW Y,X
      00884D 90 EE 06         [ 2] 1594         LDW Y,(6,Y)
      008850 EF 02            [ 2] 1595         LDW (2,X),Y
      008852 90 93            [ 1] 1596         LDW Y,X
      008854 90 EE 04         [ 2] 1597         LDW Y,(4,Y)
      008857 FF               [ 2] 1598         LDW (X),Y
      008858 81               [ 4] 1599         RET
                                   1600 
                                   1601 ;       +       ( w w -- sum )
                                   1602 ;       Add top two items.
      008859 88 43                 1603         .word      LINK
                           0007DB  1604 LINK = . 
      00885B 01                    1605         .byte      1
      00885C 2B                    1606         .ascii     "+"
      00885D                       1607 PLUS:
      00885D 90 93            [ 1] 1608         LDW Y,X
      00885F 90 FE            [ 2] 1609         LDW Y,(Y)
      008861 90 BF 26         [ 2] 1610         LDW YTEMP,Y
      008864 1C 00 02         [ 2] 1611         ADDW X,#2
      008867 90 93            [ 1] 1612         LDW Y,X
      008869 90 FE            [ 2] 1613         LDW Y,(Y)
      00886B 72 B9 00 26      [ 2] 1614         ADDW Y,YTEMP
      00886F FF               [ 2] 1615         LDW (X),Y
      008870 81               [ 4] 1616         RET
                                   1617 
                                   1618 ;       NOT     ( w -- w )
                                   1619 ;       One's complement of tos.
      008871 88 5B                 1620         .word      LINK
                           0007F3  1621 LINK = . 
      008873 03                    1622         .byte      3
      008874 4E 4F 54              1623         .ascii     "NOT"
      008877                       1624 INVER:
      008877 90 93            [ 1] 1625         LDW Y,X
      008879 90 FE            [ 2] 1626         LDW Y,(Y)
      00887B 90 53            [ 2] 1627         CPLW Y
      00887D FF               [ 2] 1628         LDW (X),Y
      00887E 81               [ 4] 1629         RET
                                   1630 
                                   1631 ;       NEGATE  ( n -- -n )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                                   1632 ;       Two's complement of tos.
      00887F 88 73                 1633         .word      LINK
                           000801  1634 LINK = . 
      008881 06                    1635         .byte      6
      008882 4E 45 47 41 54 45     1636         .ascii     "NEGATE"
      008888                       1637 NEGAT:
      008888 90 93            [ 1] 1638         LDW Y,X
      00888A 90 FE            [ 2] 1639         LDW Y,(Y)
      00888C 90 50            [ 2] 1640         NEGW Y
      00888E FF               [ 2] 1641         LDW (X),Y
      00888F 81               [ 4] 1642         RET
                                   1643 
                                   1644 ;       DNEGATE ( d -- -d )
                                   1645 ;       Two's complement of top double.
      008890 88 81                 1646         .word      LINK
                           000812  1647 LINK = . 
      008892 07                    1648         .byte      7
      008893 44 4E 45 47 41 54 45  1649         .ascii     "DNEGATE"
      00889A                       1650 DNEGA:
      00889A 90 93            [ 1] 1651         LDW Y,X
      00889C 90 FE            [ 2] 1652 	LDW Y,(Y)
      00889E 90 53            [ 2] 1653         CPLW Y     
      0088A0 90 BF 26         [ 2] 1654 	LDW YTEMP,Y
      0088A3 90 93            [ 1] 1655         LDW Y,X
      0088A5 90 EE 02         [ 2] 1656         LDW Y,(2,Y)
      0088A8 90 53            [ 2] 1657         CPLW Y
      0088AA 72 A9 00 01      [ 2] 1658         addw y,#1
      0088AE EF 02            [ 2] 1659         LDW (2,X),Y
      0088B0 90 BE 26         [ 2] 1660         LDW Y,YTEMP
      0088B3 24 02            [ 1] 1661         JRNC DN1 
      0088B5 90 5C            [ 1] 1662         INCW Y
      0088B7 FF               [ 2] 1663 DN1:    LDW (X),Y
      0088B8 81               [ 4] 1664         RET
                                   1665 
                                   1666 
                                   1667 ;       S>D ( n -- d )
                                   1668 ; convert single integer to double 
      0088B9 88 92                 1669         .word LINK 
                           00083B  1670         LINK=. 
      0088BB 03                    1671         .byte 3 
      0088BC 53 3E 44              1672         .ascii "S>D"
      0088BF                       1673 STOD: 
      0088BF 1D 00 02         [ 2] 1674         subw x,#CELLL 
      0088C2 90 5F            [ 1] 1675         clrw y 
      0088C4 FF               [ 2] 1676         ldw (x),y 
      0088C5 90 93            [ 1] 1677         ldw y,x 
      0088C7 90 EE 02         [ 2] 1678         ldw y,(2,y)
      0088CA 2A 05            [ 1] 1679         jrpl 1$ 
      0088CC 90 AE FF FF      [ 2] 1680         ldw y,#-1
      0088D0 FF               [ 2] 1681         ldw (x),y 
      0088D1 81               [ 4] 1682 1$:     ret 
                                   1683 
                                   1684 
                                   1685 
                                   1686 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                                   1687 ;       -       ( n1 n2 -- n1-n2 )
                                   1688 ;       Subtraction.
      0088D2 88 BB                 1689         .word      LINK
                           000854  1690 LINK = . 
      0088D4 01                    1691         .byte      1
      0088D5 2D                    1692         .ascii     "-"
      0088D6                       1693 SUBB:
      0088D6 90 93            [ 1] 1694         LDW Y,X
      0088D8 90 FE            [ 2] 1695         LDW Y,(Y)
      0088DA 90 BF 26         [ 2] 1696         LDW YTEMP,Y
      0088DD 1C 00 02         [ 2] 1697         ADDW X,#2
      0088E0 90 93            [ 1] 1698         LDW Y,X
      0088E2 90 FE            [ 2] 1699         LDW Y,(Y)
      0088E4 72 B2 00 26      [ 2] 1700         SUBW Y,YTEMP
      0088E8 FF               [ 2] 1701         LDW (X),Y
      0088E9 81               [ 4] 1702         RET
                                   1703 
                                   1704 ;       ABS     ( n -- n )
                                   1705 ;       Return  absolute value of n.
      0088EA 88 D4                 1706         .word      LINK
                           00086C  1707 LINK = . 
      0088EC 03                    1708         .byte      3
      0088ED 41 42 53              1709         .ascii     "ABS"
      0088F0                       1710 ABSS:
      0088F0 90 93            [ 1] 1711         LDW Y,X
      0088F2 90 FE            [ 2] 1712 	LDW Y,(Y)
      0088F4 2A 03            [ 1] 1713         JRPL     AB1     ;negate:
      0088F6 90 50            [ 2] 1714         NEGW     Y     ;else negate hi byte
      0088F8 FF               [ 2] 1715         LDW (X),Y
      0088F9 81               [ 4] 1716 AB1:    RET
                                   1717 
                                   1718 ;       =       ( w w -- t )
                                   1719 ;       Return true if top two are =al.
      0088FA 88 EC                 1720         .word      LINK
                           00087C  1721 LINK = . 
      0088FC 01                    1722         .byte      1
      0088FD 3D                    1723         .ascii     "="
      0088FE                       1724 EQUAL:
      0088FE A6 FF            [ 1] 1725         LD A,#0xFF  ;true
      008900 90 93            [ 1] 1726         LDW Y,X    ;D = n2
      008902 90 FE            [ 2] 1727         LDW Y,(Y)
      008904 90 BF 26         [ 2] 1728         LDW YTEMP,Y
      008907 1C 00 02         [ 2] 1729         ADDW X,#2
      00890A 90 93            [ 1] 1730         LDW Y,X
      00890C 90 FE            [ 2] 1731         LDW Y,(Y)
      00890E 90 B3 26         [ 2] 1732         CPW Y,YTEMP     ;if n2 <> n1
      008911 27 01            [ 1] 1733         JREQ     EQ1
      008913 4F               [ 1] 1734         CLR A
      008914 F7               [ 1] 1735 EQ1:    LD (X),A
      008915 E7 01            [ 1] 1736         LD (1,X),A
      008917 81               [ 4] 1737 	RET     
                                   1738 
                                   1739 ;       U<      ( u u -- t )
                                   1740 ;       Unsigned compare of top two items.
      008918 88 FC                 1741         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                           00089A  1742 LINK = . 
      00891A 02                    1743         .byte      2
      00891B 55 3C                 1744         .ascii     "U<"
      00891D                       1745 ULESS:
      00891D A6 FF            [ 1] 1746         LD A,#0xFF  ;true
      00891F 90 93            [ 1] 1747         LDW Y,X    ;D = n2
      008921 90 FE            [ 2] 1748         LDW Y,(Y)
      008923 90 BF 26         [ 2] 1749         LDW YTEMP,Y
      008926 1C 00 02         [ 2] 1750         ADDW X,#2
      008929 90 93            [ 1] 1751         LDW Y,X
      00892B 90 FE            [ 2] 1752         LDW Y,(Y)
      00892D 90 B3 26         [ 2] 1753         CPW Y,YTEMP     ;if n2 <> n1
      008930 25 01            [ 1] 1754         JRULT     ULES1
      008932 4F               [ 1] 1755         CLR A
      008933 F7               [ 1] 1756 ULES1:  LD (X),A
      008934 E7 01            [ 1] 1757         LD (1,X),A
      008936 81               [ 4] 1758 	RET     
                                   1759 
                                   1760 ;       <       ( n1 n2 -- t )
                                   1761 ;       Signed compare of top two items.
      008937 89 1A                 1762         .word      LINK
                           0008B9  1763 LINK = . 
      008939 01                    1764         .byte      1
      00893A 3C                    1765         .ascii     "<"
      00893B                       1766 LESS:
      00893B A6 FF            [ 1] 1767         LD A,#0xFF  ;true
      00893D 90 93            [ 1] 1768         LDW Y,X    ;D = n2
      00893F 90 FE            [ 2] 1769         LDW Y,(Y)
      008941 90 BF 26         [ 2] 1770         LDW YTEMP,Y
      008944 1C 00 02         [ 2] 1771         ADDW X,#2
      008947 90 93            [ 1] 1772         LDW Y,X
      008949 90 FE            [ 2] 1773         LDW Y,(Y)
      00894B 90 B3 26         [ 2] 1774         CPW Y,YTEMP     ;if n2 <> n1
      00894E 2F 01            [ 1] 1775         JRSLT     LT1
      008950 4F               [ 1] 1776         CLR A
      008951 F7               [ 1] 1777 LT1:    LD (X),A
      008952 E7 01            [ 1] 1778         LD (1,X),A
      008954 81               [ 4] 1779 	RET     
                                   1780 
                                   1781 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1782 ;   U> ( u1 u2 -- f )
                                   1783 ;   f = true if u1>u2 
                                   1784 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0008D5                       1785     _HEADER UGREAT,2,"U>"
      008955 89 39                    1         .word LINK 
                           0008D7     2         LINK=.
      008957 02                       3         .byte 2  
      008958 55 3E                    4         .ascii "U>"
      00895A                          5         UGREAT:
      00895A A6 00            [ 1] 1786     LD A,#0 
      00895C 90 93            [ 1] 1787     LDW Y,X 
      00895E 90 FE            [ 2] 1788     LDW Y,(Y)
      008960 90 BF 26         [ 2] 1789     LDW YTEMP,Y 
      008963 1C 00 02         [ 2] 1790     ADDW X,#2 
      008966 90 93            [ 1] 1791     LDW Y,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008968 90 FE            [ 2] 1792     LDW Y,(Y)
      00896A 90 B3 26         [ 2] 1793     CPW Y,YTEMP 
      00896D 23 02            [ 2] 1794     JRULE UGREAT1 
      00896F A6 FF            [ 1] 1795     LD A,#0xff  
      008971                       1796 UGREAT1:
      008971 F7               [ 1] 1797     LD (X),A 
      008972 E7 01            [ 1] 1798     LD (1,X),A 
      008974 81               [ 4] 1799     RET 
                                   1800 
                                   1801 
                                   1802 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1803 ;       >   (n1 n2 -- f )
                                   1804 ;  signed compare n1 n2 
                                   1805 ;  true if n1 > n2 
                                   1806 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008975 89 57                 1807         .word   LINK 
                           0008F7  1808         LINK = . 
      008977 01                    1809         .byte 1
      008978 3E                    1810         .ascii ">"
      008979                       1811 GREAT:
      008979 A6 FF            [ 1] 1812         LD A,#0xFF ;
      00897B 90 93            [ 1] 1813         LDW Y,X 
      00897D 90 FE            [ 2] 1814         LDW Y,(Y)
      00897F 90 BF 26         [ 2] 1815         LDW YTEMP,Y 
      008982 1C 00 02         [ 2] 1816         ADDW X,#2 
      008985 90 93            [ 1] 1817         LDW Y,X 
      008987 90 FE            [ 2] 1818         LDW Y,(Y)
      008989 90 B3 26         [ 2] 1819         CPW  Y,YTEMP 
      00898C 2C 01            [ 1] 1820         JRSGT GREAT1 
      00898E 4F               [ 1] 1821         CLR  A
      00898F                       1822 GREAT1:
      00898F F7               [ 1] 1823         LD (X),A 
      008990 E7 01            [ 1] 1824         LD (1,X),A 
      008992 81               [ 4] 1825         RET 
                                   1826 
                                   1827 
                                   1828 ;       MAX     ( n n -- n )
                                   1829 ;       Return greater of two top items.
      008993 89 77                 1830         .word      LINK
                           000915  1831 LINK = . 
      008995 03                    1832         .byte      3
      008996 4D 41 58              1833         .ascii     "MAX"
      008999                       1834 MAX:
      008999 90 93            [ 1] 1835         LDW Y,X    ;D = n2
      00899B 90 EE 02         [ 2] 1836         LDW Y,(2,Y)
      00899E 90 BF 26         [ 2] 1837         LDW YTEMP,Y
      0089A1 90 93            [ 1] 1838         LDW Y,X
      0089A3 90 FE            [ 2] 1839         LDW Y,(Y)
      0089A5 90 B3 26         [ 2] 1840         CPW Y,YTEMP     ;if n2 <> n1
      0089A8 2F 02            [ 1] 1841         JRSLT     MAX1
      0089AA EF 02            [ 2] 1842         LDW (2,X),Y
      0089AC 1C 00 02         [ 2] 1843 MAX1:   ADDW X,#2
      0089AF 81               [ 4] 1844 	RET     
                                   1845 
                                   1846 ;       MIN     ( n n -- n )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



                                   1847 ;       Return smaller of top two items.
      0089B0 89 95                 1848         .word      LINK
                           000932  1849 LINK = . 
      0089B2 03                    1850         .byte      3
      0089B3 4D 49 4E              1851         .ascii     "MIN"
      0089B6                       1852 MIN:
      0089B6 90 93            [ 1] 1853         LDW Y,X    ;D = n2
      0089B8 90 EE 02         [ 2] 1854         LDW Y,(2,Y)
      0089BB 90 BF 26         [ 2] 1855         LDW YTEMP,Y
      0089BE 90 93            [ 1] 1856         LDW Y,X
      0089C0 90 FE            [ 2] 1857         LDW Y,(Y)
      0089C2 90 B3 26         [ 2] 1858         CPW Y,YTEMP     ;if n2 <> n1
      0089C5 2C 02            [ 1] 1859         JRSGT     MIN1
      0089C7 EF 02            [ 2] 1860         LDW (2,X),Y
      0089C9 1C 00 02         [ 2] 1861 MIN1:	ADDW X,#2
      0089CC 81               [ 4] 1862 	RET     
                                   1863 
                                   1864 ;       WITHIN  ( u ul uh -- t )
                                   1865 ;       Return true if u is within
                                   1866 ;       range of ul and uh. ( ul <= u < uh )
      0089CD 89 B2                 1867         .word      LINK
                           00094F  1868 LINK = . 
      0089CF 06                    1869         .byte      6
      0089D0 57 49 54 48 49 4E     1870         .ascii     "WITHIN"
      0089D6                       1871 WITHI:
      0089D6 CD 86 58         [ 4] 1872         CALL     OVER
      0089D9 CD 88 D6         [ 4] 1873         CALL     SUBB
      0089DC CD 85 F7         [ 4] 1874         CALL     TOR
      0089DF CD 88 D6         [ 4] 1875         CALL     SUBB
      0089E2 CD 85 D8         [ 4] 1876         CALL     RFROM
      0089E5 CC 89 1D         [ 2] 1877         JP     ULESS
                                   1878 
                                   1879 ;; Divide
                                   1880 
                                   1881 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1882 ;       Unsigned divide of a double by a
                                   1883 ;       single. Return mod and quotient.
      0089E8 89 CF                 1884         .word      LINK
                           00096A  1885 LINK = . 
      0089EA 06                    1886         .byte      6
      0089EB 55 4D 2F 4D 4F 44     1887         .ascii     "UM/MOD"
                                   1888 ; 2021-02-22
                                   1889 ; changed algortihm for Jeeek one 
                                   1890 ; ref: https://github.com/TG9541/stm8ef/pull/406        
      0089F1                       1891 UMMOD:
      0089F1 90 93            [ 1] 1892         LDW     Y,X             ; stack pointer to Y
      0089F3 FE               [ 2] 1893         LDW     X,(X)           ; un
      0089F4 BF 26            [ 2] 1894         LDW     YTEMP,X         ; save un
      0089F6 93               [ 1] 1895         LDW     X,Y
      0089F7 5C               [ 1] 1896         INCW    X               ; drop un
      0089F8 5C               [ 1] 1897         INCW    X
      0089F9 89               [ 2] 1898         PUSHW   X               ; save stack pointer
      0089FA FE               [ 2] 1899         LDW     X,(X)           ; X=udh
      0089FB 90 EE 04         [ 2] 1900         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      0089FE B3 26            [ 2] 1901         CPW     X,YTEMP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008A00 25 0B            [ 1] 1902         JRULT   MMSM1           ; X is still on the R-stack
      008A02 85               [ 2] 1903         POPW    X               ; restore stack pointer
      008A03 90 AE FF FF      [ 2] 1904         LDW     Y,#0xFFFF       ; overflow result:
      008A07 FF               [ 2] 1905         LDW     (X),Y           ; quotient max. 16 bit value
      008A08 90 5F            [ 1] 1906         CLRW    Y
      008A0A EF 02            [ 2] 1907         LDW     (2,X),Y         ; remainder 0
      008A0C 81               [ 4] 1908         RET
      008A0D                       1909 MMSM1:
      008A0D A6 10            [ 1] 1910         LD      A,#16           ; loop count
      008A0F 90 58            [ 2] 1911         SLLW    Y               ; udl shift udl into udh
      008A11                       1912 MMSM3:
      008A11 59               [ 2] 1913         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      008A12 25 04            [ 1] 1914         JRC     MMSMa           ; if carry out of rotate
      008A14 B3 26            [ 2] 1915         CPW     X,YTEMP         ; compare udh to un
      008A16 25 05            [ 1] 1916         JRULT   MMSM4           ; can't subtract
      008A18                       1917 MMSMa:
      008A18 72 B0 00 26      [ 2] 1918         SUBW    X,YTEMP         ; can subtract
      008A1C 98               [ 1] 1919         RCF
      008A1D                       1920 MMSM4:
      008A1D 8C               [ 1] 1921         CCF                     ; quotient bit
      008A1E 90 59            [ 2] 1922         RLCW    Y               ; rotate into quotient, rotate out udl
      008A20 4A               [ 1] 1923         DEC     A               ; repeat
      008A21 26 EE            [ 1] 1924         JRNE    MMSM3           ; if A == 0
      008A23                       1925 MMSMb:
      008A23 BF 26            [ 2] 1926         LDW     YTEMP,X         ; done, save remainder
      008A25 85               [ 2] 1927         POPW    X               ; restore stack pointer
      008A26 FF               [ 2] 1928         LDW     (X),Y           ; save quotient
      008A27 90 BE 26         [ 2] 1929         LDW     Y,YTEMP         ; remainder onto stack
      008A2A EF 02            [ 2] 1930         LDW     (2,X),Y
      008A2C 81               [ 4] 1931         RET
                                   1932 
                                   1933 
                                   1934 ;----------------------------------------------	
                                   1935 ;       M/MOD   ( d n -- r q )
                                   1936 ;       Signed floored divide of double by
                                   1937 ;       single. Return mod and quotient.
                                   1938 ;----------------------------------------------	
      008A2D 89 EA                 1939         .word      LINK
                           0009AF  1940 LINK = . 
      008A2F 05                    1941         .byte      5
      008A30 4D 2F 4D 4F 44        1942         .ascii     "M/MOD"
      008A35                       1943 MSMOD:  
      008A35 CD 86 2E         [ 4] 1944         CALL	DUPP
      008A38 CD 86 67         [ 4] 1945         CALL	ZLESS
      008A3B CD 86 2E         [ 4] 1946         CALL	DUPP
      008A3E CD 85 F7         [ 4] 1947         CALL	TOR
      008A41 CD 85 24         [ 4] 1948         CALL	QBRAN
      008A44 8A 52                 1949         .word	MMOD1
      008A46 CD 88 88         [ 4] 1950         CALL	NEGAT
      008A49 CD 85 F7         [ 4] 1951         CALL	TOR
      008A4C CD 88 9A         [ 4] 1952         CALL	DNEGA
      008A4F CD 85 D8         [ 4] 1953         CALL	RFROM
      008A52 CD 85 F7         [ 4] 1954 MMOD1:	CALL	TOR
      008A55 CD 86 2E         [ 4] 1955         CALL	DUPP
      008A58 CD 86 67         [ 4] 1956         CALL	ZLESS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008A5B CD 85 24         [ 4] 1957         CALL	QBRAN
      008A5E 8A 66                 1958         .word	MMOD2
      008A60 CD 85 EB         [ 4] 1959         CALL	RAT
      008A63 CD 88 5D         [ 4] 1960         CALL	PLUS
      008A66 CD 85 D8         [ 4] 1961 MMOD2:	CALL	RFROM
      008A69 CD 89 F1         [ 4] 1962         CALL	UMMOD
      008A6C CD 85 D8         [ 4] 1963         CALL	RFROM
      008A6F CD 85 24         [ 4] 1964         CALL	QBRAN
      008A72 8A 7D                 1965         .word	MMOD3
      008A74 CD 86 3E         [ 4] 1966         CALL	SWAPP
      008A77 CD 88 88         [ 4] 1967         CALL	NEGAT
      008A7A CD 86 3E         [ 4] 1968         CALL	SWAPP
      008A7D 81               [ 4] 1969 MMOD3:	RET
                                   1970 
                                   1971 ;       /MOD    ( n n -- r q )
                                   1972 ;       Signed divide. Return mod and quotient.
      008A7E 8A 2F                 1973         .word      LINK
                           000A00  1974 LINK = . 
      008A80 04                    1975         .byte      4
      008A81 2F 4D 4F 44           1976         .ascii     "/MOD"
      008A85                       1977 SLMOD:
      008A85 CD 86 58         [ 4] 1978         CALL	OVER
      008A88 CD 86 67         [ 4] 1979         CALL	ZLESS
      008A8B CD 86 3E         [ 4] 1980         CALL	SWAPP
      008A8E CC 8A 35         [ 2] 1981         JP	MSMOD
                                   1982 
                                   1983 ;       MOD     ( n n -- r )
                                   1984 ;       Signed divide. Return mod only.
      008A91 8A 80                 1985         .word      LINK
                           000A13  1986 LINK = . 
      008A93 03                    1987         .byte      3
      008A94 4D 4F 44              1988         .ascii     "MOD"
      008A97                       1989 MODD:
      008A97 CD 8A 85         [ 4] 1990 	CALL	SLMOD
      008A9A CC 86 24         [ 2] 1991 	JP	DROP
                                   1992 
                                   1993 ;       /       ( n n -- q )
                                   1994 ;       Signed divide. Return quotient only.
      008A9D 8A 93                 1995         .word      LINK
                           000A1F  1996 LINK = . 
      008A9F 01                    1997         .byte      1
      008AA0 2F                    1998         .ascii     "/"
      008AA1                       1999 SLASH:
      008AA1 CD 8A 85         [ 4] 2000         CALL	SLMOD
      008AA4 CD 86 3E         [ 4] 2001         CALL	SWAPP
      008AA7 CC 86 24         [ 2] 2002         JP	DROP
                                   2003 
                                   2004 ;; Multiply
                                   2005 
                                   2006 ;       UM*     ( u u -- ud )
                                   2007 ;       Unsigned multiply. Return double product.
      008AAA 8A 9F                 2008         .word      LINK
                           000A2C  2009 LINK = . 
      008AAC 03                    2010         .byte      3
      008AAD 55 4D 2A              2011         .ascii     "UM*"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008AB0                       2012 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
                                   2013 ; take advantage of SP addressing modes
                                   2014 ; these PRODx in RAM are not required
                                   2015 ; the product is kept on stack as local variable 
                                   2016         ;; bytes offset on data stack 
                           000002  2017         da=2 
                           000003  2018         db=3 
                           000000  2019         dc=0 
                           000001  2020         dd=1 
                                   2021         ;; product bytes offset on return stack 
                           000001  2022         UD1=1  ; ud bits 31..24
                           000002  2023         UD2=2  ; ud bits 23..16
                           000003  2024         UD3=3  ; ud bits 15..8 
                           000004  2025         UD4=4  ; ud bits 7..0 
                                   2026         ;; local variable for product set to zero   
      008AB0 90 5F            [ 1] 2027         clrw y 
      008AB2 90 89            [ 2] 2028         pushw y  ; bits 15..0
      008AB4 90 89            [ 2] 2029         pushw y  ; bits 31..16 
      008AB6 E6 03            [ 1] 2030         ld a,(db,x) ; b 
      008AB8 90 97            [ 1] 2031         ld yl,a 
      008ABA E6 01            [ 1] 2032         ld a,(dd,x)   ; d
      008ABC 90 42            [ 4] 2033         mul y,a    ; b*d  
      008ABE 17 03            [ 2] 2034         ldw (UD3,sp),y ; lowest weight product 
      008AC0 E6 03            [ 1] 2035         ld a,(db,x)
      008AC2 90 97            [ 1] 2036         ld yl,a 
      008AC4 E6 00            [ 1] 2037         ld a,(dc,x)
      008AC6 90 42            [ 4] 2038         mul y,a  ; b*c 
                                   2039         ;;; do the partial sum 
      008AC8 72 F9 02         [ 2] 2040         addw y,(UD2,sp)
      008ACB 4F               [ 1] 2041         clr a 
      008ACC 49               [ 1] 2042         rlc a
      008ACD 6B 01            [ 1] 2043         ld (UD1,sp),a 
      008ACF 17 02            [ 2] 2044         ldw (UD2,sp),y 
      008AD1 E6 02            [ 1] 2045         ld a,(da,x)
      008AD3 90 97            [ 1] 2046         ld yl,a 
      008AD5 E6 01            [ 1] 2047         ld a,(dd,x)
      008AD7 90 42            [ 4] 2048         mul y,a   ; a*d 
                                   2049         ;; do partial sum 
      008AD9 72 F9 02         [ 2] 2050         addw y,(UD2,sp)
      008ADC 4F               [ 1] 2051         clr a 
      008ADD 19 01            [ 1] 2052         adc a,(UD1,sp)
      008ADF 6B 01            [ 1] 2053         ld (UD1,sp),a  
      008AE1 17 02            [ 2] 2054         ldw (UD2,sp),y 
      008AE3 E6 02            [ 1] 2055         ld a,(da,x)
      008AE5 90 97            [ 1] 2056         ld yl,a 
      008AE7 E6 00            [ 1] 2057         ld a,(dc,x)
      008AE9 90 42            [ 4] 2058         mul y,a  ;  a*c highest weight product 
                                   2059         ;;; do partial sum 
      008AEB 72 F9 01         [ 2] 2060         addw y,(UD1,sp)
      008AEE FF               [ 2] 2061         ldw (x),y  ; udh 
      008AEF 16 03            [ 2] 2062         ldw y,(UD3,sp)
      008AF1 EF 02            [ 2] 2063         ldw (2,x),y  ; udl  
      008AF3 5B 04            [ 2] 2064         addw sp,#4 ; drop local variable 
      008AF5 81               [ 4] 2065         ret  
                                   2066 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                                   2067 
                                   2068 ;       *       ( n n -- n )
                                   2069 ;       Signed multiply. Return single product.
      008AF6 8A AC                 2070         .word      LINK
                           000A78  2071 LINK = . 
      008AF8 01                    2072         .byte      1
      008AF9 2A                    2073         .ascii     "*"
      008AFA                       2074 STAR:
      008AFA CD 8A B0         [ 4] 2075 	CALL	UMSTA
      008AFD CC 86 24         [ 2] 2076 	JP	DROP
                                   2077 
                                   2078 ;       M*      ( n n -- d )
                                   2079 ;       Signed multiply. Return double product.
      008B00 8A F8                 2080         .word      LINK
                           000A82  2081 LINK = . 
      008B02 02                    2082         .byte      2
      008B03 4D 2A                 2083         .ascii     "M*"
      008B05                       2084 MSTAR:      
      008B05 CD 88 48         [ 4] 2085         CALL	DDUP
      008B08 CD 86 B6         [ 4] 2086         CALL	XORR
      008B0B CD 86 67         [ 4] 2087         CALL	ZLESS
      008B0E CD 85 F7         [ 4] 2088         CALL	TOR
      008B11 CD 88 F0         [ 4] 2089         CALL	ABSS
      008B14 CD 86 3E         [ 4] 2090         CALL	SWAPP
      008B17 CD 88 F0         [ 4] 2091         CALL	ABSS
      008B1A CD 8A B0         [ 4] 2092         CALL	UMSTA
      008B1D CD 85 D8         [ 4] 2093         CALL	RFROM
      008B20 CD 85 24         [ 4] 2094         CALL	QBRAN
      008B23 8B 28                 2095         .word	MSTA1
      008B25 CD 88 9A         [ 4] 2096         CALL	DNEGA
      008B28 81               [ 4] 2097 MSTA1:	RET
                                   2098 
                                   2099 ;       */MOD   ( n1 n2 n3 -- r q )
                                   2100 ;       Multiply n1 and n2, then divide
                                   2101 ;       by n3. Return mod and quotient.
      008B29 8B 02                 2102         .word      LINK
                           000AAB  2103 LINK = . 
      008B2B 05                    2104         .byte      5
      008B2C 2A 2F 4D 4F 44        2105         .ascii     "*/MOD"
      008B31                       2106 SSMOD:
      008B31 CD 85 F7         [ 4] 2107         CALL     TOR
      008B34 CD 8B 05         [ 4] 2108         CALL     MSTAR
      008B37 CD 85 D8         [ 4] 2109         CALL     RFROM
      008B3A CC 8A 35         [ 2] 2110         JP     MSMOD
                                   2111 
                                   2112 ;       */      ( n1 n2 n3 -- q )
                                   2113 ;       Multiply n1 by n2, then divide
                                   2114 ;       by n3. Return quotient only.
      008B3D 8B 2B                 2115         .word      LINK
                           000ABF  2116 LINK = . 
      008B3F 02                    2117         .byte      2
      008B40 2A 2F                 2118         .ascii     "*/"
      008B42                       2119 STASL:
      008B42 CD 8B 31         [ 4] 2120         CALL	SSMOD
      008B45 CD 86 3E         [ 4] 2121         CALL	SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008B48 CC 86 24         [ 2] 2122         JP	DROP
                                   2123 
                                   2124 ;; Miscellaneous
                                   2125 
                                   2126 ;       CELL+   ( a -- a )
                                   2127 ;       Add cell size in byte to address.
      008B4B 8B 3F                 2128         .word      LINK
                           000ACD  2129 LINK = . 
      008B4D 02                    2130         .byte       2
      008B4E 32 2B                 2131         .ascii     "2+"
      008B50                       2132 CELLP:
      008B50 90 93            [ 1] 2133         LDW Y,X
      008B52 90 FE            [ 2] 2134 	LDW Y,(Y)
      008B54 72 A9 00 02      [ 2] 2135         ADDW Y,#CELLL 
      008B58 FF               [ 2] 2136         LDW (X),Y
      008B59 81               [ 4] 2137         RET
                                   2138 
                                   2139 ;       CELL-   ( a -- a )
                                   2140 ;       Subtract 2 from address.
      008B5A 8B 4D                 2141         .word      LINK
                           000ADC  2142 LINK = . 
      008B5C 02                    2143         .byte       2
      008B5D 32 2D                 2144         .ascii     "2-"
      008B5F                       2145 CELLM:
      008B5F 90 93            [ 1] 2146         LDW Y,X
      008B61 90 FE            [ 2] 2147 	LDW Y,(Y)
      008B63 72 A2 00 02      [ 2] 2148         SUBW Y,#CELLL
      008B67 FF               [ 2] 2149         LDW (X),Y
      008B68 81               [ 4] 2150         RET
                                   2151 
                                   2152 ;       CELLS   ( n -- n )
                                   2153 ;       Multiply tos by 2.
      008B69 8B 5C                 2154         .word      LINK
                           000AEB  2155 LINK = . 
      008B6B 02                    2156         .byte       2
      008B6C 32 2A                 2157         .ascii     "2*"
      008B6E                       2158 CELLS:
      008B6E 90 93            [ 1] 2159         LDW Y,X
      008B70 90 FE            [ 2] 2160 	LDW Y,(Y)
      008B72 90 58            [ 2] 2161         SLAW Y
      008B74 FF               [ 2] 2162         LDW (X),Y
      008B75 81               [ 4] 2163         RET
                                   2164 
                                   2165 ;       1+      ( a -- a )
                                   2166 ;       Add cell size in byte to address.
      008B76 8B 6B                 2167         .word      LINK
                           000AF8  2168 LINK = . 
      008B78 02                    2169         .byte      2
      008B79 31 2B                 2170         .ascii     "1+"
      008B7B                       2171 ONEP:
      008B7B 90 93            [ 1] 2172         LDW Y,X
      008B7D 90 FE            [ 2] 2173 	LDW Y,(Y)
      008B7F 90 5C            [ 1] 2174         INCW Y
      008B81 FF               [ 2] 2175         LDW (X),Y
      008B82 81               [ 4] 2176         RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                                   2177 
                                   2178 ;       1-      ( a -- a )
                                   2179 ;       Subtract 2 from address.
      008B83 8B 78                 2180         .word      LINK
                           000B05  2181 LINK = . 
      008B85 02                    2182         .byte      2
      008B86 31 2D                 2183         .ascii     "1-"
      008B88                       2184 ONEM:
      008B88 90 93            [ 1] 2185         LDW Y,X
      008B8A 90 FE            [ 2] 2186 	LDW Y,(Y)
      008B8C 90 5A            [ 2] 2187         DECW Y
      008B8E FF               [ 2] 2188         LDW (X),Y
      008B8F 81               [ 4] 2189         RET
                                   2190 
                                   2191 ;  shift left n times 
                                   2192 ; LSHIFT ( n1 n2 -- n1<<n2 )
      008B90 8B 85                 2193         .word LINK 
                           000B12  2194         LINK=.
      008B92 06                    2195         .byte 6 
      008B93 4C 53 48 49 46 54     2196         .ascii "LSHIFT"
      008B99                       2197 LSHIFT:
      008B99 E6 01            [ 1] 2198         ld a,(1,x)
      008B9B 1C 00 02         [ 2] 2199         addw x,#CELLL 
      008B9E 90 93            [ 1] 2200         ldw y,x 
      008BA0 90 FE            [ 2] 2201         ldw y,(y)
      008BA2                       2202 LSHIFT1:
      008BA2 4D               [ 1] 2203         tnz a 
      008BA3 27 05            [ 1] 2204         jreq LSHIFT4 
      008BA5 90 58            [ 2] 2205         sllw y 
      008BA7 4A               [ 1] 2206         dec a 
      008BA8 20 F8            [ 2] 2207         jra LSHIFT1 
      008BAA                       2208 LSHIFT4:
      008BAA FF               [ 2] 2209         ldw (x),y 
      008BAB 81               [ 4] 2210         ret 
                                   2211 
                                   2212 ; shift right n times                 
                                   2213 ; RSHIFT (n1 n2 -- n1>>n2 )
      008BAC 8B 92                 2214         .word LINK 
                           000B2E  2215         LINK=.
      008BAE 06                    2216         .byte 6
      008BAF 52 53 48 49 46 54     2217         .ascii "RSHIFT"
      008BB5                       2218 RSHIFT:
      008BB5 E6 01            [ 1] 2219         ld a,(1,x)
      008BB7 1C 00 02         [ 2] 2220         addw x,#CELLL 
      008BBA 90 93            [ 1] 2221         ldw y,x 
      008BBC 90 FE            [ 2] 2222         ldw y,(y)
      008BBE                       2223 RSHIFT1:
      008BBE 4D               [ 1] 2224         tnz a 
      008BBF 27 05            [ 1] 2225         jreq RSHIFT4 
      008BC1 90 54            [ 2] 2226         srlw y 
      008BC3 4A               [ 1] 2227         dec a 
      008BC4 20 F8            [ 2] 2228         jra RSHIFT1 
      008BC6                       2229 RSHIFT4:
      008BC6 FF               [ 2] 2230         ldw (x),y 
      008BC7 81               [ 4] 2231         ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



                                   2232 
                                   2233 
                                   2234 ;       2/      ( n -- n )
                                   2235 ;       divide  tos by 2.
      008BC8 8B AE                 2236         .word      LINK
                           000B4A  2237 LINK = . 
      008BCA 02                    2238         .byte      2
      008BCB 32 2F                 2239         .ascii     "2/"
      008BCD                       2240 TWOSL:
      008BCD 90 93            [ 1] 2241         LDW Y,X
      008BCF 90 FE            [ 2] 2242 	LDW Y,(Y)
      008BD1 90 57            [ 2] 2243         SRAW Y
      008BD3 FF               [ 2] 2244         LDW (X),Y
      008BD4 81               [ 4] 2245         RET
                                   2246 
                                   2247 ;       BL      ( -- 32 )
                                   2248 ;       Return 32,  blank character.
      008BD5 8B CA                 2249         .word      LINK
                           000B57  2250 LINK = . 
      008BD7 02                    2251         .byte      2
      008BD8 42 4C                 2252         .ascii     "BL"
      008BDA                       2253 BLANK:
      008BDA 1D 00 02         [ 2] 2254         SUBW X,#2
      008BDD 90 AE 00 20      [ 2] 2255 	LDW Y,#32
      008BE1 FF               [ 2] 2256         LDW (X),Y
      008BE2 81               [ 4] 2257         RET
                                   2258 
                                   2259 ;         0     ( -- 0)
                                   2260 ;         Return 0.
      008BE3 8B D7                 2261         .word      LINK
                           000B65  2262 LINK = . 
      008BE5 01                    2263         .byte       1
      008BE6 30                    2264         .ascii     "0"
      008BE7                       2265 ZERO:
      008BE7 1D 00 02         [ 2] 2266         SUBW X,#2
      008BEA 90 5F            [ 1] 2267 	CLRW Y
      008BEC FF               [ 2] 2268         LDW (X),Y
      008BED 81               [ 4] 2269         RET
                                   2270 
                                   2271 ;         1     ( -- 1)
                                   2272 ;         Return 1.
      008BEE 8B E5                 2273         .word      LINK
                           000B70  2274 LINK = . 
      008BF0 01                    2275         .byte       1
      008BF1 31                    2276         .ascii     "1"
      008BF2                       2277 ONE:
      008BF2 1D 00 02         [ 2] 2278         SUBW X,#2
      008BF5 90 AE 00 01      [ 2] 2279 	LDW Y,#1
      008BF9 FF               [ 2] 2280         LDW (X),Y
      008BFA 81               [ 4] 2281         RET
                                   2282 
                                   2283 ;         -1    ( -- -1)
                                   2284 ;         Return 32,  blank character.
      008BFB 8B F0                 2285         .word      LINK
                           000B7D  2286 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008BFD 02                    2287         .byte       2
      008BFE 2D 31                 2288         .ascii     "-1"
      008C00                       2289 MONE:
      008C00 1D 00 02         [ 2] 2290         SUBW X,#2
      008C03 90 AE FF FF      [ 2] 2291 	LDW Y,#0xFFFF
      008C07 FF               [ 2] 2292         LDW (X),Y
      008C08 81               [ 4] 2293         RET
                                   2294 
                                   2295 ;       >CHAR   ( c -- c )
                                   2296 ;       Filter non-printing characters.
      008C09 8B FD                 2297         .word      LINK
                           000B8B  2298 LINK = . 
      008C0B 05                    2299         .byte      5
      008C0C 3E 43 48 41 52        2300         .ascii     ">CHAR"
      008C11                       2301 TCHAR:
      008C11 E6 01            [ 1] 2302         ld a,(1,x)
      008C13 A1 20            [ 1] 2303         cp a,#32  
      008C15 2B 05            [ 1] 2304         jrmi 1$ 
      008C17 A1 7F            [ 1] 2305         cp a,#127 
      008C19 2A 01            [ 1] 2306         jrpl 1$ 
      008C1B 81               [ 4] 2307         ret 
      008C1C A6 5F            [ 1] 2308 1$:     ld a,#'_ 
      008C1E E7 01            [ 1] 2309         ld (1,x),a 
      008C20 81               [ 4] 2310         ret 
                                   2311 
                                   2312 ;       DEPTH   ( -- n )
                                   2313 ;       Return  depth of  data stack.
      008C21 8C 0B                 2314         .word      LINK
                           000BA3  2315 LINK = . 
      008C23 05                    2316         .byte      5
      008C24 44 45 50 54 48        2317         .ascii     "DEPTH"
      008C29                       2318 DEPTH: 
      008C29 90 BE 2C         [ 2] 2319         LDW Y,SP0    ;save data stack ptr
      008C2C BF 24            [ 2] 2320 	LDW XTEMP,X
      008C2E 72 B2 00 24      [ 2] 2321         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008C32 90 57            [ 2] 2322         SRAW Y    ;Y = #stack items
      008C34 1D 00 02         [ 2] 2323 	SUBW X,#2
      008C37 FF               [ 2] 2324         LDW (X),Y     ; if neg, underflow
      008C38 81               [ 4] 2325         RET
                                   2326 
                                   2327 ;       PICK    ( ... +n -- ... w )
                                   2328 ;       Copy  nth stack item to tos.
      008C39 8C 23                 2329         .word      LINK
                           000BBB  2330 LINK = . 
      008C3B 04                    2331         .byte      4
      008C3C 50 49 43 4B           2332         .ascii     "PICK"
      008C40                       2333 PICK:
      008C40 90 93            [ 1] 2334         LDW Y,X   ;D = n1
      008C42 90 FE            [ 2] 2335         LDW Y,(Y)
                                   2336 ; modified for standard compliance          
                                   2337 ; 0 PICK must be equivalent to DUP 
      008C44 90 5C            [ 1] 2338         INCW Y 
      008C46 90 58            [ 2] 2339         SLAW Y
      008C48 BF 24            [ 2] 2340         LDW XTEMP,X
      008C4A 72 B9 00 24      [ 2] 2341         ADDW Y,XTEMP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008C4E 90 FE            [ 2] 2342         LDW Y,(Y)
      008C50 FF               [ 2] 2343         LDW (X),Y
      008C51 81               [ 4] 2344         RET
                                   2345 
                                   2346 ;; Memory access
                                   2347 
                                   2348 ;       +!      ( n a -- )
                                   2349 ;       Add n to  contents at address a.
      008C52 8C 3B                 2350         .word      LINK
                           000BD4  2351 LINK = . 
      008C54 02                    2352         .byte      2
      008C55 2B 21                 2353         .ascii     "+!"
      008C57                       2354 PSTOR:
      008C57 90 93            [ 1] 2355         ldw y,x 
      008C59 90 FE            [ 2] 2356         ldw y,(y)
      008C5B 90 BF 26         [ 2] 2357         ldw YTEMP,y  ; address
      008C5E 90 FE            [ 2] 2358         ldw y,(y)  
      008C60 90 89            [ 2] 2359         pushw y  ; value at address 
      008C62 90 93            [ 1] 2360         ldw y,x 
      008C64 90 EE 02         [ 2] 2361         ldw y,(2,y) ; n 
      008C67 72 F9 01         [ 2] 2362         addw y,(1,sp) ; n+value
      008C6A 91 CF 26         [ 5] 2363         ldw [YTEMP],y ;  a!
      008C6D 90 85            [ 2] 2364         popw y    ;drop local var
      008C6F 1C 00 04         [ 2] 2365         addw x,#4 ; DDROP 
      008C72 81               [ 4] 2366         ret 
                                   2367 
                                   2368 ;       2!      ( d a -- )
                                   2369 ;       Store  double integer to address a.
      008C73 8C 54                 2370         .word      LINK
                           000BF5  2371 LINK = . 
      008C75 02                    2372         .byte      2
      008C76 32 21                 2373         .ascii     "2!"
      008C78                       2374 DSTOR:
      008C78 90 93            [ 1] 2375         ldw y,x 
      008C7A 90 FE            [ 2] 2376         ldw y,(y)
      008C7C 90 BF 26         [ 2] 2377         ldw YTEMP,y ; address 
      008C7F 1C 00 02         [ 2] 2378         addw x,#CELLL ; drop a 
      008C82 90 93            [ 1] 2379         ldw y,x 
      008C84 90 FE            [ 2] 2380         ldw y,(y) ; hi word 
      008C86 89               [ 2] 2381         pushw x 
      008C87 EE 02            [ 2] 2382         ldw x,(2,x) ; lo word 
      008C89 91 CF 26         [ 5] 2383         ldw [YTEMP],y
      008C8C 90 93            [ 1] 2384         ldw y,x 
      008C8E AE 00 02         [ 2] 2385         ldw x,#2 
      008C91 92 DF 26         [ 5] 2386         ldw ([YTEMP],x),y 
      008C94 85               [ 2] 2387         popw x 
      008C95 1C 00 04         [ 2] 2388         addw x,#4 ; DDROP 
      008C98 81               [ 4] 2389         ret 
                                   2390 
                                   2391 ;       2@      ( a -- d )
                                   2392 ;       Fetch double integer from address a.
      008C99 8C 75                 2393         .word      LINK
                           000C1B  2394 LINK = . 
      008C9B 02                    2395         .byte      2
      008C9C 32 40                 2396         .ascii     "2@"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008C9E                       2397 DAT:
      008C9E 90 93            [ 1] 2398         ldw y,x 
      008CA0 90 FE            [ 2] 2399         ldw y,(y) ;address 
      008CA2 90 BF 26         [ 2] 2400         ldw YTEMP,y 
      008CA5 1D 00 02         [ 2] 2401         subw x,#CELLL ; space for udh 
      008CA8 91 CE 26         [ 5] 2402         ldw y,[YTEMP] ; udh 
      008CAB FF               [ 2] 2403         ldw (x),y 
      008CAC 90 AE 00 02      [ 2] 2404         ldw y,#2
      008CB0 91 DE 26         [ 5] 2405         ldw y,([YTEMP],y) ; udl 
      008CB3 EF 02            [ 2] 2406         ldw (2,x),y
      008CB5 81               [ 4] 2407         ret 
                                   2408 
                                   2409 ;       COUNT   ( b -- b +n )
                                   2410 ;       Return count byte of a string
                                   2411 ;       and add 1 to byte address.
      008CB6 8C 9B                 2412         .word      LINK
                           000C38  2413 LINK = . 
      008CB8 05                    2414         .byte      5
      008CB9 43 4F 55 4E 54        2415         .ascii     "COUNT"
      008CBE                       2416 COUNT:
      008CBE 90 93            [ 1] 2417         ldw y,x 
      008CC0 90 FE            [ 2] 2418         ldw y,(y) ; address 
      008CC2 90 F6            [ 1] 2419         ld a,(y)  ; count 
      008CC4 90 5C            [ 1] 2420         incw y 
      008CC6 FF               [ 2] 2421         ldw (x),y 
      008CC7 1D 00 02         [ 2] 2422         subw x,#CELLL 
      008CCA E7 01            [ 1] 2423         ld (1,x),a 
      008CCC 7F               [ 1] 2424         clr (x)
      008CCD 81               [ 4] 2425         ret 
                                   2426 
                                   2427 ;       HERE    ( -- a )
                                   2428 ;       Return  top of  variables
      008CCE 8C B8                 2429         .word      LINK
                           000C50  2430 LINK = . 
      008CD0 04                    2431         .byte      4
      008CD1 48 45 52 45           2432         .ascii     "HERE"
      008CD5                       2433 HERE:
      008CD5 90 AE 00 18      [ 2] 2434       	ldw y,#UVP 
      008CD9 90 FE            [ 2] 2435         ldw y,(y)
      008CDB 1D 00 02         [ 2] 2436         subw x,#CELLL 
      008CDE FF               [ 2] 2437         ldw (x),y 
      008CDF 81               [ 4] 2438         ret 
                                   2439 
                                   2440 ;       PAD     ( -- a )
                                   2441 ;       Return address of text buffer
                                   2442 ;       above  code dictionary.
      008CE0 8C D0                 2443         .word      LINK
                           000C62  2444 LINK = . 
      008CE2 03                    2445         .byte      3
      008CE3 50 41 44              2446         .ascii     "PAD"
      008CE6                       2447 PAD:
      008CE6 CD 8C D5         [ 4] 2448         CALL     HERE
      008CE9 CD 84 F1         [ 4] 2449         CALL     DOLIT
      008CEC 00 50                 2450         .word      80
      008CEE CC 88 5D         [ 2] 2451         JP     PLUS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



                                   2452 
                                   2453 ;       TIB     ( -- a )
                                   2454 ;       Return address of terminal input buffer.
      008CF1 8C E2                 2455         .word      LINK
                           000C73  2456 LINK = . 
      008CF3 03                    2457         .byte      3
      008CF4 54 49 42              2458         .ascii     "TIB"
      008CF7                       2459 TIB:
      008CF7 CD 87 2C         [ 4] 2460         CALL     NTIB
      008CFA CD 8B 50         [ 4] 2461         CALL     CELLP
      008CFD CC 85 87         [ 2] 2462         JP     AT
                                   2463 
                                   2464 ;       @EXECUTE        ( a -- )
                                   2465 ;       Execute vector stored in address a.
      008D00 8C F3                 2466         .word      LINK
                           000C82  2467 LINK = . 
      008D02 08                    2468         .byte      8
      008D03 40 45 58 45 43 55 54  2469         .ascii     "@EXECUTE"
             45
      008D0B                       2470 ATEXE:
      008D0B CD 85 87         [ 4] 2471         CALL     AT
      008D0E CD 87 EB         [ 4] 2472         CALL     QDUP    ;?address or zero
      008D11 CD 85 24         [ 4] 2473         CALL     QBRAN
      008D14 8D 19                 2474         .word      EXE1
      008D16 CD 85 63         [ 4] 2475         CALL     EXECU   ;execute if non-zero
      008D19 81               [ 4] 2476 EXE1:   RET     ;do nothing if zero
                                   2477 
                                   2478 ;       CMOVE   ( b1 b2 u -- )
                                   2479 ;       Copy u bytes from b1 to b2.
      008D1A 8D 02                 2480         .word      LINK
                           000C9C  2481 LINK = . 
      008D1C 05                    2482         .byte      5
      008D1D 43 4D 4F 56 45        2483         .ascii     "CMOVE"
      008D22                       2484 CMOVE:
      008D22 CD 85 F7         [ 4] 2485         CALL	TOR
      008D25 CD 85 53         [ 4] 2486         CALL	BRAN
      008D28 8D 42                 2487         .word	CMOV2
      008D2A CD 85 F7         [ 4] 2488 CMOV1:	CALL	TOR
      008D2D CD 86 2E         [ 4] 2489         CALL	DUPP
      008D30 CD 85 A5         [ 4] 2490         CALL	CAT
      008D33 CD 85 EB         [ 4] 2491         CALL	RAT
      008D36 CD 85 94         [ 4] 2492         CALL	CSTOR
      008D39 CD 8B 7B         [ 4] 2493         CALL	ONEP
      008D3C CD 85 D8         [ 4] 2494         CALL	RFROM
      008D3F CD 8B 7B         [ 4] 2495         CALL	ONEP
      008D42 CD 85 05         [ 4] 2496 CMOV2:	CALL	DONXT
      008D45 8D 2A                 2497         .word	CMOV1
      008D47 CC 88 3D         [ 2] 2498         JP	DDROP
                                   2499 
                                   2500 ;       FILL    ( b u c -- )
                                   2501 ;       Fill u bytes of character c
                                   2502 ;       to area beginning at b.
      008D4A 8D 1C                 2503         .word       LINK
                           000CCC  2504 LINK = . 
      008D4C 04                    2505         .byte       4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008D4D 46 49 4C 4C           2506         .ascii     "FILL"
      008D51                       2507 FILL:
      008D51 90 93            [ 1] 2508         ldw y,x 
      008D53 90 E6 01         [ 1] 2509         ld a,(1,y) ; c 
      008D56 1C 00 02         [ 2] 2510         addw x,#CELLL ; drop c 
      008D59 90 93            [ 1] 2511         ldw y,x 
      008D5B 90 FE            [ 2] 2512         ldw y,(y) ; count
      008D5D 90 89            [ 2] 2513         pushw y 
      008D5F 1C 00 02         [ 2] 2514         addw x,#CELLL ; drop u 
      008D62 90 93            [ 1] 2515         ldw y,x 
      008D64 1C 00 02         [ 2] 2516         addw x,#CELLL ; drop b 
      008D67 90 FE            [ 2] 2517         ldw y,(y) ; address
      008D69 90 BF 26         [ 2] 2518         ldw YTEMP,y
      008D6C 90 85            [ 2] 2519         popw y ; count 
      008D6E                       2520 FILL1:  
      008D6E 92 C7 26         [ 4] 2521         ld [YTEMP],a 
      008D71 3C 27            [ 1] 2522         inc YTEMP+1
      008D73 24 02            [ 1] 2523         jrnc FILL2 
      008D75 3C 26            [ 1] 2524         inc YTEMP
      008D77                       2525 FILL2: 
      008D77 90 5A            [ 2] 2526         decw y ; count 
      008D79 26 F3            [ 1] 2527         jrne FILL1  
      008D7B 81               [ 4] 2528         ret 
                                   2529 
                                   2530 ;       ERASE   ( b u -- )
                                   2531 ;       Erase u bytes beginning at b.
      008D7C 8D 4C                 2532         .word      LINK
                           000CFE  2533 LINK = . 
      008D7E 05                    2534         .byte      5
      008D7F 45 52 41 53 45        2535         .ascii     "ERASE"
      008D84                       2536 ERASE:
      008D84 90 5F            [ 1] 2537         clrw y 
      008D86 1D 00 02         [ 2] 2538         subw x,#CELLL 
      008D89 FF               [ 2] 2539         ldw (x),y 
      008D8A CC 8D 51         [ 2] 2540         jp FILL 
                                   2541 
                                   2542 
                                   2543 ;       PACK0   ( b u a -- a )
                                   2544 ;       Build a counted string with
                                   2545 ;       u characters from b. Null fill.
      008D8D 8D 7E                 2546         .word      LINK
                           000D0F  2547 LINK = . 
      008D8F 05                    2548         .byte      5
      008D90 50 41 43 4B 30        2549         .ascii     "PACK0"
      008D95                       2550 PACKS:
      008D95 CD 86 2E         [ 4] 2551         CALL     DUPP
      008D98 CD 85 F7         [ 4] 2552         CALL     TOR     ;strings only on cell boundary
      008D9B CD 88 48         [ 4] 2553         CALL     DDUP
      008D9E CD 85 94         [ 4] 2554         CALL     CSTOR
      008DA1 CD 8B 7B         [ 4] 2555         CALL     ONEP ;save count
      008DA4 CD 86 3E         [ 4] 2556         CALL     SWAPP
      008DA7 CD 8D 22         [ 4] 2557         CALL     CMOVE
      008DAA CD 85 D8         [ 4] 2558         CALL     RFROM
      008DAD 81               [ 4] 2559         RET
                                   2560 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



                                   2561 ;; Numeric output, single precision
                                   2562 
                                   2563 ;       DIGIT   ( u -- c )
                                   2564 ;       Convert digit u to a character.
      008DAE 8D 8F                 2565         .word      LINK
                           000D30  2566 LINK = . 
      008DB0 05                    2567         .byte      5
      008DB1 44 49 47 49 54        2568         .ascii     "DIGIT"
      008DB6                       2569 DIGIT:
      008DB6 CD 84 F1         [ 4] 2570         CALL	DOLIT
      008DB9 00 09                 2571         .word	9
      008DBB CD 86 58         [ 4] 2572         CALL	OVER
      008DBE CD 89 3B         [ 4] 2573         CALL	LESS
      008DC1 CD 84 F1         [ 4] 2574         CALL	DOLIT
      008DC4 00 07                 2575         .word	7
      008DC6 CD 86 8D         [ 4] 2576         CALL	ANDD
      008DC9 CD 88 5D         [ 4] 2577         CALL	PLUS
      008DCC CD 84 F1         [ 4] 2578         CALL	DOLIT
      008DCF 00 30                 2579         .word	48	;'0'
      008DD1 CC 88 5D         [ 2] 2580         JP	PLUS
                                   2581 
                                   2582 ;       EXTRACT ( n base -- n c )
                                   2583 ;       Extract least significant digit from n.
      008DD4 8D B0                 2584         .word      LINK
                           000D56  2585 LINK = . 
      008DD6 07                    2586         .byte      7
      008DD7 45 58 54 52 41 43 54  2587         .ascii     "EXTRACT"
      008DDE                       2588 EXTRC:
      008DDE CD 8B E7         [ 4] 2589         CALL     ZERO
      008DE1 CD 86 3E         [ 4] 2590         CALL     SWAPP
      008DE4 CD 89 F1         [ 4] 2591         CALL     UMMOD
      008DE7 CD 86 3E         [ 4] 2592         CALL     SWAPP
      008DEA CC 8D B6         [ 2] 2593         JP     DIGIT
                                   2594 
                                   2595 ;       <#      ( -- )
                                   2596 ;       Initiate  numeric output process.
      008DED 8D D6                 2597         .word      LINK
                           000D6F  2598 LINK = . 
      008DEF 02                    2599         .byte      2
      008DF0 3C 23                 2600         .ascii     "<#"
      008DF2                       2601 BDIGS:
      008DF2 CD 8C E6         [ 4] 2602         CALL     PAD
      008DF5 CD 87 6E         [ 4] 2603         CALL     HLD
      008DF8 CC 85 70         [ 2] 2604         JP     STORE
                                   2605 
                                   2606 ;       HOLD    ( c -- )
                                   2607 ;       Insert a character into output string.
      008DFB 8D EF                 2608         .word      LINK
                           000D7D  2609 LINK = . 
      008DFD 04                    2610         .byte      4
      008DFE 48 4F 4C 44           2611         .ascii     "HOLD"
      008E02                       2612 HOLD:
      008E02 CD 87 6E         [ 4] 2613         CALL     HLD
      008E05 CD 85 87         [ 4] 2614         CALL     AT
      008E08 CD 8B 88         [ 4] 2615         CALL     ONEM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008E0B CD 86 2E         [ 4] 2616         CALL     DUPP
      008E0E CD 87 6E         [ 4] 2617         CALL     HLD
      008E11 CD 85 70         [ 4] 2618         CALL     STORE
      008E14 CC 85 94         [ 2] 2619         JP     CSTOR
                                   2620 
                                   2621 ;       #       ( u -- u )
                                   2622 ;       Extract one digit from u and
                                   2623 ;       append digit to output string.
      008E17 8D FD                 2624         .word      LINK
                           000D99  2625 LINK = . 
      008E19 01                    2626         .byte      1
      008E1A 23                    2627         .ascii     "#"
      008E1B                       2628 DIG:
      008E1B CD 86 FE         [ 4] 2629         CALL     BASE
      008E1E CD 85 87         [ 4] 2630         CALL     AT
      008E21 CD 8D DE         [ 4] 2631         CALL     EXTRC
      008E24 CC 8E 02         [ 2] 2632         JP     HOLD
                                   2633 
                                   2634 ;       #S      ( u -- 0 )
                                   2635 ;       Convert u until all digits
                                   2636 ;       are added to output string.
      008E27 8E 19                 2637         .word      LINK
                           000DA9  2638 LINK = . 
      008E29 02                    2639         .byte      2
      008E2A 23 53                 2640         .ascii     "#S"
      008E2C                       2641 DIGS:
      008E2C CD 8E 1B         [ 4] 2642 DIGS1:  CALL     DIG
      008E2F CD 86 2E         [ 4] 2643         CALL     DUPP
      008E32 CD 85 24         [ 4] 2644         CALL     QBRAN
      008E35 8E 39                 2645         .word      DIGS2
      008E37 20 F3            [ 2] 2646         JRA     DIGS1
      008E39 81               [ 4] 2647 DIGS2:  RET
                                   2648 
                                   2649 ;       SIGN    ( n -- )
                                   2650 ;       Add a minus sign to
                                   2651 ;       numeric output string.
      008E3A 8E 29                 2652         .word      LINK
                           000DBC  2653 LINK = . 
      008E3C 04                    2654         .byte      4
      008E3D 53 49 47 4E           2655         .ascii     "SIGN"
      008E41                       2656 SIGN:
      008E41 CD 86 67         [ 4] 2657         CALL     ZLESS
      008E44 CD 85 24         [ 4] 2658         CALL     QBRAN
      008E47 8E 51                 2659         .word      SIGN1
      008E49 CD 84 F1         [ 4] 2660         CALL     DOLIT
      008E4C 00 2D                 2661         .word      45	;"-"
      008E4E CC 8E 02         [ 2] 2662         JP     HOLD
      008E51 81               [ 4] 2663 SIGN1:  RET
                                   2664 
                                   2665 ;       #>      ( w -- b u )
                                   2666 ;       Prepare output string.
      008E52 8E 3C                 2667         .word      LINK
                           000DD4  2668 LINK = . 
      008E54 02                    2669         .byte      2
      008E55 23 3E                 2670         .ascii     "#>"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008E57                       2671 EDIGS:
      008E57 CD 86 24         [ 4] 2672         CALL     DROP
      008E5A CD 87 6E         [ 4] 2673         CALL     HLD
      008E5D CD 85 87         [ 4] 2674         CALL     AT
      008E60 CD 8C E6         [ 4] 2675         CALL     PAD
      008E63 CD 86 58         [ 4] 2676         CALL     OVER
      008E66 CC 88 D6         [ 2] 2677         JP     SUBB
                                   2678 
                                   2679 ;       str     ( w -- b u )
                                   2680 ;       Convert a signed integer
                                   2681 ;       to a numeric string.
      008E69 8E 54                 2682         .word      LINK
                           000DEB  2683 LINK = . 
      008E6B 03                    2684         .byte      3
      008E6C 53 54 52              2685         .ascii     "STR"
      008E6F                       2686 STR:
      008E6F CD 86 2E         [ 4] 2687         CALL     DUPP
      008E72 CD 85 F7         [ 4] 2688         CALL     TOR
      008E75 CD 88 F0         [ 4] 2689         CALL     ABSS
      008E78 CD 8D F2         [ 4] 2690         CALL     BDIGS
      008E7B CD 8E 2C         [ 4] 2691         CALL     DIGS
      008E7E CD 85 D8         [ 4] 2692         CALL     RFROM
      008E81 CD 8E 41         [ 4] 2693         CALL     SIGN
      008E84 CC 8E 57         [ 2] 2694         JP     EDIGS
                                   2695 
                                   2696 ;       HEX     ( -- )
                                   2697 ;       Use radix 16 as base for
                                   2698 ;       numeric conversions.
      008E87 8E 6B                 2699         .word      LINK
                           000E09  2700 LINK = . 
      008E89 03                    2701         .byte      3
      008E8A 48 45 58              2702         .ascii     "HEX"
      008E8D                       2703 HEX:
      008E8D CD 84 F1         [ 4] 2704         CALL     DOLIT
      008E90 00 10                 2705         .word      16
      008E92 CD 86 FE         [ 4] 2706         CALL     BASE
      008E95 CC 85 70         [ 2] 2707         JP     STORE
                                   2708 
                                   2709 ;       DECIMAL ( -- )
                                   2710 ;       Use radix 10 as base
                                   2711 ;       for numeric conversions.
      008E98 8E 89                 2712         .word      LINK
                           000E1A  2713 LINK = . 
      008E9A 07                    2714         .byte      7
      008E9B 44 45 43 49 4D 41 4C  2715         .ascii     "DECIMAL"
      008EA2                       2716 DECIM:
      008EA2 CD 84 F1         [ 4] 2717         CALL     DOLIT
      008EA5 00 0A                 2718         .word      10
      008EA7 CD 86 FE         [ 4] 2719         CALL     BASE
      008EAA CC 85 70         [ 2] 2720         JP     STORE
                                   2721 
                                   2722 ;; Numeric input, single precision
                                   2723 
                                   2724 ;       DIGIT?  ( c base -- u t )
                                   2725 ;       Convert a character to its numeric
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2726 ;       value. A flag indicates success.
      008EAD 8E 9A                 2727         .word      LINK
                           000E2F  2728 LINK = . 
      008EAF 06                    2729         .byte       6
      008EB0 44 49 47 49 54 3F     2730         .ascii     "DIGIT?"
      008EB6                       2731 DIGTQ:
      008EB6 CD 85 F7         [ 4] 2732         CALL     TOR
      008EB9 CD 84 F1         [ 4] 2733         CALL     DOLIT
      008EBC 00 30                 2734         .word     48	; "0"
      008EBE CD 88 D6         [ 4] 2735         CALL     SUBB
      008EC1 CD 84 F1         [ 4] 2736         CALL     DOLIT
      008EC4 00 09                 2737         .word      9
      008EC6 CD 86 58         [ 4] 2738         CALL     OVER
      008EC9 CD 89 3B         [ 4] 2739         CALL     LESS
      008ECC CD 85 24         [ 4] 2740         CALL     QBRAN
      008ECF 8E E7                 2741         .word      DGTQ1
      008ED1 CD 84 F1         [ 4] 2742         CALL     DOLIT
      008ED4 00 07                 2743         .word      7
      008ED6 CD 88 D6         [ 4] 2744         CALL     SUBB
      008ED9 CD 86 2E         [ 4] 2745         CALL     DUPP
      008EDC CD 84 F1         [ 4] 2746         CALL     DOLIT
      008EDF 00 0A                 2747         .word      10
      008EE1 CD 89 3B         [ 4] 2748         CALL     LESS
      008EE4 CD 86 A1         [ 4] 2749         CALL     ORR
      008EE7 CD 86 2E         [ 4] 2750 DGTQ1:  CALL     DUPP
      008EEA CD 85 D8         [ 4] 2751         CALL     RFROM
      008EED CC 89 1D         [ 2] 2752         JP     ULESS
                                   2753 
                           000001  2754 .if  WANT_DOUBLE
                           000000  2755 .else 
                                   2756 ;       NUMBER? ( a -- n T | a F )
                                   2757 ;       Convert a number string to
                                   2758 ;       integer. Push a flag on tos.
                                   2759         .word      LINK
                                   2760 LINK = . 
                                   2761         .byte      7
                                   2762         .ascii     "NUMBER?"
                                   2763 NUMBQ:
                                   2764         CALL     BASE
                                   2765         CALL     AT
                                   2766         CALL     TOR
                                   2767         CALL     ZERO
                                   2768         CALL     OVER
                                   2769         CALL     COUNT
                                   2770         CALL     OVER
                                   2771         CALL     CAT
                                   2772         CALL     DOLIT
                                   2773         .word     36	; "0x"
                                   2774         CALL     EQUAL
                                   2775         CALL     QBRAN
                                   2776         .word      NUMQ1
                                   2777         CALL     HEX
                                   2778         CALL     SWAPP
                                   2779         CALL     ONEP
                                   2780         CALL     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2781         CALL     ONEM
                                   2782 NUMQ1:  CALL     OVER
                                   2783         CALL     CAT
                                   2784         CALL     DOLIT
                                   2785         .word     45	; "-"
                                   2786         CALL     EQUAL
                                   2787         CALL     TOR
                                   2788         CALL     SWAPP
                                   2789         CALL     RAT
                                   2790         CALL     SUBB
                                   2791         CALL     SWAPP
                                   2792         CALL     RAT
                                   2793         CALL     PLUS
                                   2794         CALL     QDUP
                                   2795         CALL     QBRAN
                                   2796         .word      NUMQ6
                                   2797         CALL     ONEM
                                   2798         CALL     TOR
                                   2799 NUMQ2:  CALL     DUPP
                                   2800         CALL     TOR
                                   2801         CALL     CAT
                                   2802         CALL     BASE
                                   2803         CALL     AT
                                   2804         CALL     DIGTQ
                                   2805         CALL     QBRAN
                                   2806         .word      NUMQ4
                                   2807         CALL     SWAPP
                                   2808         CALL     BASE
                                   2809         CALL     AT
                                   2810         CALL     STAR
                                   2811         CALL     PLUS
                                   2812         CALL     RFROM
                                   2813         CALL     ONEP
                                   2814         CALL     DONXT
                                   2815         .word      NUMQ2
                                   2816         CALL     RAT
                                   2817         CALL     SWAPP
                                   2818         CALL     DROP
                                   2819         CALL     QBRAN
                                   2820         .word      NUMQ3
                                   2821         CALL     NEGAT
                                   2822 NUMQ3:  CALL     SWAPP
                                   2823         JRA     NUMQ5
                                   2824 NUMQ4:  CALL     RFROM
                                   2825         CALL     RFROM
                                   2826         CALL     DDROP
                                   2827         CALL     DDROP
                                   2828         CALL     ZERO
                                   2829 NUMQ5:  CALL     DUPP
                                   2830 NUMQ6:  CALL     RFROM
                                   2831         CALL     DDROP
                                   2832         CALL     RFROM
                                   2833         CALL     BASE
                                   2834         JP     STORE
                                   2835 .endif ; WANT_DOUBLE  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                                   2836 
                                   2837 ;; Basic I/O
                                   2838 
                                   2839 ;       KEY     ( -- c )
                                   2840 ;       Wait for and return an
                                   2841 ;       input character.
      008EF0 8E AF                 2842         .word      LINK
                           000E72  2843 LINK = . 
      008EF2 03                    2844         .byte      3
      008EF3 4B 45 59              2845         .ascii     "KEY"
      008EF6                       2846 KEY:
      008EF6 72 0B 52 30 FB   [ 2] 2847         btjf UART_SR,#UART_SR_RXNE,. 
      008EFB C6 52 31         [ 1] 2848         ld a,UART_DR 
      008EFE 1D 00 02         [ 2] 2849         subw x,#CELLL 
      008F01 E7 01            [ 1] 2850         ld (1,x),a 
      008F03 7F               [ 1] 2851         clr (x)
      008F04 81               [ 4] 2852         ret 
                                   2853 
                                   2854 ;       NUF?    ( -- t )
                                   2855 ;       Return false if no input,
                                   2856 ;       else pause and if CR return true.
      008F05 8E F2                 2857         .word      LINK
                           000E87  2858 LINK = . 
      008F07 04                    2859         .byte      4
      008F08 4E 55 46 3F           2860         .ascii     "NUF?"
      008F0C                       2861 NUFQ:
      008F0C CD 84 98         [ 4] 2862         CALL     QKEY
      008F0F CD 86 2E         [ 4] 2863         CALL     DUPP
      008F12 CD 85 24         [ 4] 2864         CALL     QBRAN
      008F15 8F 25                 2865         .word    NUFQ1
      008F17 CD 88 3D         [ 4] 2866         CALL     DDROP
      008F1A CD 8E F6         [ 4] 2867         CALL     KEY
      008F1D CD 84 F1         [ 4] 2868         CALL     DOLIT
      008F20 00 0D                 2869         .word      CRR
      008F22 CC 88 FE         [ 2] 2870         JP     EQUAL
      008F25 81               [ 4] 2871 NUFQ1:  RET
                                   2872 
                                   2873 ;       SPACE   ( -- )
                                   2874 ;       Send  blank character to
                                   2875 ;       output device.
      008F26 8F 07                 2876         .word      LINK
                           000EA8  2877 LINK = . 
      008F28 05                    2878         .byte      5
      008F29 53 50 41 43 45        2879         .ascii     "SPACE"
      008F2E                       2880 SPACE:
      008F2E CD 8B DA         [ 4] 2881         CALL     BLANK
      008F31 CC 84 B6         [ 2] 2882         JP     EMIT
                                   2883 
                                   2884 ;       SPACES  ( +n -- )
                                   2885 ;       Send n spaces to output device.
      008F34 8F 28                 2886         .word      LINK
                           000EB6  2887 LINK = . 
      008F36 06                    2888         .byte      6
      008F37 53 50 41 43 45 53     2889         .ascii     "SPACES"
      008F3D                       2890 SPACS:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008F3D CD 8B E7         [ 4] 2891         CALL     ZERO
      008F40 CD 89 99         [ 4] 2892         CALL     MAX
      008F43 CD 85 F7         [ 4] 2893         CALL     TOR
      008F46 20 03            [ 2] 2894         JRA      CHAR2
      008F48 CD 8F 2E         [ 4] 2895 CHAR1:  CALL     SPACE
      008F4B CD 85 05         [ 4] 2896 CHAR2:  CALL     DONXT
      008F4E 8F 48                 2897         .word    CHAR1
      008F50 81               [ 4] 2898         RET
                                   2899 
                                   2900 ;       TYPE    ( b u -- )
                                   2901 ;       Output u characters from b.
      008F51 8F 36                 2902         .word      LINK
                           000ED3  2903 LINK = . 
      008F53 04                    2904         .byte      4
      008F54 54 59 50 45           2905         .ascii     "TYPE"
      008F58                       2906 TYPES:
      008F58 CD 85 F7         [ 4] 2907         CALL     TOR
      008F5B 20 0C            [ 2] 2908         JRA     TYPE2
      008F5D CD 86 2E         [ 4] 2909 TYPE1:  CALL     DUPP
      008F60 CD 85 A5         [ 4] 2910         CALL     CAT
      008F63 CD 84 B6         [ 4] 2911         CALL     EMIT
      008F66 CD 8B 7B         [ 4] 2912         CALL     ONEP
      008F69 CD 85 05         [ 4] 2913 TYPE2:  CALL     DONXT
      008F6C 8F 5D                 2914         .word      TYPE1
      008F6E CC 86 24         [ 2] 2915         JP     DROP
                                   2916 
                                   2917 ;       CR      ( -- )
                                   2918 ;       Output a carriage return
                                   2919 ;       and a line feed.
      008F71 8F 53                 2920         .word      LINK
                           000EF3  2921 LINK = . 
      008F73 02                    2922         .byte      2
      008F74 43 52                 2923         .ascii     "CR"
      008F76                       2924 CR:
      008F76 CD 84 F1         [ 4] 2925         CALL     DOLIT
      008F79 00 0D                 2926         .word      CRR
      008F7B CD 84 B6         [ 4] 2927         CALL     EMIT
      008F7E CD 84 F1         [ 4] 2928         CALL     DOLIT
      008F81 00 0A                 2929         .word      LF
      008F83 CC 84 B6         [ 2] 2930         JP     EMIT
                                   2931 
                                   2932 ;       do$     ( -- a )
                                   2933 ;       Return  address of a compiled
                                   2934 ;       string.
      008F86 8F 73                 2935         .word      LINK
                           000F08  2936 LINK = . 
      008F88 43                    2937 	.byte      COMPO+3
      008F89 44 4F 24              2938         .ascii     "DO$"
      008F8C                       2939 DOSTR:
      008F8C CD 85 D8         [ 4] 2940         CALL     RFROM
      008F8F CD 85 EB         [ 4] 2941         CALL     RAT
      008F92 CD 85 D8         [ 4] 2942         CALL     RFROM
      008F95 CD 8C BE         [ 4] 2943         CALL     COUNT
      008F98 CD 88 5D         [ 4] 2944         CALL     PLUS
      008F9B CD 85 F7         [ 4] 2945         CALL     TOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      008F9E CD 86 3E         [ 4] 2946         CALL     SWAPP
      008FA1 CD 85 F7         [ 4] 2947         CALL     TOR
      008FA4 81               [ 4] 2948         RET
                                   2949 
                                   2950 ;       $"|     ( -- a )
                                   2951 ;       Run time routine compiled by $".
                                   2952 ;       Return address of a compiled string.
      008FA5 8F 88                 2953         .word      LINK
                           000F27  2954 LINK = . 
      008FA7 43                    2955 	.byte      COMPO+3
      008FA8 24 22 7C              2956         .byte     '$','"','|'
      008FAB                       2957 STRQP:
      008FAB CD 8F 8C         [ 4] 2958         CALL     DOSTR
      008FAE 81               [ 4] 2959         RET
                                   2960 
                                   2961 ;       ."|     ( -- )
                                   2962 ;       Run time routine of ." .
                                   2963 ;       Output a compiled string.
      008FAF 8F A7                 2964         .word      LINK
                           000F31  2965 LINK = . 
      008FB1 43                    2966 	.byte      COMPO+3
      008FB2 2E 22 7C              2967         .byte     '.','"','|'
      008FB5                       2968 DOTQP:
      008FB5 CD 8F 8C         [ 4] 2969         CALL     DOSTR
      008FB8 CD 8C BE         [ 4] 2970         CALL     COUNT
      008FBB CC 8F 58         [ 2] 2971         JP     TYPES
                                   2972 
                                   2973 ;       .R      ( n +n -- )
                                   2974 ;       Display an integer in a field
                                   2975 ;       of n columns, right justified.
      008FBE 8F B1                 2976         .word      LINK
                           000F40  2977 LINK = . 
      008FC0 02                    2978         .byte      2
      008FC1 2E 52                 2979         .ascii     ".R"
      008FC3                       2980 DOTR:
      008FC3 CD 85 F7         [ 4] 2981         CALL     TOR
      008FC6 CD 8E 6F         [ 4] 2982         CALL     STR
      008FC9 CD 85 D8         [ 4] 2983         CALL     RFROM
      008FCC CD 86 58         [ 4] 2984         CALL     OVER
      008FCF CD 88 D6         [ 4] 2985         CALL     SUBB
      008FD2 CD 8F 3D         [ 4] 2986         CALL     SPACS
      008FD5 CC 8F 58         [ 2] 2987         JP     TYPES
                                   2988 
                                   2989 ;       U.R     ( u +n -- )
                                   2990 ;       Display an unsigned integer
                                   2991 ;       in n column, right justified.
      008FD8 8F C0                 2992         .word      LINK
                           000F5A  2993 LINK = . 
      008FDA 03                    2994         .byte      3
      008FDB 55 2E 52              2995         .ascii     "U.R"
      008FDE                       2996 UDOTR:
      008FDE CD 85 F7         [ 4] 2997         CALL     TOR
      008FE1 CD 8D F2         [ 4] 2998         CALL     BDIGS
      008FE4 CD 8E 2C         [ 4] 2999         CALL     DIGS
      008FE7 CD 8E 57         [ 4] 3000         CALL     EDIGS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      008FEA CD 85 D8         [ 4] 3001         CALL     RFROM
      008FED CD 86 58         [ 4] 3002         CALL     OVER
      008FF0 CD 88 D6         [ 4] 3003         CALL     SUBB
      008FF3 CD 8F 3D         [ 4] 3004         CALL     SPACS
      008FF6 CC 8F 58         [ 2] 3005         JP     TYPES
                                   3006 
                                   3007 ;       U.      ( u -- )
                                   3008 ;       Display an unsigned integer
                                   3009 ;       in free format.
      008FF9 8F DA                 3010         .word      LINK
                           000F7B  3011 LINK = . 
      008FFB 02                    3012         .byte      2
      008FFC 55 2E                 3013         .ascii     "U."
      008FFE                       3014 UDOT:
      008FFE CD 8D F2         [ 4] 3015         CALL     BDIGS
      009001 CD 8E 2C         [ 4] 3016         CALL     DIGS
      009004 CD 8E 57         [ 4] 3017         CALL     EDIGS
      009007 CD 8F 2E         [ 4] 3018         CALL     SPACE
      00900A CC 8F 58         [ 2] 3019         JP     TYPES
                                   3020 
                                   3021 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3022 ;   H. ( n -- )
                                   3023 ;   display n in hexadecimal 
                                   3024 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F8D                       3025         _HEADER HDOT,2,"H."
      00900D 8F FB                    1         .word LINK 
                           000F8F     2         LINK=.
      00900F 02                       3         .byte 2  
      009010 48 2E                    4         .ascii "H."
      009012                          5         HDOT:
      009012 CD 86 FE         [ 4] 3026         CALL BASE 
      009015 CD 85 87         [ 4] 3027         CALL AT 
      009018 CD 85 F7         [ 4] 3028         CALL TOR 
      00901B CD 8E 8D         [ 4] 3029         CALL HEX 
      00901E CD 8F FE         [ 4] 3030         CALL UDOT 
      009021 CD 85 D8         [ 4] 3031         CALL RFROM 
      009024 CD 86 FE         [ 4] 3032         CALL BASE 
      009027 CD 85 70         [ 4] 3033         CALL STORE 
      00902A 81               [ 4] 3034         RET 
                                   3035 
                                   3036 
                                   3037 ;       .       ( w -- )
                                   3038 ;       Display an integer in free
                                   3039 ;       format, preceeded by a space.
      00902B 90 0F                 3040         .word      LINK
                           000FAD  3041 LINK = . 
      00902D 01                    3042         .byte      1
      00902E 2E                    3043         .ascii     "."
      00902F                       3044 DOT:
      00902F CD 86 FE         [ 4] 3045         CALL     BASE
      009032 CD 85 87         [ 4] 3046         CALL     AT
      009035 CD 84 F1         [ 4] 3047         CALL     DOLIT
      009038 00 0A                 3048         .word      10
      00903A CD 86 B6         [ 4] 3049         CALL     XORR    ;?decimal
      00903D CD 85 24         [ 4] 3050         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      009040 90 45                 3051         .word      DOT1
      009042 CC 8F FE         [ 2] 3052         JP     UDOT
      009045 CD 8E 6F         [ 4] 3053 DOT1:   CALL     STR
      009048 CD 8F 2E         [ 4] 3054         CALL     SPACE
      00904B CC 8F 58         [ 2] 3055         JP     TYPES
                                   3056 
                                   3057 ;       ?       ( a -- )
                                   3058 ;       Display contents in memory cell.
      00904E 90 2D                 3059         .word      LINK
                                   3060         
                           000FD0  3061 LINK = . 
      009050 01                    3062         .byte      1
      009051 3F                    3063         .ascii     "?"
      009052                       3064 QUEST:
      009052 CD 85 87         [ 4] 3065         CALL     AT
      009055 CC 90 2F         [ 2] 3066         JP     DOT
                                   3067 
                                   3068 ;; Parsing
                                   3069 
                                   3070 ;       parse   ( b u c -- b u delta ; <string> )
                                   3071 ;       Scan string delimited by c.
                                   3072 ;       Return found string and its offset.
      009058 90 50                 3073         .word      LINK
                           000FDA  3074 LINK = . 
      00905A 05                    3075         .byte      5
      00905B 70 61 72 73 65        3076         .ascii     "parse"
      009060                       3077 PARS:
      009060 CD 87 0D         [ 4] 3078         CALL     TEMP
      009063 CD 85 70         [ 4] 3079         CALL     STORE
      009066 CD 86 58         [ 4] 3080         CALL     OVER
      009069 CD 85 F7         [ 4] 3081         CALL     TOR
      00906C CD 86 2E         [ 4] 3082         CALL     DUPP
      00906F CD 85 24         [ 4] 3083         CALL     QBRAN
      009072 91 18                 3084         .word    PARS8
      009074 CD 8B 88         [ 4] 3085         CALL     ONEM
      009077 CD 87 0D         [ 4] 3086         CALL     TEMP
      00907A CD 85 87         [ 4] 3087         CALL     AT
      00907D CD 8B DA         [ 4] 3088         CALL     BLANK
      009080 CD 88 FE         [ 4] 3089         CALL     EQUAL
      009083 CD 85 24         [ 4] 3090         CALL     QBRAN
      009086 90 B9                 3091         .word      PARS3
      009088 CD 85 F7         [ 4] 3092         CALL     TOR
      00908B CD 8B DA         [ 4] 3093 PARS1:  CALL     BLANK
      00908E CD 86 58         [ 4] 3094         CALL     OVER
      009091 CD 85 A5         [ 4] 3095         CALL     CAT     ;skip leading blanks ONLY
      009094 CD 88 D6         [ 4] 3096         CALL     SUBB
      009097 CD 86 67         [ 4] 3097         CALL     ZLESS
      00909A CD 88 77         [ 4] 3098         CALL     INVER
      00909D CD 85 24         [ 4] 3099         CALL     QBRAN
      0090A0 90 B6                 3100         .word      PARS2
      0090A2 CD 8B 7B         [ 4] 3101         CALL     ONEP
      0090A5 CD 85 05         [ 4] 3102         CALL     DONXT
      0090A8 90 8B                 3103         .word      PARS1
      0090AA CD 85 D8         [ 4] 3104         CALL     RFROM
      0090AD CD 86 24         [ 4] 3105         CALL     DROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      0090B0 CD 8B E7         [ 4] 3106         CALL     ZERO
      0090B3 CC 86 2E         [ 2] 3107         JP     DUPP
      0090B6 CD 85 D8         [ 4] 3108 PARS2:  CALL     RFROM
      0090B9 CD 86 58         [ 4] 3109 PARS3:  CALL     OVER
      0090BC CD 86 3E         [ 4] 3110         CALL     SWAPP
      0090BF CD 85 F7         [ 4] 3111         CALL     TOR
      0090C2 CD 87 0D         [ 4] 3112 PARS4:  CALL     TEMP
      0090C5 CD 85 87         [ 4] 3113         CALL     AT
      0090C8 CD 86 58         [ 4] 3114         CALL     OVER
      0090CB CD 85 A5         [ 4] 3115         CALL     CAT
      0090CE CD 88 D6         [ 4] 3116         CALL     SUBB    ;scan for delimiter
      0090D1 CD 87 0D         [ 4] 3117         CALL     TEMP
      0090D4 CD 85 87         [ 4] 3118         CALL     AT
      0090D7 CD 8B DA         [ 4] 3119         CALL     BLANK
      0090DA CD 88 FE         [ 4] 3120         CALL     EQUAL
      0090DD CD 85 24         [ 4] 3121         CALL     QBRAN
      0090E0 90 E5                 3122         .word      PARS5
      0090E2 CD 86 67         [ 4] 3123         CALL     ZLESS
      0090E5 CD 85 24         [ 4] 3124 PARS5:  CALL     QBRAN
      0090E8 90 FA                 3125         .word      PARS6
      0090EA CD 8B 7B         [ 4] 3126         CALL     ONEP
      0090ED CD 85 05         [ 4] 3127         CALL     DONXT
      0090F0 90 C2                 3128         .word      PARS4
      0090F2 CD 86 2E         [ 4] 3129         CALL     DUPP
      0090F5 CD 85 F7         [ 4] 3130         CALL     TOR
      0090F8 20 0F            [ 2] 3131         JRA     PARS7
      0090FA CD 85 D8         [ 4] 3132 PARS6:  CALL     RFROM
      0090FD CD 86 24         [ 4] 3133         CALL     DROP
      009100 CD 86 2E         [ 4] 3134         CALL     DUPP
      009103 CD 8B 7B         [ 4] 3135         CALL     ONEP
      009106 CD 85 F7         [ 4] 3136         CALL     TOR
      009109 CD 86 58         [ 4] 3137 PARS7:  CALL     OVER
      00910C CD 88 D6         [ 4] 3138         CALL     SUBB
      00910F CD 85 D8         [ 4] 3139         CALL     RFROM
      009112 CD 85 D8         [ 4] 3140         CALL     RFROM
      009115 CC 88 D6         [ 2] 3141         JP     SUBB
      009118 CD 86 58         [ 4] 3142 PARS8:  CALL     OVER
      00911B CD 85 D8         [ 4] 3143         CALL     RFROM
      00911E CC 88 D6         [ 2] 3144         JP     SUBB
                                   3145 
                                   3146 ;       PARSE   ( c -- b u ; <string> )
                                   3147 ;       Scan input stream and return
                                   3148 ;       counted string delimited by c.
      009121 90 5A                 3149         .word      LINK
                           0010A3  3150 LINK = . 
      009123 05                    3151         .byte      5
      009124 50 41 52 53 45        3152         .ascii     "PARSE"
      009129                       3153 PARSE:
      009129 CD 85 F7         [ 4] 3154         CALL     TOR
      00912C CD 8C F7         [ 4] 3155         CALL     TIB
      00912F CD 87 1C         [ 4] 3156         CALL     INN
      009132 CD 85 87         [ 4] 3157         CALL     AT
      009135 CD 88 5D         [ 4] 3158         CALL     PLUS    ;current input buffer pointer
      009138 CD 87 2C         [ 4] 3159         CALL     NTIB
      00913B CD 85 87         [ 4] 3160         CALL     AT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      00913E CD 87 1C         [ 4] 3161         CALL     INN
      009141 CD 85 87         [ 4] 3162         CALL     AT
      009144 CD 88 D6         [ 4] 3163         CALL     SUBB    ;remaining count
      009147 CD 85 D8         [ 4] 3164         CALL     RFROM
      00914A CD 90 60         [ 4] 3165         CALL     PARS
      00914D CD 87 1C         [ 4] 3166         CALL     INN
      009150 CC 8C 57         [ 2] 3167         JP     PSTOR
                                   3168 
                                   3169 ;       .(      ( -- )
                                   3170 ;       Output following string up to next ) .
      009153 91 23                 3171         .word      LINK
                           0010D5  3172 LINK = . 
      009155 82                    3173 	.byte      IMEDD+2
      009156 2E 28                 3174         .ascii     ".("
      009158                       3175 DOTPR:
      009158 CD 84 F1         [ 4] 3176         CALL     DOLIT
      00915B 00 29                 3177         .word     41	; ")"
      00915D CD 91 29         [ 4] 3178         CALL     PARSE
      009160 CC 8F 58         [ 2] 3179         JP     TYPES
                                   3180 
                                   3181 ;       (       ( -- )
                                   3182 ;       Ignore following string up to next ).
                                   3183 ;       A comment.
      009163 91 55                 3184         .word      LINK
                           0010E5  3185 LINK = . 
      009165 81                    3186 	.byte      IMEDD+1
      009166 28                    3187         .ascii     "("
      009167                       3188 PAREN:
      009167 CD 84 F1         [ 4] 3189         CALL     DOLIT
      00916A 00 29                 3190         .word     41	; ")"
      00916C CD 91 29         [ 4] 3191         CALL     PARSE
      00916F CC 88 3D         [ 2] 3192         JP     DDROP
                                   3193 
                                   3194 ;       \       ( -- )
                                   3195 ;       Ignore following text till
                                   3196 ;       end of line.
      009172 91 65                 3197         .word      LINK
                           0010F4  3198 LINK = . 
      009174 81                    3199 	.byte      IMEDD+1
      009175 5C                    3200         .ascii     "\"
      009176                       3201 BKSLA:
      009176 90 AE 00 0E      [ 2] 3202         ldw y,#UCTIB ; #TIB  
      00917A 90 FE            [ 2] 3203         ldw y,(y)
      00917C 90 89            [ 2] 3204         pushw y ; count in TIB 
      00917E 90 AE 00 0C      [ 2] 3205         ldw y,#UINN ; >IN 
      009182 90 BF 26         [ 2] 3206         ldw YTEMP,y
      009185 90 85            [ 2] 3207         popw y 
      009187 91 CF 26         [ 5] 3208         ldw [YTEMP],y
      00918A 81               [ 4] 3209         ret 
                                   3210 
                                   3211 ;       WORD    ( c -- a ; <string> )
                                   3212 ;       Parse a word from input stream
                                   3213 ;       and copy it to code dictionary.
      00918B 91 74                 3214         .word      LINK
                           00110D  3215 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      00918D 04                    3216         .byte      4
      00918E 57 4F 52 44           3217         .ascii     "WORD"
      009192                       3218 WORDD:
      009192 CD 91 29         [ 4] 3219         CALL     PARSE
      009195 CD 8C D5         [ 4] 3220         CALL     HERE
      009198 CD 8B 50         [ 4] 3221         CALL     CELLP
                           000000  3222 .IF CASE_SENSE 
                                   3223         JP      PACKS 
                           000001  3224 .ELSE                 
      00919B CD 8D 95         [ 4] 3225         CALL     PACKS
                                   3226 ; uppercase TOKEN 
      00919E CD 86 2E         [ 4] 3227         CALL    DUPP 
      0091A1 CD 8C BE         [ 4] 3228         CALL    COUNT 
      0091A4 CD 85 F7         [ 4] 3229         CALL    TOR 
      0091A7 CD 85 53         [ 4] 3230         CALL    BRAN 
      0091AA 91 D8                 3231         .word   UPPER2  
      0091AC                       3232 UPPER:
      0091AC CD 86 2E         [ 4] 3233         CALL    DUPP 
      0091AF CD 85 A5         [ 4] 3234         CALL    CAT
      0091B2 CD 86 2E         [ 4] 3235         CALL    DUPP 
      0091B5 CD 84 F1         [ 4] 3236         CALL   DOLIT
      0091B8 00 61                 3237         .word   'a' 
      0091BA CD 84 F1         [ 4] 3238         CALL    DOLIT
      0091BD 00 7B                 3239         .word   'z'+1 
      0091BF CD 89 D6         [ 4] 3240         CALL   WITHI 
      0091C2 CD 85 24         [ 4] 3241         CALL   QBRAN
      0091C5 91 CF                 3242         .word  UPPER1  
      0091C7 CD 84 F1         [ 4] 3243         CALL    DOLIT 
      0091CA 00 DF                 3244         .word   0xDF 
      0091CC CD 86 8D         [ 4] 3245         CALL    ANDD 
      0091CF                       3246 UPPER1:
      0091CF CD 86 58         [ 4] 3247         CALL    OVER 
      0091D2 CD 85 94         [ 4] 3248         CALL    CSTOR          
      0091D5 CD 8B 7B         [ 4] 3249         CALL    ONEP 
      0091D8                       3250 UPPER2: 
      0091D8 CD 85 05         [ 4] 3251         CALL    DONXT
      0091DB 91 AC                 3252         .word   UPPER  
      0091DD CD 86 24         [ 4] 3253         CALL    DROP  
      0091E0 81               [ 4] 3254         RET 
                                   3255 .ENDIF 
                                   3256 
                                   3257 ;       TOKEN   ( -- a ; <string> )
                                   3258 ;       Parse a word from input stream
                                   3259 ;       and copy it to name dictionary.
      0091E1 91 8D                 3260         .word      LINK
                           001163  3261 LINK = . 
      0091E3 05                    3262         .byte      5
      0091E4 54 4F 4B 45 4E        3263         .ascii     "TOKEN"
      0091E9                       3264 TOKEN:
      0091E9 CD 8B DA         [ 4] 3265         CALL     BLANK
      0091EC CC 91 92         [ 2] 3266         JP     WORDD
                                   3267 
                                   3268 ;; Dictionary search
                                   3269 
                                   3270 ;       NAME>   ( na -- ca )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                   3271 ;       Return a code address given
                                   3272 ;       a name address.
      0091EF 91 E3                 3273         .word      LINK
                           001171  3274 LINK = . 
      0091F1 05                    3275         .byte      5
      0091F2 4E 41 4D 45 3E        3276         .ascii     "NAME>"
      0091F7                       3277 NAMET:
      0091F7 CD 8C BE         [ 4] 3278         CALL     COUNT
      0091FA CD 84 F1         [ 4] 3279         CALL     DOLIT
      0091FD 00 1F                 3280         .word      31
      0091FF CD 86 8D         [ 4] 3281         CALL     ANDD
      009202 CC 88 5D         [ 2] 3282         JP     PLUS
                                   3283 
                                   3284 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   3285 ;       Compare u cells in two
                                   3286 ;       strings. Return 0 if identical.
      009205 91 F1                 3287         .word      LINK
                           001187  3288 LINK = . 
      009207 05                    3289         .byte       5
      009208 53 41 4D 45 3F        3290         .ascii     "SAME?"
      00920D                       3291 SAMEQ:
      00920D CD 8B 88         [ 4] 3292         CALL     ONEM
      009210 CD 85 F7         [ 4] 3293         CALL     TOR
      009213 20 29            [ 2] 3294         JRA     SAME2
      009215 CD 86 58         [ 4] 3295 SAME1:  CALL     OVER
      009218 CD 85 EB         [ 4] 3296         CALL     RAT
      00921B CD 88 5D         [ 4] 3297         CALL     PLUS
      00921E CD 85 A5         [ 4] 3298         CALL     CAT
      009221 CD 86 58         [ 4] 3299         CALL     OVER
      009224 CD 85 EB         [ 4] 3300         CALL     RAT
      009227 CD 88 5D         [ 4] 3301         CALL     PLUS
      00922A CD 85 A5         [ 4] 3302         CALL     CAT
      00922D CD 88 D6         [ 4] 3303         CALL     SUBB
      009230 CD 87 EB         [ 4] 3304         CALL     QDUP
      009233 CD 85 24         [ 4] 3305         CALL     QBRAN
      009236 92 3E                 3306         .word      SAME2
      009238 CD 85 D8         [ 4] 3307         CALL     RFROM
      00923B CC 86 24         [ 2] 3308         JP     DROP
      00923E CD 85 05         [ 4] 3309 SAME2:  CALL     DONXT
      009241 92 15                 3310         .word      SAME1
      009243 CC 8B E7         [ 2] 3311         JP     ZERO
                                   3312 
                                   3313 ;       find    ( a va -- ca na | a F )
                                   3314 ;       Search vocabulary for string.
                                   3315 ;       Return ca and na if succeeded.
      009246 92 07                 3316         .word      LINK
                           0011C8  3317 LINK = . 
      009248 04                    3318         .byte      4
      009249 46 49 4E 44           3319         .ascii     "FIND"
      00924D                       3320 FIND:
      00924D CD 86 3E         [ 4] 3321         CALL     SWAPP
      009250 CD 86 2E         [ 4] 3322         CALL     DUPP
      009253 CD 85 A5         [ 4] 3323         CALL     CAT
      009256 CD 87 0D         [ 4] 3324         CALL     TEMP
      009259 CD 85 70         [ 4] 3325         CALL     STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      00925C CD 86 2E         [ 4] 3326         CALL     DUPP
      00925F CD 85 87         [ 4] 3327         CALL     AT
      009262 CD 85 F7         [ 4] 3328         CALL     TOR
      009265 CD 8B 50         [ 4] 3329         CALL     CELLP
      009268 CD 86 3E         [ 4] 3330         CALL     SWAPP
      00926B CD 85 87         [ 4] 3331 FIND1:  CALL     AT
      00926E CD 86 2E         [ 4] 3332         CALL     DUPP
      009271 CD 85 24         [ 4] 3333         CALL     QBRAN
      009274 92 AA                 3334         .word      FIND6
      009276 CD 86 2E         [ 4] 3335         CALL     DUPP
      009279 CD 85 87         [ 4] 3336         CALL     AT
      00927C CD 84 F1         [ 4] 3337         CALL     DOLIT
      00927F 1F 7F                 3338         .word      MASKK
      009281 CD 86 8D         [ 4] 3339         CALL     ANDD
      009284 CD 85 EB         [ 4] 3340         CALL     RAT
      009287 CD 86 B6         [ 4] 3341         CALL     XORR
      00928A CD 85 24         [ 4] 3342         CALL     QBRAN
      00928D 92 99                 3343         .word      FIND2
      00928F CD 8B 50         [ 4] 3344         CALL     CELLP
      009292 CD 84 F1         [ 4] 3345         CALL     DOLIT
      009295 FF FF                 3346         .word     0xFFFF
      009297 20 0C            [ 2] 3347         JRA     FIND3
      009299 CD 8B 50         [ 4] 3348 FIND2:  CALL     CELLP
      00929C CD 87 0D         [ 4] 3349         CALL     TEMP
      00929F CD 85 87         [ 4] 3350         CALL     AT
      0092A2 CD 92 0D         [ 4] 3351         CALL     SAMEQ
      0092A5 CD 85 53         [ 4] 3352 FIND3:  CALL     BRAN
      0092A8 92 B9                 3353         .word      FIND4
      0092AA CD 85 D8         [ 4] 3354 FIND6:  CALL     RFROM
      0092AD CD 86 24         [ 4] 3355         CALL     DROP
      0092B0 CD 86 3E         [ 4] 3356         CALL     SWAPP
      0092B3 CD 8B 5F         [ 4] 3357         CALL     CELLM
      0092B6 CC 86 3E         [ 2] 3358         JP     SWAPP
      0092B9 CD 85 24         [ 4] 3359 FIND4:  CALL     QBRAN
      0092BC 92 C6                 3360         .word      FIND5
      0092BE CD 8B 5F         [ 4] 3361         CALL     CELLM
      0092C1 CD 8B 5F         [ 4] 3362         CALL     CELLM
      0092C4 20 A5            [ 2] 3363         JRA     FIND1
      0092C6 CD 85 D8         [ 4] 3364 FIND5:  CALL     RFROM
      0092C9 CD 86 24         [ 4] 3365         CALL     DROP
      0092CC CD 86 3E         [ 4] 3366         CALL     SWAPP
      0092CF CD 86 24         [ 4] 3367         CALL     DROP
      0092D2 CD 8B 5F         [ 4] 3368         CALL     CELLM
      0092D5 CD 86 2E         [ 4] 3369         CALL     DUPP
      0092D8 CD 91 F7         [ 4] 3370         CALL     NAMET
      0092DB CC 86 3E         [ 2] 3371         JP     SWAPP
                                   3372 
                                   3373 ;       NAME?   ( a -- ca na | a F )
                                   3374 ;       Search vocabularies for a string.
      0092DE 92 48                 3375         .word      LINK
                           001260  3376 LINK = . 
      0092E0 05                    3377         .byte      5
      0092E1 4E 41 4D 45 3F        3378         .ascii     "NAME?"
      0092E6                       3379 NAMEQ:
      0092E6 CD 87 81         [ 4] 3380         CALL   CNTXT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0092E9 CC 92 4D         [ 2] 3381         JP     FIND
                                   3382 
                                   3383 ;; Terminal response
                                   3384 
                                   3385 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3386 ;       Backup cursor by one character.
      0092EC 92 E0                 3387         .word      LINK
                           00126E  3388 LINK = . 
      0092EE 02                    3389         .byte      2
      0092EF 5E 48                 3390         .ascii     "^H"
      0092F1                       3391 BKSP:
      0092F1 CD 85 F7         [ 4] 3392         CALL     TOR
      0092F4 CD 86 58         [ 4] 3393         CALL     OVER
      0092F7 CD 85 D8         [ 4] 3394         CALL     RFROM
      0092FA CD 86 3E         [ 4] 3395         CALL     SWAPP
      0092FD CD 86 58         [ 4] 3396         CALL     OVER
      009300 CD 86 B6         [ 4] 3397         CALL     XORR
      009303 CD 85 24         [ 4] 3398         CALL     QBRAN
      009306 93 21                 3399         .word      BACK1
      009308 CD 84 F1         [ 4] 3400         CALL     DOLIT
      00930B 00 08                 3401         .word      BKSPP
      00930D CD 84 B6         [ 4] 3402         CALL     EMIT
      009310 CD 8B 88         [ 4] 3403         CALL     ONEM
      009313 CD 8B DA         [ 4] 3404         CALL     BLANK
      009316 CD 84 B6         [ 4] 3405         CALL     EMIT
      009319 CD 84 F1         [ 4] 3406         CALL     DOLIT
      00931C 00 08                 3407         .word      BKSPP
      00931E CC 84 B6         [ 2] 3408         JP     EMIT
      009321 81               [ 4] 3409 BACK1:  RET
                                   3410 
                                   3411 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3412 ;       Accept and echo key stroke
                                   3413 ;       and bump cursor.
      009322 92 EE                 3414         .word      LINK
                           0012A4  3415 LINK = . 
      009324 03                    3416         .byte      3
      009325 54 41 50              3417         .ascii     "TAP"
      009328                       3418 TAP:
      009328 CD 86 2E         [ 4] 3419         CALL     DUPP
      00932B CD 84 B6         [ 4] 3420         CALL     EMIT
      00932E CD 86 58         [ 4] 3421         CALL     OVER
      009331 CD 85 94         [ 4] 3422         CALL     CSTOR
      009334 CC 8B 7B         [ 2] 3423         JP     ONEP
                                   3424 
                                   3425 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3426 ;       Process a key stroke,
                                   3427 ;       CR,LF or backspace.
      009337 93 24                 3428         .word      LINK
                           0012B9  3429 LINK = . 
      009339 04                    3430         .byte      4
      00933A 4B 54 41 50           3431         .ascii     "KTAP"
      00933E                       3432 KTAP:
      00933E CD 86 2E         [ 4] 3433         CALL     DUPP
      009341 CD 84 F1         [ 4] 3434         CALL     DOLIT
                           000001  3435 .if EOL_CR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      009344 00 0D                 3436         .word   CRR
                           000000  3437 .else ; EOL_LF 
                                   3438         .word   LF
                                   3439 .endif 
      009346 CD 86 B6         [ 4] 3440         CALL     XORR
      009349 CD 85 24         [ 4] 3441         CALL     QBRAN
      00934C 93 64                 3442         .word      KTAP2
      00934E CD 84 F1         [ 4] 3443         CALL     DOLIT
      009351 00 08                 3444         .word      BKSPP
      009353 CD 86 B6         [ 4] 3445         CALL     XORR
      009356 CD 85 24         [ 4] 3446         CALL     QBRAN
      009359 93 61                 3447         .word      KTAP1
      00935B CD 8B DA         [ 4] 3448         CALL     BLANK
      00935E CC 93 28         [ 2] 3449         JP     TAP
      009361 CC 92 F1         [ 2] 3450 KTAP1:  JP     BKSP
      009364 CD 86 24         [ 4] 3451 KTAP2:  CALL     DROP
      009367 CD 86 3E         [ 4] 3452         CALL     SWAPP
      00936A CD 86 24         [ 4] 3453         CALL     DROP
      00936D CC 86 2E         [ 2] 3454         JP     DUPP
                                   3455 
                                   3456 ;       accept  ( b u -- b u )
                                   3457 ;       Accept characters to input
                                   3458 ;       buffer. Return with actual count.
      009370 93 39                 3459         .word      LINK
                           0012F2  3460 LINK = . 
      009372 06                    3461         .byte      6
      009373 41 43 43 45 50 54     3462         .ascii     "ACCEPT"
      009379                       3463 ACCEP:
      009379 CD 86 58         [ 4] 3464         CALL     OVER
      00937C CD 88 5D         [ 4] 3465         CALL     PLUS
      00937F CD 86 58         [ 4] 3466         CALL     OVER
      009382 CD 88 48         [ 4] 3467 ACCP1:  CALL     DDUP
      009385 CD 86 B6         [ 4] 3468         CALL     XORR
      009388 CD 85 24         [ 4] 3469         CALL     QBRAN
      00938B 93 AD                 3470         .word      ACCP4
      00938D CD 8E F6         [ 4] 3471         CALL     KEY
      009390 CD 86 2E         [ 4] 3472         CALL     DUPP
      009393 CD 8B DA         [ 4] 3473         CALL     BLANK
      009396 CD 84 F1         [ 4] 3474         CALL     DOLIT
      009399 00 7F                 3475         .word      127
      00939B CD 89 D6         [ 4] 3476         CALL     WITHI
      00939E CD 85 24         [ 4] 3477         CALL     QBRAN
      0093A1 93 A8                 3478         .word      ACCP2
      0093A3 CD 93 28         [ 4] 3479         CALL     TAP
      0093A6 20 03            [ 2] 3480         JRA     ACCP3
      0093A8 CD 93 3E         [ 4] 3481 ACCP2:  CALL     KTAP
      0093AB 20 D5            [ 2] 3482 ACCP3:  JRA     ACCP1
      0093AD CD 86 24         [ 4] 3483 ACCP4:  CALL     DROP
      0093B0 CD 86 58         [ 4] 3484         CALL     OVER
      0093B3 CC 88 D6         [ 2] 3485         JP     SUBB
                                   3486 
                                   3487 ;       QUERY   ( -- )
                                   3488 ;       Accept input stream to
                                   3489 ;       terminal input buffer.
      0093B6 93 72                 3490         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



                                   3491         
                           001338  3492 LINK = . 
      0093B8 05                    3493         .byte      5
      0093B9 51 55 45 52 59        3494         .ascii     "QUERY"
      0093BE                       3495 QUERY:
      0093BE CD 8C F7         [ 4] 3496         CALL     TIB
      0093C1 CD 84 F1         [ 4] 3497         CALL     DOLIT
      0093C4 00 50                 3498         .word      80
      0093C6 CD 93 79         [ 4] 3499         CALL     ACCEP
      0093C9 CD 87 2C         [ 4] 3500         CALL     NTIB
      0093CC CD 85 70         [ 4] 3501         CALL     STORE
      0093CF CD 86 24         [ 4] 3502         CALL     DROP
      0093D2 CD 8B E7         [ 4] 3503         CALL     ZERO
      0093D5 CD 87 1C         [ 4] 3504         CALL     INN
      0093D8 CC 85 70         [ 2] 3505         JP     STORE
                                   3506 
                                   3507 ;       ABORT   ( -- )
                                   3508 ;       Reset data stack and
                                   3509 ;       jump to QUIT.
      0093DB 93 B8                 3510         .word      LINK
                           00135D  3511 LINK = . 
      0093DD 05                    3512         .byte      5
      0093DE 41 42 4F 52 54        3513         .ascii     "ABORT"
      0093E3                       3514 ABORT:
      0093E3 CD 94 DA         [ 4] 3515         CALL     PRESE
      0093E6 CC 94 F7         [ 2] 3516         JP     QUIT
                                   3517 
                                   3518 ;       abort"  ( f -- )
                                   3519 ;       Run time routine of ABORT".
                                   3520 ;       Abort with a message.
      0093E9 93 DD                 3521         .word      LINK
                           00136B  3522 LINK = . 
      0093EB 46                    3523 	.byte      COMPO+6
      0093EC 41 42 4F 52 54        3524         .ascii     "ABORT"
      0093F1 22                    3525         .byte      '"'
      0093F2                       3526 ABORQ:
      0093F2 CD 85 24         [ 4] 3527         CALL     QBRAN
      0093F5 94 11                 3528         .word      ABOR2   ;text flag
      0093F7 CD 8F 8C         [ 4] 3529         CALL     DOSTR
      0093FA CD 8F 2E         [ 4] 3530 ABOR1:  CALL     SPACE
      0093FD CD 8C BE         [ 4] 3531         CALL     COUNT
      009400 CD 8F 58         [ 4] 3532         CALL     TYPES
      009403 CD 84 F1         [ 4] 3533         CALL     DOLIT
      009406 00 3F                 3534         .word     63 ; "?"
      009408 CD 84 B6         [ 4] 3535         CALL     EMIT
      00940B CD 8F 76         [ 4] 3536         CALL     CR
      00940E CC 93 E3         [ 2] 3537         JP     ABORT   ;pass error string
      009411 CD 8F 8C         [ 4] 3538 ABOR2:  CALL     DOSTR
      009414 CC 86 24         [ 2] 3539         JP     DROP
                                   3540 
                                   3541 ;; The text interpreter
                                   3542 
                                   3543 ;       $INTERPRET      ( a -- )
                                   3544 ;       Interpret a word. If failed,
                                   3545 ;       try to convert it to an integer.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009417 93 EB                 3546         .word      LINK
                           001399  3547 LINK = . 
      009419 0A                    3548         .byte      10
      00941A 24 49 4E 54 45 52 50  3549         .ascii     "$INTERPRET"
             52 45 54
      009424                       3550 INTER:
      009424 CD 92 E6         [ 4] 3551         CALL     NAMEQ
      009427 CD 87 EB         [ 4] 3552         CALL     QDUP    ;?defined
      00942A CD 85 24         [ 4] 3553         CALL     QBRAN
      00942D 94 4E                 3554         .word      INTE1
      00942F CD 85 87         [ 4] 3555         CALL     AT
      009432 CD 84 F1         [ 4] 3556         CALL     DOLIT
      009435 40 00                 3557 	.word       0x4000	; COMPO*256
      009437 CD 86 8D         [ 4] 3558         CALL     ANDD    ;?compile only lexicon bits
      00943A CD 93 F2         [ 4] 3559         CALL     ABORQ
      00943D 0D                    3560         .byte      13
      00943E 20 63 6F 6D 70 69 6C  3561         .ascii     " compile only"
             65 20 6F 6E 6C 79
      00944B CC 85 63         [ 2] 3562         JP     EXECU
      00944E CD A4 EE         [ 4] 3563 INTE1:  CALL     NUMBQ   ;convert a number
      009451 CD 85 24         [ 4] 3564         CALL     QBRAN
      009454 93 FA                 3565         .word    ABOR1
      009456 81               [ 4] 3566         RET
                                   3567 
                                   3568 ;       [       ( -- )
                                   3569 ;       Start  text interpreter.
      009457 94 19                 3570         .word      LINK
                           0013D9  3571 LINK = . 
      009459 81                    3572 	.byte      IMEDD+1
      00945A 5B                    3573         .ascii     "["
      00945B                       3574 LBRAC:
      00945B CD 84 F1         [ 4] 3575         CALL   DOLIT
      00945E 94 24                 3576         .word  INTER
      009460 CD 87 5F         [ 4] 3577         CALL   TEVAL
      009463 CC 85 70         [ 2] 3578         JP     STORE
                                   3579 
                                   3580 ;       .OK     ( -- )
                                   3581 ;       Display 'ok' while interpreting.
      009466 94 59                 3582         .word      LINK
                           0013E8  3583 LINK = . 
      009468 03                    3584         .byte      3
      009469 2E 4F 4B              3585         .ascii     ".OK"
      00946C                       3586 DOTOK:
      00946C CD 84 F1         [ 4] 3587         CALL     DOLIT
      00946F 94 24                 3588         .word      INTER
      009471 CD 87 5F         [ 4] 3589         CALL     TEVAL
      009474 CD 85 87         [ 4] 3590         CALL     AT
      009477 CD 88 FE         [ 4] 3591         CALL     EQUAL
      00947A CD 85 24         [ 4] 3592         CALL     QBRAN
      00947D 94 86                 3593         .word      DOTO1
      00947F CD 8F B5         [ 4] 3594         CALL     DOTQP
      009482 03                    3595         .byte      3
      009483 20 6F 6B              3596         .ascii     " ok"
      009486 CC 8F 76         [ 2] 3597 DOTO1:  JP     CR
                                   3598 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                                   3599 ;       ?STACK  ( -- )
                                   3600 ;       Abort if stack underflows.
      009489 94 68                 3601         .word      LINK
                           00140B  3602 LINK = . 
      00948B 06                    3603         .byte      6
      00948C 3F 53 54 41 43 4B     3604         .ascii     "?STACK"
      009492                       3605 QSTAC: 
      009492 CD 8C 29         [ 4] 3606         CALL     DEPTH
      009495 CD 86 67         [ 4] 3607         CALL     ZLESS   ;check only for underflow
      009498 CD 93 F2         [ 4] 3608         CALL     ABORQ
      00949B 0B                    3609         .byte      11
      00949C 20 75 6E 64 65 72 66  3610         .ascii     " underflow "
             6C 6F 77 20
      0094A7 81               [ 4] 3611         RET
                                   3612 
                                   3613 ;       EVAL    ( -- )
                                   3614 ;       Interpret  input stream.
      0094A8 94 8B                 3615         .word      LINK
                           00142A  3616 LINK = . 
      0094AA 04                    3617         .byte      4
      0094AB 45 56 41 4C           3618         .ascii     "EVAL"
      0094AF                       3619 EVAL:
      0094AF CD 91 E9         [ 4] 3620 EVAL1:  CALL     TOKEN
      0094B2 CD 86 2E         [ 4] 3621         CALL     DUPP
      0094B5 CD 85 A5         [ 4] 3622         CALL     CAT     ;?input stream empty
      0094B8 CD 85 24         [ 4] 3623         CALL     QBRAN
      0094BB 94 CB                 3624         .word    EVAL2
      0094BD CD 87 5F         [ 4] 3625         CALL     TEVAL
      0094C0 CD 8D 0B         [ 4] 3626         CALL     ATEXE
      0094C3 CD 94 92         [ 4] 3627         CALL     QSTAC   ;evaluate input, check stack
      0094C6 CD 85 53         [ 4] 3628         CALL     BRAN
      0094C9 94 AF                 3629         .word    EVAL1
      0094CB CD 86 24         [ 4] 3630 EVAL2:  CALL     DROP
      0094CE CC 94 6C         [ 2] 3631         JP       DOTOK
                                   3632 
                                   3633 ;       PRESET  ( -- )
                                   3634 ;       Reset data stack pointer and
                                   3635 ;       terminal input buffer.
      0094D1 94 AA                 3636         .word      LINK
                           001453  3637 LINK = . 
      0094D3 06                    3638         .byte      6
      0094D4 50 52 45 53 45 54     3639         .ascii     "PRESET"
      0094DA                       3640 PRESE:
      0094DA CD 84 F1         [ 4] 3641         CALL     DOLIT
      0094DD 16 80                 3642         .word      SPP
      0094DF CD 86 1B         [ 4] 3643         CALL     SPSTO
      0094E2 CD 84 F1         [ 4] 3644         CALL     DOLIT
      0094E5 17 00                 3645         .word      TIBB
      0094E7 CD 87 2C         [ 4] 3646         CALL     NTIB
      0094EA CD 8B 50         [ 4] 3647         CALL     CELLP
      0094ED CC 85 70         [ 2] 3648         JP     STORE
                                   3649 
                                   3650 ;       QUIT    ( -- )
                                   3651 ;       Reset return stack pointer
                                   3652 ;       and start text interpreter.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0094F0 94 D3                 3653         .word      LINK
                           001472  3654 LINK = . 
      0094F2 04                    3655         .byte      4
      0094F3 51 55 49 54           3656         .ascii     "QUIT"
      0094F7                       3657 QUIT:
      0094F7 CD 84 F1         [ 4] 3658         CALL     DOLIT
      0094FA 17 FF                 3659         .word      RPP
      0094FC CD 85 C2         [ 4] 3660         CALL     RPSTO   ;reset return stack pointer
      0094FF CD 94 5B         [ 4] 3661 QUIT1:  CALL     LBRAC   ;start interpretation
      009502 CD 93 BE         [ 4] 3662 QUIT2:  CALL     QUERY   ;get input
      009505 CD 94 AF         [ 4] 3663         CALL     EVAL
      009508 20 F8            [ 2] 3664         JRA     QUIT2   ;continue till error
                                   3665 
                                   3666 ;; The compiler
                                   3667 
                                   3668 ;       '       ( -- ca )
                                   3669 ;       Search vocabularies for
                                   3670 ;       next word in input stream.
      00950A 94 F2                 3671         .word      LINK
                           00148C  3672 LINK = . 
      00950C 01                    3673         .byte      1
      00950D 27                    3674         .ascii     "'"
      00950E                       3675 TICK:
      00950E CD 91 E9         [ 4] 3676         CALL     TOKEN
      009511 CD 92 E6         [ 4] 3677         CALL     NAMEQ   ;?defined
      009514 CD 85 24         [ 4] 3678         CALL     QBRAN
      009517 93 FA                 3679         .word      ABOR1
      009519 81               [ 4] 3680         RET     ;yes, push code address
                                   3681 
                                   3682 ;       ALLOT   ( n -- )
                                   3683 ;       Allocate n bytes to RAM 
      00951A 95 0C                 3684         .word      LINK
                           00149C  3685         LINK = . 
      00951C 05                    3686         .byte      5
      00951D 41 4C 4C 4F 54        3687         .ascii     "ALLOT"
      009522                       3688 ALLOT:
      009522 CD 87 8F         [ 4] 3689         CALL     VPP
                                   3690 ; must update APP_VP each time VP is modidied
      009525 CD 8C 57         [ 4] 3691         call PSTOR 
      009528 CC 9C 6B         [ 2] 3692         jp UPDATVP 
                                   3693 
                                   3694 ;       ,       ( w -- )
                                   3695 ;         Compile an integer into
                                   3696 ;         variable space.
      00952B 95 1C                 3697         .word      LINK
                           0014AD  3698 LINK = . 
      00952D 01                    3699         .byte      1
      00952E 2C                    3700         .ascii     ","
      00952F                       3701 COMMA:
      00952F CD 8C D5         [ 4] 3702         CALL     HERE
      009532 CD 86 2E         [ 4] 3703         CALL     DUPP
      009535 CD 8B 50         [ 4] 3704         CALL     CELLP   ;cell boundary
      009538 CD 87 8F         [ 4] 3705         CALL     VPP
      00953B CD 85 70         [ 4] 3706         CALL     STORE
      00953E CC 85 70         [ 2] 3707         JP     STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



                                   3708 
                                   3709 ;       C,      ( c -- )
                                   3710 ;       Compile a byte into
                                   3711 ;       variables space.
      009541 95 2D                 3712        .word      LINK
                           0014C3  3713 LINK = . 
      009543 02                    3714         .byte      2
      009544 43 2C                 3715         .ascii     "C,"
      009546                       3716 CCOMMA:
      009546 CD 8C D5         [ 4] 3717         CALL     HERE
      009549 CD 86 2E         [ 4] 3718         CALL     DUPP
      00954C CD 8B 7B         [ 4] 3719         CALL     ONEP
      00954F CD 87 8F         [ 4] 3720         CALL     VPP
      009552 CD 85 70         [ 4] 3721         CALL     STORE
      009555 CC 85 94         [ 2] 3722         JP     CSTOR
                                   3723 
                                   3724 ;       [COMPILE]       ( -- ; <string> )
                                   3725 ;       Compile next immediate
                                   3726 ;       word into code dictionary.
      009558 95 43                 3727         .word      LINK
                           0014DA  3728 LINK = . 
      00955A 89                    3729 	.byte      IMEDD+9
      00955B 5B 43 4F 4D 50 49 4C  3730         .ascii     "[COMPILE]"
             45 5D
      009564                       3731 BCOMP:
      009564 CD 95 0E         [ 4] 3732         CALL     TICK
      009567 CC 98 3A         [ 2] 3733         JP     JSRC
                                   3734 
                                   3735 ;       COMPILE ( -- )
                                   3736 ;       Compile next jsr in
                                   3737 ;       colon list to code dictionary.
      00956A 95 5A                 3738         .word      LINK
                           0014EC  3739 LINK = . 
      00956C 47                    3740 	.byte      COMPO+7
      00956D 43 4F 4D 50 49 4C 45  3741         .ascii     "COMPILE"
      009574                       3742 COMPI:
      009574 CD 85 D8         [ 4] 3743         CALL     RFROM
      009577 CD 86 2E         [ 4] 3744         CALL     DUPP
      00957A CD 85 87         [ 4] 3745         CALL     AT
      00957D CD 98 3A         [ 4] 3746         CALL     JSRC    ;compile subroutine
      009580 CD 8B 50         [ 4] 3747         CALL     CELLP
      009583 90 93            [ 1] 3748         ldw y,x 
      009585 90 FE            [ 2] 3749         ldw y,(y)
      009587 1C 00 02         [ 2] 3750         addw x,#CELLL 
      00958A 90 FC            [ 2] 3751         jp (y)
                                   3752 
                                   3753 ;       LITERAL ( w -- )
                                   3754 ;       Compile tos to dictionary
                                   3755 ;       as an integer literal.
      00958C 95 6C                 3756         .word      LINK
                           00150E  3757 LINK = . 
      00958E 87                    3758 	.byte      IMEDD+7
      00958F 4C 49 54 45 52 41 4C  3759         .ascii     "LITERAL"
      009596                       3760 LITER:
      009596 CD 95 74         [ 4] 3761         CALL     COMPI
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      009599 84 F1                 3762         .word DOLIT 
      00959B CC 95 2F         [ 2] 3763         JP     COMMA
                                   3764 
                                   3765 ;       $,"     ( -- )
                                   3766 ;       Compile a literal string
                                   3767 ;       up to next " .
      00959E 95 8E                 3768         .word      LINK
                           001520  3769 LINK = . 
      0095A0 03                    3770         .byte      3
      0095A1 24 2C 22              3771         .byte     '$',',','"'
      0095A4                       3772 STRCQ:
      0095A4 CD 84 F1         [ 4] 3773         CALL     DOLIT
      0095A7 00 22                 3774         .word     34	; "
      0095A9 CD 91 29         [ 4] 3775         CALL     PARSE
      0095AC CD 8C D5         [ 4] 3776         CALL     HERE
      0095AF CD 8D 95         [ 4] 3777         CALL     PACKS   ;string to code dictionary
      0095B2 CD 8C BE         [ 4] 3778         CALL     COUNT
      0095B5 CD 88 5D         [ 4] 3779         CALL     PLUS    ;calculate aligned end of string
      0095B8 CD 87 8F         [ 4] 3780         CALL     VPP
      0095BB CC 85 70         [ 2] 3781         JP     STORE
                                   3782 
                                   3783 ;; Structures
                                   3784 
                                   3785 ;       FOR     ( -- a )
                                   3786 ;       Start a FOR-NEXT loop
                                   3787 ;       structure in a colon definition.
      0095BE 95 A0                 3788         .word      LINK
                           001540  3789 LINK = . 
      0095C0 83                    3790 	.byte      IMEDD+3
      0095C1 46 4F 52              3791         .ascii     "FOR"
      0095C4                       3792 FOR:
      0095C4 CD 95 74         [ 4] 3793         CALL     COMPI
      0095C7 85 F7                 3794         .word TOR 
      0095C9 CC 8C D5         [ 2] 3795         JP     HERE
                                   3796 
                                   3797 ;       NEXT    ( a -- )
                                   3798 ;       Terminate a FOR-NEXT loop.
      0095CC 95 C0                 3799         .word      LINK
                           00154E  3800 LINK = . 
      0095CE 84                    3801 	.byte      IMEDD+4
      0095CF 4E 45 58 54           3802         .ascii     "NEXT"
      0095D3                       3803 NEXT:
      0095D3 CD 95 74         [ 4] 3804         CALL     COMPI
      0095D6 85 05                 3805         .word DONXT 
      0095D8 CD 87 DB         [ 4] 3806         call ADRADJ
      0095DB CC 95 2F         [ 2] 3807         JP     COMMA
                                   3808 
                                   3809 ;       I ( -- n )
                                   3810 ;       stack FOR-NEXT COUNTER 
      0095DE 95 CE                 3811         .word LINK 
                           001560  3812         LINK=.
      0095E0 01                    3813         .byte 1 
      0095E1 49                    3814         .ascii "I"
      0095E2                       3815 IFETCH: 
      0095E2 1D 00 02         [ 2] 3816         subw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0095E5 16 03            [ 2] 3817         ldw y,(3,sp)
      0095E7 FF               [ 2] 3818         ldw (x),y 
      0095E8 81               [ 4] 3819         ret 
                                   3820 
                                   3821 ;       BEGIN   ( -- a )
                                   3822 ;       Start an infinite or
                                   3823 ;       indefinite loop structure.
      0095E9 95 E0                 3824         .word      LINK
                           00156B  3825 LINK = . 
      0095EB 85                    3826 	.byte      IMEDD+5
      0095EC 42 45 47 49 4E        3827         .ascii     "BEGIN"
      0095F1                       3828 BEGIN:
      0095F1 CC 8C D5         [ 2] 3829         JP     HERE
                                   3830 
                                   3831 ;       UNTIL   ( a -- )
                                   3832 ;       Terminate a BEGIN-UNTIL
                                   3833 ;       indefinite loop structure.
      0095F4 95 EB                 3834         .word      LINK
                           001576  3835 LINK = . 
      0095F6 85                    3836 	.byte      IMEDD+5
      0095F7 55 4E 54 49 4C        3837         .ascii     "UNTIL"
      0095FC                       3838 UNTIL:
      0095FC CD 95 74         [ 4] 3839         CALL     COMPI
      0095FF 85 24                 3840         .word    QBRAN 
      009601 CD 87 DB         [ 4] 3841         call ADRADJ
      009604 CC 95 2F         [ 2] 3842         JP     COMMA
                                   3843 
                                   3844 ;       AGAIN   ( a -- )
                                   3845 ;       Terminate a BEGIN-AGAIN
                                   3846 ;       infinite loop structure.
      009607 95 F6                 3847         .word      LINK
                           001589  3848 LINK = . 
      009609 85                    3849 	.byte      IMEDD+5
      00960A 41 47 41 49 4E        3850         .ascii     "AGAIN"
      00960F                       3851 AGAIN:
      00960F CD 95 74         [ 4] 3852         CALL     COMPI
      009612 85 53                 3853         .word BRAN
      009614 CD 87 DB         [ 4] 3854         call ADRADJ 
      009617 CC 95 2F         [ 2] 3855         JP     COMMA
                                   3856 
                                   3857 ;       IF      ( -- A )
                                   3858 ;       Begin a conditional branch.
      00961A 96 09                 3859         .word      LINK
                           00159C  3860 LINK = . 
      00961C 82                    3861 	.byte      IMEDD+2
      00961D 49 46                 3862         .ascii     "IF"
      00961F                       3863 IFF:
      00961F CD 95 74         [ 4] 3864         CALL     COMPI
      009622 85 24                 3865         .word QBRAN
      009624 CD 8C D5         [ 4] 3866         CALL     HERE
      009627 CD 8B E7         [ 4] 3867         CALL     ZERO
      00962A CC 95 2F         [ 2] 3868         JP     COMMA
                                   3869 
                                   3870 ;       THEN        ( A -- )
                                   3871 ;       Terminate a conditional branch structure.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      00962D 96 1C                 3872         .word      LINK
                           0015AF  3873 LINK = . 
      00962F 84                    3874 	.byte      IMEDD+4
      009630 54 48 45 4E           3875         .ascii     "THEN"
      009634                       3876 THENN:
      009634 CD 8C D5         [ 4] 3877         CALL     HERE
      009637 CD 87 DB         [ 4] 3878         call ADRADJ 
      00963A CD 86 3E         [ 4] 3879         CALL     SWAPP
      00963D CC 85 70         [ 2] 3880         JP     STORE
                                   3881 
                                   3882 ;       ELSE        ( A -- A )
                                   3883 ;       Start the false clause in an IF-ELSE-THEN structure.
      009640 96 2F                 3884         .word      LINK
                           0015C2  3885 LINK = . 
      009642 84                    3886 	.byte      IMEDD+4
      009643 45 4C 53 45           3887         .ascii     "ELSE"
      009647                       3888 ELSEE:
      009647 CD 95 74         [ 4] 3889         CALL     COMPI
      00964A 85 53                 3890         .word BRAN
      00964C CD 8C D5         [ 4] 3891         CALL     HERE
      00964F CD 8B E7         [ 4] 3892         CALL     ZERO
      009652 CD 95 2F         [ 4] 3893         CALL     COMMA
      009655 CD 86 3E         [ 4] 3894         CALL     SWAPP
      009658 CD 8C D5         [ 4] 3895         CALL     HERE
      00965B CD 87 DB         [ 4] 3896         call ADRADJ 
      00965E CD 86 3E         [ 4] 3897         CALL     SWAPP
      009661 CC 85 70         [ 2] 3898         JP     STORE
                                   3899 
                                   3900 ;       AHEAD       ( -- A )
                                   3901 ;       Compile a forward branch instruction.
      009664 96 42                 3902         .word      LINK
                           0015E6  3903 LINK = . 
      009666 85                    3904 	.byte      IMEDD+5
      009667 41 48 45 41 44        3905         .ascii     "AHEAD"
      00966C                       3906 AHEAD:
      00966C CD 95 74         [ 4] 3907         CALL     COMPI
      00966F 85 53                 3908         .word BRAN
      009671 CD 8C D5         [ 4] 3909         CALL     HERE
      009674 CD 8B E7         [ 4] 3910         CALL     ZERO
      009677 CC 95 2F         [ 2] 3911         JP     COMMA
                                   3912 
                                   3913 ;       WHILE       ( a -- A a )
                                   3914 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      00967A 96 66                 3915         .word      LINK
                           0015FC  3916 LINK = . 
      00967C 85                    3917 	.byte      IMEDD+5
      00967D 57 48 49 4C 45        3918         .ascii     "WHILE"
      009682                       3919 WHILE:
      009682 CD 95 74         [ 4] 3920         CALL     COMPI
      009685 85 24                 3921         .word QBRAN
      009687 CD 8C D5         [ 4] 3922         CALL     HERE
      00968A CD 8B E7         [ 4] 3923         CALL     ZERO
      00968D CD 95 2F         [ 4] 3924         CALL     COMMA
      009690 CC 86 3E         [ 2] 3925         JP     SWAPP
                                   3926 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



                                   3927 ;       REPEAT      ( A a -- )
                                   3928 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      009693 96 7C                 3929         .word      LINK
                           001615  3930 LINK = . 
      009695 86                    3931         .byte      IMEDD+6
      009696 52 45 50 45 41 54     3932         .ascii     "REPEAT"
      00969C                       3933 REPEA:
      00969C CD 95 74         [ 4] 3934         CALL     COMPI
      00969F 85 53                 3935         .word BRAN
      0096A1 CD 87 DB         [ 4] 3936         call ADRADJ 
      0096A4 CD 95 2F         [ 4] 3937         CALL     COMMA
      0096A7 CD 8C D5         [ 4] 3938         CALL     HERE
      0096AA CD 87 DB         [ 4] 3939         call ADRADJ 
      0096AD CD 86 3E         [ 4] 3940         CALL     SWAPP
      0096B0 CC 85 70         [ 2] 3941         JP     STORE
                                   3942 
                                   3943 ;       AFT         ( a -- a A )
                                   3944 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      0096B3 96 95                 3945         .word      LINK
                           001635  3946 LINK = . 
      0096B5 83                    3947 	.byte      IMEDD+3
      0096B6 41 46 54              3948         .ascii     "AFT"
      0096B9                       3949 AFT:
      0096B9 CD 86 24         [ 4] 3950         CALL     DROP
      0096BC CD 96 6C         [ 4] 3951         CALL     AHEAD
      0096BF CD 8C D5         [ 4] 3952         CALL     HERE
      0096C2 CC 86 3E         [ 2] 3953         JP     SWAPP
                                   3954 
                                   3955 ;       ABORT"      ( -- ; <string> )
                                   3956 ;       Conditional abort with an error message.
      0096C5 96 B5                 3957         .word      LINK
                           001647  3958 LINK = . 
      0096C7 86                    3959 	.byte      IMEDD+6
      0096C8 41 42 4F 52 54        3960         .ascii     "ABORT"
      0096CD 22                    3961         .byte      '"'
      0096CE                       3962 ABRTQ:
      0096CE CD 95 74         [ 4] 3963         CALL     COMPI
      0096D1 93 F2                 3964         .word ABORQ
      0096D3 CC 95 A4         [ 2] 3965         JP     STRCQ
                                   3966 
                                   3967 ;       $"     ( -- ; <string> )
                                   3968 ;       Compile an inline string literal.
      0096D6 96 C7                 3969         .word      LINK
                           001658  3970 LINK = . 
      0096D8 82                    3971 	.byte      IMEDD+2
      0096D9 24 22                 3972         .byte     '$','"'
      0096DB                       3973 STRQ:
      0096DB CD 95 74         [ 4] 3974         CALL     COMPI
      0096DE 8F AB                 3975         .word STRQP 
      0096E0 CC 95 A4         [ 2] 3976         JP     STRCQ
                                   3977 
                                   3978 ;       ."          ( -- ; <string> )
                                   3979 ;       Compile an inline string literal to be typed out at run time.
      0096E3 96 D8                 3980         .word      LINK
                           001665  3981 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0096E5 82                    3982 	.byte      IMEDD+2
      0096E6 2E 22                 3983         .byte     '.','"'
      0096E8                       3984 DOTQ:
      0096E8 CD 95 74         [ 4] 3985         CALL     COMPI
      0096EB 8F B5                 3986         .word DOTQP 
      0096ED CC 95 A4         [ 2] 3987         JP     STRCQ
                                   3988 
                                   3989 ;; Name compiler
                                   3990 
                                   3991 ;       ?UNIQUE ( a -- a )
                                   3992 ;       Display a warning message
                                   3993 ;       if word already exists.
      0096F0 96 E5                 3994         .word      LINK
                           001672  3995 LINK = . 
      0096F2 07                    3996         .byte      7
      0096F3 3F 55 4E 49 51 55 45  3997         .ascii     "?UNIQUE"
      0096FA                       3998 UNIQU:
      0096FA CD 86 2E         [ 4] 3999         CALL     DUPP
      0096FD CD 92 E6         [ 4] 4000         CALL     NAMEQ   ;?name exists
      009700 CD 85 24         [ 4] 4001         CALL     QBRAN
      009703 97 19                 4002         .word      UNIQ1
      009705 CD 8F B5         [ 4] 4003         CALL     DOTQP   ;redef are OK
      009708 07                    4004         .byte       7
      009709 20 72 65 44 65 66 20  4005         .ascii     " reDef "       
      009710 CD 86 58         [ 4] 4006         CALL     OVER
      009713 CD 8C BE         [ 4] 4007         CALL     COUNT
      009716 CD 8F 58         [ 4] 4008         CALL     TYPES   ;just in case
      009719 CC 86 24         [ 2] 4009 UNIQ1:  JP     DROP
                                   4010 
                                   4011 ;       $,n     ( na -- )
                                   4012 ;       Build a new dictionary name
                                   4013 ;       using string at na.
                                   4014 ; compile dans l'espace des variables 
      00971C 96 F2                 4015         .word      LINK
                           00169E  4016 LINK = . 
      00971E 03                    4017         .byte      3
      00971F 24 2C 6E              4018         .ascii     "$,n"
      009722                       4019 SNAME:
      009722 CD 86 2E         [ 4] 4020         CALL     DUPP
      009725 CD 85 A5         [ 4] 4021         CALL     CAT     ;?null input
      009728 CD 85 24         [ 4] 4022         CALL     QBRAN
      00972B 97 58                 4023         .word      PNAM1
      00972D CD 96 FA         [ 4] 4024         CALL     UNIQU   ;?redefinition
      009730 CD 86 2E         [ 4] 4025         CALL     DUPP
      009733 CD 8C BE         [ 4] 4026         CALL     COUNT
      009736 CD 88 5D         [ 4] 4027         CALL     PLUS
      009739 CD 87 8F         [ 4] 4028         CALL     VPP
      00973C CD 85 70         [ 4] 4029         CALL     STORE
      00973F CD 86 2E         [ 4] 4030         CALL     DUPP
      009742 CD 87 AD         [ 4] 4031         CALL     LAST
      009745 CD 85 70         [ 4] 4032         CALL     STORE   ;save na for vocabulary link
      009748 CD 8B 5F         [ 4] 4033         CALL     CELLM   ;link address
      00974B CD 87 81         [ 4] 4034         CALL     CNTXT
      00974E CD 85 87         [ 4] 4035         CALL     AT
      009751 CD 86 3E         [ 4] 4036         CALL     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      009754 CD 85 70         [ 4] 4037         CALL     STORE
      009757 81               [ 4] 4038         RET     ;save code pointer
      009758 CD 8F AB         [ 4] 4039 PNAM1:  CALL     STRQP
      00975B 05                    4040         .byte      5
      00975C 20 6E 61 6D 65        4041         .ascii     " name" ;null input
      009761 CC 93 FA         [ 2] 4042         JP     ABOR1
                                   4043 
                                   4044 ;; FORTH compiler
                                   4045 
                                   4046 ;       $COMPILE        ( a -- )
                                   4047 ;       Compile next word to
                                   4048 ;       dictionary as a token or literal.
      009764 97 1E                 4049         .word      LINK
                           0016E6  4050 LINK = . 
      009766 08                    4051         .byte      8
      009767 24 43 4F 4D 50 49 4C  4052         .ascii     "$COMPILE"
             45
      00976F                       4053 SCOMP:
      00976F CD 92 E6         [ 4] 4054         CALL     NAMEQ
      009772 CD 87 EB         [ 4] 4055         CALL     QDUP    ;?defined
      009775 CD 85 24         [ 4] 4056         CALL     QBRAN
      009778 97 90                 4057         .word      SCOM2
      00977A CD 85 87         [ 4] 4058         CALL     AT
      00977D CD 84 F1         [ 4] 4059         CALL     DOLIT
      009780 80 00                 4060         .word     0x8000	;  IMEDD*256
      009782 CD 86 8D         [ 4] 4061         CALL     ANDD    ;?immediate
      009785 CD 85 24         [ 4] 4062         CALL     QBRAN
      009788 97 8D                 4063         .word      SCOM1
      00978A CC 85 63         [ 2] 4064         JP     EXECU
      00978D CC 98 3A         [ 2] 4065 SCOM1:  JP     JSRC
      009790 CD A4 EE         [ 4] 4066 SCOM2:  CALL     NUMBQ   ;try to convert to number
      009793 CD 87 EB         [ 4] 4067         CALL    QDUP  
      009796 CD 85 24         [ 4] 4068         CALL     QBRAN
      009799 93 FA                 4069         .word      ABOR1
      00171B                       4070         _DOLIT  -1
      00979B CD 84 F1         [ 4]    1     CALL DOLIT 
      00979E FF FF                    2     .word -1 
      0097A0 CD 88 FE         [ 4] 4071         CALL    EQUAL
      001723                       4072         _QBRAN DLITER  
      0097A3 CD 85 24         [ 4]    1     CALL QBRAN
      0097A6 A9 3B                    2     .word DLITER
      0097A8 CC 95 96         [ 2] 4073         JP     LITER
                                   4074 
                                   4075 ;       OVERT   ( -- )
                                   4076 ;       Link a new word into vocabulary.
      0097AB 97 66                 4077         .word      LINK
                           00172D  4078 LINK = . 
      0097AD 05                    4079         .byte      5
      0097AE 4F 56 45 52 54        4080         .ascii     "OVERT"
      0097B3                       4081 OVERT:
      0097B3 CD 87 AD         [ 4] 4082         CALL     LAST
      0097B6 CD 85 87         [ 4] 4083         CALL     AT
      0097B9 CD 87 81         [ 4] 4084         CALL     CNTXT
      0097BC CC 85 70         [ 2] 4085         JP     STORE
                                   4086 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                                   4087 ;       ;       ( -- )
                                   4088 ;       Terminate a colon definition.
      0097BF 97 AD                 4089         .word      LINK
                           001741  4090 LINK = . 
      0097C1 C1                    4091 	.byte      IMEDD+COMPO+1
      0097C2 3B                    4092         .ascii     ";"
      0097C3                       4093 SEMIS:
                           000001  4094 .if OPTIMIZE ; more compact and faster
      0097C3 CD 84 F1         [ 4] 4095         call DOLIT 
      0097C6 00 81                 4096         .word 0x81   ; opcode for RET 
      0097C8 CD 95 46         [ 4] 4097         call CCOMMA 
                           000000  4098 .else
                                   4099         CALL     COMPI
                                   4100         .word EXIT 
                                   4101 .endif 
      0097CB CD 94 5B         [ 4] 4102         CALL     LBRAC
      0097CE CD 97 B3         [ 4] 4103         call OVERT 
      0097D1 CD A1 C3         [ 4] 4104         CALL FMOVE
      0097D4 CD 87 EB         [ 4] 4105         call QDUP 
      0097D7 CD 85 24         [ 4] 4106         call QBRAN 
      0097DA 99 0A                 4107         .word SET_RAMLAST 
      0097DC CD A2 57         [ 4] 4108         CALL UPDATPTR
      0097DF 81               [ 4] 4109         RET 
                                   4110 
                                   4111 
                                   4112 ;       Terminate an ISR definition 
                                   4113 ;       retourn ca of ISR as double
                                   4114 ;       I; ( -- ud )
      0097E0 97 C1                 4115         .word LINK 
                           001762  4116         LINK=.
      0097E2 C2                    4117         .byte 2+IMEDD+COMPO 
      0097E3 49 3B                 4118         .ascii "I;" 
      0097E5                       4119 ISEMI:
      0097E5 1D 00 02         [ 2] 4120         subw x,#CELLL  
      0097E8 90 AE 00 80      [ 2] 4121         ldw y,#IRET_CODE 
      0097EC FF               [ 2] 4122         ldw (x),y 
      0097ED CD 95 46         [ 4] 4123         call CCOMMA
      0097F0 CD 94 5B         [ 4] 4124         call LBRAC 
      0097F3 CD A2 9C         [ 4] 4125         call IFMOVE
      0097F6 CD 87 EB         [ 4] 4126         call QDUP 
      0097F9 CD 85 24         [ 4] 4127         CALL QBRAN 
      0097FC 99 0A                 4128         .word SET_RAMLAST
      0097FE CD 87 9D         [ 4] 4129         CALL CPP
      009801 CD 85 87         [ 4] 4130         call AT 
      009804 CD 86 3E         [ 4] 4131         call SWAPP 
      009807 CD 87 9D         [ 4] 4132         CALL CPP 
      00980A CD 85 70         [ 4] 4133         call STORE 
      00980D CD 9C 54         [ 4] 4134         call UPDATCP 
      009810 CD 9C 11         [ 4] 4135         call EEPVP 
      009813 CD 86 24         [ 4] 4136         call DROP 
      009816 CD 85 87         [ 4] 4137         call AT 
      009819 CD 87 8F         [ 4] 4138         call VPP 
      00981C CD 85 70         [ 4] 4139         call STORE 
      00981F CC 8B E7         [ 2] 4140         jp ZERO
      009822 81               [ 4] 4141         ret           
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   4142         
                                   4143 
                                   4144 ;       ]       ( -- )
                                   4145 ;       Start compiling words in
                                   4146 ;       input stream.
      009823 97 E2                 4147         .word      LINK
                           0017A5  4148 LINK = . 
      009825 01                    4149         .byte      1
      009826 5D                    4150         .ascii     "]"
      009827                       4151 RBRAC:
      009827 CD 84 F1         [ 4] 4152         CALL   DOLIT
      00982A 97 6F                 4153         .word  SCOMP
      00982C CD 87 5F         [ 4] 4154         CALL   TEVAL
      00982F CC 85 70         [ 2] 4155         JP     STORE
                                   4156 
                                   4157 ;       CALL,    ( ca -- )
                                   4158 ;       Compile a subroutine call.
      009832 98 25                 4159         .word      LINK
                           0017B4  4160 LINK = . 
      009834 05                    4161         .byte      5
      009835 43 41 4C 4C 2C        4162         .ascii     "CALL,"
      00983A                       4163 JSRC:
      00983A CD 84 F1         [ 4] 4164         CALL     DOLIT
      00983D 00 CD                 4165         .word     CALLL     ;CALL
      00983F CD 95 46         [ 4] 4166         CALL     CCOMMA
      009842 CC 95 2F         [ 2] 4167         JP     COMMA
                                   4168 
                                   4169 ;       INIT-OFS ( -- )
                                   4170 ;       compute offset to adjust jump address 
                                   4171 ;       set variable OFFSET 
      009845 98 34                 4172         .word LINK 
                           0017C7  4173         LINK=.
      009847 08                    4174         .byte 8 
      009848 49 4E 49 54 2D 4F 46  4175         .ascii "INIT-OFS" 
             53
      009850                       4176 INITOFS:
      009850 CD 87 4E         [ 4] 4177         call TFLASH 
      009853 CD 85 87         [ 4] 4178         CALL AT 
      009856 CD 86 2E         [ 4] 4179         CALL DUPP 
      009859 CD 85 24         [ 4] 4180         call QBRAN
      00985C 98 6D                 4181         .word 1$
      00985E CD 86 24         [ 4] 4182         call DROP  
      009861 CD 87 9D         [ 4] 4183         call CPP 
      009864 CD 85 87         [ 4] 4184         call AT 
      009867 CD 8C D5         [ 4] 4185         call HERE
      00986A CD 88 D6         [ 4] 4186         call SUBB 
      00986D CD 87 D2         [ 4] 4187 1$:     call OFFSET 
      009870 CC 85 70         [ 2] 4188         jp STORE  
                                   4189 
                                   4190 ;       :       ( -- ; <string> )
                                   4191 ;       Start a new colon definition
                                   4192 ;       using next word as its name.
      009873 98 47                 4193         .word      LINK
                           0017F5  4194 LINK = . 
      009875 01                    4195         .byte      1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      009876 3A                    4196         .ascii     ":"
      009877                       4197 COLON:
      009877 CD 98 50         [ 4] 4198         call INITOFS       
      00987A CD 91 E9         [ 4] 4199         CALL   TOKEN
      00987D CD 97 22         [ 4] 4200         CALL   SNAME
      009880 CC 98 27         [ 2] 4201         JP     RBRAC
                                   4202 
                                   4203 ;       I:  ( -- )
                                   4204 ;       Start interrupt service routine definition
                                   4205 ;       those definition have no name.
      009883 98 75                 4206         .word LINK
                           001805  4207         LINK=.
      009885 02                    4208         .byte 2 
      009886 49 3A                 4209         .ascii "I:" 
      009888                       4210 ICOLON:
      009888 CD 98 50         [ 4] 4211         call INITOFS 
      00988B CC 98 27         [ 2] 4212         jp RBRAC  
                                   4213 
                                   4214 ;       IMMEDIATE       ( -- )
                                   4215 ;       Make last compiled word
                                   4216 ;       an immediate word.
      00988E 98 85                 4217         .word      LINK
                           001810  4218 LINK = . 
      009890 09                    4219         .byte      9
      009891 49 4D 4D 45 44 49 41  4220         .ascii     "IMMEDIATE"
             54 45
      00989A                       4221 IMMED:
      00989A CD 84 F1         [ 4] 4222         CALL     DOLIT
      00989D 80 00                 4223         .word     0x8000	;  IMEDD*256
      00989F CD 87 AD         [ 4] 4224         CALL     LAST
      0098A2 CD 85 87         [ 4] 4225         CALL     AT
      0098A5 CD 85 87         [ 4] 4226         CALL     AT
      0098A8 CD 86 A1         [ 4] 4227         CALL     ORR
      0098AB CD 87 AD         [ 4] 4228         CALL     LAST
      0098AE CD 85 87         [ 4] 4229         CALL     AT
      0098B1 CC 85 70         [ 2] 4230         JP     STORE
                                   4231 
                                   4232 ;; Defining words
                                   4233 
                                   4234 ;       CREATE  ( -- ; <string> )
                                   4235 ;       Compile a new array
                                   4236 ;       without allocating space.
      0098B4 98 90                 4237         .word      LINK
                           001836  4238 LINK = . 
      0098B6 06                    4239         .byte      6
      0098B7 43 52 45 41 54 45     4240         .ascii     "CREATE"
      0098BD                       4241 CREAT:
      0098BD CD 91 E9         [ 4] 4242         CALL     TOKEN
      0098C0 CD 97 22         [ 4] 4243         CALL     SNAME
      0098C3 CD 97 B3         [ 4] 4244         CALL     OVERT        
      0098C6 CD 95 74         [ 4] 4245         CALL     COMPI 
      0098C9 86 EE                 4246         .word DOVAR 
      0098CB 81               [ 4] 4247         RET
                                   4248 
                                   4249 ;       VARIABLE        ( -- ; <string> )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                   4250 ;       Compile a new variable
                                   4251 ;       initialized to 0.
      0098CC 98 B6                 4252         .word      LINK
                           00184E  4253 LINK = . 
      0098CE 08                    4254         .byte      8
      0098CF 56 41 52 49 41 42 4C  4255         .ascii     "VARIABLE"
             45
      0098D7                       4256 VARIA:
                                   4257 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      0098D7 CD 8C D5         [ 4] 4258         CALL HERE
      0098DA CD 86 2E         [ 4] 4259         CALL DUPP 
      0098DD CD 8B 50         [ 4] 4260         CALL CELLP
      0098E0 CD 87 8F         [ 4] 4261         CALL VPP 
      0098E3 CD 85 70         [ 4] 4262         CALL STORE
      0098E6 CD 98 BD         [ 4] 4263         CALL CREAT
      0098E9 CD 86 2E         [ 4] 4264         CALL DUPP
      0098EC CD 95 2F         [ 4] 4265         CALL COMMA
      0098EF CD 8B E7         [ 4] 4266         CALL ZERO
      0098F2 CD 86 3E         [ 4] 4267         call SWAPP 
      0098F5 CD 85 70         [ 4] 4268         CALL STORE
      0098F8 CD A1 C3         [ 4] 4269         CALL FMOVE ; move definition to FLASH
      0098FB CD 87 EB         [ 4] 4270         CALL QDUP 
      0098FE CD 85 24         [ 4] 4271         CALL QBRAN 
      009901 99 0A                 4272         .word SET_RAMLAST   
      009903 CD 9C 6B         [ 4] 4273         call UPDATVP  ; don't update if variable kept in RAM.
      009906 CD A2 57         [ 4] 4274         CALL UPDATPTR
      009909 81               [ 4] 4275         RET         
      00990A                       4276 SET_RAMLAST: 
      00990A CD 87 AD         [ 4] 4277         CALL LAST 
      00990D CD 85 87         [ 4] 4278         CALL AT 
      009910 CD 87 C0         [ 4] 4279         CALL RAMLAST 
      009913 CC 85 70         [ 2] 4280         jp STORE  
                                   4281 
                                   4282 
                                   4283 ;       CONSTANT  ( n -- ; <string> )
                                   4284 ;       Compile a new constant 
                                   4285 ;       n CONSTANT name 
      009916 98 CE                 4286         .word LINK 
                           001898  4287         LINK=. 
      009918 08                    4288         .byte 8 
      009919 43 4F 4E 53 54 41 4E  4289         .ascii "CONSTANT" 
             54
      009921                       4290 CONSTANT:          
      009921 CD 91 E9         [ 4] 4291         CALL TOKEN
      009924 CD 97 22         [ 4] 4292         CALL SNAME 
      009927 CD 97 B3         [ 4] 4293         CALL OVERT 
      00992A CD 95 74         [ 4] 4294         CALL COMPI 
      00992D 99 41                 4295         .word DOCONST
      00992F CD 95 2F         [ 4] 4296         CALL COMMA 
      009932 CD A1 C3         [ 4] 4297         CALL FMOVE
      009935 CD 87 EB         [ 4] 4298         CALL QDUP 
      009938 CD 85 24         [ 4] 4299         CALL QBRAN 
      00993B 99 0A                 4300         .word SET_RAMLAST  
      00993D CD A2 57         [ 4] 4301         CALL UPDATPTR  
      009940 81               [ 4] 4302 1$:     RET          
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   4303 
                                   4304 ; CONSTANT runtime semantic 
                                   4305 ; doCONST  ( -- n )
                                   4306 ;        .word LINK 
                                   4307 ;        LINK=.
                                   4308 ;        .byte 7
                                   4309 ;        .ascii "DOCONST"
      009941                       4310 DOCONST:
      009941 1D 00 02         [ 2] 4311         subw x,#CELLL
      009944 90 85            [ 2] 4312         popw y 
      009946 90 FE            [ 2] 4313         ldw y,(y) 
      009948 FF               [ 2] 4314         ldw (x),y 
      009949 81               [ 4] 4315         ret 
                                   4316 
                                   4317 ;----------------------------------
                                   4318 ; create double constant 
                                   4319 ; 2CONSTANT ( d -- ; <string> )
                                   4320 ;----------------------------------
      00994A 99 18                 4321     .word LINK 
                           0018CC  4322     LINK=.
      00994C 09                    4323     .byte 9 
      00994D 32 43 4F 4E 53 54 41  4324     .ascii "2CONSTANT"
             4E 54
      009956                       4325 DCONST:
      009956 CD 91 E9         [ 4] 4326         CALL TOKEN
      009959 CD 97 22         [ 4] 4327         CALL SNAME 
      00995C CD 97 B3         [ 4] 4328         CALL OVERT 
      00995F CD 95 74         [ 4] 4329         CALL COMPI 
      009962 99 79                 4330         .word DO_DCONST
      009964 CD 95 2F         [ 4] 4331         CALL COMMA
      009967 CD 95 2F         [ 4] 4332         CALL COMMA  
      00996A CD A1 C3         [ 4] 4333         CALL FMOVE
      00996D CD 87 EB         [ 4] 4334         CALL QDUP 
      009970 CD 85 24         [ 4] 4335         CALL QBRAN 
      009973 99 0A                 4336         .word SET_RAMLAST  
      009975 CD A2 57         [ 4] 4337         CALL UPDATPTR  
      009978 81               [ 4] 4338 1$:     RET          
                                   4339     
                                   4340 ;----------------------------------
                                   4341 ; runtime for DCONST 
                                   4342 ; stack double constant 
                                   4343 ; DO-DCONST ( -- d )
                                   4344 ;-----------------------------------
                                   4345 ;        .word LINK 
                                   4346 ;        LINK=.
                                   4347 ;        .byte 9 
                                   4348 ;        .ascii "DO-DCONST"
      009979                       4349 DO_DCONST:
      009979 90 85            [ 2] 4350     popw y 
      00997B 90 BF 26         [ 2] 4351     ldw YTEMP,y 
      00997E 1D 00 04         [ 2] 4352     subw x,#2*CELLL 
      009981 90 FE            [ 2] 4353     ldw y,(y)
      009983 FF               [ 2] 4354     ldw (x),y 
      009984 90 BE 26         [ 2] 4355     ldw y,YTEMP 
      009987 90 EE 02         [ 2] 4356     ldw y,(2,y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      00998A EF 02            [ 2] 4357     ldw (2,x),y 
      00998C 81               [ 4] 4358     ret 
                                   4359 
                                   4360 ;; Tools
                                   4361 
                                   4362 ;       _TYPE   ( b u -- )
                                   4363 ;       Display a string. Filter
                                   4364 ;       non-printing characters.
      00998D 99 4C                 4365         .word      LINK
                           00190F  4366 LINK = . 
      00998F 05                    4367         .byte      5
      009990 5F 54 59 50 45        4368         .ascii     "_TYPE"
      009995                       4369 UTYPE:
      009995 CD 85 F7         [ 4] 4370         CALL     TOR     ;start count down loop
      009998 20 0F            [ 2] 4371         JRA     UTYP2   ;skip first pass
      00999A CD 86 2E         [ 4] 4372 UTYP1:  CALL     DUPP
      00999D CD 85 A5         [ 4] 4373         CALL     CAT
      0099A0 CD 8C 11         [ 4] 4374         CALL     TCHAR
      0099A3 CD 84 B6         [ 4] 4375         CALL     EMIT    ;display only printable
      0099A6 CD 8B 7B         [ 4] 4376         CALL     ONEP    ;increment address
      0099A9 CD 85 05         [ 4] 4377 UTYP2:  CALL     DONXT
      0099AC 99 9A                 4378         .word      UTYP1   ;loop till done
      0099AE CC 86 24         [ 2] 4379         JP     DROP
                                   4380 
                                   4381 ;       dm+     ( a u -- a )
                                   4382 ;       Dump u bytes from ,
                                   4383 ;       leaving a+u on  stack.
      0099B1 99 8F                 4384         .word      LINK
                           001933  4385 LINK = . 
      0099B3 03                    4386         .byte      3
      0099B4 64 6D 2B              4387         .ascii     "dm+"
      0099B7                       4388 DUMPP:
      0099B7 CD 86 58         [ 4] 4389         CALL     OVER
      0099BA CD 84 F1         [ 4] 4390         CALL     DOLIT
      0099BD 00 04                 4391         .word      4
      0099BF CD 8F DE         [ 4] 4392         CALL     UDOTR   ;display address
      0099C2 CD 8F 2E         [ 4] 4393         CALL     SPACE
      0099C5 CD 85 F7         [ 4] 4394         CALL     TOR     ;start count down loop
      0099C8 20 11            [ 2] 4395         JRA     PDUM2   ;skip first pass
      0099CA CD 86 2E         [ 4] 4396 PDUM1:  CALL     DUPP
      0099CD CD 85 A5         [ 4] 4397         CALL     CAT
      0099D0 CD 84 F1         [ 4] 4398         CALL     DOLIT
      0099D3 00 03                 4399         .word      3
      0099D5 CD 8F DE         [ 4] 4400         CALL     UDOTR   ;display numeric data
      0099D8 CD 8B 7B         [ 4] 4401         CALL     ONEP    ;increment address
      0099DB CD 85 05         [ 4] 4402 PDUM2:  CALL     DONXT
      0099DE 99 CA                 4403         .word      PDUM1   ;loop till done
      0099E0 81               [ 4] 4404         RET
                                   4405 
                                   4406 ;       DUMP    ( a u -- )
                                   4407 ;       Dump u bytes from a,
                                   4408 ;       in a formatted manner.
      0099E1 99 B3                 4409         .word      LINK
                           001963  4410 LINK = . 
      0099E3 04                    4411         .byte      4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      0099E4 44 55 4D 50           4412         .ascii     "DUMP"
      0099E8                       4413 DUMP:
      0099E8 CD 86 FE         [ 4] 4414         CALL     BASE
      0099EB CD 85 87         [ 4] 4415         CALL     AT
      0099EE CD 85 F7         [ 4] 4416         CALL     TOR
      0099F1 CD 8E 8D         [ 4] 4417         CALL     HEX     ;save radix, set hex
      0099F4 CD 84 F1         [ 4] 4418         CALL     DOLIT
      0099F7 00 10                 4419         .word      16
      0099F9 CD 8A A1         [ 4] 4420         CALL     SLASH   ;change count to lines
      0099FC CD 85 F7         [ 4] 4421         CALL     TOR     ;start count down loop
      0099FF CD 8F 76         [ 4] 4422 DUMP1:  CALL     CR
      009A02 CD 84 F1         [ 4] 4423         CALL     DOLIT
      009A05 00 10                 4424         .word      16
      009A07 CD 88 48         [ 4] 4425         CALL     DDUP
      009A0A CD 99 B7         [ 4] 4426         CALL     DUMPP   ;display numeric
      009A0D CD 87 FC         [ 4] 4427         CALL     ROT
      009A10 CD 87 FC         [ 4] 4428         CALL     ROT
      009A13 CD 8F 2E         [ 4] 4429         CALL     SPACE
      009A16 CD 8F 2E         [ 4] 4430         CALL     SPACE
      009A19 CD 99 95         [ 4] 4431         CALL     UTYPE   ;display printable characters
      009A1C CD 85 05         [ 4] 4432         CALL     DONXT
      009A1F 99 FF                 4433         .word      DUMP1   ;loop till done
      009A21 CD 86 24         [ 4] 4434 DUMP3:  CALL     DROP
      009A24 CD 85 D8         [ 4] 4435         CALL     RFROM
      009A27 CD 86 FE         [ 4] 4436         CALL     BASE
      009A2A CC 85 70         [ 2] 4437         JP     STORE   ;restore radix
                                   4438 
                                   4439 ;       .S      ( ... -- ... )
                                   4440 ;        Display  contents of stack.
      009A2D 99 E3                 4441         .word      LINK
                           0019AF  4442 LINK = . 
      009A2F 02                    4443         .byte      2
      009A30 2E 53                 4444         .ascii     ".S"
      009A32                       4445 DOTS:
      009A32 CD 8F 76         [ 4] 4446         CALL     CR
      009A35 CD 8C 29         [ 4] 4447         CALL     DEPTH   ;stack depth
      009A38 CD 85 F7         [ 4] 4448         CALL     TOR     ;start count down loop
      009A3B 20 09            [ 2] 4449         JRA     DOTS2   ;skip first pass
      009A3D CD 85 EB         [ 4] 4450 DOTS1:  CALL     RAT
      009A40 CD 8C 40         [ 4] 4451 	CALL     PICK
      009A43 CD 90 2F         [ 4] 4452         CALL     DOT     ;index stack, display contents
      009A46 CD 85 05         [ 4] 4453 DOTS2:  CALL     DONXT
      009A49 9A 3D                 4454         .word      DOTS1   ;loop till done
      009A4B CD 8F B5         [ 4] 4455         CALL     DOTQP
      009A4E 05                    4456         .byte      5
      009A4F 20 3C 73 70 20        4457         .ascii     " <sp "
      009A54 81               [ 4] 4458         RET
                                   4459 
                                   4460 ;       >NAME   ( ca -- na | F )
                                   4461 ;       Convert code address
                                   4462 ;       to a name address.
      009A55 9A 2F                 4463         .word      LINK
                           0019D7  4464 LINK = . 
      009A57 05                    4465         .byte      5
      009A58 3E 4E 41 4D 45        4466         .ascii     ">NAME"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      009A5D                       4467 TNAME:
      009A5D CD 87 81         [ 4] 4468         CALL     CNTXT   ;vocabulary link
      009A60 CD 85 87         [ 4] 4469 TNAM2:  CALL     AT
      009A63 CD 86 2E         [ 4] 4470         CALL     DUPP    ;?last word in a vocabulary
      009A66 CD 85 24         [ 4] 4471         CALL     QBRAN
      009A69 9A 84                 4472         .word      TNAM4
      009A6B CD 88 48         [ 4] 4473         CALL     DDUP
      009A6E CD 91 F7         [ 4] 4474         CALL     NAMET
      009A71 CD 86 B6         [ 4] 4475         CALL     XORR    ;compare
      009A74 CD 85 24         [ 4] 4476         CALL     QBRAN
      009A77 9A 7E                 4477         .word      TNAM3
      009A79 CD 8B 5F         [ 4] 4478         CALL     CELLM   ;continue with next word
      009A7C 20 E2            [ 2] 4479         JRA     TNAM2
      009A7E CD 86 3E         [ 4] 4480 TNAM3:  CALL     SWAPP
      009A81 CC 86 24         [ 2] 4481         JP     DROP
      009A84 CD 88 3D         [ 4] 4482 TNAM4:  CALL     DDROP
      009A87 CC 8B E7         [ 2] 4483         JP     ZERO
                                   4484 
                                   4485 ;       .ID     ( na -- )
                                   4486 ;        Display  name at address.
      009A8A 9A 57                 4487         .word      LINK
                           001A0C  4488 LINK = . 
      009A8C 03                    4489         .byte      3
      009A8D 2E 49 44              4490         .ascii     ".ID"
      009A90                       4491 DOTID:
      009A90 CD 87 EB         [ 4] 4492         CALL     QDUP    ;if zero no name
      009A93 CD 85 24         [ 4] 4493         CALL     QBRAN
      009A96 9A A6                 4494         .word      DOTI1
      009A98 CD 8C BE         [ 4] 4495         CALL     COUNT
      009A9B CD 84 F1         [ 4] 4496         CALL     DOLIT
      009A9E 00 1F                 4497         .word      0x1F
      009AA0 CD 86 8D         [ 4] 4498         CALL     ANDD    ;mask lexicon bits
      009AA3 CC 99 95         [ 2] 4499         JP     UTYPE
      009AA6 CD 8F B5         [ 4] 4500 DOTI1:  CALL     DOTQP
      009AA9 09                    4501         .byte      9
      009AAA 20 6E 6F 4E 61 6D 65  4502         .ascii     " noName"
      009AB1 81               [ 4] 4503         RET
                                   4504 
                           000000  4505 WANT_SEE=0
                           000000  4506 .if WANT_SEE 
                                   4507 ;       SEE     ( -- ; <string> )
                                   4508 ;       A simple decompiler.
                                   4509 ;       Updated for byte machines.
                                   4510         .word      LINK
                                   4511 LINK = . 
                                   4512         .byte      3
                                   4513         .ascii     "SEE"
                                   4514 SEE:
                                   4515         CALL     TICK    ;starting address
                                   4516         CALL     CR
                                   4517         CALL     ONEM
                                   4518 SEE1:   CALL     ONEP
                                   4519         CALL     DUPP
                                   4520         CALL     AT
                                   4521         CALL     DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   4522         CALL     QBRAN
                                   4523         .word    SEE2
                                   4524         CALL     TNAME   ;?is it a name
                                   4525 SEE2:   CALL     QDUP    ;name address or zero
                                   4526         CALL     QBRAN
                                   4527         .word    SEE3
                                   4528         CALL     SPACE
                                   4529         CALL     DOTID   ;display name
                                   4530         CALL     ONEP
                                   4531         JRA      SEE4
                                   4532 SEE3:   CALL     DUPP
                                   4533         CALL     CAT
                                   4534         CALL     UDOT    ;display number
                                   4535 SEE4:   CALL     NUFQ    ;user control
                                   4536         CALL     QBRAN
                                   4537         .word    SEE1
                                   4538         JP     DROP
                                   4539 .endif ; WANT_SEE 
                                   4540 
                                   4541 ;       WORDS   ( -- )
                                   4542 ;       Display names in vocabulary.
      009AB2 9A 8C                 4543         .word      LINK
                           001A34  4544 LINK = . 
      009AB4 05                    4545         .byte      5
      009AB5 57 4F 52 44 53        4546         .ascii     "WORDS"
      009ABA                       4547 WORDS:
      009ABA CD 8F 76         [ 4] 4548         CALL     CR
      009ABD CD 87 81         [ 4] 4549         CALL     CNTXT   ;only in context
      009AC0 CD 85 87         [ 4] 4550 WORS1:  CALL     AT
      009AC3 CD 87 EB         [ 4] 4551         CALL     QDUP    ;?at end of list
      009AC6 CD 85 24         [ 4] 4552         CALL     QBRAN
      009AC9 9A DC                 4553         .word      WORS2
      009ACB CD 86 2E         [ 4] 4554         CALL     DUPP
      009ACE CD 8F 2E         [ 4] 4555         CALL     SPACE
      009AD1 CD 9A 90         [ 4] 4556         CALL     DOTID   ;display a name
      009AD4 CD 8B 5F         [ 4] 4557         CALL     CELLM
      009AD7 CD 85 53         [ 4] 4558         CALL     BRAN
      009ADA 9A C0                 4559         .word      WORS1
      009ADC 81               [ 4] 4560 WORS2:  RET
                                   4561 
                                   4562         
                                   4563 ;; Hardware reset
                                   4564 
                                   4565 ;       hi      ( -- )
                                   4566 ;       Display sign-on message.
      009ADD 9A B4                 4567         .word      LINK
                           001A5F  4568 LINK = . 
      009ADF 02                    4569         .byte      2
      009AE0 68 69                 4570         .ascii     "hi"
      009AE2                       4571 HI:
      009AE2 CD 8F 76         [ 4] 4572         CALL     CR
      009AE5 CD 8F B5         [ 4] 4573         CALL     DOTQP   ;initialize I/O
      009AE8 0F                    4574         .byte      15
      009AE9 73 74 6D 38 65 46 6F  4575         .ascii     "stm8eForth v"
             72 74 68 20 76
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      009AF5 33                    4576 	.byte      VER+'0'
      009AF6 2E                    4577         .byte      '.' 
      009AF7 30                    4578 	.byte      EXT+'0' ;version
      009AF8 CD 8F B5         [ 4] 4579         CALL    DOTQP
                           000001  4580 .if NUCLEO          
      009AFB 12                    4581         .byte 18
      009AFC 20 6F 6E 20 4E 55 43  4582         .ascii  " on NUCLEO-8S208RB"
             4C 45 4F 2D 38 53 32
             30 38 52 42
                                   4583 .endif
                           000000  4584 .if DISCOVERY
                                   4585         .byte 19
                                   4586         .ascii  " on STM8S-DISCOVERY"
                                   4587 .endif
                           000000  4588 .if DOORBELL
                                   4589         .byte 16
                                   4590         .ascii " on stm8s105k6b6"
                                   4591 .endif
      009B0E CC 8F 76         [ 2] 4592         JP     CR
                                   4593 
                           000000  4594 WANT_DEBUG=0
                           000000  4595 .if WANT_DEBUG 
                                   4596 ;       DEBUG      ( -- )
                                   4597 ;       Display sign-on message.
                                   4598 ;        .word      LINK
                                   4599 LINK = . 
                                   4600         .byte      5
                                   4601         .ascii     "DEBUG"
                                   4602 DEBUG:
                                   4603 	CALL DOLIT
                                   4604 	.word 0x65
                                   4605 	CALL EMIT
                                   4606 	CALL DOLIT
                                   4607 	.word 0
                                   4608  	CALL ZLESS 
                                   4609 	CALL DOLIT
                                   4610 	.word 0xFFFE
                                   4611 	CALL ZLESS 
                                   4612 	CALL UPLUS 
                                   4613  	CALL DROP 
                                   4614 	CALL DOLIT
                                   4615 	.word 3
                                   4616 	CALL UPLUS 
                                   4617 	CALL UPLUS 
                                   4618  	CALL DROP
                                   4619 	CALL DOLIT
                                   4620 	.word 0x43
                                   4621 	CALL UPLUS 
                                   4622  	CALL DROP
                                   4623 	CALL EMIT
                                   4624 	CALL DOLIT
                                   4625 	.word 0x4F
                                   4626 	CALL DOLIT
                                   4627 	.word 0x6F
                                   4628  	CALL XORR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4629 	CALL DOLIT
                                   4630 	.word 0xF0
                                   4631  	CALL ANDD
                                   4632 	CALL DOLIT
                                   4633 	.word 0x4F
                                   4634  	CALL ORR
                                   4635 	CALL EMIT
                                   4636 	CALL DOLIT
                                   4637 	.word 8
                                   4638 	CALL DOLIT
                                   4639 	.word 6
                                   4640  	CALL SWAPP
                                   4641 	CALL OVER
                                   4642 	CALL XORR
                                   4643 	CALL DOLIT
                                   4644 	.word 3
                                   4645 	CALL ANDD 
                                   4646 	CALL ANDD
                                   4647 	CALL DOLIT
                                   4648 	.word 0x70
                                   4649 	CALL UPLUS 
                                   4650 	CALL DROP
                                   4651 	CALL EMIT
                                   4652 	CALL DOLIT
                                   4653 	.word 0
                                   4654 	CALL QBRAN
                                   4655 	.word DEBUG1
                                   4656 	CALL DOLIT
                                   4657 	.word 0x3F
                                   4658 DEBUG1:
                                   4659 	CALL DOLIT
                                   4660 	.word 0xFFFF
                                   4661 	CALL QBRAN
                                   4662 	.word DEBUG2
                                   4663 	CALL DOLIT
                                   4664 	.word 0x74
                                   4665 	CALL BRAN
                                   4666 	.word DEBUG3
                                   4667 DEBUG2:
                                   4668 	CALL DOLIT
                                   4669 	.word 0x21
                                   4670 DEBUG3:
                                   4671 	CALL EMIT
                                   4672 	CALL DOLIT
                                   4673 	.word 0x68
                                   4674 	CALL DOLIT
                                   4675 	.word 0x80
                                   4676 	CALL STORE
                                   4677 	CALL DOLIT
                                   4678 	.word 0x80
                                   4679 	CALL AT
                                   4680 	CALL EMIT
                                   4681 	CALL DOLIT
                                   4682 	.word 0x4D
                                   4683 	CALL TOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   4684 	CALL RAT
                                   4685 	CALL RFROM
                                   4686 	CALL ANDD
                                   4687 	CALL EMIT
                                   4688 	CALL DOLIT
                                   4689 	.word 0x61
                                   4690 	CALL DOLIT
                                   4691 	.word 0xA
                                   4692 	CALL TOR
                                   4693 DEBUG4:
                                   4694 	CALL DOLIT
                                   4695 	.word 1
                                   4696 	CALL UPLUS 
                                   4697 	CALL DROP
                                   4698 	CALL DONXT
                                   4699 	.word DEBUG4
                                   4700 	CALL EMIT
                                   4701 	CALL DOLIT
                                   4702 	.word 0x656D
                                   4703 	CALL DOLIT
                                   4704 	.word 0x100
                                   4705 	CALL UMSTA
                                   4706 	CALL SWAPP
                                   4707 	CALL DOLIT
                                   4708 	.word 0x100
                                   4709 	CALL UMSTA
                                   4710 	CALL SWAPP 
                                   4711 	CALL DROP
                                   4712 	CALL EMIT
                                   4713 	CALL EMIT
                                   4714 	CALL DOLIT
                                   4715 	.word 0x2043
                                   4716 	CALL DOLIT
                                   4717 	.word 0
                                   4718 	CALL DOLIT
                                   4719 	.word 0x100
                                   4720 	CALL UMMOD
                                   4721 	CALL EMIT
                                   4722 	CALL EMIT
                                   4723 	;JP ORIG
                                   4724 	RET
                                   4725 .endif ; WANT_DEBUG 
                                   4726 
                                   4727 
                                   4728 ;       'BOOT   ( -- a )
                                   4729 ;       The application startup vector.
      009B11 9A DF                 4730         .word      LINK
                           001A93  4731 LINK = . 
      009B13 05                    4732         .byte      5
      009B14 27 42 4F 4F 54        4733         .ascii     "'BOOT"
      009B19                       4734 TBOOT:
      009B19 CD 86 EE         [ 4] 4735         CALL     DOVAR
      009B1C 40 02                 4736         .word    APP_RUN      ;application to boot
                                   4737 
                                   4738 ;       COLD    ( -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                                   4739 ;       The hilevel cold start s=ence.
      009B1E 9B 13                 4740         .word      LINK
                           001AA0  4741         LINK = . 
      009B20 04                    4742         .byte      4
      009B21 43 4F 4C 44           4743         .ascii     "COLD"
      009B25                       4744 COLD:
                           000000  4745 .if WANT_DEBUG
                                   4746         CALL DEBUG
                                   4747 .endif ; WANT_DEBUG
      009B25 CD 84 F1         [ 4] 4748 COLD1:  CALL     DOLIT
      009B28 80 AB                 4749         .word      UZERO
      009B2A CD 84 F1         [ 4] 4750 	CALL     DOLIT
      009B2D 00 06                 4751         .word      UPP
      009B2F CD 84 F1         [ 4] 4752         CALL     DOLIT
      009B32 00 1C                 4753 	.word      UEND-UZERO
      009B34 CD 8D 22         [ 4] 4754         CALL     CMOVE   ;initialize user area
                           000001  4755 .if WANT_FLOAT 
      009B37 CD AC 34         [ 4] 4756         CALL    FINIT 
                                   4757 .endif 
                                   4758 ; if APP_RUN==0 initialize with ca de 'hi'  
      009B3A 90 CE 40 02      [ 2] 4759         ldw y,APP_RUN 
      009B3E 26 0B            [ 1] 4760         jrne 0$
      009B40 1D 00 02         [ 2] 4761         subw x,#CELLL 
      009B43 90 AE 9A E2      [ 2] 4762         ldw y,#HI  
      009B47 FF               [ 2] 4763         ldw (x),y
      009B48 CD 9C 43         [ 4] 4764         call UPDATRUN 
      009B4B                       4765 0$:        
                                   4766 ; update LAST with APP_LAST 
                                   4767 ; if APP_LAST > LAST else do the opposite
      009B4B 90 CE 40 00      [ 2] 4768         ldw y,APP_LAST 
      009B4F 90 B3 1C         [ 2] 4769         cpw y,ULAST 
      009B52 22 05            [ 1] 4770         jrugt 1$ 
                                   4771 ; save LAST at APP_LAST  
      009B54 CD 9C 2B         [ 4] 4772         call UPDATLAST 
      009B57 20 06            [ 2] 4773         jra 2$
      009B59                       4774 1$: ; update LAST with APP_LAST 
      009B59 90 BF 1C         [ 2] 4775         ldw ULAST,y
      009B5C 90 BF 16         [ 2] 4776         ldw UCNTXT,y
      009B5F                       4777 2$:  
                                   4778 ; update APP_CP if < app_space 
      009B5F 90 CE 40 04      [ 2] 4779         ldw y,APP_CP  
      009B63 90 B3 1A         [ 2] 4780         cpw y,UCP   
      009B66 24 06            [ 1] 4781         jruge 3$ 
      009B68 CD 9C 54         [ 4] 4782         call UPDATCP
      009B6B 90 BE 1A         [ 2] 4783         ldw y,UCP   
      009B6E                       4784 3$:
      009B6E 90 BF 1A         [ 2] 4785         ldw UCP,y                 
                                   4786 ; update UVP with APP_VP  
                                   4787 ; if APP_VP>UVP else do the opposite 
      009B71 90 CE 40 06      [ 2] 4788         ldw y,APP_VP 
      009B75 90 B3 18         [ 2] 4789         cpw y,UVP 
      009B78 22 05            [ 1] 4790         jrugt 4$
      009B7A CD 9C 6B         [ 4] 4791         call UPDATVP 
      009B7D 20 03            [ 2] 4792         jra 6$
      009B7F                       4793 4$: ; update UVP with APP_VP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009B7F 90 BF 18         [ 2] 4794         ldw UVP,y 
      009B82                       4795 6$:      
      009B82 CD 94 DA         [ 4] 4796         CALL     PRESE   ;initialize data stack and TIB
      009B85 CD 9B 19         [ 4] 4797         CALL     TBOOT
      009B88 CD 8D 0B         [ 4] 4798         CALL     ATEXE   ;application boot
      009B8B CD 97 B3         [ 4] 4799         CALL     OVERT
      009B8E CC 94 F7         [ 2] 4800         JP     QUIT    ;start interpretation
                                   4801 
                                   4802 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                                   4803         .include "flash.asm"
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
      009B91 9B 20                   30     .word LINK 
                           001B13    31     LINK=.
      009B93 03                      32     .byte 3 
      009B94 46 50 21                33     .ascii "FP!"
      009B97                         34 FPSTOR:
      009B97 90 93            [ 1]   35     ldw y,x
      009B99 90 FE            [ 2]   36     ldw y,(y)
      009B9B 90 9F            [ 1]   37     ld a,yl 
      009B9D B7 34            [ 1]   38     ld FPTR,a 
      009B9F 1C 00 02         [ 2]   39     addw x,#CELLL 
      009BA2 90 93            [ 1]   40     ldw y,x 
      009BA4 90 FE            [ 2]   41     ldw y,(y)
      009BA6 90 BF 35         [ 2]   42     ldw PTR16,y
      009BA9 1C 00 02         [ 2]   43     addw x,#CELLL 
      009BAC 81               [ 4]   44     ret 
                                     45 
                                     46 ;-----------------------------------
                                     47 ; return EEPROM base address 
                                     48 ; as a double 
                                     49 ;  EEPROM  ( -- ud )
                                     50 ;-----------------------------------
      009BAD 9B 93                   51     .word LINK 
                           001B2F    52 LINK=.
      009BAF 06                      53     .byte 6 
      009BB0 45 45 50 52 4F 4D       54     .ascii "EEPROM"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      009BB6                         55 EEPROM: 
      009BB6 90 AE 40 00      [ 2]   56     ldw y,#EEPROM_BASE
      009BBA 1D 00 04         [ 2]   57     subw x,#2*CELLL 
      009BBD EF 02            [ 2]   58     ldw (2,x),y 
      009BBF 90 5F            [ 1]   59     clrw y 
      009BC1 FF               [ 2]   60     ldw (x),y 
      009BC2 81               [ 4]   61     ret
                                     62 
                                     63 ;---------------------------------
                                     64 ; return APP_LAST pointer as double
                                     65 ; EEP-LAST ( -- ud )
                                     66 ;---------------------------------
      009BC3 9B AF                   67 	.word LINK 
                           001B45    68 	LINK=.
      009BC5 08                      69 	.byte 8 
      009BC6 45 45 50 2D 4C 41 53    70 	.ascii "EEP-LAST"
             54
      009BCE                         71 EEPLAST:
      009BCE 1D 00 04         [ 2]   72 	subw x,#2*CELLL 
      009BD1 90 AE 40 00      [ 2]   73 	ldw y,#APP_LAST 
      009BD5 EF 02            [ 2]   74 	ldw (2,x),y 
      009BD7 90 5F            [ 1]   75 	clrw y 
      009BD9 FF               [ 2]   76 	ldw (x),y 
      009BDA 81               [ 4]   77 	ret 
                                     78 
                                     79 ;----------------------------------
                                     80 ; return APP_RUN pointer as double	
                                     81 ; EEP-RUN ( -- ud )
                                     82 ;-----------------------------------
      009BDB 9B C5                   83 	.word LINK 
                           001B5D    84 	LINK=.
      009BDD 07                      85 	.byte 7
      009BDE 45 45 50 2D 52 55 4E    86 	.ascii "EEP-RUN"
      009BE5                         87 EEPRUN:
      009BE5 1D 00 04         [ 2]   88 	subw x,#2*CELLL 
      009BE8 90 AE 40 02      [ 2]   89 	ldw y,#APP_RUN 
      009BEC EF 02            [ 2]   90 	ldw (2,x),y 
      009BEE 90 5F            [ 1]   91 	clrw y 
      009BF0 FF               [ 2]   92 	ldw (x),y 
      009BF1 81               [ 4]   93 	ret 
                                     94 
                                     95 ;------------------------------------
                                     96 ; return APP_CP pointer as double 
                                     97 ; EEP-CP ( -- ud )
                                     98 ;------------------------------------
      009BF2 9B DD                   99 	.word LINK
                           001B74   100 	LINK=.
      009BF4 06                     101 	.byte 6 
      009BF5 45 45 50 2D 43 50      102 	.ascii "EEP-CP"
      009BFB                        103 EEPCP:
      009BFB 1D 00 04         [ 2]  104 	subw x,#2*CELLL 
      009BFE 90 AE 40 04      [ 2]  105 	ldw y,#APP_CP  
      009C02 EF 02            [ 2]  106 	ldw (2,x),y 
      009C04 90 5F            [ 1]  107 	clrw y 
      009C06 FF               [ 2]  108 	ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009C07 81               [ 4]  109 	ret 
                                    110 
                                    111 ;------------------------------------
                                    112 ; return APP_VP pointer as double 
                                    113 ; EEP-VP ( -- ud )
                                    114 ;-------------------------------------
      009C08 9B F4                  115 	.word LINK
                           001B8A   116 	LINK=.
      009C0A 06                     117 	.byte 6
      009C0B 45 45 50 2D 56 50      118 	.ascii "EEP-VP"
      009C11                        119 EEPVP:
      009C11 1D 00 04         [ 2]  120 	subw x,#2*CELLL 
      009C14 90 AE 40 06      [ 2]  121 	ldw y,#APP_VP  
      009C18 EF 02            [ 2]  122 	ldw (2,x),y 
      009C1A 90 5F            [ 1]  123 	clrw y 
      009C1C FF               [ 2]  124 	ldw (x),y 
      009C1D 81               [ 4]  125 	ret 
                                    126 
                                    127 ;----------------------------------
                                    128 ; update APP_LAST with LAST 
                                    129 ; UPDAT-LAST ( -- )
                                    130 ;----------------------------------
      009C1E 9C 0A                  131 	.word LINK 
                           001BA0   132 	LINK=.
      009C20 0A                     133 	.byte 10
      009C21 55 50 44 41 54 2D 4C   134 	.ascii "UPDAT-LAST"
             41 53 54
      009C2B                        135 UPDATLAST:
      009C2B CD 87 AD         [ 4]  136 	call LAST
      009C2E CD 85 87         [ 4]  137 	call AT  
      009C31 CD 9B CE         [ 4]  138 	call EEPLAST
      009C34 CC 9E 21         [ 2]  139 	jp EESTORE 
                                    140 
                                    141 ;---------------------------------
                                    142 ; update APP_RUN 
                                    143 ; UPDAT-RUN ( a -- )
                                    144 ;---------------------------------
      009C37 9C 20                  145 	.word LINK
                           001BB9   146 	LINK=.
      009C39 09                     147 	.byte 9
      009C3A 55 50 44 41 54 2D 52   148 	.ascii "UPDAT-RUN"
             55 4E
      009C43                        149 UPDATRUN:
      009C43 CD 9B E5         [ 4]  150 	call EEPRUN
      009C46 CC 9E 21         [ 2]  151 	jp EESTORE 
                                    152 	
                                    153 ;---------------------------------
                                    154 ; update APP_CP with CP 
                                    155 ; UPDAT-CP ( -- )
                                    156 ;---------------------------------
      009C49 9C 39                  157 	.word LINK 
                           001BCB   158 	LINK=.
      009C4B 08                     159 	.byte 8 
      009C4C 55 50 44 41 54 2D 43   160 	.ascii "UPDAT-CP"
             50
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009C54                        161 UPDATCP:
      009C54 CD 87 9D         [ 4]  162 	call CPP 
      009C57 CD 85 87         [ 4]  163 	call AT 
      009C5A CD 9B FB         [ 4]  164 	call EEPCP 
      009C5D CC 9E 21         [ 2]  165 	jp EESTORE 
                                    166 
                                    167 ;----------------------------------
                                    168 ; update APP_VP with VP 
                                    169 ; UPDAT-VP ( -- )
                                    170 ;----------------------------------
      009C60 9C 4B                  171 	.word LINK
                           001BE2   172 	LINK=.
      009C62 08                     173 	.byte 8 
      009C63 55 50 44 41 54 2D 56   174 	.ascii "UPDAT-VP" 
             50
      009C6B                        175 UPDATVP:
      009C6B CD 87 8F         [ 4]  176 	call VPP 
      009C6E CD 85 87         [ 4]  177 	call AT
      009C71 CD 9C 11         [ 4]  178 	call EEPVP 
      009C74 CC 9E 21         [ 2]  179 	jp EESTORE
                                    180 	
                           000001   181 .if NUCLEO
                                    182 ;----------------------------------
                                    183 ; fetch integer at address over 65535
                                    184 ;  F@   ( ud -- n )
                                    185 ;----------------------------------
      009C77 9C 62                  186     .word LINK 
                           001BF9   187 LINK=.
      009C79 02                     188     .byte 2
      009C7A 46 40                  189     .ascii "F@"
      009C7C                        190 FARAT:
      009C7C CD 9B 97         [ 4]  191     call FPSTOR
      009C7F CC 9D 44         [ 2]  192 	jp EE_READ 
                                    193 
                                    194 
                                    195 ;-------------------------------------
                                    196 ; fetch C at address over 65535 
                                    197 ; FC@ ( ud -- c)
                                    198 ;-------------------------------------
      009C82 9C 79                  199     .word LINK
                           001C04   200     LINK=.
      009C84 03                     201     .byte 3 
      009C85 46 43 40               202     .ascii "FC@" 
      009C88                        203 FARCAT:
      009C88 CD 9B 97         [ 4]  204     call FPSTOR
      009C8B CC 9D 66         [ 2]  205 	jp EE_CREAD  
                                    206 .endif ; NUCLEO 
                                    207 
                                    208 ;----------------------------------
                                    209 ; UNLOCK EEPROM/OPT for writing/erasing
                                    210 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    211 ;  UNLKEE   ( -- )
                                    212 ;----------------------------------
      009C8E 9C 84                  213     .word LINK 
                           001C10   214 LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009C90 06                     215     .byte 6 
      009C91 55 4E 4C 4B 45 45      216     .ascii "UNLKEE"
      009C97                        217 UNLKEE:
      009C97 35 00 50 5B      [ 1]  218 	mov FLASH_CR2,#0 
      009C9B 35 FF 50 5C      [ 1]  219 	mov FLASH_NCR2,#0xFF 
      009C9F 35 AE 50 64      [ 1]  220 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009CA3 35 56 50 64      [ 1]  221     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009CA7 72 07 50 5F FB   [ 2]  222 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009CAC 81               [ 4]  223 	ret
                                    224 
                                    225 ;----------------------------------
                                    226 ; UNLOCK FLASH for writing/erasing
                                    227 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    228 ; UNLKFL  ( -- )
                                    229 ;----------------------------------
      009CAD 9C 90                  230     .word LINK 
                           001C2F   231 LINK=. 
      009CAF 06                     232     .byte 6 
      009CB0 55 4E 4C 4B 46 4C      233     .ascii "UNLKFL"    
      009CB6                        234 UNLKFL:
      009CB6 35 00 50 5B      [ 1]  235 	mov FLASH_CR2,#0 
      009CBA 35 FF 50 5C      [ 1]  236 	mov FLASH_NCR2,#0xFF 
      009CBE 35 56 50 62      [ 1]  237 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009CC2 35 AE 50 62      [ 1]  238 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009CC6 72 03 50 5F FB   [ 2]  239 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009CCB 81               [ 4]  240 	ret
                                    241 
                                    242 ;-----------------------------
                                    243 ; UNLOCK FLASH or EEPROM 
                                    244 ; according to FPTR address 
                                    245 ;  UNLOCK ( -- )
                                    246 ;-----------------------------
      009CCC 9C AF                  247 	.word LINK 
                           001C4E   248 	LINK=.
      009CCE 06                     249 	.byte 6
      009CCF 55 4E 4C 4F 43 4B      250 	.ascii "UNLOCK"
      009CD5                        251 UNLOCK:
                                    252 ; put addr[15:0] in Y, for bounds check.
      009CD5 90 BE 35         [ 2]  253 	ldw y,PTR16   ; Y=addr15:0
                                    254 ; check addr[23:16], if <> 0 then it is extened flash memory
      009CD8 3D 34            [ 1]  255 	tnz FPTR 
      009CDA 26 16            [ 1]  256 	jrne 4$
      009CDC 90 A3 80 00      [ 2]  257     cpw y,#FLASH_BASE
      009CE0 24 10            [ 1]  258     jruge 4$
      009CE2 90 A3 40 00      [ 2]  259 	cpw y,#EEPROM_BASE  
      009CE6 25 0D            [ 1]  260     jrult 9$
      009CE8 90 A3 48 7F      [ 2]  261 	cpw y,#OPTION_END 
      009CEC 22 07            [ 1]  262 	jrugt 9$
      009CEE CD 9C 97         [ 4]  263 	call UNLKEE
      009CF1 81               [ 4]  264 	ret 
      009CF2 CD 9C B6         [ 4]  265 4$: call UNLKFL
      009CF5 81               [ 4]  266 9$: ret 
                                    267 
                                    268 ;-------------------------
                                    269 ; LOCK write access to 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                    270 ; FLASH and EEPROM 
                                    271 ; LOCK ( -- )
                                    272 ;-------------------------
      009CF6 9C CE                  273 	.word LINK 
                           001C78   274 	LINK=.
      009CF8 04                     275 	.byte 4 
      009CF9 4C 4F 43 4B            276 	.ascii "LOCK" 
      009CFD                        277 LOCK: 
      009CFD 72 13 50 5F      [ 1]  278 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009D01 72 17 50 5F      [ 1]  279 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009D05 81               [ 4]  280 	ret 
                                    281 
                                    282 ;-------------------------
                                    283 ; increment FPTR 
                                    284 ; INC-FPTR ( -- )
                                    285 ;-------------------------
      009D06 9C F8                  286 	.word LINK 
                           001C88   287 	LINK=. 
      009D08 08                     288 	.byte 8 
      009D09 49 4E 43 2D 46 50 54   289 	.ascii "INC-FPTR" 
             52
      009D11                        290 INC_FPTR:
      009D11 3C 36            [ 1]  291 	inc PTR8 
      009D13 26 0C            [ 1]  292 	jrne 1$
      009D15 90 89            [ 2]  293 	pushw y 
      009D17 90 BE 34         [ 2]  294 	ldw y,FPTR 
      009D1A 90 5C            [ 1]  295 	incw y 
      009D1C 90 BF 34         [ 2]  296 	ldw FPTR,y
      009D1F 90 85            [ 2]  297 	popw y  
      009D21 81               [ 4]  298 1$: ret 
                                    299 
                                    300 ;------------------------------
                                    301 ; add u to FPTR 
                                    302 ; PTR+ ( u -- )
                                    303 ;------------------------------
      009D22 9D 08                  304 	.word LINK 
                           001CA4   305 	LINK=.
      009D24 04                     306 	.byte 4 
      009D25 50 54 52 2B            307 	.ascii "PTR+"
      009D29                        308 PTRPLUS:
      009D29 90 93            [ 1]  309 	ldw y,x 
      009D2B 1C 00 02         [ 2]  310 	addw x,#CELLL 
      009D2E 72 B9 00 35      [ 2]  311 	addw y,PTR16 
      009D32 90 BF 35         [ 2]  312 	ldw PTR16,y  
      009D35 24 02            [ 1]  313 	jrnc 1$
      009D37 3C 34            [ 1]  314 	inc FPTR 
      009D39 81               [ 4]  315 1$: ret 
                                    316 
                                    317 ;---------------------------------
                                    318 ; read word at address pointed FPTR
                                    319 ; increment FPTR 
                                    320 ; EE-READ ( -- w )
                                    321 ;------------------------------------
      009D3A 9D 24                  322 	.word LINK 
                           001CBC   323 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009D3C 07                     324 	.byte 7 
      009D3D 45 45 2D 52 45 41 44   325 	.ascii "EE-READ"
      009D44                        326 EE_READ:
      009D44 1D 00 02         [ 2]  327 	subw x,#CELLL 
      009D47 92 BC 00 34      [ 5]  328 	ldf a,[FPTR]
      009D4B 90 95            [ 1]  329 	ld yh,a 
      009D4D CD 9D 11         [ 4]  330 	call INC_FPTR 
      009D50 92 BC 00 34      [ 5]  331 	ldf a,[FPTR]
      009D54 CD 9D 11         [ 4]  332 	call INC_FPTR 
      009D57 90 97            [ 1]  333 	ld yl,a 
      009D59 FF               [ 2]  334 	ldw (x),y 
      009D5A 81               [ 4]  335 	ret 
                                    336 
                                    337 ;---------------------------------------
                                    338 ; Read byte at address pointed by FPTR 
                                    339 ; EE-CREAD ( -- c )
                                    340 ;---------------------------------------
      009D5B 9D 3C                  341 	.word LINK 
                           001CDD   342 	LINK=.
      009D5D 08                     343 	.byte 8
      009D5E 45 45 2D 43 52 45 41   344 	.ascii "EE-CREAD" 
             44
      009D66                        345 EE_CREAD:
      009D66 1D 00 02         [ 2]  346 	subw x,#CELLL 
      009D69 92 BC 00 34      [ 5]  347 	ldf a,[FPTR]	
      009D6D CD 9D 11         [ 4]  348 	call INC_FPTR
      009D70 90 5F            [ 1]  349 	clrw y 
      009D72 90 97            [ 1]  350 	ld yl,a 
      009D74 FF               [ 2]  351 	ldw (x),y 
      009D75 81               [ 4]  352 	ret 
                                    353 
                                    354 ;----------------------------
                                    355 ; write a byte at address pointed 
                                    356 ; by FPTR and increment FPTR.
                                    357 ; Expect pointer already initialized 
                                    358 ; and memory unlocked 
                                    359 ; WR-BYTE ( c -- )
                                    360 ;----------------------------
      009D76 9D 5D                  361 	.word LINK 
                           001CF8   362 	LINK=. 
      009D78 07                     363 	.byte 7 
      009D79 57 52 2D 42 59 54 45   364 	.ascii "WR-BYTE" 
                                    365 
      009D80                        366 WR_BYTE:
      009D80 CD 84 E3         [ 4]  367 	call FC_XOFF
      009D83 90 93            [ 1]  368 	ldw y,x 
      009D85 90 FE            [ 2]  369 	ldw y,(y)
      009D87 1C 00 02         [ 2]  370 	addw x,#CELLL 
      009D8A 90 9F            [ 1]  371 	ld a,yl
      009D8C 92 BD 00 34      [ 4]  372 	ldf [FPTR],a
      009D90 72 05 50 5F FB   [ 2]  373 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009D95 CD 84 CD         [ 4]  374 	call FC_XON
      009D98 CC 9D 11         [ 2]  375 	jp INC_FPTR 
                                    376 
                                    377 ;---------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                    378 ; write a word at address pointed 
                                    379 ; by FPTR and increment FPTR 
                                    380 ; Expect pointer already initialzed 
                                    381 ; and memory unlocked 
                                    382 ; WR-WORD ( w -- )
                                    383 ;---------------------------------------
      009D9B 9D 78                  384 	.word LINK 
                           001D1D   385 	LINK=.
      009D9D 07                     386 	.byte 7 
      009D9E 57 52 2D 57 4F 52 44   387 	.ascii "WR-WORD" 
      009DA5                        388 WR_WORD:
      009DA5 CD 84 E3         [ 4]  389 	call FC_XOFF
      009DA8 90 93            [ 1]  390 	ldw y,x
      009DAA 90 FE            [ 2]  391 	ldw y,(y)
      009DAC 1C 00 02         [ 2]  392 	addw x,#CELLL 
      009DAF 90 9E            [ 1]  393 	ld a,yh 
      009DB1 92 BD 00 34      [ 4]  394 	ldf [FPTR],a
      009DB5 72 05 50 5F FB   [ 2]  395 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009DBA CD 9D 11         [ 4]  396 	call INC_FPTR 
      009DBD 90 9F            [ 1]  397 	ld a,yl 
      009DBF 92 BD 00 34      [ 4]  398 	ldf [FPTR],a
      009DC3 72 05 50 5F FB   [ 2]  399 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009DC8 CD 84 CD         [ 4]  400 	call FC_XON
      009DCB CC 9D 11         [ 2]  401 	jp INC_FPTR 
                                    402 
                                    403 
                                    404 ;---------------------------------------
                                    405 ; write a byte to FLASH or EEPROM/OPTION  
                                    406 ; EEC!  (c ud -- )
                                    407 ;---------------------------------------
      009DCE 9D 9D                  408     .word LINK 
                           001D50   409 	LINK=.
      009DD0 04                     410     .byte 4 
      009DD1 45 45 43 21            411     .ascii "EEC!"
                                    412 	; local variables 
                           000001   413 	BTW = 1   ; byte to write offset on stack
                           000002   414     OPT = 2 
                           000002   415 	VSIZE = 2
      009DD5                        416 EECSTORE:
      009DD5 52 02            [ 2]  417 	sub sp,#VSIZE
      009DD7 CD 9B 97         [ 4]  418     call FPSTOR
      009DDA E6 01            [ 1]  419 	ld a,(1,x)
      009DDC 43               [ 1]  420 	cpl a 
      009DDD 6B 01            [ 1]  421 	ld (BTW,sp),a ; byte to write 
      009DDF 0F 02            [ 1]  422 	clr (OPT,sp)  ; OPTION flag
      009DE1 CD 9C D5         [ 4]  423 	call UNLOCK 
                                    424 	; check if option
      009DE4 3D 34            [ 1]  425 	tnz FPTR 
      009DE6 26 19            [ 1]  426 	jrne 2$
      009DE8 90 BE 35         [ 2]  427 	ldw y,PTR16 
      009DEB 90 A3 48 00      [ 2]  428 	cpw y,#OPTION_BASE
      009DEF 2B 10            [ 1]  429 	jrmi 2$
      009DF1 90 A3 48 80      [ 2]  430 	cpw y,#OPTION_END+1
      009DF5 2A 0A            [ 1]  431 	jrpl 2$
      009DF7 03 02            [ 1]  432 	cpl (OPT,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                    433 	; OPTION WRITE require this UNLOCK 
      009DF9 72 1E 50 5B      [ 1]  434     bset FLASH_CR2,#FLASH_CR2_OPT
      009DFD 72 1F 50 5C      [ 1]  435     bres FLASH_NCR2,#FLASH_CR2_OPT 
      009E01                        436 2$: 
      009E01 CD 9D 80         [ 4]  437 	call WR_BYTE 	
      009E04 0D 02            [ 1]  438 	tnz (OPT,sp)
      009E06 27 0D            [ 1]  439 	jreq 3$ 
      009E08 7B 01            [ 1]  440     ld a,(BTW,sp)
      009E0A 90 5F            [ 1]  441     clrw y
      009E0C 90 97            [ 1]  442 	ld yl,a 
      009E0E 1D 00 02         [ 2]  443 	subw x,#CELLL 
      009E11 FF               [ 2]  444 	ldw (x),y 
      009E12 CD 9D 80         [ 4]  445 	call WR_BYTE
      009E15                        446 3$: 
      009E15 CD 9C FD         [ 4]  447 	call LOCK 
      009E18 5B 02            [ 2]  448 	addw sp,#VSIZE 
      009E1A 81               [ 4]  449     ret
                                    450 
                                    451 ;------------------------------
                                    452 ; write integer in FLASH|EEPROM
                                    453 ; EE! ( n ud -- )
                                    454 ;------------------------------
      009E1B 9D D0                  455 	.word LINK 
                           001D9D   456 	LINK=.
      009E1D 03                     457 	.byte 3 
      009E1E 45 45 21               458 	.ascii "EE!"
      009E21                        459 EESTORE:
      009E21 CD 9B 97         [ 4]  460 	call FPSTOR 
      009E24 CD 9C D5         [ 4]  461 	call UNLOCK 
      009E27 90 93            [ 1]  462 	ldw y,x 
      009E29 90 FE            [ 2]  463 	ldw y,(y)
      009E2B 90 89            [ 2]  464 	pushw y 
      009E2D 90 5E            [ 1]  465 	swapw y 
      009E2F FF               [ 2]  466 	ldw (x),y 
      009E30 CD 9D 80         [ 4]  467 	call WR_BYTE 
      009E33 90 85            [ 2]  468 	popw y 
      009E35 1D 00 02         [ 2]  469 	subw x,#CELLL
      009E38 FF               [ 2]  470 	ldw (x),y 
      009E39 CD 9D 80         [ 4]  471 	call WR_BYTE
      009E3C CC 9C FD         [ 2]  472 	jp LOCK 
                                    473 
                                    474 
                                    475 ;----------------------------
                                    476 ; Erase flash memory row 
                                    477 ; stm8s208 as 128 bytes rows
                                    478 ; ROW-ERASE ( ud -- )
                                    479 ;----------------------------
      009E3F 9E 1D                  480 	.word LINK 
                           001DC1   481 	LINK=. 
      009E41 09                     482 	.byte 9 
      009E42 52 4F 57 2D 45 52 41   483 	.ascii "ROW-ERASE" 
             53 45
      009E4B                        484 row_erase:
      009E4B CD 84 E3         [ 4]  485 	call FC_XOFF
      009E4E CD 9B 97         [ 4]  486 	call FPSTOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                    487 ;code must be execute from RAM 
                                    488 ;copy routine to PAD 
      009E51 1D 00 02         [ 2]  489 	subw x,#CELLL 
      009E54 90 AE 9E A4      [ 2]  490 	ldw y,#row_erase_proc
      009E58 FF               [ 2]  491 	ldw (x),y 
      009E59 CD 8C E6         [ 4]  492 	call PAD 
      009E5C 90 AE 9E CB      [ 2]  493 	ldw y,#row_erase_proc_end 
      009E60 72 A2 9E A4      [ 2]  494 	subw y,#row_erase_proc
      009E64 1D 00 02         [ 2]  495 	subw x,#CELLL 
      009E67 FF               [ 2]  496 	ldw (x),y 
      009E68 CD 8D 22         [ 4]  497 	call CMOVE 
      009E6B                        498 block_erase:
      009E6B 90 BE 35         [ 2]  499 	ldw y,FPTR+1
      009E6E 90 A3 B4 00      [ 2]  500 	cpw y,#app_space 
      009E72 2A 19            [ 1]  501 	jrpl erase_flash 
                                    502 ; erase EEPROM block
      009E74 90 A3 40 00      [ 2]  503 	cpw y,#EEPROM_BASE 
      009E78 24 04            [ 1]  504 	jruge 1$
      009E7A CD 84 CD         [ 4]  505 	call FC_XON
      009E7D 81               [ 4]  506 	ret ; bad address 
      009E7E 90 A3 47 FF      [ 2]  507 1$: cpw y,#EEPROM_END 
      009E82 23 04            [ 2]  508 	jrule 2$ 
      009E84 CD 84 CD         [ 4]  509 	call FC_XON
      009E87 81               [ 4]  510 	ret ; bad address 
      009E88                        511 2$:	
      009E88 CD 9C 97         [ 4]  512 	call UNLKEE 
      009E8B 20 03            [ 2]  513 	jra proceed_erase
                                    514 ; erase flash block:
      009E8D                        515 erase_flash:
      009E8D CD 9C B6         [ 4]  516 	call UNLKFL 
      009E90                        517 proceed_erase:
      009E90 CD 8C E6         [ 4]  518 	call PAD 
      009E93 90 93            [ 1]  519 	ldw y,x
      009E95 90 FE            [ 2]  520 	ldw y,(y)
      009E97 1C 00 02         [ 2]  521 	addw x,#CELLL  
      009E9A 90 FD            [ 4]  522 	call (y) 
      009E9C 72 17 50 5F      [ 1]  523 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009EA0 CD 84 CD         [ 4]  524 	call FC_XON
      009EA3 81               [ 4]  525 	ret 
                                    526 
                                    527 ; this routine is to be copied to PAD 
      009EA4                        528 row_erase_proc:
      009EA4 35 20 50 5B      [ 1]  529 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009EA8 35 DF 50 5C      [ 1]  530 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009EAC 4F               [ 1]  531 	clr a 
      009EAD 90 5F            [ 1]  532 	clrw y 
      009EAF 91 A7 00 34      [ 1]  533 	ldf ([FPTR],y),a
      009EB3 90 5C            [ 1]  534     incw y
      009EB5 91 A7 00 34      [ 1]  535 	ldf ([FPTR],y),a
      009EB9 90 5C            [ 1]  536     incw y
      009EBB 91 A7 00 34      [ 1]  537 	ldf ([FPTR],y),a
      009EBF 90 5C            [ 1]  538     incw y
      009EC1 91 A7 00 34      [ 1]  539 	ldf ([FPTR],y),a
      009EC5 72 05 50 5F FB   [ 2]  540 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009ECA 81               [ 4]  541 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009ECB                        542 row_erase_proc_end:
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
      009ECB                        555 copy_buffer:
      009ECB 4B 80            [ 1]  556 	push #BLOCK_SIZE  
                                    557 ;enable block programming 
      009ECD 72 10 50 5B      [ 1]  558 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009ED1 72 11 50 5C      [ 1]  559 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009ED5 90 5F            [ 1]  560 	clrw y
      009ED7 F6               [ 1]  561 1$:	ld a,(x)
      009ED8 91 A7 00 34      [ 1]  562 	ldf ([FPTR],y),a
      009EDC 5C               [ 1]  563 	incw x 
      009EDD 90 5C            [ 1]  564 	incw y 
      009EDF 0A 01            [ 1]  565 	dec (BCNT,sp)
      009EE1 26 F4            [ 1]  566 	jrne 1$
                                    567 ; wait EOP bit 
      009EE3 72 05 50 5F FB   [ 2]  568 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009EE8 84               [ 1]  569 	pop a ; remove BCNT from stack 
      009EE9 81               [ 4]  570 	ret 
      009EEA                        571 copy_buffer_end:
                                    572 
                                    573 ;-------------------------
                                    574 ; move program_row to RAM 
                                    575 ; in TIB 
                                    576 ;------------------------
      009EEA                        577 copy_prog_to_ram:
      009EEA 1D 00 06         [ 2]  578 	subw x,#6
      009EED 90 AE 9E CB      [ 2]  579 	ldw y,#copy_buffer 
      009EF1 EF 04            [ 2]  580 	ldw (4,x),y 
      009EF3 90 AE 17 00      [ 2]  581 	ldw y,#TIBBASE
      009EF7 EF 02            [ 2]  582 	ldw (2,x),y 
      009EF9 90 AE 9E EA      [ 2]  583 	ldw y,#copy_buffer_end 
      009EFD 72 A2 9E CB      [ 2]  584 	subw y,#copy_buffer  
      009F01 FF               [ 2]  585 	ldw (x),y 
      009F02 CD 8D 22         [ 4]  586 	call CMOVE 
      009F05 81               [ 4]  587 	ret 
                                    588 
                                    589 
                                    590 ;-----------------------------
                                    591 ; write a row in FLASH/EEPROM 
                                    592 ; WR-ROW ( a ud -- )
                                    593 ; a -> address 128 byte buffer to write 
                                    594 ; ud ->  row address in FLASH|EEPROM 
                                    595 ;-----------------------------
      009F06 9E 41                  596 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                           001E88   597 	LINK=.
      009F08 06                     598 	.byte 6 
      009F09 57 52 2D 52 4F 57      599 	.ascii "WR-ROW"
      009F0F                        600 write_row:
      009F0F CD 84 E3         [ 4]  601 	call FC_XOFF
      009F12 CD 9B 97         [ 4]  602 	call FPSTOR
                                    603 ; align to FLASH block 
      009F15 A6 80            [ 1]  604 	ld a,#0x80 
      009F17 B4 36            [ 1]  605 	and a,PTR8 
      009F19 B7 36            [ 1]  606 	ld PTR8,a  
      009F1B CD 9E EA         [ 4]  607 	call copy_prog_to_ram
      009F1E CD 9C D5         [ 4]  608 	call UNLOCK
      009F21 90 93            [ 1]  609 	ldw y,x 
      009F23 90 FE            [ 2]  610 	ldw y,(y)
      009F25 1C 00 02         [ 2]  611 	addw x,#CELLL 
      009F28 89               [ 2]  612 	pushw x 
      009F29 93               [ 1]  613 	ldw x,y ; buffer address in x 
      009F2A CD 17 00         [ 4]  614 	call TIBBASE
      009F2D CD 9C FD         [ 4]  615 	call LOCK
      009F30 85               [ 2]  616 	popw x 
      009F31 CD 84 CD         [ 4]  617 	call FC_XON 
      009F34 81               [ 4]  618 	ret 
                                    619 
                                    620 ;-------------------------------------
                                    621 ; change value of OPTION register 
                                    622 ; SET-OPT (c n -- ) 
                                    623 ; c new value.
                                    624 ; n OPT  number {1..7}
                                    625 ;--------------------------------------
      009F35 9F 08                  626 		.word LINK 
                           001EB7   627 		LINK=.
      009F37 07                     628 		.byte 7 
      009F38 53 45 54 2D 4F 50 54   629 		.ascii "SET-OPT" 
      009F3F                        630 set_option: 
      009F3F 90 93            [ 1]  631 		ldw y,x 
      009F41 90 FE            [ 2]  632 		ldw y,(y)
      009F43 27 06            [ 1]  633 		jreq 1$
      009F45 90 A3 00 07      [ 2]  634 		cpw y,#7 
      009F49 23 04            [ 2]  635 		jrule 2$ 
                                    636 ; invalid OPTION number 		
      009F4B 1C 00 04         [ 2]  637 1$:		addw x,#2*CELLL
      009F4E 81               [ 4]  638 		ret
      009F4F 90 58            [ 2]  639 2$:		sllw y 
      009F51 72 A9 47 FF      [ 2]  640 		addw y,#OPTION_BASE-1
      009F55 FF               [ 2]  641 		ldw (x),y 
      009F56 1D 00 02         [ 2]  642 		subw x,#CELLL 
      009F59 90 5F            [ 1]  643 		clrw y 
      009F5B FF               [ 2]  644 		ldw (x),y 
      009F5C CD 9D D5         [ 4]  645 		call EECSTORE
      009F5F 81               [ 4]  646 		ret 
                                    647 
                                    648 
                                    649 
                                    650 ;--------------------------------------
                                    651 ; reset system to its original state 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                    652 ; before any user modification
                                    653 ; PRISTINE ( -- )
                                    654 ;-------------------------------------
      009F60 9F 37                  655 	.word LINK  
                           001EE2   656 	LINK=.
      009F62 08                     657 	.byte 8 
      009F63 50 52 49 53 54 49 4E   658 	.ascii "PRISTINE"
             45
      009F6B                        659 pristine:
                                    660 ;;; erase EEPROM
      009F6B CD 9B B6         [ 4]  661 	call EEPROM 
      009F6E CD 88 48         [ 4]  662 1$:	call DDUP 
      009F71 CD 9E 4B         [ 4]  663 	call row_erase
      009F74 90 93            [ 1]  664 	ldw y,x 
      009F76 90 EE 02         [ 2]  665 	ldw y,(2,y)
      009F79 72 A9 00 80      [ 2]  666 	addw y,#BLOCK_SIZE
      009F7D EF 02            [ 2]  667 	ldw (2,x),y
      009F7F 90 A3 48 00      [ 2]  668 	cpw y,#OPTION_BASE 
      009F83 25 E9            [ 1]  669 	jrult 1$
                                    670 ;;; reset OPTION to default values
      009F85 90 AE 00 01      [ 2]  671 	ldw y,#1 ; OPT1 
      009F89 FF               [ 2]  672 2$:	ldw (x),y   
      009F8A 90 5F            [ 1]  673 	clrw y 
      009F8C EF 02            [ 2]  674 	ldw (2,x),y  ; ( 0 1 -- ) 
      009F8E CD 88 48         [ 4]  675 	call DDUP    ; ( 0 1 0 1 -- )  
      009F91 CD 9F 3F         [ 4]  676 	call set_option
      009F94 90 93            [ 1]  677 	ldw y,x 
      009F96 90 FE            [ 2]  678 	ldw y,(y)
      009F98 90 5C            [ 1]  679 	incw y  ; next OPTION 
      009F9A 90 A3 00 08      [ 2]  680 	cpw y,#8 
      009F9E 25 E9            [ 1]  681 	jrult 2$
                                    682 ;;; erase first row of app_space 	
      009FA0 90 AE B4 00      [ 2]  683 	ldw y,#app_space
      009FA4 EF 02            [ 2]  684 	ldw (2,x),y  
      009FA6 90 5F            [ 1]  685 	clrw y 
      009FA8 FF               [ 2]  686 	ldw (x),y ; ( app_space 0 -- )
      009FA9 CD 9E 4B         [ 4]  687 	call row_erase 
                                    688 ; reset interrupt vectors 
      009FAC 1D 00 02         [ 2]  689 	subw x,#CELLL 
      009FAF 90 5F            [ 1]  690 	clrw y  
      009FB1 FF               [ 2]  691 4$:	ldw (x),y  ; ( n -- ) int# 
      009FB2 CD 86 2E         [ 4]  692 	call DUPP  
      009FB5 CD 9F D2         [ 4]  693 	call reset_vector
      009FB8 90 93            [ 1]  694 	ldw y,x 
      009FBA 90 FE            [ 2]  695 	ldw y,(y)
      009FBC 90 5C            [ 1]  696 	incw y   ; next vector 
      009FBE 90 A3 00 19      [ 2]  697 	cpw y,#25 
      009FC2 25 ED            [ 1]  698 	jrult 4$
      009FC4 CC 80 80         [ 2]  699 	jp NonHandledInterrupt ; reset MCU
                                    700 
                                    701 ;------------------------------
                                    702 ; reset an interrupt vector 
                                    703 ; to its initial value 
                                    704 ; i.e. NonHandledInterrupt
                                    705 ; RST-IVEC ( n -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                    706 ;-----------------------------
      009FC7 9F 62                  707 	.word LINK 
                           001F49   708 	LINK=. 
      009FC9 08                     709 	.byte 8 
      009FCA 52 53 54 2D 49 56 45   710 	.ascii "RST-IVEC"
             43
      009FD2                        711 reset_vector:
      009FD2 90 93            [ 1]  712 	ldw y,x
      009FD4 1C 00 02         [ 2]  713 	addw x,#CELLL 
      009FD7 90 FE            [ 2]  714 	ldw y,(y)
      009FD9 90 A3 00 17      [ 2]  715 	cpw y,#23 
      009FDD 27 3A            [ 1]  716 	jreq 9$
      009FDF 90 A3 00 1D      [ 2]  717 	cpw y,#29 ; last vector
      009FE3 22 34            [ 1]  718 	jrugt 9$  
      009FE5 90 58            [ 2]  719 	sllw y 
      009FE7 90 58            [ 2]  720 	sllw y 
      009FE9 72 A9 80 08      [ 2]  721 	addw y,#0x8008 ; irq0 address 
      009FED 90 BF 26         [ 2]  722 	ldw YTEMP,y
      009FF0 1D 00 06         [ 2]  723 	subw x,#3*CELLL 
      009FF3 EF 02            [ 2]  724 	ldw (2,x),y 
      009FF5 90 5F            [ 1]  725 	clrw y
      009FF7 FF               [ 2]  726 	ldw (x),y 
      009FF8 A6 82            [ 1]  727 	ld a,#0x82 
      009FFA 90 95            [ 1]  728 	ld yh,a
      009FFC EF 04            [ 2]  729 	ldw (4,x),y
      009FFE CD 9E 21         [ 4]  730 	call EESTORE
      00A001 1D 00 06         [ 2]  731 	subw x,#3*CELLL
      00A004 90 5F            [ 1]  732 	clrw y 
      00A006 FF               [ 2]  733 	ldw (x),y 
      00A007 90 AE 80 80      [ 2]  734 	ldw y,#NonHandledInterrupt
      00A00B EF 04            [ 2]  735 	ldw (4,x),y 
      00A00D 90 BE 26         [ 2]  736 	ldw y,YTEMP  
      00A010 72 A9 00 02      [ 2]  737 	addw y,#2
      00A014 EF 02            [ 2]  738 	ldw (2,x),y 
      00A016 CD 9E 21         [ 4]  739 	call EESTORE
      00A019 81               [ 4]  740 9$:	ret 
                                    741 
                                    742 
                                    743 ;------------------------------
                                    744 ; all interrupt vector with 
                                    745 ; an address >= a are resetted 
                                    746 ; to default
                                    747 ; CHKIVEC ( a -- )
                                    748 ;------------------------------
      00A01A 9F C9                  749 	.word LINK 
                           001F9C   750 	LINK=.
      00A01C 07                     751 	.byte 7
      00A01D 43 48 4B 49 56 45 43   752 	.ascii "CHKIVEC"
                                    753 ;local variables 
                           000001   754 	SSP=1
                           000003   755 	CADR=3
                           000005   756 	OFS=5
                           000006   757 	VSIZE=6  
      00A024                        758 CHKIVEC:
      00A024 52 06            [ 2]  759 	sub sp,#VSIZE ;alloc local variables 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      00A026 90 93            [ 1]  760 	ldw y,x 
      00A028 90 FE            [ 2]  761 	ldw y,(y)
      00A02A 17 03            [ 2]  762 	ldw (CADR,sp),y ; ca 
      00A02C 1F 01            [ 2]  763 	ldw (SSP,sp),x 
      00A02E AE 80 0A         [ 2]  764 	ldw x,#0x800a ; irq0 address 
      00A031 BF 35            [ 2]  765 	ldw PTR16,X
      00A033 AE FF FC         [ 2]  766 	ldw x,#-4 
      00A036 1C 00 04         [ 2]  767 1$:	addw x,#4
      00A039 A3 00 78         [ 2]  768 	cpw x,#30*4 ; irq0-29 
      00A03C 27 22            [ 1]  769 	jreq 9$
      00A03E 90 93            [ 1]  770 	ldw y,x  
      00A040 91 D6 35         [ 4]  771 	ld a,([PTR16],y)
      00A043 11 03            [ 1]  772 	cp a,(CADR,sp)
      00A045 25 EF            [ 1]  773 	jrult 1$
      00A047 90 5C            [ 1]  774 	incw y 
      00A049 91 D6 35         [ 4]  775 	ld a,([PTR16],y)
      00A04C 11 04            [ 1]  776 	cp a,(CADR+1,sp) 
      00A04E 25 E6            [ 1]  777 	jrult 1$ 
      00A050 1F 05            [ 2]  778 	ldw (OFS,sp),x 
      00A052 54               [ 2]  779 	srlw x
      00A053 54               [ 2]  780 	srlw x 
      00A054 90 93            [ 1]  781 	ldw y,x 
      00A056 1E 01            [ 2]  782 	ldw x,(SSP,sp)
      00A058 FF               [ 2]  783 	ldw (x),y
      00A059 CD 9F D2         [ 4]  784 	call reset_vector
      00A05C 1E 05            [ 2]  785 	ldw x,(OFS,sp) 
      00A05E 20 D6            [ 2]  786 	jra 1$
      00A060 1E 01            [ 2]  787 9$:	ldw x,(SSP,sp) 
      00A062 1C 00 02         [ 2]  788 	addw x,#CELLL 
      00A065 5B 06            [ 2]  789 	addw sp,#VSIZE ; drop local variables  
      00A067 81               [ 4]  790 	ret 
                                    791 
                                    792 ;------------------------------
                                    793 ; set interrupt vector 
                                    794 ; SET-IVEC ( ud n -- )
                                    795 ;  ud Handler address
                                    796 ;  n  vector # 0 .. 29 
                                    797 ;-----------------------------
      00A068 A0 1C                  798 	.word LINK
                           001FEA   799 	LINK=.
      00A06A 08                     800 	.byte 8 
      00A06B 53 45 54 2D 49 56 45   801 	.ascii "SET-IVEC" 
             43
      00A073                        802 set_vector:
      00A073 90 93            [ 1]  803     ldw y,x 
      00A075 1C 00 02         [ 2]  804 	addw x,#CELLL 
      00A078 90 FE            [ 2]  805 	ldw y,(y) ; vector #
      00A07A 90 A3 00 1D      [ 2]  806 	cpw y,#29 ; last vector
      00A07E 23 04            [ 2]  807 	jrule 2$
      00A080 1C 00 04         [ 2]  808 	addw x,#2*CELLL 
      00A083 81               [ 4]  809 	ret
      00A084 90 58            [ 2]  810 2$:	sllw y 
      00A086 90 58            [ 2]  811 	sllw y 
      00A088 72 A9 80 08      [ 2]  812 	addw y,#0X8008 ; IRQ0 vector address 
      00A08C 90 BF 26         [ 2]  813 	ldw YTEMP,y ; vector address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      00A08F A6 82            [ 1]  814 	ld a,#0x82 
      00A091 90 95            [ 1]  815 	ld yh,a 
      00A093 E6 01            [ 1]  816 	ld a,(1,x) ; isr address bits 23..16 
      00A095 90 97            [ 1]  817 	ld yl,a 
                                    818 ;  write 0x82 + most significant byte of int address	
      00A097 1D 00 06         [ 2]  819 	subw x,#3*CELLL 
      00A09A EF 04            [ 2]  820 	ldw (4,x),y 
      00A09C 90 BE 26         [ 2]  821 	ldw y,YTEMP
      00A09F EF 02            [ 2]  822 	ldw (2,x),y ; vector address 
      00A0A1 90 5F            [ 1]  823 	clrw y 
      00A0A3 FF               [ 2]  824 	ldw (x),y   ; as a double 
      00A0A4 CD 9E 21         [ 4]  825 	call EESTORE 
      00A0A7 90 93            [ 1]  826 	ldw y,x 
      00A0A9 90 EE 02         [ 2]  827 	ldw y,(2,y) ; bits 15..0 int vector 
      00A0AC 1D 00 06         [ 2]  828 	subw x,#3*CELLL 
      00A0AF EF 04            [ 2]  829 	ldw (4,x),y 
      00A0B1 90 BE 26         [ 2]  830 	ldw y,YTEMP 
      00A0B4 72 A9 00 02      [ 2]  831 	addw y,#2 
      00A0B8 EF 02            [ 2]  832 	ldw (2,x),y 
      00A0BA 90 5F            [ 1]  833 	clrw y 
      00A0BC FF               [ 2]  834 	ldw (x),y 
      00A0BD CD 9E 21         [ 4]  835 	call EESTORE
      00A0C0 1C 00 04         [ 2]  836 	addw x,#2*CELLL  
      00A0C3 81               [ 4]  837 9$: ret 
                                    838 
                                    839 
                                    840 ;------------------------
                                    841 ; Compile word to flash
                                    842 ; EE, (w -- )
                                    843 ;-----------------------
      00A0C4 A0 6A                  844 	.word LINK
                           002046   845 	LINK=.
      00A0C6 03                     846 	.byte 3
      00A0C7 45 45 2C               847 	.ascii "EE,"
      00A0CA                        848 EE_COMMA:
      00A0CA 1D 00 04         [ 2]  849 	subw x,#2*CELLL 
      00A0CD 90 BE 1A         [ 2]  850 	ldw y,UCP
      00A0D0 90 89            [ 2]  851 	pushw y 
      00A0D2 EF 02            [ 2]  852 	ldw (2,x),y 
      00A0D4 90 5F            [ 1]  853 	clrw y 
      00A0D6 FF               [ 2]  854 	ldw (x),y
      00A0D7 CD 9E 21         [ 4]  855 	call EESTORE
      00A0DA 90 85            [ 2]  856 	popw y 
      00A0DC 72 A9 00 02      [ 2]  857 	addw y,#2
      00A0E0 90 BF 1A         [ 2]  858 	ldw UCP,y
      00A0E3 81               [ 4]  859 	ret 
                                    860 
                                    861 
                                    862 ;-------------------------
                                    863 ; Compile byte to flash 
                                    864 ; EEC, ( c -- )	
                                    865 ;-------------------------
      00A0E4 A0 C6                  866 	.word LINK 
                           002066   867 	LINK=.
      00A0E6 04                     868 	.byte 4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      00A0E7 45 45 43 2C            869 	.ascii "EEC,"
      00A0EB                        870 EE_CCOMMA:
      00A0EB 1D 00 04         [ 2]  871 	subw x,#2*CELLL 
      00A0EE 90 BE 1A         [ 2]  872 	ldw y,UCP
      00A0F1 90 89            [ 2]  873 	pushw y 
      00A0F3 EF 02            [ 2]  874 	ldw (2,x),y 
      00A0F5 90 5F            [ 1]  875 	clrw y 
      00A0F7 FF               [ 2]  876 	ldw (x),y
      00A0F8 CD 9D D5         [ 4]  877 	call EECSTORE
      00A0FB 90 85            [ 2]  878 	popw y 
      00A0FD 90 5C            [ 1]  879 	incw y 
      00A0FF 90 BF 1A         [ 2]  880 	ldw UCP,y
      00A102 81               [ 4]  881 	ret 
                                    882 
                                    883 
                                    884 ;--------------------------
                                    885 ; copy FLASH block to ROWBUF
                                    886 ; ROW>BUF ( ud -- )
                                    887 ;--------------------------
      00A103 A0 E6                  888 	.word LINK 
                           002085   889 	LINK=.
      00A105 07                     890 	.byte 7 
      00A106 52 4F 57 3E 42 55 46   891 	.ascii "ROW>BUF"
      00A10D                        892 ROW2BUF: 
      00A10D CD 9B 97         [ 4]  893 	call FPSTOR 
      00A110 A6 80            [ 1]  894 	ld a,#BLOCK_SIZE
      00A112 88               [ 1]  895 	push a 
      00A113 B4 36            [ 1]  896 	and a,PTR8 ; block align 
      00A115 B7 36            [ 1]  897 	ld PTR8,a
      00A117 90 AE 16 80      [ 2]  898 	ldw y,#ROWBUFF 
      00A11B 92 BC 00 34      [ 5]  899 1$: ldf a,[FPTR]
      00A11F 90 F7            [ 1]  900 	ld (y),a
      00A121 CD 9D 11         [ 4]  901 	call INC_FPTR
      00A124 90 5C            [ 1]  902 	incw y 
      00A126 0A 01            [ 1]  903 	dec (1,sp)
      00A128 26 F1            [ 1]  904 	jrne 1$ 
      00A12A 84               [ 1]  905 	pop a 
      00A12B 81               [ 4]  906 	ret 
                                    907 
                                    908 
                                    909 ;---------------------------
                                    910 ; copy ROWBUFF to flash 
                                    911 ; BUF>ROW ( ud -- )
                                    912 ; ud is row address as double 
                                    913 ;---------------------------
      00A12C A1 05                  914 	.word LINK 
                           0020AE   915 	LINK=.
      00A12E 07                     916 	.byte 7 
      00A12F 42 55 46 3E 52 4F 57   917 	.ascii "BUF>ROW" 
      00A136                        918 BUF2ROW:
      00A136 CD 87 3C         [ 4]  919 	call TBUF ; ( ud rb -- )
      00A139 CD 87 FC         [ 4]  920 	call ROT 
      00A13C CD 87 FC         [ 4]  921 	call ROT  ; ( rb ud -- )
      00A13F CD 9F 0F         [ 4]  922 	call write_row 
      00A142 81               [ 4]  923 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



                                    924 
                                    925 ;---------------------------------
                                    926 ; how many byte free in that row 
                                    927 ; RFREE ( a -- n )
                                    928 ; a is least byte of target address
                                    929 ;----------------------------------
      00A143 A1 2E                  930 	.word LINK 
                           0020C5   931 	LINK=.
      00A145 05                     932 	.byte 5 
      00A146 52 46 52 45 45         933 	.ascii "RFREE"
      00A14B                        934 RFREE:
      00A14B E6 01            [ 1]  935 	ld a,(1,x)
      00A14D A4 7F            [ 1]  936 	and a,#BLOCK_SIZE-1 
      00A14F B7 26            [ 1]  937 	ld YTEMP,a 
      00A151 A6 80            [ 1]  938 	ld a,#BLOCK_SIZE 
      00A153 B0 26            [ 1]  939 	sub a,YTEMP 
      00A155 90 5F            [ 1]  940 	clrw y 
      00A157 90 97            [ 1]  941 	ld yl,a
      00A159 FF               [ 2]  942 	ldw (x),y 
      00A15A 81               [ 4]  943 	ret 
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
      00A15B A1 45                  954 	.word LINK 
                           0020DD   955 	LINK=. 
      00A15D 06                     956 	.byte 6
      00A15E 52 41 4D 3E 45 45      957 	.ascii "RAM>EE"
                                    958 	
      00A164                        959 RAM2EE:
                                    960 ; copy ud on top 
      00A164 90 93            [ 1]  961 	ldw y,x 
      00A166 90 EE 06         [ 2]  962 	ldw y,(6,y) ; LSW of ud  
      00A169 90 BF 26         [ 2]  963 	ldw YTEMP,y 
      00A16C 90 93            [ 1]  964 	ldw y,x 
      00A16E 90 EE 04         [ 2]  965 	ldw y,(4,y)  ; MSW of ud 
      00A171 1D 00 04         [ 2]  966 	subw x,#2*CELLL 
      00A174 FF               [ 2]  967 	ldw (x),y 
      00A175 90 BE 26         [ 2]  968 	ldw y,YTEMP 
      00A178 EF 02            [ 2]  969 	ldw (2,x),y 
      00A17A CD A1 0D         [ 4]  970 	call ROW2BUF 
      00A17D 90 93            [ 1]  971 	ldw y,x 
      00A17F 90 EE 06         [ 2]  972 	ldw y,(6,y)
      00A182 90 89            [ 2]  973 	pushw y ; udl 
      00A184 90 9F            [ 1]  974 	ld a,yl
      00A186 A4 7F            [ 1]  975 	and a,#BLOCK_SIZE-1 
      00A188 90 5F            [ 1]  976 	clrw y 
      00A18A 90 97            [ 1]  977 	ld yl,a 
      00A18C 72 A9 16 80      [ 2]  978 	addw y,#ROWBUFF 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      00A190 1D 00 02         [ 2]  979 	subw x,#CELLL 
      00A193 FF               [ 2]  980 	ldw (x),y  
      00A194 CD 86 3E         [ 4]  981 	call SWAPP ;  ( ud a ra u -- )
      00A197 CD 85 D8         [ 4]  982 	call RFROM  
      00A19A CD A1 4B         [ 4]  983 	call RFREE 
      00A19D CD 89 B6         [ 4]  984 	call MIN
      00A1A0 CD 86 2E         [ 4]  985 	call DUPP 
      00A1A3 CD 85 F7         [ 4]  986 	call TOR  
      00A1A6 CD 8D 22         [ 4]  987 	call CMOVE
      00A1A9 CD A1 36         [ 4]  988 	call BUF2ROW 
      00A1AC CD 85 D8         [ 4]  989 	call RFROM 
      00A1AF 81               [ 4]  990 	ret 
                                    991 
                                    992 
                                    993 ;--------------------------
                                    994 ; expand 16 bit address 
                                    995 ; to 32 bit address 
                                    996 ; FADDR ( a -- ud )
                                    997 ;--------------------------
      00A1B0 A1 5D                  998 	.word LINK 
                           002132   999 	LINK=. 
      00A1B2 05                    1000 	.byte 5 
      00A1B3 46 41 44 44 52        1001 	.ascii "FADDR"
      00A1B8                       1002 FADDR:
      00A1B8 CC 8B E7         [ 2] 1003 	jp ZERO 
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
      00A1BB A1 B2                 1019 	.word LINK 
                           00213D  1020 	LINK=.
      00A1BD 05                    1021 	.byte 5 
      00A1BE 46 4D 4F 56 45        1022 	.ascii "FMOVE" 
      00A1C3                       1023 FMOVE:
      00A1C3 CD 87 4E         [ 4] 1024 	call TFLASH 
      00A1C6 CD 85 87         [ 4] 1025 	CALL AT 
      00A1C9 CD 85 24         [ 4] 1026 	CALL QBRAN 
      00A1CC A2 47                 1027 	.word no_move  
      00A1CE CD 87 9D         [ 4] 1028 	call CPP
      00A1D1 CD 85 87         [ 4] 1029 	call AT  
      00A1D4 CD 86 2E         [ 4] 1030 	call DUPP ; ( udl udl -- )
      00A1D7 CD 87 81         [ 4] 1031 	call CNTXT 
      00A1DA CD 85 87         [ 4] 1032 	call AT 
      00A1DD CD 84 F1         [ 4] 1033 	call DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      00A1E0 00 02                 1034 	.word 2 
      00A1E2 CD 88 D6         [ 4] 1035 	call SUBB ; ( udl udl a -- )
      00A1E5 CD 86 3E         [ 4] 1036 	call SWAPP 
      00A1E8 CD A1 B8         [ 4] 1037 	call FADDR 
      00A1EB CD 87 FC         [ 4] 1038 	call ROT  ; ( udl ud a -- )
      00A1EE CD 86 2E         [ 4] 1039 	call DUPP 
      00A1F1 CD 85 F7         [ 4] 1040 	call TOR    ; R: a 
      00A1F4                       1041 FMOVE2: 
      00A1F4 CD 8C D5         [ 4] 1042 	call HERE 
      00A1F7 CD 85 EB         [ 4] 1043 	call RAT 
      00A1FA CD 88 D6         [ 4] 1044 	call SUBB ; (udl ud a wl -- )
      00A1FD                       1045 next_row:
      00A1FD CD 86 2E         [ 4] 1046 	call DUPP 
      00A200 CD 85 F7         [ 4] 1047 	call TOR  ; ( udl ud a wl -- ) R: a wl
      00A203 CD A1 64         [ 4] 1048 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      00A206 CD 86 2E         [ 4] 1049 	call DUPP 
      00A209 CD 85 F7         [ 4] 1050 	call TOR
      00A20C CD 88 5D         [ 4] 1051 	call PLUS  ; ( udl+ ) 
      00A20F CD 86 2E         [ 4] 1052 	call DUPP 
      00A212 CD 8B E7         [ 4] 1053 	call ZERO   ; ( udl+ ud -- )
      00A215 CD 85 D8         [ 4] 1054 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      00A218 CD 85 D8         [ 4] 1055 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      00A21B CD 86 58         [ 4] 1056 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      00A21E CD 88 D6         [ 4] 1057 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      00A221 CD 86 2E         [ 4] 1058 	call DUPP 
      00A224 CD 85 24         [ 4] 1059 	call QBRAN
      00A227 A2 40                 1060 	.word fmove_done 
      00A229 CD 86 3E         [ 4] 1061 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      00A22C CD 85 D8         [ 4] 1062 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      00A22F CD 88 5D         [ 4] 1063 	call PLUS  ; ( udl+2 ud wl- a+ )
      00A232 CD 86 2E         [ 4] 1064 	call DUPP 
      00A235 CD 85 F7         [ 4] 1065 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      00A238 CD 86 3E         [ 4] 1066 	call SWAPP 
      00A23B CD 85 53         [ 4] 1067 	call BRAN
      00A23E A1 FD                 1068 	.word next_row  
      00A240                       1069 fmove_done:	
      00A240 CD 85 D8         [ 4] 1070 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      00A243 1C 00 0A         [ 2] 1071 	addw x,#5*CELLL ; (  -- cp+ ) new CP 
      00A246 81               [ 4] 1072  	ret  
      00A247                       1073 no_move:
      00A247 CD 8B E7         [ 4] 1074 	call ZERO
      00A24A 81               [ 4] 1075 	ret 
                                   1076 
                                   1077 ;------------------------------------------
                                   1078 ; adjust pointers after **FMOVE** operetion.
                                   1079 ; UPDAT-PTR ( cp+ -- )
                                   1080 ; cp+ is new CP position after FMOVE 
                                   1081 ;-------------------------------------------
      00A24B A1 BD                 1082 	.word LINK 
                           0021CD  1083 	LINK=.
      00A24D 09                    1084 	.byte 9
      00A24E 55 50 44 41 54 2D 50  1085 	.ascii "UPDAT-PTR" 
             54 52
      00A257                       1086 UPDATPTR:
                                   1087 ;reset VP to previous position  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      00A257 CD 9C 11         [ 4] 1088 	call EEPVP 
      00A25A CD 86 24         [ 4] 1089 	call DROP 
      00A25D CD 85 87         [ 4] 1090 	call AT
      00A260 CD 87 8F         [ 4] 1091 	call VPP 
      00A263 CD 85 70         [ 4] 1092 	call STORE
                                   1093 ;update CONTEXT and LAST 
      00A266 CD 9B FB         [ 4] 1094 	call EEPCP 
      00A269 CD 86 24         [ 4] 1095 	call DROP
      00A26C CD 85 87         [ 4] 1096 	call AT
      00A26F CD 84 F1         [ 4] 1097 	call DOLIT 
      00A272 00 02                 1098 	.word 2 
      00A274 CD 88 5D         [ 4] 1099 	call PLUS 
      00A277 CD 86 2E         [ 4] 1100 	call DUPP 
      00A27A CD 87 81         [ 4] 1101 	call CNTXT 
      00A27D CD 85 70         [ 4] 1102 	call STORE
      00A280 CD 87 AD         [ 4] 1103 	call LAST
      00A283 CD 85 70         [ 4] 1104 	call STORE 
      00A286 CD 9C 2B         [ 4] 1105 	call UPDATLAST 
                                   1106 ;update CP 
      00A289 CD 87 9D         [ 4] 1107 	call CPP 
      00A28C CD 85 70         [ 4] 1108 	call STORE
      00A28F CD 9C 54         [ 4] 1109 	call UPDATCP 
      00A292 81               [ 4] 1110 	ret 
                                   1111 
                                   1112 ;-----------------------------
                                   1113 ; move interrupt sub-routine
                                   1114 ; in flash memory
                                   1115 ;----------------------------- 
      00A293 A2 4D                 1116 	.word LINK 
                           002215  1117 	LINK=. 
      00A295 06                    1118 	.byte 6
      00A296 49 46 4D 4F 56 45     1119 	.ascii "IFMOVE" 
      00A29C                       1120 IFMOVE:
      00A29C CD 87 4E         [ 4] 1121 	call TFLASH 
      00A29F CD 85 87         [ 4] 1122 	CALL AT 
      00A2A2 CD 85 24         [ 4] 1123 	CALL QBRAN 
      00A2A5 A2 47                 1124 	.word no_move 
      00A2A7 CD 87 9D         [ 4] 1125 	call CPP 
      00A2AA CD 85 87         [ 4] 1126 	call AT 
      00A2AD CD 86 2E         [ 4] 1127 	call DUPP ; ( udl udl -- )
      00A2B0 CD 9C 11         [ 4] 1128 	call EEPVP 
      00A2B3 CD 86 24         [ 4] 1129 	call DROP
      00A2B6 CD 85 87         [ 4] 1130 	call AT  ; ( udl udl a )
      00A2B9 CD 85 F7         [ 4] 1131 	call TOR 
      00A2BC CD A1 B8         [ 4] 1132 	call FADDR
      00A2BF CD 85 EB         [ 4] 1133 	call RAT ; ( udl ud a -- ) R: a 
      00A2C2 CC A1 F4         [ 2] 1134 	jp FMOVE2 
                                   1135 
                                   1136 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                           000001  4804 .if WANT_SCALING_CONST 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                                   4805         .include "const_ratio.asm"
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
      00A2C5 A2 95                   32         .word LINK 
                           002247    33         LINK=.
      00A2C7 02                      34         .byte 2
      00A2C8 50 49                   35         .ascii "PI" 
      00A2CA                         36 PII:
      00A2CA 1D 00 04         [ 2]   37         subw x,#2*CELLL 
      00A2CD 90 AE 01 63      [ 2]   38         ldw y,#355 
      00A2D1 EF 02            [ 2]   39         ldw (2,x),y 
      00A2D3 90 AE 00 71      [ 2]   40         ldw y,#113 
      00A2D7 FF               [ 2]   41         ldw (x),y 
      00A2D8 81               [ 4]   42         ret 
                                     43 
                                     44 ;      SQRT2 ( -- 19601  13860 )
                                     45 ; precision: 1.5e-9 
                                     46 ; usage example to compute Voltage peek to peek from Vrms 
                                     47 ; : VPP SQRT2 */ 2 * ;
                                     48 ;
      00A2D9 A2 C7                   49         .word LINK 
                           00225B    50         LINK=.
      00A2DB 05                      51         .byte 5 
      00A2DC 53 51 52 54 32          52         .ascii "SQRT2" 
      00A2E1                         53 SQRT2:
      00A2E1 1D 00 04         [ 2]   54         subw x,#2*CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      00A2E4 90 AE 4C 91      [ 2]   55         ldw y,#19601 
      00A2E8 EF 02            [ 2]   56         ldw (2,x),y 
      00A2EA 90 AE 36 24      [ 2]   57         ldw y,#13860 
      00A2EE FF               [ 2]   58         ldw (x),y 
      00A2EF 81               [ 4]   59         ret 
                                     60 
                                     61 ;   SQRT3 ( -- 18817 10864 )
                                     62 ; precision: 1.1e-9
                                     63 ;
      00A2F0 A2 DB                   64         .word LINK 
                           002272    65         LINK=.
      00A2F2 05                      66         .byte 5
      00A2F3 53 51 52 54 33          67         .ascii "SQRT3" 
      00A2F8                         68 SQRT3: 
      00A2F8 1D 00 04         [ 2]   69     subw x,#2*CELLL 
      00A2FB 90 AE 49 81      [ 2]   70     ldw y,#18817 
      00A2FF EF 02            [ 2]   71     ldw (2,x),y 
      00A301 90 AE 2A 70      [ 2]   72     ldw y,#10864 
      00A305 FF               [ 2]   73     ldw (x),y 
      00A306 81               [ 4]   74     ret 
                                     75 
                                     76 ;   E ( -- 28667 10546 )
                                     77 ; precision: 5.5e-9 
                                     78 ; natural log base 
      00A307 A2 F2                   79         .word LINK 
                           002289    80         LINK=.
      00A309 01                      81         .byte 1
      00A30A 45                      82         .ascii "E" 
      00A30B                         83 ENEPER:
      00A30B 1D 00 04         [ 2]   84     subw x,#2*CELLL 
      00A30E 90 AE 6F FB      [ 2]   85     ldw y,#28667 
      00A312 EF 02            [ 2]   86     ldw (2,x),y 
      00A314 90 AE 29 32      [ 2]   87     ldw y,#10546 
      00A318 FF               [ 2]   88     ldw (x),y 
      00A319 81               [ 4]   89     ret 
                                     90 
                                     91 ;   SQRT10 ( -- 22936 7253 )
                                     92 ; precision: 5.7e-9 
      00A31A A3 09                   93         .word LINK 
                           00229C    94         LINK=.
      00A31C 06                      95         .byte 6 
      00A31D 53 51 52 54 31 30       96         .ascii "SQRT10" 
      00A323                         97 SQRT10:
      00A323 1D 00 04         [ 2]   98     subw x,#2*CELLL
      00A326 90 AE 59 98      [ 2]   99     ldw y,#22936 
      00A32A EF 02            [ 2]  100     ldw (2,x),y 
      00A32C 90 AE 1C 55      [ 2]  101     ldw y,#7253
      00A330 FF               [ 2]  102     ldw (x),y 
      00A331 81               [ 4]  103     ret 
                                    104 
                                    105 ;   12RT2 ( -- 26797 25293 )
                                    106 ; precision: 1.0e-9 
                                    107 ; used in music to compute well tempered scale
      00A332 A3 1C                  108         .word LINK 
                           0022B4   109         LINK=. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      00A334 05                     110         .byte 5 
      00A335 31 32 52 54 32         111         .ascii "12RT2"
      00A33A                        112 RT12_2:
      00A33A 1D 00 04         [ 2]  113     subw x,#2*CELLL 
      00A33D 90 AE 68 AD      [ 2]  114     ldw y,#26797
      00A341 EF 02            [ 2]  115     ldw (2,x),y 
      00A343 90 AE 62 CD      [ 2]  116     ldw y,#25293
      00A347 FF               [ 2]  117     ldw (x),y 
      00A348 81               [ 4]  118     ret 
                                    119 
                                    120 ;   LOG2s ( -- 2040 11103 )
                                    121 ; log(2)/1.6384
                                    122 ; precision: 1.1e-8
      00A349 A3 34                  123         .word LINK 
                           0022CB   124         LINK=.
      00A34B 05                     125         .byte 5 
      00A34C 4C 4F 47 32 53         126         .ascii "LOG2S" 
      00A351                        127 LOG2S:
      00A351 1D 00 04         [ 2]  128     subw x,#2*CELLL
      00A354 90 AE 07 F8      [ 2]  129     ldw y,#2040 
      00A358 EF 02            [ 2]  130     ldw (2,x),y 
      00A35A 90 AE 2B 5F      [ 2]  131     ldw y,#11103 
      00A35E FF               [ 2]  132     ldw (x),y 
      00A35F 81               [ 4]  133     ret 
                                    134 
                                    135 ;   LN2 ( -- 485 11464 )
                                    136 ; ln(2)/16.384 
                                    137 ; precision: 1.0e-7 
      00A360 A3 4B                  138         .word LINK 
                           0022E2   139         LINK=.
      00A362 04                     140         .byte 4 
      00A363 4C 4E 32 53            141         .ascii "LN2S" 
      00A367                        142 LN2S: 
      00A367 1D 00 04         [ 2]  143     subw x,#2*CELLL
      00A36A 90 AE 01 E5      [ 2]  144     ldw y,#485
      00A36E EF 02            [ 2]  145     ldw (2,x),y 
      00A370 90 AE 2C C8      [ 2]  146     ldw y,#11464 
      00A374 FF               [ 2]  147     ldw (x),y 
      00A375 81               [ 4]  148     ret 
                                    149 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



                                   4806 .endif
                           000001  4807 .if WANT_CONST_TABLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



                                   4808         .include "ctable.asm"
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
      00A376 A3 62                   32     .word LINK 
                           0022F8    33     LINK=.
      00A378 06                      34     .byte 6
      00A379 43 41 4C 4C 4F 54       35     .ascii "CALLOT"
      00A37F                         36 CALLOT:
      00A37F CD 87 9D         [ 4]   37     CALL CPP
      00A382 CD 86 2E         [ 4]   38     CALL DUPP 
      00A385 CD 85 87         [ 4]   39     CALL AT 
      00A388 CD 85 F7         [ 4]   40     CALL TOR 
      00A38B CD 8C 57         [ 4]   41     CALL PSTOR 
      00A38E CD 9C 54         [ 4]   42     CALL UPDATCP 
      00A391 CD 85 D8         [ 4]   43     CALL RFROM
      00A394 CC 8B E7         [ 2]   44     JP ZERO 
                                     45 
                                     46 ;------------------------------
                                     47 ; create constants bytes table 
                                     48 ; in persistant memory
                                     49 ;  CTABLE ( n+ -- ad ; <string> )
                                     50 ; n+ bytes reserved 
                                     51 ;-----------------------------
      00A397 A3 78                   52     .word LINK 
                           002319    53     LINK=.
      00A399 06                      54     .byte 6
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      00A39A 43 54 41 42 4C 45       55     .ascii "CTABLE"
      00A3A0                         56 CTABLE:
      00A3A0 CD A3 7F         [ 4]   57     CALL CALLOT     
      00A3A3 CC 99 56         [ 2]   58     JP DCONST 
                                     59      
                                     60 
                                     61 ;--------------------------------
                                     62 ; create constants words table 
                                     63 ; in persistant memory 
                                     64 ; WTABLE ( n+ -- ad ; <string> )
                                     65 ; n+  words reserved  
                                     66 ;--------------------------------
      00A3A6 A3 99                   67     .word LINK 
                           002328    68     LINK=.
      00A3A8 06                      69     .byte 6
      00A3A9 57 54 41 42 4C 45       70     .ascii "WTABLE"
      00A3AF                         71 WTABLE:
      00A3AF CD 8B 6E         [ 4]   72     CALL CELLS  
      00A3B2 CD A3 7F         [ 4]   73     CALL CALLOT 
      00A3B5 CC 99 56         [ 2]   74     JP DCONST 
                                     75 
                                     76 ;---------------------------------
                                     77 ; stack an element of CTABLE 
                                     78 ; CTABL@ ( u ad -- c )
                                     79 ; u element order {0..size-1}
                                     80 ; a|ad table address 
                                     81 ;--------------------------------
      00A3B8 A3 A8                   82     .word LINK 
                           00233A    83     LINK=.
      00A3BA 06                      84     .byte 6
      00A3BB 43 54 41 42 4C 40       85     .ascii "CTABL@" 
      00A3C1                         86 CTAT:
      00A3C1 CD 9B 97         [ 4]   87     call FPSTOR 
      00A3C4 CD 9D 29         [ 4]   88     call PTRPLUS 
      00A3C7 CC 9D 66         [ 2]   89     jp EE_CREAD 
                                     90 
                                     91 ;---------------------------------
                                     92 ; stack an element of WTABLE 
                                     93 ; WTABL@ ( u ud -- w )
                                     94 ; u is element order {0..size-1}
                                     95 ; a|ud table address 
                                     96 ;----------------------------------
      00A3CA A3 BA                   97     .word LINK 
                           00234C    98     LINK=.
      00A3CC 06                      99     .byte 6
      00A3CD 57 54 41 42 4C 40      100     .ascii "WTABL@" 
      00A3D3                        101 WTAT:
      00A3D3 CD 9B 97         [ 4]  102     call FPSTOR 
      00A3D6 CD 8B 6E         [ 4]  103     call CELLS 
      00A3D9 CD 9D 29         [ 4]  104     call PTRPLUS 
      00A3DC CD 9D 44         [ 4]  105     call EE_READ 
      00A3DF 81               [ 4]  106     ret 
                                    107 
                                    108 ;--------------------------
                                    109 ; tool to initialize character table 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



                                    110 ; CTINIT ( ad -- )
                                    111 ; ad is table address 
                                    112 ;--------------------------
      00A3E0 A3 CC                  113     .word LINK 
                           002362   114     LINK=.
      00A3E2 06                     115     .byte 6 
      00A3E3 43 54 49 4E 49 54      116     .ascii "CTINIT"
      00A3E9                        117 CTINIT:
      00A3E9 CD 9B 97         [ 4]  118     CALL FPSTOR
      00A3EC CD 9C D5         [ 4]  119     CALL UNLOCK
      00A3EF CD 8B E7         [ 4]  120     CALL ZERO 
      00A3F2 CD 8B 7B         [ 4]  121 1$: CALL ONEP 
      00A3F5 CD 86 2E         [ 4]  122     CALL DUPP 
      00A3F8 CD A4 45         [ 4]  123     CALL INTQ 
      00A3FB CD 85 24         [ 4]  124     CALL QBRAN 
      00A3FE A4 08                  125     .word 2$
      00A400 CD 9D 80         [ 4]  126     call WR_BYTE 
      00A403 CD 85 53         [ 4]  127     CALL BRAN 
      00A406 A3 F2                  128     .word 1$ 
      00A408 CD 88 3D         [ 4]  129 2$: CALL DDROP 
      00A40B CD 9C FD         [ 4]  130     CALL LOCK 
      00A40E 81               [ 4]  131     ret 
                                    132 
                                    133 ;--------------------------
                                    134 ; tool to initialize word table 
                                    135 ; WTINIT ( ad -- )
                                    136 ; ad is table address 
                                    137 ;--------------------------
      00A40F A3 E2                  138     .word LINK 
                           002391   139     LINK=.
      00A411 06                     140     .byte 6 
      00A412 57 54 49 4E 49 54      141     .ascii "WTINIT"
      00A418                        142 WTINIT:
      00A418 CD 9B 97         [ 4]  143     CALL FPSTOR
      00A41B CD 9C D5         [ 4]  144     CALL UNLOCK
      00A41E CD 8B E7         [ 4]  145     CALL ZERO 
      00A421 CD 8B 7B         [ 4]  146 1$: CALL ONEP 
      00A424 CD 86 2E         [ 4]  147     CALL DUPP
      00A427 CD A4 45         [ 4]  148     CALL INTQ
      00A42A CD 85 24         [ 4]  149     CALL QBRAN 
      00A42D A4 37                  150     .word 2$
      00A42F CD 9D A5         [ 4]  151     call WR_WORD 
      00A432 CD 85 53         [ 4]  152     CALL BRAN 
      00A435 A4 21                  153     .word 1$ 
      00A437 CD 88 3D         [ 4]  154 2$: CALL DDROP 
      00A43A CD 9C FD         [ 4]  155     CALL LOCK 
      00A43D 81               [ 4]  156     ret 
                                    157 
                                    158 ;------------------------
                                    159 ; Prompted input for integer 
                                    160 ; display n+ in bracket and
                                    161 ; '?' 
                                    162 ; [N]? ( n+ -- a )
                                    163 ;------------------------
      00A43E A4 11                  164     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



                           0023C0   165     LINK=.
      00A440 04                     166     .byte 4
      00A441 5B 4E 5D 3F            167     .ascii "[N]?" 
      00A445                        168 INTQ:
      00A445 CD 8F 76         [ 4]  169     CALL CR 
      00A448 CD 84 F1         [ 4]  170     call DOLIT 
      00A44B 00 5B                  171     .word '[
      00A44D CD 84 B6         [ 4]  172     CALL EMIT 
      00A450 CD 90 2F         [ 4]  173     CALL DOT 
      00A453 CD 8F B5         [ 4]  174     CALL  DOTQP
      00A456 03                     175     .byte 3
      00A457 5D 3F 20               176     .ascii "]? " 
      00A45A CD 93 BE         [ 4]  177     CALL QUERY 
      00A45D CD 91 E9         [ 4]  178     call TOKEN 
      00A460 CC A4 EE         [ 2]  179     jp NUMBQ
                                    180 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



                                   4809 .endif
                           000001  4810 .if WANT_DOUBLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



                                   4811         .include "double.asm"
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
      00A463                         11 nsign: ; a cntr -- a cntr f 
      00A463 CD 8B E7         [ 4]   12     CALL ZERO 
      00A466 CD 85 F7         [ 4]   13     CALL TOR  ; R: sign 
      00A469 CD 85 F7         [ 4]   14     CALL TOR  ; R: sign cntr 
      00A46C CD 86 2E         [ 4]   15     CALL DUPP 
      00A46F CD 85 A5         [ 4]   16     CALL CAT 
      0023F2                         17     _DOLIT '-'
      00A472 CD 84 F1         [ 4]    1     CALL DOLIT 
      00A475 00 2D                    2     .word '-' 
      00A477 CD 88 FE         [ 4]   18     CALL EQUAL 
      0023FA                         19     _QBRAN nsign1 
      00A47A CD 85 24         [ 4]    1     CALL QBRAN
      00A47D A4 94                    2     .word nsign1
      00A47F CD 8B 7B         [ 4]   20     CALL ONEP ; a+ 
      00A482 CD 85 D8         [ 4]   21     CALL RFROM 
      00A485 CD 8B 88         [ 4]   22     CALL ONEM ; cntr-
      00A488 CD 85 D8         [ 4]   23     CALL RFROM ; sign 
      00A48B CD 88 77         [ 4]   24     CALL INVER ; -1
      00A48E CD 85 F7         [ 4]   25     CALL TOR   ; R: sign 
      00A491 CD 85 F7         [ 4]   26     CALL TOR   ; R: cntr 
      00A494                         27 nsign1:
      00A494 CD 85 D8         [ 4]   28     CALL RFROM 
      00A497 CD 85 D8         [ 4]   29     CALL RFROM 
      00A49A 81               [ 4]   30     RET 
                                     31 
                                     32 
                                     33 ; get all digits in row 
                                     34 ; stop at first non-digit or end of string 
                                     35 ; ( dlo dhi a cntr -- dlo dhi [ a+ cntr- | a+ 0 ] )
      00A49B                         36 parse_digits:
      00A49B                         37 1$:
      00A49B CD 86 2E         [ 4]   38     CALL DUPP 
      00241E                         39     _QBRAN 5$ 
      00A49E CD 85 24         [ 4]    1     CALL QBRAN
      00A4A1 A4 E3                    2     .word 5$
      00A4A3 CD 85 F7         [ 4]   40     CALL TOR   ; dlo dhi a R: cntr 
      00A4A6 CD 8C BE         [ 4]   41     CALL COUNT ; dlo dhi a+ char 
      00A4A9 CD 86 FE         [ 4]   42     CALL BASE 
      00A4AC CD 85 87         [ 4]   43     CALL AT 
      00A4AF CD 8E B6         [ 4]   44     CALL DIGTQ 
      002432                         45     _QBRAN 4$ ; not a digit
      00A4B2 CD 85 24         [ 4]    1     CALL QBRAN
      00A4B5 A4 DA                    2     .word 4$
      00A4B7 CD A8 9B         [ 4]   46     CALL DTOR  ; dlo dhi R: cntr a+ c  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00A4BA CD 86 FE         [ 4]   47     CALL BASE 
      00A4BD CD 85 87         [ 4]   48     CALL AT 
      00A4C0 CD A6 D5         [ 4]   49     CALL DSSTAR
      00A4C3 CD 85 D8         [ 4]   50     CALL RFROM 
      00A4C6 CD 8B E7         [ 4]   51     CALL ZERO 
      00A4C9 CD AB 62         [ 4]   52     CALL DPLUS 
      00A4CC CD 85 D8         [ 4]   53     CALL RFROM  ; dlo dhi a+ 
      00A4CF CD 85 D8         [ 4]   54     CALL RFROM ; dlo dhi a+ cntr 
      00A4D2 CD 8B 88         [ 4]   55     CALL ONEM 
      002455                         56     _BRAN 1$ ; dlo dhi a+ R: 
      00A4D5 CD 85 53         [ 4]    1     CALL BRAN 
      00A4D8 A4 9B                    2     .word 1$ 
      00A4DA CD 86 24         [ 4]   57 4$: CALL DROP  ; dlo dhi a+ 
      00A4DD CD 8B 88         [ 4]   58     CALL ONEM  ; unget char 
      00A4E0 CD 85 D8         [ 4]   59     CALL RFROM ; dlo dhi a+ cntr-
      00A4E3                         60 5$:
      00A4E3 81               [ 4]   61     RET 
                                     62 
                                     63 
                                     64 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     65 ;   NUMBER? (a -- s -1 |d -2 | a F )
                                     66 ;   convert string to integer 
                                     67 ;   double begin with '#' 
                                     68 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002464                         69     _HEADER NUMBQ,7,"NUMBER?"
      00A4E4 A4 40                    1         .word LINK 
                           002466     2         LINK=.
      00A4E6 07                       3         .byte 7  
      00A4E7 4E 55 4D 42 45 52 3F     4         .ascii "NUMBER?"
      00A4EE                          5         NUMBQ:
                                     70 ; save current base value 
      00A4EE CD 86 FE         [ 4]   71     CALL BASE 
      00A4F1 CD 85 87         [ 4]   72     CALL AT 
      00A4F4 CD 85 F7         [ 4]   73     CALL TOR 
                                     74 ; initialize integer to 0     
      00A4F7 1D 00 04         [ 2]   75     SUBW X,#4 
      00A4FA 90 5F            [ 1]   76     CLRW Y 
      00A4FC FF               [ 2]   77     LDW (X),Y 
      00A4FD EF 02            [ 2]   78     LDW (2,X),Y ; a 0 0 R: base  
      00247F                         79     _DOLIT 2 
      00A4FF CD 84 F1         [ 4]    1     CALL DOLIT 
      00A502 00 02                    2     .word 2 
      00A504 CD 8C 40         [ 4]   80     CALL PICK  ; a 0 0 a R: base    
      00A507 CD 8C BE         [ 4]   81     CALL COUNT ; a 0 0 a+ n 
                                     82 ; check for '#' double integer 
      00A50A CD 86 58         [ 4]   83     CALL OVER  ; a 0 0 a+ n a+
      00A50D CD 85 A5         [ 4]   84     CALL CAT   ; a 0 0 a+ n c 
      002490                         85     _DOLIT '#' ; a 0 0 a+ n c '#' 
      00A510 CD 84 F1         [ 4]    1     CALL DOLIT 
      00A513 00 23                    2     .word '#' 
      00A515 CD 88 FE         [ 4]   86     CALL EQUAL 
      00A518 CD 85 F7         [ 4]   87     CALL TOR   ; a 0 0 a+ n R: base d? 
      00A51B CD 85 EB         [ 4]   88     CALL RAT   ; a 0 0 a+ n d? R: base d?
      00249E                         89     _QBRAN NUMQ0
      00A51E CD 85 24         [ 4]    1     CALL QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      00A521 A5 2F                    2     .word NUMQ0
                                     90 ; update a and count
      00A523 CD 86 3E         [ 4]   91     CALL SWAPP 
      00A526 CD 8B 7B         [ 4]   92     CALL ONEP 
      00A529 CD 86 3E         [ 4]   93     CALL SWAPP 
      00A52C CD 8B 88         [ 4]   94     CALL ONEM  ; a 0 0 a+ n- R: base d?
                                     95 ; check for '$' hexadecimal  
      00A52F                         96 NUMQ0: 
      00A52F CD 86 58         [ 4]   97     CALL OVER   
      00A532 CD 85 A5         [ 4]   98     CALL CAT   
      0024B5                         99     _DOLIT '$'
      00A535 CD 84 F1         [ 4]    1     CALL DOLIT 
      00A538 00 24                    2     .word '$' 
      00A53A CD 88 FE         [ 4]  100     CALL EQUAL ; a 0 0 a+ n- f  
      0024BD                        101     _QBRAN NUMQ1 
      00A53D CD 85 24         [ 4]    1     CALL QBRAN
      00A540 A5 51                    2     .word NUMQ1
      00A542 CD 8E 8D         [ 4]  102     CALL HEX   ; switch to hexadecimal base 
                                    103 ; update a and count 
      00A545 CD 86 3E         [ 4]  104     CALL SWAPP 
      00A548 CD 8B 7B         [ 4]  105     CALL ONEP 
      00A54B CD 86 3E         [ 4]  106     CALL SWAPP
      00A54E CD 8B 88         [ 4]  107     CALL ONEM ; a 0 0 a+ n-  R: base d?
                                    108 ; check for minus sign 
      00A551                        109 NUMQ1: 
      00A551 CD A4 63         [ 4]  110     CALL nsign 
      00A554 CD 85 F7         [ 4]  111     CALL TOR ; R: base d? sign  
                                    112 ; check for end of string     
      00A557 CD 87 EB         [ 4]  113     CALL QDUP    ; a dlo dhi a+ cntr R: base d? sign 
      0024DA                        114     _QBRAN NUMQ4 ; yes , not a number 
      00A55A CD 85 24         [ 4]    1     CALL QBRAN
      00A55D A5 9C                    2     .word NUMQ4
      00A55F CD A4 9B         [ 4]  115     CALL parse_digits
      00A562 CD 87 EB         [ 4]  116     CALL QDUP 
      00A565 CD 86 79         [ 4]  117     CALL ZEQUAL  
      0024E8                        118     _QBRAN NUMQ4 ; error not end of string  ( a dlo dhi a+ R: base d? sign )
      00A568 CD 85 24         [ 4]    1     CALL QBRAN
      00A56B A5 9C                    2     .word NUMQ4
      00A56D CD 86 24         [ 4]  119     CALL DROP  ; a dlo dhi 
      00A570 CD 85 D8         [ 4]  120     CALL RFROM  ; a dlo dhi sign 
      0024F3                        121     _QBRAN NUMQ3
      00A573 CD 85 24         [ 4]    1     CALL QBRAN
      00A576 A5 7B                    2     .word NUMQ3
      00A578 CD 88 9A         [ 4]  122     CALL DNEGA
      00A57B                        123 NUMQ3: 
      00A57B CD 87 FC         [ 4]  124     CALL ROT ; dlo dhi a  R: base d?
      00A57E CD 86 24         [ 4]  125     CALL DROP
      002501                        126     _DOLIT -2  ; double return -2 flag 
      00A581 CD 84 F1         [ 4]    1     CALL DOLIT 
      00A584 FF FE                    2     .word -2 
      00A586 CD 85 D8         [ 4]  127     CALL RFROM ; dlo dhi d? R: base 
      002509                        128     _TBRAN NUMQ8 
      00A589 CD 85 3C         [ 4]    1     CALL TBRAN 
      00A58C A5 A5                    2     .word NUMQ8 
      00A58E CD 86 3E         [ 4]  129     CALL SWAPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00A591 CD 86 24         [ 4]  130     CALL DROP
      00A594 CD 8B 7B         [ 4]  131     CALL ONEP   ; single return -1 flag   
      002517                        132     _BRAN NUMQ8
      00A597 CD 85 53         [ 4]    1     CALL BRAN 
      00A59A A5 A5                    2     .word NUMQ8 
      00A59C                        133 NUMQ4: ; not end of string error , ( a dlo dhi a+ cntr R: base d? sign )
                           000001   134 .if WANT_FLOAT
      00A59C CD 85 D8         [ 4]  135     CALL RFROM ; sign 
      00A59F CD 85 D8         [ 4]  136     CALL RFROM ; d? 
      00A5A2 CD AF 93         [ 4]  137     CALL FLOATQ ; ( a dlo dhi a+ cntr sign d? )    
                           000000   138 .else 
                                    139     ADDW X,#4 ; drop dhi a+  , ( a dlo R: base d? sign ) 
                                    140     ADDW SP,#4 ; drop d? sign  R: base 
                                    141     CLRW Y 
                                    142     LDW (X),Y ; dlo replaced by 0 ( -- a 0 R: base ) 
                                    143 .endif 
                                    144 ; restore original base value     
      00A5A5                        145 NUMQ8: 
      00A5A5 CD 85 D8         [ 4]  146     CALL RFROM 
      00A5A8 CD 86 FE         [ 4]  147     CALL BASE 
      00A5AB CD 85 70         [ 4]  148     CALL STORE 
      00A5AE 81               [ 4]  149     RET 
                                    150 
                                    151 
                                    152 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    153 ;    D0= ( d -- 0|-1 )
                                    154 ;    check if double is 0 
                                    155 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00252F                        156     _HEADER DZEQUAL,3,"D0="
      00A5AF A4 E6                    1         .word LINK 
                           002531     2         LINK=.
      00A5B1 03                       3         .byte 3  
      00A5B2 44 30 3D                 4         .ascii "D0="
      00A5B5                          5         DZEQUAL:
      00A5B5 CD 86 A1         [ 4]  157     CALL ORR 
      00A5B8 A6 FF            [ 1]  158     LD A,#0xFF
      00A5BA 90 93            [ 1]  159     LDW Y,X
      00A5BC 90 FE            [ 2]  160     LDW Y,(Y)
      00A5BE 90 A3 00 00      [ 2]  161     CPW Y,#0 
      00A5C2 27 01            [ 1]  162     JREQ  ZEQ1
      00A5C4 4F               [ 1]  163     CLR A   ;false
      00A5C5                        164 ZEQ1:
      00A5C5 F7               [ 1]  165     LD     (X),A
      00A5C6 E7 01            [ 1]  166     LD (1,X),A
      00A5C8 81               [ 4]  167 	RET     
                                    168     
                                    169 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    170 ;  2NEGATE ( d -- d )
                                    171 ;  negate double (2's complement)
                                    172 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002549                        173     _HEADER DNEGAT,7,"2NEGATE"
      00A5C9 A5 B1                    1         .word LINK 
                           00254B     2         LINK=.
      00A5CB 07                       3         .byte 7  
      00A5CC 32 4E 45 47 41 54 45     4         .ascii "2NEGATE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00A5D3                          5         DNEGAT:
      00A5D3 CD 88 77         [ 4]  174     CALL INVER
      00A5D6 CD 86 3E         [ 4]  175     CALL SWAPP 
      00A5D9 CD 88 77         [ 4]  176     CALL INVER 
      00A5DC 90 93            [ 1]  177     LDW  Y,X 
      00A5DE 90 FE            [ 2]  178     LDW Y,(Y)
      00A5E0 72 A9 00 01      [ 2]  179     ADDW Y,#1 
      00A5E4 FF               [ 2]  180     LDW (X),Y 
      00A5E5 24 0B            [ 1]  181     JRNC DNEG1 
      00A5E7 90 93            [ 1]  182     LDW Y,X 
      00A5E9 90 EE 02         [ 2]  183     LDW Y,(2,Y)
      00A5EC 72 A9 00 01      [ 2]  184     ADDW Y,#1
      00A5F0 EF 02            [ 2]  185     LDW (2,X),Y 
      00A5F2                        186 DNEG1:
      00A5F2 CD 86 3E         [ 4]  187     CALL SWAPP 
      00A5F5 81               [ 4]  188     RET      
                                    189 
                                    190 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    191 ;   DABS ( d -- d )
                                    192 ;   absolute value of double
                                    193 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002576                        194     _HEADER DABS,4,"DABS"
      00A5F6 A5 CB                    1         .word LINK 
                           002578     2         LINK=.
      00A5F8 04                       3         .byte 4  
      00A5F9 44 41 42 53              4         .ascii "DABS"
      00A5FD                          5         DABS:
      00A5FD CD 86 2E         [ 4]  195     CALL DUPP 
      00A600 CD 86 67         [ 4]  196     CALL ZLESS 
      002583                        197     _QBRAN DABS1 
      00A603 CD 85 24         [ 4]    1     CALL QBRAN
      00A606 A6 0B                    2     .word DABS1
      00A608 CD 88 9A         [ 4]  198     CALL DNEGA 
      00A60B                        199 DABS1:
      00A60B 81               [ 4]  200     RET 
                                    201 
                                    202 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    203 ;  DSIGN ( d -- d f )
                                    204 ;  sign of double 
                                    205 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00258C                        206     _HEADER DSIGN,5,"DSIGN"
      00A60C A5 F8                    1         .word LINK 
                           00258E     2         LINK=.
      00A60E 05                       3         .byte 5  
      00A60F 44 53 49 47 4E           4         .ascii "DSIGN"
      00A614                          5         DSIGN:
      00A614 A6 00            [ 1]  207     LD A,#0 
      00A616 90 93            [ 1]  208     LDW Y,X 
      00A618 90 FE            [ 2]  209     LDW Y,(Y)
      00A61A 2A 02            [ 1]  210     JRPL DSIGN1
      00A61C A6 FF            [ 1]  211     LD A,#0XFF 
      00A61E                        212 DSIGN1:
      00A61E 1D 00 02         [ 2]  213     SUBW X,#2 
      00A621 F7               [ 1]  214     LD (X),A 
      00A622 E7 01            [ 1]  215     LD (1,X),A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      00A624 81               [ 4]  216     RET 
                                    217 
                                    218 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    219 ;   D/MOD ( d s - r qd )
                                    220 ;   unsigned divide double by single 
                                    221 ;   return double quotient 
                                    222 ;   and single remainder 
                                    223 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025A5                        224     _HEADER DSLMOD,5,"D/MOD"
      00A625 A6 0E                    1         .word LINK 
                           0025A7     2         LINK=.
      00A627 05                       3         .byte 5  
      00A628 44 2F 4D 4F 44           4         .ascii "D/MOD"
      00A62D                          5         DSLMOD:
      00A62D 90 93            [ 1]  225         LDW     Y,X             ; stack pointer to Y
      00A62F FE               [ 2]  226         LDW     X,(X)           ; un
      00A630 BF 26            [ 2]  227         LDW     YTEMP,X         ; save un
      00A632 93               [ 1]  228         LDW     X,Y
      00A633 89               [ 2]  229         PUSHW   X               ; save stack pointer
      00A634 90 89            [ 2]  230         PUSHW   Y 
      00A636 EE 02            [ 2]  231         LDW     X,(2,X)           ; X=udh
      00A638 90 BE 26         [ 2]  232         LDW     Y,YTEMP         ; divisor 
      00A63B 65               [ 2]  233         DIVW    X,Y 
      00A63C BF 24            [ 2]  234         LDW     XTEMP,X         ; QUOTIENT hi 
      00A63E 93               [ 1]  235         LDW     X,Y             ; remainder in X 
      00A63F 90 85            [ 2]  236         POPW    Y 
      00A641 90 EE 04         [ 2]  237         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      00A644 A6 10            [ 1]  238         LD      A,#16           ; loop count
      00A646 90 58            [ 2]  239         SLLW    Y               ; udl shift udl into udh
      00A648                        240 DSLMOD3:
      00A648 59               [ 2]  241         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      00A649 25 04            [ 1]  242         JRC     DSLMODa         ; if carry out of rotate
      00A64B B3 26            [ 2]  243         CPW     X,YTEMP         ; compare udh to un
      00A64D 25 05            [ 1]  244         JRULT   DSLMOD4         ; can't subtract
      00A64F                        245 DSLMODa:
      00A64F 72 B0 00 26      [ 2]  246         SUBW    X,YTEMP         ; can subtract
      00A653 98               [ 1]  247         RCF
      00A654                        248 DSLMOD4:
      00A654 8C               [ 1]  249         CCF                     ; quotient bit
      00A655 90 59            [ 2]  250         RLCW    Y               ; rotate into quotient, rotate out udl
      00A657 4A               [ 1]  251         DEC     A               ; repeat
      00A658 26 EE            [ 1]  252         JRNE    DSLMOD3           ; if A == 0
      00A65A                        253 DSLMODb:
      00A65A BF 26            [ 2]  254         LDW     YTEMP,X         ; done, save remainder
      00A65C 85               [ 2]  255         POPW    X               ; restore stack pointer
      00A65D EF 02            [ 2]  256         LDW     (2,X),Y           ; save quotient low 
      00A65F 90 BE 24         [ 2]  257         LDW     Y,XTEMP         ; quotient hi 
      00A662 FF               [ 2]  258         LDW     (X),Y           ; save quotient hi 
      00A663 90 BE 26         [ 2]  259         LDW     Y,YTEMP         ; remainder onto stack
      00A666 EF 04            [ 2]  260         LDW     (4,X),Y
      00A668 81               [ 4]  261         RET 
                                    262 
                                    263 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    264 ;   D# ( d -- d )
                                    265 ;   extract least digit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



                                    266 ;   from double integer 
                                    267 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025E9                        268     _HEADER DDIG,2,"D#"
      00A669 A6 27                    1         .word LINK 
                           0025EB     2         LINK=.
      00A66B 02                       3         .byte 2  
      00A66C 44 23                    4         .ascii "D#"
      00A66E                          5         DDIG:
      00A66E CD 86 FE         [ 4]  269     CALL BASE 
      00A671 CD 85 87         [ 4]  270     CALL AT 
      00A674 CD A6 2D         [ 4]  271     CALL DSLMOD
      00A677 CD 87 FC         [ 4]  272     CALL ROT   
      00A67A CD 8D B6         [ 4]  273     CALL DIGIT 
      00A67D CD 8E 02         [ 4]  274     CALL HOLD 
      00A680 81               [ 4]  275     RET 
                                    276 
                                    277 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    278 ;    D#S ( d -- s )
                                    279 ;   extract digit from double 
                                    280 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002601                        281     _HEADER DDIGS,3,"D#S"
      00A681 A6 6B                    1         .word LINK 
                           002603     2         LINK=.
      00A683 03                       3         .byte 3  
      00A684 44 23 53                 4         .ascii "D#S"
      00A687                          5         DDIGS:
      00A687 CD A6 6E         [ 4]  282     CALL    DDIG 
      00A68A CD 88 48         [ 4]  283     CALL    DDUP 
      00A68D CD A5 B5         [ 4]  284     CALL    DZEQUAL
      002610                        285     _QBRAN  DDIGS 
      00A690 CD 85 24         [ 4]    1     CALL QBRAN
      00A693 A6 87                    2     .word DDIGS
      00A695 CD 86 24         [ 4]  286     CALL    DROP 
      00A698 81               [ 4]  287     RET 
                                    288 
                                    289 
                                    290 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    291 ;   D. ( d -- )
                                    292 ;   display double integer 
                                    293 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002619                        294     _HEADER DDOT,2,"D."
      00A699 A6 83                    1         .word LINK 
                           00261B     2         LINK=.
      00A69B 02                       3         .byte 2  
      00A69C 44 2E                    4         .ascii "D."
      00A69E                          5         DDOT:
      00A69E CD 8F 2E         [ 4]  295     CALL SPACE 
      00A6A1 CD A6 14         [ 4]  296     CALL DSIGN 
      00A6A4 CD 85 F7         [ 4]  297     CALL TOR
      00A6A7 CD 85 EB         [ 4]  298     CALL RAT 
      00262A                        299     _QBRAN DDOT0
      00A6AA CD 85 24         [ 4]    1     CALL QBRAN
      00A6AD A6 B2                    2     .word DDOT0
      00A6AF CD 88 9A         [ 4]  300     CALL DNEGA 
      00A6B2                        301 DDOT0:     
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      00A6B2 CD 8D F2         [ 4]  302     CALL BDIGS 
      00A6B5 CD A6 87         [ 4]  303     CALL DDIGS 
      00A6B8 CD 85 D8         [ 4]  304     CALL RFROM 
      00263B                        305     _QBRAN DDOT1 
      00A6BB CD 85 24         [ 4]    1     CALL QBRAN
      00A6BE A6 C8                    2     .word DDOT1
      002640                        306     _DOLIT '-' 
      00A6C0 CD 84 F1         [ 4]    1     CALL DOLIT 
      00A6C3 00 2D                    2     .word '-' 
      00A6C5 CD 8E 02         [ 4]  307     CALL HOLD 
      00A6C8                        308 DDOT1: 
      00A6C8 CD 8E 57         [ 4]  309     CALL EDIGS 
      00A6CB CD 8F 58         [ 4]  310     CALL TYPES     
      00A6CE 81               [ 4]  311     RET 
                                    312 
                                    313 
                                    314 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    315 ; multiply double by single 
                                    316 ; return double 
                                    317 ;  ( d s -- d )
                                    318 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00264F                        319     _HEADER DSSTAR,3,"DS*"
      00A6CF A6 9B                    1         .word LINK 
                           002651     2         LINK=.
      00A6D1 03                       3         .byte 3  
      00A6D2 44 53 2A                 4         .ascii "DS*"
      00A6D5                          5         DSSTAR:
                                    320 ;DSSTAR:
      00A6D5 CD 85 F7         [ 4]  321     CALL TOR
      00A6D8 CD 86 2E         [ 4]  322     CALL DUPP 
      00A6DB CD 86 67         [ 4]  323     CALL ZLESS
      00A6DE CD 86 2E         [ 4]  324     CALL DUPP 
      00A6E1 CD 85 F7         [ 4]  325     CALL TOR 
      002664                        326     _QBRAN DSSTAR1 
      00A6E4 CD 85 24         [ 4]    1     CALL QBRAN
      00A6E7 A6 EC                    2     .word DSSTAR1
      00A6E9 CD 88 9A         [ 4]  327     CALL DNEGA 
      00A6EC                        328 DSSTAR1:
      00A6EC CD 85 D8         [ 4]  329     CALL RFROM 
      00A6EF CD 88 1B         [ 4]  330     CALL NROT       
      00A6F2 CD 86 3E         [ 4]  331     CALL SWAPP 
      00A6F5 CD 85 EB         [ 4]  332     CALL RAT 
      00A6F8 CD 8A B0         [ 4]  333     CALL UMSTA
      00A6FB CD 87 FC         [ 4]  334     CALL ROT 
      00A6FE CD 85 D8         [ 4]  335     CALL RFROM 
      00A701 CD 8A B0         [ 4]  336     CALL UMSTA 
      00A704 CD 86 24         [ 4]  337     CALL DROP ; DROP OVERFLOW 
      00A707 CD 88 5D         [ 4]  338     CALL PLUS 
      00A70A CD 87 FC         [ 4]  339     CALL ROT 
      00268D                        340     _QBRAN DSSTAR3 
      00A70D CD 85 24         [ 4]    1     CALL QBRAN
      00A710 A7 15                    2     .word DSSTAR3
      00A712 CD 88 9A         [ 4]  341     CALL DNEGA 
      00A715                        342 DSSTAR3:
      00A715 81               [ 4]  343     RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



                                    344 
                                    345 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    346 ;  2SWAP ( d1 d2 -- d2 d1 )
                                    347 ;  swap double 
                                    348 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002696                        349     _HEADER DSWAP,5,"2SWAP"
      00A716 A6 D1                    1         .word LINK 
                           002698     2         LINK=.
      00A718 05                       3         .byte 5  
      00A719 32 53 57 41 50           4         .ascii "2SWAP"
      00A71E                          5         DSWAP:
      00A71E 90 93            [ 1]  350     LDW Y,X 
      00A720 90 FE            [ 2]  351     LDW Y,(Y)
      00A722 90 BF 26         [ 2]  352     LDW YTEMP,Y ; d2 hi 
      00A725 90 93            [ 1]  353     LDW Y,X 
      00A727 90 EE 02         [ 2]  354     LDW Y,(2,Y)
      00A72A 90 BF 24         [ 2]  355     LDW XTEMP,Y  ; d2 lo 
      00A72D 90 93            [ 1]  356     LDW Y,X 
      00A72F 90 EE 04         [ 2]  357     LDW Y,(4,Y)  ; d1 hi 
      00A732 FF               [ 2]  358     LDW (X),Y 
      00A733 90 93            [ 1]  359     LDW Y,X
      00A735 90 EE 06         [ 2]  360     LDW Y,(6,Y)  ; d1 lo 
      00A738 EF 02            [ 2]  361     LDW (2,X),Y
      00A73A 90 BE 26         [ 2]  362     LDW Y,YTEMP  
      00A73D EF 04            [ 2]  363     LDW (4,X),Y 
      00A73F 90 BE 24         [ 2]  364     LDW Y,XTEMP 
      00A742 EF 06            [ 2]  365     LDW (6,X),Y 
      00A744 81               [ 4]  366     RET 
                                    367 
                                    368 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    369 ;    DCLZ ( d -- u )
                                    370 ;    double count leading zeros
                                    371 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026C5                        372     _HEADER DCLZ,4,"DCLZ"
      00A745 A7 18                    1         .word LINK 
                           0026C7     2         LINK=.
      00A747 04                       3         .byte 4  
      00A748 44 43 4C 5A              4         .ascii "DCLZ"
      00A74C                          5         DCLZ:
      00A74C 4F               [ 1]  373     CLR A 
      00A74D 90 93            [ 1]  374     LDW Y,X 
      00A74F 90 FE            [ 2]  375     LDW Y,(Y)
      00A751 2B 18            [ 1]  376     JRMI DCLZ8 ; no leading zero 
      00A753 27 09            [ 1]  377     JREQ DCLZ4 ; >=16 
      00A755                        378 DCLZ1: ; <16
      00A755 90 58            [ 2]  379     SLLW Y
      00A757 4C               [ 1]  380     INC A 
      00A758 90 5D            [ 2]  381     TNZW Y 
      00A75A 2B 0F            [ 1]  382     JRMI DCLZ8
      00A75C 20 F7            [ 2]  383     JRA DCLZ1 
      00A75E                        384 DCLZ4:
      00A75E A6 10            [ 1]  385     LD A,#16 
      00A760 90 93            [ 1]  386     LDW Y,X 
      00A762 90 EE 02         [ 2]  387     LDW Y,(2,Y)
      00A765 2B 04            [ 1]  388     JRMI DCLZ8 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      00A767 26 EC            [ 1]  389     JRNE DCLZ1 
      00A769 AB 10            [ 1]  390     ADD A,#16
      00A76B                        391 DCLZ8: 
      00A76B 1C 00 02         [ 2]  392     ADDW X,#2 
      00A76E 90 5F            [ 1]  393     CLRW Y 
      00A770 90 97            [ 1]  394     LD YL,A 
      00A772 FF               [ 2]  395     LDW (X),Y 
      00A773 81               [ 4]  396     RET 
                                    397 
                                    398 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    399 ;   2<ROT ( d1 d2 d3 -- d3 d1 d2 )
                                    400 ;   rotate left doubles 
                                    401 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026F4                        402     _HEADER NDROT,5,"2<ROT"
      00A774 A7 47                    1         .word LINK 
                           0026F6     2         LINK=.
      00A776 05                       3         .byte 5  
      00A777 32 3C 52 4F 54           4         .ascii "2<ROT"
      00A77C                          5         NDROT:
                                    403 ; save d3 in temp 
      00A77C 90 93            [ 1]  404     LDW Y,X 
      00A77E 90 FE            [ 2]  405     LDW Y,(Y)
      00A780 90 BF 26         [ 2]  406     LDW YTEMP,Y  ; d3 hi 
      00A783 90 93            [ 1]  407     LDW Y,X 
      00A785 90 EE 02         [ 2]  408     LDW Y,(2,Y)
      00A788 90 BF 24         [ 2]  409     LDW XTEMP,Y  ; d3 lo 
                                    410 ; put d2 in d1 slot 
      00A78B 90 93            [ 1]  411     LDW Y,X 
      00A78D 90 EE 04         [ 2]  412     LDW Y,(4,Y) 
      00A790 FF               [ 2]  413     LDW (X),Y   ; d2 hi 
      00A791 90 93            [ 1]  414     LDW Y,X 
      00A793 90 EE 06         [ 2]  415     LDW Y,(6,Y)
      00A796 EF 02            [ 2]  416     LDW (2,X),Y ; d2 lo
                                    417 ; put d1 in d2 slot 
      00A798 90 93            [ 1]  418     LDW Y,X 
      00A79A 90 EE 08         [ 2]  419     LDW Y,(8,Y) 
      00A79D EF 04            [ 2]  420     LDW (4,X),Y ; d1 hi 
      00A79F 90 93            [ 1]  421     LDW Y,X 
      00A7A1 90 EE 0A         [ 2]  422     LDW Y,(10,Y)
      00A7A4 EF 06            [ 2]  423     LDW (6,X),Y  ; d1 lo 
                                    424 ; put d3 in d1 slot 
      00A7A6 90 BE 26         [ 2]  425     LDW Y,YTEMP 
      00A7A9 EF 08            [ 2]  426     LDW (8,X),Y  ; d3 hi 
      00A7AB 90 BE 24         [ 2]  427     LDW Y,XTEMP 
      00A7AE EF 0A            [ 2]  428     LDW (10,X),Y  ; d3 lo 
      00A7B0 81               [ 4]  429     RET 
                                    430 
                                    431 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    432 ;   2ROT ( d1 d2 d3 -- d2 d3 d1 )
                                    433 ;   rotate right doubles 
                                    434 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002731                        435     _HEADER DROT,4,"2ROT"
      00A7B1 A7 76                    1         .word LINK 
                           002733     2         LINK=.
      00A7B3 04                       3         .byte 4  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      00A7B4 32 52 4F 54              4         .ascii "2ROT"
      00A7B8                          5         DROT:
                                    436 ; save d3 in temp 
      00A7B8 90 93            [ 1]  437     LDW Y,X 
      00A7BA 90 FE            [ 2]  438     LDW Y,(Y)
      00A7BC 90 BF 26         [ 2]  439     LDW YTEMP,Y ; d3 hi 
      00A7BF 90 93            [ 1]  440     LDW Y,X 
      00A7C1 90 EE 02         [ 2]  441     LDW Y,(2,Y)
      00A7C4 90 BF 24         [ 2]  442     LDW XTEMP,Y ; d3 lo 
                                    443 ; put d1 in d3 slot 
      00A7C7 90 93            [ 1]  444     LDW Y,X 
      00A7C9 90 EE 08         [ 2]  445     LDW Y,(8,Y)
      00A7CC FF               [ 2]  446     LDW (X),Y  ; d1 hi 
      00A7CD 90 93            [ 1]  447     LDW Y,X 
      00A7CF 90 EE 0A         [ 2]  448     LDW Y,(10,Y) 
      00A7D2 EF 02            [ 2]  449     LDW (2,X),Y ; d1 lo 
                                    450 ; put d2 in d1 slot 
      00A7D4 90 93            [ 1]  451     LDW Y,X 
      00A7D6 90 EE 04         [ 2]  452     LDW Y,(4,Y) ; d2 hi 
      00A7D9 EF 08            [ 2]  453     LDW (8,X),Y 
      00A7DB 90 93            [ 1]  454     LDW Y,X 
      00A7DD 90 EE 06         [ 2]  455     LDW Y,(6,Y) ; d2 lo 
      00A7E0 EF 0A            [ 2]  456     LDW (10,X),Y 
                                    457 ; put d3 in d2 slot 
      00A7E2 90 BE 26         [ 2]  458     LDW Y,YTEMP 
      00A7E5 EF 04            [ 2]  459     LDW (4,X),Y 
      00A7E7 90 BE 24         [ 2]  460     LDW Y,XTEMP 
      00A7EA EF 06            [ 2]  461     LDW (6,X),Y 
      00A7EC 81               [ 4]  462     RET 
                                    463 
                                    464 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    465 ;   D= ( d1 d2 -- f )
                                    466 ;   d1==d2?
                                    467 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00276D                        468     _HEADER DEQUAL,2,"D="
      00A7ED A7 B3                    1         .word LINK 
                           00276F     2         LINK=.
      00A7EF 02                       3         .byte 2  
      00A7F0 44 3D                    4         .ascii "D="
      00A7F2                          5         DEQUAL:
      00A7F2 A6 00            [ 1]  469     LD A,#0 
      00A7F4 90 93            [ 1]  470     LDW Y,X 
      00A7F6 90 FE            [ 2]  471     LDW Y,(Y)
      00A7F8 E3 04            [ 2]  472     CPW Y,(4,X)
      00A7FA 26 0B            [ 1]  473     JRNE DEQU4 
      00A7FC 90 93            [ 1]  474     LDW Y,X 
      00A7FE 90 EE 02         [ 2]  475     LDW Y,(2,Y)
      00A801 E3 06            [ 2]  476     CPW Y,(6,X)
      00A803 26 02            [ 1]  477     JRNE DEQU4 
      00A805 A6 FF            [ 1]  478     LD A,#0XFF
      00A807                        479 DEQU4:
      00A807 1C 00 06         [ 2]  480     ADDW X,#6
      00A80A F7               [ 1]  481     LD (X),A 
      00A80B E7 01            [ 1]  482     LD (1,X),A 
      00A80D 81               [ 4]  483     RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



                                    484 
                                    485 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    486 ;   D> ( d1 d2 -- f )
                                    487 ;   d1>d2?
                                    488 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00278E                        489     _HEADER DGREAT,2,"D>"
      00A80E A7 EF                    1         .word LINK 
                           002790     2         LINK=.
      00A810 02                       3         .byte 2  
      00A811 44 3E                    4         .ascii "D>"
      00A813                          5         DGREAT:
      00A813 A6 FF            [ 1]  490     LD A,#0XFF 
      00A815 90 93            [ 1]  491     LDW Y,X 
      00A817 90 EE 04         [ 2]  492     LDW Y,(4,Y)  ; d1 hi 
      00A81A F3               [ 2]  493     CPW Y,(X)    ; d2 hi 
      00A81B 2C 0B            [ 1]  494     JRSGT DGREAT4 
      00A81D 90 93            [ 1]  495     LDW Y,X 
      00A81F 90 EE 06         [ 2]  496     LDW Y,(6,Y)
      00A822 E3 02            [ 2]  497     CPW Y,(2,X)
      00A824 22 02            [ 1]  498     JRUGT DGREAT4 
      00A826 A6 00            [ 1]  499     LD A,#0
      00A828                        500 DGREAT4:
      00A828 1C 00 06         [ 2]  501     ADDW X,#6
      00A82B F7               [ 1]  502     LD (X),A 
      00A82C E7 01            [ 1]  503     LD (1,X),A 
      00A82E 81               [ 4]  504     RET
                                    505 
                                    506 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    507 ;   D< ( d1 d2 -- f )
                                    508 ;   d1<d2? 
                                    509 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027AF                        510     _HEADER DLESS,2,"D<"
      00A82F A8 10                    1         .word LINK 
                           0027B1     2         LINK=.
      00A831 02                       3         .byte 2  
      00A832 44 3C                    4         .ascii "D<"
      00A834                          5         DLESS:
      00A834 CD AB 94         [ 4]  511     CALL DSUB
      0027B7                        512     _DOLIT 0 
      00A837 CD 84 F1         [ 4]    1     CALL DOLIT 
      00A83A 00 00                    2     .word 0 
      00A83C CD 88 1B         [ 4]  513     CALL NROT  
      00A83F CD A8 51         [ 4]  514     CALL DZLESS 
      0027C2                        515     _QBRAN DLESS4
      00A842 CD 85 24         [ 4]    1     CALL QBRAN
      00A845 A8 4A                    2     .word DLESS4
      00A847 CD 88 77         [ 4]  516     CALL INVER  
      00A84A                        517 DLESS4:
      00A84A 81               [ 4]  518     RET
                                    519 
                                    520 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    521 ;  D0< ( d -- f )
                                    522 ;  d<0? 
                                    523 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027CB                        524     _HEADER DZLESS,3,"D0<"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      00A84B A8 31                    1         .word LINK 
                           0027CD     2         LINK=.
      00A84D 03                       3         .byte 3  
      00A84E 44 30 3C                 4         .ascii "D0<"
      00A851                          5         DZLESS:
      00A851 A6 00            [ 1]  525     LD A,#0 
      00A853 90 93            [ 1]  526     LDW Y,X 
      00A855 90 FE            [ 2]  527     LDW Y,(Y)
      00A857 2A 02            [ 1]  528     JRPL DZLESS1 
      00A859 A6 FF            [ 1]  529     LD A,#0XFF 
      00A85B                        530 DZLESS1:
      00A85B 1C 00 02         [ 2]  531     ADDW X,#2 
      00A85E F7               [ 1]  532     LD (X),A 
      00A85F E7 01            [ 1]  533     LD (1,X),A    
      00A861 81               [ 4]  534     RET 
                                    535 
                                    536 
                                    537 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    538 ;  DCMP ( d1 d2 -- d1 d2 -1|0|1 )
                                    539 ; compare 2 doubles 
                                    540 ; keep the doubles 
                                    541 ; return flag: 
                                    542 ;    -1 if d1<d2 
                                    543 ;     0 if d1==d2
                                    544 ;     1 if d1>d2 
                                    545 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027E2                        546     _HEADER DCMP,4,"DCMP"
      00A862 A8 4D                    1         .word LINK 
                           0027E4     2         LINK=.
      00A864 04                       3         .byte 4  
      00A865 44 43 4D 50              4         .ascii "DCMP"
      00A869                          5         DCMP:
      00A869 90 93            [ 1]  547     LDW Y,X 
      00A86B 90 EE 04         [ 2]  548     LDW Y,(4,Y)
      00A86E F3               [ 2]  549     CPW Y,(X) 
      00A86F 27 04            [ 1]  550     JREQ DCMP2 
      00A871 2F 13            [ 1]  551     JRSLT DCMP_SMALL 
      00A873 20 17            [ 2]  552     JRA  DCMP_GREAT 
      00A875                        553 DCMP2:    
      00A875 90 93            [ 1]  554     LDW Y,X 
      00A877 90 EE 06         [ 2]  555     LDW Y,(6,Y)
      00A87A E3 02            [ 2]  556     CPW Y,(2,X)
      00A87C 27 04            [ 1]  557     JREQ DCMP_EQUAL  
      00A87E 25 06            [ 1]  558     JRULT DCMP_SMALL 
      00A880 20 0A            [ 2]  559     JRA DCMP_GREAT
      00A882                        560 DCMP_EQUAL:
      00A882 90 5F            [ 1]  561     CLRW Y 
      00A884 20 0A            [ 2]  562     JRA DCMP4 
      00A886                        563 DCMP_SMALL:
      00A886 90 AE FF FF      [ 2]  564     LDW Y,#-1 
      00A88A 20 04            [ 2]  565     JRA DCMP4 
      00A88C                        566 DCMP_GREAT:
      00A88C 90 AE 00 01      [ 2]  567     LDW Y,#1
      00A890                        568 DCMP4:
      00A890 1D 00 02         [ 2]  569     SUBW X,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      00A893 FF               [ 2]  570     LDW (X),Y 
      00A894 81               [ 4]  571     RET
                                    572 
                                    573 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    574 ;   2>R ( d -- R: d )
                                    575 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002815                        576     _HEADER DTOR,3,"2>R"
      00A895 A8 64                    1         .word LINK 
                           002817     2         LINK=.
      00A897 03                       3         .byte 3  
      00A898 32 3E 52                 4         .ascii "2>R"
      00A89B                          5         DTOR:
      00A89B 90 85            [ 2]  577     POPW Y 
      00A89D 90 BF 26         [ 2]  578     LDW YTEMP,Y 
      00A8A0 90 93            [ 1]  579     LDW Y,X 
      00A8A2 90 EE 02         [ 2]  580     LDW Y,(2,Y)
      00A8A5 90 89            [ 2]  581     PUSHW Y   ; d low 
      00A8A7 90 93            [ 1]  582     LDW Y,X 
      00A8A9 90 FE            [ 2]  583     LDW Y,(Y)
      00A8AB 90 89            [ 2]  584     PUSHW Y   ; d hi 
      00A8AD 1C 00 04         [ 2]  585     ADDW X,#4  
      00A8B0 92 CC 26         [ 5]  586     JP [YTEMP]
                                    587 
                                    588 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    589 ;  2R> ( -- d ) R: d --      
                                    590 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002833                        591     _HEADER DRFROM,3,"2R>"
      00A8B3 A8 97                    1         .word LINK 
                           002835     2         LINK=.
      00A8B5 03                       3         .byte 3  
      00A8B6 32 52 3E                 4         .ascii "2R>"
      00A8B9                          5         DRFROM:
      00A8B9 90 85            [ 2]  592     POPW Y      ; d hi 
      00A8BB 90 BF 26         [ 2]  593     LDW YTEMP,Y 
      00A8BE 1D 00 04         [ 2]  594     SUBW X,#4
      00A8C1 90 85            [ 2]  595     POPW Y       ; d hi 
      00A8C3 FF               [ 2]  596     LDW (X),Y 
      00A8C4 90 85            [ 2]  597     POPW Y       ; d low  
      00A8C6 EF 02            [ 2]  598     LDW (2,X),Y 
      00A8C8 92 CC 26         [ 5]  599     JP [YTEMP]
                                    600     
                                    601 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    602 ;   2R@ ( -- d )
                                    603 ;   fecth a double from RSTACK
                                    604 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00284B                        605     _HEADER DRAT,3,"2R@"
      00A8CB A8 B5                    1         .word LINK 
                           00284D     2         LINK=.
      00A8CD 03                       3         .byte 3  
      00A8CE 32 52 40                 4         .ascii "2R@"
      00A8D1                          5         DRAT:
      00A8D1 90 85            [ 2]  606     POPW Y 
      00A8D3 90 BF 26         [ 2]  607     LDW YTEMP,Y 
      00A8D6 1D 00 04         [ 2]  608     SUBW X,#4 
      00A8D9 16 01            [ 2]  609     LDW Y,(1,SP)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      00A8DB FF               [ 2]  610     LDW (X),Y 
      00A8DC 16 03            [ 2]  611     LDW Y,(3,SP)
      00A8DE EF 02            [ 2]  612     LDW (2,X),Y 
      00A8E0 92 CC 26         [ 5]  613     JP [YTEMP]
                                    614 
                                    615 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    616 ;  2VARIABLE <name> 
                                    617 ;  create a double variable 
                                    618 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002863                        619     _HEADER DVARIA,9,"2VARIABLE"
      00A8E3 A8 CD                    1         .word LINK 
                           002865     2         LINK=.
      00A8E5 09                       3         .byte 9  
      00A8E6 32 56 41 52 49 41 42     4         .ascii "2VARIABLE"
             4C 45
      00A8EF                          5         DVARIA:
      00A8EF CD 8C D5         [ 4]  620         CALL HERE
      00A8F2 CD 86 2E         [ 4]  621         CALL DUPP
      002875                        622         _DOLIT 4  
      00A8F5 CD 84 F1         [ 4]    1     CALL DOLIT 
      00A8F8 00 04                    2     .word 4 
      00A8FA CD 88 5D         [ 4]  623         CALL PLUS 
      00A8FD CD 87 8F         [ 4]  624         CALL VPP 
      00A900 CD 85 70         [ 4]  625         CALL STORE
      00A903 CD 98 BD         [ 4]  626         CALL CREAT
      00A906 CD 86 2E         [ 4]  627         CALL DUPP
      00A909 CD 95 2F         [ 4]  628         CALL COMMA
      00A90C CD 8B E7         [ 4]  629         CALL ZERO
      00A90F CD 86 58         [ 4]  630         CALL OVER 
      00A912 CD 85 70         [ 4]  631         CALL STORE 
      00A915 CD 8B E7         [ 4]  632         CALL ZERO 
      00A918 CD 86 3E         [ 4]  633         CALL SWAPP 
      00A91B CD 85 70         [ 4]  634         CALL STORE
      00A91E CD A1 C3         [ 4]  635         CALL FMOVE ; move definition to FLASH
      00A921 CD 87 EB         [ 4]  636         CALL QDUP 
      00A924 CD 85 24         [ 4]  637         CALL QBRAN 
      00A927 99 0A                  638         .word SET_RAMLAST   
      00A929 CD 9C 6B         [ 4]  639         call UPDATVP  ; don't update if variable kept in RAM.
      00A92C CD A2 57         [ 4]  640         CALL UPDATPTR
      00A92F 81               [ 4]  641         RET         
                                    642 
                                    643 
                                    644 
                                    645 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    646 ;  2LITERAL ( d -- )
                                    647 ;  compile double literal 
                                    648 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028B0                        649     _HEADER DLITER,IMEDD+8,"2LITERAL"
      00A930 A8 E5                    1         .word LINK 
                           0028B2     2         LINK=.
      00A932 88                       3         .byte IMEDD+8  
      00A933 32 4C 49 54 45 52 41     4         .ascii "2LITERAL"
             4C
      00A93B                          5         DLITER:
      00A93B CD 95 74         [ 4]  650     CALL COMPI 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      00A93E A9 46                  651     .word do2lit 
      00A940 CD 95 2F         [ 4]  652     CALL COMMA 
      00A943 CC 95 2F         [ 2]  653     JP   COMMA 
                                    654 
                                    655 
                                    656 ; runtime for 2LITERAL 
      00A946                        657 do2lit:
      00A946 1D 00 04         [ 2]  658     SUBW X,#4 
      00A949 16 01            [ 2]  659     LDW Y,(1,SP)
      00A94B 90 FE            [ 2]  660     LDW Y,(Y)
      00A94D FF               [ 2]  661     LDW (X),Y 
      00A94E 16 01            [ 2]  662     LDW Y,(1,SP)
      00A950 90 EE 02         [ 2]  663     LDW Y,(2,Y)
      00A953 EF 02            [ 2]  664     LDW (2,X),Y 
      00A955 90 85            [ 2]  665     POPW Y 
      00A957 90 EC 04         [ 2]  666     JP (4,Y)
                                    667 
                                    668 
                                    669 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    670 ;   2OVER ( d1 d2 -- d1 d2 d1 )
                                    671 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028DA                        672     _HEADER DOVER,5,"2OVER"
      00A95A A9 32                    1         .word LINK 
                           0028DC     2         LINK=.
      00A95C 05                       3         .byte 5  
      00A95D 32 4F 56 45 52           4         .ascii "2OVER"
      00A962                          5         DOVER:
      00A962 90 93            [ 1]  673     LDW Y,X 
      00A964 1D 00 04         [ 2]  674     SUBW X,#4 
      00A967 90 89            [ 2]  675     PUSHW Y 
      00A969 90 EE 04         [ 2]  676     LDW Y,(4,Y)  ; d1 hi 
      00A96C FF               [ 2]  677     LDW (X),Y 
      00A96D 90 85            [ 2]  678     POPW Y 
      00A96F 90 EE 06         [ 2]  679     LDW Y,(6,Y)  ;d1 lo 
      00A972 EF 02            [ 2]  680     LDW (2,X),Y 
      00A974 81               [ 4]  681     RET 
                                    682 
                                    683 
                                    684 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    685 ;   D2/ ( d -- d/2 )
                                    686 ;   divide double by 2 
                                    687 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028F5                        688     _HEADER D2SLASH,3,"D2/"
      00A975 A9 5C                    1         .word LINK 
                           0028F7     2         LINK=.
      00A977 03                       3         .byte 3  
      00A978 44 32 2F                 4         .ascii "D2/"
      00A97B                          5         D2SLASH:
      00A97B 90 93            [ 1]  689     LDW Y,X 
      00A97D 90 FE            [ 2]  690     LDW Y,(Y)
      00A97F 90 57            [ 2]  691     SRAW Y 
      00A981 FF               [ 2]  692     LDW (X),Y 
      00A982 90 93            [ 1]  693     LDW Y,X 
      00A984 90 EE 02         [ 2]  694     LDW Y,(2,Y)
      00A987 90 56            [ 2]  695     RRCW Y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      00A989 EF 02            [ 2]  696     LDW (2,X),Y 
      00A98B 81               [ 4]  697     RET
                                    698 
                                    699 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    700 ;  D2* ( d -- d*2 )
                                    701 ;  multiply double by 2 
                                    702 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00290C                        703     _HEADER D2STAR,3,"D2*"
      00A98C A9 77                    1         .word LINK 
                           00290E     2         LINK=.
      00A98E 03                       3         .byte 3  
      00A98F 44 32 2A                 4         .ascii "D2*"
      00A992                          5         D2STAR:
      00A992 90 93            [ 1]  704     LDW Y,X 
      00A994 90 EE 02         [ 2]  705     LDW Y,(2,Y)
      00A997 98               [ 1]  706     RCF 
      00A998 90 59            [ 2]  707     RLCW Y 
      00A99A EF 02            [ 2]  708     LDW (2,X),Y 
      00A99C 90 93            [ 1]  709     LDW Y,X 
      00A99E 90 FE            [ 2]  710     LDW Y,(Y)
      00A9A0 90 59            [ 2]  711     RLCW Y 
      00A9A2 FF               [ 2]  712     LDW (X),Y 
      00A9A3 81               [ 4]  713     RET 
                                    714 
                                    715 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    716 ;   DLSHIFT ( d n -- d )
                                    717 ;   left shift double 
                                    718 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002924                        719     _HEADER DLSHIFT,7,"DLSHIFT"
      00A9A4 A9 8E                    1         .word LINK 
                           002926     2         LINK=.
      00A9A6 07                       3         .byte 7  
      00A9A7 44 4C 53 48 49 46 54     4         .ascii "DLSHIFT"
      00A9AE                          5         DLSHIFT:
      00A9AE E6 01            [ 1]  720     LD A,(1,X) ; shift count 
      00A9B0 1C 00 02         [ 2]  721     ADDW X,#2 
      00A9B3 90 93            [ 1]  722     LDW Y,X 
      00A9B5 90 FE            [ 2]  723     LDW Y,(Y)
      00A9B7 90 BF 26         [ 2]  724     LDW YTEMP,Y  ; d hi 
      00A9BA 90 93            [ 1]  725     LDW Y,X 
      00A9BC 90 EE 02         [ 2]  726     LDW Y,(2,Y)  ; d low 
      00A9BF                        727 DLSHIFT1:
      00A9BF 4D               [ 1]  728     TNZ A 
      00A9C0 27 12            [ 1]  729     JREQ DLSHIFT2 
      00A9C2 98               [ 1]  730     RCF 
      00A9C3 90 59            [ 2]  731     RLCW Y 
      00A9C5 90 89            [ 2]  732     PUSHW Y 
      00A9C7 90 BE 26         [ 2]  733     LDW Y,YTEMP 
      00A9CA 90 59            [ 2]  734     RLCW Y 
      00A9CC 90 BF 26         [ 2]  735     LDW YTEMP,Y 
      00A9CF 90 85            [ 2]  736     POPW Y 
      00A9D1 4A               [ 1]  737     DEC A 
      00A9D2 20 EB            [ 2]  738     JRA DLSHIFT1 
      00A9D4                        739 DLSHIFT2:
      00A9D4 EF 02            [ 2]  740     LDW (2,X),Y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      00A9D6 90 BE 26         [ 2]  741     LDW Y,YTEMP 
      00A9D9 FF               [ 2]  742     LDW (X),Y 
      00A9DA 81               [ 4]  743     RET 
                                    744 
                                    745 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    746 ;  DRSHIFT ( d n -- d )
                                    747 ;  shift right n bits 
                                    748 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00295B                        749     _HEADER DRSHIFT,7,"DRSHIFT"
      00A9DB A9 A6                    1         .word LINK 
                           00295D     2         LINK=.
      00A9DD 07                       3         .byte 7  
      00A9DE 44 52 53 48 49 46 54     4         .ascii "DRSHIFT"
      00A9E5                          5         DRSHIFT:
      00A9E5 E6 01            [ 1]  750     LD A,(1,X)
      00A9E7 A4 1F            [ 1]  751     AND A,#0X1F 
      00A9E9 1C 00 02         [ 2]  752     ADDW X,#2 
      00A9EC                        753 DRSHIFT1:
      00A9EC 4D               [ 1]  754     TNZ A 
      00A9ED 27 13            [ 1]  755     JREQ DRSHIFT2 
      00A9EF 90 93            [ 1]  756     LDW Y,X 
      00A9F1 90 FE            [ 2]  757     LDW Y,(Y)
      00A9F3 90 57            [ 2]  758     SRAW Y 
      00A9F5 FF               [ 2]  759     LDW (X),Y 
      00A9F6 90 93            [ 1]  760     LDW Y,X 
      00A9F8 90 EE 02         [ 2]  761     LDW Y,(2,Y)
      00A9FB 90 56            [ 2]  762     RRCW Y 
      00A9FD EF 02            [ 2]  763     LDW (2,X),Y 
      00A9FF 4A               [ 1]  764     DEC A
      00AA00 20 EA            [ 2]  765     JRA DRSHIFT1  
      00AA02                        766 DRSHIFT2:
      00AA02 81               [ 4]  767     RET 
                                    768 
                                    769 
                                    770 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    771 ;   D* ( d1 d2 -- d3 )
                                    772 ;   double product 
                                    773 ;   
                                    774 ;   d3 = d1 * d2
                                    775 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002983                        776     _HEADER DSTAR,2,"D*"
      00AA03 A9 DD                    1         .word LINK 
                           002985     2         LINK=.
      00AA05 02                       3         .byte 2  
      00AA06 44 2A                    4         .ascii "D*"
      00AA08                          5         DSTAR:
      00AA08 CD 86 2E         [ 4]  777     CALL DUPP 
      00AA0B CD 86 67         [ 4]  778     CALL ZLESS  
      00AA0E CD 85 F7         [ 4]  779     CALL TOR    ; R: d2sign 
      00AA11 CD A5 FD         [ 4]  780     CALL DABS   
      00AA14 CD 85 D8         [ 4]  781     CALL RFROM 
      00AA17 CD 88 1B         [ 4]  782     CALL NROT  ; d1 d2s ud2
      00AA1A CD A8 9B         [ 4]  783     CALL DTOR  ; d1 d2s R: ud2  
      00AA1D CD 85 F7         [ 4]  784     CALL TOR   ; d1 R: ud2 d2s   
      00AA20 CD 86 2E         [ 4]  785     CALL DUPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      00AA23 CD 86 67         [ 4]  786     CALL ZLESS 
      00AA26 CD 85 D8         [ 4]  787     CALL RFROM 
      00AA29 CD 86 B6         [ 4]  788     CALL XORR   
      00AA2C CD 85 F7         [ 4]  789     CALL TOR   ; d1 R: ud2 prod_sign  
      00AA2F CD A5 FD         [ 4]  790     CALL DABS ; ud1 R: ud2 ps  
      00AA32 CD 85 D8         [ 4]  791     CALL RFROM  
      00AA35 CD 88 1B         [ 4]  792     CALL NROT   ; ps ud1 
      00AA38 CD 88 48         [ 4]  793     CALL DDUP   ; ps ud1 ud1  
      00AA3B CD 85 D8         [ 4]  794     CALL RFROM  ; ps ud1 ud1 ud2hi 
      00AA3E CD A6 D5         [ 4]  795     CALL DSSTAR ; ps ud1 dprodhi 
                                    796 ; shift partial product 16 bits left 
      00AA41 CD 86 24         [ 4]  797     CALL DROP   ; drop overflow 
      00AA44 CD 8B E7         [ 4]  798     CALL ZERO   ; ps ud1 prodhi 
      00AA47 CD 86 3E         [ 4]  799     CALL SWAPP  
      00AA4A CD A7 1E         [ 4]  800     CALL DSWAP  ; ps dprodhi ud1 
      00AA4D CD 85 D8         [ 4]  801     CALL RFROM  ; ps dprodhi ud1 ud2lo
      00AA50 CD A6 D5         [ 4]  802     CALL DSSTAR ; ps  dprodhi dprodlo 
      00AA53 CD AB 62         [ 4]  803     CALL DPLUS
      00AA56 CD 87 FC         [ 4]  804     CALL ROT    ; dprod ps 
      0029D9                        805     _QBRAN DDSTAR3 
      00AA59 CD 85 24         [ 4]    1     CALL QBRAN
      00AA5C AA 61                    2     .word DDSTAR3
      00AA5E CD 88 9A         [ 4]  806     CALL DNEGA 
      00AA61                        807 DDSTAR3:  
      00AA61 81               [ 4]  808     RET 
                                    809 
                                    810 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    811 ;   DD/MOD  ( d1 d2 -- dr dq )
                                    812 ;   double division dq=d1/d2
                                    813 ;   dr remainder double 
                                    814 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0029E2                        815     _HEADER DDSLMOD,6,"DD/MOD"  
      00AA62 AA 05                    1         .word LINK 
                           0029E4     2         LINK=.
      00AA64 06                       3         .byte 6  
      00AA65 44 44 2F 4D 4F 44        4         .ascii "DD/MOD"
      00AA6B                          5         DDSLMOD:
      0029EB                        816     _DOLIT 0 
      00AA6B CD 84 F1         [ 4]    1     CALL DOLIT 
      00AA6E 00 00                    2     .word 0 
      00AA70 CD 85 F7         [ 4]  817     CALL TOR   ; R: sign 
      00AA73 90 93            [ 1]  818     LDW Y,X     
      00AA75 90 FE            [ 2]  819     LDW Y,(Y)
      00AA77 2A 0C            [ 1]  820     JRPL DSLA1
      00AA79 CD 88 9A         [ 4]  821     CALL DNEGA  ; ud2 
      00AA7C CD 85 D8         [ 4]  822     CALL RFROM 
      00AA7F CD 88 77         [ 4]  823     CALL INVER 
      00AA82 CD 85 F7         [ 4]  824     CALL TOR  ; sign inverted 
      00AA85                        825 DSLA1:
      002A05                        826     _DOLIT 2 
      00AA85 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AA88 00 02                    2     .word 2 
      00AA8A CD 8C 40         [ 4]  827     CALL PICK 
      00AA8D CD 86 67         [ 4]  828     CALL ZLESS 
      002A10                        829     _QBRAN DSLA2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      00AA90 CD 85 24         [ 4]    1     CALL QBRAN
      00AA93 AA A7                    2     .word DSLA2
      00AA95 CD A7 1E         [ 4]  830     CALL DSWAP 
      00AA98 CD 88 9A         [ 4]  831     CALL DNEGA  ; ud1 
      00AA9B CD A7 1E         [ 4]  832     CALL DSWAP  ; ud1 ud2 ( divident divisor )     
      00AA9E CD 85 D8         [ 4]  833     CALL RFROM 
      00AAA1 CD 88 77         [ 4]  834     CALL INVER 
      00AAA4 CD 85 F7         [ 4]  835     CALL TOR   ;  sign inverted again 
      00AAA7                        836 DSLA2:
                                    837 ; unsigned double division 
      00AAA7 CD 8B E7         [ 4]  838     CALL ZERO 
      00AAAA CD 8B E7         [ 4]  839     CALL ZERO
      00AAAD CD A8 9B         [ 4]  840     CALL DTOR ; quotient  R: sign qlo qhi 
      00AAB0 CD A9 62         [ 4]  841     CALL DOVER 
      00AAB3 CD A7 4C         [ 4]  842     CALL DCLZ ; n2, dividend leading zeros  
      00AAB6 CD 85 F7         [ 4]  843     CALL TOR 
      00AAB9 CD 88 48         [ 4]  844     CALL DDUP    
      00AABC CD A7 4C         [ 4]  845     CALL DCLZ  ; n1, divisor leading zeros
      00AABF CD 85 D8         [ 4]  846     CALL RFROM ; n1 n2 
      00AAC2 CD 88 D6         [ 4]  847     CALL SUBB
      00AAC5 CD 86 2E         [ 4]  848     CALL DUPP   
      00AAC8 CD 86 67         [ 4]  849     CALL ZLESS 
      002A4B                        850     _TBRAN DSLA7 ; quotient is null 
      00AACB CD 85 3C         [ 4]    1     CALL TBRAN 
      00AACE AB 3E                    2     .word DSLA7 
      00AAD0 CD 86 2E         [ 4]  851     CALL DUPP 
      00AAD3 CD 85 F7         [ 4]  852     CALL TOR    ; loop counter 
      00AAD6 CD 86 2E         [ 4]  853     CALL DUPP 
      00AAD9 CD 85 F7         [ 4]  854     CALL TOR    ; need to copies 
      00AADC CD 87 EB         [ 4]  855     CALL QDUP 
      002A5F                        856     _QBRAN DSLA3
      00AADF CD 85 24         [ 4]    1     CALL QBRAN
      00AAE2 AA E7                    2     .word DSLA3
      00AAE4 CD A9 AE         [ 4]  857     CALL DLSHIFT ; align divisor with dividend 
      00AAE7                        858 DSLA3: ; division loop -- dividend divisor  
      00AAE7 90 5F            [ 1]  859     CLRW Y 
      00AAE9 90 89            [ 2]  860     PUSHW Y  
      00AAEB CD A9 62         [ 4]  861     CALL DOVER 
      00AAEE CD A9 62         [ 4]  862     CALL DOVER 
      00AAF1 CD A8 34         [ 4]  863     CALL DLESS 
      002A74                        864     _TBRAN DSLA4 
      00AAF4 CD 85 3C         [ 4]    1     CALL TBRAN 
      00AAF7 AB 0D                    2     .word DSLA4 
      00AAF9 90 85            [ 2]  865     POPW Y 
      00AAFB 72 A9 00 01      [ 2]  866     ADDW Y,#1 
      00AAFF 90 89            [ 2]  867     PUSHW Y    ; quotiend least bit 
      00AB01 CD 88 48         [ 4]  868     CALL DDUP  ; dividend divisor divisor 
      00AB04 CD A8 9B         [ 4]  869     CALL DTOR  
      00AB07 CD AB 94         [ 4]  870     CALL DSUB  ; dividend-divisor 
      00AB0A CD A8 B9         [ 4]  871     CALL DRFROM  ; dividend- divisor  
      00AB0D                        872 DSLA4: ; shift quotient and add 1 bit 
      00AB0D 90 85            [ 2]  873     POPW Y 
      00AB0F 90 BF 26         [ 2]  874     LDW YTEMP,Y 
      00AB12 16 07            [ 2]  875     LDW Y,(7,SP) ; quotient low 
      00AB14 98               [ 1]  876     RCF 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      00AB15 90 59            [ 2]  877     RLCW Y
      00AB17 17 07            [ 2]  878     LDW (7,SP),Y 
      00AB19 16 05            [ 2]  879     LDW Y,(5,SP) ; quotient hi 
      00AB1B 90 59            [ 2]  880     RLCW Y 
      00AB1D 17 05            [ 2]  881     LDW (5,SP),Y 
      00AB1F 16 07            [ 2]  882     LDW Y,(7,SP) 
      00AB21 72 B9 00 26      [ 2]  883     ADDW Y,YTEMP
      00AB25 17 07            [ 2]  884     LDW (7,SP),Y 
      00AB27 16 01            [ 2]  885     LDW Y,(1,SP) ; loop counter 
      00AB29 90 5D            [ 2]  886     TNZW Y 
      00AB2B 27 14            [ 1]  887     JREQ DSLA8
      00AB2D 72 A2 00 01      [ 2]  888     SUBW Y,#1  
      00AB31 17 01            [ 2]  889     LDW (1,SP),Y  
                                    890 ; shift dividend left 1 bit      
      00AB33 CD A7 1E         [ 4]  891     CALL DSWAP 
      00AB36 CD A9 92         [ 4]  892     CALL D2STAR 
      00AB39 CD A7 1E         [ 4]  893     CALL DSWAP 
      00AB3C 20 A9            [ 2]  894     JRA DSLA3 
      00AB3E                        895 DSLA7:
      00AB3E 1C 00 02         [ 2]  896     ADDW X,#2 ; drop shift count  
      00AB41                        897 DSLA8:
      00AB41 1C 00 04         [ 2]  898     ADDW X,#4 ; drop divisor
      00AB44 CD 85 D8         [ 4]  899     CALL RFROM
      00AB47 CD 86 24         [ 4]  900     CALL DROP   ; loop counter 
      00AB4A CD 85 D8         [ 4]  901     CALL RFROM   ; shift count
      00AB4D CD A9 E5         [ 4]  902     CALL DRSHIFT 
                                    903     ; quotient replace dividend 
      00AB50 CD A8 B9         [ 4]  904     CALL DRFROM  ; quotient 
      00AB53 90 85            [ 2]  905     POPW Y ; sign 
      00AB55 90 5D            [ 2]  906     TNZW Y 
      00AB57 27 03            [ 1]  907     JREQ DSLA9 
      00AB59 CD 88 9A         [ 4]  908     CALL DNEGA ; remainder quotient 
      00AB5C                        909 DSLA9: 
      00AB5C 81               [ 4]  910     RET 
                                    911 
                                    912 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    913 ;   D+ ( d1 d2 -- d3 )
                                    914 ;   add 2 doubles 
                                    915 ;   d3=d1+d2 
                                    916 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002ADD                        917     _HEADER DPLUS,2,"D+"
      00AB5D AA 64                    1         .word LINK 
                           002ADF     2         LINK=.
      00AB5F 02                       3         .byte 2  
      00AB60 44 2B                    4         .ascii "D+"
      00AB62                          5         DPLUS:
      00AB62 90 93            [ 1]  918     LDW Y,X 
      00AB64 90 FE            [ 2]  919     LDW Y,(Y)
      00AB66 90 BF 26         [ 2]  920     LDW YTEMP,Y ; d2 hi 
      00AB69 90 93            [ 1]  921     LDW Y,X 
      00AB6B 90 EE 02         [ 2]  922     LDW Y,(2,Y)
      00AB6E 90 BF 24         [ 2]  923     LDW XTEMP,Y ; d2 lo 
      00AB71 1C 00 04         [ 2]  924     ADDW X,#4 
      00AB74 90 93            [ 1]  925     LDW Y,X 
      00AB76 90 EE 02         [ 2]  926     LDW Y,(2,Y) ; d1 lo
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      00AB79 72 B9 00 24      [ 2]  927     ADDW Y,XTEMP
      00AB7D EF 02            [ 2]  928     LDW (2,X),Y 
      00AB7F 90 93            [ 1]  929     LDW Y,X 
      00AB81 90 FE            [ 2]  930     LDW Y,(Y) ; d1 hi 
      00AB83 24 04            [ 1]  931     JRNC DPLUS1 
      00AB85 72 A9 00 01      [ 2]  932     ADDW Y,#1 
      00AB89                        933 DPLUS1: 
      00AB89 72 B9 00 26      [ 2]  934     ADDW Y,YTEMP 
      00AB8D FF               [ 2]  935     LDW (X),Y 
      00AB8E 81               [ 4]  936     RET 
                                    937 
                                    938 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    939 ;   D- ( d1 d2 -- d3 )
                                    940 ;   d3=d1-d2 
                                    941 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B0F                        942     _HEADER DSUB,2,"D-"
      00AB8F AB 5F                    1         .word LINK 
                           002B11     2         LINK=.
      00AB91 02                       3         .byte 2  
      00AB92 44 2D                    4         .ascii "D-"
      00AB94                          5         DSUB:
      00AB94 90 93            [ 1]  943     LDW Y,X 
      00AB96 90 FE            [ 2]  944     LDW Y,(Y)
      00AB98 90 BF 26         [ 2]  945     LDW YTEMP,Y ; d2 hi 
      00AB9B 90 93            [ 1]  946     LDW Y,X 
      00AB9D 90 EE 02         [ 2]  947     LDW Y,(2,Y)
      00ABA0 90 BF 24         [ 2]  948     LDW XTEMP,Y ; d2 lo 
      00ABA3 1C 00 04         [ 2]  949     ADDW X,#4 
      00ABA6 90 93            [ 1]  950     LDW Y,X 
      00ABA8 90 EE 02         [ 2]  951     LDW Y,(2,Y) ; d1 lo
      00ABAB 72 B2 00 24      [ 2]  952     SUBW Y,XTEMP
      00ABAF EF 02            [ 2]  953     LDW (2,X),Y 
      00ABB1 90 93            [ 1]  954     LDW Y,X 
      00ABB3 90 FE            [ 2]  955     LDW Y,(Y) ; d1 hi 
      00ABB5 24 04            [ 1]  956     JRNC DSUB1 
      00ABB7 72 A2 00 01      [ 2]  957     SUBW Y,#1 
      00ABBB                        958 DSUB1: 
      00ABBB 72 B2 00 26      [ 2]  959     SUBW Y,YTEMP 
      00ABBF FF               [ 2]  960     LDW (X),Y 
      00ABC0 81               [ 4]  961     RET 
                                    962 
                                    963 
                                    964 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    965 ;    ILOG ( ud base -- n )
                                    966 ;    integer part of double in base 
                                    967 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B41                        968     _HEADER ILOG,4,"ILOG"
      00ABC1 AB 91                    1         .word LINK 
                           002B43     2         LINK=.
      00ABC3 04                       3         .byte 4  
      00ABC4 49 4C 4F 47              4         .ascii "ILOG"
      00ABC8                          5         ILOG:
      002B48                        969     _DOLIT 0 
      00ABC8 CD 84 F1         [ 4]    1     CALL DOLIT 
      00ABCB 00 00                    2     .word 0 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      00ABCD CD 85 F7         [ 4]  970     CALL TOR 
      00ABD0 CD 88 1B         [ 4]  971     CALL NROT 
      00ABD3                        972 ILOG1: 
      002B53                        973     _DOLIT 2 
      00ABD3 CD 84 F1         [ 4]    1     CALL DOLIT 
      00ABD6 00 02                    2     .word 2 
      00ABD8 CD 8C 40         [ 4]  974     CALL PICK 
      00ABDB CD A6 2D         [ 4]  975     CALL DSLMOD 
      00ABDE CD 87 FC         [ 4]  976     CALL ROT 
      00ABE1 CD 86 24         [ 4]  977     CALL DROP 
      00ABE4 CD 88 48         [ 4]  978     CALL DDUP
      00ABE7 CD A5 B5         [ 4]  979     CALL DZEQUAL 
      002B6A                        980     _TBRAN ILOG2
      00ABEA CD 85 3C         [ 4]    1     CALL TBRAN 
      00ABED AB FD                    2     .word ILOG2 
      00ABEF CD 85 D8         [ 4]  981     CALL RFROM 
      00ABF2 CD 8B 7B         [ 4]  982     CALL ONEP 
      00ABF5 CD 85 F7         [ 4]  983     CALL TOR 
      002B78                        984     _BRAN ILOG1 
      00ABF8 CD 85 53         [ 4]    1     CALL BRAN 
      00ABFB AB D3                    2     .word ILOG1 
      00ABFD                        985 ILOG2:
      00ABFD CD 88 3D         [ 4]  986     CALL DDROP 
      00AC00 CD 86 24         [ 4]  987     CALL DROP 
      00AC03 CD 85 D8         [ 4]  988     CALL RFROM 
      00AC06 81               [ 4]  989     RET 
                                    990 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



                                   4812 .endif 
                           000001  4813 .if WANT_FLOAT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



                                   4814         .include "float.asm"
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
                           7FFFFF    36     MAX_MANTISSA = 0x7FFFFF 
                                     37 
                                     38 ;-------------------------
                                     39 ;    FPSW ( -- a )
                                     40 ;    floating state variable
                                     41 ;    bit 0 zero flag 
                                     42 ;    bit 1 negative flag 
                                     43 ;    bit 2 overflow/error flag 
                                     44 ;---------------------------
      002B87                         45     _HEADER FPSW,4,"FPSW"
      00AC07 AB C3                    1         .word LINK 
                           002B89     2         LINK=.
      00AC09 04                       3         .byte 4  
      00AC0A 46 50 53 57              4         .ascii "FPSW"
      00AC0E                          5         FPSW:
      00AC0E 90 AE 00 08      [ 2]   46 	LDW Y,#UFPSW  
      00AC12 1D 00 02         [ 2]   47 	SUBW X,#2
      00AC15 FF               [ 2]   48     LDW (X),Y
      00AC16 81               [ 4]   49     RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



                                     50 
                                     51 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     52 ;   FRESET ( -- )
                                     53 ;   reset FPSW variable 
                                     54 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
      002B97                         55     _HEADER FRESET,6,"FRESET"
      00AC17 AC 09                    1         .word LINK 
                           002B99     2         LINK=.
      00AC19 06                       3         .byte 6  
      00AC1A 46 52 45 53 45 54        4         .ascii "FRESET"
      00AC20                          5         FRESET:
      002BA0                         56     _DOLIT 0 
      00AC20 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AC23 00 00                    2     .word 0 
      00AC25 CD AC 0E         [ 4]   57     CALL FPSW 
      00AC28 CD 85 70         [ 4]   58     CALL STORE 
      00AC2B 81               [ 4]   59     RET 
                                     60 
                                     61 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     62 ;   FINIT ( -- )
                                     63 ;   initialize floating point 
                                     64 ;   library 
                                     65 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BAC                         66     _HEADER FINIT,5,"FINIT"
      00AC2C AC 19                    1         .word LINK 
                           002BAE     2         LINK=.
      00AC2E 05                       3         .byte 5  
      00AC2F 46 49 4E 49 54           4         .ascii "FINIT"
      00AC34                          5         FINIT:
      00AC34 CD AC 20         [ 4]   67     CALL FRESET 
      00AC37 81               [ 4]   68     RET 
                                     69 
                                     70 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     71 ;    FER ( -- u )
                                     72 ;    return FPSW value 
                                     73 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BB8                         74     _HEADER FER,3,"FER"
      00AC38 AC 2E                    1         .word LINK 
                           002BBA     2         LINK=.
      00AC3A 03                       3         .byte 3  
      00AC3B 46 45 52                 4         .ascii "FER"
      00AC3E                          5         FER:
      00AC3E CD AC 0E         [ 4]   75     CALL FPSW 
      00AC41 CD 85 87         [ 4]   76     CALL AT 
      00AC44 81               [ 4]   77     RET 
                                     78 
                                     79 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     80 ;    FZE  ( -- z )
                                     81 ;    return FPSW zero flag 
                                     82 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BC5                         83     _HEADER FZE,3,"FZE"
      00AC45 AC 3A                    1         .word LINK 
                           002BC7     2         LINK=.
      00AC47 03                       3         .byte 3  
      00AC48 46 5A 45                 4         .ascii "FZE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      00AC4B                          5         FZE:
      00AC4B CD AC 0E         [ 4]   84     CALL FPSW
      00AC4E CD 85 87         [ 4]   85     CALL AT  
      002BD1                         86     _DOLIT 1
      00AC51 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AC54 00 01                    2     .word 1 
      00AC56 CD 86 8D         [ 4]   87     CALL ANDD 
      00AC59 81               [ 4]   88     RET 
                                     89 
                                     90 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     91 ;    FNE ( -- n )
                                     92 ;    return FPSW negative flag 
                                     93 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BDA                         94     _HEADER FNE,3,"FNE"
      00AC5A AC 47                    1         .word LINK 
                           002BDC     2         LINK=.
      00AC5C 03                       3         .byte 3  
      00AC5D 46 4E 45                 4         .ascii "FNE"
      00AC60                          5         FNE:
      00AC60 CD AC 0E         [ 4]   95     CALL FPSW 
      00AC63 CD 85 87         [ 4]   96     CALL AT 
      002BE6                         97     _DOLIT 2 
      00AC66 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AC69 00 02                    2     .word 2 
      00AC6B CD 86 8D         [ 4]   98     CALL ANDD 
      00AC6E 81               [ 4]   99     RET 
                                    100 
                                    101 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    102 ;   FOV (A -- v )
                                    103 ;   return FPSW overflow flag 
                                    104 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BEF                        105     _HEADER FOV,3,"FOV"
      00AC6F AC 5C                    1         .word LINK 
                           002BF1     2         LINK=.
      00AC71 03                       3         .byte 3  
      00AC72 46 4F 56                 4         .ascii "FOV"
      00AC75                          5         FOV:
      00AC75 CD AC 0E         [ 4]  106     CALL FPSW
      00AC78 CD 85 87         [ 4]  107     CALL AT  
      002BFB                        108     _DOLIT 4 
      00AC7B CD 84 F1         [ 4]    1     CALL DOLIT 
      00AC7E 00 04                    2     .word 4 
      00AC80 CD 86 8D         [ 4]  109     CALL ANDD 
      00AC83 81               [ 4]  110     RET 
                                    111 
                                    112 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    113 ;    SFZ ( f# -- f# )
                                    114 ;    set FPSW zero flag 
                                    115 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C04                        116     _HEADER SFZ,3,"SFZ"
      00AC84 AC 71                    1         .word LINK 
                           002C06     2         LINK=.
      00AC86 03                       3         .byte 3  
      00AC87 53 46 5A                 4         .ascii "SFZ"
      00AC8A                          5         SFZ:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      00AC8A CD 88 48         [ 4]  117     CALL DDUP 
      00AC8D CD AC 3E         [ 4]  118     CALL FER 
      002C10                        119     _DOLIT 0xfffe 
      00AC90 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AC93 FF FE                    2     .word 0xfffe 
      00AC95 CD 86 8D         [ 4]  120     CALL ANDD 
      00AC98 CD 85 F7         [ 4]  121     CALL TOR    
      002C1B                        122     _DOLIT 0x807F 
      00AC9B CD 84 F1         [ 4]    1     CALL DOLIT 
      00AC9E 80 7F                    2     .word 0x807F 
      00ACA0 CD 86 8D         [ 4]  123     CALL ANDD 
      00ACA3 CD A5 B5         [ 4]  124     CALL DZEQUAL 
      002C26                        125     _DOLIT 1 
      00ACA6 CD 84 F1         [ 4]    1     CALL DOLIT 
      00ACA9 00 01                    2     .word 1 
      00ACAB CD 86 8D         [ 4]  126     CALL ANDD 
      00ACAE CD 85 D8         [ 4]  127     CALL RFROM 
      00ACB1 CD 86 A1         [ 4]  128     CALL ORR 
      00ACB4 CD AC 0E         [ 4]  129     CALL FPSW 
      00ACB7 CD 85 70         [ 4]  130     CALL STORE 
      00ACBA 81               [ 4]  131     RET 
                                    132 
                                    133 
                                    134 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    135 ;   SFN ( f# -- f# )
                                    136 ;   set FPSW negative flag 
                                    137 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C3B                        138     _HEADER SFN,3,"SFN"
      00ACBB AC 86                    1         .word LINK 
                           002C3D     2         LINK=.
      00ACBD 03                       3         .byte 3  
      00ACBE 53 46 4E                 4         .ascii "SFN"
      00ACC1                          5         SFN:
      00ACC1 CD 86 2E         [ 4]  139     CALL DUPP  
      00ACC4 CD AC 3E         [ 4]  140     CALL FER 
      002C47                        141     _DOLIT 0xFFFD 
      00ACC7 CD 84 F1         [ 4]    1     CALL DOLIT 
      00ACCA FF FD                    2     .word 0xFFFD 
      00ACCC CD 86 8D         [ 4]  142     CALL ANDD  
      00ACCF CD 85 F7         [ 4]  143     CALL TOR 
      002C52                        144     _DOLIT 0x8000
      00ACD2 CD 84 F1         [ 4]    1     CALL DOLIT 
      00ACD5 80 00                    2     .word 0x8000 
      00ACD7 CD 86 8D         [ 4]  145     CALL ANDD
      00ACDA 90 93            [ 1]  146     LDW Y,X 
      00ACDC 90 FE            [ 2]  147     LDW Y,(Y)
      00ACDE 98               [ 1]  148     RCF 
      00ACDF 90 59            [ 2]  149     RLCW Y 
      00ACE1 90 59            [ 2]  150     RLCW Y 
      00ACE3 90 59            [ 2]  151     RLCW Y 
      00ACE5 FF               [ 2]  152     LDW (X),Y 
      00ACE6 CD 85 D8         [ 4]  153     CALL RFROM 
      00ACE9 CD 86 A1         [ 4]  154     CALL ORR 
      00ACEC CD AC 0E         [ 4]  155     CALL FPSW
      00ACEF CD 85 70         [ 4]  156     CALL STORE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      00ACF2 81               [ 4]  157     RET 
                                    158 
                                    159 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    160 ;   SFV ( -- )
                                    161 ;   set overflow flag 
                                    162 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C73                        163     _HEADER SFV,3,"SFV"
      00ACF3 AC BD                    1         .word LINK 
                           002C75     2         LINK=.
      00ACF5 03                       3         .byte 3  
      00ACF6 53 46 56                 4         .ascii "SFV"
      00ACF9                          5         SFV:
      00ACF9 CD AC 0E         [ 4]  164     CALL FPSW 
      00ACFC CD 85 87         [ 4]  165     CALL AT 
      002C7F                        166     _DOLIT 4 
      00ACFF CD 84 F1         [ 4]    1     CALL DOLIT 
      00AD02 00 04                    2     .word 4 
      00AD04 CD 86 A1         [ 4]  167     CALL ORR 
      00AD07 CD AC 0E         [ 4]  168     CALL FPSW 
      00AD0A CD 85 70         [ 4]  169     CALL STORE 
      00AD0D 81               [ 4]  170     RET 
                                    171 
                                    172 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    173 ;  @EXPONENT ( f# -- m e )
                                    174 ;  split float in mantissa/exponent 
                                    175 ;  m mantissa as a double 
                                    176 ;  e exponent as a single 
                                    177 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C8E                        178     _HEADER ATEXP,9,"@EXPONENT"             
      00AD0E AC F5                    1         .word LINK 
                           002C90     2         LINK=.
      00AD10 09                       3         .byte 9  
      00AD11 40 45 58 50 4F 4E 45     4         .ascii "@EXPONENT"
             4E 54
      00AD1A                          5         ATEXP:
      00AD1A CD AC 20         [ 4]  179     CALL FRESET
      00AD1D CD AC C1         [ 4]  180     CALL SFN
      00AD20 CD AC 8A         [ 4]  181     CALL SFZ 
      00AD23 CD 86 2E         [ 4]  182     CALL DUPP
      002CA6                        183     _DOLIT 0X7F80 
      00AD26 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AD29 7F 80                    2     .word 0X7F80 
      00AD2B CD 86 8D         [ 4]  184     CALL ANDD 
      002CAE                        185     _DOLIT 7 
      00AD2E CD 84 F1         [ 4]    1     CALL DOLIT 
      00AD31 00 07                    2     .word 7 
      00AD33 CD 8B B5         [ 4]  186     CALL RSHIFT
      002CB6                        187     _DOLIT 127 
      00AD36 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AD39 00 7F                    2     .word 127 
      00AD3B CD 88 D6         [ 4]  188     CALL SUBB
      00AD3E CD 85 F7         [ 4]  189     CALL TOR 
      002CC1                        190     _DOLIT 0x7F
      00AD41 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AD44 00 7F                    2     .word 0x7F 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      00AD46 CD 86 8D         [ 4]  191     CALL ANDD  ; mantissa as double  
      00AD49 CD AC 60         [ 4]  192     CALL FNE 
      002CCC                        193     _QBRAN POSMANT 
      00AD4C CD 85 24         [ 4]    1     CALL QBRAN
      00AD4F AD 54                    2     .word POSMANT
      00AD51 CD A5 D3         [ 4]  194     CALL DNEGAT 
      00AD54                        195 POSMANT:
      00AD54 CD 85 D8         [ 4]  196     CALL RFROM 
      00AD57 81               [ 4]  197     RET 
                                    198 
                                    199 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    200 ;    !EXPONENT ( m e -- f# )
                                    201 ;    built float from mantissa/exponent 
                                    202 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002CD8                        203     _HEADER STEXP,9,"!EXPONENT"
      00AD58 AD 10                    1         .word LINK 
                           002CDA     2         LINK=.
      00AD5A 09                       3         .byte 9  
      00AD5B 21 45 58 50 4F 4E 45     4         .ascii "!EXPONENT"
             4E 54
      00AD64                          5         STEXP:
      00AD64 CD 86 2E         [ 4]  204     CALL DUPP 
      00AD67 CD 88 F0         [ 4]  205     CALL ABSS 
      002CEA                        206     _DOLIT 127 
      00AD6A CD 84 F1         [ 4]    1     CALL DOLIT 
      00AD6D 00 7F                    2     .word 127 
      00AD6F CD 89 5A         [ 4]  207     CALL UGREAT
      002CF2                        208     _QBRAN STEXP1
      00AD72 CD 85 24         [ 4]    1     CALL QBRAN
      00AD75 AD 7A                    2     .word STEXP1
      00AD77 CD AC F9         [ 4]  209     CALL SFV  
      00AD7A                        210 STEXP1:
      002CFA                        211     _DOLIT 127 
      00AD7A CD 84 F1         [ 4]    1     CALL DOLIT 
      00AD7D 00 7F                    2     .word 127 
      00AD7F CD 88 5D         [ 4]  212     CALL PLUS 
      002D02                        213     _DOLIT 0XFF 
      00AD82 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AD85 00 FF                    2     .word 0XFF 
      00AD87 CD 86 8D         [ 4]  214     CALL ANDD 
      002D0A                        215     _DOLIT 7 
      00AD8A CD 84 F1         [ 4]    1     CALL DOLIT 
      00AD8D 00 07                    2     .word 7 
      00AD8F CD 8B 99         [ 4]  216     CALL LSHIFT 
      00AD92 CD 85 F7         [ 4]  217     CALL TOR   ; R: e 
      00AD95 CD 86 2E         [ 4]  218     CALL DUPP 
      002D18                        219     _DOLIT 0X8000 
      00AD98 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AD9B 80 00                    2     .word 0X8000 
      00AD9D CD 86 8D         [ 4]  220     CALL ANDD 
      002D20                        221     _QBRAN STEXP2 
      00ADA0 CD 85 24         [ 4]    1     CALL QBRAN
      00ADA3 AD B6                    2     .word STEXP2
      002D25                        222     _DOLIT 0X8000 
      00ADA5 CD 84 F1         [ 4]    1     CALL DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      00ADA8 80 00                    2     .word 0X8000 
      00ADAA CD 85 D8         [ 4]  223     CALL RFROM 
      00ADAD CD 86 A1         [ 4]  224     CALL ORR
      00ADB0 CD 85 F7         [ 4]  225     CALL TOR
      00ADB3 CD A5 D3         [ 4]  226     CALL DNEGAT  
      00ADB6                        227 STEXP2:
      00ADB6 CD 86 2E         [ 4]  228     CALL DUPP 
      002D39                        229     _DOLIT 0X7F
      00ADB9 CD 84 F1         [ 4]    1     CALL DOLIT 
      00ADBC 00 7F                    2     .word 0X7F 
      00ADBE CD 89 5A         [ 4]  230     CALL UGREAT 
      002D41                        231     _QBRAN STEXP3 
      00ADC1 CD 85 24         [ 4]    1     CALL QBRAN
      00ADC4 AD C9                    2     .word STEXP3
      00ADC6 CD AC F9         [ 4]  232     CALL SFV 
      00ADC9                        233 STEXP3:
      002D49                        234     _DOLIT 0X7F 
      00ADC9 CD 84 F1         [ 4]    1     CALL DOLIT 
      00ADCC 00 7F                    2     .word 0X7F 
      00ADCE CD 86 8D         [ 4]  235     CALL ANDD 
      00ADD1 CD 85 D8         [ 4]  236     CALL RFROM 
      00ADD4 CD 86 A1         [ 4]  237     CALL ORR 
      00ADD7 CD AC 8A         [ 4]  238     CALL SFZ 
      00ADDA CD AC C1         [ 4]  239     CALL SFN 
      00ADDD 81               [ 4]  240     RET 
                                    241 
                                    242 
                                    243 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    244 ;   E. ( f# -- )
                                    245 ;   print float in scientific 
                                    246 ;   format 
                                    247 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002D5E                        248     _HEADER EDOT,2,"E."
      00ADDE AD 5A                    1         .word LINK 
                           002D60     2         LINK=.
      00ADE0 02                       3         .byte 2  
      00ADE1 45 2E                    4         .ascii "E."
      00ADE3                          5         EDOT:
      00ADE3 CD 86 FE         [ 4]  249     CALL BASE 
      00ADE6 CD 85 87         [ 4]  250     CALL AT 
      00ADE9 CD 85 F7         [ 4]  251     CALL TOR 
      002D6C                        252     _DOLIT 10 
      00ADEC CD 84 F1         [ 4]    1     CALL DOLIT 
      00ADEF 00 0A                    2     .word 10 
      00ADF1 CD 86 FE         [ 4]  253     CALL BASE 
      00ADF4 CD 85 70         [ 4]  254     CALL STORE 
      00ADF7 CD AD 1A         [ 4]  255     CALL ATEXP ; m e 
      00ADFA                        256 EDOT0:
      00ADFA CD 85 F7         [ 4]  257     CALL TOR   
      00ADFD CD AC 60         [ 4]  258     CALL FNE 
      002D80                        259     _QBRAN EDOT1
      00AE00 CD 85 24         [ 4]    1     CALL QBRAN
      00AE03 AE 08                    2     .word EDOT1
      00AE05 CD A5 D3         [ 4]  260     CALL DNEGAT
      00AE08                        261 EDOT1:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      00AE08 CD 8F 2E         [ 4]  262     CALL SPACE 
      00AE0B CD 8D F2         [ 4]  263     CALL BDIGS     
      00AE0E                        264 EDOT2: 
      00AE0E CD A6 6E         [ 4]  265     CALL DDIG
      00AE11 CD 85 D8         [ 4]  266     CALL RFROM 
      00AE14 CD 8B 7B         [ 4]  267     CALL ONEP 
      00AE17 CD 85 F7         [ 4]  268     CALL TOR 
      00AE1A CD 86 2E         [ 4]  269     CALL DUPP
      002D9D                        270     _QBRAN EDOT3 
      00AE1D CD 85 24         [ 4]    1     CALL QBRAN
      00AE20 AE 27                    2     .word EDOT3
      002DA2                        271     _BRAN EDOT2  
      00AE22 CD 85 53         [ 4]    1     CALL BRAN 
      00AE25 AE 0E                    2     .word EDOT2 
      00AE27                        272 EDOT3:
      00AE27 CD 86 58         [ 4]  273     CALL OVER 
      00AE2A CD 86 FE         [ 4]  274     CALL BASE 
      00AE2D CD 85 87         [ 4]  275     CALL AT 
      00AE30 CD 89 1D         [ 4]  276     CALL ULESS 
      002DB3                        277     _QBRAN EDOT2 
      00AE33 CD 85 24         [ 4]    1     CALL QBRAN
      00AE36 AE 0E                    2     .word EDOT2
      002DB8                        278     _DOLIT '.'
      00AE38 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AE3B 00 2E                    2     .word '.' 
      00AE3D CD 8E 02         [ 4]  279     CALL HOLD  
      00AE40 CD A6 6E         [ 4]  280     CALL DDIG
      00AE43 CD AC 60         [ 4]  281     CALL FNE 
      002DC6                        282     _QBRAN EDOT4 
      00AE46 CD 85 24         [ 4]    1     CALL QBRAN
      00AE49 AE 56                    2     .word EDOT4
      002DCB                        283     _DOLIT '-'
      00AE4B CD 84 F1         [ 4]    1     CALL DOLIT 
      00AE4E 00 2D                    2     .word '-' 
      00AE50 CD 8E 02         [ 4]  284     CALL HOLD 
      00AE53 CD 86 24         [ 4]  285     CALL DROP 
      00AE56                        286 EDOT4:       
      00AE56 CD 8E 57         [ 4]  287     CALL EDIGS 
      00AE59 CD 8F 58         [ 4]  288     CALL TYPES
      00AE5C CD 85 D8         [ 4]  289     CALL RFROM 
      00AE5F CD 87 EB         [ 4]  290     CALL QDUP 
      002DE2                        291     _QBRAN EDOT5     
      00AE62 CD 85 24         [ 4]    1     CALL QBRAN
      00AE65 AE 72                    2     .word EDOT5
      002DE7                        292     _DOLIT 'E'
      00AE67 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AE6A 00 45                    2     .word 'E' 
      00AE6C CD 84 B6         [ 4]  293     CALL EMIT 
      00AE6F CD 90 2F         [ 4]  294     CALL DOT
      00AE72                        295 EDOT5: 
      00AE72 CD 85 D8         [ 4]  296     CALL RFROM 
      00AE75 CD 86 FE         [ 4]  297     CALL BASE 
      00AE78 CD 85 70         [ 4]  298     CALL STORE  
      00AE7B 81               [ 4]  299     RET 
                                    300 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



                                    301 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                    302 ;   F. (f# -- )
                                    303 ;   print float in fixed
                                    304 ;   point format. 
                                    305 ;;;;;;;;;;;;;;;;;;;;;;;;;
      002DFC                        306     _HEADER FDOT,2,"F."
      00AE7C AD E0                    1         .word LINK 
                           002DFE     2         LINK=.
      00AE7E 02                       3         .byte 2  
      00AE7F 46 2E                    4         .ascii "F."
      00AE81                          5         FDOT:
      00AE81 CD 86 FE         [ 4]  307     CALL BASE 
      00AE84 CD 85 87         [ 4]  308     CALL AT 
      00AE87 CD 85 F7         [ 4]  309     CALL TOR 
      002E0A                        310     _DOLIT 10 
      00AE8A CD 84 F1         [ 4]    1     CALL DOLIT 
      00AE8D 00 0A                    2     .word 10 
      00AE8F CD 86 FE         [ 4]  311     CALL BASE 
      00AE92 CD 85 70         [ 4]  312     CALL STORE 
      00AE95 CD AD 1A         [ 4]  313     CALL    ATEXP
      00AE98 CD 86 2E         [ 4]  314     CALL    DUPP  
      00AE9B CD 88 F0         [ 4]  315     CALL    ABSS 
      002E1E                        316     _DOLIT  8
      00AE9E CD 84 F1         [ 4]    1     CALL DOLIT 
      00AEA1 00 08                    2     .word 8 
      00AEA3 CD 89 79         [ 4]  317     CALL    GREAT 
      002E26                        318     _QBRAN  FDOT1 
      00AEA6 CD 85 24         [ 4]    1     CALL QBRAN
      00AEA9 AE AE                    2     .word FDOT1
      00AEAB CC AD FA         [ 2]  319     JP      EDOT0 
      00AEAE                        320 FDOT1:
      00AEAE CD 8F 2E         [ 4]  321     CALL    SPACE 
      00AEB1 CD 85 F7         [ 4]  322     CALL    TOR 
      00AEB4 CD AC 60         [ 4]  323     CALL    FNE 
      002E37                        324     _QBRAN  FDOT0 
      00AEB7 CD 85 24         [ 4]    1     CALL QBRAN
      00AEBA AE BF                    2     .word FDOT0
      00AEBC CD A5 D3         [ 4]  325     CALL    DNEGAT 
      00AEBF                        326 FDOT0: 
      00AEBF CD 8D F2         [ 4]  327     CALL    BDIGS
      00AEC2 CD 85 EB         [ 4]  328     CALL    RAT  
      00AEC5 CD 86 67         [ 4]  329     CALL    ZLESS 
      002E48                        330     _QBRAN  FDOT6 
      00AEC8 CD 85 24         [ 4]    1     CALL QBRAN
      00AECB AE F6                    2     .word FDOT6
      00AECD                        331 FDOT2: ; e<0 
      00AECD CD A6 6E         [ 4]  332     CALL    DDIG 
      00AED0 CD 85 D8         [ 4]  333     CALL    RFROM
      00AED3 CD 8B 7B         [ 4]  334     CALL    ONEP 
      00AED6 CD 87 EB         [ 4]  335     CALL    QDUP 
      002E59                        336     _QBRAN  FDOT3 
      00AED9 CD 85 24         [ 4]    1     CALL QBRAN
      00AEDC AE E6                    2     .word FDOT3
      00AEDE CD 85 F7         [ 4]  337     CALL    TOR 
      002E61                        338     _BRAN   FDOT2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      00AEE1 CD 85 53         [ 4]    1     CALL BRAN 
      00AEE4 AE CD                    2     .word FDOT2 
      00AEE6                        339 FDOT3:
      002E66                        340     _DOLIT  '.' 
      00AEE6 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AEE9 00 2E                    2     .word '.' 
      00AEEB CD 8E 02         [ 4]  341     CALL    HOLD 
      00AEEE CD A6 87         [ 4]  342     CALL    DDIGS
      002E71                        343     _BRAN   FDOT9  
      00AEF1 CD 85 53         [ 4]    1     CALL BRAN 
      00AEF4 AF 0B                    2     .word FDOT9 
      00AEF6                        344 FDOT6: ; e>=0 
      002E76                        345     _BRAN   FDOT8
      00AEF6 CD 85 53         [ 4]    1     CALL BRAN 
      00AEF9 AF 03                    2     .word FDOT8 
      00AEFB                        346 FDOT7:     
      002E7B                        347     _DOLIT  '0'
      00AEFB CD 84 F1         [ 4]    1     CALL DOLIT 
      00AEFE 00 30                    2     .word '0' 
      00AF00 CD 8E 02         [ 4]  348     CALL    HOLD 
      00AF03                        349 FDOT8:
      00AF03 CD 85 05         [ 4]  350     CALL    DONXT 
      00AF06 AE FB                  351     .word   FDOT7
      00AF08 CD A6 87         [ 4]  352     CALL    DDIGS 
      00AF0B                        353 FDOT9:
      00AF0B CD AC 60         [ 4]  354     CALL    FNE 
      002E8E                        355     _QBRAN  FDOT10 
      00AF0E CD 85 24         [ 4]    1     CALL QBRAN
      00AF11 AF 1B                    2     .word FDOT10
      002E93                        356     _DOLIT '-' 
      00AF13 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AF16 00 2D                    2     .word '-' 
      00AF18 CD 8E 02         [ 4]  357     CALL   HOLD 
      00AF1B                        358 FDOT10:
      00AF1B CD 8E 57         [ 4]  359     CALL    EDIGS 
      00AF1E CD 8F 58         [ 4]  360     CALL    TYPES 
      00AF21 CD 85 D8         [ 4]  361     CALL    RFROM 
      00AF24 CD 86 FE         [ 4]  362     CALL    BASE 
      00AF27 CD 85 70         [ 4]  363     CALL    STORE 
      00AF2A 81               [ 4]  364     RET 
                                    365 
                                    366 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    367 ; return parsed exponent or 
                                    368 ; 0 if failed
                                    369 ; at entry exprect *a=='E'    
                                    370 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00AF2B                        371 parse_exponent: ; a cntr -- e -1 | 0 
      00AF2B CD 85 F7         [ 4]  372     CALL TOR   ; R: cntr 
      00AF2E CD 86 2E         [ 4]  373     CALL DUPP 
      00AF31 CD 85 A5         [ 4]  374     CALL CAT 
      002EB4                        375     _DOLIT 'E' 
      00AF34 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AF37 00 45                    2     .word 'E' 
      00AF39 CD 88 FE         [ 4]  376     CALL EQUAL 
      002EBC                        377     _QBRAN 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      00AF3C CD 85 24         [ 4]    1     CALL QBRAN
      00AF3F AF 6C                    2     .word 1$
      00AF41 CD 8B 7B         [ 4]  378     CALL ONEP 
      00AF44 CD 85 D8         [ 4]  379     CALL RFROM  ; a cntr 
      00AF47 CD 8B 88         [ 4]  380     CALL ONEM
      00AF4A CD 86 2E         [ 4]  381     CALL DUPP 
      002ECD                        382     _QBRAN 2$ ; a cntr 
      00AF4D CD 85 24         [ 4]    1     CALL QBRAN
      00AF50 AF 6F                    2     .word 2$
      00AF52 CD 8B E7         [ 4]  383     CALL ZERO
      00AF55 CD 86 2E         [ 4]  384     CALL DUPP 
      00AF58 CD A7 1E         [ 4]  385     CALL DSWAP ; 0 0 a cntr  
      00AF5B CD A4 63         [ 4]  386     CALL nsign 
      00AF5E CD 85 F7         [ 4]  387     CALL TOR   ; R: esign  
      00AF61 CD A4 9B         [ 4]  388     CALL parse_digits
      002EE4                        389     _QBRAN PARSEXP_SUCCESS ; parsed to end of string 
      00AF64 CD 85 24         [ 4]    1     CALL QBRAN
      00AF67 AF 76                    2     .word PARSEXP_SUCCESS
                                    390 ; failed invalid character
      00AF69 CD 88 3D         [ 4]  391     CALL DDROP ; 0 a 
      00AF6C                        392 1$: 
      00AF6C CD 85 D8         [ 4]  393     CALL RFROM ; sign||cntr  
      00AF6F                        394 2$:
      00AF6F CD 88 3D         [ 4]  395     CALL DDROP  ; a cntr || a sign || 0 cntr   
      00AF72 CD 8B E7         [ 4]  396     CALL ZERO   ; return only 0 
      00AF75 81               [ 4]  397     RET 
      00AF76                        398 PARSEXP_SUCCESS: 
      00AF76 CD 88 3D         [ 4]  399     CALL DDROP ; drop dhi a 
      00AF79 CD 85 D8         [ 4]  400     CALL RFROM ; es 
      002EFC                        401     _QBRAN 1$
      00AF7C CD 85 24         [ 4]    1     CALL QBRAN
      00AF7F AF 84                    2     .word 1$
      00AF81 CD 88 88         [ 4]  402     CALL NEGAT
      00AF84                        403 1$:
      002F04                        404     _DOLIT -1 ; -- e -1 
      00AF84 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AF87 FF FF                    2     .word -1 
      00AF89 81               [ 4]  405     RET 
                                    406 
                                    407 
                                    408 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    409 ;   FLOAT?  ( a dlo dhi a+ cntr sign d? -- f -3 | a 0 )
                                    410 ;   called by NUMBER? 
                                    411 ;   convert string to float 
                                    412 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002F0A                        413     _HEADER FLOATQ,5,"FLOAT?"
      00AF8A AE 7E                    1         .word LINK 
                           002F0C     2         LINK=.
      00AF8C 05                       3         .byte 5  
      00AF8D 46 4C 4F 41 54 3F        4         .ascii "FLOAT?"
      00AF93                          5         FLOATQ:
      002F13                        414     _QBRAN FLOATQ0 
      00AF93 CD 85 24         [ 4]    1     CALL QBRAN
      00AF96 AF 9D                    2     .word FLOATQ0
      002F18                        415     _BRAN FLOAT_ERROR  ; not a float, string start with '#'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      00AF98 CD 85 53         [ 4]    1     CALL BRAN 
      00AF9B B0 3C                    2     .word FLOAT_ERROR 
      00AF9D                        416 FLOATQ0:
                                    417 ; BASE must be 10 
      00AF9D CD 86 FE         [ 4]  418     CALL BASE 
      00AFA0 CD 85 87         [ 4]  419     CALL AT 
      002F23                        420     _DOLIT 10 
      00AFA3 CD 84 F1         [ 4]    1     CALL DOLIT 
      00AFA6 00 0A                    2     .word 10 
      00AFA8 CD 88 FE         [ 4]  421     CALL EQUAL 
      002F2B                        422     _QBRAN FLOAT_ERROR 
      00AFAB CD 85 24         [ 4]    1     CALL QBRAN
      00AFAE B0 3C                    2     .word FLOAT_ERROR
                                    423 ; if float next char is '.' or 'E' 
      00AFB0 CD 85 F7         [ 4]  424     CALL TOR ; R: sign  
      00AFB3 CD 85 F7         [ 4]  425     CALL TOR ; R: sign cntr 
      00AFB6 CD 86 2E         [ 4]  426     CALL DUPP
      00AFB9 CD 85 A5         [ 4]  427     CALL CAT 
      002F3C                        428     _DOLIT '.' 
      00AFBC CD 84 F1         [ 4]    1     CALL DOLIT 
      00AFBF 00 2E                    2     .word '.' 
      00AFC1 CD 88 FE         [ 4]  429     CALL EQUAL 
      002F44                        430     _QBRAN FLOATQ1 ; not a dot 
      00AFC4 CD 85 24         [ 4]    1     CALL QBRAN
      00AFC7 B0 02                    2     .word FLOATQ1
      00AFC9 CD 8B 7B         [ 4]  431     CALL ONEP 
      00AFCC CD 85 D8         [ 4]  432     CALL RFROM  ; dlo dhi a cntr R: sign  
      00AFCF CD 8B 88         [ 4]  433     CALL ONEM 
      00AFD2 CD 86 2E         [ 4]  434     CALL DUPP 
      00AFD5 CD 85 F7         [ 4]  435     CALL TOR  ; R: sign cntr 
                                    436 ; parse fractional part
      00AFD8 CD A4 9B         [ 4]  437     CALL parse_digits ; dlo dhi a cntr -- dm a cntr 
      00AFDB CD 86 2E         [ 4]  438     CALL DUPP 
      00AFDE CD 85 D8         [ 4]  439     CALL RFROM 
      00AFE1 CD 86 3E         [ 4]  440     CALL SWAPP 
      00AFE4 CD 88 D6         [ 4]  441     CALL SUBB ; fd -> fraction digits count 
      00AFE7 CD 85 F7         [ 4]  442     CALL TOR  ; dlo dhi a cntr R: sign fd 
      00AFEA CD 86 2E         [ 4]  443     CALL DUPP ; cntr cntr  
      002F6D                        444     _QBRAN 1$ ; end of string, no exponent
      00AFED CD 85 24         [ 4]    1     CALL QBRAN
      00AFF0 AF F7                    2     .word 1$
      002F72                        445     _BRAN FLOATQ2
      00AFF2 CD 85 53         [ 4]    1     CALL BRAN 
      00AFF5 B0 0B                    2     .word FLOATQ2 
      00AFF7 CD 86 3E         [ 4]  446 1$: CALL SWAPP 
      00AFFA CD 86 24         [ 4]  447     CALL DROP ; a
      002F7D                        448     _BRAN FLOATQ3        
      00AFFD CD 85 53         [ 4]    1     CALL BRAN 
      00B000 B0 13                    2     .word FLOATQ3 
      00B002                        449 FLOATQ1: ; must push fd==0 on RSTACK 
      00B002 CD 85 D8         [ 4]  450     CALL RFROM ; cntr 
      00B005 CD 8B E7         [ 4]  451     CALL ZERO  ; fd 
      00B008 CD 85 F7         [ 4]  452     CALL TOR   ; dm a cntr R: sign fd 
      00B00B                        453 FLOATQ2: 
      00B00B CD AF 2B         [ 4]  454     CALL parse_exponent 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      002F8E                        455     _QBRAN FLOAT_ERROR0 ; exponent expected 
      00B00E CD 85 24         [ 4]    1     CALL QBRAN
      00B011 B0 39                    2     .word FLOAT_ERROR0
      00B013                        456 FLOATQ3: ; dm 0 || dm e  
      00B013 CD 85 D8         [ 4]  457     CALL RFROM ;  fd  
      00B016 CD 88 D6         [ 4]  458     CALL SUBB  ; exp=e-fd 
      00B019 CD 88 1B         [ 4]  459     CALL NROT 
      00B01C CD 85 D8         [ 4]  460     CALL RFROM  ; sign 
      002F9F                        461     _QBRAN FLOATQ4 
      00B01F CD 85 24         [ 4]    1     CALL QBRAN
      00B022 B0 27                    2     .word FLOATQ4
      00B024 CD 88 9A         [ 4]  462     CALL DNEGA 
      00B027                        463 FLOATQ4:
      00B027 CD 87 FC         [ 4]  464     CALL ROT 
      00B02A CD AD 64         [ 4]  465     CALL STEXP 
      00B02D CD 87 FC         [ 4]  466     CALL ROT 
      00B030 CD 86 24         [ 4]  467     CALL DROP 
      002FB3                        468     _DOLIT -3 
      00B033 CD 84 F1         [ 4]    1     CALL DOLIT 
      00B036 FF FD                    2     .word -3 
      00B038 81               [ 4]  469     RET       
      00B039                        470 FLOAT_ERROR0: 
      00B039 CD A8 B9         [ 4]  471     CALL DRFROM ; sign df      
      00B03C                        472 FLOAT_ERROR: 
      00B03C CD 8C 29         [ 4]  473     CALL DEPTH 
      00B03F CD 8B 6E         [ 4]  474     CALL CELLS 
      00B042 CD 86 0E         [ 4]  475     CALL SPAT 
      00B045 CD 86 3E         [ 4]  476     CALL SWAPP 
      00B048 CD 88 5D         [ 4]  477     CALL PLUS  
      00B04B CD 86 1B         [ 4]  478     CALL SPSTO 
      002FCE                        479     _DOLIT 0 
      00B04E CD 84 F1         [ 4]    1     CALL DOLIT 
      00B051 00 00                    2     .word 0 
      00B053 81               [ 4]  480     RET 
                                    481 
                                    482 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    483 ;  LSCALE ( f# -- f# )
                                    484 ;  m *=fbase , e -= 1
                                    485 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002FD4                        486     _HEADER LSCALE,6,"LSCALE"
      00B054 AF 8C                    1         .word LINK 
                           002FD6     2         LINK=.
      00B056 06                       3         .byte 6  
      00B057 4C 53 43 41 4C 45        4         .ascii "LSCALE"
      00B05D                          5         LSCALE:
      00B05D CD AD 1A         [ 4]  487     CALL ATEXP 
      002FE0                        488     _DOLIT 1 
      00B060 CD 84 F1         [ 4]    1     CALL DOLIT 
      00B063 00 01                    2     .word 1 
      00B065 CD 88 D6         [ 4]  489     CALL SUBB 
      00B068 CD 85 F7         [ 4]  490     CALL TOR
      002FEB                        491     _DOLIT 10 
      00B06B CD 84 F1         [ 4]    1     CALL DOLIT 
      00B06E 00 0A                    2     .word 10 
      00B070 CD A6 D5         [ 4]  492     CALL DSSTAR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      00B073 CD 85 D8         [ 4]  493     CALL RFROM 
      00B076 CD AD 64         [ 4]  494     CALL STEXP 
      00B079 81               [ 4]  495     RET  
                                    496 
                                    497 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    498 ;  RSCALE ( f# -- f# )
                                    499 ;  m /=fbase , e+=1 
                                    500 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002FFA                        501     _HEADER RSCALE,6,"RSCALE"
      00B07A B0 56                    1         .word LINK 
                           002FFC     2         LINK=.
      00B07C 06                       3         .byte 6  
      00B07D 52 53 43 41 4C 45        4         .ascii "RSCALE"
      00B083                          5         RSCALE:
      00B083 CD AD 1A         [ 4]  502     CALL ATEXP 
      003006                        503     _DOLIT 1 
      00B086 CD 84 F1         [ 4]    1     CALL DOLIT 
      00B089 00 01                    2     .word 1 
      00B08B CD 88 5D         [ 4]  504     CALL PLUS 
      00B08E CD 85 F7         [ 4]  505     CALL TOR 
      003011                        506     _DOLIT 10 
      00B091 CD 84 F1         [ 4]    1     CALL DOLIT 
      00B094 00 0A                    2     .word 10 
      00B096 CD A6 2D         [ 4]  507     CALL DSLMOD 
      00B099 CD 87 FC         [ 4]  508     CALL ROT 
      00B09C CD 86 24         [ 4]  509     CALL DROP 
      00B09F CD 85 D8         [ 4]  510     CALL RFROM 
      00B0A2 CD AD 64         [ 4]  511     CALL STEXP 
      00B0A5 81               [ 4]  512     RET 
                                    513 
                                    514 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    515 ;   SCALE>M ( ud1 -- e ud2 )
                                    516 ;   scale down a double  
                                    517 ;   by repeated d/10
                                    518 ;   until ud<=MAX_MANTISSA   
                                    519 ;   e is log10 exponent of scaled down
                                    520 ;   ud2 is scaled down ud1 
                                    521 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003026                        522     _HEADER SCALETOM,7,"SCALE>M"
      00B0A6 B0 7C                    1         .word LINK 
                           003028     2         LINK=.
      00B0A8 07                       3         .byte 7  
      00B0A9 53 43 41 4C 45 3E 4D     4         .ascii "SCALE>M"
      00B0B0                          5         SCALETOM:
      00B0B0 CD 8B E7         [ 4]  523     CALL ZERO 
      00B0B3 CD 88 1B         [ 4]  524     CALL NROT 
      00B0B6                        525 SCAL1:
      00B0B6 CD 86 2E         [ 4]  526     CALL DUPP 
      003039                        527     _DOLIT 0X7F 
      00B0B9 CD 84 F1         [ 4]    1     CALL DOLIT 
      00B0BC 00 7F                    2     .word 0X7F 
      00B0BE CD 89 5A         [ 4]  528     CALL UGREAT 
      003041                        529     _QBRAN SCAL2  
      00B0C1 CD 85 24         [ 4]    1     CALL QBRAN
      00B0C4 B0 E2                    2     .word SCAL2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



      003046                        530     _DOLIT 10 
      00B0C6 CD 84 F1         [ 4]    1     CALL DOLIT 
      00B0C9 00 0A                    2     .word 10 
      00B0CB CD A6 2D         [ 4]  531     CALL DSLMOD 
      00B0CE CD 87 FC         [ 4]  532     CALL ROT  
      00B0D1 CD 86 24         [ 4]  533     CALL DROP
      00B0D4 CD 87 FC         [ 4]  534     CALL ROT 
      00B0D7 CD 8B 7B         [ 4]  535     CALL ONEP 
      00B0DA CD 88 1B         [ 4]  536     CALL NROT  
      00305D                        537     _BRAN SCAL1 
      00B0DD CD 85 53         [ 4]    1     CALL BRAN 
      00B0E0 B0 B6                    2     .word SCAL1 
      00B0E2                        538 SCAL2: 
      00B0E2 81               [ 4]  539     RET 
                                    540 
                                    541 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    542 ;  UDIV10 ( ut -- ut )
                                    543 ;  divide a 48 bits uint by 10 
                                    544 ;  used to scale down MM* 
                                    545 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00B0E3                        546 UDIV10:
      00B0E3 90 93            [ 1]  547     LDW Y,X 
      00B0E5 90 FE            [ 2]  548     LDW Y,(Y)
      00B0E7 A6 0A            [ 1]  549     LD A,#10 
      00B0E9 90 62            [ 2]  550     DIV Y,A 
      00B0EB FF               [ 2]  551     LDW (X),Y 
      00B0EC 90 95            [ 1]  552     LD YH,A 
      00B0EE E6 02            [ 1]  553     LD A,(2,X)
      00B0F0 90 97            [ 1]  554     LD YL,A 
      00B0F2 A6 0A            [ 1]  555     LD A,#10 
      00B0F4 90 62            [ 2]  556     DIV Y,A 
      00B0F6 90 95            [ 1]  557     LD YH,A 
      00B0F8 90 9F            [ 1]  558     LD A,YL 
      00B0FA E7 02            [ 1]  559     LD (2,X),A 
      00B0FC E6 03            [ 1]  560     LD A,(3,X)
      00B0FE 90 97            [ 1]  561     LD YL,A 
      00B100 A6 0A            [ 1]  562     LD A,#10 
      00B102 90 62            [ 2]  563     DIV Y,A 
      00B104 90 95            [ 1]  564     LD YH,A 
      00B106 90 9F            [ 1]  565     LD A,YL 
      00B108 E7 03            [ 1]  566     LD (3,X),A 
      00B10A E6 04            [ 1]  567     LD A,(4,X)
      00B10C 90 97            [ 1]  568     LD YL,A 
      00B10E A6 0A            [ 1]  569     LD A,#10 
      00B110 90 62            [ 2]  570     DIV Y,A 
      00B112 90 95            [ 1]  571     LD YH,A 
      00B114 90 9F            [ 1]  572     LD A,YL 
      00B116 E7 04            [ 1]  573     LD (4,X),A 
      00B118 E6 05            [ 1]  574     LD A,(5,X)
      00B11A 90 97            [ 1]  575     LD YL,A 
      00B11C A6 0A            [ 1]  576     LD A,#10 
      00B11E 90 62            [ 2]  577     DIV Y,A 
      00B120 90 9F            [ 1]  578     LD A,YL 
      00B122 E7 05            [ 1]  579     LD (5,X),A 
      00B124 81               [ 4]  580     RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



                                    581 
                                    582 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    583 ;   MM* ( m1 m2 -- m3 e )
                                    584 ;   mantissa product 
                                    585 ;  scale down to 23 bits 
                                    586 ;   e  is log10 scaling factor.
                                    587 ;   The maximum product size 
                                    588 ;   before scaling is 46 bits .
                                    589 ;   UDIV10 is used to scale down.  
                                    590 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0030A5                        591     _HEADER MMSTAR,3,"MM*"
      00B125 B0 A8                    1         .word LINK 
                           0030A7     2         LINK=.
      00B127 03                       3         .byte 3  
      00B128 4D 4D 2A                 4         .ascii "MM*"
      00B12B                          5         MMSTAR:
      00B12B CD 88 48         [ 4]  592     CALL DDUP
      00B12E CD A5 B5         [ 4]  593     CALL DZEQUAL
      0030B1                        594     _TBRAN MMSTA2
      00B131 CD 85 3C         [ 4]    1     CALL TBRAN 
      00B134 B1 41                    2     .word MMSTA2 
      00B136                        595 MMSTA1:
      00B136 CD A9 62         [ 4]  596     CALL DOVER 
      00B139 CD A5 B5         [ 4]  597     CALL DZEQUAL 
      0030BC                        598     _QBRAN MMSTA3 
      00B13C CD 85 24         [ 4]    1     CALL QBRAN
      00B13F B1 4C                    2     .word MMSTA3
      00B141                        599 MMSTA2: ; ( -- 0 0 0 )
      00B141 1C 00 02         [ 2]  600     ADDW X,#2 
      00B144 90 5F            [ 1]  601     CLRW Y 
      00B146 FF               [ 2]  602     LDW (X),Y 
      00B147 EF 02            [ 2]  603     LDW (2,X),Y
      00B149 EF 04            [ 2]  604     LDW (4,X),Y 
      00B14B 81               [ 4]  605     RET 
      00B14C                        606 MMSTA3:
      00B14C CD A6 14         [ 4]  607     CALL DSIGN 
      00B14F CD 85 F7         [ 4]  608     CALL TOR    ; R: m2sign 
      00B152 CD A5 FD         [ 4]  609     CALL DABS   ; m1 um2 
      00B155 CD A7 1E         [ 4]  610     CALL DSWAP  ; um2 m1 
      00B158 CD A6 14         [ 4]  611     CALL DSIGN  ; um2 m1 m1sign 
      00B15B CD 85 D8         [ 4]  612     CALL RFROM 
      00B15E CD 86 B6         [ 4]  613     CALL XORR 
      00B161 CD 85 F7         [ 4]  614     CALL TOR   ; R: product_sign 
      00B164 CD A5 FD         [ 4]  615     CALL DABS  ; um2 um1  
      00B167 CD A8 9B         [ 4]  616     CALL DTOR  ; um2 
      00B16A CD 86 2E         [ 4]  617     CALL DUPP  ; um2 um2hi 
      00B16D CD 85 EB         [ 4]  618     CALL RAT   ; um2 um2hi um1hi
                                    619 ; first partial product  
                                    620 ; pd1=um2hi*um1hi 
      00B170 CD 8A FA         [ 4]  621     CALL STAR 
      00B173 CD 8B E7         [ 4]  622     CALL ZERO 
      00B176 CD 86 3E         [ 4]  623     CALL SWAPP ; pd1<<16  
      00B179 CD A7 1E         [ 4]  624     CALL DSWAP ; pd1 um2 
      00B17C CD 86 58         [ 4]  625     CALL OVER  ; pd1 um2 um2lo 
      00B17F CD 85 D8         [ 4]  626     CALL RFROM ; pd1 um2 um2lo um1hi 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



                                    627 ; pd2=um2lo*um1hi 
      00B182 CD 8A B0         [ 4]  628     CALL UMSTA ; pd1 um2 pd2 
      00B185 CD A7 1E         [ 4]  629     CALL DSWAP ; pd1 pd2 um2 
      00B188 CD 85 EB         [ 4]  630     CALL RAT   ; pd1 pd2 um2 um1lo 
                                    631 ; pd3= um2hi*um1lo 
      00B18B CD 8A B0         [ 4]  632     CALL UMSTA ; pd1 pd2 um2lo pd3 
      00B18E CD 87 FC         [ 4]  633     CALL ROT ; pd1 pd2 pd3 um2lo 
      00B191 CD 85 F7         [ 4]  634     CALL TOR ; pd1 pd2 pd3 R: psign um1lo um2lo 
                                    635 ; pd1+pd2+pd3  pd1
      00B194 CD AB 62         [ 4]  636     CALL DPLUS 
      00B197 CD AB 62         [ 4]  637     CALL DPLUS  
      00B19A CD 9A 32         [ 4]  638 CALL DOTS 
      00B19D CD A8 B9         [ 4]  639     CALL DRFROM ; triple um2lo um1lo 
                                    640 ; last partial product um2lo*um1lo 
      00B1A0 CD 8A B0         [ 4]  641     CALL UMSTA ; prod pd4 
                                    642 ; mm*=prod<<16+pd4  
      00B1A3 CD A8 9B         [ 4]  643     CALL DTOR ;   R: psign pd4lo pd4hi  
                                    644  ; add pd4hi to prodlo and propagate carry 
      00B1A6 90 93            [ 1]  645     LDW Y,X 
      00B1A8 90 EE 02         [ 2]  646     LDW Y,(2,Y)  ; prodlo 
      00B1AB 72 F9 01         [ 2]  647     ADDW Y,(1,SP)  ; prodlo+pd4hi 
      00B1AE 17 01            [ 2]  648     LDW (1,SP),Y    ; plo phi  
      00B1B0 90 93            [ 1]  649     LDW Y,X
      00B1B2 90 FE            [ 2]  650     LDW Y,(Y) ; prodhi  
      00B1B4 24 04            [ 1]  651     JRNC MMSTA4
      00B1B6 72 A9 00 01      [ 2]  652     ADDW Y,#1 ; add carry 
      00B1BA                        653 MMSTA4:     
      00B1BA 1D 00 02         [ 2]  654     SUBW X,#2 
      00B1BD FF               [ 2]  655     LDW (X),Y 
      00B1BE 90 85            [ 2]  656     POPW Y 
      00B1C0 EF 02            [ 2]  657     LDW (2,X),Y 
      00B1C2 90 85            [ 2]  658     POPW Y 
      00B1C4 EF 04            [ 2]  659     LDW (4,X),Y
      00B1C6 CD 8B E7         [ 4]  660     CALL ZERO 
      00B1C9 CD 85 F7         [ 4]  661     CALL TOR 
      00B1CC                        662 MMSTA5:
      00B1CC CD 87 EB         [ 4]  663     CALL QDUP 
      00314F                        664     _QBRAN MMSTA6 
      00B1CF CD 85 24         [ 4]    1     CALL QBRAN
      00B1D2 B1 E5                    2     .word MMSTA6
      00B1D4 CD B0 E3         [ 4]  665     CALL UDIV10 
      00B1D7 CD 85 D8         [ 4]  666     CALL RFROM 
      00B1DA CD 8B 7B         [ 4]  667     CALL ONEP 
      00B1DD CD 85 F7         [ 4]  668     CALL TOR 
      003160                        669     _BRAN MMSTA5 
      00B1E0 CD 85 53         [ 4]    1     CALL BRAN 
      00B1E3 B1 CC                    2     .word MMSTA5 
                                    670 ; now scale to double 
                                    671 ; scale further <= MAX_MANTISSA 
      00B1E5                        672 MMSTA6: 
      00B1E5 CD 85 D8         [ 4]  673     CALL RFROM 
      00B1E8 CD 88 1B         [ 4]  674     CALL NROT 
      00B1EB CD B0 B0         [ 4]  675     CALL SCALETOM
      00B1EE CD A8 9B         [ 4]  676     CALL DTOR 
      00B1F1 CD 88 5D         [ 4]  677     CALL PLUS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      00B1F4 CD A8 B9         [ 4]  678     CALL DRFROM 
      00B1F7 CD 85 D8         [ 4]  679     CALL RFROM
      00317A                        680     _QBRAN MMSTA7
      00B1FA CD 85 24         [ 4]    1     CALL QBRAN
      00B1FD B2 02                    2     .word MMSTA7
      00B1FF CD 88 9A         [ 4]  681     CALL DNEGA
      00B202                        682 MMSTA7:
      00B202 CD 87 FC         [ 4]  683     CALL ROT ; m e 
      00B205 81               [ 4]  684     RET 
                                    685 
                                    686 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    687 ;    F* ( f#1 f#2 -- f#3 )
                                    688 ;    float product 
                                    689 ;    f#3=f#1 * f#2 
                                    690 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003186                        691     _HEADER FSTAR,2,"F*"
      00B206 B1 27                    1         .word LINK 
                           003188     2         LINK=.
      00B208 02                       3         .byte 2  
      00B209 46 2A                    4         .ascii "F*"
      00B20B                          5         FSTAR:
      00B20B CD AD 1A         [ 4]  692     CALL ATEXP ; f#1 m2 e2 
      00B20E CD 85 F7         [ 4]  693     CALL TOR   
      00B211 CD A7 1E         [ 4]  694     CALL DSWAP ; m2 f#1
      00B214 CD AD 1A         [ 4]  695     CALL ATEXP ; m2 m1 e1 
      00B217 CD 85 D8         [ 4]  696     CALL RFROM ; m2 m1 e1 e2 
      00B21A CD 88 5D         [ 4]  697     CALL PLUS  ; m2 m1 e 
      00B21D CD 85 F7         [ 4]  698     CALL TOR   ; m2 m1 R: e 
      00B220 CD B1 2B         [ 4]  699     CALL MMSTAR ; m2*m1 e   
      00B223 CD 85 D8         [ 4]  700     CALL RFROM 
      00B226 CD 88 5D         [ 4]  701     CALL PLUS 
      00B229 CD AD 64         [ 4]  702     CALL STEXP ; f#3 
      00B22C 81               [ 4]  703     RET 
                                    704 
                                    705 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    706 ;  F/ ( f#1 f#2 -- f#3 )
                                    707 ;  float division
                                    708 ;  f#3 = f#1/f#2
                                    709 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0031AD                        710     _HEADER FSLASH,2,"F/"
      00B22D B2 08                    1         .word LINK 
                           0031AF     2         LINK=.
      00B22F 02                       3         .byte 2  
      00B230 46 2F                    4         .ascii "F/"
      00B232                          5         FSLASH:
      00B232 CD AD 1A         [ 4]  711     CALL ATEXP  ; f#1 m2 e2  
      00B235 CD 85 F7         [ 4]  712     CALL TOR    ; f#1 m2   R: e2 
      00B238 CD A7 1E         [ 4]  713     CALL DSWAP  ; m2 f#1 
      00B23B CD AD 1A         [ 4]  714     CALL ATEXP  ; m2 m1 e1 
      00B23E CD 85 D8         [ 4]  715     CALL RFROM  ; m2 m1 e1 e2
      00B241 CD 88 5D         [ 4]  716     CALL PLUS   ; m2 m1 e 
      00B244 CD 85 F7         [ 4]  717     CALL TOR    ; m2 m1 R: e 
      00B247 CD A7 1E         [ 4]  718     CALL DSWAP  ; m1 m2 R: e
      00B24A CD 88 48         [ 4]  719     CALL DDUP  ; m1 m2 m2 R: e
      00B24D CD A8 9B         [ 4]  720     CALL DTOR  ; m1 m2 R: e m2 ( keep divisor need later ) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      00B250 CD AA 6B         [ 4]  721     CALL DDSLMOD ; remainder m1/m2 R: e m2 
      00B253 CD A9 62         [ 4]  722     CALL DOVER ; if remainder null done 
      00B256 CD A5 B5         [ 4]  723     CALL DZEQUAL 
      0031D9                        724     _TBRAN FSLASH8 
      00B259 CD 85 3C         [ 4]    1     CALL TBRAN 
      00B25C B2 B5                    2     .word FSLASH8 
                                    725 ; get fractional digits from remainder until mantissa saturate
      00B25E                        726 FSLASH1: ; remainder mantissa R: e divisor 
                                    727 ; check for mantissa saturation 
      00B25E CD 88 48         [ 4]  728     CALL DDUP 
      0031E1                        729     _DOLIT 0XCCCC 
      00B261 CD 84 F1         [ 4]    1     CALL DOLIT 
      00B264 CC CC                    2     .word 0XCCCC 
      0031E6                        730     _DOLIT 0xC
      00B266 CD 84 F1         [ 4]    1     CALL DOLIT 
      00B269 00 0C                    2     .word 0xC 
      00B26B CD A8 13         [ 4]  731     CALL DGREAT 
      0031EE                        732     _TBRAN FSLASH8 ; another loop would result in mantissa overflow 
      00B26E CD 85 3C         [ 4]    1     CALL TBRAN 
      00B271 B2 B5                    2     .word FSLASH8 
                                    733 ; multiply mantissa by 10 
      0031F3                        734     _DOLIT 10 
      00B273 CD 84 F1         [ 4]    1     CALL DOLIT 
      00B276 00 0A                    2     .word 10 
      00B278 CD 8B E7         [ 4]  735     CALL ZERO 
      00B27B CD AA 08         [ 4]  736     CALL DSTAR 
                                    737 ; mutliply remainder by 10     
      00B27E CD A7 1E         [ 4]  738     CALL DSWAP 
      003201                        739     _DOLIT 10 
      00B281 CD 84 F1         [ 4]    1     CALL DOLIT 
      00B284 00 0A                    2     .word 10 
      00B286 CD 8B E7         [ 4]  740     CALL ZERO 
      00B289 CD AA 08         [ 4]  741     CALL DSTAR 
                                    742 ; divide remainder by m2     
      00B28C CD A8 D1         [ 4]  743     CALL DRAT 
      00B28F CD AA 6B         [ 4]  744     CALL DDSLMOD 
      00B292 CD A7 1E         [ 4]  745     CALL DSWAP ; mantissa frac_digit remainder R: e divisor  
      00B295 CD A8 9B         [ 4]  746     CALL DTOR  ; mantissa frac_digit R: e divisor remainder 
      00B298 CD AB 62         [ 4]  747     CALL DPLUS ; mantissa+frac_digit 
      00B29B CD A8 B9         [ 4]  748     CALL DRFROM ; mantissa remainder 
      00B29E CD A8 B9         [ 4]  749     CALL DRFROM ; mantissa remainder divisor 
      00B2A1 CD 85 D8         [ 4]  750     CALL RFROM  ; mantissa remainder divisor e 
      00B2A4 CD 8B 88         [ 4]  751     CALL ONEM   ; decrement exponent 
      00B2A7 CD 85 F7         [ 4]  752     CALL TOR    ; mantissa remainder divisor R: e 
      00B2AA CD A8 9B         [ 4]  753     CALL DTOR   ; mantissa remainder R: e divisor 
      00B2AD CD A7 1E         [ 4]  754     CALL DSWAP  ; remainder mantissa  
      003230                        755     _BRAN FSLASH1
      00B2B0 CD 85 53         [ 4]    1     CALL BRAN 
      00B2B3 B2 5E                    2     .word FSLASH1 
      00B2B5                        756 FSLASH8: ; remainder mantissa R: e divisor 
      00B2B5 CD A7 1E         [ 4]  757     CALL DSWAP  
      00B2B8 CD 88 3D         [ 4]  758     CALL DDROP  ; drop remainder     
      00B2BB CD A8 B9         [ 4]  759     CALL DRFROM
      00B2BE CD 88 3D         [ 4]  760     CALL DDROP  ; drop divisor 
      00B2C1 CD 85 D8         [ 4]  761     CALL RFROM  ; exponent 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      00B2C4 CD AD 64         [ 4]  762     CALL STEXP 
      00B2C7 81               [ 4]  763     RET 
                                    764 
                                    765 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    766 ;   D>F  ( # -- f# )
                                    767 ;   convert double to float 
                                    768 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003248                        769     _HEADER DTOF,3,"D>F"
      00B2C8 B2 2F                    1         .word LINK 
                           00324A     2         LINK=.
      00B2CA 03                       3         .byte 3  
      00B2CB 44 3E 46                 4         .ascii "D>F"
      00B2CE                          5         DTOF:
      00B2CE CD A6 14         [ 4]  770     CALL DSIGN 
      00B2D1 CD 85 F7         [ 4]  771     CALL TOR
      00B2D4 CD A5 FD         [ 4]  772     CALL DABS  
      00B2D7                        773 DTOF1:      
      00B2D7 CD B0 B0         [ 4]  774     CALL SCALETOM 
      00B2DA CD 85 D8         [ 4]  775     CALL RFROM
      00325D                        776     _QBRAN DTOF2 
      00B2DD CD 85 24         [ 4]    1     CALL QBRAN
      00B2E0 B2 E5                    2     .word DTOF2
      00B2E2 CD A5 D3         [ 4]  777     CALL DNEGAT 
      00B2E5                        778 DTOF2: 
      00B2E5 CD 87 FC         [ 4]  779     CALL ROT 
      00B2E8 CD AD 64         [ 4]  780     CALL STEXP 
      00B2EB 81               [ 4]  781     RET 
                                    782 
                                    783 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    784 ;   F>D  ( f# -- # )
                                    785 ;  convert float to double 
                                    786 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00326C                        787     _HEADER FTOD,3,"F>D"
      00B2EC B2 CA                    1         .word LINK 
                           00326E     2         LINK=.
      00B2EE 03                       3         .byte 3  
      00B2EF 46 3E 44                 4         .ascii "F>D"
      00B2F2                          5         FTOD:
      00B2F2 CD AD 1A         [ 4]  788     CALL ATEXP ; m e 
      00B2F5 CD 87 EB         [ 4]  789     CALL QDUP
      003278                        790     _QBRAN FTOD9
      00B2F8 CD 85 24         [ 4]    1     CALL QBRAN
      00B2FB B3 88                    2     .word FTOD9
      00B2FD CD 85 F7         [ 4]  791     CALL TOR 
      00B300 CD A6 14         [ 4]  792     CALL DSIGN 
      00B303 CD 88 1B         [ 4]  793     CALL NROT 
      00B306 CD A5 FD         [ 4]  794     CALL DABS
      00B309 CD 85 D8         [ 4]  795     CALL RFROM  
      00B30C CD 86 2E         [ 4]  796     CALL DUPP   
      00B30F CD 86 67         [ 4]  797     CALL ZLESS 
      003292                        798     _QBRAN FTOD4 
      00B312 CD 85 24         [ 4]    1     CALL QBRAN
      00B315 B3 50                    2     .word FTOD4
                                    799 ; negative exponent 
      00B317 CD 88 F0         [ 4]  800     CALL ABSS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      00B31A CD 85 F7         [ 4]  801     CALL TOR
      00329D                        802     _BRAN FTOD2  
      00B31D CD 85 53         [ 4]    1     CALL BRAN 
      00B320 B3 3B                    2     .word FTOD2 
      00B322                        803 FTOD1:
      00B322 CD 88 48         [ 4]  804     CALL DDUP 
      00B325 CD A5 B5         [ 4]  805     CALL DZEQUAL 
      0032A8                        806     _TBRAN FTOD3 
      00B328 CD 85 3C         [ 4]    1     CALL TBRAN 
      00B32B B3 45                    2     .word FTOD3 
      0032AD                        807     _DOLIT 10 
      00B32D CD 84 F1         [ 4]    1     CALL DOLIT 
      00B330 00 0A                    2     .word 10 
      00B332 CD A6 2D         [ 4]  808     CALL DSLMOD 
      00B335 CD 87 FC         [ 4]  809     CALL ROT 
      00B338 CD 86 24         [ 4]  810     CALL DROP
      00B33B                        811 FTOD2:      
      0032BB                        812     _DONXT FTOD1
      00B33B CD 85 05         [ 4]    1     CALL DONXT 
      00B33E B3 22                    2     .word FTOD1 
      0032C0                        813     _BRAN FTOD8   
      00B340 CD 85 53         [ 4]    1     CALL BRAN 
      00B343 B3 7D                    2     .word FTOD8 
      00B345                        814 FTOD3: 
      00B345 CD 85 D8         [ 4]  815     CALL RFROM 
      00B348 CD 86 24         [ 4]  816     CALL DROP 
      0032CB                        817     _BRAN FTOD8  
      00B34B CD 85 53         [ 4]    1     CALL BRAN 
      00B34E B3 7D                    2     .word FTOD8 
                                    818 ; positive exponent 
      00B350                        819 FTOD4:
      00B350 CD 85 F7         [ 4]  820     CALL TOR 
      0032D3                        821     _BRAN FTOD6
      00B353 CD 85 53         [ 4]    1     CALL BRAN 
      00B356 B3 78                    2     .word FTOD6 
      00B358                        822 FTOD5:
      00B358 CD 88 48         [ 4]  823     CALL DDUP 
      0032DB                        824     _DOLIT 0XCCCC
      00B35B CD 84 F1         [ 4]    1     CALL DOLIT 
      00B35E CC CC                    2     .word 0XCCCC 
      0032E0                        825     _DOLIT 0XCCC  
      00B360 CD 84 F1         [ 4]    1     CALL DOLIT 
      00B363 0C CC                    2     .word 0XCCC 
      00B365 CD A8 13         [ 4]  826     CALL DGREAT 
      0032E8                        827     _TBRAN FTOD3 
      00B368 CD 85 3C         [ 4]    1     CALL TBRAN 
      00B36B B3 45                    2     .word FTOD3 
      0032ED                        828     _DOLIT 10 
      00B36D CD 84 F1         [ 4]    1     CALL DOLIT 
      00B370 00 0A                    2     .word 10 
      00B372 CD 8B E7         [ 4]  829     CALL ZERO 
      00B375 CD AA 08         [ 4]  830     CALL DSTAR 
      00B378                        831 FTOD6: 
      0032F8                        832     _DONXT FTOD5 
      00B378 CD 85 05         [ 4]    1     CALL DONXT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      00B37B B3 58                    2     .word FTOD5 
      00B37D                        833 FTOD8:
      00B37D CD 87 FC         [ 4]  834     CALL ROT 
      003300                        835     _QBRAN FTOD9 
      00B380 CD 85 24         [ 4]    1     CALL QBRAN
      00B383 B3 88                    2     .word FTOD9
      00B385 CD 88 9A         [ 4]  836     CALL DNEGA
      00B388                        837 FTOD9:          
      00B388 81               [ 4]  838     RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



                                   4815 .endif 
                                   4816 
                                   4817 ;===============================================================
                                   4818 
                           00326E  4819 LASTN =	LINK   ;last name defined
                                   4820 
                                   4821 ; application code begin here
      00B400                       4822 	.bndry 128 ; align on flash block  
      00B400                       4823 app_space: 
                                   4824 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        000879 R   |   6 ABOR1      00137A R
  6 ABOR2      001391 R   |   6 ABORQ      001372 R   |   6 ABORT      001363 R
  6 ABRTQ      00164E R   |   6 ABSS       000870 R   |   6 ACCEP      0012F9 R
  6 ACCP1      001302 R   |   6 ACCP2      001328 R   |   6 ACCP3      00132B R
  6 ACCP4      00132D R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
    ADC_CR1_=  000001     |     ADC_CR1_=  000004     |     ADC_CR1_=  000005 
    ADC_CR1_=  000006     |     ADC_CR2 =  005402     |     ADC_CR2_=  000003 
    ADC_CR2_=  000004     |     ADC_CR2_=  000005     |     ADC_CR2_=  000006 
    ADC_CR2_=  000001     |     ADC_CR3 =  005403     |     ADC_CR3_=  000007 
    ADC_CR3_=  000006     |     ADC_CSR =  005400     |     ADC_CSR_=  000006 
    ADC_CSR_=  000004     |     ADC_CSR_=  000000     |     ADC_CSR_=  000001 
    ADC_CSR_=  000002     |     ADC_CSR_=  000003     |     ADC_CSR_=  000007 
    ADC_CSR_=  000005     |     ADC_DRH =  005404     |     ADC_DRL =  005405 
    ADC_TDRH=  005406     |     ADC_TDRL=  005407     |   6 ADRADJ     00075B R
    AFR     =  004803     |     AFR0_ADC=  000000     |     AFR1_TIM=  000001 
    AFR2_CCO=  000002     |     AFR3_TIM=  000003     |     AFR4_TIM=  000004 
    AFR5_TIM=  000005     |     AFR6_I2C=  000006     |     AFR7_BEE=  000007 
  6 AFT        001639 R   |   6 AGAIN      00158F R   |   6 AHEAD      0015EC R
  6 ALLOT      0014A2 R   |   6 ANDD       00060D R   |     APP_CP  =  004004 
    APP_LAST=  004000     |     APP_RUN =  004002     |     APP_VP  =  004006 
  6 AT         000507 R   |   6 ATEXE      000C8B R   |   6 ATEXP      002C9A R
  6 AUTORUN    000129 R   |     AWU_APR =  0050F1     |     AWU_CSR =  0050F0 
    AWU_TBR =  0050F2     |     B0_MASK =  000001     |     B115200 =  000006 
  6 B115K2     0003E0 R   |     B19200  =  000003     |   6 B19K2      0003BD R
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
  6 B2K4       00038E R   |     B2_MASK =  000004     |     B38400  =  000004 
    B3_MASK =  000008     |     B460800 =  000008     |     B4800   =  000001 
  6 B4K8       00039C R   |     B4_MASK =  000010     |     B57600  =  000005 
  6 B57K6      0003CE R   |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
  6 B9K6       0003AC R   |   6 BACK1      0012A1 R   |   6 BASE       00067E R
    BASEE   =  00000A     |   6 BAUD       0003F0 R   |     BCNT    =  000001 
  6 BCOMP      0014E4 R   |   6 BDIGS      000D72 R   |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
  6 BEGIN      001571 R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
  6 BKSLA      0010F6 R   |   6 BKSP       001271 R   |     BKSPP   =  000008 
  6 BLANK      000B5A R   |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |   6 BRAN       0004D3 R   |     BTW     =  000001 
  6 BUF2ROW    0020B6 R   |   6 BYE        0000B6 R   |     CADR    =  000003 
    CALLL   =  0000CD     |   6 CALLOT     0022FF R   |     CAN_DGR =  005426 
    CAN_FPSR=  005427     |     CAN_IER =  005425     |     CAN_MCR =  005420 
    CAN_MSR =  005421     |     CAN_P0  =  005428     |     CAN_P1  =  005429 
    CAN_P2  =  00542A     |     CAN_P3  =  00542B     |     CAN_P4  =  00542C 
    CAN_P5  =  00542D     |     CAN_P6  =  00542E     |     CAN_P7  =  00542F 
    CAN_P8  =  005430     |     CAN_P9  =  005431     |     CAN_PA  =  005432 
    CAN_PB  =  005433     |     CAN_PC  =  005434     |     CAN_PD  =  005435 
    CAN_PE  =  005436     |     CAN_PF  =  005437     |     CAN_RFR =  005424 
    CAN_TPR =  005423     |     CAN_TSR =  005422     |     CARRY   =  00002A 
    CASE_SEN=  000000     |   6 CAT        000525 R   |   6 CCOMMA     0014C6 R
    CC_C    =  000000     |     CC_H    =  000004     |     CC_I0   =  000003 
    CC_I1   =  000005     |     CC_N    =  000002     |     CC_V    =  000007 
    CC_Z    =  000001     |     CELLL   =  000002     |   6 CELLM      000ADF R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]

Symbol Table

  6 CELLP      000AD0 R   |   6 CELLS      000AEE R   |     CFG_GCR =  007F60 
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   6 CHAR1      000EC8 R
  6 CHAR2      000ECB R   |   6 CHKIVEC    001FA4 R   |     CLKOPT  =  004807 
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
    CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2     |   6 CMOV1      000CAA R
  6 CMOV2      000CC2 R   |   6 CMOVE      000CA2 R   |     CNTDWN  =  000032 
  6 CNTXT      000701 R   |   6 COLD       001AA5 R   |   6 COLD1      001AA5 R
  6 COLON      0017F7 R   |   6 COMMA      0014AF R   |   6 COMPI      0014F4 R
    COMPO   =  000040     |   6 CONSTANT   0018A1 R   |   6 COUNT      000C3E R
  6 CPP        00071D R   |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
  6 CR         000EF6 R   |   6 CREAT      00183D R   |     CRR     =  00000D 
  6 CSTOR      000514 R   |   6 CTABLE     002320 R   |   6 CTAT       002341 R
  6 CTINIT     002369 R   |   6 D2SLASH    0028FB R   |   6 D2STAR     002912 R
  6 DABS       00257D R   |   6 DABS1      00258B R   |   6 DAT        000C1E R
    DATSTK  =  001680     |   6 DCLZ       0026CC R   |   6 DCLZ1      0026D5 R
  6 DCLZ4      0026DE R   |   6 DCLZ8      0026EB R   |   6 DCMP       0027E9 R
  6 DCMP2      0027F5 R   |   6 DCMP4      002810 R   |   6 DCMP_EQU   002802 R
  6 DCMP_GRE   00280C R   |   6 DCMP_SMA   002806 R   |   6 DCONST     0018D6 R
  6 DDIG       0025EE R   |   6 DDIGS      002607 R   |   6 DDOT       00261E R
  6 DDOT0      002632 R   |   6 DDOT1      002648 R   |   6 DDROP      0007BD R
  6 DDSLMOD    0029EB R   |   6 DDSTAR3    0029E1 R   |   6 DDUP       0007C8 R
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   6 DECIM      000E22 R
  6 DEPTH      000BA9 R   |   6 DEQU4      002787 R   |   6 DEQUAL     002772 R
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |   6 DGREAT     002793 R
  6 DGREAT4    0027A8 R   |   6 DGTQ1      000E67 R   |   6 DI         0000C4 R
  6 DIG        000D9B R   |   6 DIGIT      000D36 R   |   6 DIGS       000DAC R
  6 DIGS1      000DAC R   |   6 DIGS2      000DB9 R   |   6 DIGTQ      000E36 R
    DISCOVER=  000000     |   6 DLESS      0027B4 R   |   6 DLESS4     0027CA R
  6 DLITER     0028BB R   |   6 DLSHIFT    00292E R   |   6 DLSHIFT1   00293F R
  6 DLSHIFT2   002954 R   |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  6 DN1        000837 R   |   6 DNEG1      002572 R   |   6 DNEGA      00081A R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]

Symbol Table

  6 DNEGAT     002553 R   |   6 DOCONST    0018C1 R   |   6 DOLIT      000471 R
  6 DONXT      000485 R   |     DOORBELL=  000000     |   6 DOSTR      000F0C R
  6 DOT        000FAF R   |   6 DOT1       000FC5 R   |   6 DOTI1      001A26 R
  6 DOTID      001A10 R   |   6 DOTO1      001406 R   |   6 DOTOK      0013EC R
  6 DOTPR      0010D8 R   |   6 DOTQ       001668 R   |   6 DOTQP      000F35 R
  6 DOTR       000F43 R   |   6 DOTS       0019B2 R   |   6 DOTS1      0019BD R
  6 DOTS2      0019C6 R   |   6 DOVAR      00066E R   |   6 DOVER      0028E2 R
  6 DO_DCONS   0018F9 R   |   6 DPLUS      002AE2 R   |   6 DPLUS1     002B09 R
  6 DRAT       002851 R   |   6 DRFROM     002839 R   |   6 DROP       0005A4 R
  6 DROT       002738 R   |   6 DRSHIFT    002965 R   |   6 DRSHIFT1   00296C R
  6 DRSHIFT2   002982 R   |   6 DSIGN      002594 R   |   6 DSIGN1     00259E R
  6 DSLA1      002A05 R   |   6 DSLA2      002A27 R   |   6 DSLA3      002A67 R
  6 DSLA4      002A8D R   |   6 DSLA7      002ABE R   |   6 DSLA8      002AC1 R
  6 DSLA9      002ADC R   |   6 DSLMOD     0025AD R   |   6 DSLMOD3    0025C8 R
  6 DSLMOD4    0025D4 R   |   6 DSLMODa    0025CF R   |   6 DSLMODb    0025DA R
  6 DSSTAR     002655 R   |   6 DSSTAR1    00266C R   |   6 DSSTAR3    002695 R
  6 DSTAR      002988 R   |   6 DSTOR      000BF8 R   |   6 DSUB       002B14 R
  6 DSUB1      002B3B R   |   6 DSWAP      00269E R   |   6 DTOF       00324E R
  6 DTOF1      003257 R   |   6 DTOF2      003265 R   |   6 DTOR       00281B R
  6 DUMP       001968 R   |   6 DUMP1      00197F R   |   6 DUMP3      0019A1 R
  6 DUMPP      001937 R   |   6 DUPP       0005AE R   |   6 DVARIA     00286F R
  6 DZEQUAL    002535 R   |   6 DZLESS     0027D1 R   |   6 DZLESS1    0027DB R
  6 EDIGS      000DD7 R   |   6 EDOT       002D63 R   |   6 EDOT0      002D7A R
  6 EDOT1      002D88 R   |   6 EDOT2      002D8E R   |   6 EDOT3      002DA7 R
  6 EDOT4      002DD6 R   |   6 EDOT5      002DF2 R   |   6 EECSTORE   001D55 R
  6 EEPCP      001B7B R   |   6 EEPLAST    001B4E R   |   6 EEPROM     001B36 R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_R=  000010 
    EEPROM_S=  000800     |   6 EEPRUN     001B65 R   |   6 EEPVP      001B91 R
  6 EESTORE    001DA1 R   |   6 EE_CCOMM   00206B R   |   6 EE_COMMA   00204A R
  6 EE_CREAD   001CE6 R   |   6 EE_READ    001CC4 R   |   6 EI         0000BD R
  6 ELSEE      0015C7 R   |   6 EMIT       000436 R   |   6 ENEPER     00228B R
    EOL_CR  =  000001     |     EOL_LF  =  000000     |   6 EQ1        000894 R
  6 EQUAL      00087E R   |   6 ERASE      000D04 R   |     ERR     =  00001B 
  6 EVAL       00142F R   |   6 EVAL1      00142F R   |   6 EVAL2      00144B R
  6 EXE1       000C99 R   |   6 EXECU      0004E3 R   |     EXT     =  000000 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |   6 EXTRC      000D5E R
  6 FADDR      002138 R   |   6 FARAT      001BFC R   |   6 FARCAT     001C08 R
  6 FC_XOFF    000463 R   |   6 FC_XON     00044D R   |   6 FDOT       002E01 R
  6 FDOT0      002E3F R   |   6 FDOT1      002E2E R   |   6 FDOT10     002E9B R
  6 FDOT2      002E4D R   |   6 FDOT3      002E66 R   |   6 FDOT6      002E76 R
  6 FDOT7      002E7B R   |   6 FDOT8      002E83 R   |   6 FDOT9      002E8B R
  6 FER        002BBE R   |     FHSE    =  7A1200     |     FHSI    =  F42400 
  6 FILL       000CD1 R   |   6 FILL1      000CEE R   |   6 FILL2      000CF7 R
  6 FIND       0011CD R   |   6 FIND1      0011EB R   |   6 FIND2      001219 R
  6 FIND3      001225 R   |   6 FIND4      001239 R   |   6 FIND5      001246 R
  6 FIND6      00122A R   |   6 FINIT      002BB4 R   |     FLASH_BA=  008000 
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
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |   6 FLOATQ     002F13 R
  6 FLOATQ0    002F1D R   |   6 FLOATQ1    002F82 R   |   6 FLOATQ2    002F8B R
  6 FLOATQ3    002F93 R   |   6 FLOATQ4    002FA7 R   |   6 FLOAT_ER   002FBC R
  6 FLOAT_ER   002FB9 R   |     FLSI    =  01F400     |   6 FMOVE      002143 R
  6 FMOVE2     002174 R   |   6 FNE        002BE0 R   |   6 FOR        001544 R
  6 FORGET     00015A R   |   6 FORGET1    000189 R   |   6 FORGET2    00020F R
  6 FORGET4    000218 R   |   6 FORGET6    0001D1 R   |   6 FOV        002BF5 R
  6 FPSTOR     001B17 R   |   6 FPSW       002B8E R   |     FPTR    =  000034 
  6 FREEVAR    000225 R   |   6 FREEVAR4   00025B R   |   6 FRESET     002BA0 R
  6 FSLASH     0031B2 R   |   6 FSLASH1    0031DE R   |   6 FSLASH8    003235 R
  6 FSTAR      00318B R   |   6 FTOD       003272 R   |   6 FTOD1      0032A2 R
  6 FTOD2      0032BB R   |   6 FTOD3      0032C5 R   |   6 FTOD4      0032D0 R
  6 FTOD5      0032D8 R   |   6 FTOD6      0032F8 R   |   6 FTOD8      0032FD R
  6 FTOD9      003308 R   |   6 FZE        002BCB R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
  6 GREAT      0008F9 R   |   6 GREAT1     00090F R   |   6 HDOT       000F92 R
  6 HERE       000C55 R   |   6 HEX        000E0D R   |   6 HI         001A62 R
  6 HLD        0006EE R   |   6 HOLD       000D82 R   |     HSECNT  =  004809 
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
  6 ICOLON     001808 R   |   6 IFETCH     001562 R   |   6 IFF        00159F R
  6 IFMOVE     00221C R   |   6 ILOG       002B48 R   |   6 ILOG1      002B53 R
  6 ILOG2      002B7D R   |     IMEDD   =  000080     |   6 IMMED      00181A R
  6 INCH       00042A R   |   6 INC_FPTR   001C91 R   |   6 INITOFS    0017D0 R
  6 INN        00069C R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
    INPUT_FL=  000000     |     INPUT_PU=  000001     |   6 INTE1      0013CE R
  6 INTER      0013A4 R   |   6 INTQ       0023C5 R   |     INT_ADC2=  000016 
    INT_AUAR=  000012     |     INT_AWU =  000001     |     INT_CAN_=  000008 
    INT_CAN_=  000009     |     INT_CLK =  000002     |     INT_EXTI=  000003 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]

Symbol Table

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
  6 INVER      0007F7 R   |     IPR0    =  000002     |     IPR1    =  000001 
    IPR2    =  000000     |     IPR3    =  000003     |     IPR_MASK=  000003 
    IRET_COD=  000080     |   6 ISEMI      001765 R   |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   6 JSRC       0017BA R   |   6 KEY        000E76 R
  6 KTAP       0012BE R   |   6 KTAP1      0012E1 R   |   6 KTAP2      0012E4 R
  6 LAST       00072D R   |   6 LASTN   =  00326E R   |   6 LBRAC      0013DB R
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
  6 LESS       0008BB R   |     LF      =  00000A     |   6 LINK    =  00326E R
  6 LITER      001516 R   |   6 LN2S       0022E7 R   |   6 LOCK       001C7D R
  6 LOG2S      0022D1 R   |   6 LSCALE     002FDD R   |   6 LSHIFT     000B19 R
  6 LSHIFT1    000B22 R   |   6 LSHIFT4    000B2A R   |   6 LT1        0008D1 R
    MASKK   =  001F7F     |   6 MAX        000919 R   |   6 MAX1       00092C R
    MAX_MANT=  7FFFFF     |   6 MIN        000936 R   |   6 MIN1       000949 R
  6 MMOD1      0009D2 R   |   6 MMOD2      0009E6 R   |   6 MMOD3      0009FD R
  6 MMSM1      00098D R   |   6 MMSM3      000991 R   |   6 MMSM4      00099D R
  6 MMSMa      000998 R   |   6 MMSMb      0009A3 R   |   6 MMSTA1     0030B6 R
  6 MMSTA2     0030C1 R   |   6 MMSTA3     0030CC R   |   6 MMSTA4     00313A R
  6 MMSTA5     00314C R   |   6 MMSTA6     003165 R   |   6 MMSTA7     003182 R
  6 MMSTAR     0030AB R   |   6 MODD       000A17 R   |   6 MONE       000B80 R
    MS      =  000030     |   6 MSEC       0002D0 R   |   6 MSMOD      0009B5 R
  6 MSTA1      000AA8 R   |   6 MSTAR      000A85 R   |     NAFR    =  004804 
  6 NAMEQ      001266 R   |   6 NAMET      001177 R   |     NCLKOPT =  004808 
  6 NDROT      0026FC R   |   6 NEGAT      000808 R   |   6 NEX1       000492 R
  6 NEXT       001553 R   |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   6 NROT       00079B R
  6 NTIB       0006AC R   |     NUBC    =  004802     |     NUCLEO  =  000001 
  6 NUFQ       000E8C R   |   6 NUFQ1      000EA5 R   |   6 NUMBQ      00246E R
  6 NUMQ0      0024AF R   |   6 NUMQ1      0024D1 R   |   6 NUMQ3      0024FB R
  6 NUMQ4      00251C R   |   6 NUMQ8      002525 R   |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   6 NonHandl   000000 R   |   6 OFFSET     000752 R
    OFS     =  000005     |   6 ONE        000B72 R   |   6 ONEM       000B08 R
  6 ONEP       000AFB R   |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]

Symbol Table

    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTIMIZE=  000001 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  6 ORIG       000049 R   |   6 ORR        000621 R   |   6 OUTPUT     00043B R
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |   6 OVER       0005D8 R   |   6 OVERT      001733 R
    PA      =  000000     |   6 PACKS      000D15 R   |   6 PAD        000C66 R
  6 PAREN      0010E7 R   |   6 PARS       000FE0 R   |   6 PARS1      00100B R
  6 PARS2      001036 R   |   6 PARS3      001039 R   |   6 PARS4      001042 R
  6 PARS5      001065 R   |   6 PARS6      00107A R   |   6 PARS7      001089 R
  6 PARS8      001098 R   |   6 PARSE      0010A9 R   |   6 PARSEXP_   002EF6 R
  6 PAUSE      0002E0 R   |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |   6 PDUM1      00194A R   |   6 PDUM2      00195B R
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
    PH_ODR  =  005023     |     PI      =  000028     |   6 PICK       000BC0 R
  6 PII        00224A R   |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   6 PLUS       0007DD R   |   6 PNAM1      0016D8 R
  6 POSMANT    002CD4 R   |   6 PRESE      00145A R   |     PROD1   =  000024 
    PROD2   =  000026     |     PROD3   =  000028     |   6 PROTECTE   000201 R
  6 PSTOR      000BD7 R   |     PTR16   =  000035     |     PTR8    =  000036 
  6 PTRPLUS    001CA9 R   |   6 QBRAN      0004A4 R   |   6 QDUP       00076B R
  6 QDUP1      000775 R   |   6 QKEY       000418 R   |   6 QSTAC      001412 R
  6 QUERY      00133E R   |   6 QUEST      000FD2 R   |   6 QUIT       001477 R
  6 QUIT1      00147F R   |   6 QUIT2      001482 R   |   6 RAM2EE     0020E4 R
    RAMBASE =  000000     |   6 RAMLAST    000740 R   |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   6 RANDOM     00027E R
  6 RAT        00056B R   |   6 RBRAC      0017A7 R   |   6 REPEA      00161C R
  6 RFREE      0020CB R   |   6 RFROM      000558 R   |     ROP     =  004800 
  6 ROT        00077C R   |   6 ROW2BUF    00208D R   |     ROWBUFF =  001680 
    RP0     =  00002E     |   6 RPAT       000535 R   |     RPP     =  0017FF 
  6 RPSTO      000542 R   |   6 RSCALE     003003 R   |   6 RSHIFT     000B35 R
  6 RSHIFT1    000B3E R   |   6 RSHIFT4    000B46 R   |     RST_SR  =  0050B3 
  6 RT12_2     0022BA R   |   6 SAME1      001195 R   |   6 SAME2      0011BE R
  6 SAMEQ      00118D R   |   6 SCAL1      003036 R   |   6 SCAL2      003062 R
  6 SCALETOM   003030 R   |   6 SCOM1      00170D R   |   6 SCOM2      001710 R
  6 SCOMP      0016EF R   |   6 SEED       000265 R   |     SEEDX   =  000038 
    SEEDY   =  00003A     |   6 SEMIS      001743 R   |   6 SETISP     0000D0 R
  6 SET_RAML   00188A R   |   6 SFN        002C41 R   |     SFR_BASE=  005000 
    SFR_END =  0057FF     |   6 SFV        002C79 R   |   6 SFZ        002C0A R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]

Symbol Table

  6 SIGN       000DC1 R   |   6 SIGN1      000DD1 R   |   6 SLASH      000A21 R
  6 SLMOD      000A05 R   |   6 SNAME      0016A2 R   |     SP0     =  00002C 
  6 SPACE      000EAE R   |   6 SPACS      000EBD R   |   6 SPAT       00058E R
    SPI_CR1 =  005200     |     SPI_CR2 =  005201     |     SPI_CRCP=  005205 
    SPI_DR  =  005204     |     SPI_ICR =  005202     |     SPI_RXCR=  005206 
    SPI_SR  =  005203     |     SPI_TXCR=  005207     |     SPP     =  001680 
    SPSAVE  =  000001     |   6 SPSTO      00059B R   |   6 SQRT10     0022A3 R
  6 SQRT2      002261 R   |   6 SQRT3      002278 R   |   6 SSMOD      000AB1 R
    SSP     =  000001     |     STACK   =  0017FF     |   6 STAR       000A7A R
  6 STASL      000AC2 R   |   6 STEXP      002CE4 R   |   6 STEXP1     002CFA R
  6 STEXP2     002D36 R   |   6 STEXP3     002D49 R   |   6 STOD       00083F R
  6 STORE      0004F0 R   |   6 STR        000DEF R   |   6 STRCQ      001524 R
  6 STRQ       00165B R   |   6 STRQP      000F2B R   |   6 SUBB       000856 R
  6 SWAPP      0005BE R   |     SWIM_CSR=  007F80     |   6 TAP        0012A8 R
  6 TBOOT      001A99 R   |   6 TBRAN      0004BC R   |   6 TBUF       0006BC R
    TBUFFBAS=  001680     |   6 TCHAR      000B91 R   |   6 TEMP       00068D R
  6 TEVAL      0006DF R   |   6 TFLASH     0006CE R   |   6 THENN      0015B4 R
  6 TIB        000C77 R   |     TIBB    =  001700     |     TIBBASE =  001700 
    TIC     =  000027     |   6 TICK       00148E R   |     TIM1_ARR=  005262 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]

Symbol Table

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
  6 TNAM2      0019E0 R   |   6 TNAM3      0019FE R   |   6 TNAM4      001A04 R
  6 TNAME      0019DD R   |   6 TOFLASH    000335 R   |   6 TOKEN      001169 R
  6 TOR        000577 R   |   6 TORAM      000375 R   |     TRUEE   =  00FFFF 
  6 TWOSL      000B4D R   |   6 TYPE1      000EDD R   |   6 TYPE2      000EE9 R
  6 TYPES      000ED8 R   |   6 Timer4Ha   000005 R   |     UART1   =  000000 
    UART1_BA=  005230     |     UART1_BR=  005232     |     UART1_BR=  005233 
    UART1_CR=  005234     |     UART1_CR=  005235     |     UART1_CR=  005236 
    UART1_CR=  005237     |     UART1_CR=  005238     |     UART1_DR=  005231 
    UART1_GT=  005239     |     UART1_PO=  000000     |     UART1_PS=  00523A 
    UART1_RX=  000004     |     UART1_SR=  005230     |     UART1_TX=  000005 
    UART3   =  000001     |     UART3_BA=  005240     |     UART3_BR=  005242 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]

Symbol Table

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
  6 UDIV10     003063 R   |   6 UDOT       000F7E R   |   6 UDOTR      000F5E R
  6 UEND       000047 R   |     UFPSW   =  000008     |   6 UGREAT     0008DA R
  6 UGREAT1    0008F1 R   |     UHLD    =  000014     |     UINN    =  00000C 
    UINTER  =  000012     |     ULAST   =  00001C     |   6 ULES1      0008B3 R
  6 ULESS      00089D R   |   6 UMMOD      000971 R   |   6 UMSTA      000A30 R
  6 UNIQ1      001699 R   |   6 UNIQU      00167A R   |   6 UNLKEE     001C17 R
  6 UNLKFL     001C36 R   |   6 UNLOCK     001C55 R   |   6 UNTIL      00157C R
    UOFFSET =  00001E     |   6 UPDATCP    001BD4 R   |   6 UPDATLAS   001BAB R
  6 UPDATPTR   0021D7 R   |   6 UPDATRUN   001BC3 R   |   6 UPDATVP    001BEB R
  6 UPL1       000662 R   |   6 UPLUS      00064B R   |     UPP     =  000006 
  6 UPPER      00112C R   |   6 UPPER1     00114F R   |   6 UPPER2     001158 R
    URLAST  =  000022     |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     UTFLASH =  000020     |     UTIB    =  000010 
    UTMP    =  00000A     |   6 UTYP1      00191A R   |   6 UTYP2      001929 R
  6 UTYPE      001915 R   |     UVP     =  000018     |   6 UZERO      00002B R
  6 VARIA      001857 R   |     VAR_BASE=  000080     |     VAR_TOP =  0017BF 
    VER     =  000003     |   6 VPP        00070F R   |     VSIZE   =  000006 
    WANT_CON=  000001     |     WANT_DEB=  000000     |     WANT_DOU=  000001 
    WANT_FLO=  000001     |     WANT_SCA=  000001     |     WANT_SEE=  000000 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |   6 WHILE      001602 R
  6 WITHI      000956 R   |   6 WORDD      001112 R   |   6 WORDS      001A3A R
  6 WORS1      001A40 R   |   6 WORS2      001A5C R   |   6 WR_BYTE    001D00 R
  6 WR_WORD    001D25 R   |   6 WTABLE     00232F R   |   6 WTAT       002353 R
  6 WTINIT     002398 R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XMEM_SIZ=  017830     |     XOFF    =  000013     |     XON     =  000011 
  6 XORR       000636 R   |     XTEMP   =  000024     |     YTEMP   =  000026 
  6 ZEQ1       002545 R   |   6 ZEQU1      000603 R   |   6 ZEQUAL     0005F9 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]

Symbol Table

  6 ZERO       000B67 R   |   6 ZL1        0005F0 R   |   6 ZLESS      0005E7 R
  6 app_spac   003380 R   |   6 baudrate   00037B R   |   6 block_er   001DEB R
  6 clear_ra   000019 R   |   6 clock_in   000064 R   |   6 copy_buf   001E4B R
  6 copy_buf   001E6A R   |   6 copy_pro   001E6A R   |     da      =  000002 
    db      =  000003     |     dc      =  000000     |     dd      =  000001 
  6 do2lit     0028C6 R   |   6 erase_fl   001E0D R   |   6 fmove_do   0021C0 R
  6 main       000016 R   |   6 next_row   00217D R   |   6 no_move    0021C7 R
  6 nsign      0023E3 R   |   6 nsign1     002414 R   |   6 parse_di   00241B R
  6 parse_ex   002EAB R   |   6 pristine   001EEB R   |   6 proceed_   001E10 R
  6 reboot     000327 R   |   6 reset_ve   001F52 R   |   6 row_eras   001DCB R
  6 row_eras   001E24 R   |   6 row_eras   001E4B R   |   6 set_opti   001EBF R
  6 set_vect   001FF3 R   |   6 uart_ini   000076 R   |   6 write_ro   001E8F R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   3380   flags    0

