################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/BSP/STM32N6570-DK/stm32n6570_discovery.c \
../Drivers/BSP/STM32N6570-DK/stm32n6570_discovery_bus.c 

OBJS += \
./Drivers/BSP/STM32N6570-DK/stm32n6570_discovery.o \
./Drivers/BSP/STM32N6570-DK/stm32n6570_discovery_bus.o 

C_DEPS += \
./Drivers/BSP/STM32N6570-DK/stm32n6570_discovery.d \
./Drivers/BSP/STM32N6570-DK/stm32n6570_discovery_bus.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/STM32N6570-DK/%.o Drivers/BSP/STM32N6570-DK/%.su Drivers/BSP/STM32N6570-DK/%.cyclo: ../Drivers/BSP/STM32N6570-DK/%.c Drivers/BSP/STM32N6570-DK/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m55 -std=gnu11 -g3 -DSTM32N657xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -D_STM32CUBE_DISCOVERY_N657_ -DLL_ATON_DUMP_DEBUG_API -DLL_ATON_PLATFORM=LL_ATON_PLAT_STM32N6 -DLL_ATON_OSAL=LL_ATON_OSAL_BARE_METAL -DLL_ATON_RT_MODE=LL_ATON_RT_ASYNC -DLL_ATON_SW_FALLBACK -DLL_ATON_EB_DBG_INFO -DLL_ATON_DBG_BUFFER_INFO_EXCLUDED=1 -DHAL_DCMIPP_MODULE_DISABLED -c -IC:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Core/Inc -IC:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/STM32N6xx_HAL_Driver/Inc -IC:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/CMSIS/Device/STM32N6xx/Include -IC:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/STM32N6xx_HAL_Driver/Inc/Legacy -IC:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/CMSIS/Include -I../../Middlewares/ST/STM32_ExtMem_Manager -I../../Middlewares/ST/STM32_ExtMem_Manager/sal -I../../Middlewares/ST/STM32_ExtMem_Manager/nor_sfdp -I../../Middlewares/ST/STM32_ExtMem_Manager/boot -Os -ffunction-sections -fdata-sections -Wall -Wno-strict-aliasing -u _printf_float -Wno-strict-aliasing -Wno-unused-function -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-STM32N6570-2d-DK

clean-Drivers-2f-BSP-2f-STM32N6570-2d-DK:
	-$(RM) ./Drivers/BSP/STM32N6570-DK/stm32n6570_discovery.cyclo ./Drivers/BSP/STM32N6570-DK/stm32n6570_discovery.d ./Drivers/BSP/STM32N6570-DK/stm32n6570_discovery.o ./Drivers/BSP/STM32N6570-DK/stm32n6570_discovery.su ./Drivers/BSP/STM32N6570-DK/stm32n6570_discovery_bus.cyclo ./Drivers/BSP/STM32N6570-DK/stm32n6570_discovery_bus.d ./Drivers/BSP/STM32N6570-DK/stm32n6570_discovery_bus.o ./Drivers/BSP/STM32N6570-DK/stm32n6570_discovery_bus.su

.PHONY: clean-Drivers-2f-BSP-2f-STM32N6570-2d-DK

