/*
Trie en ordre croissant les mots du système stm8_eForth v3.0 et cré un sequelette de documentation 
pour chacun d'eux.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>


 const char* words="IFMOVE UPDAT-PTR FMOVE FADDR RAM2EE RFREE BUF2ROW ROW2BUF EEC, EE,"
 "SET-IVEC CHKIVEC RST-IVEC PRISTINE SET-OPT WR-ROW ROW-ERASE EE! EEC! WR-BYTE INC-FPTR"
 " LOCK UNLOCK UNLKFL UNLKEE FC@ F@ UPDAT-VP UPDAT-CP UPDAT-RUN UPDAT-LAST EEP-VP EEP-CP"
 " EEP-RUN EEP-LAST EEPROM FP! LN2S LOG2S 12RT2 SQRT10 E SQRT3 SQRT2 PI COLD 'BOOT hi"
 " WORDS .ID >NAME .S DUMP dm+ _TYPE DOCONST CONSTANT VARIABLE CREATE IMMEDIATE I: :"
 " INIT-OFS CALL, ] I; ; OVERT $COMPILE $,n ?UNIQUE .\" $\" ABORT\" AFT REPEAT WHILE"
 " AHEAD ELSE THEN IF AGAIN UNTIL BEGIN I NEXT FOR $,\" LITERAL COMPILE [COMPILE] C,"
 " , ALLOT ' QUIT PRESET EVAL ?STACK .OK [ $INTERPRET ABORT\" ABORT QUERY ACCEPT KTAP"
 " TAP ^H NAME? FIND SAME? NAME> TOKEN WORD \\ ( .( PARSE parse ? . U. U.R .R .\"| $\"|"
 " DO$ CR TYPE SPACES SPACE NUF? KEY NUMBER? DIGIT? DECIMAL HEX STR #> SIGN #S # HOLD"
 " <# EXTRACT DIGIT PACK0 ERASE FILL CMOVE @EXECUTE TIB PAD HERE COUNT 2@ 2! +! PICK"
 " DEPTH >CHAR -1 1 0 BL 2/ RSHIFT LSHIFT 1- 1+ 2* 2- 2+ */ */MOD M* * UM* / MOD /MOD"
 " M/MOD UM/MOD WITHIN MIN MAX < U< = ABS - S>D DNEGATE NEGATE NOT + 2DUP 2DROP ROT"
 " ?DUP OFFSET RAMLAST LAST CP VP CONTEXT HLD 'EVAL TFLASH TBUF #TIB >IN TMP BASE DOVAR"
 " UM+ XOR OR AND 0< OVER SWAP DUP DROP SP! SP@ >R R@ R> RP! RP@ C@ C! @ ! EXIT EXECUTE"
 " BRANCH ?BRANCH NEXT DOLIT EMIT ?KEY TO-RAM TO-FLASH REBOOT TIMEOUT? TIMER PAUSE MSEC"
 " RANDOM SEED FREEVAR FORGET AUTORUN SET-ISP DI EI BYE";

char *list[512];


int in;

int skip(char c){
    while (in<strlen(words)&&words[in]==c)in++;
    return in;
}

int scan(char c){
    while (in<strlen(words)&&words[in]!=c)in++;
    return in;
}

char* word(){
    char *w;
    int start,end; 
    if (in>=strlen(words)) return 0;
    start=skip(' ');
    if (start>=strlen(words)) return 0;
    end=scan(' ');
    w=malloc(end-start+1);
    memcpy(w,&words[start],end-start);
    w[end-start]=0;
    return w;
}

int create_list(){
    int i=0;
    char* w;
    while ((w=word())) list[i++]=w;
    return i;
}


void sort_list(int first,int last){
    char *temp;
    int i;
    while (first<last){
        for (i=first+1;i<=last;i++)
            if (strcmp(list[i],list[first])<0){
                temp=list[first];
                list[first]=list[i];
                list[i]=temp;
            }
        first++;    
    }    
    
}

FILE *fo; 


void create_template(char* fn,int count){
    int i;
    fo=fopen(fn,"w");
    for (i=0;i<count;i++){
        fprintf(fo,"* __%s__&nbsp;&nbsp;( -- ) \n\n",list[i]);
    }
    fclose(fo);
}

void main(int argc, char** argv){
    int count;
    count=create_list();
    sort_list(0,count-1);
    create_template(argv[1],count);
}

