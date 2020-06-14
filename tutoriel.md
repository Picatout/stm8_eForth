<!-- 
 Tutoriel réalisé par Jacques Deschênes alias PICatout 
 Copyright 2020
 licence: cc sa-by 4.0  
    ref: https://creativecommons.org/licenses/by-sa/4.0/
-->

# Tutoriel stm8 eForth version 3.0 

### Prérequis:

Une carte Carte **NUCLEO-8S208RB** avec stm8 eForth version 3.0 installé.<br/> ![Carte NUCLEO-8S208RB](carte.png)

Pour une présentation du langage Forth référez-vous à l'article wikipedia ![langage Forth](https://fr.wikipedia.org/wiki/Forth_(langage))

## Comparaison de Forth avec le langage C 

Forth se présente comme un langage de bas niveau bien qu'il soit extensible à n'importe quel niveau. Il permet de programmer des microcontrôleurs au plus bas niveau met a aussi été utilisé dans des systèmes complexes. 

Puisque Forth se présente comme un langage de bas niveau il peut sembler déconcertant au départ car l'utilisateur doit lui-même gérer les piles. Contrairement au **C** qui utilise 1 seule pile pour les retours et les arguments **Forth** sépare ses 2 fonctions entre 2 piles. Il y a la pile des arguments et la pile des retours. Certains système Forth utilise même une 3ième pile appellé pile de contrôle. **Stm8 eForth** conserve le modèle traditionnel à 2 piles. 

Ce qui peut-être déconcertant pour le débutant c'est qu'il doit lui-même gérer le passage des arguments sur la pile avant d'appeller une fonction. En **C** c'est le compilateur qui s'occupe de ça. Exemple:

    // exemple en C 
    int add(int a, int b ){ 
        return a+b ;
    }

    printf ("%d",add(23,654)); 


    ( en Forth )

    : add ( a b -- a+b )
        + ;

    23 654 add . 

Ces 2 programmes font exactement la même chose. Ils addionnent les entiers *a* et *b* et imprime le résultat. En Forth les paramètres sont toujours passé sur la pile et le résultat s'il y en a 1 (ou plusieurs) sont reçus sur la pile. La notation est dite *Polonaise inversée*. Ça signifie simplement qu'on écris les paramètres des opérateurs ou mots en avant de ces derniers. 

En **C** on doit indiquer le types des arguments et du résultat. En **Forth** comme en en **assembleur** le type de données n'est pas spécifié. C'est au programmeur de s'assurer qu'il passe les bonnes données à la fonction.  

### éléments syntaxiques 

* Le langage Forth est des plus simple en terme de syntaxe. Les éléments de la syntaxe appelés  **mots** qui composent une phrase sont séparés par un espace. C'est le seul élément séparateur. Mais il est essentiel de ne pas l'oublier sinon le résultat ne sera pas celui escompté. 

* En Forth les procédures, constantes et variables s'appellent des **mots** et ces mots sont conservés dans un dictionnaire. Ce dictionnaire donne accès à la définition de chaque mot en terme de code à exécuter. En **C** on appelerait ça le corps de la fonction.

* n'importe quel suite de caractères qui a une représentation graphique peut-être utilisé comme nom pour définir un nouveau mot. **Stm8 eForth** utilise les caractères ASCII. Donc tous caractères dont le code ASCII est dans l'intervalle {33..126} peut-être utilisé dans le nom d'un mot. Ça inclus les chiffres. **Stm8 eForth** est sensible à la casse.

```
: ASCII ( imprime la liste des caracteres ASCII) 
CR 32 BEGIN DUP EMIT 1+ DUP 127 = UNTIL DROP ; ok
ASCII
 !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~ ok

``` 
N'importe quel de ces caractères à l'exception du premier qui est l'espace (i.e. **32**) peut-être utilisé dans le nom d'une variable, constante ou fonction et il n'est pas obligatoire que le premier caractère du nom soit une lettre. 

### Commentaires 

  Il y a 2 types de commentaires en **Forth** 

  * Les commentaires délimités qui sont indiqués par le mot **(** et se  termine par le premier **)** rencontré. 

  * Les commentaires qui se termine en fin de ligne et qui sont indiqués par le mot **\**

  Notez que j'ai utilisé le qualificatif **mot** pour parler de ces 2 éléments de la syntaxe **Forth**. La syntaxe de **Forth** est très simple le seul séparateur des éléments lexical est l'espace. Et puisque **(** et __\\__ sont des mots ils doivent-être séparés du commentaire qui suit par un espace. **)** n'est pas un mot mais un caractère terminateur qui indique la fin du commentaire. Il n'est donc pas nécessaire de mettre un espace entre le dernier caractère du commenataire et la parenthèse de droite.  Ceci **( commentaire délimité)**  est correct en **Forth**.   

### Gestion de la pile des arguments (paramètres).

 Il peut-être difficile de conserver en mémoire la liste et l'ordre des paramètres qui sont sur la pile lorsqu'on écris une nouvelle définition. On peut se rendre la tâche plus facile en utlisant les commentaire délimités comme aide mémoire. Comme exemple je vais reprendre la définition de ASCII montré plus haut. 
 ```
 : ASCII ( -- ) \ imprime la liste des carcteres ASCII.
 \ Le mot **:** débute une nouvelle définition.
 \ ASCII est le nom de ce nouveau mot tel qu'il sera inscrit dans le dictionnaire. 
 CR \ envoie un caractère de contrôle  'Carriage Return' au terminal. 
 32 ( -- c )  \ l'entier 32 a été empilé. Correspond à l'espace en ASCII
 BEGIN \ débute une boucle 
 DUP    ( -- c c )  \ DUP crée une copie de l'élément au sommet. 
 EMIT   ( c c -- c ) \ la copie du dessuss a étée émise vers le terminal.
 1+     ( c -- ) \ c a été incrémenté pour passer au caractère suivant.
 DUP    ( c -- c c ) \ cré une copie de c 
 127    ( c c -- c c 127 ) \ empile 127, Correspond au caractère DELETE en ASCII  
=       ( c c 127 -- c f ) \ compare c et 127 retourne vrai si égaux 
UNTIL   ( c f -- c )  \ termine la boucle si f est vrai sinon retourne au début de la boucle.
DROP    ( c -- ) \ jette l'élément qui reste sur la pile 
;     \ indique la fin de la définition. La compilation s'arrête ici.
ASCII \ invoque le mot que nous venont de définir et le résultat s'affiche.
!"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~ ok
 ```
* Chaque fois qu'un mot se termine sans erreur le message ** ok** apparaît sinon un message d'erreur est affiché et la pile est réinitialisée (vidée de son contenu).

* Le commentaire **( -- )** Après le nom de la définition sert à indiquer la liste des arguments requis par la fonction  à gauche de **--**. La liste de ceux qu'elle retourne est à droite de **--** . Les éléments sont indiqués dans l'ordre 'bas de la pile' à gauche et 'sommet' à droite. Le mot ASCII ne requiert aucun paramètre et ne retourne rien.

* **32 ( -- c )**  Ce commentaire indique qu'il n'y avait rien sur la pile avant d'ajouter le **32**. Le **c** indique qu'il s'agit d'un caractère ou octet. **Stm8 eForth** utilise des piles avec éléments de 16 bits, donc même si cet élément est interprété comme un caractère ASCII il occupe quand même 16 bits sur la pile. Un élément de la pile est appellé une **cellule**. 

## Notre premier mot 

La carte NUCLEO possède une LED indentifiée **LD2** sur la carte. Cette LED est branchée sur le bit **5** du port **C**. Notre premier programme va s'appeller **BLINK** et va faire clignoter cette LED à une vitesse déterminée par le paramètre que nous allons lui passer. Mais avant de définir **BLINK** nous allons définir une constante et un autre mot qui seront utilisés par **BLINK**. 

```
$500A  CONSTANT LD2 \ adresse du registre que nous devons modifier pour contrôler LD2 
```
Notez que le entiers qui débutent par le caractère '$' sont des entiers en hexadécimal. 
```
: LD2-TOGGLE ( -- ) \ Inverse l'état de LD2 
LD2 ( -- a ) \ Empile la constante LD2, i.e. l'adresse $500A
DUP ( a -- a a ) \ Création d'une copie 
C@  ( a a -- a c ) \ Lecture du registre. 'c' est la valeur contenue dans celui-ci.
32 ( a c -- a c 32 ) \ empile l'entier 32 ou 1<<5 
XOR ( a c 32 -- a c ) \ Le bit 5 de 'c' a été inversé 
SWAP ( a c -- c a ) \ inverse la position des 2 éléments au sommet de la pile 
C! ( c a -- ) \ Dépose la valeur 'c' à l'adresse 'a' 
; \ fin  de la définition. 
```
Maintenant si on tape au terminal **LD2-TOGGLE** l'état de **LD2** sur la carte s'inverse. Si elle est éteinte elle s'allume et si elle allumée elle s'éteint. J'ai oublié de mentionner que le bit **5** du port **C** est déjà configuré en mode sortie par le système au démarrage. Si ce n'était pas le cas il aurait fallut le configurer. 

Maintenant on peut définir notre mot **BLINK**. 
```
: BLINK ( n -- ) \ clignote LD2. 'n' détermine le délais en millisecondes.
BEGIN \ On débute une boucle.
LD2-TOGGLE  \ inverse l'état de LD2 
DUP ( n -- n n ) \ Création d'une copie de 'n' 
PAUSE ( n n -- n ) \ l'exécution est suspendu pour 'n' millisecondes 
?KEY ( n -- c t|f ) \ Vérifie s'il y a une touche d'enfoncée 
UNTIL \ s'il n'y en a pas ?KEY retourne seulement 'f' (faux) et le programme boucle 
\ s'il y a une touche ?KEY empile le caractère 'c' et 't' (vrai) alors UNTIL sort de la boucle.
2DROP ( n c -- ) On jette les 2 éléments au sommet de la pile. 
; \ Cette définition est complétée.
167 BLINK \ clignote LD2 3 fois par seconde.
```
Donc pour réaliser ce petit programme on a ajouter 3 mots au dictionnaire du système: 
* la constante **LD2** 
* le mot **LD2-TOGGLE** Pour inverser l'état de la LED LD2 sur la carte.
* **BLINK** le programme lui-même. 

Pour voir tous les mots qui sont dans le dictionnaire ont invoque le mot **WORDS** 

WORDS<br>
 BLINK LD2-TOGGLE LD2 LN2 LOG2 12RT2 SQRT10 E SQRT3 SQRT2 PI IFMOVE UPDAT-PTR FMOVE FADDR RAM2EE RFREE BUF2ROW ROW2BUF EEC, EE, SET-IVEC CHKIVEC RST-IVEC PRISTINE SET-OPT WR-ROW ROW-ERASE EE! EEC! WR-BYTE INC-FPTR LOCK UNLOCK UNLKFL UNLKEE FC@ F@ UPDAT-VP UPDAT-CP UPDAT-RUN UPDAT-LAST EEP-VP EEP-CP EEP-RUN EEP-LAST EEPROM FP! COLD 'BOOT hi WORDS .ID >NAME .S DUMP dm+ _TYPE DOCONST CONSTANT VARIABLE CREATE IMMEDIATE I: : INIT-OFS CALL, ] I; ; OVERT $COMPILE $,n ?UNIQUE ." $" ABORT" AFT REPEAT WHILE AHEAD ELSE THEN IF AGAIN UNTIL BEGIN I NEXT FOR $," LITERAL COMPILE [COMPILE] C, , ALLOT ' QUIT PRESET EVAL ?STACK .OK [ $INTERPRET ABORT" ABORT QUERY ACCEPT KTAP TAP ^H NAME? FIND SAME? NAME> TOKEN WORD \ ( .( PARSE parse ? . U. U.R .R ."| $"| DO$ CR TYPE SPACES SPACE NUF? KEY NUMBER? DIGIT? DECIMAL HEX STR #> SIGN #S # HOLD <# EXTRACT DIGIT PACK0 ERASE FILL CMOVE @EXECUTE TIB PAD HERE COUNT 2@ 2! +! PICK DEPTH >CHAR -1 1 0 BL 2/ RSHIFT LSHIFT 1- 1+ 2* 2- 2+ */ */MOD M* * UM* / MOD /MOD M/MOD UM/MOD WITHIN MIN MAX < U< = ABS - S>D DNEGATE NEGATE NOT + 2DUP 2DROP ROT ?DUP OFFSET RAMLAST LAST CP VP CONTEXT HLD 'EVAL TFLASH TBUF #TIB >IN TMP BASE DOVAR UM+ XOR OR AND 0< OVER SWAP DUP DROP SP! SP@ >R R@ R> RP! RP@ C@ C! @ ! EXIT EXECUTE BRANCH ?BRANCH NEXT DOLIT EMIT ?KEY TO-RAM TO-FLASH REBOOT TIMEOUT? TIMER PAUSE MSEC FREEVAR FORGET AUTORUN SET-ISP DI EI BYE ok


Notez que les mots qu'on a ajoutés apparaîssent au début de la liste dans l'ordre inverse de celui ou on les a définis.

Puisque **LD2-TOGGLE** n'est invoqué qu'une fois à l'intérieur de la définition de **BLINK** on aurait pu insérer sa définition au début de la boucle juste après le **BEGIN** . Mais c'est beaucoup plus lisible comme ça . En Forth il vaut mieux éviter les définitions trop complexes si on veut s'y retrouver. On tend donc à créer de petits mots. De plus de cette façon **LD2** et **LD2-TOGGLE** peuvent-être réutilisés dans d'autres définitions que **BLINK**. 

**Récapitulation** 

* **:** &nbsp;   &lt;chaîne&gt; Sert à passer en mode compilation pour créer une nouvelle défintion qui sera ajoutée au dictionnaire. **&lt;chaîne&gt;** est le nom de ce nouvau mot. 

* **;** &nbsp; Sert a indiquer que la défition est complétée et qu'on doit repasser en mode interprétation.  

* **DUP**  &nbsp; ( i -- i i ) Sert à dupliquer l'élément au sommet de la pile.

* **C@**  &nbsp; ( a -- c ) Empile l'octet qui se trouve à l'adresse donnée en paramètre: *a*. 

* **@**  &nbsp; ( a -- i ) Empile l'entier qui se trouve à l'adresse donnée en paramètre: *a*.

* **C!** &nbsp; ( c a -- ) Dépose l'octet *c* à l'adresse *a*. 

* **!** &nbsp; ( i a -- ) Dépose l'entier *i* à l'adresse *a*. 

* Lorsque l'analyseur lexical rencontre un entier il le dépose au sommet de la pile. 

* **SWAP**  &nbsp; ( n1 n2 - n2 n1 )  Inverse la position des 2 éléments au sommet de la pile. 

* **XOR**   &nbsp; ( n1 n2 -- n3 ) *n3* est le résultat de  l'opération *ou exclusif* entre *n1* et *n2*.

* **DROP**  &nbsp; ( i -- ) Jette l'Élément qui est au sommet de la pile.

* **2DROP**  &nbsp; ( i1 i2 -- ) Jette les 2 éléments qi sont au sommet de la pile.

* **PAUSE**  &nbsp; ( u -- ) Suspend l'exécution pour *u* millisecondes. Sert à créer un délais. 

* **?KEY**  &nbsp; ( -- c t|f ) Vérifie si un caractère venant du terminal est disponible. Si c'est le cas empile ce caractère ainsi que **-1** qui en Forth représente la valeur Booléenne **vrai**. S'il n'y a pas de caractère disponible empile **0** qui en Forth représente la valeur Booléenne **faux**. 

* **KEY**  &nbsp; ( -- c ) Suspend l'exécution jusqu'à réception d'un caractère du terminal. Le caractère reçu est empilé. 

* **EMIT**  &nbsp;  ( c -- ) Émet vers le terminal le caractère au sommet de la pile. 

* **CR**  &nbsp; ( -- ) Envoie le caractère de contrôle *Carriage Return* au terminal. 

* **SPACE**  &nbsp; ( -- ) Envoie le caractère *espace* au terminal. 

* **BEGIN**  &nbsp;  ( -- ) Indique le début d'une boucle. 

* **UNTIL**  &nbsp; ( f -- ) Vérifie la valeur booléenne *f* qui est au sommet de la pile. Si cette valeur est fausse retourne au début de la boucle. Sinon termine la boucle. 

## Produire un son. 

Le STM8S208RB possède un périphérique appellé **BEEP** qui permet de générer une tonalité de façon très simple. Cependant par défaut ce périphéque n'est relié à aucune sortie. Le MCU possède 7 registres d'options. Le registre **2** appellé **AFR** *Alternate Function Register* permettant de modifier le branchement de certains périphériques aux broches. Ainsi la broche **61** est branchée par défaut à **PD4** et **TIM2_CH1**. Les GPIO ne sont pas *remappable* mais **TIM2_CH1** peut-être remplacé par **BEEP**. 

![brochage du stm8s208rb](LQFP64_PINOUT.png)

La fonction alternative de cette broche est **BEEP** qui peut-être activée en mettant à **1** le bit **7** du registre **OPT2**. Les registres d'options sont lus au démarrage du MCU donc lorsqu'une option est modifiée il faut redémarrer le MCU. 

```
1 7 LSHIFT 2 SET-OPT REBOOT \ active le BEEP et redémarre le MCU.
```
Maintenant il ne reste qu'à brancher un haut-parleur haute impédance, 130 ohm ou plus, sur le connecteur **CN9-6** de la carte et à programmer le périphérique. 

![registre du beeper](beeper_reg.png)
```
$50F3 CONSTANT BEEP \ registre de contrôle du beeper. 

: BEEP-ON ( n -- ) \ activation du beeper 'n' { 0..30 }
$20 OR BEEP C! ; \  '$20 OR' est pour mettre à 1 le bit BEEPEN qui active le beeper. 

: BEEP-OFF ( -- ) \ désactivation du beeper. 
$1F BEEP C! ; \ La valeur 31 désactive le beeper.

```
Le Beeper est alimenté par l'oscillateur interne **LSI** de 128 Khz. Avec cette configuration 
cette fréquence est divisée par 8 ce qui donne 16Khz. Le paramètre *n* divise encore cette fréquence. Pour n=0 le diviseur est **2** et pour n=30 le diviseur est **32.** On obient donc 31 fréquences entre 500 hertz et 8 khertz. 

```
\ Alarme double tonalité.
: ALARM
BEGIN 
14 BEEP-ON \ 1Khz ( diviseur = 16 )
150 PAUSE 
10 BEEP-ON  \ 1.33Khz ( diviseur = 12 )
150 PAUSE \ délais de 150 millisecondes
?KEY
UNTIL \ Arrête lorsqu'une touche du terminal est enfoncée.
DROP \ On jette le caractère laissé par ?KEY sur la pile.
BEEP-OFF ; 

```

Générons les 31 fréquences
```
: ALL-FREQ ( -- ) \ Toutes les fréquences en partant de la plus basse. 
30 FOR I BEEP-ON 150 PAUSE NEXT BEEP-OFF ;
```
**Nouveaux mots** 

* **OR** &nbsp; ( n1 n2 -- n3 ) Applique la fonction Booléenne OU entre *n1* et *n2*. Le résultat *n3* remplace les 2 paramètres. 

* **FOR** &nbsp; ( n -- ) Débute une boucle avec compteur. *n* est la valeur initiale du compteur. Le compteur est décrémenté à la fin de chaque boucle. La boucle est exécutée **n+1** fois. Exemple:
```
: TEST FOR I . NEXT ;
4 TEST 4 3 2 1 0 ok
```
* **I** &nbsp; ( -- i ) Empile le compteur de la boucle FOR. 

* **NEXT** &nbsp; ( R: -- a i ) Vérifie si le compteur *i* est à zéro si c'est le cas enlève *a* et *i* de la pile des retours et sort de la boucle. Si le compteur n'est pas à zéro décremente le compteur et branche au début de la boucle dont l'adresse est indiquée par *a*. 
Vous n'avez pas à vous préoccuper des 2 paramètres qui sont sur la pile des retours c'est le fonctionnement interne de la boucle FOR..NEXT qui les dépose là et les retire à la sortie de la boucle. 

* **.** &nbsp; ( .. i ) Imprime sur le terminal la valeur qui se trouve au sommet de la pile.
Cette valeur est retirée de la pile. Ce mot dans le langage Forth est appellé *dot*. 

