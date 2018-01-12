MEMORY
{
  FLASH (rx)  : ORIGIN = 0x00000000, LENGTH = 1k
  RAM   (xrw) : ORIGIN = 0x20000000, LENGTH = 1K
}

_estack = ORIGIN(RAM) + LENGTH(RAM);

ENTRY(_start)

SECTIONS
{
  .text :
  {
      KEEP(*(.vectors))     	/* Interrupt vectors */
      *(.text*)
  } >FLASH
}
