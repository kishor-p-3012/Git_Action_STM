/* STM32F103C8 - 64KB Flash, 20KB RAM */

MEMORY
{
  FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 64K
  RAM   (rwx): ORIGIN = 0x20000000, LENGTH = 20K
}

SECTIONS
{
  /* Interrupt vector table and code */
  .text : {
    KEEP(*(.isr_vector))
    *(.text*)
    *(.rodata*)
  } > FLASH

  /* Initialized data goes to RAM, loaded from FLASH */
  .data : {
    __data_start__ = .;
    *(.data*)
    __data_end__ = .;
  } > RAM AT > FLASH

  /* Uninitialized data (zero-initialized at startup) */
  .bss : {
    __bss_start__ = .;
    *(.bss*)
    *(COMMON)
    __bss_end__ = .;
  } > RAM

  /* Stack (optional — just marks space) */
  .stack (COPY) : {
    . = ALIGN(8);
    _stack_start = .;
    . = . + 2K;
    _stack_end = .;
  } > RAM

  /* Heap starts after all data */
  _end = .;
}