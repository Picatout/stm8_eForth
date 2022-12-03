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

**n+** Entier positif.

**u** Entier 16 bits non signé.

**ud** Entier 32 bits non signé.

**nx** Représente un nombre quelconque d'élément sur la pile.

**R:** Représente la pile des retours. 

**( nx1 -- nx2 )**  Commentaire indiquant  la liste des paramètres à gauche et des résultats à droite.

**T**  Indique la valeur booléenne **vrai**. 

**F**  Indique la valeur booléenne **faux**. 

<hr>
<a name="index"></a>

# Index 

Chaque module a une section séparé pour sont vocubulaire. Cet index conduit à la section concernée. 

* [core](#core) module stm8ef.asm 

* [flash](#flash) module flash.asm 

* [scaling constants](#scaling)  module math_const.asm 

* [constants table](#ctable)  module ctable.asm 

<hr>
<a id="core"></a>

## Vocabulaire principal du système

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

* __?STACK__&nbsp;&nbsp;( -- ) Vérifie si la pile des arguments est en état sous-vidée *(underflow)*. Un abadon avec message d'erreur se produit dans ce cas.

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

* __BYE__&nbsp;&nbsp;( -- ) Exécute l'instruction machine **HALT** pour mettre le MCU en mode suspendu. Dans ce mode l'oscillateur et arrêter et le MCU dépense un minimum d'énergie. Seul un *reset* ou une interruption externe peut réactivé le MCU. Si le MCU est réanimé par une interruption après l'exécution de celle-ci l'exécution se poursuit après l'instruction **HALT**. 

* __C!__&nbsp;&nbsp;( c a -- ) Dépose le caractère *c* à l'adresse *a*. Sur la pile *c* occupe 2 octets mais en mémoire il n'occupe qu'un octete. 

* __C,__&nbsp;&nbsp;( c -- ) Compile le caractère qui est au sommet de la pile. 

* __C@__&nbsp;&nbsp;( a -- c ) Empile l'octet qui se trouve à l'adresse *a*.

* __CALL,__&nbsp;&nbsp;( a -- ) Compile un appel de sous-routine dans la liste d'une définition.  *a* est l'adresse de la sous-routine. 

* __CMOVE__&nbsp;&nbsp;( a1 a2 u -- ) Copie *u* octets de *a1* vers *a2*.

* __COLD__&nbsp;&nbsp;( -- ) Réinitialisation du système. Toute la mémoire RAM est remise à **0** et les pointeurs de piles sont réinitialisés ainsi que les variables système.

* __COMPILE__&nbsp;&nbsp;( -- ) Compile un appel de sous-routine avec adresse litérale.

* __CONSTANT__&nbsp;&nbsp;( n -- ; &lt;string&gt; ) Compile une constante dans le dictionnaire. *n* est la valeur de la constante dont le nom est **&lt;string&gt;**. 

* __CONTEXT__&nbsp;&nbsp;( -- a ) Empile l'adresse de la variable système CNTXT. Cette variable contient l'adresse du point d'entré du dictionnaire.  

* __COUNT__&nbsp;&nbsp;( b -- b u ) Empile la longueur de la chaîne comptée *b* et incrémente *b*.   

* __CP__&nbsp;&nbsp;( -- a ) Empile l'adresse de la variable système **CP** qui contient l'adresse du début de l'espace libre en mémoire flash. 

* __CR__&nbsp;&nbsp;( -- ) Envoie le caractère ASCII **CR** au terminal.

* __CREATE__&nbsp;&nbsp;( -- ; &lt;string&gt; ) Compile le nom d'une nouvelle variable dans le dictionnaire. **&lt;string&gt;** est le nom de la nouvelle variable. Les variables sont initialisées à **0**.  

* __DCONST__&nbsp;&nbsp;( d -- ; &lt;string&gt;) Création d'une constante de type entier double.

* __DECIMAL__&nbsp;&nbsp;( -- ) Affecte la valeur **10** à la variable système **BASE**. 

* __DEPTH__&nbsp;&nbsp;( -- u ) retourne le nombre d'élément qu'il y a sur la pile.

* __DI__&nbsp;&nbsp;( -- ) Désactive les interruptions en exécutant l'instruction machine **SIM**. 

* __DIGIT__&nbsp;&nbsp;( u -- c ) Convertie le chiffre *u* en caractère ASCII.

* __DIGIT?__&nbsp;&nbsp;( c base -- u f ) Converti le caractère *c* en chiffre correspondant dans la *base*. L'indicateur *f* indique si *c* est bien dans l'intervalle {0..base-1}.   

* __DNEGATE__&nbsp;&nbsp;( d1 -- d2 ) Négation arithmétique de l'entier double *d1*.

* __DO$__&nbsp;&nbsp;( -- b ) Partie *runtime* de **$"** retourne l'adresse de la chaîne litérale qui a été compilée.  

* __DOCONST__&nbsp;&nbsp;( -- n ) Partie *runtime* de **CONSTANT** empile la valeur de la constante.  

* __DO_DCONST__&nbsp;&nbsp;( -- d ) Partie *runtime* de **DCONST**. Empile la contante double *d*.

* __DOLIT__&nbsp;&nbsp;( -- n ) Partie *runtime* résultant de la compilation d'un entier litéral. *n* et l'entier qui a été compilé. 

* __DOVAR__&nbsp;&nbsp;( -- a ) Partie *runtime* résultant de la compilation d'une variable.  
*a* est l'adresse de la variable qui a été compilée. 

* __DROP__&nbsp;&nbsp;( n -- ) Jette l'élément qui est au sommet de la pile. 

* __DUMP__&nbsp;&nbsp;( a u -- ) Affiche en hexadécimal le contenu de la mémoire débutant à l'adresse *a*. *u* octets arrondie au multiple de 16 supérieur sont affichés. Chaque ligne affiche 16 octets suivit de leur représentation ASCII.  

* __DUP__&nbsp;&nbsp;( n -- n n ) Empile une copie de l'élément au sommet de la pile.

* __EI__&nbsp;&nbsp;( -- ) Active les interruptions en exécutant l'instruction machine **RIM**.

* __ELSE__&nbsp;&nbsp;( a1 -- a2 ) Compile l'adresse du saut avant dans la fente *a1* laissée sur la pile par le **IF** qui indique où doit se faire le saut avant pour exécuter une condition *fausse*. Laisse *a2* sur la pile qui est l'adresse de la fente qui doit-être comblée par le **THEN** et qui permet un saut avant après le **THEN** lors que la condition *vrai* est exécutée.   

* __EMIT__&nbsp;&nbsp;( c -- ) Envoie vers le terminal le caractère *c*. 

* __ERASE__&nbsp;&nbsp;( b u -- ) Met à zéro *u* octets à partir de l'adresse *b*.

* __EVAL__&nbsp;&nbsp;( -- ) Interprète le texte d'entrée. 

* __EXECUTE__&nbsp;&nbsp;( a -- ) Exécute le code à l'adresse *a*.  

* __EXTRACT__&nbsp;&nbsp;(  n1 base -- n2 c  ) Extrait le chiffre le moins significatif de *n* et le converti en caractère ASCII *c*. *n2=n1/base*.   

* __FC-XOFF__&nbsp;&nbsp;( -- ) Envoie du caractère ASCII XOFF (19) au terminal. Il s'agit du caractère de contrôle de flux logiciel selon le protocole XON/XOFF. Lorsque le terminal reçoit ce caractère il doit cesser de transmettre jusqu'à ce qu'il reçoive un caractère XON. 

* __FC-XON__&nbsp;&nbsp;( -- ) Envoie du caractère ASCII XON (17) au terminal. Il s'agit du caractère de contrôle de flux logiciel selon le protocole XON/XOFF. Indique au terminal qu'il peut reprendre la transmission.

* __FILL__&nbsp;&nbsp;( b u c -- ) Remplie *u* octets de la mémoire RAM à partir de l'adresse *b* avec le caractère *c*.  

* __FIND__&nbsp;&nbsp;( a va -- ca na | a 0 ) Recherche le nom pointé par *a* dans le dictionnaire à partir de l'entrée indiquée par *va*. Si trouvé retourne *ca* l'adresse d'exécution. *na* l'adresse du champ nom. En cas d'échec retourne *a* et *0*.

* __FOR__&nbsp;&nbsp;( n+ -- ) Initialise une boucle FOR..NEXT. *n+* est un entier positif. La boucle se répète *n+1* fois. 

* __FORGET__&nbsp;&nbsp;( -- ; &lt;string&gt; ) Supprime du dictionnaire la définition **&lt;string&gt;** ainsi que toutes celles qui ont étées créées après celle-ci. Ne supprime que les définitions en mémoire FLASH. Pour les définitions en mémoire RAM il faut faire un **REBOOT**. 

* __FREEVAR__&nbsp;&nbsp;( na -- ) *na* étant l'adresse du champ nom d'une variable **FEEVAR** réinitialise le pointeur **VP** à cette adresse. Toute allocation de mémoire RAM qui suit cette adresse est perdu.  

* __HERE__&nbsp;&nbsp;( -- a ) Retourne la valeur de la variable système **VP**.  

* __HEX__&nbsp;&nbsp;( -- ) Sélectionne la base numérique hexadécimal. Dépose la valeur **16** dans la variable système **BASE**. 

* __HLD__&nbsp;&nbsp;( -- a ) Empile l'adresse de la variable système **UHLD** 

* __HOLD__&nbsp;&nbsp;( c -- ) Insère le caractère *c* dans la chaîne de sortie. HOLD est utilisé dans la conversion des entiere en chaîne.  

* __I__&nbsp;&nbsp;( -- n+ ) Empile le compteur d'une boucle **FOR..NEXT**.

* __I:__&nbsp;&nbsp;( -- ) Débute la compilation d'une routine d'interruption. Les routines d'interruptions n'ont pas de nom et ne sont pas inscrite dans le dictionnaire. 

* __I;__&nbsp;&nbsp;( -- ad ) Termine la compilation d'une routine d'interruption. *ad* est l'adresse de la routine d'interruption tel qu'elle doit-être inscrite dans le vecteur d'interruption. 

* __IF__&nbsp;&nbsp;( f -- ) Vérifie la valeur de l'indicateur booléen *f* et exécute le code qui suis le **IF** si cette indicateur est *vrai* sinon saute après le **ELSE** ou le **THEN**. 

* __IMMEDIATE__&nbsp;&nbsp;( -- ) Active l'indicateur **IMMED** dans l'entête de dictionnaire du dernier mot qui a été compilé. Habituellement invoqué juste après le **;**. 

* __INIT-OFS__&nbsp;&nbsp;( -- ) Initialise la variable système **OFFSET** au début d'une nouvelle compilation. L'offset est la distance entre les valeurs des variables **CP** et **VP**
Lorsque la variable système **TFLASH**  est à zéro **OFFSET** est initialisé à zéro. **OFFSET** est utilisé par le compilateur pour déterminer les adresses absolues à utiliser dans les instructions de saut **BRANCH** et **?BRANCH**. 

* __KEY__&nbsp;&nbsp;( -- c ) Attend la réception d'un caractère du  terminal. Empile le caractère *c*.  

* __KTAP__&nbsp;&nbsp;( c -- ) Utilisé par **ACCEPT** pour Traiter les caractères de contrôles reçu du terminal. Les les caractères ASCII **CR** et **BS** sont traités les autres sont remplacés par un **BLANK**.  

* __LAST__&nbsp;&nbsp;( -- a ) Empile l'adresse de la variable système **LAST**. 

* __LITERAL__&nbsp;&nbsp;( n -- ) Compile *n* comme entier litéral. En *runtime* **DOLIT** est invoqué pour remettre sur la pile la valeur *n*.  

* __LSHIFT__&nbsp;&nbsp;( i1 n+ -- ) Décalager vers la gauche de *i1* *n+* bits. Les bits à droites sont mis à zéro.

* __M*__&nbsp;&nbsp;( n1 n2 -- d ) Multiplication _n1*n2_ conservé en entier double *d*.  

* __M/MOD__&nbsp;&nbsp;( d n -- r q ) Division de l'entier double *d* par l'entier simple *n*. Empile le reste et le quotient. Le quotient est arrondie à l'entier le plus petit. 

* __MAX__&nbsp;&nbsp;( n1 n2 -- n ) Empile le plus grand des 2 entiers. 

* __MIN__&nbsp;&nbsp;( n1 n2 -- n ) Empile le plus petit des 2 entiers. 

* __MOD__&nbsp;&nbsp;( n1 n2 -- n ) Retourne le reste de la division entière arrondie au plus petit entier. *n* est toujours __&ge;0__.

* __MSEC__&nbsp;&nbsp;( -- u ) Retourne la valeur du compteur de millisecondes. Il s'agit d'un compteur qui est incrémenté chaque milliseconde par une interruption du TIMER4. 

* __NAME>__&nbsp;&nbsp;( na -- ca ) Retourne l'adresse du *code* correspondant à l'entrée du dictionnaire avec le *champ nom* *ca*. Donne une valeur erronnée si *na* n'est pas une entrée valide dans le dictionnaire.  

* __NAME?__&nbsp;&nbsp;( b -- ca na | b 0 ) Recherche le nom *b* dans le dictionnaire. Si ce nom existe retourne l'adresse du code *ca* et l'adresse du champ nom *na*. Si le nom n'est pas trouvé retourne *b* et *0*. 

* __NEGATE__&nbsp;&nbsp;( i1 -- i2 ) Empile la négation arithmétique de *i1*. 

* __NEXT__&nbsp;&nbsp;( a -- ) Mot immédiat qui compile la fin d'une boucle **FOR-NEXT**.
**a** est l'adresse du début de la boucle est est compilée comme saut arrière. 

* __next__&nbsp;&nbsp;( -- ; R: I ) Compilé par **NEXT**. En *runtime* décrémente le compteur de boucle **I** et reboucle à l'adresse au début du **FOR**  tant que le compteur est &ge;0. À la sortie de la boucle *I* est jeté.   


* __NOT__&nbsp;&nbsp;( i1 -- i2 ) *i2* est le complément unaire de *i1*. Autrement dit tous les bits de *i1* sont inversés. 

* __NUF?__ ( -- f ) Vérifie si un caractère a été reçu du terminal. Si aucun caractère reçu retourne **F**. Si un caractère a été reçu jette ce caractère et appel **KEY** pour attendre le prochain caractère. Si le prochain caractère reçu est **CR** retourne **T** sinon retourn **0**. Est utilisé pour faire une pause dans un défilement d'écran.

* __NUMBER?__&nbsp;&nbsp;( b -- i T | b F ) Essaie de convertir la chaîne *b* en entier. Si la convertion réussie l'entier **i** et **T** sont retournés. Sinon **b** et **F** sont retournés.

* __OFFSET__&nbsp;&nbsp;( -- a ) Variable système indiquant la distance enter **CP** et **VP**. Utilisé pour calculer les adresses de saut lors de la compilation. 

* __OR__&nbsp;&nbsp;( n1 n2 -- n3 ) *n3* est le résultat d'un OU bit à bit entre *n1* et *n2* 

* __OVER__&nbsp;&nbsp;( n1 n2 -- n1 n2 n1 ) Copie le second élémente de la pile au sommet. 

* __OVERT__&nbsp;&nbsp;( -- ) Ajoute le dernier mot compilé au début de la liste chaîné du dicotnnaire. 

* __PACK0__&nbsp;&nbsp;( b u a -- a ) Construit une chaîne comptée à partir de *b* et de *u* qui est le nombre de caractères à copier dans *a*. Garde l'adresse de la nouvelle chaîne. 

* __PAD__&nbsp;&nbsp;( -- a ) Empile l'adresse du tampon de travail **PAD**.  

* __PARSE__&nbsp;&nbsp;( c -- b u ; <string> ) Analyseur lexical. parcourt le flux d'entrée à la recherche de la prochaîne unité lexicale. *c* est le caractère délimiteur. *b* est l'adresse de la chaîne trouvée et *u* sa longueur.  

* __PAUSE__&nbsp;&nbsp;( u -- ) Suspend l'exécution pour une durée de *u* millisecondes.  

* __PICK__&nbsp;&nbsp;( nx j -- nx nj ) Copie au sommet de la pile le jième élément de la pile. *j* est d'abord retiré de la pile ensuit les éléments sont compté à partir du sommet vers le fond de la pile. l'Élément au sommet est l'élément *0*.  Donc **0 PICK** est l'équivalent de **DUP** et **1 PICK** est l'équivalent de **OVER**. Le nombre d'éléments sur la pile doit-être &ge;j+1.

* __PRESET__&nbsp;&nbsp;( -- ) Vide la pile des arguments et le TIB avant d'invoquer **QUIT**.  

* __QUERY__&nbsp;&nbsp;( -- ) Lecture d'une ligne de texte du terminal dans le TIB. La lecture se termine à la réception d'un caractère **CR**. Le nombre de caractères dans le TIB est dans la variable systèmE **#TIB**. 

* __QUIT__&nbsp;&nbsp;( -- ) Il s'agit de l'interpréteur de texte, c'est à dire l'interface entre l'utilisateur et le système. **QUIT** appel en boucle **QUEYR** et **EVAL**. 

* __R>__&nbsp;&nbsp;( n -- R: -- n ) La valeur au sommet de la pile des arguments est transférée sur la pile des retours.

* __R@__&nbsp;&nbsp;( -- n ) La valeur au sommet de la pile des retours est copié sur la pile des arguments.  

* __RAMLAST__&nbsp;&nbsp;( -- a ) Empile l'adresse de la variable système **RAMLAST**. 

* __RANDOM__&nbsp;&nbsp;( u1 -- u2 ) Retourne un entier pseudo aléatoire dans l'intervalle **0&le;u2&lt;u1**.  

* __REBOOT__&nbsp;&nbsp;( -- ) Rédamarrage du MCU. A le même effet que d'enfoncer le bouton *RESET* sur la carte.

* __REPEAT__&nbsp;&nbsp;( -- ) Termine un boucle de la forme **BEGIN-WHILE-REPEAT**. Le branchement s'effectue après le **BEGIN**.

* __ROT__&nbsp;&nbsp;( n1 n2 n3 -- n2 n3 n1 ) Rotation des 2 éléments supérieurs de la pile.

* __RP!__&nbsp;&nbsp;( n -- ) Initialise le pointeur de la pile des retours avec la valeur **n**.

* __RP@__&nbsp;&nbsp;( -- n ) Empile la valeur du pointeur de la pile des retours. 

* __RSHIFT__&nbsp;&nbsp;( n1 u -- n2 ) Décale *n1* de *u* bits vers la droite. Les bits à gauche sont remplacés par **0**. Même effet que l'opérateur **C** **&gt;&gt;**.  

* __S>D__&nbsp;&nbsp;( i -- d ) Convertie un entier simple en entier double. 

* __SAME?__&nbsp;&nbsp;( a1 a2 u -- a1 a2 f ) Compare *a1* et *a2* sur *u* octets et retourne **0** s'ils sont identiques sinon retourne u-1.  

* __SEED__&nbsp;&nbsp;( u -- ) Initialise le générateur pseudo-aléatoire.  

* __SET-ISP__&nbsp;&nbsp;( u1 u2 -- ) Fixe le niveau de priorité logicielle d'interruption du vecteur *u2* avec la valeur *u1* {1,2,3}. Le niveau maximal est **3** et c'est la valeur par défaut..

* __SIGN__&nbsp;&nbsp;( i -- ) Si i&lt;0 alors préfixe la chaîne numérique du caractère **-**. Est utilisé lors de la conversion d'un entier en chaîne de caractères.  

* __SP!__&nbsp;&nbsp;( u --  ) Initialise le pointeur de la pile des arguments.  

* __SP@__&nbsp;&nbsp;( -- u ) Empile la valeur du pointeur des arguments. 

* __SPACE__&nbsp;&nbsp;( -- ) Envoie un caractère ASCII *espace* au terminal.

* __SPACES__&nbsp;&nbsp;( n+ -- ) Envoie **n+** caractères ASCII *espace* au terminal. 

* __STR__&nbsp;&nbsp;( i -- b u ) Converti en chaîne de caractère l'entier **i**. **b** est la chaîne résultatnte et **u** la longueur de cette chaîne. 

* __SWAP__&nbsp;&nbsp;( n1 n2 -- n2 n1 ) Inverse l'ordre des 2 éléments au sommet de la pile. 

* __TAP__&nbsp;&nbsp;( a1 c -- a2 ) Envoie le caractère **c** au terminal et le dépose dans le tampon à l'adresse **a1**. Incrémente **a1** pour donner **a2**.  

* __TBUF__&nbsp;&nbsp;( -- a ) Empile l'adresse du tampon de 128 octets qui sert à l'écriture par bloc dans la mémoire persistante. 

* __TFLASH__&nbsp;&nbsp;( -- a ) Empile l'adresse de la variable système **TFLASH** qui indique la destination de la compilation. Cette variable est modifiée par **TO-FLASH** et **TO-RAM**.

* __THEN__&nbsp;&nbsp;( -- ) Termine une boucle **IF-ELSE-THEN. 

* __TIB__&nbsp;&nbsp;( -- a ) Empile l'adresse du *Transaction Input Buffer* qui est le tampon qui accumule les caractes lus par **ACCEPT**.  

* __TIMEOUT?__&nbsp;&nbsp;( -- f ) Vérifie l'état du compteur à rebour **TMER** et retourne *vrai* s'il est à zéro sinon retourne *faux*.

* __TIMER__&nbsp;&nbsp;( u -- ) Initialise le compteur à rebour. Ce compteur est décrémenter à chaque milliseconde jusqu'à ce qu'il atteigne zéro. 

* __TMP__&nbsp;&nbsp;( -- a ) Empile l'adresse de la variable système **TMP**.  

* __TO-FLASH__&nbsp;&nbsp;( -- ) Met à **-1** la valeur de la variable système **TFLASH**. Indiquant ainsi que les mots doivent-être compilés dans la mémoire flash. 

* __TO-RAM__&nbsp;&nbsp;( -- ) Met à **0** la valeur de la variable sytème **TFLASH**. Indiquant ainsi que les mots doivent-être compilés dans la mémoire RAM. C'est mots sont perdus lors d'une réinitialisaton du système avec **COLD**,**REBOOT**,un *RESET* ou une perte d'alimentation de la carte.  

* __TOKEN__&nbsp;&nbsp;( -- a ; &lt;string&gt;) Extrait le prochain mot du TIB. 

* __TYPE__&nbsp;&nbsp;( b u -- ) Envoie *u* caractère au terminal à partir de l'adresse *b*. 

* __U.__&nbsp;&nbsp;( u -- ) Imprime l'entier non signé *u*.

* __U.R__&nbsp;&nbsp;( u n+ -- ) Imprime l'entier non signé *u* sur *n+* colonnes aligné à droite avec remplissage par *espace*.  

* __U<__&nbsp;&nbsp;( u1 u2 -- f ) Comparaison de 2 entiers non signés. Retourne *vrai* si *u1&lt;u2*. Sinon retourne *faux*. 

* __UM*__&nbsp;&nbsp;( u1 u2 -- ud ) Multiplication de 2 entiers non signés et retourne le résultat comme entier non signé double.  

* __UM+__&nbsp;&nbsp;( u1 u1 -- ud ) Additionne 2 entiers non signés et retourne la somme comme entier non signé double.  

* __UM/MOD__&nbsp;&nbsp;( ud u -- ur uq ) Division non signé de l'entier double *ud* par l'entier simple non signé *u*. Retourne le reste *ur* et le quotient *uq*. 

* __UNTIL__&nbsp;&nbsp;( f -- ) Termine une boucle **BEGIN - UNTIL**. La boucle se termine quand **f** est *vrai*.  

* __VARIABLE__&nbsp;&nbsp;( -- &lt;string&gt;) Crée une nouvelle variable de nom **&lt;string&gt;**. Cette variable est initialisée à zéro.  

* __VP__&nbsp;&nbsp;( -- a ) Empile l'adresse de la variable système **VP**.  

* __WHILE__&nbsp;&nbsp;( f -- ) Condition de contrôle d'une boucle **BEGIN - WHILE - REPEAT**. la boucle se poursuit tant que **f** est *vrai*.  

* __WITHIN__&nbsp;&nbsp;( u ul uh -- f ) Retourne **f** indiquant si **ul &le; u &lt;uh** 

* __WORD__&nbsp;&nbsp;( c -- a ) Extrait le prochain mot du **TIB** et le copie à la fin du dictionnaire. **c** est le caractère séparateur de mot et **a** est l'adresse où le mot a été copié. 

* __WORDS__&nbsp;&nbsp;( -- ) Imprime la liste de tous les mots du dictionnaire. 
* __XOR__&nbsp;&nbsp;( n1 n2 -- n3 ) **n3** est le résultat d'un ou exclusif bit à bit entre **n1** et **n2**.  

* __[__&nbsp;&nbsp;( -- ) Initialise le vecteur EVAL en mode *interprétation*. 

* __[COMPILE]__&nbsp;&nbsp;( -- &lt;string&gt; ) Ce mot est utilisé à l'intérieur d'une définition pour compiler le mot suivant qui est un mot *immédiat* donc serait exécuté plutôt que compilé.

* __[N]?__&nbsp;&nbsp;( n+ - n T | a F ) Affiche **[n+]?** puis attend la saisie d'un entier.
Si un entier a été entré au terminal retourne l'entier et **T** sinon retounre l'adresse du token **a** et **F**. Ce mot est utilisé par **CTFILL** et **WTFILL**. 

* __\__&nbsp;&nbsp;( -- ) Introduit un commentaire qui se termine à la fin de la ligne.

* __]__&nbsp;&nbsp;( -- ) Initialise le vecteur EVAL en mode *compilation*. 

* __^H__&nbsp;&nbsp;( -- ) Envoie le caractère ASCII DEL (8) au terminal. 

* __dm+__&nbsp;&nbsp;( a u -- a+u ) Affiche l'adresse **a** suivit de **u** de mémoire à partir de **a**. Retourne l'adresse incrémenté. Invoqué par **DUMP**.  

* __hi__&nbsp;&nbsp;( -- ) Application par défaut appellée par **COLD** et qui imprime le message *stm8eForth v3.0*. 

* __parse__&nbsp;&nbsp;( b1 u1 c -- b2 u2 delta ; <string> ) **c** étant le séparateur de mots saute par dessus les **c** jusqu'au premier caractère différent de **c** ensuite avance jusqu'au premier caractère **c**. **b2** est le début du mot, **u2** sa longueur et **delta** est la distance **b2-b1**.   

[Index](#index)
<hr>
<a id="flash"></a>

## Module flash.asm 

Ce module définit le vocabulaire nécessaire pour écrire dans la mémoire persitante FLASH,EEPROM et OPTION. Il y a aussi des mots pour modifier les vecteurs d'interruptions.

* __BUF&gt;ROW__&nbsp;&nbsp;( ud -- ) Écris le contenu du tampon **ROWBUFF** dans la mémoire flash en utilisant l'opération d'écriture par bloc du MCU.   

* __CHKIVEC__&nbsp;&nbsp;( a -- ) Toutes les adresses de destination des vecteurs d'interruptions sont comparés à *a*. Tous les vecteurs qui pointent vers une adresse &lt;=*a* sont réinitialisés à la valeur par défaut. Ce mot est invoqué par **PRISTINE**. 

* __EE!__&nbsp;&nbsp;( n ud -- ) Écriture en mémoire persistante (FLASH|EEPROM) de la valeur *n*. *ud* et un entier double non signé représentant l'adresse destination. 

* __EE,__ ( n -- ) Compile en mémoire FLASH l'entier *n*. 

* __EEC!__&nbsp;&nbsp;( c ud -- ) Écris en mémoire persistante le caractère *c*. *ud* est l'adresse destination sous-forme d'entier double non signé.

* __EEC,__&nbsp;&nbsp;( c -- )  Compile en mémoire FLASH le caractère *c*.  

* __EE-CREAD__&nbsp;&nbsp;( -- c) Empile le caractère à l'adresse pointé par **FPTR** et incrément le pointeur.

* __EE-READ__&nbsp;&nbsp;( -- n ) Empile l'entier pointé par **FPTR** et incrément le pointeur de 2.

* __EEP-CP__&nbsp;&nbsp;( -- ud ) Empile l'adresse de la variable système persistante **APP_CP**
. *ud* est un entier double non signé. 

* __EEP-LAST__&nbsp;&nbsp;( -- ud ) Empile l'adresse de la variable système persistante **APP_LAST**.

* __EEP-RUN__&nbsp;&nbsp;( -- ud ) Empile l'adresse de la variable système persistante **APP_RUN**. 

* __EEP-VP__&nbsp;&nbsp;( -- ud ) Empile l'adresse de la variable système persitante **APP_VP** 

* __EEPROM__&nbsp;&nbsp;( -- ud ) Empile l'adresse de base de l'EEPROM. 

* __F@__&nbsp;&nbsp;( ad -- n ) Empile l'entier qui se trouve à l'adresse étendue *ad*. Utile pour lire la mémoire flash au delà de 65535. Sur la version **NUCLEO** seulement.

* __FADDR__&nbsp;&nbsp;( a -- ad ) Convertie l'adresse 16 bits *a* en adresse 32 bits *ad*. Sur la version **NUCLEO** seulement.

* __FC@__&nbsp;&nbsp;( ad -- ) Empile l'octet qui se trouve à l'adresse étendue *ad*. Utile pour lire  à mémoire flash au delà de 65535. Sur la version **NUCLEO** seulement.

* __FMOVE__&nbsp;&nbsp;( -- a ) Déplace le dernier mot compilé de la mémoire RAM vers la mémoire FLASH. Retourne le pointeur de code mis à jour *a*.  

* __FP!__&nbsp;&nbsp;( ad -- ) Initialize la variable système **FPTR** avec la valeur *ad*. Le far pointer est utilisé pour les opérations d'écriture en mémoire persistante.  

* __IFMOVE__&nbsp;&nbsp;( -- a ) Transfert routine d'interruption qui vient d'être compilée vers la mémoire flash. *a* est la valeur mise à jour du pointeur de code *CP*. 

* __INC-FPTR__&nbsp;&nbsp;( -- ) Incrémente la variable système **FPTR**.  

* __LOCK__&nbsp;&nbsp;( -- ) Verrouille l'écrire dans la mémoire persistante (FLASH et EEPROM).

* __PRISTINE__&nbsp;&nbsp;( -- ) Nettoie le système de toutes les modifications effectuées par l'utilisateur. Le système Forth se retrouve alors dans son état initial avant toute intervention de l'utilisateur. 

* __PTR+__&nbsp;&nbsp;( u -- ) Incrémente **FPTR** d'une valeur arbitraire *u*.

* __RAM&gt;EE__&nbsp;&nbsp;( ud a u1 -- u2 ) Écris dans la mémoire persistance *u1* octets de la mérmoire RAM à partir de l'adresse *a* vers l'adresse *ud*. Cependant l'écriture est limitée aux limites du bloc 128 octets qui contient l'adresse *ud*. Si *ud+u1*  dépasse la limite l'écriture s'arrête à la fin du bloc. Retourne *u2* le nombre d'octets réellement écris. 

* __RFREE__&nbsp;&nbsp;( a -- u ) *u* est le nombre d'octets libres dans le bloc qui contient l'adresse *a*. En fait u=128-a%128. 128 étant la longueur d'un bloc FLASH pour les MCU **STM8S105C6** et **STM8S208RB.**  

* __ROW-ERASE__&nbsp;&nbsp;( ud -- ) Efface le bloc de mémoire persistante contentant l'adresse **ud**.  

* __ROW&gt;BUF__&nbsp;&nbsp;( ud -- ) Copie le bloc de mémoire persistante contenant l'adresse **ud** vers le tampon système **TBUF**. 

* __RST-IVEC__&nbsp;&nbsp;( u -- ) Réinitialise le vecteur d'interruption #**u** à sa valeur par défaut. 

* __SET-IVEC__&nbsp;&nbsp;( ud u -- )  Initialise le vecteur d'interruption *u* avec l'adresse **ud** qui et l'adresse d'une routine de service d'interruption. 

* __SET-OPT__&nbsp;&nbsp;( c u -- ) Écris le caractère *c* dans le registre d'OPTION *u*.  

* __UNLKEE__&nbsp;&nbsp;( -- ) Déverouille pour l'écriture la mémoire EEPROM.  

* __UNLKFL__&nbsp;&nbsp;( -- ) Déverouille pour l'écriture la mémoire FLASH.

* __UNLOCK__&nbsp;&nbsp;(  -- ) Selon l'adresse contenue dans la variable système **FPTR** déverrouille la mémoire FLASH ou EEPROM.  

* __UPDAT-CP__&nbsp;&nbsp;( -- ) Met à jour la variable système persistante **EEP-CP** à partir de la variable **CP**.  

* __UPDAT-LAST__&nbsp;&nbsp;( -- ) Met à jour la variable système persistante **EEP-LAST** à partir de la variable **LAST**. 

* __UPDAT-PTR__&nbsp;&nbsp;( -- ) Met à jour les différentes variables système persistantes à partir des valeurs de leur correspondantes non persistantes.

* __UPDAT-RUN__&nbsp;&nbsp;( a -- ) Met à jour la variable système persistante **EEP-RUN**. **a** est la nouvelle adresse du programme à exécuter au démarrage.

* __UPDAT-VP__&nbsp;&nbsp;( -- ) Met à jour la variable système persistante **EEP-VP** à partir de la valeur de **VP**. 

* __WR-BYTE__&nbsp;&nbsp;( c -- ) Écris un octet dans la mémoire persistante à l'adresse indiquée par la variable système **FPTR**.  Incrémente **FPTR**.

* __WR-ROW__&nbsp;&nbsp;( a ud -- ) Écriture d'un bloc de 128 octets dans la mémoire persistante. **a** est l'adresse RAM qui contient les données à écrires et **ud** l'adresse destination. Si *ud* n'est pas alignée sur un bloc de 128 octets il le sera en mettant les 7 bits les moins significatifs à zéro. Dans la version **DISCOVERY** *ud* est remplacé par une adresse de type *entier simple non signé*.

* __WR-WORD__&nbsp;&nbsp;( n -- ) Écris un entier 16 bits dans la mémoire persitante à l'adresse pointée par **FPTR**. Incrémente **FPTR**. 


[Index](#index)

<hr>
<a id="scaling"></a>

## Module const_ratio.asm 

Ce module définie des constantes arithmétiques constituée de 2 entiers dont le rapport approche un nombre irrationnel. Ces valeurs sont utilisées dans les opérations de *scaling*. 

* __12RT2__&nbsp;&nbsp;( -- 26797 25293 ) Empile 2 constantes dont le rapport s'approche de la racine 12ième de 2. 

* __E__&nbsp;&nbsp;( -- 28667 10546 ) Le rapport des 2 entiers empilés donne une valeur approximative de la base du logarithme népérien. 

* __LN2S__&nbsp;&nbsp;( -- 485 11464 ) Empile 2 entiers dont le rapport approxime la valeur de __10³ * ln(2)/2¹⁴.__

* __LOG2S__&nbsp;&nbsp;( -- 2040 11103 ) Empile 2 entiers dont le rapport approxime la valeur de __10⁴ * log(2)/2¹⁴.__


* __PI__&nbsp;&nbsp;( -- 355 113 ) Empile 2 entiers dont le rapport se rapproche de la constante **PI**.  

* __SQRT10__&nbsp;&nbsp;( -- 22936 7253 ) Empile deux entiers dont le rapport approxime la racine carrée de 10. 

* __SQRT2__&nbsp;&nbsp;( -- 19601  13860 ) Empile deux entiers dont le rapport approxime la racine carrée de 2.  

* __SQRT3__&nbsp;&nbsp;( -- 18817 10864 ) Empile deux entiers dont le rapport approxime la racine carrée de 3. 

[Index](#index)

<hr>
<a id="ctable"></a> 

## Module ctable.asm

Ce module définit le vocabulaire servant à la création et l'initialisation de tables de constantes persistantes. Deux types de tables peuvent-être créées, les tables d'octets et les tables d'entiers 16 bits. Ce module dépend du module **flash.asm**. 

* __CALLOT__&nbsp;&nbsp;( u -- ad ) Alloue **u** octet dans l'espace *code* de la mémoire FLASH. **ad** est l'adresse de base de ce bloc de mémoire. 

* __CTABL@__&nbsp;&nbsp;( u ad -- c ) Empile l'octet **c** d'indice **u** de la table dont l'adresse de base est **ud**.  Les indices de tables commence à zéro. 

* __CTABLE__&nbsp;&nbsp;( u -- ad ; &lt;string&gt; ) Création d'une table de **u** octets dans l'espace code. **&lt;string&gt;** est le nom de la table. **ad** est l'adresse de base de la table nouvellement créée. **ATTENTION:** même si la variable **TFLASH** est à *faux* l'espace est toujours alloué dans la mémoire FLASH. Par contre la variable qui référence la table sera créée dans le dictionnaire en mémoire RAM. Donc après un redémarrage l'espace alloué pour cette table est toujours réservé en mémoire FLASH mais la variable de référence est perdue. 
Donc les tables de constantes ne devrait-être créée qu'en mode **TO-FLASH** pour que la référence soit préservée après redémarrage.  

* __CTINIT__&nbsp;&nbsp;( ad -- ) Outil d'initialisation des tables de constantes de type octet. **ad** est l'adresse de base de la table. L'utilisateur doit saisir au terminal une valeur entière dans l'intervalle {0..255} pour chaque entrée de la table.  L'initialisation se termine lorsqu'une ligne vide ou une valeur non numérique est saisie au terminal.

* __WTABL@__&nbsp;&nbsp;( u ad -- n ) Empile l'entier **n** d'indice **u** de la table dont l'adresse de base est **ud**.  Les indices de tables commence à zéro. 

* __WTABLE__&nbsp;&nbsp;( u -- ad ; &lt;string&gt; ) Création d'une table de **u** entiers dans l'espace code. **&lt;string&gt;** est le nom de la table. **ad** est l'adresse de base de la table nouvellement créée.

* __WTINIT__&nbsp;&nbsp;( ad -- ) Outil d'initialisation d'une table de contantes entiers dans la mémoire persistante. **ad** est l'adresse de la table.  L'utilisateur doit saisir au terminal une valeur entière dans l'intervalle {-32768..32767} pour chaque entrée de la table qu'il désir initialiser. L'initialisation se termine lorsqu'une ligne vide ou une valeur non numérique est saisie au terminal.  **ATTENTION:** même si la variable **TFLASH** est à *faux* l'espace est toujours alloué dans la mémoire FLASH. Par contre la variable qui référence la table sera créée dans le dictionnaire en mémoire RAM. Donc après un redémarrage l'espace alloué pour cette table est toujours réservé en mémoire FLASH mais la variable de référence est perdue. Donc les tables de constantes ne devrait-être créée qu'en mode **TO-FLASH** pour que la référence soit préservée après redémarrage.  

* __[N]?__&nbsp;&nbsp;( n+ -- n T | a F ) Ce mot est invoqué par **CTINIT** et **WTINIT** pour effectuer la saisie au terminal des entiers qui servent à initialiser une table de constantes. 
Pour chaque entier requie l'invite **[n+]?** est affichée au terminal en attente de la saisie par l'utilisateur d'un entier. **n+** est l'indice de table qui recevra l'entier saisie. Ce mot retourne  l'entier saisie **n** et **T** ou **a** et **F** Si la valeur saisie n'est pas un entier. 

[Index](#index)