/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : extmem_manager.c
  * @version        : 1.0.0
  * @brief          : This file implements the extmem configuration
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

/* Includes ------------------------------------------------------------------*/
#include "extmem_manager.h"
#include <string.h>

/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* USER CODE BEGIN PV */
/* Private variables ---------------------------------------------------------*/

/* USER CODE END PV */

/* USER CODE BEGIN PFP */
/* Private function prototypes -----------------------------------------------*/

/* USER CODE END PFP */

/*
 * -- Insert your variables declaration here --
 */
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/*
 * -- Insert your external function declaration here --
 */
/* USER CODE BEGIN 1 */

/* USER CODE END 1 */

/**
  * Init External memory manager
  * @retval None
  */
void MX_EXTMEM_MANAGER_Init(void)
{

  /*   --  USER CODE BEGIN MX_EXTMEM_Init_PreTreatment  --   -- External memory disabled */

  /*   --  USER CODE END MX_EXTMEM_Init_PreTreatment  --   -- External memory disabled */

  /* Initialization of the memory parameters */
  /* External memory configuration disabled */

  /* EXTMEMORY_1 */
  /* extmem_list[0].MemType = EXTMEM_NOR_SFDP; -- Disabled */
  /* extmem_list[0].Handle = &hxspi1; -- Disabled */
  /* extmem_list[0].ConfigType = EXTMEM_LINK_CONFIG_8LINES; -- Disabled */

  /* EXTMEM_Init(EXTMEMORY_1, HAL_RCCEx_GetPeriphCLKFreq(RCC_PERIPHCLK_XSPI2)); -- External memory disabled */

  /*   --  USER CODE BEGIN MX_EXTMEM_Init_PostTreatment  --   -- External memory disabled */

  /*   --  USER CODE END MX_EXTMEM_Init_PostTreatment  --   -- External memory disabled */
}





