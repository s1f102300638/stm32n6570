################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal.c \
../Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_cortex.c \
../Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_dcmipp.c \
../Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_dma.c \
../Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_dma_ex.c \
../Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_exti.c \
../Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_gpio.c \
../Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_i2c.c \
../Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_i2c_ex.c \
../Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_icache.c \
../Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_ltdc.c \
../Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_pwr.c \
../Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_pwr_ex.c \
../Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_ramcfg.c \
../Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_rcc.c \
../Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_rcc_ex.c \
../Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_rif.c \
../Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_uart.c \
../Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_uart_ex.c 

OBJS += \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal.o \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_cortex.o \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_dcmipp.o \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_dma.o \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_dma_ex.o \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_exti.o \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_gpio.o \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_i2c.o \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_i2c_ex.o \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_icache.o \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_ltdc.o \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_pwr.o \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_pwr_ex.o \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_ramcfg.o \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_rcc.o \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_rcc_ex.o \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_rif.o \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_uart.o \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_uart_ex.o 

C_DEPS += \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal.d \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_cortex.d \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_dcmipp.d \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_dma.d \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_dma_ex.d \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_exti.d \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_gpio.d \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_i2c.d \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_i2c_ex.d \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_icache.d \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_ltdc.d \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_pwr.d \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_pwr_ex.d \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_ramcfg.d \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_rcc.d \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_rcc_ex.d \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_rif.d \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_uart.d \
./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_uart_ex.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/STM32N6xx_HAL_Driver/%.o Drivers/STM32N6xx_HAL_Driver/%.su Drivers/STM32N6xx_HAL_Driver/%.cyclo: ../Drivers/STM32N6xx_HAL_Driver/%.c Drivers/STM32N6xx_HAL_Driver/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m55 -std=gnu11 -g3 -DSTM32N657xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -D_STM32CUBE_DISCOVERY_N657_ -DLL_ATON_DUMP_DEBUG_API -DLL_ATON_PLATFORM=LL_ATON_PLAT_STM32N6 -DLL_ATON_OSAL=LL_ATON_OSAL_BARE_METAL -DLL_ATON_RT_MODE=LL_ATON_RT_ASYNC -DLL_ATON_SW_FALLBACK -DLL_ATON_EB_DBG_INFO -DLL_ATON_DBG_BUFFER_INFO_EXCLUDED=1 -DHAL_DCMIPP_MODULE_DISABLED -c -IC:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Core/Inc -IC:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/STM32N6xx_HAL_Driver/Inc -IC:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/CMSIS/Device/STM32N6xx/Include -IC:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/STM32N6xx_HAL_Driver/Inc/Legacy -IC:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/FSBL/Drivers/CMSIS/Include -I../../Middlewares/ST/STM32_ExtMem_Manager -I../../Middlewares/ST/STM32_ExtMem_Manager/sal -I../../Middlewares/ST/STM32_ExtMem_Manager/nor_sfdp -I../../Middlewares/ST/STM32_ExtMem_Manager/boot -Os -ffunction-sections -fdata-sections -Wall -Wno-strict-aliasing -u _printf_float -Wno-strict-aliasing -Wno-unused-function -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-STM32N6xx_HAL_Driver

clean-Drivers-2f-STM32N6xx_HAL_Driver:
	-$(RM) ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal.cyclo ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal.d ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal.o ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal.su ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_cortex.cyclo ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_cortex.d ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_cortex.o ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_cortex.su ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_dcmipp.cyclo ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_dcmipp.d ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_dcmipp.o ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_dcmipp.su ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_dma.cyclo ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_dma.d ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_dma.o ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_dma.su ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_dma_ex.cyclo ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_dma_ex.d ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_dma_ex.o ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_dma_ex.su ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_exti.cyclo ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_exti.d ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_exti.o ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_exti.su ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_gpio.cyclo ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_gpio.d ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_gpio.o ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_gpio.su ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_i2c.cyclo ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_i2c.d ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_i2c.o ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_i2c.su ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_i2c_ex.cyclo ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_i2c_ex.d ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_i2c_ex.o ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_i2c_ex.su ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_icache.cyclo ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_icache.d ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_icache.o ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_icache.su ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_ltdc.cyclo ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_ltdc.d ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_ltdc.o ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_ltdc.su ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_pwr.cyclo ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_pwr.d ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_pwr.o ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_pwr.su ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_pwr_ex.cyclo ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_pwr_ex.d ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_pwr_ex.o ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_pwr_ex.su ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_ramcfg.cyclo ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_ramcfg.d ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_ramcfg.o ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_ramcfg.su ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_rcc.cyclo ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_rcc.d ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_rcc.o ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_rcc.su ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_rcc_ex.cyclo ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_rcc_ex.d ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_rcc_ex.o ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_rcc_ex.su ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_rif.cyclo ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_rif.d ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_rif.o ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_rif.su ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_uart.cyclo ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_uart.d ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_uart.o ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_uart.su ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_uart_ex.cyclo ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_uart_ex.d ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_uart_ex.o ./Drivers/STM32N6xx_HAL_Driver/stm32n6xx_hal_uart_ex.su

.PHONY: clean-Drivers-2f-STM32N6xx_HAL_Driver

