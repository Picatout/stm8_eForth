### 2022-12-16

* Mise à jour [référence_eforth.md](référence_eforth.md).

* Après consultation du [standard Forth](https://forth-standard.org/standard/float/FtoS)  les mots __F>S__  tronque la fraction sans arrondie. Modification faite dans [float24.asm](float24.asm).

* commit 12:10 hre 

* Travail sur [référence_eforth.md](référence_eforth.md).

* Débogué et modifié __F.__. 

* Retravaillé  [float24-test.f](float24-test.f).

### 2022-12-15

* commit 22:15 

* bogue: Corrigé. 
```
-32767. 2dup f- f. -3.2767E-32765 
```

* bogue: le zéro ne devrait pas être là. Bogue corrigé.
```
2e23 F>S .S
 0 -32768 <sp  ok
```

* bogue, seulement après un démarrage.  Problème corrigé. 
```
stm8eForth version 4.00
float24 library,  version 1.00
LICENSE GPL V3
Copyright Jacques Deschenes, 2021, 2022
 on NUCLEO-8S207K8
32767. .S F.
 32767 0 <sp  3.27670E4 ok
�
stm8eForth version 4.00
float24 library,  version 1.00
LICENSE GPL V3
Copyright Jacques Deschenes, 2021, 2022
 on NUCLEO-8S207K8
232767. f. 2.32771.00E5 ok

```

* commit 12:02 hre 

* Supprimer __E.__ et modifié __F.__ pour imprimer les débordements comme __-INF__ ou __+INF__.

* Modifié routine _SET_FPSW_, maintenant modifié le float en cas de débordement pour __-INF__ ou __+INF__.

* Modifié __F/__ afin d'avorter lorsqu'une division par 0 est tentée.
```
performance test
 104 msec 3.1416 2.51 f*, 1000 times.
 105 msec 32.767 327.67 f*, 1000 times.
 94 msec 3.1416 2.51 f/, 1000 times.
 73 msec 3.1416 414.2 f+, 1000 times.
 79 msec 3.1416 51.43 f-, 1000 times.
```

* Retour sur [float24.asm](float24.asm), enccore une idée pour améliorer la performance de __F*__.
```
performance test
 106 msec 3.1416 2.51 f*, 1000 times.
 105 msec 32.767 327.67 f*, 1000 times.
 93 msec 3.1416 2.51 f/, 1000 times.
 75 msec 3.1416 414.2 f+, 1000 times.
 80 msec 3.1416 51.43 f-, 1000 times.
```

* bogue dans __NUMBER?__ du fichier [stm8ef.asm](stm8ef.asm)
```
-9 -9?
-8 -8?
-7 -7?
-6 -6?
-5 -5?
-4 -4?
-3 -3?
-2 -2?
-1 ok
-10 ok
-11 ok
```
Bogue corrigé le problème était dans la routine __NSIGN__. La vérification pour cnt==0 au début référençait la mauvaise cellule sur la pile.

### 2022-12-14

* débuté travail sur [float.asm](float.asm)

* commit 20:53

* Retravaillé __F*__ pour améliorer la performance. Gain de 7 msec sur la version précédente.
```
performance test
 108 msec 3.1416 2.51 f*, 1000 times.
 108 msec 32.767 327.67 f*, 1000 times.
 94 msec 3.1416 2.51 f/, 1000 times.
 74 msec 3.1416 414.2 f+, 1000 times.
 80 msec 3.1416 51.43 f-, 1000 times.
```

* Écriture de la section __float__ du fichier [référence_eforth.md](référence_eforth.md). 

* bogue dans __FLOAT?__ exposant incorrect. Corrigée, était causé par __NUMBER?__ accumulant les digits au delà de 32767, résultant en un entier négatif passé à __FLOAT?__. Cependant la correction est faite au début de __FLOAT?__ car il est accepté que NUMBER? déborde dans le négatif. 
```
32768. e. 3.277E3 ok
32768. .s
 3277 0 <sp  ok

32768e0 .s
 3277 0 <sp  ok
f. 3277. ok

```

* commit 14:44 hre 

* Encore amélioré la performance de __F/__.
```
performance test
 115 msec 3.1416 2.51 f*, 1000 times.
 115 msec 32.767 327.67 f*, 1000 times.
 93 msec 3.1416 2.51 f/, 1000 times.
 74 msec 3.1416 414.2 f+, 1000 times.
 80 msec 3.1416 51.43 f-, 1000 times.
 ok
```
* commit 11:33 hre 

* Modification à __F/__ pour améliorer la performance.
```
performance test
 114 msec 3.1416 2.51 f*, 1000 times.
 114 msec 32.767 327.67 f*, 1000 times.
 205 msec 3.1416 2.51 f/, 1000 times.
 74 msec 3.1416 414.2 f+, 1000 times.
 80 msec 3.1416 51.43 f-, 1000 times.
 ok
```

### 2022-12-13

* commit 20:55 hre  correction de plusieurs bogues dans [float24.asm](float24.asm).
```
performance test
 114 msec 3.1416 2.51 f*, 1000 times.
 115 msec 32.767 327.67 f*, 1000 times.
 321 msec 3.1416 2.51 f/, 1000 times.
 74 msec 3.1416 414.2 f+, 1000 times.
 80 msec 3.1416 51.43 f-, 1000 times.
 ok
```

* Corrigé bogue dans __S&gt;F__ et __F&gt;S__ 

* commit 16:07 hre 

* Corrigé routine __LOG10__ et __F*__ test float24-test.f passé avec succès. Améliorationde la vitesse d'exécution de __F*__.
```
performance test
 114 msec 3.1416 2.51 f*, 1000 times.
 115 msec 32.767 327.67 f*, 1000 times.
 180 msec 3.1416 2.51 f/, 1000 times.
 74 msec 3.1416 414.2 f+, 1000 times.
 80 msec 3.1416 51.43 f-, 1000 times.
```

### 2022-12-12 

* commit 22:03 hre 

* Retravaillé __SCALETOM__ dans [float24.asm](float24.asm). Encore place à l'amélioration.

* Modifier et déboguer __F!__ et __F@__ dans [float24.asm](float24.asm).

* Renommé   __F@__ __FAR@__ et __FC@__ __FARC@__ dans [flash.asm](flash.asm) 

* commit 16:49 hre 

* Réécriture de _FLOAT?__ dans [float24.asm](float24.asm).

### 2022-12-11

* commit 22:26 hre.

* Modification à __F*__ pour améliorer la performance. 

* À faire: Améliorer performance de __F*__ et __F/__. 

* commit 21:43

* bogue précédent corrigé. 

* bogue dans FLOAT? de [float24.asm](float24.asm):
```
3276722. .s
 130 32767 2 <sp  ok

```

* Modifié *onHandledInterrupt* dans le fichier [stm8ef.asm](stm8ef.asm). Maintenant ne fait qu'un __IRET__ au lieu de réinitialiser le MCU.

* Ajouter un gestionnaire d'interruption sur réception UART. Ajout de 2 variables système. 
    * RX_CHAR    où est déposé le caractère reçu.
    * CHAR_RDY   Indicateur booléen pour indiquer qu'un caractère est en attente.
    * CTRL+X   Réinitialise le MCU 

* Retravaillé __F*__, __F/__ et __F&gt;S__.

* Déboguer [float24.asm](float24.asm).

### 2022-12-10

* commit 22:02

* bogues:
```
9e6 9e0 f+ f. 9000000. ok
9e5 9e0 f+ f. 900000. ok
9e4 9. f+ f. 90000. ok  ??? devrait-être 90001. 
9e3 9. f+ f. 9009. ok
9e4 90. f+ f. 90090. ok
9e4 9. f+ f. 90000. ok
9e4 9. f- f. -90000. ok  ????
```

* Ajouter et déboguer routine *max_mantissa* dans [float24-test.f](float24-test.f).  __FLOAT?__ appel cette routine pour maximisé la valeur de la mantisse.

* commit 16:50 

* [float24-test.f](float24-test.f)  passé avec succès.

* Débogage de __NUMBER?__ et __FLOAT?__.

### 2022-12-09

* Travail sur __NUMBER?__   du fichier [stm8ef.asm](stm8ef.asm). Après réflexion j'ai décidé de modifier la stratégie de conversion de chaîne en entier simple, Sîtôt qu'il y a débordement, **parse_digits** met le bit __OVF__ la variable __UFPSW__ à __1__ et cesse d'accmuler les digits. Mais __NUMBER?__ va continuer à compter les digits. Si [float24.asm](float24.asm) est installé le cumul et le nombre de digits sont transmis à __FLOAT?__.

### 2022-12-08

* Travail sur [float24.asm](float.asm),  bogues à corriger.

* commit 16:00 hre 

* Mise à jour des readme.md 

* Travail sur [float24.asm](float24.asm)

* commit 11:50 hre 

* test [float-test.f](float-test.f)  passé avec succès.

* Déboguer [double.asm](double.asm) et [float.asm](float.asm). 

### 2022-12-07

* Bogue dans __CHECK_BASE_SIGN__ 

* Travail sur __FLOAT?__ du fichier [float.asm](float.asm)

* commit 

* Corrigé bogue dans __NUMBER?__ du fichier [double.asm](double.asm).

* Réécriture de __NUMBER?__ dans [stm8ef.asm](stm8ef.asm) et [double.asm](double.asm).

* Création des sous-routines **CHECK_BASE_SIGN**, **ACCEPT_CHAR** et **NEXT_CHAR** dans [stm8ef.asm](stm8ef.asm).

* Réécriture de __NUMBER?__ dans fichier [double.asm](double.asm).

* Ajout de sous-routine __UDU8*__ dans [double.asm](double.asm) plus rapide que __UDS*__. Cette routine est 2 fois plus rapide. Cette routine est appellée par __NUMBER?__ au lieu de __UDS*__. 
```
: t1 msec 1000 for 232.32 10 udu8* 2drop next msec swap - . ;  ok
t1 11 ok
t1 11 ok
t1 11 ok
t1 11 ok
t1 11 ok
: t2 msec 1000 for 232.32 10 uds* 2drop next msec swap - . ; ok
t2 24 ok
t2 24 ok
t2 24 ok
t2 24 ok
t2 24 ok
```

### 2022-12-05

* Nouvelle perspective: NUMBER? devrait analyser tous les nombres comme des entiers doubles mais ne conserver les bits 32..16 que s'il y a un point dans la chaîne. S'il y a une librairie __float__ d'installée et que la chaîne n'est pas terminée au dernier digit rencontré appeller FLOAT? pour compléter l'analyse. 

* Réécriture de __FLOAT?__ dans [float24.asm](float24.asm). 

* bogues:
    1. écrire en mémoire flash|eeprom gèle.
    1. problème avec ABORT lorsque mot pas trouvé, seulement si le mot n'est pas le premier sur la ligne. Ne se produit que si la librairie [float24.asm](float24.asm) est incluse.
    ```
    d. D.?
    eeprom d. �I���?

    ```

* commit 13:42

* Modification motS HI, PRINT_VERSION, COPYRIGHT, FVER.

### 2022-12-04

* Corrigé bogue dans **COLD** réglant l'issue #1 

* Travail sur [float.asm](float.asm) et [float24.asm](float24.asm)

### 2022-12-03

* Gestion de la variable **FPSW** dans [float.asm](float.asm) et [float24.asm](float24.asm) à retraivaller. 

* commit tag V4.0R1D2

* Mise à jour de [référence_eforth.pdf](docs/r%C3%A9f%C3%A9rence_eforth.pdf)

* Ajout du flag **COMPO** aux mots __$"__ et __."__ . 

commit et tag. 

* Création du [readme_en.md](readme_en.md)

* commit 

* Création des documents [docs/référence_eforth.pdf](docs/r%C3%A9f%C3%A9rence_eforth.pdf) et [tutoriel.pdf](docs/tutoriel.pdf)

* Réécriture du [readme.md](readme.md).

* Compilation de toutes les cibles.

* Modifié fihciers [inc/config.inc](inc/config.inc) et [inc/stm8s_disco.inc](inc/stm8s_disco.inc).

* Modifié  fichier [.gitignore](.gitignore)


### 2022-12-02

* Construit le projet pour la carte **NUCLEO_8S207K8** avec succès et flasher la carte.

* Modifié configuration pour ajouter carte NUCLEO-8S207K8.
    * Ajout du fichier [inc/stm8s207.inc](inc/stm8s207.inc)
    * Ajout du fichier [inc/nucleo_8s207.inc](inc/nucleo_8s207.inc)
    * Modifié fichier [inc/config.inc](inc/config.inc)
    * Ajout du fichier [nucleo_8s207.mk](nucleo_8s207.mk)


#### 2022-11-03

* Ajout du mot **COMIPE-ONLY**.

* Application de l'indicateur **COMPO** à tous les mots contrôle de flux, i.e. IF,THEN,ELSE,WHILE,UNTIL, etc.

#### 2021-08-05

* Travail sur [float24.asm](float24.asm). 

* Réorganaisation du code, transfert de la routine *parse_digits* dans stm8ef.asm pour réduire le dédboublement de code. 

* Changement à **FLOAT?**.  Un saisie de float dont la mantisse est trop grande ne génère plus un **ABAORT"** mais float fait simplement appel à **SCALE>M** pour réajuster la mantisse dans les limites. 
  Un exposant hors limite ne génère plus un **ABORT"** mais l'erreur est signalée dans FPSW par *l'overflow flag*. 

#### 2021-08-02

*  Corrigé bogue dans **SET-FPSW** du fichier [float24.asm](float24.asm).

#### 2021-07-31

* Travail sur [float24-test.f](float24-test.f).

* Travail sur **F/** dans [float24.asm](float24.asm)  
```
3.1416 5.13 f/ f. 0.6123 ok
```
L'arrondi à la décimale la plus proche devrait donné  **0.6124**.  Ajout de l'arrondie vers la décimale la plus proche pour corriger cette erreur.  

* Corrigé bogue dans **dof24lit** runtime subroutine.     

* Corrigé bogue dans **F.** point décimal manquant lorsque exposant positif. 

#### 2021-07-28 

* Travail sur les comparateurs dans [float24.asm](float24.asm)

#### 2021-07-27 

*  Ajout de **MPLUS** dans [float24.asm](float24.asm). Compensation des débordements de mantisse lors de l'addition. 

#### 2021-07-26

* Travail sur [float24.asm](float24.asm).

* Modification à **E.** dans [float.asm](float.asm) pour supprimer l'espace entre le E et l'exposant.

* Ajout de **SET-FPSW**. 

#### 2021-07-25

* Recodé **NUMBER?** dans fichier [stm8ef.asm](stm8ef.asm).

* Corrigé bogue dans **$COMPILE** fichier [stm8ef.asm](stm8ef.asm).

* Corrigé bogue dans **2LITERAL** fichier [double.asm](double.asm).

* Débute travrail sur une nouvelle lilbrarie [float24.asm](float24.asm). Celle-ci de dépendera pas de [double.asm](double.asm). Le système sera donc plus compacte et les calculs sur en virgules flotttantes plus rapide. L'écart dynamique sera le même que pour les float32 mais avec une perte de précision sur la mantisse.  qui sera de 4.5 i.e log(32767) décimales au lieu de 6.9, i.e. log(8388608). 

* double.asm et float.asm passe les tests [double-test.f](double-test.f) et [float-test.f](float-test.f). 

#### 2021-07-17

* Optimisation de **F/** par factorisation d'un **UMUL10** spécialisé. 

#### 2021-07-13

* Corrigé bogue et travail d'optimisation de **F/**. 

* ajout de performance à [float-test.f](float-test.f)

#### 2021-07-12

* Corrigé bogue dans **/MOD** et **D/MOD** qui ne donnait pas la bonne réponse lorsque le reste était nul.

* Optimisation supplémentaire de **UD/MOD**. 

* Corrigé bogue dans *parse_digits*, fichier [double.asm](double.asm). 

* Optimisation de **UD/MOD**. 

#### 2021-07-11

* Optimisation du code __D*__ et **D/MOD**. 
* Débogué  **D/MOD**. 

* Optimisation dans [stm8ef.asm](stm8ef.asm). 

    * La compilation des **CALL BRAN address ** a été remplacée par la compilation d'un **JP address**, gain de 8 cycles machines.  

#### 2021-07-10

* Revenue au code original du 2021-02-22 pour **UM/MOD**. Puis modifié pour utilisé **USLMOD** lorsque udh==0. 

* Recodé  **+!**, **CMOVE**, **FILL**. 

*  Optimization au niveau du compilateur dans le mot **CALL,** , une vérification est faite pour l'adresse cible du CALL si l'adresse cible est **DROP** ou **2DROP** au lieu de compiler **CALL DROP** ou **CALL 2DROP** l'instruction **ADDW X,#2** ou **ADDW X,#4** est compilée. Cette optimization sauve 8 cycles machines sur 10 par appel. Ces 2 mots étants utilisés souvent cette optimisation est significative et ne requière pas plus d'octets mémoire qu'un **CALL**.

#### 2021-07-09

* Travail d'optimisation dans [stm8ef.asm](stm8ef.asm).

* Remplacer CALL DROP par la macro _DROP et CALL DDROP  par la macro _DDROP. Sauve 8 cycles par appel. 

* Ajout de l'entête dictionnaire à **FALSE**  et recodage. 

* Recodé **S&gt;D**. 

* Recodé **-**.

* Recodé **=**, **U&lt;** ,**&lt;**, **U&gt;**, **&gt;**, **MAX**, **MIN** 

* Ajout de **U/MOD** dans [stm8ef.asm](stm8ef.asm) et recodé **UM/MOD**, **/MOD**. 


#### 2021-07-08

* Travail d'optimisation dans [double.asm](double.asm).
    * Recodé routine interne **nsign**. 
    * Recodé **DABS**. 
    * Recodé **D0=**. 
    
* Ajout de **DBL-VER** dans [double.asm](double.asm).

* Ajout de **FLOAT-VER** dans [float.asm](float.asm).

* Travail sur **F-ALIGN**.   

* Corrigé bogue dans **UD/MOD** 

* Corrigé bogue dans **F/** 

* Corrigé bogue dans **F+**

#### 2021-07-07

* Travail sur F-ALIGN.   

* Ajout des constante booléennes **TRUE** et **FALSE** dans [stm8ef.asm](stm8ef.asm).

* Modifié  __DS*__ pour factoriser __UDS*__. 

*  Retravaillé **F-ALIGN** pour réduire le risque de débordement en répartissant l'alignement entre les 2 mantisses. La mantisse dont l'exposant est le plus grand est d'abord augmentée jusqu'à ce que l'écart des exposants soit comblé ou que le maximum supporté par un entier double positif soit atteint avant qu'une autre multiplication par 10 produise un débordement. Cette valeur en hexadécmal est **0xCCCCCCCD**.  Si ce n'est pas suffisant pour combler l'écart entre les 2 exposants. La plus petite mantissse est divisée par 10 jusqu'à ce que l'écart soit comblé ou que la mantisse atteigne zéro. L'algorithme est donc le suivant:

#### 2021-07-06 

* Travail sur [float-test.f](float-test.f) 

* Ajour du mot **FNEGATE** et **FABS** dans [float.asm](float.asm)

* Modifié **FZE**, **FNE** et **FOV** pour qu'ils retourne **0||-1**.

* Corrigé **SFZ** et **SFN**, **ME&gt;F**.

* Corrigé bogue dans **E.**. 

* Corrigé bogue dans **F+** et **F-**. 

#### 2021-07-05 

* Travail sur [double-test.f](double-test.f)

* Corrigé bogue dans **D>**. 

* Suppression du mot **DCMP** 

#### 2021-07-04

* Déboguer **F0=**. 

* Remplacé les LITERAL 0|1  par des CALL ZERO|ONE . 

* Modifié  **F/** dans [float.asm](float.asm) pour tiré avantage des mots **NR@** et **NR!**. 

* Déboguer **F/**. 

* Factorité **DD/MOD** pour extraire **UD/MOD**. 

* Ajout de **D/**. 

#### 2021-07-03

* Ajout de **F&gt;**, **F&lt;**, **F=**, **F0=** , **F0&lt;** 

* Modifié format des floats. 

* Modifié  **SFN**, **SFZ** , **SFV** , **F&gt;ME**, **ME&gt;F**. 

* Renommé  **2&lt;ROT** **&lt;2ROT** dans [double.asm](double.asm).

* Supprimé **2NEGATE** du fichier [double.asm](double.asm) était en doublon avec **DNEGATE**  du fichier [stm8ef.asm](stm8ef.asm). 

* Ajout des mots suivant pour l'accès aux variables locales sur rstack.

    * **LOCAL**  pour réservé de l'espace pour les variables locales. 
    
    * **NRDROP** Pour libérer de l'espace occupé par les variables locales sur rstack. 

    * **NR!**  pour déposer une valeur dans une variable locale. 

    * **NR@**  pour lire la valeur d'une variable locale. 


* Enlevé du dictionnaire les mots **$,n**, **$,"** 

#### 2021-07-02

* Continué travail de réédition de stm8ef.asm. (complété).

* Ajout du mot **J** 

#### 2021-07-01

* Modifié code de **!**. 

* Modifié code de **R&gt;**.

* Modifié code de **SWAP**. 

* Modifié code de **2!**.

* Modifié code de **2@**. 

* Enlevé **DO$**. **$"|**, **."|** du dictionnaire, utilisé seulement par le compilateur.

* Éditer le fichier [stm8_ef.asm](stm8_ef.asm) pour utiliser la macro _HEADER en remplacement des champs détaillés. 

* Renommé **@EXPONENT** en **F&gt;ME**.

* Renommé **!EXPONENT** en **ME&gt;F**. 

* révision et test.


#### 2021-06-30

* Travail sur __F/__. 

* Travail sur __F*__. 

#### 2021-06-29

* Travail sur __F*__. 

#### 2021-06-28

* Ajout de **SCALE>**, **D>F**, **F>D**.

* Test et débogage. 

#### 2021-06-27

* Modifié [Makefile](Makefile).

#### 2021-06-24

* Ajout de **D/**.

* Travail sur [double.asm](double.asm).  

* Ajout de  **2R@**,**2LITERAL**,**2VARIABLE**, 

* Renommé **DCONST** au standard Forth 2012 -&gt; **2CONSTANT**.

* Supprimé du dictionnaire les runtime **DOLIT**, **DOCONST** et **DO-DCONST**. 

* Changer le caractère identifiant les litéraux double de '!' à '#'.

#### 2021-06-23

* Ajout de vocabulaire à [double.asm](double.asm). **D&gt;**, **D&lt**, **D0=**, **D0&lt;**, **2&gt;R**, **2R&gt;**, **2SWAP**, **2ROT**.


#### 2021-06-22

* Création du fichier [double.asm](double.asm) pour séparer le vocabulaire de traitement des entiers doubles (32 bits) du vocabulaire de traitement des nombres à virgules flottantes.
Ajouter option **WANT_DOUBLE** dans [config.inc](inc/config.inc).

* Continuer travail sur le vocabulaire des entiers doubles. 

* Ajout de **H.** pour afficher un entier en hexadécimal dans [stm8ef.asm](stm8ef.asm). 

* Déplacé **&lt;ROT** de float.asm vers stm8eforth.asm 


#### 2021-06-20

* Travail sur [float.asm](float.asm)

Ajout de **&lt;ROT**, **DABS**, **DSIGN**, **D#S**, **F.**, **E.**, **2SWAP**, **LSCALE**, **RSCALE**, __DD*__,  __F*__
 
#### 2021-06-19

* Ajout du mot **&gt;** dans [stm8ef.asm](stm8ef.asm).

* Rendre le vocabulaire insensible à la casse. Ajouté  option **CASE_SENSE** dans [config.inc](inc/config.inc).

* Librairie [float.asm](float.asm) créée. Ajout de l'option **WANT_FLOAT** dans [config.inc](inc/config.inc).

* Modification du fichier [Makefile](Makefile) pour construite le projet et flash il faut maintenant faire la commande 
```    
picatout:~/github/stm8_eforth$ make -fnucleo.mk
```

#### 2021-06-15

* Début du travail pour ajouter une librairie en virgule flottante de 32 bits. 

#### 2021-02-07

* Corrigé bogue autre bogue dans **UM/MOD** . Le test de débordement de la division acceptait un dividende dont la partie haute était égale au diviseur. hors une telle situation conduit à la perte du bit le plus significatif du quotient. Par exempel  0x20000 2 UM/MOD donnait 0 0 au lieu de 0 0x10000.

#### 2021-02-06
* Modification au [readme](readme.md)

* Modification aux makefile. *clear_eevars*  n'était pas appliqué avant de flasher une nouvelle version . **.PHONY: clear_eevars** ajouté. Ajouté aussi la règle *erase*  et **FLASH_SIZE** dans tous les fichiers __*.mk__. 

* Testé (umod.txt)(https://github.com/TG9541/stm8ef/files/5926192/umMod.txt) correction pour **UM/MOD** mais ce n'est pas OK. 
test **HEX 2400 F4 A2C3 UM/MOD .S** un rest erronné, rapporte **2243** alors que ça devrait-être **A243**. 
```
stm8eForth v3.0 on NUCLEO-8S208RB
HEX 2400 F4 A2C3 UM/MOD .S PRESET
 2243 17F <sp  ok
```
Le bogue est maintenant corrigé. J'ai remplacé l'instruction **SRAW X** par l'instruction **RRCW X** à la suite de l'étiquette **MSMMb** de la patch fournie par **TG9541** ci-haut.

#### 2020-09-22

* Modification à [config.inc](inc/config.inc) et à [stm8ef.asm](stm8ef.asm).

#### 2020-09-20

* Ajout du sous module  SendFile

* Modifié **referencde.md** pour ajouter documention pour **FC-XON** et **FC-XOFF**

#### 2020-09-17

* Ajout des mots **FC-XON** et **FC-XOFF**. Envoie les caractères XON/XOFF au terminal pour le contrôle de flux logiciel. Pendant la programmation de la mémoire FLASH|EEPROM le MCU est stoppé donc si le terminal envoie des caractères à ce moment ils seront perdus. Donc Un signal XOFF est envoyé au terminal avant le début de l'opération d'écriture et un caractère XON est envoyé lorsque l'opération est terminée.

* Ajout d'une file de réception pour les carctères reçu du terminal. Il s'agit d'une file circulaire de 8 caractères. Donc si le terminal transmet plus de 8 caractères consécutifs avant que le MCU lise ces acractères il y a perte de caractères en réception. En conjonction avec FC-XON et FC-XOFF cette file réduit les risque de perte de données en réception lors de la transmission d'un fichier source Forth au MCU.

#### 2020-06-29

* Révision tutoriel.md 

#### 2020-06-28

* Réorganiser le système make pour tenir compte des 2 plateformes. Dans le fichier **config.inc** il ajouter les variables **NUCLEO** et **DISCOVERY** en fonction de la cible choisie.

#### 2020-06-27

* Réorganisation du [manuel de référence](reference.md) en sections séparées pour chaque module et création d'un index de sections. 

* Travail sur le module **ctable.asm** complété.

* Ajout de **CALLOT** dans le module **ctable.asm**. pour réserver de l'espace dans l'espace code pour une table de constantes.

#### 2020-06-26

* j'ai changé d'idée, maintenir 2 versions séparée de stm8_eForth l'une pour la carte NUCLEO et l'autre pour la discovery complique les choses. à l'exception du UART choisi pour la communication avec le terminal et la quantité de mémoire disponible on peut utiliser le même système. L'idée de séparer les 2 versions étaient de réduire la taille de la version DISCOVERY. Mais le gain n'est pas considérable. Le fichier **config.inc** var permettre de sélectionner les options et la cible désirée.   

* Ajout de **WR-WORD** dans **flash.asm** 

* Ajout de **CTINIT**, **WTINIT** dans **ctable.asm**.

* Ajout de **[N]?** Comme outil d'initialisation d'une table de contantes. Utilisé par **CTINIT** et **WTINIT**. 

#### 2020-06-25 

**Session 2**

* Ajout de **DCONST** et sa partie runtime **DO_DCONST** pour créer des constantes en *entier double*.

* Ajout de **PTR+** ( u -- )  dans **flash.asm** pour incrémenter **FPTR** d'une valeur arbitraire *u*. 

* Ajout de **EE-READ** et **EE-CREAD**. Pour la lecture du mot et d'un octet pointé par FPTR avec incrémentation du pointer.

* Débuter travail sur module **ctable.asm** pour faciliter la création de tables de constantes dans la mémoire FLASH ou EEPROM. 

**Session 1**

* Modification du mot **hi** qui maintenant identifie la carte sur laquelle est installé le système. 
```
hi
stm8eForth v3.0 for NUCLEO-8S208RB
 ok
\ après connection du terminal à l'autre carte. 
hi
stm8eForth v3.0 for STM8S-DISCOVERY
 ok

```

* Élimination du mot **EXIT** devenu inutile. Suite à la modification du compilateur qui cmpile directement une instruction machine **RET**. 

* Mise à jour du [manuel de référence](reference.md)

* Réécriture de **ROW>BUF** dans **flash_disco.asm**.

* Renommé les mots suivants dans les 2 versions pour être plus conforme au style de nomenclature Forth.  

    * **RAM2EE** renommé **RAM>EE**

    * **ROW2BUF** renommé **ROW>BUF**

    * **BUF2ROW** renommé **BUF>ROW** 

#### 2020-06-24 

* Version *Discovery* Suprimer les mots **FADR**, **F@** et **FC@** qui ne sont plus nécessaire car le stm8s105c6 n'a pas de mémoire étendue 

* Version *Discovery* Modifier tous les mots qui utilisait des adresses double pour utilisation d'adresses simple. 

#### 2020-06-23

* Création du dossier **discovery**  et copie des fichiers stm8ef.asm flash.asm math_const.asm dans le nouveau dossier.<br/>**Objet:** Débuter adaptation de stm8ef pour la carte discovery. Étant donnée que la version 3.0 est très étendue par rapport à la version discovery 2.1 originale. Une réadaptation en sens inverse de NUCLEO vers DISOVERY est pertinante.

* Renommé le fichier **stm8ef.asm** **stm8ef-disco.asm** pour éviter toute confusion entre les 2 versions.  

#### 2020-06-20

* Travail sur ![reference.md](reference.md)

#### 2020-06-19 

**Session 2**
* Travail sur ![reference.md](reference.md)

* Élimination du mot **EXIT**. **;** compile le code machine **RET** au lieu de compiler un **CALL EXIT**.  Plus compacte et plus rapide. 

**Session 1**

* Travail sur ![reference.md](reference.md)

#### 2020-06-17

**Session 2**

* Nettoyage du fichier stm8ef.asm pour supprimer les directives **.if PICATOUT_MOD**. 


**Session 1**

* Ajout de **SEED** ( u1 -- ) Pour initialiser le générateur pseudo aléatoire. 

* Ajout de **RANDOM** ( u1 -- u2 ) Fourni un entier positif aliéatoire compris dans l'intervalle {0..u1-1}. L'Algorithme utilisé est celui décris sur ce [lien](http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html). 

* Renommé **LN2** **LN2S** puisque cette division ne résulte pas en la valeur du log naturel de 2 mais à sa valeur divisée par 1.6384 (i.e. 2¹⁴/10000). **S** pour *scaling*.

* Renommé **LOG2** **LOG2S** puisque cette division ne résulte pas en la valeur du log base 10 de 2 mais à sa valeur divisée par 16.384 (i.e. 2¹⁴/1000). **S** pour *scaling*. 

* Travail sur le manuel de référence.

* Continuer rédaction du tutoriel. 


#### 2020-06-16

* Continuer rédaction du tutoriel. 

#### 2020-06-15

* Continuer rédaction du tutoriel. 

* Problème avec la compilation en mémoire FLASH réglé. Était du au fait que j'avais inclus le fichier  **const_ratio.asm** après **flash.asm**. Hors l'étiquette **app_space** étant à la fin du fichier **flash.asm** n'était plus à la fin de la section code. J'ai déplacé cette étiquette dans le ficher principal **stm8ef.asm** pour m'assurer qu'elle sera toujours à la fin quel que soit l'ordre des *.include*. 

#### 2020-06-14

* Découvert bogue, la compilation en mémoire FLASH ne fonctionne plus les pointeurs ne semble pas être mis à jour correcte. À voir. 


* Travail sur tutoriel. 


#### 2020-06-13

* Corrigé information concernant les mots **LN2** et **LOG2** dans [const_ratio.asm](const_ratio.asm)

* Continuer rédaction de [tutoriel.md](tutoriel.md)


#### 2020-06-13

* Débogué **DNEGATE** incw y n'affecte pas le carry flag.

* Ajout de **S>D** ( n -- d ) conversion d'un entier simple en entier double.

* Renommé la double constante **SQRT12** en **12RT2**. Il ne s'agit pas de la racine carré de 12 mais plutôt de la 12ième racine de 2. 

#### 2020-06-12

**Session 2**

* Corrigé bogue dans **UM/MOD**. 

* Ajout du fichier [const_ratio.asm](const_ratio.asm) qui définie des constantes arithmétiques par un rapport de 2 entiers. Ces constantes sont définies pour êtres utilisées avec les opérateurs  __*/__ et __*/MOD__. 

exemple d'utilisation d'une constante. Génère les notes de la gamme tempéré pour l'octave 4.
```
: TEMPERED 11 FOR CR DUP . SQRT12 DUP >R */MOD SWAP R> 2/ / + NEXT DROP ; ok
523 TEMPERED
 523
 554
 587
 622
 659
 698
 740
 784
 831
 880
 932
 987 ok

```

**Session 1**

* Corrigé bogue dans **VARIABLE** 

* Corrigé bogue dans **FORGET** 

* Ajouté **PI**  ( -- 355 113 ) Empile les 2 constante **355** et **113** qui peuvent être utilisées avec __*/__ pour les calculs trigonométriques sur fractions à décimales fixes. 


#### 2020-06-11

* Découvert bogue. Lorsqu'on compile dans la RAM pour ensuite passé dans la compilation en mémoire flash les variables systèmes relié à la compilation ne sont plus valide. 

* Corrigé bogue dans **ALLOT** 

* Travail sur le manule de référence. 

#### 2020-06-08

* Modifié **PICK** dont le comportement n'était pas conforme au standard Forth 201x.

* Modifié **.S** nécessaire suite à la modification de **PICK**. 

* Écriture du manuel de référence de stm8_eForth version 3.0 

#### 2020-06-07

**SESSION 2** 

* Alors que ce matin je pensais en avoir terminé avec cette version 3.0 je me suis mis à réfléchir à la possibilité de pouvoir choisir entre la mémoire FLASH et la mémoire RAM pour la compilation des mots.  Ça peut en effet être intéressant pour faire de simple test de compiler dans la mémoire RAM. En réfléchissant à cette question je me suis rendu compte qu'il s'agissait d'une modification simple qui peut tenir en une variable système supplémentaire et 2 mots. 

* **NOTE:** Les mots qui sont compilés en mode **TO-RAM** ne peuvent pas être transférés en mémoire FLASH ultérieurement. A moins de faire un **REBOOT** suivit de **TO-FLASH** et de copier chaque mot individuellement en utilisant un copier-coller à partir du texte dans le terminal. Puisqu'il n'y a pas d'éditeur il peut être utile d'activer le *log to file* dans le terminal.

* **TFLASH** Variable système qui lorsqu'elle a la valeur -1 dirige la compilation vers la mémoire FLASH. Si elle est à zéro les définitions sont gardées en mémoire RAM.

* **TO-FLASH** ( -- ) Sélectionne la mémoire FLASH comme destination de la compilation .

* **TO-RAM** ( -- ) Sélectionne la mémoire RAM comme destination de la compilation.

**SESSION 1** 

**À FAIRE** 

* Écrire le manuel de référence 

**FAIT** 

* Mis à jour le numéro de version a **3.0**.

* Ajout de **AUTORUN** &lt;string&gt; ( -- )  pour sélectionner l'application qui s'exécute au démarrage.

* Ajout du mot **SET-ISP** ( n1 n2 -- ) Ajustement de la priorité d'interruption. n1 est le niveau  {1..3} et n2 est le vecteur {0..29}

* Ajout de **LSHIFT** ( n1 n2 -- n1&lt;&lt;n2 )

* Ajout de **RSHIFT** ( n1 n2 -- n1&gt;&gt;n2 )


#### 2020-06-06

* Modifié priotiré d'interruption du TIM4 à niveau 3.

* Ajout du mot **EI** ( -- ) Pour activer les interruptions.

* Ajout du mot **DI** ( -- ) Pour désactiver les interruptions.

* Ajout de **BYE** ( -- ) Place me MCU en mode HALT. le MCU redémarre par un reset ou une interruption externe. 

* Ajout du mot **FORGET** ( -- &lt;string&gt; ) Réinitialise les pointeurs au mot qui précède le mot passé en argument. Si des routines d'interruptions ont étées définies après ce mot les vecteurs sont réinitialisés à la valeur par défaut. Si des variables ont étées définies après ce mot l'espace RAM doit-être aussi libérée.

#### 2020-06-05

**À FAIRE** 

* Test interruptions 

* Ajouter mot **FORGET** 

* Ajouter mot **AUOTRUN** 

**FAIT** 

* Ajout du mot **I:** pour débuter la compilation d'une routine d'interruption.

* Ajout du mot **I;** pour conclure la défintion d'une routine d'interruption.

* Ajout du mot **IFMOVE** pour tenir compte de la différence entre le transfert d'une interruption et d'un mot dans le dictionnaire. 


#### 2020-06-04

**À FAIRE**

* Support pour les interruptions. Puisque les mots *colon* sont des listes d'appel de sous-routine une routine de service d'interruption peut-être écrite en Forth. Cependant 
ces définitions ne doivent pas appaître dans le dictionnaire et doivent se terminer par une instruction machine **IRET**. Donc il faut créer des mots spéciaux pour la compilation des routines de service d'interruption. le mot **I:** servira à introduire une telle définition et le mot **I;** servira à la conclure. Aucun nom ne devra être donner à la routine. Son adresse d'exécution sera simplement retournée sur la pile. le mot **SET-IVEC** servira à initialiser un vecteur d'interruption avec cette adresse. 

* Créer le mot **AUTORUN** pour définir l'application qui s'exécutera automatiquement à la mise sous tension de la carte **NUCLEO**. Cette adresse est inscrite dans la variable EEPROM **APP_RUN**. Par défaut c'est l'adresse d'exécution du mot **hi** qui est dans cette variable. 

**FAIT**
* Modifié code du mot **COMPI** et de tous les mots qui faisait un appel à **COMPI**. Cette modfiication était nécessaire pour régler le bogue FOR-AFT-THEN-NEXT. 

* Ajout du mot **I** ( -- n ) Ce mot empile la valeur du compteur de boucle FOR-NEXT.

* test des boucles de contrôle OK. 

* Séparer mot **FMOVE** en 2 partie. **FMOVE** fait seulement la copie et le nouveau mot **UPDAT-PTR** ajuste les pointers. Modification en prévision du support aux interruption.


#### 2020-06-03

**À faire**

    * réparer   FOR AFT THEN NEXT 

    * tester les autres structures de contrôles et déboguer au besoin. 

* Pour que les mots puissent être copiés de la RAM à la FLASH il faut que les branchements soient ajustés à la valeur de la destation finale dans la mémoire FLASH. Dans ce but j'ai créé une variable système appellée **OFFSET** qui est la différence entre **CP** et **VP** calculé au début de la compilation. À chaque adresse de saut on ajoute la valeur de cet **OFFSET**.
Ceci requiert une modfication de toutes les structures de contrôles. 

* les motes **,** et **C,** compilent dans l'espace des variables. Pour compiler dans l'espace code il faut utiliser les mots **EE,** et **EEC,**. 

* Le mot **VP** ( -- a) retourne le pointeur des variables libres (mémoire RAM). 

* le mot **CP** ( -- a ) retourne le pointeur du code libre (mémoire flash).

* le mot **HERE** ( -- a ) retourne l'adresse des variables en RAM. et non la valeur de **CP**.

* Modifié le mot **ALLOT** ( n -- ) réserve de la mémoire RAM et met à jour **VP** et **APP_VP**.

* Changer le nom de plusieurs variables 

* Modifier le code des mots **COLD** et **VARIABLE** 

* créer des mots qui retournes les adresses double des variables EEPROM
    * **EEP-LAST** ( -- ud ) Retourne le pointeur APP_LAST, last word in dictionary
    * **EEP-RUN**  ( -- ud ) Retourne le pointeur APP_RUN, autorun entry point.
    * **EEP-CP** ( -- ud ) Retourne le pointeur APP_CP , code pointer free space
    * **EEP-VP** ( -- ud ) Retourne le pointeur APP_VP , variable free space 

* Ajout de mots pour mettre à jour les variables système en EEPROM 
    * **UPDAT-LAST** ( -- ) met à jour **APP_LAST** à partir de **LAST** 
    * **UPDAT-RUN** ( a -- ) met à jour **APP_RUN** avec la valeur **a**
    * **UPDAT-CP** ( -- ) met à jour **APP_CP** avec la valeur de **CP** 
    * **UPDAT-VP** ( -- ) met à jour la valeur de **APP_VP** avec la valeurde **VP**

#### 2020-06-02

* Ajout de **RAM2EE** ( ud a u -- ) pour écrire u octets dans la mémoire flash|eeprom.

* Ajout de **FADDR** ( a -- ud ) étant a à 32 bits par 0. 

* Ajout de **RFREE** ( a -- u ) retourne le nombre d'octets libre en supposant que **a** est une adresse flash i.e. u=a%128 

* Continue travail sur **FMOVE**. 

#### 2020-06-01

* Travail sur **FMOVE** ( -- ) transfert la dernière définition vers la mémoire flash.

* Ajout de **BUF2ROW** ( a ud -- ) To write ROWBUFF to FLASH. 

#### 2020-05-31

* Ajout de **FCP** ( -- a ) Retourne le pointeur de la variable système UFCP qui est le pointeur vers le début de la mémoire flash libre. **CP** retourne le pointer vers la RAM libre. 

* Ajout de **EE,** ( w -- ) pour compiler un entier dans la mémoire flash pointée par **FCP**.

* Ajout de **EEC,** ( c -- ) pour compiler un octet dans la mémoire flash pointée par **FCP**.

* Ajout du tampon **ROWBUFF** de 128 octets pour les transactions entre la mémoire FLASH et RAM.

* Ajout de **ROW2BUF** ( ud -- ) Copie un bloc FLASH ou EEPROM dans le tampon  **ROWBUFF**.

* Modification de **VARIABLE** pour que l'adresse de la variable soit un pointeur. Cette indirection est nécessaire pour permettre de compiler le code des variables dans la mémoire FLASH tout en gardant le data en RAM.  

* Modification de **COLD** pour initialiser **APP_RUN** avec le ca de **hi**. Lorsqu'une application sera compilée en FLASH son *ca* de démarrage remplacera celui de **hi** dans **APP_RUN**. 

**À faire** 
* compléter les modifications pour transférer les définitions compilées vers la mémoire flash. La compilation se fera d'abord en RAM pour ensuite copier le code dans la FLASH et finalement mettre à jour les variables **CNTXT**,**APP_HERE**, **APP_LAST**, **UCP** et **CP** s'il s'agit d'une variable. 

#### 2020-05-30

**Session 2**

* Ajout de la variable EEPROM **VAR_HERE** pour conserver la valeur de **CP** qui maintenant ne servira que comme pointeur de données variables. 

* Modification de **COLD** pour synchroniser **CP** avec **VAR_HERE**.

* Ajout de **SET-OPT** ( c n -- ) Modifie la valeur d'un registre OPT **c** nouvelle valeur et **n** numéro de l'option {1..7}.

* Ajout du mot **REBOOT** ( -- ) pour réinitialiser le MCU. 

**Session 1**

* **NOTE:**<br/>  
    * **SET-IVEC** et **RST-IVEC** ne sont pas prêt pour utilisation il faut d'abord ajouter les mots pour compiler les interruptions. Quelque chose comme   **:I** au lieu de **:** et **I;** au lieu de **;**. Ceci est nécessaire car les routines d'interruptions se termine par instruction machine *iret* au lieu de *ret* et elles ne doivent pas apparaître dans le dictionnaire. Le compilateur devra retourné le **ca** de la routine et **SET-IVEC** devra être appellée avec cette valeur.

    * J'ai décidé que le compilateur compilerait dans la mémoire FLASH et que la RAM serait réservée seulement pour les variables. Il faudra donc maintenir un  pointer VAR_HERE et un pointer FLASH_HERE. 

    * le mot **MARKER** sera ajouter. 


* Ajout de **SET-IVEC** ( ud n -- ) Initialize le vecteur d'interruption **n** avec l'adresse de l'ISR **ud**. Le vecteur **0** est **TLI**. Le vecteur **24** est **FLASH**. 

* Ajout de **RST-IVEC** ( n -- )  Réinitialise un vecteur d'interruption à sa valeur par défault. Le gestionnaire par défaut est **NonHandledInterrupt** qui a pour effet de réinitialiser le MCU. 

* Ajout du mot **PRISTINE** ( -- ) Ce mot ramène le système à son état initial avant toute modification par l'utilisateur. 

#### 2020-05-29

* Ajout de **CONSTANT** (n -- ; &lt;string&gt;) curieusement absent du vocabulaire original.
<BR/>**USAGE:** n CONSTANT nom 

* Ajout de **WR-ROW** ( a ud -- )  copie 128 octets de la mémoire RAM vers la mémoire FLASH ou EEPROM. <br/>**USAGE:** addr_buffer addr_row WR-ROW.  

* Je viens de réaliser qu'il y a un problème pour le transfert des définitions  vers la mémoire FLASH en ce qui conserne les variables. Tel que le système a été conçu au départ ce n'est tout simplement pas possible car le champ paramètre est à la suite du champ code. Il faudrait modifier le système pour que le champ paramètre demeure en RAM, **Ayayaya!** Une autre solution est de créer l'application en RAM, de la sauvegarder en FLASH mais avant de l'exécuter de la recopier en RAM. **Ayayaya!** Encore une autre solution est de modifier le compilateur pour que le dictionnaire ainsi que le code soit en FLASH et les données variables en RAM. **Ça demande réflexion!** je ne veux pas avoir à recréer le système au complet.

#### 2020-05-28

* Lorsque les mots composés par l'utilisateur seront sauvegardés en mémoire FLASH il faudra que la variable système **LAST** soit mise à jour. La nouvelle valeur de LAST sera sauvegardée dans l'EEPROM à adresse 0x4000. J'ai modifié le mot **COLD** pour qu'il compare la valeur de la variable **LAST** avec la valeur dans l'EEPROM appellée **APP_LAST**. La plus grande valeur est celle qui est utilisée et copiée dans la variable système **LAST**. 

* Ajout des variables systèmes suivantes dans l'EEPROM:
    * **APP_LAST**   LIEN du dernier mot de l'application utilisateur 
    * **APP_RUN**    adresse de démarrage de l'application utilisateur 
    * **APP_HERE**   adresse du pointeur HERE pour l'application en mémoire FLASH.

* Lorsqu'un nouveau mot sera ajouté par l'utilisateur dans la mémoire FLASH il faudra mettre à jour la valeur de **APP_LAST** et **APP_HERE** dans l'EEPROM. 

* Il faut que je réfléchisse à la meilleure manière de procéder pour la compilation des mots en mémoire FLASH. 
    1. toujours compiler en RAM et transférer ensuite en FLASH. Dans ce cas il faudra ajuster les liens lors de la copie.  
    1. Compiler directement en FLASH évite l'ajustement des liens met rends plus complexe la compilation qui devra utiliser des opérations d'écritures différente selon la destination.  

* Ajout de **PAUSE** ( u -- ) suspend l'exécution pour **u** millisecondes.

* Ajout de **TIMER** ( u -- ) minuterire à rebours non bloquante. **u** millisecondes.

* Ajout de **TIMEOUT?** ( -- 0|-1 ) vérifie l'état de la minuterie à rebours.

#### 2020-05-26


* mots ajouter à date:  
    
    * **ROW-ERASE** ( ud -- ) \ Efface un bloc de 128 octets dans la mémoire FLASH ou EEPROM. *ud* entier double addresse à l'intérieur du bloc.
    
    * **UNLKFL** ( -- ) \ déverrouille l'écriture dans la mémoire flash.
    
    * **UNLKEE** ( -- ) \ déverrouille l'écriture dans la mémoire EEPROM 

    * **EEC!** ( c ud -- ) \ écriture d'un octet dans la mémoire FLASH ou EEPROM.

    * **EE!** ( n ud -- ) \ écriture d'un entier dans la mémoire FLASH ou EEPROM.

    * **EEPROM** ( -- ud ) \ retourne l'adresse de début de l'EEPROM en entier double.

    * **FP!** ( ud -- ) \ initialise le pointeur long utilisé par l'écriture FLASH avec l'adresse entier double *ud*. 

    * **FC@** ( ud -- ) \ lecture d'un octet dans la mémoire étendue.

    * **F@** ( ud -- ) \ lecture d'un entier dans la mémoire étendue.

    * **UNLOCK** ( -- ) \ déverrouille FLASH or EEPROM  selon l'adresse dans *farptr* 

    * **LOCK** ( -- ) \ verrouille l'accès en écriture au mémoires FLASH et EEPROM 

    * **INC-FPTR** ( -- ) \ incremente *farptr* à l'adresse de l'octet suivant. 

    * **WR-BYTE** ( c - ) \  écris 1 octet *farptr et incremente *farptr*.

    * **ROW-ERASE** ( ud -- ) Efface le bloc de 128 octets contentant l'adresse *ud*.
     
#### À faire 

    * **TO-FLASH** Pour compiler dans la mémoire flash. 

    * **TO-RAM** Pour compiler dans la mémoire RAM. (par defaut)

    * **WR-BLK** Pour écrire un bloc de 128 octets dans la mémoire FLASH ou EEPROM. 

    * **UPDATE** pour mettre à jour la variable LAST dans l'EEPROM. 

    * **AUTORUN** Pour définir une applicaction qui s'exécute automatiquement au démarrage.


#### 2020-05-25

* Ajout des mots EEC! UNLKFL UNLKEE FC@ F@ EEPROM FP! pour écriture/lecture des mémoires EEPROM/OPTION/FLASH. 


#### 2020-05-24

* Quelque mots définis comme 'colon definition' était simple a réécrire en assembleur.

* Modification d'autre routines déjà en assembleurs.

* découvert bogue: après l'invocation du mot "\\"  erreur 'underflow' . Cause: pour SDAS le le backslash ne doit pas être escapé dans les chaînes. i.e le nom entre guillemet devait-être "\\" et non "\\\\". SDAS inscrivait une chaîne de 2 caractères.  Comme le code ASCII de ce caractère est 0x5C et qu'en assembleur ça correspond à l'instruction **INCW X**  le pointeur du data stack n'était plus aligné. Difficile à déboguer. 

* Il y avait un 'DECW Y' dans DEPTH qui n'était pas justifié.

* découvert bogue dans **RP!** l'adresse sur le data stack n'était pas jetée.   


#### 2020-04-26
 
* Remplacé source clock HSE 8Mhz par HSI 16Mhz . À cette fréquence eForth exécute 1 000 000 de boucles FOR NEXT vides en 1.7 seconde. 

* La majorité des mots dans le dictionnaires sont en MAJUSCULES, certains sont en minuscules et d'autres un mélange des deux. Je préfèrerais qu'ils soient tous dans la même forme. 

* Certains mots sont identiques sauf que l'un est en majuscules et l'autre en minuscules. Exemple; *next* et *NEXT* ainsi que *abort"* et *ABORT"*.  Ça peut porter à confusion! 








