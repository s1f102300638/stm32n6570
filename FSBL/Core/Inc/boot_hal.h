/**
  ******************************************************************************
  * @file    boot_hal.h
  * @brief   Header for boot_hal.c module
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

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __BOOT_HAL_H
#define __BOOT_HAL_H

#ifdef __cplusplus
 extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32_boot_lrun.h"

/* Exported types ------------------------------------------------------------*/
/* Exported constants --------------------------------------------------------*/
/* Note: BOOT_OK and BOOT_ERROR are now defined in stm32_boot_lrun.h as part of BOOTStatus_TypeDef enum */

/* Exported macro ------------------------------------------------------------*/
/* Exported functions ------------------------------------------------------- */
/* Note: BOOT_Application is now declared in stm32_boot_lrun.h with return type BOOTStatus_TypeDef */

#ifdef __cplusplus
}
#endif

#endif /* __BOOT_HAL_H */
