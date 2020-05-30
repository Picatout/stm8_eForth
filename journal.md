#### 2020-05-30

* **NOTE:**<br/>  
    * **SET-IVEC** et **RST-IVEC** ne sont pas prêt pour utilisation il faut d'abord ajouter les mots pour compiler les interruptions. Quelque chose comme   **:I** au lieu de **:** et **I;** au lieu de **;**. Ceci est nécessaire car les routines d'interruptions se termine par instruction machine *iret* au lieu de *ret* et elles ne doivent pas apparaître dans le dictionnaire. Le compilateur devra retourné le **ca** de la routine et **SET-IVEC** devra être appellée avec cette valeur.

    * J'ai décidé que le compilateur compilerait dans la mémoire FLASH et que la RAM serait réservée seulement pour les variables. Il faudra donc maintenir un  pointer RAM_HERE un pointer FLASH_HERE. 

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








