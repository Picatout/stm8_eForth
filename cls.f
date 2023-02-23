\ clear terminal screen 
\ send cursor top-left 
: cls 
    base @ >r
    27 emit 91 emit 50 emit $4a emit 
    27 emit 91 emit $48 emit 
    r> base ! 
;
