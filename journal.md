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








