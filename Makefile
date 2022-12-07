##################################
##  stm8_eForth make file
##################################

NAME=eForth
# toolchain
SDAS=sdasstm8
SDCC=sdcc
CFLAGS=-mstm8 -lstm8  -Iinc
# sources files 
MAIN_FILE=stm8ef.asm
SRC=flash.asm const_ratio.asm ctable.asm
INC=inc/
INCLUDES=$(INC)config.inc $(INC)ascii.inc $(INC)stm8s208.inc $(INC)stm8s207.inc\
$(INC)stm8s105.inc $(INC)stm8s_disco.inc $(INC)nucleo_8s208.inc $(INC)nucleo_8s207.inc 
BUILD=build/$(BOARD)/
OBJECTS=$(BUILD)$(SRC:.asm=.rel)
SYMBOLS=$(OBJECTS:.rel=.sym)
LISTS=$(OBJECTS:.rel=.lst)
FLASH=stm8flash

.PHONY: all

all: clean $(NAME).rel $(NAME).ihx  clear_eevars eforth  

$(NAME).rel: $(MAIN_FILE) $(SRC) $(INCLUDES)
	@echo
	@echo "**********************"
	@echo "assembling main file  to " $(NAME).rel  
	@echo "**********************"
	$(SDAS) -g -l -o $(BUILD)$(NAME).rel $(MAIN_FILE)

$(NAME).ihx: $(NAME).rel 
	@echo 
	@echo "**************************"
	@echo "linking files to " $(NAME).ihx 
	@echo "**************************"
	$(SDCC) $(CFLAGS) -Wl-u -o $(BUILD)$(NAME).ihx  $(BUILD)$(NAME).rel


.PHONY: clean 
clean: build
	@echo
	@echo "***************"
	@echo "cleaning files"
	@echo "***************"
	rm -f $(BUILD)*

.PHONY: clear_eevars 
clear_eevars:
	@echo
	@echo "**********************"
	@echo "erase EEPROM variables"
	@echo "**********************"
	$(FLASH) -c $(PROGRAMMER) -p $(BOARD) -u -s eeprom -b 16 -w zero.bin  

.PHONY: erase 
erase: clear_eevars 
	@echo ""
	@echo "************************"
	@echo "  reset all flash types "
	@echo "************************"
	$(FLASH) -c $(PROGRAMMER) -p $(BOARD) -u -s flash -b 131072 -w zero.bin   	

build:
	mkdir build

flash: clear_eevars $(LIB)
	@echo ""
	@echo "***************"
	@echo "flash program "
	@echo "***************"
	$(FLASH) -c $(PROGRAMMER) -p $(BOARD) -w $(BUILD)$(NAME).ihx 

compile: $(MAIN_FILE)  $(SRC) $(INCLUDES)
	@echo ""
	@echo "******************"
	@echo "  compiling       "
	@echo "******************"
	-rm $(BUILD)* 
	$(SDAS) -g -l -o $(BUILD)$(NAME).rel $(MAIN_FILE)
	$(SDCC) $(CFLAGS) -Wl-u -o $(BUILD)$(NAME).ihx  $(BUILD)$(NAME).rel

eforth: compile flash 
	

doorbell: $(MAIN_FILE) $(SRC) $(INCLUDE)
	@echo ""
	@echo "**********************************"
	@echo " build and flash doorbell project"
	@echo "**********************************"
	-rm build/*
	$(SDAS) -g -l -o $(BUILD)$(NAME).rel $(MAIN_FILE)
	$(SDAS) -g -l -o $(BUILD)doorbell.rel $(ASM)
	$(SDCC) $(CFLAGS) -Wl-u -o $(BUILD)$(NAME).ihx  $(BUILD)$(NAME).rel $(BUILD)doorbell.rel  
	$(FLASH) -c $(PROGRAMMER) -p $(BOARD) -w $(BUILD)$(NAME).ihx


read_eevars:
	@echo ""
	@echo "******************************"
	@echo " read eeprom system variables"
	@echo "******************************"
	$(FLASH) -c $(PROGRAMMER) -p $(BOARD) -s eeprom -b 16 -r eevars.bin
	@hexdump -C eevars.bin 
	@rm eevars.bin 
