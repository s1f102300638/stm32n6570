################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32f4.c \
../mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32f7.c \
../mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32g4.c \
../mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32h7.c \
../mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32l4.c \
../mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32n6.c 

OBJS += \
./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32f4.o \
./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32f7.o \
./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32g4.o \
./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32h7.o \
./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32l4.o \
./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32n6.o 

C_DEPS += \
./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32f4.d \
./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32f7.d \
./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32g4.d \
./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32h7.d \
./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32l4.d \
./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32n6.d 


# Each subdirectory must supply rules for building sources it contributes
mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/%.o mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/%.su mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/%.cyclo: ../mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/%.c mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m55 -std=gnu11 -g3 -DSTM32N657xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -D_STM32CUBE_DISCOVERY_N657_ -DLL_ATON_DUMP_DEBUG_API -DLL_ATON_PLATFORM=LL_ATON_PLAT_STM32N6 -DLL_ATON_OSAL=LL_ATON_OSAL_BARE_METAL -DLL_ATON_RT_MODE=LL_ATON_RT_ASYNC -DLL_ATON_SW_FALLBACK -DLL_ATON_EB_DBG_INFO -DLL_ATON_DBG_BUFFER_INFO_EXCLUDED=1 -DHAL_DCMIPP_MODULE_DISABLED -c -I"C:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Core/Inc" -I"C:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/BSP/STM32N6570-DK" -I"C:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/STM32N6xx_HAL_Driver/Inc" -I"C:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/CMSIS/Device/STM32N6xx/Include" -I"C:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/STM32N6xx_HAL_Driver/Inc/Legacy" -I"C:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/CMSIS/Include" -I"C:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/BSP/Components/IMX335" -I"C:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/BSP/Components/Common" -I"C:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/BSP/Components/rk050hr18" -I"C:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Middlewares/STM32_ISP/evision/inc" -I"C:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Middlewares/STM32_ISP/inc" -I../../Drivers/STM32N6xx_HAL_Driver/Inc -I../../Middlewares/ST/AI/Npu/Devices/STM32N6XX -I../../FSBL/X-CUBE-AI/App -I../../Middlewares/ST/AI/Inc -I../../Middlewares/ST/AI/Npu/ll_aton -Os -ffunction-sections -fdata-sections -Wall -Wno-strict-aliasing -u _printf_float -Wno-strict-aliasing -Wno-unused-function -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-mtk3_bsp2_deleted-2f-sysdepend-2f-stm32_cube-2f-device-2f-hal_adc-2f-sysdepend

clean-mtk3_bsp2_deleted-2f-sysdepend-2f-stm32_cube-2f-device-2f-hal_adc-2f-sysdepend:
	-$(RM) ./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32f4.cyclo ./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32f4.d ./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32f4.o ./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32f4.su ./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32f7.cyclo ./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32f7.d ./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32f7.o ./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32f7.su ./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32g4.cyclo ./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32g4.d ./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32g4.o ./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32g4.su ./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32h7.cyclo ./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32h7.d ./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32h7.o ./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32h7.su ./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32l4.cyclo ./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32l4.d ./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32l4.o ./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32l4.su ./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32n6.cyclo ./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32n6.d ./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32n6.o ./mtk3_bsp2_deleted/sysdepend/stm32_cube/device/hal_adc/sysdepend/hal_adc_stm32n6.su

.PHONY: clean-mtk3_bsp2_deleted-2f-sysdepend-2f-stm32_cube-2f-device-2f-hal_adc-2f-sysdepend

