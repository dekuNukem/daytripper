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

uint16_t limit_range(uint16_t result)
{
  uint16_t range_max_mm = daytripper_config.tof_range_max_cm_div2 * 20;
  uint16_t range_min_mm = daytripper_config.tof_range_min_cm_div2 * 20;
  range_max_mm = 500;
  range_min_mm = 300;
  if(result >= range_max_mm)
    result = range_max_mm;
  else if(result < range_min_mm)
    result = range_min_mm;
  return result;
}

    // how long to sleep while wating for ToF sensor measurement
    tof_sleep_ms = daytripper_config.tof_timing_budget_ms - 1;
    if(vbat_mV > 4300) // if charging, dont sleep while wating for ToF measurement, but still update the time count
    {
      run_time_update(tof_sleep_ms + 5);
      tof_sleep_ms = 0;
    }
      // HAL_Delay(10 + 10 * daytripper_config.nr_sensitivity);
  // while(1)
  // {
  //  get_single_distance_reading(&is_reading_valid);
  //  // printf("%d\n", );
  //  HAL_IWDG_Refresh(&hiwdg);
  //  rtc_sleep(&hrtc, 1000/daytripper_config.refresh_rate_Hz);
  // }
  // while(1)
  // {
  //   HAL_IWDG_Refresh(&hiwdg);
  //   printf("hello world %d\n", HAL_GetTick());
  //   check_battery(&vbat_mV);
  //   // rtc_sleep(&hrtc, 500);
  //   char* result = my_usb_readline();
  //   if(result != NULL)
  //     printf("received: %s\n", result);
  //   HAL_Delay(500);
  // }
typedef struct
{
  // 0
  uint8_t refresh_rate_Hz; // from 1Hz to around 30Hz, over 30 just go as fast as possible
  // 1
  uint8_t tof_range_mm; // value * 2 = true range
  // 2
  uint8_t use_led;  // 1 turn on LED when triggered, 0 not
  // 3
  uint8_t nr_sensitivity; // NR window size, 0 no window, 1 default, 2 max
  // 4
  uint8_t tx_wireless_channel; // last byte of wireless channel number
  // 5
  uint8_t tof_timing_budget_ms; // timing budget in ms
  // 6
  uint8_t op_mode; // 0 normal, 1 continuous
  // 7
  uint8_t print_debug_info;

  uint8_t hardware_id;
  int16_t rtc_sleep_duration_ms;
} dt_conf;
for (int i = 0; i < EEPROM_BUF_SIZE; ++i)
    printf("%d %d\n", i, eeprom_buf[i]);
    
    // printf("%d %d\n", HAL_GetTick(), rtc_sleep_count_ms); // this causes it to hang right away
    // HAL_Delay(200);
dt_ee: 6 255 1 1 12 25 82 0 1

#define EEPROM_BUF_SIZE 32
uint8_t eeprom_buf[EEPROM_BUF_SIZE];
void rtc_sleep(RTC_HandleTypeDef *hrtc, uint32_t duration_ms)
{
  if(duration_ms <= 0)
    return;
  // 40KHz LSI, RTC asyc prediv 18, sync prediv 0
  duration_ms *= 2;
  if(HAL_RTC_GetTime(hrtc, &sTime, RTC_FORMAT_BIN) != HAL_OK)
    return;
  if(HAL_RTC_GetDate(hrtc, &sDate, RTC_FORMAT_BIN) != HAL_OK)
    return;

  next_alarm_second = sTime.Seconds + duration_ms;
  next_alarm_minute = sTime.Minutes + next_alarm_second / 60;
  next_alarm_hour = (sTime.Hours + next_alarm_minute / 60) % 24;
  next_alarm_second %= 60;
  next_alarm_minute %= 60;

  // printf("---\n");
  // printf("duration_ms: %d\n", duration_ms);
  // printf("current: %d %d %d\n", sTime.Hours, sTime.Minutes, sTime.Seconds);
  // printf("next: %d %d %d\n", next_alarm_hour, next_alarm_minute, next_alarm_second);
  
  sAlarm.AlarmTime.Seconds = next_alarm_second;
  sAlarm.AlarmTime.Minutes = next_alarm_minute;
  sAlarm.AlarmTime.Hours = next_alarm_hour;
  sAlarm.AlarmTime.DayLightSaving = RTC_DAYLIGHTSAVING_NONE;
  sAlarm.AlarmTime.StoreOperation = RTC_STOREOPERATION_RESET;
  sAlarm.AlarmMask = RTC_ALARMMASK_DATEWEEKDAY;//|RTC_ALARMMASK_HOURS;
  sAlarm.AlarmSubSecondMask = RTC_ALARMSUBSECONDMASK_ALL;
  sAlarm.AlarmDateWeekDaySel = RTC_ALARMDATEWEEKDAYSEL_DATE;
  sAlarm.AlarmDateWeekDay = 1;
  sAlarm.Alarm = RTC_ALARM_A;
  if(HAL_RTC_DeactivateAlarm(hrtc, RTC_ALARM_A) != HAL_OK)
    return;
  // printf("1\n");
  if(HAL_RTC_SetAlarm_IT(hrtc, &sAlarm, RTC_FORMAT_BIN) != HAL_OK)
    return;
  // printf("2\n");

  // if(HAL_RTC_GetTime(hrtc, &sTime, RTC_FORMAT_BIN) != HAL_OK)
  //   return;
  // if(HAL_RTC_GetDate(hrtc, &sDate, RTC_FORMAT_BIN) != HAL_OK)
  //   return;
  // printf("now: %d %d %d\n", sTime.Hours, sTime.Minutes, sTime.Seconds);
  HAL_SuspendTick();
  HAL_PWR_EnterSTOPMode(PWR_LOWPOWERREGULATOR_ON, PWR_STOPENTRY_WFI);
  HAL_ResumeTick();
  rtc_sleep_count_ms += duration_ms/2;
  rtc_counter += duration_ms/2;
  huart2.Instance->CR1 &= ~(USART_CR1_UE);
  huart2.Instance->BRR = 70;
  huart2.Instance->CR1 |= USART_CR1_UE;
  // if(HAL_RTC_GetTime(hrtc, &sTime, RTC_FORMAT_BIN) != HAL_OK)
  //   return;
  // if(HAL_RTC_GetDate(hrtc, &sDate, RTC_FORMAT_BIN) != HAL_OK)
  //   return;
  // printf("after: %d %d %d\n", sTime.Hours, sTime.Minutes, sTime.Seconds);
  // printf("---\n");
}
// this happens every 200ms
void HAL_RTC_AlarmAEventCallback(RTC_HandleTypeDef *hrtc)
{
  return;
  if(wakeup_count % 6000 == 0) // 6000 * 0.2 = 20 minutes
  {
    check_battery(&vbat_mV);
    new_stat_packet = 1;
  }
  if(wakeup_count % 25 == 0) // 25 * 0.2 = 5 seconds
    power_on_time_5s++;
  wakeup_count++;
}

  if(rtc_counter > 2000)
  {
    printf("two seconds passed\n");
    rtc_counter = 0;
  }

  printf("duration_ms: %d\n", duration_ms);
  printf("current: %d %d %d\n", sTime.Hours, sTime.Minutes, sTime.Seconds);
  printf("next: %d %d %d\n", next_alarm_hour, next_alarm_minute, next_alarm_second);
  printf("---\n");

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
  while (1)
  {
  /* USER CODE END WHILE */

  /* USER CODE BEGIN 3 */
    if (HAL_RTC_DeactivateAlarm(&hrtc, RTC_ALARM_A) != HAL_OK)
    {
      _Error_Handler(__FILE__, __LINE__);
    }
    printf("alarm deleted\n");

    RTC_TimeTypeDef sTime;
    sTime.Hours = 0;
    sTime.Minutes = 0;
    sTime.Seconds = 0;
    sTime.DayLightSaving = RTC_DAYLIGHTSAVING_NONE;
    sTime.StoreOperation = RTC_STOREOPERATION_RESET;
    if (HAL_RTC_SetTime(&hrtc, &sTime, RTC_FORMAT_BIN) != HAL_OK)
    {
      _Error_Handler(__FILE__, __LINE__);
    }
    printf("time cleared\n");

    RTC_AlarmTypeDef sAlarm;
    sAlarm.AlarmTime.Hours = 0;
    sAlarm.AlarmTime.Minutes = 0;
    sAlarm.AlarmTime.Seconds = 2;
    sAlarm.AlarmTime.SubSeconds = 0;
    sAlarm.AlarmTime.DayLightSaving = RTC_DAYLIGHTSAVING_NONE;
    sAlarm.AlarmTime.StoreOperation = RTC_STOREOPERATION_RESET;
    sAlarm.AlarmMask = RTC_ALARMMASK_DATEWEEKDAY|RTC_ALARMMASK_HOURS
                                |RTC_ALARMMASK_MINUTES;
    sAlarm.AlarmSubSecondMask = RTC_ALARMSUBSECONDMASK_ALL;
    sAlarm.AlarmDateWeekDaySel = RTC_ALARMDATEWEEKDAYSEL_DATE;
    sAlarm.AlarmDateWeekDay = 1;
    sAlarm.Alarm = RTC_ALARM_A;
    if (HAL_RTC_SetAlarm_IT(&hrtc, &sAlarm, RTC_FORMAT_BIN) != HAL_OK)
    {
      _Error_Handler(__FILE__, __LINE__);
    }
    printf("alarm set\n");
    HAL_PWR_EnterSTOPMode(PWR_LOWPOWERREGULATOR_ON, PWR_STOPENTRY_WFI);
    HAL_GPIO_TogglePin(LOGIC_OUT_GPIO_Port, LOGIC_OUT_Pin);
  }
  /* USER CODE END 3 */


void rtc_sleep(RTC_HandleTypeDef *hrtc, uint16_t duration_ms)
{
  duration_ms *= 2;
  if(duration_ms > 3540)
    duration_ms = 3540;
  uint8_t next_alarm_second = duration_ms % 60;
  uint8_t next_alarm_minute = duration_ms / 60;
  // uint8_t next_alarm_hour = duration_ms / 3600;
  RTC_TimeTypeDef sTime;
  RTC_DateTypeDef sDate;
  HAL_RTC_GetTime(hrtc, &sTime, RTC_FORMAT_BIN);
  HAL_RTC_GetDate(hrtc, &sDate, RTC_FORMAT_BIN);

  RTC_AlarmTypeDef sAlarm;
  sAlarm.AlarmTime.Minutes = (sTime.Minutes + next_alarm_minute) % 60;
  sAlarm.AlarmTime.Seconds = (sTime.Seconds + next_alarm_second) % 60;
  // sAlarm.AlarmTime.Hours = (sTime.Hours + next_alarm_hour) % 24;
  sAlarm.AlarmTime.DayLightSaving = RTC_DAYLIGHTSAVING_NONE;
  sAlarm.AlarmTime.StoreOperation = RTC_STOREOPERATION_RESET;
  sAlarm.AlarmMask = RTC_ALARMMASK_DATEWEEKDAY|RTC_ALARMMASK_HOURS;
  sAlarm.AlarmSubSecondMask = RTC_ALARMSUBSECONDMASK_ALL;
  sAlarm.AlarmDateWeekDaySel = RTC_ALARMDATEWEEKDAYSEL_DATE;
  sAlarm.AlarmDateWeekDay = 1;
  sAlarm.Alarm = RTC_ALARM_A;
  HAL_RTC_SetAlarm_IT(hrtc, &sAlarm, RTC_FORMAT_BIN);
  HAL_PWR_EnterSTOPMode(PWR_LOWPOWERREGULATOR_ON, PWR_STOPENTRY_WFI);
  HAL_RTC_DeactivateAlarm(hrtc, RTC_ALARM_A);
}

void rtc_sleep(RTC_HandleTypeDef *hrtc, uint32_t duration_ms)
{
  if(duration_ms <= 0)
    return;
  // 40KHz LSI, RTC asyc prediv 18, sync prediv 0
  duration_ms *= 2;
  RTC_TimeTypeDef sTime;
  RTC_DateTypeDef sDate;
  HAL_RTC_GetTime(hrtc, &sTime, RTC_FORMAT_BIN);
  HAL_RTC_GetDate(hrtc, &sDate, RTC_FORMAT_BIN);

  uint32_t next_alarm_second = sTime.Seconds + duration_ms;
  uint32_t next_alarm_minute = sTime.Minutes + next_alarm_second / 60;
  uint8_t next_alarm_hour = (sTime.Hours + next_alarm_minute / 60) % 24;
  next_alarm_second %= 60;
  next_alarm_minute %= 60;

  printf("duration_ms: %d\n", duration_ms);
  printf("current: %d %d %d\n", sTime.Hours, sTime.Minutes, sTime.Seconds);
  printf("next: %d %d %d\n", next_alarm_hour, next_alarm_minute, next_alarm_second);
  printf("---\n");

  RTC_AlarmTypeDef sAlarm;
  sAlarm.AlarmTime.Seconds = next_alarm_second;
  sAlarm.AlarmTime.Minutes = next_alarm_minute;
  sAlarm.AlarmTime.Hours = next_alarm_hour;
  sAlarm.AlarmTime.DayLightSaving = RTC_DAYLIGHTSAVING_NONE;
  sAlarm.AlarmTime.StoreOperation = RTC_STOREOPERATION_RESET;
  sAlarm.AlarmMask = RTC_ALARMMASK_DATEWEEKDAY;
  sAlarm.AlarmSubSecondMask = RTC_ALARMSUBSECONDMASK_ALL;
  sAlarm.AlarmDateWeekDaySel = RTC_ALARMDATEWEEKDAYSEL_DATE;
  sAlarm.AlarmDateWeekDay = 1;
  sAlarm.Alarm = RTC_ALARM_A;
  HAL_RTC_SetAlarm_IT(hrtc, &sAlarm, RTC_FORMAT_BIN);
  printf("sleeping...\n");
  HAL_PWR_EnterSTOPMode(PWR_LOWPOWERREGULATOR_ON, PWR_STOPENTRY_WFI);
  HAL_RTC_DeactivateAlarm(hrtc, RTC_ALARM_A);
  rtc_sleep_duration_ms += duration_ms;
}

void rtc_sleep(RTC_HandleTypeDef *hrtc, uint32_t duration_ms)
{
  if(duration_ms <= 10)
    return;
  // __disable_irq();
  // 40KHz LSI, RTC asyc prediv 18, sync prediv 0
  duration_ms *= 2;
  RTC_TimeTypeDef sTime;
  RTC_DateTypeDef sDate;
  HAL_RTC_GetTime(hrtc, &sTime, RTC_FORMAT_BIN);
  HAL_RTC_GetDate(hrtc, &sDate, RTC_FORMAT_BIN);

  uint32_t next_alarm_second = sTime.Seconds + duration_ms;
  uint32_t next_alarm_minute = sTime.Minutes + next_alarm_second / 60;
  uint8_t next_alarm_hour = (sTime.Hours + next_alarm_minute / 60) % 24;
  next_alarm_second %= 60;
  next_alarm_minute %= 60;

  RTC_AlarmTypeDef sAlarm;
  sAlarm.AlarmTime.Seconds = next_alarm_second;
  sAlarm.AlarmTime.Minutes = next_alarm_minute;
  sAlarm.AlarmTime.Hours = next_alarm_hour;
  sAlarm.AlarmTime.DayLightSaving = RTC_DAYLIGHTSAVING_NONE;
  sAlarm.AlarmTime.StoreOperation = RTC_STOREOPERATION_RESET;
  sAlarm.AlarmMask = RTC_ALARMMASK_DATEWEEKDAY|RTC_ALARMMASK_HOURS;
  sAlarm.AlarmSubSecondMask = RTC_ALARMSUBSECONDMASK_ALL;
  sAlarm.AlarmDateWeekDaySel = RTC_ALARMDATEWEEKDAYSEL_DATE;
  sAlarm.AlarmDateWeekDay = 1;
  sAlarm.Alarm = RTC_ALARM_A;
  printf("sa\n");
  uint8_t result = HAL_RTC_SetAlarm_IT(hrtc, &sAlarm, RTC_FORMAT_BIN);
  printf("%d\n", result);
  // __enable_irq();
  // HAL_Delay(duration_ms);
  HAL_PWR_EnterSTOPMode(PWR_LOWPOWERREGULATOR_ON, PWR_STOPENTRY_WFI);
  HAL_RTC_DeactivateAlarm(hrtc, RTC_ALARM_A);
  rtc_sleep_duration_ms += duration_ms;
}
