import json
import socket
import urllib.request

remote_url = "https://api.github.com/repos/dekuNukem/daytripper/releases/latest"

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
def has_update(this_version):
	if is_internet_available() is False:
		return 2
	try:
		result_dict = json.loads(urllib.request.urlopen(remote_url).read())
		this_version = versiontuple(this_version)
		remote_version = versiontuple(result_dict['tag_name'])
		if remote_version > this_version:
			return 1
	except Exception as e:
		print('has_update:', e)
		return 2
	return 0

# print(has_update('0.0.9'))