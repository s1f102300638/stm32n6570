/*
******************************************************************************
**
** @file        : STM32N6XX_AXISRAM2_fsbl_optimized.ld
**
** @author      : GPM Application Team (Optimized for STM32N6 with Neural-ART)
**
** @brief       : Optimized Linker script for STM32N6XX Device
**                - Proper memory layout for Neural-ART NPU
**                - External memory support for weights
**                - Correct RAM allocation
**
**  Target      : STMicroelectronics STM32N6
**
******************************************************************************
** @attention
**
** Copyright (c) 2024 STMicroelectronics.
** All rights reserved.
**
******************************************************************************
*/

/* Entry Point */
ENTRY(Reset_Handler)

/* Generate a link error if heap and stack don't fit into RAM */
_Min_Heap_Size = 0x800;   /* Increased heap for AI operations */
_Min_Stack_Size = 0x1000; /* Increased stack for AI operations */

/* Specify the memory areas - Total 4.2MB available */
MEMORY
{
  /* Internal SRAM - FSBL code and data (512KB area) */
  ROM    (xrw)    : ORIGIN = 0x34180400,   LENGTH = 255K
  RAM    (xrw)    : ORIGIN = 0x341C0000,   LENGTH = 256K
  
  /* Additional CPU RAM - now available for use */
  AXISRAM1 (xrw)  : ORIGIN = 0x34000000,   LENGTH = 1024K  /* 1MB */
  AXISRAM2 (xrw)  : ORIGIN = 0x34100000,   LENGTH = 512K   /* 512KB - remaining after FSBL */
  
  /* NPU RAMs - can be used as general RAM when NPU not active */
  AXISRAM3 (xrw)  : ORIGIN = 0x34200000,   LENGTH = 448K
  AXISRAM4 (xrw)  : ORIGIN = 0x34270000,   LENGTH = 448K
  AXISRAM5 (xrw)  : ORIGIN = 0x342E0000,   LENGTH = 448K
  AXISRAM6 (xrw)  : ORIGIN = 0x34350000,   LENGTH = 448K
  
  /* External memories */
  XSPI1    (rx)   : ORIGIN = 0x90000000,   LENGTH = 32M    /* HyperRAM for large activations */
  XSPI2    (rx)   : ORIGIN = 0x71000000,   LENGTH = 128M   /* OctoFlash for AI weights */
}

/* Highest address of the user mode stack */
_estack = ORIGIN(RAM) + LENGTH(RAM);
_sstack = _estack - _Min_Stack_Size;

/* Define output sections */
SECTIONS
{
  /* The startup code goes first into ROM */
  .isr_vector :
  {
    . = ALIGN(4);
    KEEP(*(.isr_vector)) /* Startup code */
    . = ALIGN(4);
  } >ROM

  /* The program code and other data goes into ROM */
  .text :
  {
    . = ALIGN(4);
    *(.text)           /* .text sections (code) */
    *(.text*)          /* .text* sections (code) */
    *(.glue_7)         /* glue arm to thumb code */
    *(.glue_7t)        /* glue thumb to arm code */
    *(.eh_frame)
    
    KEEP (*(.init))
    KEEP (*(.fini))

    . = ALIGN(4);
    _etext = .;        /* define a global symbols at end of code */
  } >ROM

  /* Constant data goes into ROM */
  .rodata :
  {
    . = ALIGN(4);
    *(.rodata)         /* .rodata sections (constants, strings, etc.) */
    *(.rodata*)        /* .rodata* sections (constants, strings, etc.) */
    . = ALIGN(4);
  } >ROM

  .ARM.extab   (READONLY) :
  {
    . = ALIGN(4);
    *(.ARM.extab* .gnu.linkonce.armextab.*)
    . = ALIGN(4);
  } >ROM

  .ARM (READONLY) :
  {
    . = ALIGN(4);
    __exidx_start = .;
    *(.ARM.exidx*)
    __exidx_end = .;
    . = ALIGN(4);
  } >ROM

  .preinit_array (READONLY) :
  {
    . = ALIGN(4);
    PROVIDE_HIDDEN (__preinit_array_start = .);
    KEEP (*(.preinit_array*))
    PROVIDE_HIDDEN (__preinit_array_end = .);
    . = ALIGN(4);
  } >ROM

  .init_array (READONLY) :
  {
    . = ALIGN(4);
    PROVIDE_HIDDEN (__init_array_start = .);
    KEEP (*(SORT(.init_array.*)))
    KEEP (*(.init_array*))
    PROVIDE_HIDDEN (__init_array_end = .);
    . = ALIGN(4);
  } >ROM

  .fini_array (READONLY) :
  {
    . = ALIGN(4);
    PROVIDE_HIDDEN (__fini_array_start = .);
    KEEP (*(SORT(.fini_array.*)))
    KEEP (*(.fini_array*))
    PROVIDE_HIDDEN (__fini_array_end = .);
    . = ALIGN(4);
  } >ROM

  /* AI model weights in external flash (XSPI2) */
  .ai_weights :
  {
    . = ALIGN(32);  /* Align to cache line */
    __ai_weights_start = .;
    KEEP(*(.ai_weights))
    KEEP(*(.xspi2_data))
    KEEP(*yolo_deer*.o(.rodata*))  /* Place yolo_deer weights in external flash */
    __ai_weights_end = .;
  } >XSPI2

  /* AI activations in CPU RAM - use AXISRAM1 for large buffers */
  .ai_activations (NOLOAD) :
  {
    . = ALIGN(32);
    __ai_activations_start = .;
    KEEP(*(.ai_activations))
    KEEP(*(.axisram1_data))
    KEEP(*(.large_buffer))  /* For large arrays */
    . = ALIGN(32);
    __ai_activations_end = .;
  } >AXISRAM1
  
  /* Additional buffer space in AXISRAM2 */
  .ai_buffers (NOLOAD) :
  {
    . = ALIGN(32);
    __ai_buffers_start = .;
    KEEP(*(.axisram2_data))
    . = ALIGN(32);
    __ai_buffers_end = .;
  } >AXISRAM2

  /* NPU buffers - can be used as general RAM */
  .axisram3_section (NOLOAD) :
  {
    . = ALIGN(32);
    __axisram3_start = .;
    KEEP(*(.axisram3))
    KEEP(*(.npuram3))  /* Legacy name support */
    __axisram3_end = .;
  } >AXISRAM3

  .axisram4_section (NOLOAD) :
  {
    . = ALIGN(32);
    __axisram4_start = .;
    KEEP(*(.axisram4))
    KEEP(*(.npuram4))  /* Legacy name support */
    __axisram4_end = .;
  } >AXISRAM4

  .axisram5_section (NOLOAD) :
  {
    . = ALIGN(32);
    __axisram5_start = .;
    KEEP(*(.axisram5))
    KEEP(*(.npuram5))  /* Legacy name support */
    __axisram5_end = .;
  } >AXISRAM5

  .axisram6_section (NOLOAD) :
  {
    . = ALIGN(32);
    __axisram6_start = .;
    KEEP(*(.axisram6))
    KEEP(*(.npuram6))  /* Legacy name support */
    __axisram6_end = .;
  } >AXISRAM6

  /* Large activation buffers in external HyperRAM */
  .xspi1_data (NOLOAD) :
  {
    . = ALIGN(32);
    __xspi1_start = .;
    KEEP(*(.xspi1_data))
    __xspi1_end = .;
  } >XSPI1

  /* Used by the startup to initialize data */
  _sidata = LOADADDR(.data);

  /* Initialized data sections */
  .data :
  {
    . = ALIGN(4);
    _sdata = .;        /* create a global symbol at data start */
    *(.data)           /* .data sections */
    *(.data*)          /* .data* sections */
    *(.RamFunc)        /* .RamFunc sections */
    *(.RamFunc*)       /* .RamFunc* sections */

    . = ALIGN(4);
    _edata = .;        /* define a global symbol at data end */
  } >RAM AT> ROM

  /* Noncacheable section */
  .noncacheable :
  {
    . = ALIGN(8);
    __snoncacheable = .;
    KEEP(*(noncacheable_buffer))
    . = ALIGN(8);
    __enoncacheable = .;
  } >RAM

  /* Secure Gateway stubs */
  .gnu.sgstubs :
  {
    . = ALIGN(4);
    *(.gnu.sgstubs*)
    . = ALIGN(4);
  } >ROM

  /* Uninitialized data section */
  . = ALIGN(4);
  .bss :
  {
    _sbss = .;
    __bss_start__ = _sbss;
    *(.bss)
    *(.bss*)
    *(COMMON)

    . = ALIGN(4);
    _ebss = .;
    __bss_end__ = _ebss;
  } >RAM

  /* User_heap_stack section */
  ._user_heap_stack :
  {
    . = ALIGN(8);
    PROVIDE ( end = . );
    PROVIDE ( _end = . );
    . = . + _Min_Heap_Size;
    . = . + _Min_Stack_Size;
    . = ALIGN(8);
  } >RAM

  /* Remove information from the compiler libraries */
  /DISCARD/ :
  {
    libc.a ( * )
    libm.a ( * )
    libgcc.a ( * )
  }

  .ARM.attributes 0 : { *(.ARM.attributes) }
}
