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

;-------------------------------------
; STM8S-Discovery card 
;-------------------------------------


FHSE = 16000000 ; Hertz crystal
FHSE_K = 16000 ; 16000 Khz
FHSE_M = 16 ; Mhz 


; LD1 LED 
LED_PORT = PD_ODR
LED_DDR=PD_DDR 
LED_CR1=PD_CR1
LED_CR2=PD_CR2 
LED_BIT = 0 
LED_MASK = (1<<0)  

; BEEP
BEEP_BIT = 4 
BEEP_MASK = (1<<4)
BEEP_PORT = PD_ODR 

; TS1 
; use TIMER 1 3 channels 

XMEM_SIZE=0 ; size in bytes of EXTENDED MEMORY 

UART_SR=UART2_SR
UART_DR=UART2_DR
UART_BRR1=UART2_BRR1
UART_BRR2=UART2_BRR2
UART_CR1=UART2_CR1
UART_CR2=UART2_CR2
UART_PCKEN=CLK_PCKENR1_UART2

; port used by  UART2 
UART_PORT=UART2_PORT 
UART_PORT_ODR=UART_PORT 
UART_PORT_IDR=UART_PORT+1
UART_PORT_DDR=UART_PORT+2
UART_PORT_CR1=UART_PORT+3
UART_PORT_CR2=UART_PORT+4


UART_TX_PIN=UART2_TX_PIN
UART_RX_PIN=UART2_RX_PIN
