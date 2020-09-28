/*
hrtc.Init.AsynchPrediv = 32;
hrtc.Init.SynchPrediv = 4;

26 4 5Hz 0.2s
32 4 4Hz 0.25s
*/

  printf("vbat = %d\n", result);

uint8_t get_adc_reading(void)
{
  uint8_t result = 0;
  HAL_ADC_Start(&hadc);
  if(HAL_ADC_PollForConversion(&hadc, 100) == HAL_OK)
    result = HAL_ADC_GetValue(&hadc);
  HAL_ADC_Stop(&hadc);
  return result;
}
uint8_t get_adc_reading(void)
{
  uint8_t result = 0;

  ADC_ChannelConfTypeDef sConfig;
  sConfig.Channel = ADC_CHANNEL_VREFINT;
  sConfig.Rank = ADC_RANK_CHANNEL_NUMBER;
  sConfig.SamplingTime = ADC_SAMPLETIME_71CYCLES_5;
  HAL_ADC_ConfigChannel(&hadc, &sConfig);

  HAL_ADC_Start(&hadc);
  if(HAL_ADC_PollForConversion(&hadc, 100) == HAL_OK)
    result = HAL_ADC_GetValue(&hadc);
  HAL_ADC_Stop(&hadc);

  printf("%d\n", result);

  sConfig.Channel = ADC_CHANNEL_1;
  HAL_ADC_ConfigChannel(&hadc, &sConfig);

  HAL_ADC_Start(&hadc);
  if(HAL_ADC_PollForConversion(&hadc, 100) == HAL_OK)
    result = HAL_ADC_GetValue(&hadc);
  HAL_ADC_Stop(&hadc);

  printf("%d\n\n", result);

  return result;
}

HAL_GPIO_TogglePin(TEST_OUT_GPIO_Port, TEST_OUT_Pin);

    HAL_ADC_MspDeInit(&hadc);
    HAL_ADC_MspInit(&hadc);
    MX_ADC_Init();
    printf("%d\n", get_adc_reading());
    HAL_Delay(500);

volatile uint8_t adc_index;
volatile uint8_t adc_buf[ADC_BUF_SIZE];
// set discontinues mode for it to work
void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc)  
{
  if(__HAL_ADC_GET_FLAG(hadc, ADC_FLAG_EOC)) 
  {
    adc_buf[adc_index] = HAL_ADC_GetValue(hadc); 
    adc_index++;
  }
  if(__HAL_ADC_GET_FLAG(hadc, ADC_FLAG_EOS))  
  {
    adc_index = 0;
  }
}
for (int i = 0; i < ADC_BUF_SIZE; ++i)
    {
      printf("%d ", adc_buf[i]);
    }
    printf("\n%d\n", adc_index);
HAL_ADC_Start_IT(&hadc);

if(current_animation == ANIMATION_TYPE_RAPID_FLASHING)
  {
    if(curr_frame % 8 < 4)
      pwm_timer->Instance->CCR4 = 0;
    else
      pwm_timer->Instance->CCR4 = 255;
  }
  else 

void HAL_RTC_AlarmAEventCallback(RTC_HandleTypeDef *hrtc)
{
  wakeup_count++;
  if(wakeup_count % 2)
    start_animation(ANIMATION_TYPE_CONST_OFF);
  else
    start_animation(ANIMATION_TYPE_CONST_ON);
}
void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc)  
{
  if(__HAL_ADC_GET_FLAG(hadc, ADC_FLAG_EOC)) 
  {
    adc_buf[adc_index] = HAL_ADC_GetValue(hadc); 
    adc_index = (adc_index + 1) % ADC_BUF_SIZE;
  }
  // if(__HAL_ADC_GET_FLAG(hadc, ADC_FLAG_EOS))  
  // {
  //   adc_index = 0;
  // }
}
uint8_t temp;
uint8_t q = 0;
uint8_t data_array[4];
uint8_t tx_address[5] = {0xE7,0xE7,0xE7,0xE7,0xE7};
uint8_t rx_address[5] = {0xD7,0xD7,0xD7,0xD7,0xD7};

  // printf("nrf initializing...\n");
  // nrf24_init();
  // nrf24_config(2,4);
  // nrf24_tx_address(tx_address);
  // nrf24_rx_address(rx_address);
  // printf("done\n");

  VL53L0X_init();
  setTimeout(500);
  setMeasurementTimingBudget(20000);

    data_array[0] = 'l';
    data_array[1] = 'o';
    data_array[2] = 'l';
    data_array[3] = ((q++) % 10) + 48;

    printf("sending...\n");
    nrf24_send(data_array);
    while(nrf24_isSending());
    temp = nrf24_lastMessageStatus();

    if(temp == NRF24_TRANSMISSON_OK)
      printf("> Tranmission went OK\r\n");
    else if(temp == NRF24_MESSAGE_LOST)
      printf("> Message is lost ...\r\n");

    temp = nrf24_retransmissionCount();
    printf("> Retranmission count: %d\r\n",temp);
    
    printf("%d\n", readRangeSingleMillimeters());
    if(timeoutOccurred())
      printf("TIMEOUT\n");

  uint32_t br0 = HAL_RTCEx_BKUPRead(&hrtc, 0);
  printf("br0 = %d\n", br0);
  HAL_RTCEx_BKUPWrite(&hrtc, 0, br0 + 1);

  void HAL_RTC_AlarmAEventCallback(RTC_HandleTypeDef *hrtc)
{
  HAL_GPIO_TogglePin(USER_LED_GPIO_Port, USER_LED_Pin);
}

void recovery_mode(void)
{
  while(1)
    {
      printf("recovery mode\n");
      HAL_GPIO_TogglePin(USER_LED_GPIO_Port, USER_LED_Pin);
      HAL_Delay(1000);
    }
}

uint16_t get_baseline(void)
{
  printf("calibrating...\n");

  for (int i = 0; i < BASELINE_SAMPLE_SIZE; ++i)
  {
    baseline_data[i] = readRangeSingleMillimeters();
    HAL_Delay(50);
  }

  uint32_t sum = 0;
  for (int i = 0; i < BASELINE_SAMPLE_SIZE; ++i)
    printf("%d: %d\n", i, baseline_data[i]);
}

uint16_t get_baseline(void)
{
  printf("calibrating...\n");

  uint32_t mean = 0;
  for (int i = 0; i < BASELINE_SAMPLE_SIZE; ++i)
  {
    baseline_data[i] = readRangeSingleMillimeters();
    mean += baseline_data[i];
    HAL_Delay(50);
  }
  mean /= BASELINE_SAMPLE_SIZE;

  uint32_t variance = 0;
  for (int i = 0; i < BASELINE_SAMPLE_SIZE; ++i)
  {
    printf("%d ", baseline_data[i]);
    variance += (baseline_data[i] - mean) * (baseline_data[i] - mean);
  }
  variance /= BASELINE_SAMPLE_SIZE;

  printf("\nvar: %d\n", variance);

  return 0;
}

// var smaller than 300
// trigger when current reading is 30% away from baseline?
// go into triggered state, so dont repeat sending package
// wait until readings return to baseline

printf("%4d %4d %4d %4.2f\n", baseline, this_reading, diff, diff_ratio);

int16_t this_reading = readRangeSingleMillimeters();
    int16_t diff = abs(baseline - this_reading);
    float diff_ratio = diff/(float)baseline;
    printf("%4d %4d %4d %4.2f\n", baseline, this_reading, diff, diff_ratio);
    if(diff_ratio > get_trigger_threshold(baseline))
      printf("triggered!!\n");
    HAL_Delay(50);


  int16_t this_reading = readRangeSingleMillimeters();
    int16_t diff = abs(baseline - this_reading);
    
    printf("%4d %4d %4d %4d\n", baseline, this_reading, diff, diff_threshold);
    HAL_Delay(50);

  int16_t this_reading = 0;
  int16_t diff = 0;

    this_reading = readRangeSingleMillimeters();
    diff = abs(baseline - this_reading);

    while(diff >= diff_threshold)
    {
      printf("waiting to return...\n");
      HAL_Delay(50);
    }


  // HAL_GPIO_WritePin(USER_LED_GPIO_Port, USER_LED_Pin, GPIO_PIN_SET);
  // HAL_GPIO_TogglePin(USER_LED_GPIO_Port, USER_LED_Pin);
