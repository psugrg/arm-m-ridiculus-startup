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

the [STM32 Nucleo-64 development board](https://www.st.com/en/evaluation-tools/nucleo-l476rg.html) with STM32L476RG MCU.

> This MCU implements an ARM Cortex M4 core

#### Build firmware

```sh
make all MCU=cortex-m4
```

#### Flash firmware into the device

The firmware for ARM M MCU normally starts from the beginning of the flash - `0x00` in the address space. This is how the linker script provided in the example links the application and what it assumes.

The STM32L476RG MCU however has a special feature where it's possible to configure the _boot mode_ to select what code is executed after a reset. This mode can redirect (alias) addresses from a different location (`0x08000000` in this case) to the beginning of the flash (check documentation for more details).

This means that the binary should either be linked to a different address (option _one_), or linked to `0x00` but flashed to a different location (option _two_).

> The project is using the _second_ approach since it's more generic therefore examples below are flashing firmware to a specific location - `0x08000000` - which will be linked to `0x00` automatically by the MCU since this is the default behavior.
>
> This is also the reason why flashing procedures are using _bin_ format instead of _elf_ - _elf_ file contains details about addresses therefore could not be flashed to a specific location.

##### Flashing procedure using _st-link_

> The board is equipped with the _ST-LINK_ debugger/programmer

```sh
st-flash --reset --format binary write rssmarm.bin 0x08000000
```

##### Flashing procedure using _openocd_

```sh
openocd -f /usr/share/openocd/scripts/board/st_nucleo_l4.cfg -c "program rssmarm.bin verify reset exit 0x08000000"
```

#### Debug

##### Using Visual Studio Code

> Make sure that the [Cortex-Debug](https://marketplace.visualstudio.com/items?itemName=marus25.cortex-debug) extension is installed

Add the following to your debug configuration

```json
{
    "name": "STM32L476RG Debug",
    "cwd": "${workspaceRoot}/",
    "executable": "${workspaceRoot}/rssmarm.elf",
    "request": "launch",
    "type": "cortex-debug",
    "interface": "swd",
    "device": "STM32L476RG",
    "gdbPath": "gdb-multiarch",
    "objdumpPath": "arm-none-eabi-objdump",
    "gdbTarget": "localhost:3333",
    "showDevDebugOutput": "raw",
    "servertype": "openocd",
    "configFiles": [
        "/usr/share/openocd/scripts/board/st_nucleo_l4.cfg"
    ]
}
```

> Select the new _STM32L476RG Debug_ configuration and start debug session by hitting _F5_

##### Using GDB

1. Start _openocd_ as a _gdbserver_

    ```sh
   openocd -f /usr/share/openocd/scripts/board/st_nucleo_l4.cfg -s /usr/share/openocd/scripts  
    ```

2. Start _gdb_

    ```sh
    gdb-multiarch rssmarm.elf
    ```

3. Attach to th _gdbserver_ from the _gdb_ console

    ```gdb
    target remote :3333 
    ```
