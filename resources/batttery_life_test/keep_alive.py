import os
import time

# python keep_alive.py &>> bat_log.txt

while 1:
	os.system("python -u log.py")
	time.sleep(5)