\ double.asm library test suite.


: show-version 
    dbl-ver 
;

: double? 
    cr 
    ." double parsing test." cr 
    ." enter positive double: "
    query
    eval 
    d. CR 
    ." enter negative double: "
    query 
    eval 
    d. cr 
    ." enter 0 double: "
    query 
    eval 
    d. cr 
  ;

: dabs-test 
    ." DABS test (d -- abs(d) ) " cr  
    ." enter negative double: " 
    query  
    eval
    2DUP D. ."  DABS" 
    dabs 
    d. 
    cr
    ." enter positive double: " 
    query 
    eval 
    2DUP D. ." DABS" 
    dabs 
    d. 
    cr 
;

: dsign-test 
  cr ." DSIGN test ( d -- d sign )" cr
  ." #4134124 dsign ."
  #4134124 dsign . cr
  ." #-5467 dsign ." 
  #-5467 dsign . cr  
  PRESET 
;

: ds/mod-test 
    ." ds/mod test ( ud us -- r dq )" cr 
    #3141592 2 ds/mod 
    ." #3141592 2 ds/mod quotient=" d. 
    cr ." remainder= . cr 
; 

: ds*-test 
    cr
   ." double single product ds* ( d s -- d*s )"
   cr
   #3141592 2 ds* 
   ." #3141592 2 ds* d." d.
   cr  
;

: 2swap-test 
    cr 
    ." 2swap test" cr  
    #1 
    #2 
    .s 
    2SWAP 
    .s 
    preset
; 

: dclz-test 
    cr 
    ." count leading 0's test dclz ( d -- n )" cr  
    #1 dclz 
    ." #1 dclz ." . cr
    #$10000000 dclz 
   ." #$1000000 clz ." .
   cr  
;

: 2rot-test 
    cr ." rotate doubles test" cr 
    ." #1 #2 #3 2ROT .S" 
    #1 #2 #3 2ROT .S CR 
    ." #2 #3 #1 <2ROT .S" 
    <2ROT .S CR 
    preset 
;  

: d0=-test 
    cr
    ." d0= test ( d -- -1|0 )" cr 
    #0 D0= 
    ." #0 D0= ." . CR
    #1 D0= 
    ." #1 D0= ." . CR
;

:  d=-test 
    cr 
    ." D= ( d1 d2 -- f ) test" cr 
    ." #-1 #1 D= ." 
    #-1 #1 D= . CR 
    ." #45 2DUP D= ." 
    #45 2DUP D= . CR 
;

: d>-test 
    cr 
    ." D> ( d1 d2 -- d1>d2 )" cr 
    #-33 #-32 d> 
    ." #-33 #-32 d>" . cr 
    #33 # 32 d> 
    ." #33 #32 d>" . cr  
    #-3 #2 d> 
    ." #-3 #2 d>" . cr 
;

: d<-test 
    cr
    ." D< ( d1 d2 -- d1<d2 )" cr 
    #-33 #-32 d< 
    ." #-33 #-32 d<" . cr 
    #33 # 32 d< 
    ." #33 #32 d<" . cr  
    #-3 #2 d< 
    ." #-3 #2 d<" . cr 
;

: d0<-test 
    cr
    ." D0< test ( d -- d<0 )" cr 
    #2 d0< 
    ." #2 d0<" . cr 
    #-33 d0< 
    ." #-33 d0<" . cr 
;

:  dcmp-test 
    cr 
    ." DCMP ( d1 d2 -- d1 d2 -1|0|1 ) test" cr
    #1 #-1 
    ." #1 #-1 dcmp ." . cr 
    #-1 #1 dcmp 
    ." #-1 #1 dcmp ." . cr
    #22 #22 dcmp 
    ." #22 #22 dcmp ." . cr 
    preset 
;  

: 2>r-test 
    cr
    ." 2>R test" cr 
    ." #1 #2 2>r .s"  
    #1 #2 2>r .s cr 
    ." 2r@ d."   
    2r@ d. cr 
    ." 2r> .s"  
    2r> .s cr 
    preset   
;

: 2over-test 
    cr
    ." 2over test ( d1 d2 -- d1 d2 d1 )" cr 
    ." #1 #2 .s" cr 
    #1 #2 .s 
    ." 2over .s" cr
    2over .s 
    preset 
;

: d2/-test 
    cr ." d2/ test ( d -- d/2 )" cr 
    ." #4096 d2/ d."  
    #4096 d2/ d. cr
; 

: d2*-test 
    cr ." D2* test ( d -- 2*d )" cr 
    ." #2048 d2* d."  
    #2048 d2* d. cr
;

: DSHIFT-TEST 
    cr ." shift double test ( d n -- d )" cr 
    ." #1 4 DLSHIFT D."  
    #1 4 DLSHIFT D. cr 
    ." #16 4 DRSHIFT D."  
    #16 4 DRSHIFT D. cr
;

: d*-test 
    cr ." D* ( d1 d2 -- d1*d2 )" cr 
    ." #10 #351 d* d." 
    #10 #351 d* d. cr 
    ." #-32 #16 d* d."
    #-32 #16 d* d. cr 
    ." #-25 #-8 d* d."
    #-25 #-8 d* d. cr 
;

: d/mod-test 
    cr ." D/MOD test ( d d -- dr dq )" cr 
    ." #57 #5 d/mod" cr 
    #57 #5 d/mod 
    ." quotient=" d. 
    ." , remainder=" d. cr 
    ." #-57 #5 d/mod" cr 
    #-57 #5 d/mod 
    ." quotient=" d. 
    ." , remainder=" d. cr 
    ." #57 #-5 d/mod" cr 
    #57 #-5 d/mod 
    ." quotient=" d. 
    ." , remainder=" d. cr 
    ." #-57 #-5 d/mod" cr
    #-57 #-5 d/mod 
    ." quotient=" d.  
    ." , remainder=" d. cr 
; 

: +-test 
    cr ." d+ d- test" cr 
    ." #-355 #-23 d+ d." 
    #-355 #-23 d+ d. cr 
    ." #6377 #523 d- d." 
    #6377 #523 d- d. cr
;

: add-spd 
    msec 1000 for 
    #-253353  #979788 d+ 
    2drop next 
    msec swap - 
    . ." msec for 1000 double additions." 
    cr 
; 

: sub-spd 
    msec 1000 for 
    #-254232 #34 d-
    2drop next 
    msec swap - 
    . ." msec for 1000 double substactions." 
    cr 
;

: mul-spd 
    msec 1000 for 
    #324 #33 d* 
    2drop 
    next
    msec swap -  
    . ." msec for 1000 double muliplications."
    cr
; 

: div-spd 
    msec 1000 for 
    #324333 #56 d/ 2drop 
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
    d/mod-test 
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





    
