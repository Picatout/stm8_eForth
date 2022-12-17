\ float24 library test 


2.2046 fconst c1 

fvar v1

\ 1) check for stack underflow 
\ 2) check if last operation left data on stack 
\    is so display stack state 
: stack-check 
    ?stack \ abort if stack underflow
    depth if 
        cr ." ERROR: left over on stack"
        .s 
    then 
;

: 2OVER ( d1 d2 -- d1 d2 d1 )
    >R OVER >R >R
    OVER R> SWAP R> R> <ROT 
;

\ display expected  f2, and result f1 
: fresult ( f1 f2 -- )
    cr 
    2DUP >R >R 
    2OVER >R >R
    ."  expected:" f.
    ."  result:" f. 
    R> R> R> R> 
    F= NOT IF 
        ."  TEST FAILED " 
        ABORT 
    THEN 
    stack-check  
; 

\ display expected integer i2 and result i1 
: iresult ( i1 i2 -- )
    cr
    2DUP >R >R 
    ."  expected: " . 
    ."  result: " .
    R> R>  
    = NOT IF 
        ."  TEST FAILED " 
        ABORT 
    THEN 
    stack-check
;

: var-test
    preset 
    cr ." fvar test "
    cr ." 3.1416 v1 f! "
    3.1416 v1 f! 
    cr ." v1 f@  f. "
    cr v1 f@  3.1416 fresult 
;

: const-test
    preset 
    cr ." fconst test" 
    cr ." c1 f. "    
    cr c1 2.2046 fresult
; 

: convert  
    preset 
    cr ." type conversion test"
    cr ." 32767 S>F "
    32767 S>F  32767. fresult 
    cr ." -12 S>F "
    -12 S>F -12.000 fresult
    cr ." -1.2 F>S "
    -1.2 F>S  -1 iresult 
    cr ." 21e-1 F>S "
    21e-1 f>s  2 iresult  
    cr ." 21e-2 F>S "
    21e-2 f>s  0 iresult  
    cr ." 2e6 F>S " 
    2e6 f>s  -32768 iresult
    cr ." 2e23 F>S "
    2e23 f>s -32768 iresult  
;

: fabs-test
    preset 
    cr ." FABS test" 
    cr ." 0.0 FABS " 
    0.0  fabs 0.0  fresult
    cr ." 3.1416 FABS "
    3.1416 FABS 3.1416  fresult
    cr ." -6.022e23 FABS "
    -6.022e23 fabs 6.022e23  fresult 
;

: fnegate-test 
    preset 
    CR ." FNEGATE test"
    cr ." 0.0 FNEGATE " 
    0.0 FNEGATE 0.0 fresult
    CR ." 6.022E23 FNEGATE " 
    6.022E23 FNEGATE -6.022E23 FRESULT
    CR ." -3.1416 FNEGATE "
    -3.1416 FNEGATE 3.1416 FRESULT 
;

\ add and subtract test 
: add-test 
    preset 
    cr ." f+ f- test"
    cr ." 3.1416 .014 f- "
    3.1416 .014 f- 3.1276 fresult 
    cr ." -32767. -32767 f- "
    -32767. -32767. f- 0.0 fresult 
    cr ." 3.1416 .14 f+ "
    3.1416 .14 f+ 3.282 fresult 
    cr ." -31416. -1400. f+"
    -31416. -1400. f+ -3282e1 fresult 
;

\ f* f/ test 
: prod-test
    preset 
    cr ." F* test"
    cr ." 3.1416e3 15.0 f* "  
    3.1416e3 15. f* 4.712e4 fresult 
    cr ." 3.1416e3 5.4 f* "
    3.1416e3 5.4 f* 16965. fresult
    cr ." -45.23e6 123. f* "
    -45.23e6 123. f* -5.563e9 fresult 
;

: div-test
    preset 
    cr ." F/ test "
    cr ." 32767. 2. f/  "
    32767. 2. f/ 16384. fresult 
    cr ." 6.022e23 5.1e10 f/ "
    6.022e23 5.1e10 f/  1.1808e13 fresult 
    cr ." -6.022e23 5.1e10 f/ "
    -6.022e23 5.1e10 f/ -1.1808e13 fresult 
;

: compare 
    preset 
    cr ." comparisons test"
    cr ." -1.e-127 f0< "
    -1.e-127 f0< -1 iresult 
    cr ." 0.0 f0= "
    0.0 f0= -1  iresult 
    cr ." 0.1e-0 f0= "
    0.1e-0  f0= 0 iresult 
    cr ." 4.15 -415. f> "
    4.15 -415. f> -1 iresult 
    cr ." 415e-120 4.15 f< "
    415e-120 4.15 f< -1 iresult 
    cr ." -41.5e-120 4.15 f> "
    -41.5e-120 4.15 f> 0 iresult 
    cr ." -41.5e-120 4.15 f< "
    -41.5e-120 4.15 f< -1 iresult 
; 

: reps  ( n -- )
    ." ," . ."  times." cr 
;
: performance 
    preset 
    cr ." performance test" cr
    msec 1000 for 3.1416 2.51 f* 2drop next msec swap -  
    . ."  msec 3.1416 2.51 f*" 1000 reps 
    msec 1000 for 32.767 327.67 f* 2drop next msec swap -
    . ."  msec 32.767 327.67 f*" 1000 reps  
    msec 1000 for 3.1416 2.51 f/ 2drop next msec swap -  
    . ."  msec 3.1416 2.51 f/" 1000 reps
    msec 1000 for 3.1416 414.2 f+ 2drop next msec swap - 
    . ."  msec 3.1416 414.2 f+" 1000 reps 
    msec 1000 for 3.1416 51.43 f- 2drop next msec swap - 
    . ."  msec 3.1416 51.43 f-" 1000 reps  
    stack-check  
;

: all-test
    var-test cr 
    const-test cr 
    convert cr 
    fabs-test cr 
    fnegate-test cr
    add-test cr
    prod-test cr
    div-test cr 
    compare cr
    performance cr
; 

