/**
  ******************************************************************************
  * @file    npu_support.h
  * @brief   NPU support header for X-CUBE-AI YOLO model
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2024 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __NPU_SUPPORT_H
#define __NPU_SUPPORT_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

/* Exported types ------------------------------------------------------------*/
typedef enum {
    NPU_OK = 0,
    NPU_ERROR = -1,
    NPU_INVALID_PARAM = -2,
    NPU_TIMEOUT = -3
} NPU_Status_t;

/* Exported constants --------------------------------------------------------*/
#define NPU_POOL_TYPE_MAX  0
#define NPU_POOL_TYPE_AVG  1

#define NPU_OP_ADD      0
#define NPU_OP_SUB      1
#define NPU_OP_MUL      2
#define NPU_OP_DIV      3
#define NPU_OP_RELU     4
#define NPU_OP_SIGMOID  5

/* Exported macro ------------------------------------------------------------*/

/* Exported functions prototypes ---------------------------------------------*/

/* NPU Switch Control Functions */
int32_t LL_Switch_Init(void);

/* NPU Library Functions */
int32_t LL_ATON_LIB_Concat(void *dst, const void *src1, const void *src2, void *params);
int32_t LL_ATON_LIB_DMA_DepthToSpace(void *dst, const void *src,
                                     uint32_t width, uint32_t height,
                                     uint32_t channels, uint32_t block_size);
int32_t LL_ATON_LIB_Pad(void *dst, const void *src, void *params);

/* Cache Management Functions - Match the types in mcu_cache.h and npu_cache.h */
int mcu_cache_clean_range(uint32_t addr, uint32_t size);
int mcu_cache_invalidate_range(uint32_t addr, uint32_t size);
void npu_cache_clean_invalidate_range(uint32_t addr, uint32_t size);
int mcu_cache_enable(void);  /* Changed from void to int to match mcu_cache.h */
void npu_cache_init(void);
void npu_cache_enable(void);

/* Software Fallback Functions */
int32_t ll_sw_forward_arith(void *output, const void *input1, 
                            const void *input2, uint32_t operation,
                            uint32_t size);
int32_t ll_sw_forward_pool(void *output, const void *input,
                           uint32_t width, uint32_t height,
                           uint32_t channels, uint32_t pool_size,
                           uint32_t stride, uint32_t pool_type);

/* Initialization and Status Functions */
void NPU_Support_Init(void);
const char* NPU_Support_GetVersion(void);
bool NPU_Support_IsInitialized(void);

#ifdef __cplusplus
}
#endif

#endif /* __NPU_SUPPORT_H */
