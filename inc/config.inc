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
; board set it to 1 and the other
; to 0. 
NUCLEO=1  
DISCOVERY=0

; set to 1 to include 
; scaling constants vocabulary
; see: const_ratio.asm 
WANT_SCALING_CONST = 1

; set to 1 to include 
; constants tables vocabulary 
; see: ctable.asm 
WANT_CONST_TABLE=1

; how many bytes are reserved 
; by system at EEPROM base.
EEPROM_RES = 16 


.if NUCLEO 
	.include "inc/nucleo_8s208.inc"
	.include "inc/stm8s208.inc"

XMEM_SIZE=96304 ; size in bytes of EXTENDED MEMORY 
UART_SR=UART1_SR
UART_DR=UART1_DR

.else ; DISCOVERY
	.include "inc/stm8s105.inc"
	.include "inc/stm8s_disco.inc"

XMEM_SIZE=0 ; size in bytes of EXTENDED MEMORY 
UART_SR=UART2_SR
UART_DR=UART2_DR

.endif 


