################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/BSP/Components/IMX335/imx335.c \
../Drivers/BSP/Components/IMX335/imx335_reg.c 

OBJS += \
./Drivers/BSP/Components/IMX335/imx335.o \
./Drivers/BSP/Components/IMX335/imx335_reg.o 

C_DEPS += \
./Drivers/BSP/Components/IMX335/imx335.d \
./Drivers/BSP/Components/IMX335/imx335_reg.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/Components/IMX335/%.o Drivers/BSP/Components/IMX335/%.su Drivers/BSP/Components/IMX335/%.cyclo: ../Drivers/BSP/Components/IMX335/%.c Drivers/BSP/Components/IMX335/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m55 -std=gnu11 -g3 -DSTM32N657xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -D_STM32CUBE_DISCOVERY_N657_ -DLL_ATON_DUMP_DEBUG_API -DLL_ATON_PLATFORM=LL_ATON_PLAT_STM32N6 -DLL_ATON_OSAL=LL_ATON_OSAL_BARE_METAL -DLL_ATON_RT_MODE=LL_ATON_RT_ASYNC -DLL_ATON_SW_FALLBACK -DLL_ATON_EB_DBG_INFO -DLL_ATON_DBG_BUFFER_INFO_EXCLUDED=1 -DHAL_DCMIPP_MODULE_DISABLED -c -IC:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Core/Inc -IC:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/STM32N6xx_HAL_Driver/Inc -IC:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/CMSIS/Device/STM32N6xx/Include -IC:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/STM32N6xx_HAL_Driver/Inc/Legacy -IC:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/CMSIS/Include -I../../Middlewares/ST/STM32_ExtMem_Manager -I../../Middlewares/ST/STM32_ExtMem_Manager/sal -I../../Middlewares/ST/STM32_ExtMem_Manager/nor_sfdp -I../../Middlewares/ST/STM32_ExtMem_Manager/boot -Os -ffunction-sections -fdata-sections -Wall -Wno-strict-aliasing -u _printf_float -Wno-strict-aliasing -Wno-unused-function -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-Components-2f-IMX335

clean-Drivers-2f-BSP-2f-Components-2f-IMX335:
	-$(RM) ./Drivers/BSP/Components/IMX335/imx335.cyclo ./Drivers/BSP/Components/IMX335/imx335.d ./Drivers/BSP/Components/IMX335/imx335.o ./Drivers/BSP/Components/IMX335/imx335.su ./Drivers/BSP/Components/IMX335/imx335_reg.cyclo ./Drivers/BSP/Components/IMX335/imx335_reg.d ./Drivers/BSP/Components/IMX335/imx335_reg.o ./Drivers/BSP/Components/IMX335/imx335_reg.su

.PHONY: clean-Drivers-2f-BSP-2f-Components-2f-IMX335

