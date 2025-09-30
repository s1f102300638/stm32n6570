/**
  ******************************************************************************
  * @file    memory_optimization.h
  * @brief   Memory optimization configurations and recommendations
  ******************************************************************************
  */

#ifndef __MEMORY_OPTIMIZATION_H
#define __MEMORY_OPTIMIZATION_H

/* ============================================================================
 * IMPORTANT: RAM Overflow Solution
 * 
 * The project is experiencing a RAM overflow of approximately 1.9MB.
 * This is likely due to the YOLO model's large memory requirements.
 * 
 * SOLUTIONS:
 * 
 * 1. Modify the linker script (STM32N657X0HXQ_AXISRAM2_fsbl.ld):
 *    - Increase RAM size allocation
 *    - Use external SDRAM if available
 * 
 * 2. Optimize the YOLO model:
 *    - Reduce model size
 *    - Use quantization
 *    - Reduce batch size to 1
 * 
 * 3. Use dynamic memory allocation from external memory
 * ============================================================================ */

/* Memory sections configuration */
#define USE_EXTERNAL_SDRAM      1
#define SDRAM_BASE_ADDRESS      0xD0000000
#define SDRAM_SIZE              (8 * 1024 * 1024)  /* 8MB */

/* Model optimization flags */
#define YOLO_USE_QUANTIZATION   1
#define YOLO_BATCH_SIZE         1
#define YOLO_USE_FP16          1

/* Memory pool sizes */
#define AI_NETWORK_HEAP_SIZE    (2 * 1024 * 1024)  /* 2MB for AI network */
#define AI_WORKING_BUFFER_SIZE  (1 * 1024 * 1024)  /* 1MB working buffer */

/* Linker script modifications needed:
 * 
 * In STM32N657X0HXQ_AXISRAM2_fsbl.ld, modify:
 * 
 * MEMORY
 * {
 *   RAM    (xrw)    : ORIGIN = 0x20000000, LENGTH = 768K  <- Increase if possible
 *   AXISRAM2 (xrw)  : ORIGIN = 0x24000000, LENGTH = 1536K <- Use for AI buffers
 *   SDRAM  (xrw)    : ORIGIN = 0xD0000000, LENGTH = 8192K <- Add if available
 * }
 * 
 * Add sections:
 * 
 * .ai_buffers (NOLOAD) :
 * {
 *   . = ALIGN(32);
 *   _ai_buffers_start = .;
 *   *(.ai_network_buffers)
 *   *(.ai_working_buffers)
 *   _ai_buffers_end = .;
 * } > AXISRAM2
 * 
 * .sdram_section (NOLOAD) :
 * {
 *   . = ALIGN(32);
 *   _sdram_start = .;
 *   *(.sdram_data)
 *   _sdram_end = .;
 * } > SDRAM
 */

/* Allocate AI buffers in special sections */
#ifdef USE_SPECIAL_SECTIONS
  #define AI_BUFFER_SECTION __attribute__((section(".ai_network_buffers")))
  #define SDRAM_SECTION     __attribute__((section(".sdram_data")))
#else
  #define AI_BUFFER_SECTION
  #define SDRAM_SECTION
#endif

/* Function to initialize external memory */
static inline void External_Memory_Init(void)
{
#if USE_EXTERNAL_SDRAM
    /* Initialize SDRAM controller */
    /* This is platform specific - implement based on your hardware */
    
    /* Example for FMC SDRAM initialization */
    /* FMC_SDRAM_Init(); */
#endif
}

/* Recommendations for main.c modifications:
 * 
 * 1. Add External_Memory_Init() call in main() before AI initialization
 * 2. Allocate AI buffers in external memory:
 *    
 *    static uint8_t ai_network_buffer[AI_NETWORK_HEAP_SIZE] AI_BUFFER_SECTION;
 *    static uint8_t ai_working_buffer[AI_WORKING_BUFFER_SIZE] AI_BUFFER_SECTION;
 * 
 * 3. Consider using memory pools for dynamic allocation
 */

#endif /* __MEMORY_OPTIMIZATION_H */
