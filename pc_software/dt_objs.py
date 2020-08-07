import os
import sys

class dt_config(object):
	def load_config(self, msg):
		if not msg.startswith('dt_'):
			return False
		msg = msg.replace('\n', '').replace('\r', '')
		msg_split = msg.split(' ')
		# print(msg_split)
		if 'dt_tx' in msg:
			self.daytripper_type = 'tx'
		elif 'tx_rx' in msg:
			self.daytripper_type = 'rx'
		else:
			return False
		self.is_valid = False
		try:
			self.refresh_rate_Hz = int(msg_split[1])
			self.nr_sensitivity = int(msg_split[2])
			self.timing_budget_ms = int(msg_split[3])
			self.tof_range_max_cm = int(msg_split[4])*2
			self.tof_range_min_cm = int(msg_split[5])*2
			self.use_led = int(msg_split[6])
			self.op_mode = int(msg_split[7])
			self.print_debug_info = int(msg_split[8])
			self.tx_wireless_addr = int(msg_split[9])
			self.hardware_id = int(msg_split[10])
			self.tof_model_id = int(msg_split[11])
			self.fw_version_major = int(msg_split[12])
			self.fw_version_minor = int(msg_split[13])
			self.fw_version_patch = int(msg_split[14])
		except Exception as e:
			print('load_config:', str(e))
			return False
		self.is_valid = True
		return True

	def __str__(self):
		ret = ""
		ret += "is_valid: " + str(self.is_valid) + '\n'
		ret += "daytripper_type: " + str(self.daytripper_type) + '\n'
		ret += "refresh_rate_Hz: " + str(self.refresh_rate_Hz) + '\n'
		ret += "nr_sensitivity: " + str(self.nr_sensitivity) + '\n'
		ret += "timing_budget_ms: " + str(self.timing_budget_ms) + '\n'
		ret += "tof_range_max_cm: " + str(self.tof_range_max_cm) + '\n'
		ret += "use_led: " + str(self.use_led) + '\n'
		ret += "op_mode: " + str(self.op_mode) + '\n'
		ret += "print_debug_info: " + str(self.print_debug_info) + '\n'
		ret += "tx_wireless_addr: " + str(self.tx_wireless_addr) + '\n'
		ret += "hardware_id: " + str(self.hardware_id) + '\n'
		ret += "tof_model_id: " + str(self.tof_model_id) + '\n'
		ret += "fw_version: " + str(self.fw_version_major) + '.' + str(self.fw_version_minor) + '.' + str(self.fw_version_patch)
		return ret

	def __init__(self):
		super(dt_config, self).__init__()
		self.is_valid = False
		self.refresh_rate_Hz = 0
		self.nr_sensitivity = 0
		self.timing_budget_ms = 0
		self.tof_range_max_cm = 0
		self.tof_range_min_cm = 0
		self.use_led = 0
		self.op_mode = 0
		self.print_debug_info = 0
		self.tx_wireless_addr = 0
		self.hardware_id = 0
		self.tof_model_id = 0
		self.daytripper_type = 0
		self.fw_version_major = 0
		self.fw_version_minor = 0
		self.fw_version_patch = 0


