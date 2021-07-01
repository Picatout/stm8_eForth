\ count and disply words in dictionray 

: WC ( -- )
    0 CONTEXT BEGIN 
    @ ?DUP WHILE 
        SWAP 1+ SWAP
        2- 
    REPEAT 
    .
;
