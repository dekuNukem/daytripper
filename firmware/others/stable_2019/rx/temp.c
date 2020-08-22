printf("cmd type: trigger\nbase: %d, this: %d\n, switch: %d", baseline, this_reading, get_slide_sw_pos());

for (int i = 0; i < 6; ++i)
        printf("%d ", received_data[i]);
      printf("\n");

if(nrf24_dataReady())
    {
      HAL_GPIO_WritePin(USER_LED_GPIO_Port, USER_LED_Pin, GPIO_PIN_SET);
      nrf24_getData(received_data);
      if(strncmp(received_data, correct_packet, NRF_PAYLOAD_SIZE) != 0)
        continue;
      press_keys(get_slide_sw_pos());
      HAL_GPIO_WritePin(USER_LED_GPIO_Port, USER_LED_Pin, GPIO_PIN_RESET);
    }

nrf24_getStatus

    // HAL_Delay(500);
    // printf("hello world\n");
HAL_Delay(500);
    printf("%d\n", nrf24_getStatus());
    HAL_GPIO_TogglePin(USER_LED_GPIO_Port, USER_LED_Pin);


nrf24_init();
  nrf24_config(2,4);
  nrf24_tx_address(tx_address);
  nrf24_rx_address(rx_address);

    if(nrf24_dataReady())
    {
        nrf24_getData(data_array);        
        printf("> ");
        printf("%2X ",data_array[0]);
        printf("%2X ",data_array[1]);
        printf("%2X ",data_array[2]);
        printf("%2X\r\n",data_array[3]);
    }
    HAL_GPIO_TogglePin(USER_LED_GPIO_Port, USER_LED_Pin);
  
    printf("%d\n", get_slide_sw_pos());

keyboard_press(KEY_LEFT_GUI, 0);
        HAL_Delay(34);
        keyboard_press('d', 0);
        HAL_Delay(34);
        keyboard_release_all();
        HAL_Delay(100);


void press_keys(void)
{
    switch (get_slide_sw_pos())
    {
    case SLIDE_SW_POS_MINI:
      keyboard_press('M', 1);
      HAL_Delay(34);
      keyboard_release_all();
      HAL_Delay(10);
      break;
    case SLIDE_SW_POS_CUSTOM:
        keyboard_press('C', 1);
      HAL_Delay(34);
      keyboard_release_all();
      HAL_Delay(10);
      break;
    case SLIDE_SW_POS_LOCK:
        keyboard_press('L', 1);
      HAL_Delay(34);
      keyboard_release_all();
      HAL_Delay(10);
      break;
    }
}
    if(nrf24_dataReady())
    {
        nrf24_getData(data_array);        
        printf("> ");
        printf("%d ",data_array[0]);
        printf("%d ",data_array[1]);
        printf("%d ",data_array[2]);
        printf("%d\n",data_array[3]);
        
        press_keys(get_slide_sw_pos());

        HAL_GPIO_TogglePin(USER_LED_GPIO_Port, USER_LED_Pin);
    }