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
	arm-none-eabi-gcc "$<" -mcpu=cortex-m55 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32N657xx -D_STM32CUBE_DISCOVERY_N657_ -c -I../Core/Inc -I../mtk3_bsp2/include -I../../Secure_nsclib -I../../Drivers/STM32N6xx_HAL_Driver/Inc -I../../Drivers/CMSIS/Device/ST/STM32N6xx/Include -I../../Drivers/STM32N6xx_HAL_Driver/Inc/Legacy -I../../Drivers/BSP/STM32N6570-DK -I../../Drivers/CMSIS/Include -I"C:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/Appli/mtk3_bsp2" -I"C:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/Appli/mtk3_bsp2/config" -I"C:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/Appli/mtk3_bsp2/include" -I"C:/Users/iniad/STM32CubeIDE/workspace_2/mtk3bsp2_stm32n657/Appli/mtk3_bsp2/mtkernel/kernel/knlinc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-Components-2f-IMX335

clean-Drivers-2f-BSP-2f-Components-2f-IMX335:
	-$(RM) ./Drivers/BSP/Components/IMX335/imx335.cyclo ./Drivers/BSP/Components/IMX335/imx335.d ./Drivers/BSP/Components/IMX335/imx335.o ./Drivers/BSP/Components/IMX335/imx335.su ./Drivers/BSP/Components/IMX335/imx335_reg.cyclo ./Drivers/BSP/Components/IMX335/imx335_reg.d ./Drivers/BSP/Components/IMX335/imx335_reg.o ./Drivers/BSP/Components/IMX335/imx335_reg.su

.PHONY: clean-Drivers-2f-BSP-2f-Components-2f-IMX335

