\ float.asm library test suite 

decimal 


\ 1) check for stack underflow 
\ 2) check if last operation left data on stack 
\    is so display stack state 
: stack-check 
    ?stack \ abort if stack underflow
    depth if 
        cr ." ERROR: left over on stack"
        .s
        abort  
    then 
;

\ display expected  f2, and result f1 
: fresult ( f1 f2 -- )
    cr
    2dup 2>r 
    2over 2>r  
    ."  expected:" f.
    ."  result:" f. 
    2r> 2r> 
    F= NOT IF 
        ."  TEST FAILED " 
        ABORT 
    THEN 
    stack-check  
    cr 
; 

\ display expected double integer d2 and result d1 
: dresult ( d1 d2 -- )
    cr
    2dup 2>r 
    2over 2>r 
    ."  expected: " d. 
    ."  result: " d.
    2r> 2r> 
    D= NOT IF 
        ."  TEST FAILED " 
        ABORT 
    THEN 
    stack-check
    cr
;

\ display expected integer i2 and result i1 
: iresult ( i1 i2 -- )
    cr
    2DUP 2>R
    ."  expected: " . 
    ."  result: " .
    2R>
    = NOT IF 
        ."  TEST FAILED " 
        ABORT 
    THEN 
    stack-check
    cr
;

: show-version 
    float-ver 
;

:  display 
    preset 
    cr
    ." display test" cr 
    ." 3.141592e F." 
    3.141592e  F. cr  stack-check 
    ." 6.02214e23 F."
    6.02214e23 f. cr  stack-check
    ." 1.0e8 f. " 
    1.0e8 f. cr  stack-check
;

: convert
    preset 
    cr
    ." format convertion test." cr 
    ." 1234567.  d>f"    
    1234567.  d>f  1234567e fresult
    ." 345.67e f>d" 
    345.67e f>d  345. dresult 
    ." -987654. d>f 2dup 2>R" 
    -987654. d>f 2dup 2>R -987654E fresult
    ." 2r> f>d d." 
    2r> f>d  -987654. dresult     
;


:  math 
    cr 
    ." math tests"
    cr 
    ." 3.141592e 2dup f*" 
    3.141592e 2dup f*  9.86960e fresult 
    ." -6.283184e 3.e f/"
    -6.283184e 3.e f/   -2.094394e fresult
    ." 6.02214e23 15.7e25 f+" 
    6.02214e23 15.7e25 f+  1.576022E26 fresult 
    ." 12.04428e23 15.7e25 f-" 
    12.04428e23 15.7e25 f- -1.557955E26 fresult 
    ." -6.02214e23 1.567e27 f+"
     -6.02214e23 1.567e27 f+ 1.566397E27 fresult 
    ." -6.022e23 fnegate" 
    -6.022e23 fnegate  6.022E23 fresult 
    ." 42.234e fnegate"
    42.234e fnegate  -42.234e  fresult  
    ." -1e6 fabs"
    -1e6 fabs  1e6 fresult 
;

: compare 
    cr 
    ." comparison tests"
    cr
    ." -6.2e10 f0< ." 
    -6.2e10 f0<  -1 iresult  
    ." 6.2e f0= ."
    6.2e f0= 0 iresult 
    ." 0.0e f0= ."
    0.0e f0= -1 iresult  
    ." 6.223e 6.22e f> ." 
    6.223e 6.22e f> -1 iresult  
    ." -6.223e -6.22e f> ."
     -6.223e -6.22e f> 0 iresult 
    ." 1.5e2 3.2e1 f< ."
    1.5e2 3.2e1 f< 0 iresult 
    ." 153.2e 160.3e f< ."
    153.2e 160.3e f< -1 iresult 
    ." 15.32e2 1532.e f= ."
    15.32e2 1532.e f= -1 iresult 
;   

: performance 
    cr ." performance test" cr
    msec 1000 for 3.141592e 2.51e f* 2drop next msec swap -  
    . ."  msec for 1000 F*" cr 
    msec 1000 for 3.141592e 2.51e f/ 2drop next msec swap -  
    . ."  msec for 1000 F/" cr
    msec 1000 for 3.141592e 4.14231e f+ 2drop next msec swap - 
    . ."  msec for 1000 F+" cr 
    msec 1000 for 3.141592e 5.1434e f- 2drop next msec swap - 
    . ."  msec for 1000 F-" cr  
;

: all-test
    show-version 
    display 
    convert 
    math 
    compare 
    performance 
;
