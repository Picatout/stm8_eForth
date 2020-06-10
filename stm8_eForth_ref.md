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

### Vocabulaire 


### Manipulation des éléments sur les piles 

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

### Lecture écriture des variables 

**C@** ( a -- c ) Lecture de l'octet à l'adresse **a**.

**@**  ( a -- n ) Lecture de l'entier à l'adresse **a**. 

**2@** ( a -- d ) Lecture d'un entier double à l'adresse **a**.

**C!** ( c a -- ) Sauvegarde de l'octet **c** à l'adresse **a** 

**!** ( n a -- ) Sauvegarde de l'entier **n** à l'adresse **a** 

**2!** ( d a -- ) Sauvegarde d'un entier double à l'adresse **a** 

**VARIABLE** &lt;string&gt; Création de la variable **&lt;string&gt;** et initialisaton de sa valeur à **0**. 

### Opérations arithmétiques et logiques 

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

### Branchement et boucles 

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

**AFT** ( -- )  Utilisé à l'intérieur d'une boucle FOR..AFT..THEN..NEXT pour indiquer l'endroit où doit brancher le NEXT. Dans de type de boucle Les instructions avant le **AFT** ne sont exécutées qu'une seule fois à la première itération puis il y a un saut après le **THEN**. Aux itérations suivantes le bouclage se fait après le **AFT**. 

