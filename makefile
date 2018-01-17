#Arm Cortex M extreme startup makefile

# Target
TARGET = armxtrs

# C compiler
CC = arm-none-eabi-gcc

# Archiver
AR = arm-none-eabi-ar

# Objdump
OBJDUMP = arm-none-eabi-objdump

# Device name
MCU = cortex-m3

# Compiler flags:
CFLAGS  = -std=c99 -mcpu=$(MCU) -mthumb -O0 -g3

# Linker flags:
LDFLAGS = -TlinkerScript.ld -Wl,-Map,$(TARGET).map -nostartfiles -nostdlib

PHONY: all
all:
# Compile
	$(CC) -o $(TARGET).elf startup.c $(CFLAGS) $(LDFLAGS)
# Disassamble
	$(OBJDUMP) -d $(TARGET).elf > $(TARGET).asm

PHONY: clean
clean:
	rm -f *.elf *.asm *.map *.o
