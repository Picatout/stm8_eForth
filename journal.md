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








