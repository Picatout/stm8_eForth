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
    sub sp,#n 
    .endm 
    
    ; free space on stack
    .macro _drop n 
    addw sp,#n 
    .endm

    ; declare ARG_OFS for arguments 
    ; displacement on stack. This 
    ; value depend on local variables 
    ; size.
    .macro _argofs n 
    ARG_OFS=2+n 
    .endm 

    ; declare a function argument 
    ; position relative to stack pointer 
    ; _argofs must be called before it.
    .macro _arg name ofs 
    name=ARG_OFS+ofs 
    .endm 
