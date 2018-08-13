#include "axdl345.h"
#include "shared.h"

#define ACC_RECV_BUF_SIZE 32
#define INT16_MAX 32767
#define INT16_MIN -32768

int16_t acc_sample[ACC_RECV_BUF_SIZE];
uint8_t fifo_sample[6];

uint8_t read_reg(uint8_t device_addr, uint8_t reg_addr)
{
  uint8_t ret;
  HAL_I2C_Mem_Read(acc_i2c_ptr, device_addr, reg_addr, 1, &ret, 1, 500);
  return ret;
}

void write_reg(uint8_t device_addr, uint8_t reg_addr, uint8_t value)
{
  uint8_t write_buf[2] = {reg_addr, value};
  HAL_I2C_Master_Transmit(acc_i2c_ptr, device_addr, write_buf, 2, 500);
}

void read_nreg(uint8_t device_addr, uint8_t reg_addr, uint8_t *buf, int32_t length)
{
  HAL_I2C_Mem_Read(acc_i2c_ptr, device_addr, reg_addr, 1, buf, length, 500);
}

void acc_init()
{
  printf("initalizing ADXL...\n");
  write_reg(ADXL345_ADDRESS, ADXL345_REG_POWER_CTL, 0);
  write_reg(ADXL345_ADDRESS, ADXL345_REG_DATA_FORMAT, 0x2); // range 8g
  write_reg(ADXL345_ADDRESS, ADXL345_REG_BW_RATE, 0x4); // data rate 4 is 20 seconds
  write_reg(ADXL345_ADDRESS, ADXL345_REG_FIFO_CTL, 0x9f); // FIFO stream mode, 32 sample watermark
  write_reg(ADXL345_ADDRESS, ADXL345_REG_INT_MAP, 0); // interrupt all on pin 1
  write_reg(ADXL345_ADDRESS, ADXL345_REG_INT_ENABLE, 0x2); // enable watermark interrupt
  write_reg(ADXL345_ADDRESS, ADXL345_REG_POWER_CTL, 0x8); // start measurement
  printf("clearing FIFO...\n");
  acc_clear_fifo();
}

void acc_clear_fifo()
{
  for(int i = 0; i < ACC_RECV_BUF_SIZE; i++)
    read_nreg(ADXL345_ADDRESS, ADXL345_REG_DATAX0, fifo_sample, 6);
  printf("acc FIFO cleared!\n");
}

int16_t process_acc_list()
{
  int16_t acc_max = INT16_MIN;
  int16_t acc_min = INT16_MAX;
  for (int i = 0; i < ACC_RECV_BUF_SIZE; i++)
  {
    acc_sample[i] > acc_max ? acc_max = acc_sample[i] : acc_max;
    acc_sample[i] < acc_min ? acc_min = acc_sample[i] : acc_min;
  }
  return acc_max - acc_min;
}

int16_t acc_read_fifo()
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
  return process_acc_list();
}

