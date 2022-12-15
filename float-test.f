\ float.asm library test suite 

decimal 

: cls 
    27 emit 91 emit 50 emit $4a emit 
    27 emit 91 emit $48 emit 
;

cls 

: show-version 
    float-ver 
;

: convert 
    cr
    ." format convertion test." cr 
    ." 1234567.  d>f f. "    
    1234567.  d>f f. cr 
    ." 345.67e f>d d." 
    345.67e f>d d. cr 
    ." -987654. d>f 2dup f." 
    -987654. d>f 2dup f. cr 
    ." f>d d." 
    f>d d. cr    
;

:  display  
    cr
    ." display test" cr 
    ." 3.141592e 2dup F. E." 
    3.141592e 2dup F. E. cr 
    ." 6.02214e23 2dup f. e."
    6.02214e23 2dup f. e. cr 
    ." 1.0e8 2dup f. e." 
    1.0e8 2dup f. e. cr 
;


:  math 
    cr 
    ." math tests"
    cr 
    ." 3.141592e 2dup f* f." 
    3.141592e 2dup f* f. cr 
    ." -6.283184e 3.e f/ f."
    -6.283184e 3.e f/ f. cr 
    ." 6.02214e23 15.7e25 f+ f." 
    6.02214e23 15.7e25 f+ f. cr 
    ." 12.04428e23 15.7e25 f- f." 
    12.04428e23 15.7e25 f- f. cr
    ." -6.02214e23 1.567e27 f+ f."
     -6.02214e23 1.567e27 f+ f. cr 
    ." -6.022e23 fnegate f." 
    -6.022e23 fnegate f. cr 
    ." 42.234e fnegate f."
    42.234e fnegate f. cr 
    ." -1e6 fabs f."
    -1e6 fabs f. cr
;

: compare 
    cr 
    ." comparison tests"
    cr
    ." -6.2e10 f0< ." 
    -6.2e10 f0< . cr 
    ." 6.2e f0= ."
    6.2e f0= . cr 
    ." 0.0e f0= ."
    0.0e f0= . cr 
    ." 6.223e 6.22e f> ." 
    6.223e 6.22e f> . cr 
    ." -6.223e -6.22e f> ."
     -6.223e -6.22e f> . cr 
    ." 1.5e2 3.2e1 f< ."
    1.5e2 3.2e1 f< . cr 
    ." 153.2e 160.3e f< ."
    153.2e 160.3e f< . cr 
    ." 15.32e2 1532.e f= ."
    15.32e2 1532.e f= . cr 
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
    convert 
    display 
    math 
    compare 
    performance 
;
