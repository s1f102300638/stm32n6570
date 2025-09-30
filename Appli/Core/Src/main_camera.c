/**
  ******************************************************************************
  * @file           : main_camera.c
  * @brief          : Camera integration code for DCMIPP and ISP
  ******************************************************************************
  * This file contains camera initialization and helper functions
  * integrated from prj_stm32n6_cam
  ******************************************************************************
  */

#include "main.h"

/* Private variables ---------------------------------------------------------*/
DCMIPP_HandleTypeDef hdcmipp;
LTDC_HandleTypeDef hltdc;
ISP_HandleTypeDef hcamera_isp;

static __IO uint32_t NbMainFrames = 0;
static IMX335_Object_t IMX335Obj;
static int32_t isp_gain;
static int32_t isp_exposure;

/* Private function prototypes -----------------------------------------------*/
static void IMX335_Probe(uint32_t Resolution, uint32_t PixelFormat);
static ISP_StatusTypeDef GetSensorInfoHelper(uint32_t Instance, ISP_SensorInfoTypeDef *SensorInfo);
static ISP_StatusTypeDef SetSensorGainHelper(uint32_t Instance, int32_t Gain);
static ISP_StatusTypeDef GetSensorGainHelper(uint32_t Instance, int32_t *Gain);
static ISP_StatusTypeDef SetSensorExposureHelper(uint32_t Instance, int32_t Exposure);
static ISP_StatusTypeDef GetSensorExposureHelper(uint32_t Instance, int32_t *Exposure);

/**
  * @brief DCMIPP Initialization Function
  * @param None
  * @retval None
  */
void MX_DCMIPP_Init(void)
{
  DCMIPP_PipeConfTypeDef pPipeConf = {0};
  DCMIPP_CSI_PIPE_ConfTypeDef pCSIPipeConf = {0};
  DCMIPP_CSI_ConfTypeDef csiconf = {0};
  DCMIPP_DownsizeTypeDef DonwsizeConf ={0};

  /* Set DCMIPP instance */
  hdcmipp.Instance = DCMIPP;
  if (HAL_DCMIPP_Init(&hdcmipp) != HAL_OK)
  {
    Error_Handler();
  }

  /* Configure the CSI */
  csiconf.DataLaneMapping = DCMIPP_CSI_PHYSICAL_DATA_LANES;
  csiconf.NumberOfLanes   = DCMIPP_CSI_TWO_DATA_LANES;
  csiconf.PHYBitrate      = DCMIPP_CSI_PHY_BT_1600;
  if(HAL_DCMIPP_CSI_SetConfig(&hdcmipp, &csiconf) != HAL_OK)
  {
    Error_Handler();
  }

  /* Configure the Virtual Channel 0 */
  if(HAL_DCMIPP_CSI_SetVCConfig(&hdcmipp, DCMIPP_VIRTUAL_CHANNEL0, DCMIPP_CSI_DT_BPP10) != HAL_OK)
  {
    Error_Handler();
  }

  /* Configure the serial Pipe */
  pCSIPipeConf.DataTypeMode = DCMIPP_DTMODE_DTIDA;
  pCSIPipeConf.DataTypeIDA  = DCMIPP_DT_RAW10;
  pCSIPipeConf.DataTypeIDB  = DCMIPP_DT_RAW10;

  if (HAL_DCMIPP_CSI_PIPE_SetConfig(&hdcmipp, DCMIPP_PIPE1, &pCSIPipeConf) != HAL_OK)
  {
    Error_Handler();
  }

  pPipeConf.FrameRate  = DCMIPP_FRAME_RATE_ALL;
  pPipeConf.PixelPackerFormat = DCMIPP_PIXEL_PACKER_FORMAT_RGB565_1;
  pPipeConf.PixelPipePitch  = 1600; /* Number of bytes */

  /* Configure Pipe */
  if (HAL_DCMIPP_PIPE_SetConfig(&hdcmipp, DCMIPP_PIPE1, &pPipeConf) != HAL_OK)
  {
    Error_Handler();
  }

  /* Configure the downsize */
  DonwsizeConf.HRatio      = 25656;
  DonwsizeConf.VRatio      = 33161;
  DonwsizeConf.HSize       = 800;
  DonwsizeConf.VSize       = 480;
  DonwsizeConf.HDivFactor  = 316;
  DonwsizeConf.VDivFactor  = 253;

  if(HAL_DCMIPP_PIPE_SetDownsizeConfig(&hdcmipp, DCMIPP_PIPE1, &DonwsizeConf) != HAL_OK)
  {
    Error_Handler();
  }

  if(HAL_DCMIPP_PIPE_EnableDownsize(&hdcmipp, DCMIPP_PIPE1) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief LCD/LTDC Initialization Function
  * @param Width  Display width
  * @param Height Display height
  * @retval None
  */
void LCD_Init(uint32_t Width, uint32_t Height)
{
  LTDC_LayerCfgTypeDef pLayerCfg ={0};

  hltdc.Instance = LTDC;
  hltdc.Init.HSPolarity = LTDC_HSPOLARITY_AL;
  hltdc.Init.VSPolarity = LTDC_VSPOLARITY_AL;
  hltdc.Init.DEPolarity = LTDC_DEPOLARITY_AL;
  hltdc.Init.PCPolarity = LTDC_PCPOLARITY_IPC;

  hltdc.Init.HorizontalSync     = RK050HR18_HSYNC - 1;
  hltdc.Init.AccumulatedHBP     = RK050HR18_HSYNC + RK050HR18_HBP - 1;
  hltdc.Init.AccumulatedActiveW = RK050HR18_HSYNC + Width + RK050HR18_HBP -1;
  hltdc.Init.TotalWidth         = RK050HR18_HSYNC + Width + RK050HR18_HBP + RK050HR18_HFP - 1;
  hltdc.Init.VerticalSync       = RK050HR18_VSYNC - 1;
  hltdc.Init.AccumulatedVBP     = RK050HR18_VSYNC + RK050HR18_VBP - 1;
  hltdc.Init.AccumulatedActiveH = RK050HR18_VSYNC + Height + RK050HR18_VBP -1 ;
  hltdc.Init.TotalHeigh         = RK050HR18_VSYNC + Height + RK050HR18_VBP + RK050HR18_VFP - 1;

  hltdc.Init.Backcolor.Blue  = 0x0;
  hltdc.Init.Backcolor.Green = 0xFF;
  hltdc.Init.Backcolor.Red   = 0x0;

  if(HAL_LTDC_Init(&hltdc) != HAL_OK)
  {
    Error_Handler();
  }

  pLayerCfg.WindowX0       = 0;
  pLayerCfg.WindowX1       = Width;
  pLayerCfg.WindowY0       = 0;
  pLayerCfg.WindowY1       = Height;
  pLayerCfg.PixelFormat    = LTDC_PIXEL_FORMAT_RGB565;
  pLayerCfg.FBStartAdress  = BUFFER_ADDRESS;
  pLayerCfg.Alpha = LTDC_LxCACR_CONSTA;
  pLayerCfg.Alpha0 = 0;
  pLayerCfg.BlendingFactor1 = LTDC_BLENDING_FACTOR1_PAxCA;
  pLayerCfg.BlendingFactor2 = LTDC_BLENDING_FACTOR2_PAxCA;
  pLayerCfg.ImageWidth = Width;
  pLayerCfg.ImageHeight = Height;
  pLayerCfg.Backcolor.Blue = 0;
  pLayerCfg.Backcolor.Green = 0;
  pLayerCfg.Backcolor.Red = 0;

  if(HAL_LTDC_ConfigLayer(&hltdc, &pLayerCfg, LTDC_LAYER_1))
  {
    Error_Handler();
  }
}

/**
  * @brief  Register Bus IOs and initialize IMX335 camera sensor
  * @param  Resolution Camera resolution
  * @param  PixelFormat Pixel format
  * @retval None
  */
static void IMX335_Probe(uint32_t Resolution, uint32_t PixelFormat)
{
  IMX335_IO_t IOCtx;
  uint32_t id;

  /* Configure the camera driver */
  IOCtx.Address     = CAMERA_IMX335_ADDRESS;
  IOCtx.Init        = BSP_I2C1_Init;
  IOCtx.DeInit      = BSP_I2C1_DeInit;
  IOCtx.ReadReg     = BSP_I2C1_ReadReg16;
  IOCtx.WriteReg    = BSP_I2C1_WriteReg16;
  IOCtx.GetTick     = BSP_GetTick;

  if (IMX335_RegisterBusIO(&IMX335Obj, &IOCtx) != IMX335_OK)
  {
    Error_Handler();
  }
  else if (IMX335_ReadID(&IMX335Obj, &id) != IMX335_OK)
  {
    Error_Handler();
  }
  else
  {
    if (id != (uint32_t) IMX335_CHIP_ID)
    {
      Error_Handler();
    }
    else
    {
      if (IMX335_Init(&IMX335Obj, Resolution, PixelFormat) != IMX335_OK)
      {
        Error_Handler();
      }
      else if(IMX335_SetFrequency(&IMX335Obj, IMX335_INCK_24MHZ)!= IMX335_OK)
      {
        Error_Handler();
      }
    }
  }
}

/**
  * @brief  ISP Middleware helper. Camera sensor info getter
  * @param  Instance Camera instance (unused)
  * @param  SensorInfo Pointer to sensor info structure
  * @retval ISP Status
  */
static ISP_StatusTypeDef GetSensorInfoHelper(uint32_t Instance, ISP_SensorInfoTypeDef *SensorInfo)
{
  UNUSED(Instance);
  return (ISP_StatusTypeDef) IMX335_GetSensorInfo(&IMX335Obj, (IMX335_SensorInfo_t *) SensorInfo);
}

/**
  * @brief  ISP Middleware helper. Camera gain setter
  * @param  Instance Camera instance (unused)
  * @param  Gain Gain value to set
  * @retval ISP Status
  */
static ISP_StatusTypeDef SetSensorGainHelper(uint32_t Instance, int32_t Gain)
{
  UNUSED(Instance);
  isp_gain = Gain;
  return (ISP_StatusTypeDef) IMX335_SetGain(&IMX335Obj, Gain);
}

/**
  * @brief  ISP Middleware helper. Camera gain getter
  * @param  Instance Camera instance (unused)
  * @param  Gain Pointer to gain value
  * @retval ISP Status
  */
static ISP_StatusTypeDef GetSensorGainHelper(uint32_t Instance, int32_t *Gain)
{
  UNUSED(Instance);
  *Gain = isp_gain;
  return ISP_OK;
}

/**
  * @brief  ISP Middleware helper. Camera exposure setter
  * @param  Instance Camera instance (unused)
  * @param  Exposure Exposure value to set
  * @retval ISP Status
  */
static ISP_StatusTypeDef SetSensorExposureHelper(uint32_t Instance, int32_t Exposure)
{
  UNUSED(Instance);
  isp_exposure = Exposure;
  return (ISP_StatusTypeDef) IMX335_SetExposure(&IMX335Obj, Exposure);
}

/**
  * @brief  ISP Middleware helper. Camera exposure getter
  * @param  Instance Camera instance (unused)
  * @param  Exposure Pointer to exposure value
  * @retval ISP Status
  */
static ISP_StatusTypeDef GetSensorExposureHelper(uint32_t Instance, int32_t *Exposure)
{
  UNUSED(Instance);
  *Exposure = isp_exposure;
  return ISP_OK;
}

/**
  * @brief  Initialize camera system
  * @note   This should be called before starting microT-Kernel
  * @retval None
  */
void Camera_System_Init(void)
{
  ISP_AppliHelpersTypeDef appliHelpers = {0};

  /* Initialize BSP Components */
  BSP_LED_Init(LED_GREEN);
  BSP_LED_Init(LED_RED);
  BSP_PB_Init(BUTTON_USER1, BUTTON_MODE_EXTI);

#if USE_COM_LOG
  /* Initialize UART for logging */
  COM_InitTypeDef COM_Init;
  COM_Init.BaudRate   = 115200;
  COM_Init.WordLength = COM_WORDLENGTH_8B;
  COM_Init.StopBits   = COM_STOPBITS_1;
  COM_Init.Parity     = COM_PARITY_NONE;
  COM_Init.HwFlowCtl  = COM_HWCONTROL_NONE;

  BSP_COM_Init(COM1, &COM_Init);
  if (BSP_COM_SelectLogPort(COM1) != BSP_ERROR_NONE)
  {
    Error_Handler();
  }
#endif

  /* Enable AXISRAM3 for frame buffer */
  __HAL_RCC_AXISRAM3_CLK_ENABLE();
  __HAL_RCC_RAMCFG_CLK_ENABLE();
  
  /* Power up AXISRAM3 */
  RAMCFG_SRAM3_AXI->CR &= ~RAMCFG_CR_SRAMSD;

  /* Initialize DCMIPP peripheral */
  MX_DCMIPP_Init();

  /* Initialize IMX335 Camera Sensor */
  IMX335_Probe(IMX335_R2592_1944, IMX335_RAW_RGGB10);

  /* Initialize LCD/LTDC */
  LCD_Init(FRAME_WIDTH, FRAME_HEIGHT);

  /* Fill init struct with Camera driver helpers */
  appliHelpers.GetSensorInfo = GetSensorInfoHelper;
  appliHelpers.SetSensorGain = SetSensorGainHelper;
  appliHelpers.GetSensorGain = GetSensorGainHelper;
  appliHelpers.SetSensorExposure = SetSensorExposureHelper;
  appliHelpers.GetSensorExposure = GetSensorExposureHelper;

  /* Initialize the Image Signal Processing middleware */
  if(ISP_Init(&hcamera_isp, &hdcmipp, 0, &appliHelpers, ISP_IQParamCacheInit[0]) != ISP_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief  Start camera capture
  * @note   This should be called from camera task after RTOS starts
  * @retval None
  */
void Camera_Start_Capture(void)
{
  /* Start DCMIPP CSI Pipe in continuous mode */
  if (HAL_DCMIPP_CSI_PIPE_Start(&hdcmipp, DCMIPP_PIPE1, DCMIPP_VIRTUAL_CHANNEL0,
                                 BUFFER_ADDRESS, DCMIPP_MODE_CONTINUOUS) != HAL_OK)
  {
    Error_Handler();
  }

  /* Start the Image Signal Processing */
  if (ISP_Start(&hcamera_isp) != ISP_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief  Camera background process
  * @note   Should be called periodically from main loop
  * @retval None
  */
void Camera_Background_Process(void)
{
  if (ISP_BackgroundProcess(&hcamera_isp) != ISP_OK)
  {
    BSP_LED_Toggle(LED_RED);
  }
}

/**
  * @brief  Frame event callback on pipe
  * @param  hdcmipp DCMIPP device handle
  * @param  Pipe    Pipe receiving the callback
  * @retval None
  */
void HAL_DCMIPP_PIPE_FrameEventCallback(DCMIPP_HandleTypeDef *hdcmipp, uint32_t Pipe)
{
  NbMainFrames++;
  BSP_LED_Toggle(LED_GREEN);
}

/**
  * @brief  Vsync Event callback on pipe
  * @param  hdcmipp DCMIPP device handle
  * @param  Pipe    Pipe receiving the callback
  * @retval None
  */
void HAL_DCMIPP_PIPE_VsyncEventCallback(DCMIPP_HandleTypeDef *hdcmipp, uint32_t Pipe)
{
  UNUSED(hdcmipp);

  /* Update the frame counter and call the ISP statistics handler */
  switch (Pipe)
  {
    case DCMIPP_PIPE0:
      ISP_IncDumpFrameId(&hcamera_isp);
      break;

    case DCMIPP_PIPE1:
      ISP_IncMainFrameId(&hcamera_isp);
      ISP_GatherStatistics(&hcamera_isp);
      break;

    case DCMIPP_PIPE2:
      ISP_IncAncillaryFrameId(&hcamera_isp);
      break;
  }
}
