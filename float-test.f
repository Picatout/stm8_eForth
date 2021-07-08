\ float.asm library test suite 

: flags-test 
    ."  testing FPSW flags" cr 
    ." enter positive float number: "
    query eval 
    ." FER ." fer . cr 
    ." FNE ." fne . cr 
    ." FZE ." fze . cr
    f. cr 
    ." enter a negative float number: "
    query eval 
    ." FER ." fer . cr 
    ." FNE ." fne . cr 
    ." FZE ." fze . cr
    f. cr 
    ." enter a null float: "
    query eval 
    ." FER ." fer . cr 
    ." FNE ." fne . cr 
    ." FZE ." fze . cr
    ." #$fffffff -1 me>f fov ."
    #$fffffff -1 me>f fov .
;

: convert 
    cr
    ." format convertion test." cr 
    ." #3141592 -6 me>f 2dup f."
    #3141592 -6 me>f 2dup f. cr 
    ." f>me . d."
    f>me . d. cr 
    ." #1234567  d>f f. "    
    #1234567  d>f f. cr 
    ." 345.67 f>d d." 
    345.67 f>d d. cr 
    ." #-987654 d>f 2dup f." 
    #-987654 d>f 2dup f. cr 
    ." f>d d." 
    f>d d. cr    
;

:  display  
    cr
    ." 3.141592 2dup F. E." 
    3.141592 2dup F. E. cr 
    ." 6.02214e23 2dup f. e."
    6.02214e23 2dup f. e. cr 
    ." 1.0e8 2dup f. e." 
    1.0e8 2dup f. e. cr 
;


: scale 
    cr 
    ." 200.1 LSCALE F." 
    200.1 LSCALE F. CR 
    ." 200.1 RSCALE F." 
    200.1 RSCALE F. CR 
; 

:  math 
    cr 
    ." 3.141592 2dup f* f." 
    3.141592 2dup f* f. cr 
    ." -6.283184 3. f/ f."
    -6.283184 3. f/ f. cr 
    ." 6.02214e23 15.7e25 f+ f." 
    6.02214e23 15.7e25 f+ f. cr 
    ." 12.04428e23 15.7e25 f- f." 
    12.04428e23 15.7e25 f- f. cr 
;

; compare 
    cr 
    
;    