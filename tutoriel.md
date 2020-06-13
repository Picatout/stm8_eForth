<!-- 
 Tutoriel réalisé par Jacques Deschênes alias PICatout 
 Copyright 2020
 licence: cc sa-by 4.0  
    ref: https://creativecommons.org/licenses/by-sa/4.0/
-->

# Tutoriel stm8 eForth version 3.0 

### Prérequis:

Une carte Carte **NUCLEO-8S208RB** avec stm8 eForth installé.<br/> ![Carte NUCLEO-8S208RB](carte.png)

Pour une prsentation du langage Forth référez-vous à l'article wikipedia ![langage Forth](https://fr.wikipedia.org/wiki/Forth_(langage))

## Comparaison de Forth avec le langage C 

Forth se présente comme un langage de bas niveau bien qu'il soit extensible à n'importe quel niveau. Il permet de programmer des microcontrôleur au plus bas niveau met a aussi été utilisé dans des systèmes complexes. 

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

Ces 2 programmes font exactement la même chose. Ils addionnent les entiers *a* et *b* et imprime le résultat. 

En **C** on doit indiquer le types des arguments et du résultat. En **Forth** comme en programmation en **assembleur** le type de données n'est pas spécifié. C'est au programmeur de s'assurer qu'il passe les bonnes données à la fonction.  

### éléments syntaxiques 

* Le langage Forth est des plus simple en terme de syntaxe. Les éléments de la syntaxe appelés  **mots** qui composent une phrase sont séparés par un espace. C'est le seul élément séparateur. Mais il est essentiel de ne pas l'oublier sinon le résultat ne sera pas celui escompté. 

* En Forth les procédures, constantes et variables s'appellent des **mots** et ces mots sont conservés dans un dictionnaire. Ce dictionnaire donne accès à la définition de chaque mot en terme de code à exécuter. En **C** on appelerait ça le corps de la fonction.

* n'importe quelle suite de caractères qui a une représentation graphique peut-être utilisé comme nom pour définir un nouveau mot. **Stm8 eForth** utilise les caractères ASCII. Donc tous caractères dont le code ASCII est dans l'intervalle {33..126} peut-être utilisé dans le nom d'un mot. Ça inclus les chiffre. **Stm8 eForth est sensible à la casse.

```
: ASCII ( imprime la liste des caracteres ASCII) 
CR 32 BEGIN DUP EMIT 1+ DUP 127 = UNTIL DROP ; ok
ASCII
 !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~ ok

``` 
N'importe quel de ces caractères à l'exception du premier qui est l'espace (i.e. **32**) peut-être utilisé dans le nom d'une variable, constante ou fonction. 

### Commentaires 

  Il y a 2 types de commentaires en **Forth** 

  * Les commentaires délimités qui sont indiqués par le mot **(** et se  termine par le premier **)** rencontré. 

  * Les commentaires qui se termine en fin de ligne et qui sont indiqués par le mot **\**

  Notez que j'ai utilisé le qualificatif **mot** pour parler de ces 2 éléments de la syntaxe **Forth**. La syntaxe de **Forth** est très simple le seul séparateur des éléments lexical est l'espace. Et puisque **(** et __\\__ sont des mots ils doivent-être séparés du commentaire qui suit par un espace. **)** n'est pas un mot mais un caractère terminateur qui indique la fin du commentaire. Il n'est donc pas nécessaire de mettre un espace entre le dernier caractère du commenataire et la parenthèse de droite.  Ceci **( commentaire délimité)**  est correct en **Forth**.   

### Gestion de la pile des arguments (paramètres).

 Il peut-être difficile de conserver en mémoire la liste et l'ordre des paramètres qui sont sur la pile lorsqu'on écris une nouvelle définition. On peut se rendre la tâche plus facile en utlisant les commentaire délimités comme aide mémoire. Comme exemple je vais reprendre la définition de ASCII montré plus haut. 
 ```
 : ASCII ( -- ) \ imprime la liste des carcteres ASCII
 CR \ envoie un caractère de contrôle de retour à la ligne au terminal 
 32 ( -- c )  \ l'entier 32 a été empilé. Correspond à l'espace en ASCII
 BEGIN \ débute une boucle 
 DUP    ( -- c c )  \ une copie du caractère a été créée.
 EMIT   ( c c -- c ) \ la copie du dessuss a été imprimée
 1+     ( c -- ) \ c a été incrémenté 
 DUP    ( c -- c c ) \ cré une copie de c 
 127    ( c c -- c c 127 ) \ empile 127, Correspond au caractère DELETE en ASCII  
=       ( c c 127 -- c f ) \ compare c et 127 retourne vrai si égaux 
UNTIL   ( c f -- c )  \ termine la boucle si f==vrai sinon retourne au début de la boucle.
DROP    ( c -- ) \ jette l'élément qui reste sur la pile 
;     \ indique la fin de la définition. La compilation s'arrête ici 
ASCII \ invoque le mot que nous venont de définir et le résultat s'affiche.
!"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~ ok
 ```
* Chaque fois qu'un mot se termine sans erreur le message ** ok** apparaît sinon un message d'erreur est affiché et la pile est réinitialisée (vidée de son contenu).

* Le commentaire **( -- )** Après le nom de la définition sert à indiquer la liste des arguments requis par la fonction  à gauche de ** -- ** et la liste de ceux qu'elle retourne  à droite de ** -- ** . Les éléments sont indiqués dans l'ordre bas de la pile à gauche et sommet à droite. 

* **32 ( -- c )**  Ce commentaire indique qu'il n'y avait rien sur la pile avant d'ajouter le **32**. Le **c** indique qu'il s'agit d'un caractère ou octet. **Stm8 eForth** utilise des piles ave éléments de 16 bits, donc même si cet élément est interprété comme un caractère ASCII il occupe quand même 16 bits sur la pile. Un élément de la pile est appellé une **cellule**. 

