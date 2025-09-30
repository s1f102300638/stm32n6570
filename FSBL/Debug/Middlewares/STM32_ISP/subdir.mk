################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/STM32_ISP/isp_algo.c \
../Middlewares/STM32_ISP/isp_core.c \
../Middlewares/STM32_ISP/isp_services.c 

OBJS += \
./Middlewares/STM32_ISP/isp_algo.o \
./Middlewares/STM32_ISP/isp_core.o \
./Middlewares/STM32_ISP/isp_services.o 

C_DEPS += \
./Middlewares/STM32_ISP/isp_algo.d \
./Middlewares/STM32_ISP/isp_core.d \
./Middlewares/STM32_ISP/isp_services.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/STM32_ISP/%.o Middlewares/STM32_ISP/%.su Middlewares/STM32_ISP/%.cyclo: ../Middlewares/STM32_ISP/%.c Middlewares/STM32_ISP/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m55 -std=gnu11 -g3 -DSTM32N657xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -D_STM32CUBE_DISCOVERY_N657_ -DLL_ATON_DUMP_DEBUG_API -DLL_ATON_PLATFORM=LL_ATON_PLAT_STM32N6 -DLL_ATON_OSAL=LL_ATON_OSAL_BARE_METAL -DLL_ATON_RT_MODE=LL_ATON_RT_ASYNC -DLL_ATON_SW_FALLBACK -DLL_ATON_EB_DBG_INFO -DLL_ATON_DBG_BUFFER_INFO_EXCLUDED=1 -DHAL_DCMIPP_MODULE_DISABLED -c -IC:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/Middlewares/ST/STM32_ExtMem_Manager/sal -IC:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/Middlewares/ST/STM32_ExtMem_Manager/nor_sfdp -I"C:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Core/Inc" -I"C:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/STM32N6xx_HAL_Driver/Inc" -I"C:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/CMSIS/Device/STM32N6xx/Include" -I"C:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/STM32N6xx_HAL_Driver/Inc/Legacy" -I"C:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/CMSIS/Include" -Os -ffunction-sections -fdata-sections -Wall -Wno-strict-aliasing -u _printf_float -Wno-strict-aliasing -Wno-unused-function -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-STM32_ISP

clean-Middlewares-2f-STM32_ISP:
	-$(RM) ./Middlewares/STM32_ISP/isp_algo.cyclo ./Middlewares/STM32_ISP/isp_algo.d ./Middlewares/STM32_ISP/isp_algo.o ./Middlewares/STM32_ISP/isp_algo.su ./Middlewares/STM32_ISP/isp_core.cyclo ./Middlewares/STM32_ISP/isp_core.d ./Middlewares/STM32_ISP/isp_core.o ./Middlewares/STM32_ISP/isp_core.su ./Middlewares/STM32_ISP/isp_services.cyclo ./Middlewares/STM32_ISP/isp_services.d ./Middlewares/STM32_ISP/isp_services.o ./Middlewares/STM32_ISP/isp_services.su

.PHONY: clean-Middlewares-2f-STM32_ISP

