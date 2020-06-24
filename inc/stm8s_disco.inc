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


