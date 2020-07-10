#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "helpers.h"
#include "VL53L0X.h"
#include "animation.h"
#include "nrf24.h"
#include "ee.h"

#define BASELINE_SAMPLE_SIZE 16
#define CHOP_SIZE 3

#define STM32F0_UUID0 ((uint32_t *)0x1FFFF7AC)
#define STM32F0_UUID1 ((uint32_t *)0x1FFFF7B0)
#define STM32F0_UUID2 ((uint32_t *)0x1FFFF7B4)

dt_conf daytripper_config;
dt_conf new_config;
uint8_t is_reading_valid;
uint16_t baseline_data[BASELINE_SAMPLE_SIZE];
uint8_t test_data[NRF_PAYLOAD_SIZE];
uint32_t rtc_sleep_count_ms;
uint16_t rtc_counter;
RTC_TimeTypeDef sTime;
RTC_DateTypeDef sDate;
RTC_AlarmTypeDef sAlarm;
uint32_t next_alarm_second;
uint32_t next_alarm_minute;
uint8_t next_alarm_hour;
static const char whoami[] = "dekuNukem dayTripper TX";
static const char eep_erase_failed[] = "EEPROM ERASE ERROR";
static const char eep_write_failed[] = "EEPROM WRITE ERROR";
static const char eep_read_failed[] = "EEPROM READ ERROR";
static const char eep_invalid[] = "empty or invalid EEPROM, loading default.";
static const char eep_write_invalid[] = "EEPROM VALUES INVALID";


#define TEMP_BUF_SIZE 45
char temp_buf[TEMP_BUF_SIZE];
#define EEPROM_BUF_SIZE 16
uint8_t eeprom_buf[EEPROM_BUF_SIZE];

uint8_t get_uuid(void)
{
	uint32_t sum = *STM32F0_UUID0 + *STM32F0_UUID1 + *STM32F0_UUID2;
  return ((sum >> 24) ^ (sum >> 16) ^ (sum >> 8) ^ sum) & 0xff;
}

void swap(uint16_t *xp, uint16_t *yp) 
{ 
    uint16_t temp = *xp; 
    *xp = *yp; 
    *yp = temp; 
} 

void bubbleSort(uint16_t arr[], uint16_t n) 
{ 
 uint16_t i, j; 
  for (i = 0; i < n-1; i++)       
    for (j = 0; j < n-i-1; j++)  
      if (arr[j] > arr[j+1]) 
        swap(&arr[j], &arr[j+1]); 
}

uint16_t get_single_distance_reading(uint8_t* is_valid, uint16_t sleep_ms)
{
  uint16_t result = readRangeSingleMillimeters(sleep_ms);
  *is_valid = 1;
  if(result >= 1200)
    result = 1700;
  if(result < 20)
    *is_valid = 0;
  return result;
}

/*
get a baseline distance reading when powering up

first it takes BASELINE_SAMPLE_SIZE sample readings, 100ms apart
then the array containing the readings is sorted
then the first and last CHOP_SIZE samples are discarded from the sorted array
then the mean and variance is calculated 
if variance is too large, it means readings are unstable, try again
*/
uint16_t get_baseline(void)
{
  while(1)
  {
    uint32_t mean = 0;
    for (int i = 0; i < BASELINE_SAMPLE_SIZE; ++i)
    {
      baseline_data[i] = get_single_distance_reading(&is_reading_valid, 0);
      HAL_IWDG_Refresh(&hiwdg);
      HAL_Delay(100);
    }

    bubbleSort(baseline_data, BASELINE_SAMPLE_SIZE);

    for (int i = CHOP_SIZE; i < BASELINE_SAMPLE_SIZE - CHOP_SIZE; ++i)
      mean += baseline_data[i];
    mean /= (BASELINE_SAMPLE_SIZE - CHOP_SIZE * 2);

    uint32_t variance = 0;
    for (int i = CHOP_SIZE; i < BASELINE_SAMPLE_SIZE - CHOP_SIZE; ++i)
      variance += (baseline_data[i] - mean) * (baseline_data[i] - mean);
    variance /= (BASELINE_SAMPLE_SIZE - CHOP_SIZE * 2);

    if(variance <= 300)
    {
      printf("baseline: %d\n", mean);
      return mean;
    }
    
    printf("\ncalibration failed - variance too large: %d, samples:\n", variance);
    for (int i = CHOP_SIZE; i < BASELINE_SAMPLE_SIZE - CHOP_SIZE; ++i)
      printf("%d ", baseline_data[i]);
    printf("\n");
  }
}

uint16_t get_trigger_threshold(uint16_t baseline)
{
  // smaller number narrower deadzone, more sensitive
  return 0.3333*baseline;
}

void iwdg_wait(uint32_t msec, uint8_t ani_type)
{
  start_animation(ani_type);
  uint32_t start = HAL_GetTick();
  while(HAL_GetTick() - start <= msec)
    HAL_IWDG_Refresh(&hiwdg);
}

void tof_calibrate(uint16_t* base, uint16_t* threshold)
{
  printf("VL53L0X calibrating... ");
  *base = get_baseline();
  *threshold = get_trigger_threshold(*base);
}

// put this before IWDG_init so it can turn off after reset?
void check_battery(uint16_t* vbat_mV)
{
  // ADC channel 1 is connected to a resistor divider that halves the battery voltage
  HAL_ADC_Start(&hadc);
  HAL_ADC_PollForConversion(&hadc, 500);
  *vbat_mV = 26*(uint16_t)HAL_ADC_GetValue(&hadc);
  HAL_ADC_Stop(&hadc);
  // printf("vbat: %d\n", *vbat_mV);
  return;

  if(*vbat_mV >= 2500 && *vbat_mV <= 3250) // 3250 after diode drop is about 3.5V
  {
    // printf("low battery, shutting down...\n");
    start_animation(ANIMATION_TYPE_FASTBLINK);
    HAL_Delay(3000);
    start_animation(ANIMATION_TYPE_CONST_OFF);

    // turn off external chips
    nrf24_powerDown();
    HAL_GPIO_WritePin(NRF_CE_GPIO_Port, NRF_CE_Pin, GPIO_PIN_RESET);
    HAL_GPIO_WritePin(SPI1_CS_GPIO_Port, SPI1_CS_Pin, GPIO_PIN_SET);
    NRF_OFF();

    // disable all interrupts
    for (int i = 0; i <= 31; i++)
      HAL_NVIC_DisableIRQ(i);

    // turn off periphrials
    HAL_ADC_MspDeInit(&hadc);
    HAL_I2C_MspDeInit(&hi2c1);
    HAL_RTC_MspDeInit(&hrtc);
    HAL_SPI_MspDeInit(&hspi1);
    HAL_TIM_Base_MspDeInit(&htim2);
    HAL_TIM_Base_MspDeInit(&htim17);
    HAL_UART_MspDeInit(&huart2);

    // shut off
    HAL_PWR_EnterSTANDBYMode();
  }
}

void build_packet_trig(uint8_t* data, uint16_t base, uint16_t this)
{
  data[0] = get_uuid();
  data[1] = DTPR_CMD_TRIG;
  data[2] = base >> 8;
  data[3] = base & 0xff;
  data[4] = this >> 8;
  data[5] = this & 0xff;
}

void build_packet_stat(uint8_t* data, uint32_t vbat_mV, uint16_t pot)
{
  data[0] = get_uuid();
  data[1] = DTPR_CMD_STAT;
  data[2] = (vbat_mV >> 8) & 0xff;;
  data[3] = vbat_mV & 0xff;
  data[4] = (pot >> 8) & 0xff;
  data[5] = pot & 0xff;
}

uint8_t send_packet(uint8_t* data)
{
  nrf24_send(data);
  while(nrf24_isSending())
    HAL_IWDG_Refresh(&hiwdg);
  if(nrf24_lastMessageStatus() == NRF24_TRANSMISSON_OK)
  {
    // printf("TX OK, retry %d times\n", nrf24_retransmissionCount());
    printf("TX OK\n");
    return 0;
  }
  printf("TX failed\n");
  return 1;
}

// TX test mode, sends test packets every second
// can be used to test comm range
void tx_test(void)
{
  uint8_t count = 0;
  test_data[0] = get_uuid();
  test_data[1] = DTPR_CMD_TEST;

  while(1)
  {
    memset(test_data+2, count, 4);
    for (int i = 0; i < 6; ++i)
      printf("0x%x ", test_data[i]);
    printf("\n");
    count++;
    send_packet(test_data);
    iwdg_wait(150, ANIMATION_TYPE_CONST_ON);
    iwdg_wait(850, ANIMATION_TYPE_CONST_OFF);
  }
}
void run_time_update(uint32_t duration_ms)
{
  rtc_sleep_count_ms += duration_ms;
  rtc_counter += duration_ms;
}

void rtc_sleep(RTC_HandleTypeDef *hrtc, uint32_t duration_ms)
{
  if(duration_ms <= 0)
    return;
  // 40KHz LSI, RTC asyc prediv 18, sync prediv 0
  duration_ms *= 2;
  HAL_RTC_GetTime(hrtc, &sTime, RTC_FORMAT_BIN);
  HAL_RTC_GetDate(hrtc, &sDate, RTC_FORMAT_BIN);
  next_alarm_second = sTime.Seconds + duration_ms;
  next_alarm_minute = sTime.Minutes + next_alarm_second / 60;
  next_alarm_hour = (sTime.Hours + next_alarm_minute / 60) % 24;
  next_alarm_second %= 60;
  next_alarm_minute %= 60;

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
  HAL_RTC_DeactivateAlarm(hrtc, RTC_ALARM_A);
  HAL_RTC_SetAlarm_IT(hrtc, &sAlarm, RTC_FORMAT_BIN);
  HAL_SuspendTick();
  HAL_PWR_EnterSTOPMode(PWR_LOWPOWERREGULATOR_ON, PWR_STOPENTRY_WFI);
  HAL_ResumeTick();
  run_time_update(duration_ms/2);
  huart2.Instance->CR1 &= ~(USART_CR1_UE);
  huart2.Instance->BRR = 70;
  huart2.Instance->CR1 |= USART_CR1_UE;
}

int32_t linear_buf_init(linear_buf *lb, int32_t size)
{
  lb->buf_size = size;
  lb->buf = malloc(size);
  while(lb->buf == NULL)
  {
    printf("out of memory\n");
    HAL_Delay(250);
  }
  lb->last_recv = 0;
  linear_buf_reset(lb);
  return 0;
}

void linear_buf_reset(linear_buf *lb)
{
  lb->curr_index = 0;
  memset(lb->buf, 0, lb->buf_size);
}

int32_t linear_buf_add(linear_buf *lb, uint8_t c)
{
  lb->buf[lb->curr_index] = c;
  if(lb->curr_index < lb->buf_size)
    lb->curr_index++;
  lb->buf[lb->buf_size-1] = 0;
  lb->last_recv = HAL_GetTick();
  return 0;
}

int32_t linear_buf_add_str(linear_buf *lb, uint8_t *s, uint32_t len)
{
  for(uint32_t i = 0; i < len; i++)
    linear_buf_add(lb, s[i]);
  return 0;
}

void dt_conf_load_default(dt_conf *dtc)
{
  dtc->refresh_rate_Hz = 6;
  dtc->tof_range_mm = 0xff;
  dtc->use_led = 1;
  dtc->nr_sensitivity = 1;
  dtc->tx_wireless_channel = 0x0c;
  dtc->tof_timing_budget_ms = 25;
  dtc->op_mode = 0;
  dtc->print_debug_info = 1;

  dtc->hardware_id = get_uuid();
  dtc->rtc_sleep_duration_ms = (1000/dtc->refresh_rate_Hz) - dtc->tof_timing_budget_ms - 2;
  if(dtc->rtc_sleep_duration_ms < 0)
    dtc->rtc_sleep_duration_ms = 0;
}

uint8_t is_config_valid(uint8_t* arr)
{
  if(arr[0] == 0 || arr[2] > 1 || arr[3] > 2 || arr[6] > 1 || arr[7] > 1)
    return 0;
  return 1;
}

void dt_conf_load(dt_conf *dtc)
{
  dt_conf_load_default(dtc);
  memset(eeprom_buf, 0, EEPROM_BUF_SIZE);
  if(ee_read(0, EEPROM_BUF_SIZE, eeprom_buf) != 1)
  {
    puts(eep_read_failed);
    return;
  }
  if(is_config_valid(eeprom_buf) != 1)
  {
    puts(eep_invalid);
    return;
  }
  
  dtc->refresh_rate_Hz = eeprom_buf[0];
  dtc->tof_range_mm = eeprom_buf[1];
  dtc->use_led = eeprom_buf[2];
  dtc->nr_sensitivity = eeprom_buf[3];
  dtc->tx_wireless_channel = eeprom_buf[4];
  dtc->tof_timing_budget_ms = eeprom_buf[5];
  dtc->op_mode = eeprom_buf[6];
  dtc->print_debug_info = eeprom_buf[7];

  dtc->hardware_id = get_uuid();
  dtc->rtc_sleep_duration_ms = (1000/dtc->refresh_rate_Hz) - dtc->tof_timing_budget_ms - 2;
  if(dtc->rtc_sleep_duration_ms < 0)
    dtc->rtc_sleep_duration_ms = 0;
}

void dt_conf_print(dt_conf *dtc)
{
  printf("refresh_rate_Hz: %d\n", dtc->refresh_rate_Hz);
  printf("tof_range_mm: %d\n", dtc->tof_range_mm);
  printf("use_led: %d\n", dtc->use_led);
  printf("nr_sensitivity: %d\n", dtc->nr_sensitivity);
  printf("tx_wireless_channel: 0x%x\n", dtc->tx_wireless_channel);
  printf("tof_timing_budget_ms: %d\n", dtc->tof_timing_budget_ms);
  printf("hardware_id: 0x%x\n", dtc->hardware_id);
  printf("op_mode: %d\n", dtc->op_mode);
  printf("rtc_sleep_duration_ms: %d\n", dtc->rtc_sleep_duration_ms);
  printf("print_debug_info: %d\n", dtc->print_debug_info);
}

char* goto_next_arg(char* buf)
{
  char* curr = buf;
  if(curr == NULL)
    return NULL;
  char* buf_end = curr + strlen(curr);
  if(curr >= buf_end)
    return NULL;
  while(curr < buf_end && *curr != ' ')
      curr++;
  while(curr < buf_end && *curr == ' ')
      curr++;
  if(curr >= buf_end)
    return NULL;
  return curr;
}

#define CONFIG_ITEM_COUNT 8

void save_config(char* cmd)
{
  uint8_t count = 0;
  char* curr = cmd;
  while(1)
  {
    curr = goto_next_arg(curr);
    if(curr == NULL)
      break;
    count++;
  }
  if(count != CONFIG_ITEM_COUNT)
  {
    printf("ERROR\n");
    return;
  }
  memset(eeprom_buf, 0, EEPROM_BUF_SIZE);
  curr = cmd;
  for (int i = 0; i < count; ++i)
  {
    curr = goto_next_arg(curr);
    eeprom_buf[i] = atoi(curr);
  }
  if(is_config_valid(eeprom_buf) != 1)
  {
    puts(eep_write_invalid);
    return;
  }
  if(ee_format() != 1)
  {
    puts(eep_erase_failed);
    return;
  }
  if(ee_write(0, EEPROM_BUF_SIZE, eeprom_buf) != 1)
  {
    puts(eep_write_failed);
    return;
  }
  printf("OK\n");
}

void parse_cmd(char* cmd)
{
  if(cmd == NULL)
    return;
  // printf("received: %s\n", cmd);
  if(strcmp(cmd, "who") == 0)
    puts(whoami);
  else if(strcmp(cmd, "show") == 0)
  {
    memset(temp_buf, 0, TEMP_BUF_SIZE);
    sprintf(temp_buf, "dt_ee: %d %d %d %d %d %d %d %d %d\n", daytripper_config.refresh_rate_Hz, daytripper_config.tof_range_mm, daytripper_config.use_led, daytripper_config.nr_sensitivity, daytripper_config.tx_wireless_channel, daytripper_config.tof_timing_budget_ms, daytripper_config.op_mode, daytripper_config.print_debug_info, daytripper_config.hardware_id);
    puts(temp_buf);
  }
  else if(strncmp(cmd, "save ", 5) == 0)
    save_config(cmd);
}
