# STM8EF

Le but de ce projet est d'adapter le fichier [stm8ef.asm.org](stm8ef.asm.org) pour la carte **NUCLEO_8S208RB** et l'assembleur **SDAS**.

Pour les détails consultez le [journal.md](journal.md).

## À propos de eForth

Eforth est un Forth développé à l'origine par Bill Muench dans le but d'avoir un système Forth qui soit rapidement adaptable d'un système à l'autre. C'était dans les années 80, les années glorieuses du Forth. À cette époque chaque PC 8 bits avait son Forth: Apple II, TRS-80, ZX-SPECTRUM, etc.
Il y avait aussi un Forth pour le système d'exploitation CP/M.

Par la suite C.H. Ting a repris le travail de Bill Muench et a porté eForth sur de nombreuses architectures 8,16 et 32 bits. **stm8ef** est une de ses dernières adaptations et a été écris pour la carte [stm8s-discovery](https://www.st.com/en/evaluation-tools/stm8s-discovery.html) en 2011.
Le moderne circuit intégré multi-ordinateurs [GA144](http://www.greenarraychips.com/home/products/) de GreenArrays a même une version de eForth incris dans la ROM d'un de ses 144 ordinateurs.

## À propos de C.H. Ting

M. Ting est un nom connu dans l'univers du Forth pour ses adaptations de eForth mais aussi pour ses [publications concernant eForth](https://www.amazon.ca/eForth-Overview-C-H-Ting-ebook/dp/B01LR47JME/ref=sr_1_1?keywords=C.H.Ting&qid=1572142957&sr=8-1). [eForth overview](http://www.exemark.com/FORTH/eForthOverviewv5.pdf) ainsi que d'autres documents sur eForth sont téléchargeables gratuitement en format pdf. 

M. Ting a aussi travaillé sur le développement de processeurs adapté au langage Forth. Il a un [site web](http://www.ultratechnology.com/offete.html) mais celui-ci semble à l'abandon.

## Adaptation

Comme il s'agit de 2 MCU STM8 l'adaptation vers le stm8s208 ne devrait pas nécessité beaucoup de travail. Le plus gros du travail sera l'adaptation pour SDAS.  J'ignore pour quel assembleur le fichier a été créé mais ma tentative d'assemblage avec SDAS a échouée.  Le fichier a moins de 4000 lignes, ce n'est pas la mer à boire.

# Historique 

## 2021-07-01 

Je travaille sur la version 4.0 qui ajoute quelques mots au fichier de base [stm8_ef.asm](stm8_ef.asm) et 2 librairies. [double.asm](double.asm) pour les entiers 32 bits ainsi que [float.asm](float.asm) qui est une librairie arithmétique en virgule flottante 32 bits. 

## 2020-01-31

* ajout d'un compteur de millisecondes en utilisant TIMER4. Le mot **msec** empile ce compteur.
* mis en commentaire la commande SEE pas très utile. 
* Adaptation complétée.

## 2020-06-07

* Suite aux nombreuses modification faite au logiciel j'ai fait passé le numéoro de version à **3.0** 

* Maintenant les mots sont compilés en mémoire FLASH.

* Support pour les interruptions avec création de routines d'interruptions en utilisant les mots **I:** et **I;**. La priorité des interruptions peut-être modifiée avec le mot **SET-ISP**


* Ajout de nombreux mots d'usage général comme **LSHFIT**, **RSHIFT**, **FORGET**, **REBOOT** et **BYE**. 

## 2020-06-08 

* Started working on [reference manual](reference.md).

## 2020-06-13

* Débuter la rédaction d'un [Tutoriel](tutoriel.md).

## 2020-06-28

Le système pour construire et flasher la cible a changer car maintenant il y a 2 cibles. 
* NUCLEO-8S208RB 
* STM8S-DISCOVERY 

La première chose à faire est de modifier les constantes **NUCLEO**  et **DISCOVERY** dans le fichier **config.inc** pour sélectionner la carte désirée.

Comme il faut spécifier le MCU et la version du programmeur j'ai crééer un makefile pour chaque carte. **nucleo.mk** et **dicso.mk** le nom du fichier cible est aussi différent. Donc maintenant il faut spécifier le *makefile* qui doit-être utilisé. 

Les règles qui sont les même. 

* La règle par défaut consiste à créer le fichier *.ihx sans programmer la carte. 

* La règle **flash** sert à programmer la carte avec le fichier *.ihx déjà compilé.

* La règle **eforth** créée et flash la carte.

* la règle **clean_eevars** remet à zéro les variables persistantes dans l'eeprom.

* la règle **read_eevars** lit la valeur des variables persistantes dans l'eeprom et affiche 
leur valeurs en utilisant la commande hexdump.

* La règle **erase** efface toute la mémoire FLASH. 

## Pour flasher une nouvelle version du firmware 
```
>make -fnucleo.mk erase 
>make -fnucleo.mk eforth
```
**Erase** n'est requis que s'il y a déjà une version de eforth dans la mémoire flash.