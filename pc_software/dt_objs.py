import os
import sys

class dp_key(object):
	def read_file(self, path):
		with open(path) as keyfile:
			self.script = keyfile.read()

	def read_color(self, config_path):
		with open(config_path) as configfile:
			for line in configfile:
				line = line.replace('\n', '').replace('\r', '')
				hotword = "SWCOLOR_" + str(self.index) + ' '
				while('  ' in line):
					line = line.replace('  ', ' ')
				if hotword in line:
					temp_split = line.split(' ')
					self.color = (int(temp_split[1]), int(temp_split[2]), int(temp_split[3]))

	def __str__(self):
		ret = ""
		ret += str('...............') + '\n'
		ret += "path:\t" + str(self.path) + '\n'
		ret += "name:\t" + str(self.name) + '\n'
		ret += "index:\t" + str(self.index) + '\n'
		ret += "color:\t" + str(self.color) + '\n'
		ret += "script:\t" + str(len(self.script)) + " characters\n"
		ret += str('...............') + '\n'
		return ret

	def __init__(self, path=None):
		super(dp_key, self).__init__()
		if path is None:
			self.path = None
			self.name = None
			self.index = None
			self.color = None
			self.script = ''
			return
		self.path = path
		self.name = os.path.basename(os.path.normpath(path)).split('.')[0].split('_', 1)[-1]
		self.index = int(os.path.basename(os.path.normpath(path)).split('_')[0].strip('key'))
		self.color = None
		self.script = ''
		self.read_file(path)
		try:
			config_path = os.path.join(os.path.dirname(path), "config.txt")
			self.read_color(config_path)
		except Exception as e:
			print(">>> read_color:", config_path, e)
			pass

# -----------------------------------------------------------

class dp_profile(object):
	def read_keys(self, path):
		key_file_list = [x for x in os.listdir(path) if x.endswith('.txt') and x.startswith('key') and '_' in x and x[3].isnumeric()]
		key_file_list.sort(key=lambda s: int(s[3:].split("_")[0])) # sort by number not by letter
		for item in key_file_list:
			this_key = dp_key(os.path.join(path, item))
			self.keylist[this_key.index -1] = this_key

	def read_config(self, path):
		try:
			with open(os.path.join(path, "config.txt")) as configfile:
				for line in configfile:
					line = line.replace('\n', '').replace('\r', '')
					while('  ' in line):
						line = line.replace('  ', ' ')
					if line.startswith('BG_COLOR '):
						temp_split = line.split(' ')
						self.bg_color = (int(temp_split[1]), int(temp_split[2]), int(temp_split[3]))
					if line.startswith('KEYDOWN_COLOR '):
						temp_split = line.split(' ')
						self.kd_color = (int(temp_split[1]), int(temp_split[2]), int(temp_split[3]))
					if line.startswith("DIM_UNUSED_KEYS 0"):
						self.dim_unused = False
		except Exception as e:
			print('>>>>> read_config:', path, e)
			pass

	def load_from_path(self, path):
		folder_name = os.path.basename(os.path.normpath(path))
		if not (folder_name.startswith('profile') and folder_name[7].isnumeric() and '_' in folder_name):
			print("invalid profile folder:", folder_name)
			return
		self.path = path
		self.name = folder_name.split('_', 1)[-1]
		self.read_config(path)
		self.read_keys(path)

	def __str__(self):
		ret = ""
		ret += str('-----Profile info-----') + '\n'
		ret += "path:\t" + str(self.path) + '\n'
		ret += "name:\t" + str(self.name) + '\n'
		ret += "bg_color:\t" + str(self.bg_color) + '\n'
		ret += "kd_color:\t" + str(self.kd_color) + '\n'
		ret += "dim_unused:\t" + str(self.dim_unused) + '\n'
		ret += "key count:\t" + str(len([x for x in self.keylist if x is not None])) + '\n'
		ret += "keys:\n"
		for item in [x for x in self.keylist]:
			ret += str(item) + '\n'
		ret += str('----------------------') + '\n'
		return ret

	def __init__(self):
		super(dp_profile, self).__init__()
		self.key_count = 15
		self.path = None
		self.name = None
		self.keylist = [None] * self.key_count
		self.bg_color = (84,22,180)
		self.kd_color = None
		self.dim_unused = True

def build_profile(root_dir_path):
	my_dirs = [d for d in os.listdir(root_dir_path) if os.path.isdir(os.path.join(root_dir_path, d))]
	my_dirs = [x for x in my_dirs if x.startswith('profile') and x[7].isnumeric() and '_' in x]
	my_dirs.sort(key=lambda s: int(s[7:].split("_")[0]))
	my_dirs = [os.path.join(root_dir_path, d) for d in my_dirs if d.startswith("profile")]
	profile_list = []
	for item in my_dirs:
		this_profile = dp_profile()
		this_profile.load_from_path(item)
		profile_list.append(this_profile)
	return profile_list

