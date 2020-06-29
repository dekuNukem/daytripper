/*
battery ADC glitch returns vbat_mv = 2400 from time to time
*/

/*
disable battery check and see if still restarts

resample 3 times? budget 20ms

budget 15ms moew samples? 8 HZ?


done:
ADC always on now
API reading wrapper

TODO
different sensitivity for different baselines?

IDEAS
increased rtc wake up rate from 5hz to around 6HZ
reduced laser timing budget from 25ms to 15ms
increased resample count from 2 to 3

*/

/*
power consumption notes

fully assembled REV2 tx board:

battery current when processor is in stop mode: 1.66mA

GPIO settings causes high power consumption
*/

/*
standby with stm32: 1.2mA

standby without stm32: 1.2mA

it is the NRF chip thats causing the excess current consumption!!

*/

/*

hrtc.Init.AsynchPrediv = 26;
hrtc.Init.SynchPrediv = 4;
period = 0.2118s

hrtc.Init.AsynchPrediv = 16;
hrtc.Init.SynchPrediv = 4;
peroid = 0.1333

hrtc.Init.AsynchPrediv = 32;
hrtc.Init.SynchPrediv = 2;
peroid = 0.1555

hrtc.Init.AsynchPrediv = 64;
hrtc.Init.SynchPrediv = 0;
peroid = 0.102

hrtc.Init.AsynchPrediv = 96;
hrtc.Init.SynchPrediv = 0;
period = 0.1552

hrtc.Init.AsynchPrediv = 120;
hrtc.Init.SynchPrediv = 0;
period = 0.1898

hrtc.Init.AsynchPrediv = 127;
hrtc.Init.SynchPrediv = 0;
period = 0.2008

hrtc.Init.AsynchPrediv = 125;
hrtc.Init.SynchPrediv = 0;
period = 0.1976ms
*/

  printf("ee_format: %d\n", ee_format());
  HAL_Delay(1);

  for (int i = 0; i < EEPROM_BUF_SIZE; ++i)
    eeprom_buf[i] = i;
  printf("eep_write: %d\n", ee_write(0, EEPROM_BUF_SIZE, eeprom_buf));
  //must call ee_format() before writing

  printf("eep_read: %d\n", ee_read(0, EEPROM_BUF_SIZE, eeprom_buf));
  for (int i = 0; i < EEPROM_BUF_SIZE; ++i)
    printf("%d: %d\n", i, eeprom_buf[i]);

ee_read(0, EEPROM_BUF_SIZE, eeprom_buf);

 printf("eep_read: %d\n", ee_read(0, EEPROM_BUF_SIZE, eeprom_buf));
  for (int i = 0; i < EEPROM_BUF_SIZE; ++i)
    printf("%d: %d\n", i, eeprom_buf[i]);


ee_read(0, EEPROM_BUF_SIZE, eeprom_buf);

 printf("eep_read: %d\n", ee_read(0, EEPROM_BUF_SIZE, eeprom_buf));
  for (int i = 0; i < EEPROM_BUF_SIZE; ++i)
    printf("%d: %d\n", i, eeprom_buf[i]);

void check_battery(uint32_t* vbat_mV)
{
  *vbat_mV = 3800;
  while(1)
  {
    HAL_Delay(500);
    printf("hello\n");
  }
  // uint8_t vbat_8b, vrefint;
  // HAL_ADC_Start(&hadc);
  // HAL_ADC_PollForConversion(&hadc, 500);
  // vbat_8b = HAL_ADC_GetValue(&hadc);
  // HAL_ADC_PollForConversion(&hadc, 500);
  // vrefint = HAL_ADC_GetValue(&hadc);
  // HAL_ADC_Stop(&hadc);

  // if(vrefint == 0) // just in case
  //   return;

  // *vbat_mV = (uint32_t)((1200 / (double)vrefint) * (double)vbat_8b * 2);
  // printf("ch1: %d, ch2: %d, vbat: %d\n", vbat_8b, vrefint, *vbat_mV);

  // if(*vbat_mV >= 2000 && *vbat_mV <= 3250) // 3250 after diode drop is about 3.5V
  // {
  //   printf("low battery, shutting down...\n");

  //   start_animation(ANIMATION_TYPE_FASTBLINK);
  //   HAL_Delay(3000);
  //   start_animation(ANIMATION_TYPE_CONST_OFF);

  //   // turn off external chips
  //   nrf24_powerDown();
  //   NRF_OFF();
  //   HAL_GPIO_WritePin(NRF_CE_GPIO_Port, NRF_CE_Pin, GPIO_PIN_RESET);
  //   HAL_GPIO_WritePin(SPI1_CS_GPIO_Port, SPI1_CS_Pin, GPIO_PIN_SET);

  //   // disable all interrupts
  //   for (int i = 0; i <= 31; i++)
  //     HAL_NVIC_DisableIRQ(i);

  //   // turn off periphrials
  //   HAL_ADC_MspDeInit(&hadc);
  //   HAL_I2C_MspDeInit(&hi2c1);
  //   HAL_RTC_MspDeInit(&hrtc);
  //   HAL_SPI_MspDeInit(&hspi1);
  //   HAL_TIM_Base_MspDeInit(&htim2);
  //   HAL_TIM_Base_MspDeInit(&htim17);
  //   HAL_UART_MspDeInit(&huart2);

  //   HAL_PWR_EnterSTANDBYMode();
  // }
}
  while(1)
  {
    HAL_Delay(500);
    HAL_ADC_Start(&hadc);
    HAL_ADC_PollForConversion(&hadc, 500);
    vbat_8b = HAL_ADC_GetValue(&hadc);
    HAL_ADC_PollForConversion(&hadc, 500);
    vrefint = HAL_ADC_GetValue(&hadc);
    HAL_ADC_Stop(&hadc);
    *vbat_mV = (uint32_t)((1200 / (double)vrefint) * (double)vbat_8b * 2);
    printf("ch1: %d, ch2: %d, vbat: %d\n", vbat_8b, vrefint, *vbat_mV);
  }
    if(this_reading > 8190)
    {
      printf("invalid reading: %d\n", this_reading);
      goto sleep;
    }

if(count > 20)
        {
          printf("too many trigger errors\n");
          goto sleep
        }
for (int i = 0; i < WINDOW_SIZE; ++i)
      {
        uint16_t tdiff = readRangeSingleMillimeters() - ;

      }
printf("triggered! base: %d, this: %d\n", baseline, this_reading);
      for (int i = 0; i < 5; ++i)
        printf("%d\n", readRangeSingleMillimeters());

void tx_test(void)
{
  uint8_t count = 0;
  test_data[0] = *STM32_UUID;
  test_data[1] = DTPR_CMD_TEST;

  while(1)
  {
    start_animation(ANIMATION_TYPE_CONST_ON);
    memset(test_data+2, count, 4);
    for (int i = 0; i < 6; ++i)
      printf("0x%x ", test_data[i]);
    printf("\n");
    count++;
    send_packet(test_data);
    iwdg_wait(150, ANIMATION_TYPE_NOCHANGE);
    start_animation(ANIMATION_TYPE_CONST_OFF);

    if(count > 5 && HAL_GPIO_ReadPin(USER_BUTTON_GPIO_Port, USER_BUTTON_Pin))
      return;

    iwdg_wait(850, ANIMATION_TYPE_NOCHANGE);
  }
}
else if(button_result == 2)
    {
      tx_test();
      current_state = STATE_IDLE;
    }
void iwdg_wait(uint32_t msec, uint8_t ani_type)
{
  start_animation(ani_type);
  uint32_t start = HAL_GetTick();
  while(HAL_GetTick() - start <= msec)
    HAL_IWDG_Refresh(&hiwdg);
}

printf("mean: %d, variance: %d\n", mean, variance);
    while(1);
    for (int i = 0; i < BASELINE_SAMPLE_SIZE; ++i)
      printf("%d ", baseline_data[i]);
    printf("\n");
printf("ch1: %d, ch2: %d, vbat: %d\n", vbat_8b, vrefint, *vbat_mV);
printf("sending stat packet...\n");
  for (int i = 0; i < 6; ++i)
    printf("0x%x ", data[i]);
  printf("\n");
      for (int i = 0; i < 6; ++i)
        printf("%d ", data_array[i]);
      printf("\n");
  // setSignalRateLimit(0.1);
  // setVcselPulsePeriod(VcselPeriodPreRange, 18);
  // setVcselPulsePeriod(VcselPeriodFinalRange, 14);
/*
hrtc.Init.AsynchPrediv = 32;
hrtc.Init.SynchPrediv = 4;

26 4 5Hz 0.2s
32 4 4Hz 0.25s
*/
printf("%d\n", reading);
printf("released! duration: %d wakeups\n", );
    for (int i = 0; i < 6; ++i)
      printf("%d ", data[i]);
    printf("\n");

for (int i = 0; i < 3; i++)
{
  nrf24_send(data_array);
  while(nrf24_isSending());
  nrf_status = nrf24_lastMessageStatus();
  if(nrf_status == NRF24_TRANSMISSON_OK)
  {
    printf("TX OK\n");
    printf("> Retranmission count: %d\r\n",nrf24_retransmissionCount());
    break;
  }
  printf("TX failed, retry %d\n", i);
}

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
