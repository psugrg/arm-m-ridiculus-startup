# Ridiculously small startup code for the ARM Cortex-M processors family

## What is this repository for?

The project intention is to demonstrate how to create ridiculously small
startup code for the ARM Cortex-M processors that contains only the absolute
minimum of code. The main requirement was to use C language and to make the
build system to not to add any extra code (libraries, startup code etc.).

## What is this repository _not_ for?

This project cannot be used for any standard development activities since it
doesn't setup the complete environment whatsoever.

## Development environment

> TODO!

## Examples

### NUCLEO-L476RG

STM32 Nucleo-64 development board with STM32L476RG MCU.

> This MCU implements an ARM Cortex M4 core

Build firmware:

```sh
make all MCU=cortex-m4
```

Flash firmware into the device:

> The board is equipped with the _ST-LINK_ debugger/programmer

```sh
st-flash --format binary write $(TARGET).bin 0x08000000
```

Where the `0x08000000` is the address of the _flash_ memory the firmware should be loaded to. This address depends on the selected _boot mode_. Please refer to the _STM32Lxx_reference_manual.pdf_ for more details.
