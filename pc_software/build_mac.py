import os
import sys

"""
https://py2app.readthedocs.io/en/latest/tutorial.html

OPTIONS = {'iconfile':'icon.icns'}

rm -rf build dist

python3.8 setup.py py2app
"""

if 'darwin' not in sys.platform:
    print("this script is for macOS only!")
    exit()

os.system('rm -rfv ./__pycache__')
os.system('rm -rfv ./build')
os.system('rm -rfv ./dist')
os.system('rm -rfv ./*.zip')

THIS_VERSION = None
try:
	mainfile = open('daytripper_config.py')
	for line in mainfile:
		if "THIS_VERSION_NUMBER =" in line:
			THIS_VERSION = line.replace('\n', '').replace('\r', '').split("'")[-2]
	mainfile.close()
except Exception as e:
	print('build_mac exception:', e)
	exit()

if THIS_VERSION is None:
	print('could not find version number!')
	exit()

print(THIS_VERSION)
os.system("python3 setup.py py2app")

output_folder_path = os.path.join('.', "dist")
original_name = os.path.join(output_folder_path, "daytripper_config.app")
new_name = os.path.join(output_folder_path, "daytripper_config_" + THIS_VERSION + "_macOS.app")

print(original_name)
print(new_name)

os.rename(original_name, new_name)
zip_file_name = "daytripper_config_" + THIS_VERSION + "_macOS.zip"
os.system('cd dist; zip -rv ' + zip_file_name + ' ' + new_name.split('/')[-1] + "; mv " + zip_file_name + " ../")

os.system('rm -rfv ./__pycache__')
os.system('rm -rfv ./build')
os.system('rm -rfv ./dist')
