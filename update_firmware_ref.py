import os
import sys

if not (sys.version_info.major >= 3 and sys.version_info.minor >= 4):
	print('update_firmware_ref: PYTHON VERISON TOO LOW, 3.4+ REQUIRED')
	exit()

try:
	dfu_folder = os.path.join('.', 'firmware')
	dfu_folder = os.path.join(dfu_folder, 'dfu_files')
	tx_dfu_file_list = [d for d in os.listdir(dfu_folder) if d.startswith('TX_') and d.endswith('.dfu')]
	tx_dfu_file_list.sort(key=lambda s: list(map(int, s.replace('TX_', '').replace('.dfu', '').split('.'))))
	latest_tx_dfu_file_name = tx_dfu_file_list[-1]
	rx_dfu_file_list = [d for d in os.listdir(dfu_folder) if d.startswith('RX_') and d.endswith('.dfu')]
	rx_dfu_file_list.sort(key=lambda s: list(map(int, s.replace('RX_', '').replace('.dfu', '').split('.'))))
	latest_rx_dfu_file_name = rx_dfu_file_list[-1]
	print('latest TX dfu file is:', latest_tx_dfu_file_name)
	print('latest RX dfu file is:', latest_rx_dfu_file_name)
except Exception as e:
	print("update_firmware_ref: get latest dfu exception:", e)
	exit()

readme_file = open('advanced_usage.md')
readme_lines = readme_file.readlines()
readme_file.close()

changes_made = False
for index, line in enumerate(readme_lines):
	if 'Click me' in line and 'for latest TX firmware' in line:
		readme_lines[index] = "* [Click me](https://github.com/dekuNukem/daytripper/raw/master/firmware/dfu_files/" + str(latest_tx_dfu_file_name) + ") for latest TX firmware (" + latest_tx_dfu_file_name.replace('TX_', '').replace('.dfu', '') + ")\n"
		changes_made = True
	if 'Click me' in line and 'for latest RX firmware' in line:
		readme_lines[index] = "* [Click me](https://github.com/dekuNukem/daytripper/raw/master/firmware/dfu_files/" + str(latest_rx_dfu_file_name) + ") for latest RX firmware (" + latest_rx_dfu_file_name.replace('RX_', '').replace('.dfu', '') + ")\n"
		changes_made = True

if changes_made:
	readme_file = open('advanced_usage.md', 'w')
	readme_file.writelines(readme_lines)
	readme_file.close()
	print('update_firmware_ref: Success')
else:
	print('update_firmware_ref: TARGET STRING NOT FOUND, CHECK MD FILE!!!!!!!!!!!')