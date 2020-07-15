import os
import time
import copy
import shutil
import pathlib
import dt_objs
import webbrowser
import check_update
from functools import partial
from tkinter import *
from tkinter import filedialog
from tkinter import simpledialog
from tkinter import messagebox
import serial.tools.list_ports
import serial

THIS_VERSION_NUMBER = '0.1.0'
MAIN_WINDOW_WIDTH = 720
MAIN_WINDOW_HEIGHT = 480
PADDING = 10
HEIGHT_CONNECT_LF = 50

def open_user_manual_url():
    webbrowser.open('https://github.com/dekuNukem/daytripper/blob/master/quick_start_guide.md')

def ensure_dir(dir_path):
    if not os.path.exists(dir_path):
        os.mkdir(dir_path)

root = Tk()
root.title("Daytripper configurator v" + THIS_VERSION_NUMBER)
root.geometry(str(MAIN_WINDOW_WIDTH) + "x" + str(MAIN_WINDOW_HEIGHT))
root.resizable(width=FALSE, height=FALSE)
daytripper_config = dt_objs.dt_config()

# ------------- serial select -------------

connection_lf = LabelFrame(root, text="Connection", width=MAIN_WINDOW_WIDTH - PADDING*2, height=HEIGHT_CONNECT_LF)
connection_lf.pack()
connection_lf.place(x=PADDING, y=0)
connection_lf.pack_propagate(False) 
root.update()

serial_var = StringVar()
serial_var.set(' ')
OptionList = ['']
serial_optlist = OptionMenu(connection_lf, serial_var, *OptionList)
# serial_optlist.config(width=100)
serial_optlist.pack()
serial_optlist.pack_propagate(False)
serial_optlist.place(x=115, y=0, width=240)
ser = serial.Serial()
ser.baudrate = 115200
hwif_label_stringvar = StringVar()

def serial_setname(wtf):
    serial_var.set(wtf)

def serial_dropdown_refresh():
    serial_optlist['menu'].delete(0, 'end')
    port_list = serial.tools.list_ports.comports()
    for item in port_list:
        port_name = str(item.device)
        serial_optlist['menu'].add_command(label=port_name, command=partial(serial_setname, port_name))
    if serial_var.get() == ' ' or serial_var.get() not in [str(x.device) for x in port_list]:
        serial_var.set(str(port_list[0].device))
    usb_port_list = [str(x.device) for x in port_list if 'usb' in str(x.device).lower()]
    if len(usb_port_list) > 0:
        serial_var.set(usb_port_list[0])

def make_info_string():
    if daytripper_config.is_valid == 0:
        return ''
    model_string = 'Unknown'
    if daytripper_config.daytripper_type == 'tx':
        model_string = "Daytripper TX"
    elif daytripper_config.daytripper_type == 'rx':
        model_string = "Daytripper RX"

    id_string = str(daytripper_config.hardware_id) + '(' + str(hex(daytripper_config.hardware_id)) + ')'
    fw_ver_string = str(daytripper_config.fw_version_major) + '.' + str(daytripper_config.fw_version_minor) + '.' + str(daytripper_config.fw_version_patch)
    tof_type_string = 'Unknown'
    if daytripper_config.tof_model_id == 238:
        tof_type_string = 'Standard Range (120cm)'
    elif daytripper_config.tof_model_id == 244:
        tof_type_string = 'Long Range (400cm)'
    return "Type: " + model_string + '      Unique ID: ' + id_string + '      FW Version: ' + fw_ver_string + '      Laser Sensor: ' + tof_type_string

def serial_connect():
    if len(serial_var.get()) <= 1:
        return
    ser.port = serial_var.get()
    ser.timeout = 0.5
    try:
        ser.open()
        ser.write("show\n".encode('utf-8'))
        time.sleep(0.1)
        result = ser.readline().decode('utf-8')
        ser.close()
    except Exception as e:
        messagebox.showerror("Error", 'Serial port exception:\n' + str(e))
        return
    if not result.startswith('dt_'):
        messagebox.showerror("Error", 'no valid responce received')
        return
    daytripper_config.load_config(result)
    print(daytripper_config)
    hwif_label_stringvar.set(make_info_string())

def serial_apply_changes():
    pass

def serial_reset_all():
    pass

user_guide_button = Button(connection_lf, text="User Guide...", command=open_user_manual_url)
user_guide_button.pack()
user_guide_button.place(x=PADDING, y=0, width=100)

serial_refresh_button = Button(connection_lf, text="Refresh", command=serial_dropdown_refresh)
serial_refresh_button.pack()
serial_refresh_button.place(x=40+320, y=0, width=70)

serial_connect_button = Button(connection_lf, text="Connect", command=serial_connect)
serial_connect_button.pack()
serial_connect_button.place(x=40+390, y=0, width=70)

serial_apply_button = Button(connection_lf, text="Apply Changes", command=serial_apply_changes)
serial_apply_button.pack()
serial_apply_button.place(x=40+460, y=0, width=110)

serial_reset_all_button = Button(connection_lf, text="Reset All", command=serial_reset_all)
serial_reset_all_button.pack()
serial_reset_all_button.place(x=40+570, y=0, width=80)

serial_dropdown_refresh()
serial_connect()

hwif_lf = LabelFrame(root, text="Hardware Info", width=MAIN_WINDOW_WIDTH - PADDING*2, height=HEIGHT_CONNECT_LF)
hwif_lf.pack()
hwif_lf.place(x=PADDING, y=50)
hwif_lf.pack_propagate(False) 
root.update()

hwif_label = Label(master=hwif_lf, textvariable=hwif_label_stringvar)
hwif_label.pack()
hwif_label.place(x=0, y=0)

# updates_lf = LabelFrame(root, text="Updates", width=int(MAIN_WINDOW_WIDTH*0.2) - PADDING, height=HEIGHT_CONNECT_LF)
# updates_lf.pack()
# updates_lf.place(x=int(MAIN_WINDOW_WIDTH*0.8), y=50)
# updates_lf.pack_propagate(False) 
# root.update()

# MORE BUTTONS: APPLY, RESET, check update
# --------------------------
def repeat_func():
    root.after(500, repeat_func)

root.after(500, repeat_func)   
root.mainloop()
