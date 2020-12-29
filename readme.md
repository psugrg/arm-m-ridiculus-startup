# Ridiculously small startup code for the ARM Cortex-M processors family

## What is this repository for?

The project intention is to demonstrate how to create ridiculously small
startup code for the ARM Cortex-M processors that contains only the absolute
minimum of code. The main requirement was to use C language and to make the
build system to not to add any extra code (libraries, startup code etc.).

## What is this repository _not_ for?

This project cannot be used for any standard development activities since it
doesn't setup the complete environment whatsoever.

## Usage

### Development environment

This project can be compiled by the [arm-m-dev](https://github.com/psugrg/arm-m-dev)
development environment.

### Compilation

Use standard `make all` and `make clean` commands to compile and clean the code.
