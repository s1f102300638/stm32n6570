/*
******************************************************************************
**
** @file        : STM32N657X0HXQ_LRUN_improved.ld
**
** @author      : GPM Application Team / TRON Forum
**
** @brief       : Improved Linker script for STM32N657 with μT-Kernel 3.0
**                and AI/NPU support
**                      
**                Optimized memory layout for:
**                - μT-Kernel 3.0 BSP2
**                - Neural-ART Accelerator (NPU)
**                - 4.2MB AXISRAM distributed access
**
**  Target      : STMicroelectronics STM32N657X0H3Q
**
******************************************************************************
** @attention
**
** Copyright (c) 2025 STMicroelectronics / TRON Forum.
** All rights reserved.
**
******************************************************************************
*/

/* Entry Point */
ENTRY(Reset_Handler)

/* Stack configuration - Increased for μT-Kernel and AI tasks */
_Min_Heap_Size = 0x10000;  /* 64KB heap for dynamic allocation */
_Min_Stack_Size = 0x4000;   /* 16KB stack for deeper call chains */

/* STM32N657 AXISRAM Memory Map - Optimized for μT-Kernel + AI
 * Using Non-Secure aliases (0x34xxxxxx) for application access
 * Total SRAM: 4.2MB distributed across AXISRAM blocks
 */
MEMORY
{
  /* AXISRAM2 NS alias (512KB) - System and kernel */
  SYSTEM_RAM (xrw)    : ORIGIN = 0x34000400,   LENGTH = 256K   /* μT-Kernel system, ISR vectors */
  KERNEL_RAM (xrw)    : ORIGIN = 0x34040000,   LENGTH = 256K   /* μT-Kernel data, heap */
  
  /* AXISRAM3 NS alias (1024KB) - Application code and data */
  APP_CODE (xrw)      : ORIGIN = 0x34080000,   LENGTH = 512K   /* Application text/rodata */
  APP_DATA (xrw)      : ORIGIN = 0x340C0000,   LENGTH = 512K   /* Application data/bss */
  
  /* AXISRAM4 NS alias (1024KB) - AI workspace */
  AI_WORKSPACE (xrw)  : ORIGIN = 0x34180000,   LENGTH = 1024K  /* NPU buffers, weights cache */
  
  /* AXISRAM5 NS alias (512KB) - DMA buffers */
  DMA_BUFFER (xrw)    : ORIGIN = 0x34280000,   LENGTH = 512K   /* DMA/MDMA buffers */
  
  /* AXISRAM6 NS alias (1024KB) - RTOS resources */
  RTOS_HEAP (xrw)     : ORIGIN = 0x34300000,   LENGTH = 768K   /* RTOS heap */
  RTOS_STACK (xrw)    : ORIGIN = 0x343C0000,   LENGTH = 256K   /* Task stacks */
}

/* Highest address of the user mode stack - at end of RTOS_STACK */
_estack = ORIGIN(RTOS_STACK) + LENGTH(RTOS_STACK);
_sstack = _estack - _Min_Stack_Size;

/* Sections */
SECTIONS
{
  /* The startup code into SYSTEM_RAM */
  .isr_vector :
  {
    . = ALIGN(512);  /* Cortex-M55 vector table alignment */
    KEEP(*(.isr_vector)) /* Startup code */
    . = ALIGN(4);
  } >SYSTEM_RAM

  /* The program code and other data into APP_CODE */
  .text :
  {
    . = ALIGN(4);
    *(.text)           /* .text sections (code) */
    *(.text*)          /* .text* sections (code) */
    *(.glue_7)         /* glue arm to thumb code */
    *(.glue_7t)        /* glue thumb to arm code */
    *(.eh_frame)
    
    /* μT-Kernel code sections */
    *(.text.knl_*)
    *(.text.tk_*)
    
    /* HAL functions that need to run from RAM */
    *(.RamFunc)        /* .RamFunc sections */
    *(.RamFunc*)       /* .RamFunc* sections */

    KEEP (*(.init))
    KEEP (*(.fini))

    . = ALIGN(4);
    _etext = .;        /* define a global symbols at end of code */
  } >APP_CODE

  /* Constant data into APP_CODE */
  .rodata :
  {
    . = ALIGN(4);
    *(.rodata)         /* .rodata sections (constants, strings, etc.) */
    *(.rodata*)        /* .rodata* sections (constants, strings, etc.) */
    . = ALIGN(4);
  } >APP_CODE

  .ARM.extab   (READONLY) :
  {
    . = ALIGN(4);
    *(.ARM.extab* .gnu.linkonce.armextab.*)
    . = ALIGN(4);
  } >APP_CODE

  .ARM (READONLY) :
  {
    . = ALIGN(4);
    __exidx_start = .;
    *(.ARM.exidx*)
    __exidx_end = .;
    . = ALIGN(4);
  } >APP_CODE

  .preinit_array (READONLY) :
  {
    . = ALIGN(4);
    PROVIDE_HIDDEN (__preinit_array_start = .);
    KEEP (*(.preinit_array*))
    PROVIDE_HIDDEN (__preinit_array_end = .);
    . = ALIGN(4);
  } >APP_CODE

  .init_array (READONLY) :
  {
    . = ALIGN(4);
    PROVIDE_HIDDEN (__init_array_start = .);
    KEEP (*(SORT(.init_array.*)))
    KEEP (*(.init_array*))
    PROVIDE_HIDDEN (__init_array_end = .);
    . = ALIGN(4);
  } >APP_CODE

  .fini_array (READONLY) :
  {
    . = ALIGN(4);
    PROVIDE_HIDDEN (__fini_array_start = .);
    KEEP (*(SORT(.fini_array.*)))
    KEEP (*(.fini_array*))
    PROVIDE_HIDDEN (__fini_array_end = .);
    . = ALIGN(4);
  } >APP_CODE

  /* Used by the startup to initialize data */
  _sidata = LOADADDR(.data);

  /* Initialized data sections into APP_DATA */
  .data :
  {
    . = ALIGN(4);
    _sdata = .;        /* create a global symbol at data start */
    *(.data)           /* .data sections */
    *(.data*)          /* .data* sections */
    
    /* μT-Kernel initialized data */
    *(.data.knl_*)
    *(.data.tk_*)

    . = ALIGN(4);
    _edata = .;        /* define a global symbol at data end */
  } >APP_DATA AT> APP_CODE

  /* Uninitialized data section into APP_DATA */
  .bss :
  {
    . = ALIGN(4);
    _sbss = .;         /* define a global symbol at bss start */
    __bss_start__ = _sbss;
    *(.bss)
    *(.bss*)
    *(COMMON)
    
    /* μT-Kernel BSS */
    *(.bss.knl_*)
    *(.bss.tk_*)

    . = ALIGN(4);
    _ebss = .;         /* define a global symbol at bss end */
    __bss_end__ = _ebss;
  } >APP_DATA

  /* μT-Kernel system data in KERNEL_RAM */
  .kernel_data (NOLOAD) :
  {
    . = ALIGN(8);
    __kernel_data_start = .;
    *(.kernel_data)
    __kernel_data_end = .;
  } >KERNEL_RAM

  /* AI/NPU Workspace - aligned for NPU DMA */
  .ai_workspace (NOLOAD) :
  {
    . = ALIGN(64);  /* NPU DMA alignment requirement */
    PROVIDE(__ai_workspace_base = .);
    *(.ai_input)
    *(.ai_weights)
    *(.ai_output)
    *(.npu_scratch)
    PROVIDE(__ai_workspace_end = .);
    PROVIDE(__ai_workspace_size = __ai_workspace_end - __ai_workspace_base);
  } >AI_WORKSPACE

  /* DMA Buffers - non-cacheable region */
  .dma_buffer (NOLOAD) :
  {
    . = ALIGN(64);  /* DMA alignment */
    PROVIDE(__dma_buffer_base = .);
    *(.dma_rx)
    *(.dma_tx)
    *(.mdma_buffers)
    *(.camera_buffer)
    *(.display_buffer)
    PROVIDE(__dma_buffer_end = .);
    PROVIDE(__dma_buffer_size = __dma_buffer_end - __dma_buffer_base);
  } >DMA_BUFFER

  /* Non-cacheable section for coherent access */
  .noncacheable (NOLOAD) :
  {
    . = ALIGN(8);
    __snoncacheable = .;
    KEEP(*(noncacheable_buffer))
    . = ALIGN(8);
    __enoncacheable = .;
  } >DMA_BUFFER

  /* RTOS Heap */
  .heap (NOLOAD) :
  {
    . = ALIGN(8);
    PROVIDE(end = .);
    PROVIDE(_end = .);
    __heap_start = .;
    . = . + _Min_Heap_Size;
    __heap_end = .;
  } >RTOS_HEAP

  /* User heap stack section - checking memory availability */
  ._user_heap_stack :
  {
    . = ALIGN(8);
    . = . + _Min_Heap_Size;
    . = . + _Min_Stack_Size;
    . = ALIGN(8);
  } >RTOS_STACK

  /* GNU secure gateway stubs (if TrustZone is used) */
  .gnu.sgstubs :
  {
    . = ALIGN(4);
    *(.gnu.sgstubs*)
    . = ALIGN(4);
  } >SYSTEM_RAM

  /* Remove information from the compiler libraries */
  /DISCARD/ :
  {
    libc.a ( * )
    libm.a ( * )
    libgcc.a ( * )
  }

  .ARM.attributes 0 : { *(.ARM.attributes) }
}

/* Provide symbols for memory regions - useful for runtime checks */
PROVIDE(__system_ram_start = ORIGIN(SYSTEM_RAM));
PROVIDE(__system_ram_size = LENGTH(SYSTEM_RAM));
PROVIDE(__kernel_ram_start = ORIGIN(KERNEL_RAM));
PROVIDE(__kernel_ram_size = LENGTH(KERNEL_RAM));
PROVIDE(__app_code_start = ORIGIN(APP_CODE));
PROVIDE(__app_code_size = LENGTH(APP_CODE));
PROVIDE(__app_data_start = ORIGIN(APP_DATA));
PROVIDE(__app_data_size = LENGTH(APP_DATA));
PROVIDE(__ai_workspace_start = ORIGIN(AI_WORKSPACE));
PROVIDE(__ai_workspace_total_size = LENGTH(AI_WORKSPACE));
PROVIDE(__dma_buffer_start = ORIGIN(DMA_BUFFER));
PROVIDE(__dma_buffer_total_size = LENGTH(DMA_BUFFER));
PROVIDE(__rtos_heap_start = ORIGIN(RTOS_HEAP));
PROVIDE(__rtos_heap_size = LENGTH(RTOS_HEAP));
PROVIDE(__rtos_stack_start = ORIGIN(RTOS_STACK));
PROVIDE(__rtos_stack_size = LENGTH(RTOS_STACK));
