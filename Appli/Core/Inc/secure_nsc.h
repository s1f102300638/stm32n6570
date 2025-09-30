/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file    secure_nsc.h
  * @author  MCD Application Team
  * @brief   Header for secure_nsc.c file
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2025 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __SECURE_NSC_H
#define __SECURE_NSC_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include <stdint.h>

/* Exported types ------------------------------------------------------------*/
typedef enum
{
  SECURE_FAULT_CB_ID = 0x00U,
  GTZC_ERROR_CB_ID = 0x01U
} SECURE_CallbackIDTypeDef;

/* Exported constants --------------------------------------------------------*/
/* Exported macro ------------------------------------------------------------*/
/* Exported functions ------------------------------------------------------- */
void SECURE_RegisterCallback(SECURE_CallbackIDTypeDef CallbackId, void *func);

#ifdef __cplusplus
}
#endif

#endif /* __SECURE_NSC_H */
