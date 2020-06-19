# STM8eForth V3.0  référence du vocabulaire.

## Conventions typographique

**a**  Adressse 16 bits 

**ad** Adresse 32 bits 

**b**  Adresse 16 bits d'une chaîne de caractère

**c**  Caractère ASCII ou octet.

**f** Indicateur booléen 0 indique faut tout autre valeur est considérée comme vrai.

**i** Entier 16 bits signé

**id** Entier double (32 bits) signé

**n** Valeur 16 bits sans type défini.

**u** Entier 16 bits non signé.

**ud** Entier 32 bits non signé.

**nx** Représente un nombre quelconque d'élément sur la pile.

**R:** Représente la pile des retours. 

**( nx1 -- nx2 )**  Commentaire indiquant  la liste des paramètres à gauche et des résultats à droite.

## Vocabulaire du système

* __!__&nbsp;&nbsp;( n a -- ) Dépose la valeur **n** à l'adresse **a**

* __#__&nbsp;&nbsp;( u1 -- u2 ) Utilisé dans la conversion d'entier en chaîne. Extrait un digit de l'entier **u1** et et ajout l'ajoute à la chaîne de sortie. u2=u1/BASE. 

* __#>__&nbsp;&nbsp;( w -- b u ) Complète la conversion d'un entier ne chaîne. **b** est la chaîne résultante et **u** sa longueur. **w** est le quotient de la dernière division et donc égal à zéro.

* __#S__&nbsp;&nbsp;( u -- 0 ) Converti en chaîne tous les digits de u. Lorsque cette opération est complétée la valeur **0** demeure sur la pile.

* __#TIB__&nbsp;&nbsp;( -- a ) Empile l'adresse de la variable système **#TIB**. Cette variable contient le nombre de caractères qu'il y a dans le TIB *(Terminal Input Buffer)*.  

* __$"__&nbsp;&nbsp;( -- ; &lt;string&gt; ) Compile la chaîne litérale **&lt;string&gt;**. 

* __$"|__&nbsp;&nbsp;( -- a ) Partie Runtime de **$"** retourne l'adresse de la chaîne litérale. 

* __$,"__&nbsp;&nbsp;( -- ) Compile une chaîne litérale délimitée par **"**.  Est invoqué par **$"**. 

* __$,n__&nbsp;&nbsp;( b -- ) Compile un nouveau nom dans le dictionnaire. **b** et l'adresse de la chaîne représentant ce nouveau nom.

* __$COMPILE__&nbsp;&nbsp;( b -- ) Routine invoquée par **EVAL** lorsqu'en mode compilation. **b** est l'adresse de la chaîne du nom qui est recherché dans le dictionnaire. Si ce nom n'est pas dans le dictionnaire le compilateur vérifie s'il s'agit d'un entier et dans ce cas compile un entier litéral. Toute autre situation conduit à un abandon de compilation avec message d'erreur.

* __$INTERPRET__&nbsp;&nbsp;( b -- ) Routine invoquée par **EVAL** lorsqu'en mode interprétation. **b** représente le nom qui est recherché dans le dictionnaire. Ce nom s'il est trouvé sera interprété. S'il n'existe par une tentative de converion en entier est réalisée. Cet entier sera empilé. Toute autre situation conduit à un abandon avec message d'erreur.

* __'__&nbsp;&nbsp;( -- a  ; &lt;string&gt; ) Ce mot est suivit d'une chaîne de caractère qui doit représenter un mot du dictionnaire. Si ce mot est trouvé **a** est l'adresse d'éxécution de ce mot. Un échec résulte en un abandon avec message d'erreur.

* __'BOOT__&nbsp;&nbsp;( -- a ) Retourne l'adresse du programme qui doit-être exécuté au démarrage du système. Par défaut il s'agit de **hi**.  

* __'EVAL__&nbsp;&nbsp;( -- a ) Retourne l'adresse de la variable système **INTER** qui contient l'adresse du code qui doit-être exécuté par **EVAL**. 

* __(__&nbsp;&nbsp;( -- ) Ce mot introduit un commentaire délimité par **)**

* __*__&nbsp;&nbsp;( i1 i2 -- i3 )  Multiplication signée. i3=i1*i2.

* __*/__&nbsp;&nbsp;( i1 i2 i3 -- i4 ) Multiplication de i1 par i2 avec résultat conservé en entier double suivit d'une division par i3. 

* __*/MOD__&nbsp;&nbsp;( i1 i2 i3 -- u i4 ) Multiplication de i1 par i2. Le résultat est conservé en entier double pour être divisé par i3. Le quotient i4 et le reste u sont retourné. 

* __+__&nbsp;&nbsp;( i1 i2 -- i3 ) i3 est la somme de i1 et i2. 

* __+!__&nbsp;&nbsp;( i a -- ) Ajoute la valeur i à l'entier situé à l'adresse a.

* __,__&nbsp;&nbsp;( n -- ) Compile la valeur n  

* __-__&nbsp;&nbsp;( i1 i2 -- i3 ) i3 est le résultat de la soustraction i1-i2. 

* __-1__&nbsp;&nbsp;( -- -1 ) Constante numérique **-1**. Utilisée pour indiquée une valeur booléenne vrai. 

* __.__&nbsp;&nbsp;( i -- ) Imprime l'entier au sommet de la pile.

* __."__&nbsp;&nbsp;( -- ) Compile une chaîne litérale pour impression. Cette chaîne est terminée par le caractère **"**. 

* __."|__&nbsp;&nbsp;( -- )  Partie runtime de **."** . Imprime la chaîne litérale qui a été compile par **."**. 

* __.(__&nbsp;&nbsp;( -- ) Mot immédiat qui imprime le commentaire délimité par **)**. 

* __.ID__&nbsp;&nbsp;( a -- ) **a** étant l'adresse d'un champ nom dans le dictionnaire **.ID** imprime ce nom. 

* __.OK__&nbsp;&nbsp;( -- ) Imprime le messate ** ok** suivit d'un **CR**. 

* __.R__&nbsp;&nbsp;( i u -- ) Imprime l'entier i sur une  largeur de colonne de u carctère. Si la chaîne résultant de la conversion de i est plus courte que u le remplissage est fait avec des espaces.  

* __.S__&nbsp;&nbsp;( -- ) Imprime le contenu de la pile des paramètres.

* __/__&nbsp;&nbsp;( i1 i2 -- i3  ) i3 est le quotient entier arrondie à l'entier le plus petit résultant de i1/i2.

* __/MOD__&nbsp;&nbsp;( i1 i2 -- u i3 ) i3 est le quotient et u le reste de la division entière arrondie à l'entier le plus petit de i1/i2. 

* __0__&nbsp;&nbsp;( -- 0 ) Constante numérique **0**.  

* __0<__&nbsp;&nbsp;( i -- f ) Retourne vrai (-1) si i&lt;0 sinon retourne 0.

* __1__&nbsp;&nbsp;( -- ) Constante numérique **1**. 

* __1+__&nbsp;&nbsp;( i1 -- i2 ) Incrémente i1 pour donner i2. 

* __1-__&nbsp;&nbsp;( i1 -- i2 ) Décrémente i1 pour donner i2.

* __12RT2__&nbsp;&nbsp;( -- 26797 25293 ) Empile 2 constantes dont le rapport s'approche de la racine 12ième de 2. 

* __2!__&nbsp;&nbsp;( nd a -- ) Dépose un entier double à l'adresse a.  

* __2*__&nbsp;&nbsp;( i1 -- i2 ) Multiplie par i1 par 2.

* __2+__&nbsp;&nbsp;( i1 -- i2 ) Ajoute 2 à i1. 

* __2-__&nbsp;&nbsp;( i1 -- i2 ) Soustrait 2 à i1.

* __2/__&nbsp;&nbsp;( i2 -- i2 ) Soustrait i1 par 2. 

* __2@__&nbsp;&nbsp;( a -- nd ) Empile l'entier double qui est à l'adresse a. 

* __2DROP__&nbsp;&nbsp;( n1 n2 -- ) Jette les 2 éléments au sommet de la pile. 

* __2DUP__&nbsp;&nbsp;( n1 n2 -- n1 n2 ) Duplique les 2 éléments au sommet de la pile. 

* __:__&nbsp;&nbsp;( -- ; &lt;string&gt; ) Débute la création d'une nouvelle définition dans le dictionnaire. **&lt;string&gt;** est le nom de cette nouvelle définition. Passe en mode compilation. 

* __;__&nbsp;&nbsp;( -- ) Complète la définition d'un nouveau mot et repasse en mode interprétaion. 

* __<__&nbsp;&nbsp;( i1 i2 -- f ) Empile la valeur booléenne i1&lt;i2.

* __<#__&nbsp;&nbsp;(  -- ) Débute la conversion d'un entier en chaîne de caractère.

* __=__&nbsp;&nbsp;( i1 i2 -- f ) Empile la valeur booléenne indiquant si i1=i2

* __>CHAR__&nbsp;&nbsp;( c -- c ) Filtre les caractères de contrôle ASCII pour les remplacer par un **_**.  

* __>IN__&nbsp;&nbsp;( -- a ) Empile l'adrese de la variable système **>IN** qui est le pointeur de l'analyseur lexical. 

* __>NAME__&nbsp;&nbsp;( a1 -- a2|0 ) Retourne l'adrresse du champ nom à partir de l'adresse du champ code d'une entrée du dictionnaire. a1 est le *code address* et a2 est le *name address*. 
Si le champ code est invalide retourne **0**. 

* __>R__&nbsp;&nbsp;( n -- R: n ) Envoie n sur la pile des retours.

* __?__&nbsp;&nbsp;( a -- ) Imprime l'entier à l'adresse a.

* __?BRANCH__&nbsp;&nbsp;( f -- ) Compile un branchement conditionnel avec une adresse litérale. En *runtime* le branchement n'est effectué que si f est faux. 

* __?DUP__&nbsp;&nbsp;( n -- n n | 0 ) Duplique n seulement si &lt;&gt; 0. 

* __?KEY__&nbsp;&nbsp;( -- c -1 | 0) Vérifie s'il y a un caractère de disponible en provenance du terminal. Si oui retourne le caractère **c** et **-1** sinon retourne **0**.  

* __?STACK__&nbsp;&nbsp;( -- ) Vérifie si la pile des arguments est état sous-vidée *(underflow)*. Un abadon avec message d'erreur se produit dans ce cas.

* __?UNIQUE__&nbsp;&nbsp;( b -- b ) Vérifie si le nom pointé par a existe déjà dans le dictionnaire.  Affiche un messag d'avertissement s'il ce nom est déjà dans le dictionnaire. Ça signifit qu'on est en train de redéfinir un mot qui est déjà dans le dictionnaire.

* __@__&nbsp;&nbsp;( a -- n ) Empile l'entier qui est à l'adresse a.

* __@EXECUTE__&nbsp;&nbsp;( a -- ) *a* est un pointeur vers l'adresse d'un code exécutable. Cette adresse est empile pour être exécutée immédiatement. 

* __ABORT__&nbsp;&nbsp;( nx -- ) Abandon avec vidage de la pile et du TIB. Est appellé par **ABORT"**.  

* __ABORT"__&nbsp;&nbsp;( f -- ) Si l'indicateur est vrai affiche le message litéral qui suit et appelle **ABORT**.

* __ABS__&nbsp;&nbsp;( i1 -- u ) Retourne la valeur absolue de i1. 

* __ACCEPT__&nbsp;&nbsp;( b u1 -- b u2 ) Effectue la lecture d'une ligne de texte dans le **TIB**. *b* est l'adresse du **TIB** *u1* est la longueur du **TIB** et *u2* est le nombre de caractères reçus dans le **TIB**.  

* __AFT__&nbsp;&nbsp;( a1 -- a1 a2 ) Mot compilant Utilisé dans une boucle FOR..AFT..THEN..NEXT. Pendant la compilation compile un saut avant après le **THEN**.   

* __AGAIN__&nbsp;&nbsp;( -- ) Marque la fin d'une boucle BEGIN..AGAIN. 

* __AHEAD__&nbsp;&nbsp;( -- a ) Compile un saut avant inconditionnel. *a* est l'adresse de la fente où sera insérée l'adresse du saut ultérieurement lors du processus de compilation.

* __ALLOT__&nbsp;&nbsp;( u -- ) Alloue *u* octets dans l'espace RAM. Avance le pointeur **VP** de *u* octets. 

* __AND__&nbsp;&nbsp;( n1 n2 -- n3 ) Opération bit à bit ET.  

* __AUTORUN__&nbsp;&nbsp;( -- ; &lt;string&gt; ) Enregistre dans la variable système persistante **APP_RUN**  l'adresse d'exécution du programme qui doit-être exécuté au démarrage. Par défaut il s'agit du *ca* du mot **hi**.  

* __BASE__&nbsp;&nbsp;( -- ) Variable système qui contient la base numérique utilisée pour la conversion des entiers en chaîne de caractères. 

* __BEGIN__&nbsp;&nbsp;( -- a ) Compile le début d'une boucle BEGIN..UNTIL|AGAIN. *a* indique l'adresse où doit se faire le saut arrière pour répéter la boucle. 

* __BL__&nbsp;&nbsp;( -- c ) Empile le caractère ASCII *space* i.e. 32.  

* __BRANCH__&nbsp;&nbsp;( -- ) Compile un saut inconditionnel avec une adresse litérale.
En *runtime* ce saut est toujours effectué.

* __BUF2ROW__&nbsp;&nbsp;( ud -- ) Écris le contenu du tampon **ROWBUFF** dans la mémoire flash en utilisant l'opération d'écriture par bloc du MCU.   

* __BYE__&nbsp;&nbsp;( -- ) Exécute l'instruction machine **HALT** pour mettre le MCU en mode suspendu. Dans ce mode l'oscillateur et arrêter et le MCU dépense un minimum d'énergie. Seul un *reset* ou une interruption externe peut réactivé le MCU. Si le MCU est réanimé par une interruption après l'exécution de celle-ci l'exécution se poursuit après l'instruction **HALT**. 

* __C!__&nbsp;&nbsp;( c a -- ) Dépose le caractère *c* à l'adresse *a*. Sur la pile *c* occupe 2 octets mais en mémoire il n'occupe qu'un octete. 

* __C,__&nbsp;&nbsp;( c -- ) Compile le caractère qui est au sommet de la pile. 

* __C@__&nbsp;&nbsp;( a -- c ) Empile l'octet qui se trouve à l'adresse *a*.

* __CALL,__&nbsp;&nbsp;( a -- ) Compile un appel de sous-routine dans la liste d'une définition.  *a* est l'adresse de la sous-routine. 

* __CHKIVEC__&nbsp;&nbsp;( a -- ) Toutes les adresses de destination des vecteurs d'interruptions sont comparés à *a*. Tous les vecteurs qui pointent vers une adresse &lt;=*a* sont réinitialisés à la valeur par défaut. Ce mot est invoqué par **PRISTINE**. 

* __CMOVE__&nbsp;&nbsp;( a1 a2 u -- ) Copie *u* octets de *a1* vers *a2*.

* __COLD__&nbsp;&nbsp;( -- ) Réinitialisation du système. Toute la mémoire RAM est remise à **0** et les pointeurs de piles sont réinitialisés ainsi que les variables système.

* __COMPILE__&nbsp;&nbsp;( -- ) Compile un appel de sous-routine avec adresse litérale.

* __CONSTANT__&nbsp;&nbsp;( n -- ; &lt;string&gt; ) Compile une constante dans le dictionnaire. *n* est la valeur de la constante dont le nom est **&lt;string&gt;**. 

* __CONTEXT__&nbsp;&nbsp;( -- a ) Empile l'adresse de la variable système CNTXT. Cette variable contient l'adresse du point d'entré du dictionnaire.  

* __COUNT__&nbsp;&nbsp;( b -- b u ) Empile la longueur de la chaîne comptée *b* et incrémente *b*.   

* __CP__&nbsp;&nbsp;( -- a ) Empile l'adresse de la variable système **CP** qui contient l'adresse du début de l'espace libre en mémoire flash. 

* __CR__&nbsp;&nbsp;( -- ) Envoie le caractère ASCII **CR** au terminal.

* __CREATE__&nbsp;&nbsp;( -- ; &lt;string&gt; ) Compile le nom d'une nouvelle variable dans le dictionnaire. **&lt;string&gt;** est le nom de la nouvelle variable. Les variables sont initialisées à **0**.  

* __DECIMAL__&nbsp;&nbsp;( -- ) Affecte la valeur **10** à la variable système **BASE**. 

* __DEPTH__&nbsp;&nbsp;( -- u ) retourne le nombre d'élément qu'il y a sur la pile.

* __DI__&nbsp;&nbsp;( -- ) Désactive les interruptions en exécutant l'instruction machine **SIM**. 

* __DIGIT__&nbsp;&nbsp;( u -- c ) Convertie le chiffre *u* en caractère ASCII.

* __DIGIT?__&nbsp;&nbsp;( c base -- u f ) Converti le caractère *c* en chiffre correspondant dans la *base*. L'indicateur *f* indique si *c* est bien dans l'intervalle {0..base-1}.   

* __DNEGATE__&nbsp;&nbsp;( d1 -- d2 ) Négation arithmétique de l'entier double *d1*.

* __DO$__&nbsp;&nbsp;( -- b ) Partie *runtime* de **$"** retourne l'adresse de la chaîne litérale qui a été compilée.  

* __DOCONST__&nbsp;&nbsp;( -- n ) Partie *runtime* de **CONSTANT** empile la valeur de la constante.  

* __DOLIT__&nbsp;&nbsp;( -- n ) Partie *runtime* résultant de la compilation d'un entier litéral. *n* et l'entier qui a été compilé. 

* __DOVAR__&nbsp;&nbsp;( -- a ) Partie *runtime* résultant de la compilation d'une variable.  
*a* est l'adresse de la variable qui a été compilée. 

* __DROP__&nbsp;&nbsp;( n -- ) Jette l'élément qui est au sommet de la pile. 

* __DUMP__&nbsp;&nbsp;( a u -- ) Affiche en hexadécimal le contenu de la mémoire débutant à l'adresse *a*. *u* octets arrondie au multiple de 16 supérieur sont affichés. Chaque ligne affiche 16 octets suivit de leur représentation ASCII.  

* __DUP__&nbsp;&nbsp;( n -- n n ) Empile une copie de l'élément au sommet de la pile.

* __E__&nbsp;&nbsp;( -- 28667 10546 ) Le rapport des 2 entiers empilés donne une valeur approximative de la base du logarithme népérien. 

* __EE!__&nbsp;&nbsp;( n ud -- ) Écriture en mémoire persistante (FLASH|EEPROM) de la valeur *n*. *ud* et un entier double non signé représentant l'adresse destination. 

* __EE,__ ( n -- ) Compile en mémoire FLASH l'entier *n*. 

* __EEC!__&nbsp;&nbsp;( c ud -- ) Écris en mémoire persistante le caractère *c*. *ud* est l'adresse destination sous-forme d'entier double non signé.

* __EEC,__&nbsp;&nbsp;( c -- )  Compile en mémoire FLASH le caractère *c*.  

* __EEP-CP__&nbsp;&nbsp;( -- ud ) Empile l'adresse de la variable système persistante **APP_CP**
. *ud* est un entier double non signé. 

* __EEP-LAST__&nbsp;&nbsp;( -- ud ) Empile l'adresse de la variable système persistante **APP_LAST**.

* __EEP-RUN__&nbsp;&nbsp;( -- ud ) Empile l'adresse de la variable système persistante **APP_RUN**. 

* __EEP-VP__&nbsp;&nbsp;( -- ud ) Empile l'adresse de la variable système persitante **APP_VP** 

* __EEPROM__&nbsp;&nbsp;( -- ud ) Empile l'adresse de base de l'EEPROM. 

* __EI__&nbsp;&nbsp;( -- ) Active les interruptions en exécutant l'instruction machine **RIM**.

* __ELSE__&nbsp;&nbsp;( a1 -- a2 ) Compile l'adresse du saut avant dans la fente *a1* laissée sur la pile par le **IF** qui indique où doit se faire le saut avant pour exécuter une condition *fausse*. Laisse *a2* sur la pile qui est l'adresse de la fente qui doit-être comblée par le **THEN** et qui permet un saut avant après le **THEN** lors que la condition *vrai* est exécutée.   

* __EMIT__&nbsp;&nbsp;( c -- ) Envoie vers le terminal le caractère *c*. 

* __ERASE__&nbsp;&nbsp;( -- ) 

* __EVAL__&nbsp;&nbsp;( -- ) 

* __EXECUTE__&nbsp;&nbsp;( -- ) 

* __EXIT__&nbsp;&nbsp;( -- ) 

* __EXTRACT__&nbsp;&nbsp;( -- ) 

* __F@__&nbsp;&nbsp;( -- ) 

* __FADDR__&nbsp;&nbsp;( -- ) 

* __FC@__&nbsp;&nbsp;( -- ) 

* __FILL__&nbsp;&nbsp;( -- ) 

* __FIND__&nbsp;&nbsp;( -- ) 

* __FMOVE__&nbsp;&nbsp;( -- ) 

* __FOR__&nbsp;&nbsp;( -- ) 

* __FORGET__&nbsp;&nbsp;( -- ) 

* __FP!__&nbsp;&nbsp;( -- ) 

* __FREEVAR__&nbsp;&nbsp;( -- ) 

* __HERE__&nbsp;&nbsp;( -- ) 

* __HEX__&nbsp;&nbsp;( -- ) 

* __HLD__&nbsp;&nbsp;( -- ) 

* __HOLD__&nbsp;&nbsp;( -- ) 

* __I__&nbsp;&nbsp;( -- ) 

* __I:__&nbsp;&nbsp;( -- ) 

* __I;__&nbsp;&nbsp;( -- ) 

* __IF__&nbsp;&nbsp;( -- ) 

* __IFMOVE__&nbsp;&nbsp;( -- ) 

* __IMMEDIATE__&nbsp;&nbsp;( -- ) 

* __INC-FPTR__&nbsp;&nbsp;( -- ) 

* __INIT-OFS__&nbsp;&nbsp;( -- ) 

* __KEY__&nbsp;&nbsp;( -- ) 

* __KTAP__&nbsp;&nbsp;( -- ) 

* __LAST__&nbsp;&nbsp;( -- ) 

* __LITERAL__&nbsp;&nbsp;( -- ) 

* __LN2S__&nbsp;&nbsp;( -- ) 

* __LOCK__&nbsp;&nbsp;( -- ) 

* __LOG2S__&nbsp;&nbsp;( -- ) 

* __LSHIFT__&nbsp;&nbsp;( -- ) 

* __M*__&nbsp;&nbsp;( -- ) 

* __M/MOD__&nbsp;&nbsp;( -- ) 

* __MAX__&nbsp;&nbsp;( -- ) 

* __MIN__&nbsp;&nbsp;( -- ) 

* __MOD__&nbsp;&nbsp;( -- ) 

* __MSEC__&nbsp;&nbsp;( -- ) 

* __NAME>__&nbsp;&nbsp;( -- ) 

* __NAME?__&nbsp;&nbsp;( -- ) 

* __NEGATE__&nbsp;&nbsp;( -- ) 

* __NEXT__&nbsp;&nbsp;( -- ) 

* __NEXT__&nbsp;&nbsp;( -- ) 

* __NOT__&nbsp;&nbsp;( -- ) 

* __NUF?__&nbsp;&nbsp;( -- ) 

* __NUMBER?__&nbsp;&nbsp;( -- ) 

* __OFFSET__&nbsp;&nbsp;( -- ) 

* __OR__&nbsp;&nbsp;( -- ) 

* __OVER__&nbsp;&nbsp;( -- ) 

* __OVERT__&nbsp;&nbsp;( -- ) 

* __PACK0__&nbsp;&nbsp;( -- ) 

* __PAD__&nbsp;&nbsp;( -- ) 

* __PARSE__&nbsp;&nbsp;( -- ) 

* __PAUSE__&nbsp;&nbsp;( -- ) 

* __PI__&nbsp;&nbsp;( -- ) 

* __PICK__&nbsp;&nbsp;( -- ) 

* __PRESET__&nbsp;&nbsp;( -- ) 

* __PRISTINE__&nbsp;&nbsp;( -- ) 

* __QUERY__&nbsp;&nbsp;( -- ) 

* __QUIT__&nbsp;&nbsp;( -- ) 

* __R>__&nbsp;&nbsp;( -- ) 

* __R@__&nbsp;&nbsp;( -- ) 

* __RAM2EE__&nbsp;&nbsp;( -- ) 

* __RAMLAST__&nbsp;&nbsp;( -- ) 

* __RANDOM__&nbsp;&nbsp;( -- ) 

* __REBOOT__&nbsp;&nbsp;( -- ) 

* __REPEAT__&nbsp;&nbsp;( -- ) 

* __RFREE__&nbsp;&nbsp;( -- ) 

* __ROT__&nbsp;&nbsp;( -- ) 

* __ROW-ERASE__&nbsp;&nbsp;( -- ) 

* __ROW2BUF__&nbsp;&nbsp;( -- ) 

* __RP!__&nbsp;&nbsp;( -- ) 

* __RP@__&nbsp;&nbsp;( -- ) 

* __RSHIFT__&nbsp;&nbsp;( -- ) 

* __RST-IVEC__&nbsp;&nbsp;( -- ) 

* __S>D__&nbsp;&nbsp;( -- ) 

* __SAME?__&nbsp;&nbsp;( -- ) 

* __SEED__&nbsp;&nbsp;( -- ) 

* __SET-ISP__&nbsp;&nbsp;( -- ) 

* __SET-IVEC__&nbsp;&nbsp;( -- ) 

* __SET-OPT__&nbsp;&nbsp;( -- ) 

* __SIGN__&nbsp;&nbsp;( -- ) 

* __SP!__&nbsp;&nbsp;( -- ) 

* __SP@__&nbsp;&nbsp;( -- ) 

* __SPACE__&nbsp;&nbsp;( -- ) 

* __SPACES__&nbsp;&nbsp;( -- ) 

* __SQRT10__&nbsp;&nbsp;( -- ) 

* __SQRT2__&nbsp;&nbsp;( -- ) 

* __SQRT3__&nbsp;&nbsp;( -- ) 

* __STR__&nbsp;&nbsp;( -- ) 

* __SWAP__&nbsp;&nbsp;( -- ) 

* __TAP__&nbsp;&nbsp;( -- ) 

* __TBUF__&nbsp;&nbsp;( -- ) 

* __TFLASH__&nbsp;&nbsp;( -- ) 

* __THEN__&nbsp;&nbsp;( -- ) 

* __TIB__&nbsp;&nbsp;( -- ) 

* __TIMEOUT?__&nbsp;&nbsp;( -- ) 

* __TIMER__&nbsp;&nbsp;( -- ) 

* __TMP__&nbsp;&nbsp;( -- ) 

* __TO-FLASH__&nbsp;&nbsp;( -- ) 

* __TO-RAM__&nbsp;&nbsp;( -- ) 

* __TOKEN__&nbsp;&nbsp;( -- ) 

* __TYPE__&nbsp;&nbsp;( -- ) 

* __U.__&nbsp;&nbsp;( -- ) 

* __U.R__&nbsp;&nbsp;( -- ) 

* __U<__&nbsp;&nbsp;( -- ) 

* __UM*__&nbsp;&nbsp;( -- ) 

* __UM+__&nbsp;&nbsp;( -- ) 

* __UM/MOD__&nbsp;&nbsp;( -- ) 

* __UNLKEE__&nbsp;&nbsp;( -- ) 

* __UNLKFL__&nbsp;&nbsp;( -- ) 

* __UNLOCK__&nbsp;&nbsp;( -- ) 

* __UNTIL__&nbsp;&nbsp;( -- ) 

* __UPDAT-CP__&nbsp;&nbsp;( -- ) 

* __UPDAT-LAST__&nbsp;&nbsp;( -- ) 

* __UPDAT-PTR__&nbsp;&nbsp;( -- ) 

* __UPDAT-RUN__&nbsp;&nbsp;( -- ) 

* __UPDAT-VP__&nbsp;&nbsp;( -- ) 

* __VARIABLE__&nbsp;&nbsp;( -- ) 

* __VP__&nbsp;&nbsp;( -- ) 

* __WHILE__&nbsp;&nbsp;( -- ) 

* __WITHIN__&nbsp;&nbsp;( -- ) 

* __WORD__&nbsp;&nbsp;( -- ) 

* __WORDS__&nbsp;&nbsp;( -- ) 

* __WR-BYTE__&nbsp;&nbsp;( -- ) 

* __WR-ROW__&nbsp;&nbsp;( -- ) 

* __XOR__&nbsp;&nbsp;( -- ) 

* __[__&nbsp;&nbsp;( -- ) 

* __[COMPILE]__&nbsp;&nbsp;( -- ) 

* __\__&nbsp;&nbsp;( -- ) 

* __]__&nbsp;&nbsp;( -- ) 

* __^H__&nbsp;&nbsp;( -- ) 

* ___TYPE__&nbsp;&nbsp;( -- ) 

* __dm+__&nbsp;&nbsp;( -- ) 

* __hi__&nbsp;&nbsp;( -- ) 

* __parse__&nbsp;&nbsp;( -- ) 

