# Target
TARGET = extremeStartup

# C compiler
CC = arm-none-eabi-gcc

# Archiver
AR = arm-none-eabi-ar

# Objcopy
OBJCOPY = arm-none-eabi-objcopy

# Objdump
OBJDUMP = arm-none-eabi-objdump

# Device name
MCU = cortex-m3

# Compiler flags:
CFLAGS  = -std=c99 -mcpu=$(MCU) -mthumb -O0 -g3

# Linker flags:
LDFLAGS = -Tlinker_script.ld -Wl,-Map,$(TARGET).map -nostartfiles -nostdlib

PHONY: all
all:
# Compile
	$(CC) -o $(TARGET).elf startup.c $(CFLAGS) $(LDFLAGS)
# disassamble
	$(OBJDUMP) -d $(TARGET).elf > $(TARGET).asm
# Create intel hex file
	$(OBJCOPY) -O ihex $(TARGET).elf $(TARGET).hex

PHONY: clean
clean:
	rm -f *.elf *.asm *.hex *.map
