import json
import socket
import urllib.request

remote_url = "https://api.github.com/repos/dekuNukem/daytripper/releases/latest"
firmware_url = 'https://api.github.com/repos/dekuNukem/daytripper/contents/firmware?ref=master'

def is_internet_available():
    try:
        socket.create_connection(("www.google.com", 80))
        return True
    except OSError:
        pass
    return False

def versiontuple(v):
    return tuple(map(int, (v.strip('v').split("."))))

# 0 already up-to-date, 1 has updates, 2 failed to check
def get_pc_app_update_status(this_version):
	if is_internet_available() is False:
		return 2
	try:
		result_dict = json.loads(urllib.request.urlopen(remote_url).read())
		this_version = versiontuple(this_version)
		remote_version = versiontuple(result_dict['tag_name'])
		if remote_version > this_version:
			return 1
	except Exception as e:
		print('get_pc_app_update_status:', e)
		return 2
	return 0

"""
0 no update
1 has update
2 unknown
"""
def get_firmware_update_status(current_version):
	try:
		file_list = json.loads(urllib.request.urlopen(firmware_url).read())
		dfu_list = [x['name'] for x in file_list if 'name' in x and 'type' in x and x['type'] == 'file']
		dfu_list = [d.replace('TX_', '').replace('.dfu', '') for d in dfu_list if d.startswith('TX_') and d.endswith('.dfu')]
		dfu_list.sort(key=lambda s: list(map(int, s.split('.'))))
		this_version = versiontuple(current_version)
		remote_version = versiontuple(dfu_list[-1])
		# print('this:', this_version, '\nremote:', remote_version)
		return int(remote_version > this_version)
	except Exception as e:
		print('get_firmware_update_status:', e)
		return 2

# print(get_firmware_update_status('0.0.9'))