for vrefint in range(1, 256):
	for vbat_8b in range(1, 256):
		vbat_mV = (1200 / vrefint) * vbat_8b * 2
		print(vrefint, vbat_8b, vbat_mV)