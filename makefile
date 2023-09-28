#Arm Cortex M extreme startup makefile

# Target (Ridiculously Small Sartup code (rss) for cortex-M line (m) of the ARM (arm) processors)
TARGET = rssmarm

# C compiler
CC = arm-none-eabi-gcc

# Archiver
AR = arm-none-eabi-ar

# Objdump
OBJDUMP = arm-none-eabi-objdump

# Objcopy
OBJCOPY = arm-none-eabi-objcopy

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
# Hex file
	$(OBJCOPY) -O ihex $(TARGET).elf $(TARGET).hex
# Binary file
	$(OBJCOPY) -O binary $(TARGET).elf $(TARGET).bin

PHONY: clean
clean:
	rm -f *.elf *.asm *.map *.o *.hex *.bin
