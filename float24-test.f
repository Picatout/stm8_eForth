\ float24 library test 


2.2046 fconst c1 

fvar v1

\ display expected result f2, and result f1 
: result ( f1 f2 -- )
    cr 
    ."  expected:" f.
    ."  result:" f. 
; 

: var-test
    cr ." 3.1416 v1 f! "
    3.1416 v1 f! 
    cr ." v1 f@  f. "
    cr v1 f@  f.
    cr ." v1 f@  e. " 
    cr v1 f@  e. 
;

: const-test
    cr ." fconst test" 
    cr ." c1 f. "    
    cr c1 2.2046 result
; 

: fabs-test
    cr ." FABS test" 
    cr ." 0.0 FABS " 
    0.0  fabs 0.0  result
    cr ." 3.1416 FABS "
    3.1416 FABS 3.1416  result
    cr ." -6.022e23 FABS "
    -6.022e23 fabs 6.022e23  result 
;

: fnegate-test 
    CR ." FNEGATE test"
    cr ." 0.0 FNEGATE " 
    0.0 FNEGATE 0.0 result
    CR ." 6.022E23 FNEGATE " 
    6.022E23 FNEGATE -6.022E23 RESULT
    CR ." -3.1416 FNEGATE "
    -3.1416 FNEGATE 3.1416 RESULT 
;

\ add and subtract test 
: add-test 
    cr ." f+ f- test"
    cr ." 3.1416 .014 f- "
    3.1416 .014 f- 3.1276 result 
    cr ." 3.1416 .14 f+ "
    3.1416 .14 f+ 3.282 result 
    cr ." -31416. -1400. f+"
    -31416. -1400. f+ -3282e1 result  
;

\ f* f/ test 
: prod-test
    cr ." F* F/ test"
    cr ." 3.1416e3 15.0 f* "  
    3.1416e3 15. f* 4.712e4 result 
    cr ." 3.1416e3 5.4 f* "
    3.1416e3 5.4 f* 16965. result 
    cr ." 6.022e23 5.1e10 f/ "
    6.022e23 5.1e10 f/  1.1808e13 result 
    cr ." -6.022e23 5.1e10 f/ "
    -6.022e23 5.1e10 f/ -1.1808e13 result 
;

: bool-result 
    cr
    ."  expected: " . ."  result: " .
;

: compare 
    cr ." comparisons test"
    cr ." -1.e-127 f0< "
    -1.e-127 f0< -1 bool-result 
    cr ." 0.0 f0= "
    0.0 f0= -1  bool-result 
    cr ." 0.1e-0 f0= "
    0.1e-0  f0= 0 bool-result 
    cr ." 4.15 -415. f> "
    4.15 -415. f> -1 bool-result 
    cr ." 415e-120 4.15 f< "
    415e-120 4.15 f< -1 bool-result 
    cr ." -41.5e-120 4.15 f> "
    -41.5e-120 4.15 f> 0 bool-result 
    cr ." -41.5e-120 4.15 f< "
    -41.5e-120 4.15 f< -1 bool-result 

; 

: reps  ( n -- )
    ." ," . ."  times." cr 
;
: performance 
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
;

: all-test
    var-test cr 
    const-test cr 
    fabs-test cr 
    fnegate-test cr
    add-test cr
    prod-test cr
    compare cr
    performance cr
; 

