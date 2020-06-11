# Manuel de référence pour le stm8_eForth sur carte NUCLEO-8S208RB 

![carte.png](carte.png)

Ce manuel est écris pour la version 3.0. Il s'agit d'une présentation du vocabulaire du système.

### Conventions 

Le nom du mot est suivit d'un commentaire entre parenthèse qui indique l'état de la pile des arguments avant et après l'exécution du mot. Le double tiret sépare la situation avant de la situation après. Si le mot affecte le contenu de la pile des retours celle-ci est indentifiée par **R:** suivit de la liste des éléments. Dans les schémas de piles l'élément à droite représente la valeur au sommet. En allant vers la gauche on s'enfonce dans la pile. 

#### Éléments sur la pile 

Les différents types de données qui peuvent se retrouver sur la pile sont indiqués de la façon suivante. 

* **ix**  Indique un nombre quelconque d'éléments génériques.
* **i**   Indique un type de donné générique  
* **n**   Indique un entier 16 bits signé. 
* **u**   Indique un entier 16 bits non signé. 
* **c**   Indique un entier 8 bits ou un caractère ASCII.
* **a**   Indique une adresse de 16 bits 
* **ud**  Indique un entier 32 bits non signé. Souvent utilisé pour représenter une adresse de 24 bits dans la mémoire FLASH étendu. 
* **d**   Indique un entier 32 bits signée. 
* **t**   Booléen vrai n'importe quel entier sauf **0** mais habituellement  **-1** 
* **f**   Booléen faux exprimé par l'entier **0**.   
* **b**   adresse d'un tampon d'octets. 

## Vocabulaire 


## Manipulation des éléments sur les piles 

**DROP**  ( ix i -- ix ) Jette l'élément qui se trouve sommet de la pile des arguments.

**DUP**  ( i -- i i ) Empile une copie de l'élément au sommet de la pile. 

**?DUP** ( i -- i i | i ) Empile une copie de l'élément au sommet de la pile seulement s'il est différent de 0. 

**2DROP** ( i1 i2 -- ) Jette les 2 éléments au sommet de la pile.

**2DUP** ( i1 i2 -- i1 i2 i1 i2 ) Empile une copie des 2 éléments au sommet de la pile.  

**SWAP** ( i1 i2 -- i2 i1 ) Inverse l'ordre des 2 éléments au sommet de la pile. 

**OVER** ( i1 i2 -- i1 i2 i1 ) Empile une copie du deuxième élémnent de la pile. 

**ROT** ( i1 i2 i3 -- i2 i3 i1 ) Modifie l'ordre des 3 éléments supérieurs de la pile de  sorte que le 3ième se retrouve au sommet alors que les 2 autres glissent vers le bas de la pile. 

**PICK** ( in ix n -- in ix in ) Copie le nième élément de la pile au sommet de celle-ci. La position est comptée après que l'argument de **PICK** est retiré du sommet. la phrase **0 PICK**  est équivalente à **DUP** et **1 PICK** équivaut à **OVER**. 

**DEPTH** ( -- u )  Retourne le nombre d'éléments sur la pile des arguments.

**SP!** ( i -- )  Initialise le pointeur de la pile des arguments avec la valeur qui est au sommet de cette pile. 

**RP!** ( i -- ) Initialise le pointeur de la pile des retours avec la valeur qui est au somme t de la pile des arguments. 

**SP@** ( -- i ) Empile la valeur du pointeur de la pile des arguments 

**RP@** ( -- i ) Empile la valeur du pointeur de la pile des retours 

**&gt;R** ( i -- ) R: ( -- i ) Transfert la valeur au sommet de la pile des arguments sur la pile des retours.

**R&gt;** ( -- i ) R: ( i -- ) Transfert la valeur au sommet de la pile des retours vers la pile des arguments.

**R@** ( -- i ) R: ( i -- i ) Copie la valeur au sommet de la pile des retours sur la pile des arguments.

## Lecture écriture des variables 

**C@** ( a -- c ) Lecture de l'octet à l'adresse **a**.

**@**  ( a -- n ) Lecture de l'entier à l'adresse **a**. 

**2@** ( a -- d ) Lecture d'un entier double à l'adresse **a**.

**C!** ( c a -- ) Sauvegarde de l'octet **c** à l'adresse **a** 

**!** ( n a -- ) Sauvegarde de l'entier **n** à l'adresse **a** 

**2!** ( d a -- ) Sauvegarde d'un entier double à l'adresse **a** 

**VARIABLE** &lt;string&gt; Création de la variable **&lt;string&gt;** et initialisaton de sa valeur à **0**. 

## Opérations arithmétiques et logiques 

**+**  ( n1 n2 -- n1+n2 ) Addition

**-** ( n1 n2 -- n1-n2 ) Soustraction 

__*__ (n1 n2 -- n1*n2 ) multiplication

**/** ( n1 n2 -- n1/n2 )  division arrondie à l'entier le plus petit.  

**MOD** ( n1 n2 -- n1%n2 )  modulo (reste de la division entière).

**/MOD** ( n1 n2 -- r q ) Retourne le quotient et le reste d'une division entière. Le quotient est arrondie à l'entier le plus petit. 

__2*__ ( n -- 2*n )  Multiplication par 2 

**1-** ( n -- n-1 ) Soustrait 1 

**1+** ( n -- n+1 ) additionne 1 

**2-** ( n -- n-2 ) Soustrait 2 

**2+** ( n -- n+2 ) additionne  2 

**2/** ( n -- n/2 ) Division par 2

__*/__ ( n1 n2 n3 -- n1*n2/n3 ) Le produit est conservé sur 32 bits. La division est donc faite sur un entier de 32 bits divisé par un entier de 16 bits. Seul le quotient est conservé. Le quotient est arrondie à l'entier le plus petit.

__*/MOD__ ( n1 n2 n3 -- r q ) n1*n2/n3  Le quotient et le reste sont conservés.  Le produit est conservé sur 32 bits. Le quotient est arrondie à l'entier le plus petit. 

__M*__ ( n1 n2 -- d ) Multiplication et le résutlat est conservé sur 32 bits (entier double).

__UM*__ ( u1 u2 -- ud ) Multiplication non signée, le résutlat est conservé sur 32 bits.

**M/MOD** ( d n -- r q ) Division signée d'un entier double par un entier simple.

**UM/MOD** (ud u -- r q ) Division non signée d'un entier double par un entier simple.

**0** ( -- 0 ) Empile la constante **0** 

**1** ( -- 1 ) Empile la constante **1** 

**-1** ( -- -1 ) Empile la constante **-1** 

**WITHIN** (  u ul uh -- t|f ) **t** Si  ul&lt;=u&lt;uh autrement **f**  

**MIN** ( n1 n2 -- n )  Retourne le plus petit des 2 entiers.

**MAX** ( n1 n2 -- n ) Retourne le plus grand des 2 entiers.

**LSHIFT** ( i1 u  -- i2 )  Décale logique vers la gauche **i1** de **u** bits .

**RSHIFT** ( i1 u - i2 )  Décalage logique vers la droite de **i1** de **u** bits. 

**NOT** ( i1 -- i2 )  **i2** est le complément de **i1**

**NEGATE** ( i1 -- i2 ) **i2** est la négation arithmétique de **i1** 

**DNEGATE** ( d1 -- d2 ) **d2** est la négation arithméqitue de **d1**

**ABS** (i -- u ) **u** est la valeur absolue de **i**. 

**<** ( i1 i2 -- t|f )  **t** si i1&lt;i2 sinon **f**.

**U&lt;** ( u1 u2 -- t|f ) **t** si u1&lt;u2 sinon **f**.

**=** ( i1 i2 -- t|f )  **t** si i1==i2 sinon **f**.

## Branchement et boucles 

**BRANCH** &lt;a&gt;  Branchement inconditionnel à l'adresse **a** 

**?BRANCH** ( t|f -- )  &lt;a&gt;  Branche vers **a** si le sommet de la pile est **0**. 

**FOR** ( u -- ) R: (  -- a u ) Initialise une bouche FOR..NEXT 

**NEXT** ( -- )  R: ( a u -- a u- | ) Décrémente le compteur **u** et boucle à l'adresse **a** si u>0 sinon jette les 2 éléments au sommet de la pile **R:** et sort de la boucle. 

**I** ( -- u ) R: ( a u -- a u ) Empile le compteur **u** qui est sur **R:**. Utilisé à l'intérieur d'une boucle FOR..NEXT.

**BEGIN** ( -- a )  Initialise une boucle qui se termine par **UNTIL** ou **AGAIN**. 

**UNTIL** ( -- t|f ) R: ( a -- ) Branche au début de la boucle si la valeur au sommet de la pile est 
**0**.  Sinon jette **a** et sort de la boucle. l'adresse **a** est compilée par **BEGIN**.

**AGAIN** ( -- ) R: ( a -- a ) Branchement inconditionnel à l'adresse **a**. l'adresse **a** est compilée par **BEGIN**. 

**IF** ( t|f -- ) Si **t** exécute les instruction qui suivent le **IF** 

**ELSE** ( -- )  Viens après le **IF** pour indiqué où débute les instructions à exécutées si le **IF** est faux. le **ELSE** peut-être absent on a alors **IF**..**THEN**

**THEN** ( -- ) Termine une structure **IF**..**ELSE**..**THEN** 

**AHEAD** ( -- a ) Ne sert que lors de la définitions d'un mot pour compiler un saut vers l'avant. **a** est l'adresse où sera insérée la destination du saut. 

**WHILE** ( t|f -- ) Utilisé à l'intérieur d'une boucle BEGIN..WHILE..REPEAT pour sortir de la boucle lorsque la condition devient fausse. 

**REPEAT** ( -- ) R: ( a -- ) Saut inconditionnel vers l'adresse **a**. Cette adresse est compilée par le **BEGIN**. 

**AFT** ( -- )  Utilisé à l'intérieur d'une boucle FOR..AFT..THEN..NEXT pour indiquer l'endroit où doit brancher le NEXT. Dans ce type de boucle Les instructions avant le **AFT** ne sont exécutées qu'une seule fois à la première itération puis il y a un saut après le **THEN**. Aux itérations suivantes le bouclage se fait après le **AFT**. 

## Écriture en FLASH, EEPROM et OPTION 

**NOTES:**  
* Toutes les adresses fournies pour l'écriture dans la mémoire persistante doivent-être de type entier double non signé même lorsque l'adresse est &lt;65535.

* Les opérations d'écriture dans la mémoire persistante se font à l'aide d'un pointeur long appellée **FPTR**.

* Certaines variables système persistantes sont conservées au début de la mémoire EEPROM. Le nom de ces variable débute par **EEP-**. 


**EEC!** ( c ud -- ) Écris l'octet **c** dans la mémoire FLASH, EEPROM ou OPTION à l'adresse **ud**.

**EE!** ( i ud -- ) Écris l'entier **i** dans la mémoire  FLASH, EEPROM ou OPTION à l'adresse  **ud**.

**EEPROM** ( -- ud ) Empile l'adresse de début de la mémoire EEPROM comme entier double non signée. 

**FP!** ( ud -- )  **FP!** initialize Le pointeur **FPTR** avec l'adresse **ud**.

**EEP-LAST** ( -- ud ) Empile l'adresse de la variable système persistante **EEP-LAST**. Cette variable conserve la valeur de **LAST** lors des mises hors tension. 

**EEP-VP** ( -- ud ) Empile l,adresse de la variable système persistante qui conserve la valeur de **VP** lors des mises hors tension. 

**EEP-RUN** ( -- ud ) Empile l'adresse de la variable système persistante qui conserve l'adresse de l'application lancée lors de la mise sous tension. 

**EEP-CP** ( -- ud ) Empile l'adresse de la variable système qui conserve la valeur de **CP** lors des mises hors tension. 

**UPDAT-LAST** ( -- ) Utilisé par le compilateur pour mettre à jour la variable persitante **EEP-LAST**. 

**UPDAT-VP** ( -- ) Utilisé par le compilateur pour mettre à jour la variable persitante  **EEP-VP**.

**UPDAT-CP** ( -- ) Utilisé par le compilateur pour mettre à jour la variable persitante  **EEP-CP**. 

**UPDAT-RUN** ( a-- ) Utilisé par  **AUTORUN** pour mettre à jour la variable persistante   **EEP-RUN**. 

**F@** ( ud -- i ) Empile un entier situé à une adresse étendue (ud&gt;65535). 

**FC@** ( ud -- c) Empile un octet situé à une adresse étendue (ud&gt;65535).

**UNLKEE** ( -- ) Utilisé par  **UNLOCK** pour déverrouiller l'accès en écriture de l'EEPROM-OPTION. 

**UNLKFL** ( -- ) Utilisé par  **UNLOCK** pour déverrouiller l'accès en écriture à la mémoire flash. 

**UNLOCK** ( -- ) Déverrouille l'accès en écriture à la mémoire persistante. **UNLOCK** lit la valeur de **FPTR** pour déterminiter quel mémoire déverrouiller FLASH|EEPROM|OPTION. 

**LOCK** ( -- ) Verrouille l'accès en écriture de la mémoire précédemment déverrouillée par **UNLOCK**.  

**INC-FPTR** ( -- ) Incremente l'address dans **FPTR**. 

**WR-BYTE** ( c -- ) Écris un octet dans la mémoire persistante à l'adresse indiquée par 
**FPTR**. **FPTR** est incrémenté. Utilisé par **EEC!** et **EE!**. 

**ROW-ERASE** ( ud -- ) Efface le contenu d'un bloc mémoire FLASH ou EEPROM. La mémoire persitante du stm8s208 est organisée en bloc de 128 octets. Un bloc peut-être effacé ou écris en une seule opération ce qui est beaucoup plus rapide qu'une opération octet par octet. **ud** est une adresse à l'intérieur du bloc. 

**WR-ROW** ( a ud -- ) Écris en une seule opération un bloc mémoire de 128 octets. **a** est un tampon en mémoire RAM qui contient les données à écrire. **ud** est l'adresse du bloc FLASH ou EEPROM. 

**SET-OPT** ( c n -- ) Modifie la valeur inscrite dans un des 7 registres d'OPTION. **c** est la nouvelle valeur et **n** est le numéro de l'option {1..7}. 

**PRISTINE** ( -- ) Remet le système Forth à son état initial avant toute modification faite par l'utilisateur. Les vecteurs d'interruptions sont réinialisés ainsi que les variables système persistantes. Seul le premier bloc de mémoire FLASH modifié par l'utilisateur est effacé. Cette opératio ne serait pas strictement nécessaire mais ça permet de voir si l'opération a bien fonctionnée. 

**CHKIVEC** ( a -- ) Réinitialise tous les vecteurs d'interruptions qui pointe vers une adresse &gt;=**a**. Utilisé par **FORGET**. 

**ROW2BUF** ( ud -- ) Copie le contenue de la mémoire FLASH ou EEPROM indiquée par l'adresse **ud** vers le tampon en RAM appellé **ROWBUFF**. Il s'agit d'un tampon réservé pour les opérations d'écriture par bloc. 

**BUF2ROW** ( ud -- ) Copie le contenue du tampon **ROWBUFF** vers la mémoire persistante. Cette opération fait parti de l'écriture par bloc. 

**RFEE** ( a -- c ) Retourne le nombre d'octets libre dans le bloc indiqué par l'adresse **a**. 
Ce mot est utilisé par **RAM2EE**. 

**RAM2EE** ( ud a u -- u2 ) Effectue l'opération d'écriture d'un bloc. **ud** est l'adresse du bloc. **a** est l'adresse du tampon contenant les données et **u** est le nombre d'octets à écrire. **u2** est le nombre d'octets effectivement écris. **RAM2EE** ne dépasse jamais les limites d'un bloc donc **u2** peut-être plus petit que **u**. 

**FADDR** ( a -- ud ) Convertie l'adresse **a** en adresse 32 bits. 

**FMOVE** ( -- cp+ ) Est utilisé par le compilateur pour transférer une nouvelle définition dans la mémoire FLASH. **cp+** est la valeur mise à jour du pointeur de code. 

**IFMOVE** ( -- cp+ ) Est utilisé par le compilateur pour tranférer une nouvelle routine d'interruption dans la mémoire FLASH. **cp+** est la valeur mise à jour du pointeur de code.

**UPDAT-PTR** ( cp+ -- ) Appelé par le compilateur après une opération **FMOVE** pour mettre à jour la valeur des variables systèmes. 
 

## Support pour les Interruptions 

**DI**  ( -- ) Disable interrupts, reflect *sim* machine code instrucition. 

**EI** ( -- ) Enable ineterrpupts, reflect *rim* machine code instruction. 

**RST-IVEC** ( u -- )  Reset interrupt vector **u** to its default behavior which is to reset MCU when triggered. **u** is in range {0..29}.

**SET-IVEC** ( ud u -- ) Set interrupt vector **u** to interrupt service routine at adress **ud** this is a double unsigned integeer. **u** is in range {0..29}.

**I:** ( -- ) Start defining an interrupt service routine. ISR have not name and are not registered in dictionary. 

**I;** ( -- ud ) Complete an interrupt service routine definition. **ud** is double unsigned integer address of ISR entry point. It is used by **SET-IVEC**. 

## Outils 

**.S** ( -- ) Imprime le contenu de la pile des arguments. L'élément du bas en premier et celui au sommet en dernier. 

**dm+** ( a u-- a+u ) Affiche l'adresse **a** suivit du contenu des **u** octets de mémoire. Retourne **a+u**. Utilisé par **DUMP**. 

**DUMP** ( a u -- )  Affiche en hexadécimal le contenu de la mémoire à partir de l'adresse **a** pour les **u** éléments suivants. Affiche toujours un multiple de 16 octets. 

**_TYPE** (b u -- ) Affiche la chaîne de caractère **b** d'une longueur de **u** caractères en remplacant les caractes non affichables par un **_**. Utilisé par **DUMP**.

## divers 

**COLD** ( -- ) Redémarrage à froid du sytème. Le contenu de la mémoire RAM est effacée. l'application par défaut est exécutée. 

**'BOOT** ( -- a ) Retourne l'adresse de la variable système persitante qui contient l'adresse d'exécution de l'application par défaut.

**hi** ( -- ) Appllication par défaut lorsqu'aucune n'a été définie par **AUTORUN**. Cette application affiche simplement le nom du système ainsi la version avant de quitter. 

**WORDS** ( -- ) Affiche la liste des mots contenus dans le dictionaire du sytème. Incluant ceux définis par l'utilisateur. 

**.ID** ( na -- ) Affiche le nom qui est inscrit dans le champ **na** i.e. *name field*. 

**&gt;NAME** ( ca -- na | f ) À partir du **ca** i.e. *code field*, Empile le *na*. Si **ca** n'est pas trouvé dans le dictionnaire retourne **f**. 

## Compilation 

**DOCONST** ( -- i ) Partie *runtime* de **CONSTANT** insérée par le compilateur dans une définition lorsqu'une constante est invoquée. Empile la valeur d'une constante.

**CONSTANT** ( i -- &lt;string&gt; ) Définie une nouvelle constante dont le nom est indiquée par **&lt;string&gt;** et la valeur par **i**. 

**DOVAR** ( -- a ) Partie *runtime* de **VARIABLE** insérée par le compilateur dans le code d'une variable lors de sa définition. A pour effet d'empiler l'adresse de la variable.

**VARIABLE** ( -- &lt;string&gt; ) Définie une nouvelle variable dont le nom est indiqué par **&lt;string&gt;**.  

**CREATE** ( -- ; &lt;string&gt; ) Compile un nouveau nom indiqué par **&lt;string&gt;**.

**IMMEDIATE** ( -- ) invoqué après la conclusion d'une nouvelle définition définie ce mot comme immédiat. Un mot immédiat est un mot que le compilateur exécute plutôt que de le compiler dans la définition. 

**:** ( -- &lt;string&gt; ) Active le compilateur. Sert à introduire une nouvelle définition. **&lt;string&gt;** est le nom de la nouvelle définition.  

**;** ( -- ) conclue une définition et termine la compilation. 

**INIT-OFS** ( -- ) Utiliser par le compilateur au début d'une définition pour initialiser la variable système **OFFSET**. 

**OFFSET** ( -- a ) Variable système qui contient la distance entre l'endroit où est compiler la nouvelle définition et sa destination finale en mémoire. 

**TO-RAM** ( -- ) Met à **f** la variable système **TFLASH** qui indique si le compilateur doit transférée la nouvelle définition dans la mémoire flash. Après l'invocaton de ce mot les nouvelles définitions sont conservées en mémoire RAM. 

**TO-FLASH** ( -- ) Met à **t** la variable système **TFLASH** pour indiquer au compilateur qu'il devra transférer les définitions suivantes vers la mémoire flash. 

**]** ( -- ) Active le compilateur. Invoqué par les mots qui compilent des définitions. 

**[** ( -- ) Désactive le compilateur. Invoqué par les mots qui compilent des définitions pour repasser en mode interprétation. 

**CALL,** ( ca -- ) Utilisé par le compilateur pour compiler un appel de sous-routine vers l'adresse **ca**. 

**,** ( i -- ) Compile l'entier **i**. 

**C,** ( c -- ) Compile l'octet **c**.

**OVERT** ( -- ) Copie la variable système **LAST** dans la variable système **CNTXT**. 

**$COMPILE** ( a -- ) **a** étant l'adresse du dernier *token* extrait du flux d'entré ce mot vérifie s'il s'agit d'un mot dans le dictionnaire. S'il est trouver dans le dictionnaire son adresse d'exécution est compilée à moins qu'il s'agisse d'un mot immédiat. Dans ce cas le mot est exécuté. Si le mot n'est pas dans le dictionnaire mais qu'il s'agit d'un entier alors cet entier est compilé. Autrement il s'agit d'une erreur et la compilation est arrêtée avec un message d'erreur. 

**$,n** ( na -- ) Compile un nouveau nom dans le dictionnaire. Affiche un avertissement si ce nom existe déjà dans le dictionnaire. Le nom à compiler se trouve à l'adresse **na**. 

**?UNIQUE** ( na -- ) Vérifie si le nom indiqué par **na** existe déjà dans le dictionnaire.

**."** ( -- &lt; string"&gt; ) Compile une chaîne de caractère qui sera imprimée en *runtime*.

**$"** ( -- &lt; string"&gt; ) Lecture et compilation d'une  une chaîne litérale à partir du flux d'entrée. 

**$"|** ( -- a ) Partie *runtime de **$"** qui empile l'adresse de la chaîne litérale compilée.

**$,"** ( -- ) Compile une chaîne litérale. Invoqué par **$"**.  

**ABORT"** ( t|f -- ) mot compilé seuelement. En *runtime** avorte une opération avec affichage d'un message d'erreur si **f**. 

**ABORT** ( -- ) Réinitialise la pile des arguments et appelle **QUIT**, l'interpréteur de texte. 

**LITERAL** ( i --  ) Compile l'entier **i** dans le dictionnaire. 

**DOLIT** ( -- i ) Compilé seulement. En *runtime* empile l'entier qui suit. 

**COMPILE** ( -- ) Compile le prochain appel de sous-routine dans la liste d'une définition. 

**[COMPILE]** ( -- &lt;string&gt;) Utiliser pour compiler un  mot immédiat qui normalement est excécuté plutôt que compilé. **&lt;string&gt;** est le mot qui suit dans le flux d'entré et qui représente un mot du dictionaire avec l'attribut immédiat. 

**ALLOT** ( n -- ) Réserve **n** octets de mémoire RAM. Peut-être utilisé aussi pour libéré de la mémoire RAM si n&lt;0. 

**'** ( -- ca|f ) &lt;string&gt; Recherche du nom **&lt;string&gt;** dans le dictionaire et empile le **ca** *(code address)* de ce nom s'il est trouvé sinon empile **f**.     

**QUIT** ( -- ) est l'interpréteur de texte de Forth. Extrait les unités lexicale du flux d'entrée est les interprère ou les compile selon l'état du système. 

**PRESET** ( -- ) Réinitialise le pointeur de la pile des arguments ainsi que la variable **TIB**. 

**EVAL** ( --  ) Extrait la prochaine unité lexicale du flux d'entrée et l'interprète ou la compile selon l'état du système. 

**$INTERPRET** ( a -- ) Interprète le jeton dont le nom est pointé par **a**. S'il ne s'agit pas d'un nom du dictionaire, essaie de le convertir entier et de l'empiler. Autrement affiche un message d'erreur. 

**'EVAL** ( -- a ) Empile l'adresse pointée par le vecteur **INTER**. Cette adresse est celle de **$INTERPRET** lorsque le système est en mode interpréteur et **$COMPILE** lorqu'il est en mode compilation. 

**?STACK** ( -- )  Contrôle la pile des arguments pour s'assurer qu'il n'y a pas *d'underflow*. 
la condition *underflow* produit un arrêt avec un message d'erreur. **EVAL** fait cette vérification après chaque opération. 

## Entrée terminal

**KEY** ( -- c ) Attend la reception d'un caractère. 

**?KEY** ( -- c t | f ) Vérifie s'il y a un caractère de disponible dans le flux d'entrée. 
Empile le caractère et *t* si c'est le cas sinon empile *f*. 

**ACCEPT** ( b u1 -- b u2 ) Lecture d'une ligne de texte dans le tampon **b** un maximum de **u2** caractères sont acceptés. **u2** est le nombre de caractères reçus.

**QUERY** ( -- ) Rempli le **TIB** avec les caractères reçu du flux d'entrée, i.e UART1. 
La limite est de 80 caractères. **QUERY** est le mot invoqué dans par **QUIT** pour la saisie d'une ligne de texte par l'utilisateur. 

**TAP** ( cur c -- cur+ ) Écho et dépose dans le tampon le caracatère reçu *c*. 
*cur* est le pointeur vers le tampon, celui-ci est incrémenté après le dépôt du caractère. 

**KTAP** ( c -- ) Vérifie si le dernier caractère reçu est un caractère de contrôle *CR* ou *BKSP*. Les autres caractères de contrôles sont remplacés par un espace. Les *CR* et *BKSP* sont traité comme il se doit. 

**^H** ( cur -- cur- ) Supprime le dernier caractère de ligne saisie. 


## Sortie terminal 

**EMIT** ( c -- ) Émet un caractère vers le terminal. i.e UART1 

**.**  ( i -- ) Imprime l'entier au sommet de la pile. 

**?** ( a -- ) Imprime l'entier à l'adresse *a*. 

**U.** ( u -- ) Imprime l'entier non signée qui est au sommet de la pile. 

**U.R** ( u +n -- ) Affiche  l'entier non signé *u* sur *n* colonnes. 

**.R** ( i +n -- ) Affiche l'entier *i* entier sur *n* colonnes. 

**.(** &nbsp;  ( -- ; &lt;string&gt; ) Affiche une chaîne de caractère terminée par **)**. Il s'agit d'un mot immédiat. 


















