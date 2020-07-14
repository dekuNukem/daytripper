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
HIGHT_ROOT_FOLDER_LF = 50

def open_user_manual_url():
    webbrowser.open('https://github.com/dekuNukem/duckyPad/blob/master/getting_started.md')

def ensure_dir(dir_path):
    if not os.path.exists(dir_path):
        os.mkdir(dir_path)

root = Tk()
root.title("daytripper configurator v" + THIS_VERSION_NUMBER)
root.geometry(str(MAIN_WINDOW_WIDTH) + "x" + str(MAIN_WINDOW_HEIGHT))
root.resizable(width=FALSE, height=FALSE)

# ------------- serial select -------------

connection_lf = LabelFrame(root, text="Connection", width=MAIN_WINDOW_WIDTH - PADDING*2, height=HIGHT_ROOT_FOLDER_LF)
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
serial_optlist.place(x=PADDING, y=0, width=200)

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

serial_refresh_button = Button(connection_lf, text="Refresh", command=serial_dropdown_refresh)
serial_refresh_button.pack()
serial_refresh_button.place(x=215, y=0, width=70)

serial_connect_button = Button(connection_lf, text="Connect", command=None)
serial_connect_button.pack()
serial_connect_button.place(x=290, y=0, width=70)
# --------------------------
def repeat_func():
    # print('hello world')
    root.after(500, repeat_func)

root.after(500, repeat_func)   
root.mainloop()
