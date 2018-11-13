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

  // VL53L0X_init();
  // setTimeout(500);
  // setMeasurementTimingBudget(20000);

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
