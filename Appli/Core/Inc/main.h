/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
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
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

#if defined ( __ICCARM__ )
#  define CMSE_NS_CALL  __cmse_nonsecure_call
#  define CMSE_NS_ENTRY __cmse_nonsecure_entry
#else
#  define CMSE_NS_CALL  __attribute((cmse_nonsecure_call))
#  define CMSE_NS_ENTRY __attribute((cmse_nonsecure_entry))
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32n6xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "stm32n6570_discovery.h"
#include "stm32n6570_discovery_bus.h"
#include "imx335.h"
#include "camera.h"
#include "rk050hr18.h"
#include "isp_api.h"
#include "imx335_E27_isp_param_conf.h"
/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* Function pointer declaration in non-secure*/
#if defined ( __ICCARM__ )
typedef void (CMSE_NS_CALL *funcptr)(void);
#else
typedef void CMSE_NS_CALL (*funcptr)(void);
#endif

/* typedef for non-secure callback functions */
typedef funcptr funcptr_NS;

/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define OSC_IN_Pin GPIO_PIN_0
#define OSC_IN_GPIO_Port GPIOH
#define I2C1_SDA_Pin GPIO_PIN_1
#define I2C1_SDA_GPIO_Port GPIOC
#define OSC_OUT_Pin GPIO_PIN_1
#define OSC_OUT_GPIO_Port GPIOH
#define I2C1_SCL_Pin GPIO_PIN_9
#define I2C1_SCL_GPIO_Port GPIOH
#define User_Pin GPIO_PIN_13
#define User_GPIO_Port GPIOC
#define UCPD1_VSENSE_Pin GPIO_PIN_11
#define UCPD1_VSENSE_GPIO_Port GPIOA

/* USER CODE BEGIN Private defines */
/* Camera Configuration */
#define USE_COM_LOG 1
#define CAMERA_IMX335_ADDRESS 0x34U
#define FRAME_WIDTH  800
#define FRAME_HEIGHT 480
#define FRAME_BUFFER_SIZE (FRAME_WIDTH * FRAME_HEIGHT * 2)
#define BUFFER_ADDRESS  0x34200000  /* AXISRAM3 */

/* Note: GPIO_ODR macro is defined in sysdef.h (microT-Kernel) */
/* Do not redefine it here to avoid conflicts */

/* External handles for camera */
extern DCMIPP_HandleTypeDef hdcmipp;
extern LTDC_HandleTypeDef hltdc;
extern ISP_HandleTypeDef hcamera_isp;
/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */
