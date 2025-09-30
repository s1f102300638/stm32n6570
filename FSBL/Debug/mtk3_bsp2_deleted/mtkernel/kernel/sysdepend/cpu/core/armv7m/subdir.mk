################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/cpu_cntl.c \
../mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/exc_hdr.c \
../mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/interrupt.c \
../mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/reset_hdl.c 

S_UPPER_SRCS += \
../mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/dispatch.S 

OBJS += \
./mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/cpu_cntl.o \
./mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/dispatch.o \
./mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/exc_hdr.o \
./mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/interrupt.o \
./mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/reset_hdl.o 

S_UPPER_DEPS += \
./mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/dispatch.d 

C_DEPS += \
./mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/cpu_cntl.d \
./mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/exc_hdr.d \
./mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/interrupt.d \
./mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/reset_hdl.d 


# Each subdirectory must supply rules for building sources it contributes
mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/%.o mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/%.su mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/%.cyclo: ../mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/%.c mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m55 -std=gnu11 -g3 -DSTM32N657xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -D_STM32CUBE_DISCOVERY_N657_ -DLL_ATON_DUMP_DEBUG_API -DLL_ATON_PLATFORM=LL_ATON_PLAT_STM32N6 -DLL_ATON_OSAL=LL_ATON_OSAL_BARE_METAL -DLL_ATON_RT_MODE=LL_ATON_RT_ASYNC -DLL_ATON_SW_FALLBACK -DLL_ATON_EB_DBG_INFO -DLL_ATON_DBG_BUFFER_INFO_EXCLUDED=1 -DHAL_DCMIPP_MODULE_DISABLED -c -I"C:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Core/Inc" -I"C:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/BSP/STM32N6570-DK" -I"C:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/STM32N6xx_HAL_Driver/Inc" -I"C:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/CMSIS/Device/STM32N6xx/Include" -I"C:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/STM32N6xx_HAL_Driver/Inc/Legacy" -I"C:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/CMSIS/Include" -I"C:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/BSP/Components/IMX335" -I"C:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/BSP/Components/Common" -I"C:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/BSP/Components/rk050hr18" -I"C:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Middlewares/STM32_ISP/evision/inc" -I"C:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Middlewares/STM32_ISP/inc" -I../../Drivers/STM32N6xx_HAL_Driver/Inc -I../../Middlewares/ST/AI/Npu/Devices/STM32N6XX -I../../FSBL/X-CUBE-AI/App -I../../Middlewares/ST/AI/Inc -I../../Middlewares/ST/AI/Npu/ll_aton -Os -ffunction-sections -fdata-sections -Wall -Wno-strict-aliasing -u _printf_float -Wno-strict-aliasing -Wno-unused-function -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/%.o: ../mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/%.S mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m55 -g3 -D_STM32CUBE_DISCOVERY_N657_ -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-mtk3_bsp2_deleted-2f-mtkernel-2f-kernel-2f-sysdepend-2f-cpu-2f-core-2f-armv7m

clean-mtk3_bsp2_deleted-2f-mtkernel-2f-kernel-2f-sysdepend-2f-cpu-2f-core-2f-armv7m:
	-$(RM) ./mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/cpu_cntl.cyclo ./mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/cpu_cntl.d ./mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/cpu_cntl.o ./mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/cpu_cntl.su ./mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/dispatch.d ./mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/dispatch.o ./mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/exc_hdr.cyclo ./mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/exc_hdr.d ./mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/exc_hdr.o ./mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/exc_hdr.su ./mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/interrupt.cyclo ./mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/interrupt.d ./mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/interrupt.o ./mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/interrupt.su ./mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/reset_hdl.cyclo ./mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/reset_hdl.d ./mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/reset_hdl.o ./mtk3_bsp2_deleted/mtkernel/kernel/sysdepend/cpu/core/armv7m/reset_hdl.su

.PHONY: clean-mtk3_bsp2_deleted-2f-mtkernel-2f-kernel-2f-sysdepend-2f-cpu-2f-core-2f-armv7m

