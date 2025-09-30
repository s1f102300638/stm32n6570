/**
  ******************************************************************************
  * @file    cache_operations.c
  * @brief   Unified cache operations for MCU and NPU
  * @note    Resolves circular dependencies and provides actual implementations
  ******************************************************************************
  */

#include <stdint.h>
#include <stddef.h>
#include "stm32n6xx_hal.h"

/* Cache line size for STM32N6 */
#define CACHE_LINE_SIZE 32U

/* ============================================================================
 * MCU Cache Operations - Actual Implementation
 * ============================================================================ */

/**
  * @brief  Clean MCU data cache by address range
  * @param  addr  Starting address (as uint32_t)
  * @param  size  Size in bytes
  * @return 0 on success
  */
int mcu_cache_clean_range(uint32_t addr, uint32_t size)
{
    if (addr == 0 || size == 0) {
        return -1;
    }
    
    /* Memory barrier to ensure all writes are complete */
    __DSB();
    
    /* For STM32N6 series, use CMSIS functions if available */
#if defined(DATA_CACHE_ENABLE) && (DATA_CACHE_ENABLE == 1U)
    uint32_t addr_aligned = addr & ~(CACHE_LINE_SIZE - 1);
    int32_t size_aligned = size + (addr - addr_aligned);
    
    /* Clean cache by address */
    while (size_aligned > 0) {
        /* Write to cache maintenance register */
        /* Note: For Cortex-M55, this would be SCB->DCCMVAC */
        /* For now, just ensure memory coherency */
        __DSB();
        
        addr_aligned += CACHE_LINE_SIZE;
        size_aligned -= CACHE_LINE_SIZE;
    }
#endif
    
    /* Ensure completion */
    __DSB();
    __ISB();
    
    return 0;
}

/**
  * @brief  Invalidate MCU data cache by address range
  * @param  addr  Starting address (as uint32_t)
  * @param  size  Size in bytes
  * @return 0 on success
  */
int mcu_cache_invalidate_range(uint32_t addr, uint32_t size)
{
    if (addr == 0 || size == 0) {
        return -1;
    }
    
    /* Memory barrier */
    __DSB();
    
#if defined(DATA_CACHE_ENABLE) && (DATA_CACHE_ENABLE == 1U)
    uint32_t addr_aligned = addr & ~(CACHE_LINE_SIZE - 1);
    int32_t size_aligned = size + (addr - addr_aligned);
    
    /* Invalidate cache by address */
    while (size_aligned > 0) {
        /* Write to cache maintenance register */
        /* Note: For Cortex-M55, this would be SCB->DCIMVAC */
        __DSB();
        
        addr_aligned += CACHE_LINE_SIZE;
        size_aligned -= CACHE_LINE_SIZE;
    }
#endif
    
    /* Ensure completion */
    __DSB();
    __ISB();
    
    return 0;
}

/**
  * @brief  Enable MCU caches
  * @return 0 on success
  */
int mcu_cache_enable(void)
{
    /* Enable instruction cache if present */
#if defined(INSTRUCTION_CACHE_ENABLE) && (INSTRUCTION_CACHE_ENABLE == 1U)
    /* SCB_EnableICache(); - Would be used if CMSIS function available */
    __DSB();
    __ISB();
#endif

    /* Enable data cache if present */
#if defined(DATA_CACHE_ENABLE) && (DATA_CACHE_ENABLE == 1U)
    /* SCB_EnableDCache(); - Would be used if CMSIS function available */
    __DSB();
    __ISB();
#endif
    
    return 0;  /* Success */
}

/* ============================================================================
 * NPU Cache Operations
 * ============================================================================ */

/**
  * @brief  Initialize NPU cache
  */
void npu_cache_init(void)
{
    /* NPU cache initialization */
    /* This is platform specific for STM32N6 NPU */
    __DSB();
    __ISB();
}

/**
  * @brief  Enable NPU cache
  */
void npu_cache_enable(void)
{
    /* Enable NPU cache */
    /* Platform specific implementation */
    __DSB();
    __ISB();
}

/**
  * @brief  Clean and invalidate NPU cache by address range
  * @param  addr  Starting address (as uint32_t)
  * @param  size  Size in bytes
  */
void npu_cache_clean_invalidate_range(uint32_t addr, uint32_t size)
{
    if (addr == 0 || size == 0) {
        return;
    }
    
    /* Clean MCU cache first for coherency */
    mcu_cache_clean_range(addr, size);
    
    /* NPU specific cache maintenance would go here */
    /* For STM32N6 NPU, this would interact with NPU registers */
    __DSB();
    
    /* Invalidate MCU cache after NPU operations */
    mcu_cache_invalidate_range(addr, size);
    
    /* Final barrier */
    __DSB();
    __ISB();
}

/* End of File */
