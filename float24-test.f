\ float24 library test 


22046 -4 f24const c1 

f24var v1

: var-test 
    31416 -2 v1 f24! 
    cr v1 f24@  f. 
    cr v1 f24@  e. 
;

: const-test 
    cr c1 f. 
    cr c1 e.
; 


: performance 
    cr ." performance test" cr
    msec 1000 for 3.1416 2.51 f* 2drop next msec swap -  
    . ."  msec for 1000 F*" cr 
    msec 1000 for 3.1416 2.51 f/ 2drop next msec swap -  
    . ."  msec for 1000 F/" cr
    msec 1000 for 3.1416 414.2 f+ 2drop next msec swap - 
    . ."  msec for 1000 F+" cr 
    msec 1000 for 3.1416 5.143 f- 2drop next msec swap - 
    . ."  msec for 1000 F-" cr  
;

