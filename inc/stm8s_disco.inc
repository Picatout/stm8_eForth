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
LD1_BIT = 0 
LD1_MASK = (1<<0)  
LD1_PORT = PD_ODR

; BEEP
BEEP_BIT = 4 
BEEP_MASK = (1<<4)
BEEP_PORT = PD_ODR 

; TS1 
; use TIMER 1 3 channels 


