##-------------------------simple make file v1--------------------------------
## Makefile for ahadinjector project
#
## Compiler settings
#CC = avr-gcc
#MCU = atmega8
#CFLAGS = -mmcu=$(MCU) -Os
#
## Source file
#SRC = main.c
#HDR = timerRegister.h
#
#SRC_PATH = ./
#HDR_PATH = ./header
#
## Output files
#TARGET = main.elf
#HEX = main.hex
#
## Rules
#all: flash clean
#
#$(TARGET): $(SRC_PATH)/$(SRC)
#	$(CC) $(CFLAGS) -o $(TARGET) $(SRC_PATH)/$(SRC)
#	
#$(HEX): $(TARGET)
#	avr-objcopy -j .text -j .data -O ihex $(TARGET) $(HEX)
#
#flash: $(HEX)
#	avrdude -p $(MCU) -c usbasp -U flash:w:$(HEX)
#
#clean:
#	rm -f $(TARGET) $(HEX)
#
#----------------------complex and powerful make file-------------------------
# Make file for ahadinjector project

# Compiler setting
CC=avr-gcc
OPT=-O0
DEPFLAG=-MP -MD
MCU=atmega8
CFLAGS=-Wall -Wextra -g $(foreach D,$(INC_DIR),-I$(D)) $(OPT) -mmcu=$(MCU) -Os\
	$(DEPFLAG)
OBJ_CPY=avr-objcopy
FLASH=avrdude

# All Source files
CFILES=$(foreach D,$(SRC_DIR),$(wildcard $(D)/*.c))

# Regular expression replacement
OBJECTS=$(patsubst %.c,%.o,$(CFILES))
DEPFILES=$(patsubst %.c,%.d,$(CFILES))

# Directories Path
SRC_DIR=. source
INC_DIR=. ./header/

# Output files
HEX=main.hex

all: flash clean 

flash: $(HEX)
	$(FLASH) -p $(MCU) -c usbasp -U flash:w:$^

$(HEX): $(OBJECTS)
	$(OBJ_CPY) -j .text -j .data -O ihex $^ $@

$(OBJECTS): $(CFILES)
	$(CC) $(CFLAGS) -o $@ $^

clean:
	rm -rf $(OBJECTS) $(HEX) $(DEPFILES)
