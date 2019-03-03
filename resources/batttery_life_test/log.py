import time
import serial

def time_str():
	return str(int(time.time()))

ser = serial.Serial('COM10', 115200)

while 1:
	received = ser.readline().decode().rstrip('\n')
	if len(received) <= 0:
		continue
	log_line = time_str() + " " + received
	print(log_line)