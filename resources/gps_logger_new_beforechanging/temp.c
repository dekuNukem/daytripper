// HAL_NVIC_DisableIRQ(EXTI0_1_IRQn);
  // HAL_NVIC_DisableIRQ(EXTI4_15_IRQn);
  // HAL_NVIC_DisableIRQ(RTC_IRQn);
  // HAL_NVIC_DisableIRQ(ADC1_IRQn);
  // HAL_NVIC_DisableIRQ(USART2_IRQn);

   hwif_init_0();
  linear_buf_init(&gps_lb);
  printf("mounting...\n");
  sd_fresult = f_mount(&sd_fs, "", 1);
  printf("result: %d\n", sd_fresult);

  sd_fresult = f_open(&sd_file, "hello.txt", FA_WRITE | FA_OPEN_ALWAYS);
  printf("result: %d\n", sd_fresult);

  sd_fresult = f_write(&sd_file, "hello world!\n", 13, &sd_bytes_written);
  printf("result: %d\n", sd_fresult);

  sd_fresult = f_close(&sd_file);
  printf("result: %d\n", sd_fresult);


  RTC_TimeTypeDef curr_time;
    RTC_DateTypeDef curr_date;
    HAL_RTC_GetTime(&hrtc, &curr_time, RTC_FORMAT_BIN);
    HAL_RTC_GetDate(&hrtc, &curr_date, RTC_FORMAT_BIN);
    printf("%d\n", curr_time.Seconds);

  RTC_TimeTypeDef curr_time;

  RTC_TimeTypeDef alarm_time;
  alarm_time.Hours = 0;
  alarm_time.Minutes = 0;
  alarm_time.Seconds = 5;
  alarm_time.TimeFormat = RTC_HOURFORMAT12_AM;
  alarm_time.SubSeconds = 0;
  alarm_time.SecondFraction = 0;
  alarm_time.DayLightSaving = RTC_DAYLIGHTSAVING_NONE;
  alarm_time.StoreOperation = RTC_STOREOPERATION_RESET;

  RTC_AlarmTypeDef alarm_test;
  alarm_test.AlarmTime = alarm_time;
  alarm_test.AlarmMask = RTC_ALRMAR_MSK4 | RTC_ALRMAR_MSK3 | RTC_ALRMAR_MSK2;
  alarm_test.AlarmSubSecondMask = RTC_ALARMSUBSECONDMASK_ALL;
  alarm_test.AlarmDateWeekDaySel = RTC_ALARMDATEWEEKDAYSEL_DATE;
  alarm_test.AlarmDateWeekDay = 1;
  alarm_test.Alarm = RTC_ALARM_A;


  HAL_RTC_GetTime(&hrtc, &curr_time, RTC_FORMAT_BIN);
    HAL_RTC_GetDate(&hrtc, &curr_date, RTC_FORMAT_BIN);


RTC_DateTypeDef alarm_date;
  alarm_date.WeekDay = 0;
  alarm_date.Month = 0;
  alarm_date.Date = 0;
  alarm_date.Year = 0;

printf("%d %d %d\n", acc_x, acc_y, acc_z);
    printf("%d\n", acc_sample[i]);

void read_fifo()
{
  int16_t acc_x = 0, acc_y = 0, acc_z = 0;
  read_nreg(ADXL345_ADDRESS, ADXL345_REG_DATAX0, fifo_sample, 6);
  acc_x = (((int16_t)fifo_sample[1] << 8) | (int16_t)fifo_sample[0]);
  acc_y = (((int16_t)fifo_sample[3] << 8) | (int16_t)fifo_sample[2]);
  acc_z = (((int16_t)fifo_sample[5] << 8) | (int16_t)fifo_sample[4]);
  printf("%d %d %d\n", acc_x, acc_y, acc_z);
}

int32_t read_fifo()
{
  uint8_t available_count = read_reg(ADXL345_ADDRESS, ADXL345_REG_FIFO_STATUS) & 0x3f;
  if(available_count < 32)
    return 1;
  for (int i = 0; i < ACC_RECV_BUF_SIZE; i++)
  {
    read_nreg(ADXL345_ADDRESS, ADXL345_REG_DATAX0, fifo_sample, 6);
    printf("%d\n", fifo_sample[4]);
    acc_fifo_z[i] = (((int16_t)fifo_sample[5] << 8) | (int16_t)fifo_sample[4]) & 0x3ff;
  }
  // for (int i = 0; i < ACC_RECV_BUF_SIZE; ++i)
  //   printf("%d: %d\n", i, acc_fifo_z[i]);
  return 0;
}

    uint8_t result = read_reg(ADXL345_ADDRESS, ADXL345_REG_DATAX0);
    printf("%#x\n", result);
  HAL_NVIC_DisableIRQ(EXTI0_1_IRQn);
  deepsleep();
  HAL_GPIO_WritePin(LED_PORT, SD_LED_Pin, HIGH);
  while (1)
  {
  /* USER CODE END WHILE */

  /* USER CODE BEGIN 3 */
    HAL_UART_Receive_IT(&huart2, gps_byte_buf, 1);
    if(HAL_GetTick() - gps_lb.last_recv > 5 && gps_lb.buf[0])
    {
      rmc_result = latest_rmc(&gps_lb, rmc_buf, RMC_BUF_SIZE);
      if(rmc_result == 0)
      {
        printf(rmc_buf);
        parse_gps(rmc_buf, &gps_rmc, &gps_gga);
        if(gps_rmc.valid)
          printf("%d %d %d\n", gps_rmc.date.year, gps_rmc.date.month, gps_rmc.date.day);
      }
      linear_buf_reset(&gps_lb);
    }
  }

Program Size: Code=22664 RO-data=1604 RW-data=148 ZI-data=5052  
    HAL_UART_Receive_IT(&huart2, gps_byte_buf, 1);
    if(HAL_GetTick() - gps_lb.last_recv > 5 && gps_lb.buf[0])
    {
      // printf(gps_lb.buf);
      char* rmc_start = latest_rmc(&gps_lb, rmcbuf, buf_size);
      if(rmc_start != NULL)
      {
        printf("%d\n", rmc_start[0]);
        printf(rmc_start);
        parse_gps(rmc_start, &gps_rmc, &gps_gga, &gps_gsa, &gps_gll, &gps_gst, &gps_gsv);
        printf("%d %d %d\n", gps_rmc.date.year, gps_rmc.date.month, gps_rmc.date.day);
      }
      linear_buf_reset(&gps_lb);
    }

char* test = "$GNRMC,153807.00,A,3201.68128,N,11850.33641,E,0.000,,170716,,,A*6B\r\n";
parse_gps(test, &gps_rmc, &gps_gga, &gps_gsa, &gps_gll, &gps_gst, &gps_gsv);
printf("%d %d %d\n", gps_rmc.date.year, gps_rmc.date.month, gps_rmc.date.day);
HAL_Delay(500);

$GNRMC,153802.00,A,3201.68128,N,11850.33641,E,0.012,,170716,,,A*6D
$GNGGA,153802.00,3201.68128,N,11850.33641,E,1,11,1.19,40.1,M,2.6,M,,*4C

HAL_NVIC_DisableIRQ(EXTI0_1_IRQn);
HAL_NVIC_DisableIRQ(EXTI4_15_IRQn);
HAL_NVIC_DisableIRQ(RTC_IRQn);
HAL_NVIC_DisableIRQ(ADC1_IRQn);
HAL_NVIC_DisableIRQ(USART2_IRQn);

// __HAL_RCC_PLL_DISABLE();

HAL_GPIO_TogglePin(LED_PORT, SD_LED_Pin);

    char* ln = latest_nmea(&gps_lb);
  if(ln != NULL)
  {
    printf("vvvvvv\n");
    printf(ln);
    printf("^^^^^^\n");
  }


int32_t latest_rmc(linear_buf *lb, char* rmc_buf, int32_t buf_size)
{
  if(lb == NULL)
    return 1;
  char* buf_start = lb->buf;
  char* buf_end = lb->buf + LB_SIZE - 1;
  char* curr = buf_start;
  char* last_newline = NULL;
  char* rmc_start = NULL;
  char* rmc_end = NULL;
  while(curr <= buf_end)
  {
    if(*curr == '\n')
      last_newline = curr;
    curr++;
  }
  if(last_newline == NULL)
    return 2;
  curr = last_newline;
  while(curr >= buf_start)
  {
    if(strncmp("RMC", curr, 3) == 0)
    {
      rmc_start = curr - 3;
      break;
    }
    curr--;
  }
  if(rmc_start == NULL)
    return 3;
  curr = rmc_start;
  while(curr <= buf_end)
  {
    if(*curr == '\n')
    {
      rmc_end = curr;
      break;
    }
    curr++;
  }
  if(rmc_end == NULL)
    return 4;
  memset(rmc_buf, 0, buf_size);
  strncpy(rmc_buf, rmc_start, rmc_end - rmc_start + 1);
  return 0;
}

if(HAL_GetTick() - gps_scratch_lb.last_recv > 5 && gps_scratch_lb.buf[0])
    {
      printf(gps_scratch_lb.buf);
      // int32_t rmc_result = match_rmc(gps_scratch_lb.buf, rmc_buf, RMC_BUF_SIZE);
      // if(rmc_result == 0)
      // {
      //   printf(rmc_buf);
      //   parse_gps(rmc_buf, &gps_rmc);
      //   if(gps_rmc.valid)
      //     printf("%d %d %d\n", gps_rmc.date.year, gps_rmc.date.month, gps_rmc.date.day);
      // }
      linear_buf_reset(&gps_scratch_lb);
    }


printf("vvv\n");
  printf(buf_start);
  printf("^^^\n");

if(gps_rmc.valid)
      printf("%d %d %d\n", gps_rmc.date.year, gps_rmc.date.month, gps_rmc.date.day);

    printf("filename should be: %s\n", temp_filename);
    printf("filename is: %s", curr_filename);
    printf("\n");

// printf("nmea_len: %d\n", nmea_len);
  // printf("write_buf_len: %d\n", write_buf_len);


int8_t sd_add(char* nmea_buf)
{
  if(gps_rmc.valid == 0 && curr_filename[0] == 0)
  {
    // no fix and no known file name, clear the buffer and return
    printf("no known filename!\n");
    CLEAR_SD_WRITE_BUF();
    return 1;
  }

  if(gps_rmc.valid)
  {
    memset(temp_filename, 0, FILE_NAME_BUF_SIZE);
    sprintf(temp_filename, "20%d%02d%02d.txt", gps_rmc.date.year, gps_rmc.date.month, gps_rmc.date.day);
    if(strcmp(temp_filename, curr_filename) != 0) // a new day passed
    {
      memcpy(curr_filename, temp_filename, FILE_NAME_BUF_SIZE);
      f_close(&sd_file);
      sd_fresult = f_open(&sd_file, curr_filename, FA_WRITE | FA_OPEN_ALWAYS);
      printf("creating new file %s... result: %d\n", curr_filename, sd_fresult);
      sd_fresult = f_lseek(&sd_file, f_size(&sd_file));
      printf("moving to end of file... result: %d\n", sd_fresult);
    }
  }
  // now the correct file is open and write pointer at end
  sd_write_buf[SD_WRITE_BUF_SIZE] = 0;
  int16_t write_buf_len = strlen(sd_write_buf);
  int16_t nmea_len = strlen(nmea_buf);
  printf("write_buf: %d/%d\n", write_buf_len, SD_WRITE_BUF_SIZE);
  if(write_buf_len + nmea_len <= SD_WRITE_BUF_SIZE)
    strcpy(sd_write_buf + write_buf_len, nmea_buf);
  else
  {
    int16_t remaining = SD_WRITE_BUF_SIZE - write_buf_len;
    strncpy(sd_write_buf + write_buf_len, nmea_buf, remaining);
    // massive error handling to be implemented here, out of space, etc
    sd_fresult = f_write(&sd_file, sd_write_buf, SD_WRITE_BUF_SIZE, &sd_bytes_written);
    sd_fresult = f_sync(&sd_file);
    while(sd_bytes_written != SD_WRITE_BUF_SIZE)
    {
      printf("DISK FULL!\n");
      HAL_Delay(1000);
    }
    printf("commiting to SD... result: %d\n", sd_fresult);
    CLEAR_SD_WRITE_BUF();
    strncpy(sd_write_buf, nmea_buf + remaining, nmea_len - remaining);
  }
  return 0;
}

int8_t mnea_handler(linear_buf *lb)
{
  if(lb == NULL)
    return 1;
  char* buf_start = lb->buf;
  if(strstr(buf_start, "TXT") != NULL || buf_start[0] != '$')
  {
    printf("TXT skipped / wrong start\n");
    linear_buf_reset(lb);
    return 2;
  }
  if(buf_start[strlen(buf_start) - 1] != '\n')
    return 3;
  HAL_GPIO_WritePin(LED_PORT, SD_LED_Pin, HIGH);
  printf(buf_start);
  if(match_rmc(buf_start, rmc_buf, RMC_BUF_SIZE) == 0)
    parse_gps(rmc_buf, &gps_rmc);

  sd_add(buf_start);
  linear_buf_reset(lb);
  HAL_GPIO_WritePin(LED_PORT, SD_LED_Pin, LOW);
  return 0;
}

if(strstr(buf_start, "TXT") != NULL || strncmp(buf_start, "$G", 2) != 0)

void HAL_RTC_AlarmAEventCallback(RTC_HandleTypeDef *hrtc)
{
  printf("RTC alarm!\n");
}

HAL_UART_Receive_IT(&huart2, gps_byte_buf, 1);
    if(HAL_GetTick() - gps_scratch_lb.last_recv > 5 && gps_scratch_lb.buf[0])
      mnea_handler(&gps_scratch_lb);
HAL_GPIO_WritePin(GPS_INT_GPIO_Port, GPS_INT_Pin, HIGH);

    if(wakeup_reason != RUNNING)
    {
      printf("I woke up because: %d\n", wakeup_reason);
      wakeup_reason = RUNNING;
    }

void acc_read_fifo()
{
  int16_t acc_x = 0, acc_y = 0, acc_z = 0;
  for (int i = 0; i < ACC_RECV_BUF_SIZE; i++)
  {
    read_nreg(ADXL345_ADDRESS, ADXL345_REG_DATAX0, fifo_sample, 6);
    acc_x = (((int16_t)fifo_sample[1] << 8) | (int16_t)fifo_sample[0]);
    acc_y = (((int16_t)fifo_sample[3] << 8) | (int16_t)fifo_sample[2]);
    acc_z = (((int16_t)fifo_sample[5] << 8) | (int16_t)fifo_sample[4]);
    acc_sample[i] = acc_x + acc_y + acc_z;
  }
  printf("got new batch\n");
  for (int i = 0; i < ACC_RECV_BUF_SIZE; ++i)
    printf("%d, ", acc_sample[i]);
  printf("\n");
}

printf("max: %d, min: %d, diff: %d\n", acc_max, acc_min, acc_max - acc_min);

void acc_test()
{
  acc_init();
  while(1)
  {
    acc_read_fifo();
  }
}
void check_battery()
{
  clear_dma_buf();
  HAL_ADC_Start_DMA(adc_ptr, adc_dma_buf, ADC_DMA_BUF_SIZE);
  while(1)
  {
    HAL_ADC_Start(adc_ptr);
    if(dac_available)
    {
      printf("O shit\n");
      for (int i = 0; i < ADC_DMA_BUF_SIZE; ++i)
        printf("%d: %d, ", i, adc_dma_buf[i]);
      printf("\n");
      clear_dma_buf();
      dac_available = 0;
    }
  }
}

float calc_vbat(uint32_t adc_vref, uint32_t adc_vbat_div2)
{
  float ret;
  adc_vref == 0 ? adc_vref = 1 : adc_vref;
  printf("vbat_div2: %d, vref: %d\n", adc_vbat_div2, adc_vref);
  ret = (1.2 / (float)adc_vref) * adc_vbat_div2 * 2;
  printf("vbat: %f\n", ret);
}

while(1)
  {
    int32_t start = HAL_GetTick();
    check_battery();
    printf("took %d ms\n", HAL_GetTick() - start);
    HAL_Delay(100);
  }

printf("battery: %f\n", check_battery());
 if(HAL_GetTick() - lb->last_recv > 5 && lb->buf[0])
    {
      printf(lb->buf);
      linear_buf_reset(lb);
      return 0;
    }
    if(HAL_GetTick() - start > 150 && HAL_GetTick() - lb->last_recv > 5 && lb->buf[0])


if(HAL_GetTick() - lb->last_recv > 150 && lb->buf[0])
    {
      int8_t result = mnea_handler(lb);
      printf("mnea_handler: %d\n", result);
      return result;
    }

if(strstr(buf_start, "TXT") != NULL || buf_start[0] != '$')
  {
    printf("TXT skipped:\n");
    printf(buf_start);
    linear_buf_reset(lb);
    return 2;
  }

  if(buf_start[strlen(buf_start) - 1] != '\n')
  {
    // printf("no newline: %s\n", buf_start);
    return 4;
  }

printf("vbat_div2: %d, vref: %d\n", adc_vbat_div2, adc_vref);

  HAL_SuspendTick();
  HAL_PWR_EnterSTANDBYMode();
  printf("I somehow woke up\n");

    if(wakeup_reason == ACC_WATERMARK || HAL_GPIO_ReadPin(ACC_INT_GPIO_Port, ACC_INT_Pin) == HIGH)
    {
      acc_wakeup_count++;
      vbat = check_battery();
      if(vbat >= 1 && vbat < 3.5)
        low_bat_shutoff();
      int16_t acc_result = acc_read_fifo();
      printf("acc wakeup: %d, %fV, %d\n", acc_result, vbat, acc_wakeup_count);

      if(acc_wakeup_count == next_acc_check)
        gps_off();
      
      if(acc_result > ACC_MOTION_THRESHOLD)
        gps_on();
      else
        next_acc_check = acc_wakeup_count + 1;
    }

 // if(next_gps_wakeup != -1 && acc_wakeup_count < next_gps_wakeup)
      //   return;


      if(acc_result > ACC_MOTION_THRESHOLD)
      {
        // already have fix
        if(last_fix_ts == acc_wakeup_count - 1)
        gps_on();
      }



      else
        gps_off();


      else if(acc_result >= ACC_MOTION_THRESHOLD && acc_wakeup_count % 2) // has motion
      {
        // no fix for a while, schedule next check 2 cycles later
        if(gps_status() == HIGH && acc_wakeup_count - last_fix_ts >= 3)
        {
          next_gps_wakeup = acc_wakeup_count + 2;
          printf("no fix in the last 2 periods, next try at %d\n", next_gps_wakeup);
          gps_off();
        }
        else if(next_gps_wakeup != -1 && acc_wakeup_count != next_gps_wakeup)
          gps_off();
        else
        {
          gps_on();
          next_gps_wakeup = -1;
        }
      }

if(acc_ts <= 1)
        goto skip;