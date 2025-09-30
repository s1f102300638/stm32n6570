/**
  ******************************************************************************
  * @file    boot_hal.c
  * @brief   Boot HAL module driver.
  *          This file provides firmware functions to manage the following
  *          functionalities of the boot:
  *           + Application jump
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

/* Includes ------------------------------------------------------------------*/
#include "stm32n6xx_hal.h"
#include "boot_hal.h"

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Application load address in internal RAM */
#define APPLICATION_ADDRESS     0x34000400  /* Appli starts at this address */

/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/**
  * @brief  Launch the application
  * @retval BOOT Status
  */
BOOTStatus_TypeDef BOOT_Application(void)
{
    /* Get application stack pointer */
    uint32_t appStack = *((uint32_t*)APPLICATION_ADDRESS);
    
    /* Get application reset handler address */
    uint32_t appEntry = *((uint32_t*)(APPLICATION_ADDRESS + 4));
    
    /* Check stack pointer is in valid RAM range */
    if ((appStack & 0xFF000000) != 0x34000000)
    {
        return BOOT_ERROR_NOBASEADDRESS;  /* Use the correct enum value */
    }
    
    /* Disable all interrupts */
    __disable_irq();
    
    /* Disable SysTick */
    SysTick->CTRL = 0;
    SysTick->LOAD = 0;
    SysTick->VAL = 0;
    
    /* Clear all pending interrupts */
    for (uint32_t i = 0; i < 8; i++)
    {
        NVIC->ICPR[i] = 0xFFFFFFFF;
    }
    
    /* Set Vector Table Offset Register */
    SCB->VTOR = APPLICATION_ADDRESS;
    
    /* Set stack pointer */
    __set_MSP(appStack);
    
    /* Memory barrier */
    __DSB();
    __ISB();
    
    /* Jump to application */
    void (*app_reset_handler)(void) = (void(*)(void))(appEntry);
    app_reset_handler();
    
    /* Should never reach here */
    return BOOT_OK;  /* Add return statement */
}
