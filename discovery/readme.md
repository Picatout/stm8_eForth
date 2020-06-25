# stm8ef 3.0 pour STM8S-DISCOVERY 

* Le MCU **stm8s105c6** utilisé sur la carte comporte plusieurs différences d'avec le **stm8s208rb** de la carte NUCLEO.

    * La mémoire RAM est de 2Ko au lieu de 6Ko. 

    * La mémoire FLASH est de 32Ko lieu de 128Ko. Il n'y a pas de mémoire étendue.

    * La mémoire EEPROM est de 1Ko au lieu de 2Ko.

    * Il n'y a pas de UART1 connecté au programmeur STLINK donc pas d'émulation USB-ACM.
      Le terminal utilise donc le UART2 qui doit-être connecté sur un port sériel du PC.

* Il y a suffisamment de différence entre les deux versions pour que je cré un dossier séparé et renomme les 2 fichiers principaux. **stm8ef_disco.asm** et **flash_disco.asm**. 

* Puisqu'il n'y a pas de mémoire étendue **FPTR** a été remplacé par **PTR16**

* **FADDR**, **F@** et **FC@**  sont éliminés. 

* Tous les mots qui utilisaient des adresses *entier double non signés* dans le module **flash_disco.asm** ont été modifiés pour utilliser des adresses *entier simple non signé*.

* un **Makefile** a été créé dans le dossier **discovery** pour et compiler flasher la carte **Discovery** la procédure est la même.
```
discovery$make && make flash

***************
cleaning files
***************
rm -f build/*

**********************
compiling stm8ef_disco       
**********************
sdasstm8 -g -l -o build/stm8ef_disco.rel stm8ef_disco.asm
sdcc -mstm8 -lstm8 -I../inc -Wl-u -o build/stm8ef_disco.ihx  build/stm8ef_disco.rel

***************
erase EEPROM
***************
stm8flash -c stlinkv2 -p stm8s105c6 -s eeprom -b 128 -w /dev/zero
Determine EEPROM area
Due to its file extension (or lack thereof), "/dev/zero" is considered as RAW BINARY format!
128 bytes at 0x4000... OK
Bytes written: 128

***************
flashing device
***************
stm8flash -c stlinkv2 -p stm8s105c6 -w build/stm8ef_disco.ihx 
Determine FLASH area
Due to its file extension (or lack thereof), "build/stm8ef_disco.ihx" is considered as INTEL HEX format!
8471 bytes at 0x8000... OK
Bytes written: 8471
discovery$

```
