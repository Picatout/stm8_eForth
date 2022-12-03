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

; mcu on board is stm8s207k8

; crystal on board is 8Mhz
; st-link crystal 
FHSE = 8000000

; LD3 is user LED
; connected to PC5 via Q2
LED_DDR=PC_DDR 
LED_CR1=PC_CR1
LED_CR2=PC_CR2 
LED_PORT = PC_ODR ;port C
LED_BIT = 5
LED_MASK = (1<<LED_BIT) ;bit 5 mask

; user interface UART via STLINK (T_VCP)

UART=UART3 
; port used by  UART3 
UART_PORT_ODR=PC_ODR 
UART_PORT_DDR=PC_DDR 
UART_PORT_IDR=PC_IDR 
UART_PORT_CR1=PC_CR1 
UART_PORT_CR2=PC_CR2 

; clock enable bit 
UART_PCKEN=CLK_PCKENR1_UART3 

; uart3 registers 
UART_SR=UART3_SR
UART_DR=UART3_DR
UART_BRR1=UART3_BRR1
UART_BRR2=UART3_BRR2
UART_CR1=UART3_CR1
UART_CR2=UART3_CR2
CLK_PCKENR1_UART=CLK_PCKENR1_UART3
UART_PORT=UART3_PORT 
UART_TX_PIN=UART3_TX_PIN 
UART_RX_PIN=UART3_RX_PIN 
