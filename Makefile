#############################
# librairies make file
#############################
NAME=stm8ef
SDAS=sdasstm8
SDCC=sdcc
SDAR=sdar
CFLAGS=-mstm8 -lstm8 -L$(LIB_PATH) -I../inc
INC=../inc/
INCLUDES=$(INC)stm8s208.inc
BUILD=build/
LIB_PATH=../lib/
OBJECTS=$(BUILD)$(SRC:.c=.rel)
SYMBOLS=$(OBJECTS:.rel=.sym)
LISTS=$(OBJECTS:.rel=.lst)
FLASH=stm8flash
BOARD=stm8s208rb
PROGRAMMER=stlinkv21

.PHONY: all

all: clean $(NAME).rel $(NAME).ihx 

$(NAME).rel:
	@echo
	@echo "**********************"
	@echo "compiling $(NAME)       "
	@echo "**********************"
	$(SDAS) -g -l -o $(BUILD)$(NAME).rel $(NAME).asm

$(NAME).ihx: $(NAME).rel 
	$(SDCC) $(CFLAGS) -Wl-u -o $(BUILD)$(NAME).ihx  $(BUILD)$(NAME).rel


.PHONY: clean 
clean: build
	@echo
	@echo "***************"
	@echo "cleaning files"
	@echo "***************"
	rm -f $(BUILD)*

build:
	mkdir build

.PHONY: test 

flash: $(LIB)
	@echo
	@echo "***************"
	@echo "flashing device"
	@echo "***************"
	$(FLASH) -c $(PROGRAMMER) -p $(BOARD) -w $(BUILD)$(NAME).ihx 

eforth: $(NAME).asm 
	-rm build/* 
	$(SDAS) -g -l -o $(BUILD)$(NAME).rel $(NAME).asm 
	$(SDCC) $(CFLAGS) -Wl-u -o $(BUILD)$(NAME).ihx  $(BUILD)$(NAME).rel
	$(FLASH) -c $(PROGRAMMER) -p $(BOARD) -w $(BUILD)$(NAME).ihx
