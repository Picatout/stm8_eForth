# stm8ef 3.0 pour STM8S-DISCOVERY 

* Cette version compile exclusivement dans la mémoire FLASH. Le code occupe moins de 
place et en laisse donc plus pour l'application.

* Puisqu'il n'y a pas de mémoire étendue **FPTR** a été remplacé par **PTR16**

* **F@** et **FC@**  sont éliminés 

* **ROW2BUF** supprimé, inutile  **CMOVE** peut-être utilisé à la place. 

* **BUF2ROW** supprimé, inutile **WR-ROW** peut-être utilisé directement. 


* **FMOVE** **IFMMOVE** et **RAM2EE** supprimés. Compilation faite directement en mémoire flash.

* **FADDR** supprimé. Inutile car pas de mémoire étendue. 

