\ double.asm library test suite.

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
    dbl-ver 
;

: double? 
    preset 
    cr 
    ." double parsing test." cr 
    ." enter positive double: "
    query
    eval 
    d. CR stack-check  
    ." enter negative double: "
    query 
    eval 
    d. cr 
    ." enter 0 double: "
    query 
    eval 
    d. cr stack-check 
  ;

: dabs-test
    preset 
    ." DABS test (d -- abs(d) ) " cr  
    ." enter negative double: " 
    query  
    eval
    2DUP D. ."  DABS" 
    dabs 
    d. 
    cr stack-check 
    ." enter positive double: " 
    query 
    eval 
    2DUP D. ." DABS" 
    dabs 
    d. 
    cr stack-check 
;

: dsign-test 
  preset 
  cr ." DSIGN test ( d -- d sign )" cr
  ." 4134124. dsign <ROT d. ." cr 
  4134124. dsign <rot d. . cr stack-check 
  ." -5467. dsign >rot d. ." cr   
  -5467. dsign <rot d. . cr stack-check  
;

: ds/mod-test 
    preset 
    cr ." ds/mod test ( ud us -- r dq )" cr 
    ." 3141.592 2 ds/mod"
    3141592. 2 ds/mod  2>r 
    cr ."  remainder=" 0 iresult 
    2r> ."  quotient= " 1570796. dresult 
; 

: ds*-test
    preset 
    cr
   ." double single product ds* ( d s -- d*s )"
   cr
   ." 3141592. 2 ds*" cr 
   3141592. 2 ds* 6283.184 dresult 
;

: 2swap-test 
    cr 
    ." 2swap test" cr  
    1. 
    2. 
    .s 
    2SWAP 
    .s 
    d. d. 
    stack-check 
; 

: dclz-test 
    preset 
    cr 
    ." count leading 0's test dclz ( d -- n )" cr  
    ." 1. dclz ."  cr  
    1. dclz 31 iresult 
   ." $1000000. clz ." cr 
    $10000000. dclz 3 iresult 
   stack-check  
;

: 2rot-test 
    preset
    cr ." rotate doubles test" cr 
    ." 1. 2. 3. 2ROT" cr 
    1. 2. 3. 2rot
    2>r 2>r  2. dresult 
    2r> 3. dresult 
    2r> 1. dresult  
    ." 2. 3. 1. <2ROT" cr 
    2. 3. 1. <2ROT 
    2>r 2>r 
    1. dresult 
    2r> 2. dresult 
    2r> 3. dresult  
;  

: d0=-test 
    preset
    cr
    ." d0= test ( d -- -1|0 )" cr 
    ." 0. D0=" CR
    0. D0=  -1 iresult  
    ." 1. D0="  CR
    1. D0= 0 iresult 
;

:  d=-test 
    preset
    cr 
    ." D= ( d1 d2 -- f ) test" cr 
    ." -1. #1. D=" cr  
    -1. 1. D= 0 iresult  
    ." 45. 2DUP D= " cr
    45. 2DUP D= -1 iresult  
;

: d>-test 
    preset
    cr 
    ." D> ( d1 d2 -- d1>d2 )" cr 
    ." -33. -32. d>"  cr 
    -33. -32. d> 0 iresult  
    ." 33. 32. d>" cr  
    33. 32. d> -1 iresult  
    ." -3. 2. d>" cr 
    -3. 2. d>  0 iresult
;

: d<-test 
    preset 
    cr
    ." D< ( d1 d2 -- d1<d2 )" cr 
    ." -33. -32. d<" cr 
    -33. -32. d<  -1 iresult 
    ." 33. 32. d<" cr  
    33. 32. d< 0 iresult  
    ." -3. 2. d<" cr 
    -3. 2. d< -1 iresult 
;

: d0<-test 
    preset
    cr
    ." D0< test ( d -- d<0 )" cr 
    ." 2. d0<" cr 
    2. d0<  0 iresult 
    ." -33. d0<" cr 
    -33. d0< -1 iresult 
;

: 2>r-test 
    preset
    cr
    ." 2>R test" cr 
    ." 1. 2. 2>r d." cr  
    1. 2. 2>r 1. dresult  
    ." 2r@ d." cr     
    2r@  2. dresult  
    ." 2r> d." 
    2r> 2. dresult  
;

: 2over-test 
    preset
    cr
    ." 2over test ( d1 d2 -- d1 d2 d1 )" cr 
    ." 1. 2. 2OVER D. D. D." cr 
    1. 2. 2over 
    2>r 2>r 
    1. dresult 
    2r> 2. dresult 
    2r> 1. dresult 
;

: d2/-test 
    cr ." d2/ test ( d -- d/2 )" cr 
    ." 131.072 d2/"  
    131.072 d2/ 65536. dresult 
; 

: d2*-test 
    cr ." D2* test ( d -- 2*d )" cr 
    ." 131.072 d2*"  
    131.072 d2* 262.144 dresult
;

: DSHIFT-TEST 
    cr ." shift double test ( d n -- d )" cr 
    ." #1 4 DLSHIFT" cr   
    1. 4 DLSHIFT 16. dresult  
    ." 16. 4 DRSHIFT"  cr
    16. 4 DRSHIFT 1. dresult 
;

: d*-test 
    cr ." D* ( d1 d2 -- d1*d2 )" cr 
    ." 10. 351. d*" cr  
    10. 351. d* 3510. dresult  
    ." -32. 16. d*" cr
    -32. 16. d* -512. dresult  
    ." -25. -8. d*"
    -25. -8. d* 200. dresult  
;

: d/mod-test 
    cr ." D/MOD test ( d d -- dr dq )" cr 
    ." 57.003 5. d/mod" cr  
    57.003 5. d/mod 
    2>r 
    ."  remainder=" 3. dresult 
    2r>  
    ." quotient=" 11.400 dresult  
    ." -57.003 5. d/mod" cr 
    -57.003 5. d/mod 2>r  
    ."  remainder=" 2. dresult  
    2r>
    ."  quotient=" -11.401 dresult  
    ." 57.003 -5. d/mod" cr 
    57.003 -5. d/mod 
    2>r
    ."  remainder="  -2. dresult 
    2r> 
    ."  quotient=" -11.401 dresult  
    ." -57.003 -5. d/mod" cr
    -57.003 -5. d/mod 2>r 
    ."  remainder=" -3. dresult 
    2r>
    ."  quotient=" 11.400 dresult    
    ." -55. -5. d/mod"
    -55. -5. d/mod 2>R 
    ."  remainder=" 0. dresult 
    2r>
    ."  quotient=" 11. dresult  
; 

: +-test 
    cr ." d+ d- test" cr 
    ." -355. -23. d+" 
    -355. -23. d+ -378. dresult  
    ." 6377. 523. d-" 
    6377. 523. d- 5854. dresult 
;

: add-spd 
    msec 1000 for 
    -253.353  979.788 d+ 
    2drop next 
    msec swap - 
    . ." msec for 1000 double additions." 
    cr 
; 

: sub-spd 
    msec 1000 for 
    -254.232 34. d-
    2drop next 
    msec swap - 
    . ." msec for 1000 double substactions." 
    cr 
;

: mul-spd 
    msec 1000 for 
    324. 332. d* 
    2drop 
    next
    msec swap -  
    . ." msec for 1000 double muliplications."
    cr
; 

: div-spd 
    msec 1000 for 
    324.333 56. d/ 2drop 
    next 
    msec swap - 
    . ." msec for 1000 double divisions."
    cr 
;


: performance 
    cr
    ." ******** Performance test ******"
    cr 
    add-spd
    sub-spd 
    mul-spd 
    div-spd  
; 

: all-test 
    show-version 
    double? 
    dabs-test
    dsign-test 
    ds/mod-test 
    ds*-test 
    2swap-test 
    dclz-test
    2rot-test 
    d0=-test 
    d=-test
    d>-test
    d<-test 
    d0<-test 
    2>r-test 
    2over-test 
    d2/-test 
    d2*-test 
    dshift-test 
    d*-test 
    d/mod-test 
    +-test
    performance   
;





    
