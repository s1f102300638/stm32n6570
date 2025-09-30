################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/boot_hal.c \
../Core/Src/cache_operations.c \
../Core/Src/extmem_manager.c \
../Core/Src/isp_services_stub.c \
../Core/Src/main.c \
../Core/Src/npu_support.c \
../Core/Src/npu_support_extended.c \
../Core/Src/stm32n6xx_hal_msp.c \
../Core/Src/stm32n6xx_it.c \
../Core/Src/syscalls.c \
../Core/Src/sysmem.c \
../Core/Src/system_stm32n6xx_fsbl.c 

OBJS += \
./Core/Src/boot_hal.o \
./Core/Src/cache_operations.o \
./Core/Src/extmem_manager.o \
./Core/Src/isp_services_stub.o \
./Core/Src/main.o \
./Core/Src/npu_support.o \
./Core/Src/npu_support_extended.o \
./Core/Src/stm32n6xx_hal_msp.o \
./Core/Src/stm32n6xx_it.o \
./Core/Src/syscalls.o \
./Core/Src/sysmem.o \
./Core/Src/system_stm32n6xx_fsbl.o 

C_DEPS += \
./Core/Src/boot_hal.d \
./Core/Src/cache_operations.d \
./Core/Src/extmem_manager.d \
./Core/Src/isp_services_stub.d \
./Core/Src/main.d \
./Core/Src/npu_support.d \
./Core/Src/npu_support_extended.d \
./Core/Src/stm32n6xx_hal_msp.d \
./Core/Src/stm32n6xx_it.d \
./Core/Src/syscalls.d \
./Core/Src/sysmem.d \
./Core/Src/system_stm32n6xx_fsbl.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/%.o Core/Src/%.su Core/Src/%.cyclo: ../Core/Src/%.c Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m55 -std=gnu11 -g3 -DSTM32N657xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -D_STM32CUBE_DISCOVERY_N657_ -DLL_ATON_DUMP_DEBUG_API -DLL_ATON_PLATFORM=LL_ATON_PLAT_STM32N6 -DLL_ATON_OSAL=LL_ATON_OSAL_BARE_METAL -DLL_ATON_RT_MODE=LL_ATON_RT_ASYNC -DLL_ATON_SW_FALLBACK -DLL_ATON_EB_DBG_INFO -DLL_ATON_DBG_BUFFER_INFO_EXCLUDED=1 -DHAL_DCMIPP_MODULE_DISABLED -c -IC:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Core/Inc -IC:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/STM32N6xx_HAL_Driver/Inc -IC:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/CMSIS/Device/STM32N6xx/Include -IC:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/STM32N6xx_HAL_Driver/Inc/Legacy -IC:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/CMSIS/Include -I../../Middlewares/ST/STM32_ExtMem_Manager -I../../Middlewares/ST/STM32_ExtMem_Manager/sal -I../../Middlewares/ST/STM32_ExtMem_Manager/nor_sfdp -I../../Middlewares/ST/STM32_ExtMem_Manager/boot -Os -ffunction-sections -fdata-sections -Wall -Wno-strict-aliasing -u _printf_float -Wno-strict-aliasing -Wno-unused-function -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src

clean-Core-2f-Src:
	-$(RM) ./Core/Src/boot_hal.cyclo ./Core/Src/boot_hal.d ./Core/Src/boot_hal.o ./Core/Src/boot_hal.su ./Core/Src/cache_operations.cyclo ./Core/Src/cache_operations.d ./Core/Src/cache_operations.o ./Core/Src/cache_operations.su ./Core/Src/extmem_manager.cyclo ./Core/Src/extmem_manager.d ./Core/Src/extmem_manager.o ./Core/Src/extmem_manager.su ./Core/Src/isp_services_stub.cyclo ./Core/Src/isp_services_stub.d ./Core/Src/isp_services_stub.o ./Core/Src/isp_services_stub.su ./Core/Src/main.cyclo ./Core/Src/main.d ./Core/Src/main.o ./Core/Src/main.su ./Core/Src/npu_support.cyclo ./Core/Src/npu_support.d ./Core/Src/npu_support.o ./Core/Src/npu_support.su ./Core/Src/npu_support_extended.cyclo ./Core/Src/npu_support_extended.d ./Core/Src/npu_support_extended.o ./Core/Src/npu_support_extended.su ./Core/Src/stm32n6xx_hal_msp.cyclo ./Core/Src/stm32n6xx_hal_msp.d ./Core/Src/stm32n6xx_hal_msp.o ./Core/Src/stm32n6xx_hal_msp.su ./Core/Src/stm32n6xx_it.cyclo ./Core/Src/stm32n6xx_it.d ./Core/Src/stm32n6xx_it.o ./Core/Src/stm32n6xx_it.su ./Core/Src/syscalls.cyclo ./Core/Src/syscalls.d ./Core/Src/syscalls.o ./Core/Src/syscalls.su ./Core/Src/sysmem.cyclo ./Core/Src/sysmem.d ./Core/Src/sysmem.o ./Core/Src/sysmem.su ./Core/Src/system_stm32n6xx_fsbl.cyclo ./Core/Src/system_stm32n6xx_fsbl.d ./Core/Src/system_stm32n6xx_fsbl.o ./Core/Src/system_stm32n6xx_fsbl.su

.PHONY: clean-Core-2f-Src

