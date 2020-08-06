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
connection_lf.place(x=PADDING, y=0)
root.update()

serial_var = StringVar()
serial_var.set(' ')
OptionList = ['']
serial_optlist = OptionMenu(connection_lf, serial_var, *OptionList)
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
    if daytripper_config.is_valid is False:
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

def get_max_range_cm():
    if daytripper_config.is_valid is False:
        return 0
    if daytripper_config.tof_model_id == 238:
        return 120
    elif daytripper_config.tof_model_id == 244:
        return 400
    return 0

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
        messagebox.showerror("Error", 'No valid responce received.\nMake sure the board is turned OFF before plugging in.')
        return
    if not daytripper_config.load_config(result):
        messagebox.showerror("Error", 'error parsing data')
        return
    # print(daytripper_config)
    hwif_label_stringvar.set(make_info_string())
    enable_widgets()
    show_settings()

def serial_apply_changes():
    pass

def serial_reset_all():
    sensitivity_reset_click()
    range_reset_click()
    refresh_rate_reset_click()
    timing_budget_reset_click()

user_guide_button = Button(connection_lf, text="User Guide...", command=open_user_manual_url)
user_guide_button.place(x=PADDING, y=0, width=100)
serial_refresh_button = Button(connection_lf, text="Refresh", command=serial_dropdown_refresh)
serial_refresh_button.place(x=40+320, y=0, width=70)
serial_connect_button = Button(connection_lf, text="Connect", command=serial_connect)
serial_connect_button.place(x=40+390, y=0, width=70)
serial_apply_button = Button(connection_lf, text="Save Changes", command=serial_apply_changes, state=DISABLED)
serial_apply_button.place(x=40+460, y=0, width=110)
serial_reset_all_button = Button(connection_lf, text="Reset All", command=serial_reset_all, state=DISABLED)
serial_reset_all_button.place(x=40+570, y=0, width=80)

hwif_lf = LabelFrame(root, text="Hardware Info", width=MAIN_WINDOW_WIDTH - PADDING*2, height=HEIGHT_CONNECT_LF)
hwif_label = Label(master=hwif_lf, textvariable=hwif_label_stringvar)

SETTING_LF_HEIGHT = 300
cube_witch = int((MAIN_WINDOW_WIDTH - PADDING*2) / 4.4)
cube_height = int(SETTING_LF_HEIGHT/2.3)
settings_lf = LabelFrame(root, text="Settings", width=MAIN_WINDOW_WIDTH - PADDING*2, height=SETTING_LF_HEIGHT)
refresh_rate_lf = LabelFrame(settings_lf, text="Refresh Rate", width=cube_witch, height=cube_height)
refresh_rate_slider_text = Label(refresh_rate_lf, text=str(daytripper_config.refresh_rate_Hz)+'Hz')

def nrs_value_to_text(value):
    nrs_mapping = ['Off', 'Balanced', 'Low-noise']
    try:
        return nrs_mapping[int(value)]
    except Exception as e:
        print(nrs_value_to_text, e)
        return 'Unknown'

def cm_to_feet_inch(height_cm):
    height_cm = int(height_cm)
    height_in = height_cm / 2.54
    feet = height_in // 12
    inches = height_in % 12
    return str(height_cm)+'cm ('+str(int(feet))+'ft '+str(int(inches))+'in)'

def print_selection_refresh_rate(value):
    refresh_rate_slider_text.config(text=str(value)+'Hz')
    daytripper_config.refresh_rate_Hz = int(value)

def print_selection_timing_budget(value):
    timing_budget_slider_text.config(text=str(value)+'ms')
    daytripper_config.timing_budget_ms = int(value)

def print_selection_sensitivity(value):
    sensitivity_slider_text.config(text=nrs_value_to_text(value))
    daytripper_config.nr_sensitivity = int(value)

def print_selection_range_max(value):
    range_max_text.config(text='To: ' + cm_to_feet_inch(value))
    daytripper_config.tof_range_max_cm = int(value)

def print_selection_range_min(value):
    range_min_text.config(text='From: ' + cm_to_feet_inch(value))
    daytripper_config.tof_range_min_cm = int(value)

def refresh_rate_info_popup():
    messagebox.showinfo("Information", 'How many times per second the laser distance sensor takes a reading.\n\nA higher refresh rate makes TX more sensitive to faster movements. However, it will also drain the battery quicker.')

def refresh_rate_reset_click():
    refresh_rate_slider.set(5)
    print_selection_refresh_rate(5)

def sensitivity_info_popup():
    messagebox.showinfo("Information", 'NR reduces potential false triggers by taking additional measurements.\n\nTurning it off will noticeably improve motion sensitivity. However, false triggers might occur occasionally, especially in brighter conditions.')

def sensitivity_reset_click():
    sensitivity_slider.set(1)
    print_selection_sensitivity(1)

def timing_budget_info_popup():
    messagebox.showinfo("Information", 'Time allocated for the sensor to get a single reading.\n\nA higher value will result in more accurate measurements, but also more battery drain and slower refresh rate.')

def timing_budget_reset_click():
    timing_budget_slider.set(25)
    print_selection_timing_budget(25)

def range_reset_click():
    range_max_slider.set(get_max_range_cm())
    range_min_slider.set(0)
    print_selection_range_max(get_max_range_cm())
    print_selection_range_min(0)

refresh_rate_slider = Scale(refresh_rate_lf)
nr_sensitivity_lf = LabelFrame(settings_lf, text="Noise Reduction", width=cube_witch, height=cube_height)
sensitivity_slider_text = Label(nr_sensitivity_lf, text=nrs_value_to_text(daytripper_config.nr_sensitivity))
tof_timing_budget_lf = LabelFrame(settings_lf, text="Timing Budget", width=cube_witch, height=cube_height)
tof_range_lf = LabelFrame(settings_lf, text="Detection Range", width=cube_witch, height=cube_height)
refresh_rate_info_button = Button(refresh_rate_lf, text="What's this?", command=refresh_rate_info_popup)
refresh_rate_reset_button = Button(refresh_rate_lf, text="Reset to Default", command=refresh_rate_reset_click)
sensitivity_slider = Scale(nr_sensitivity_lf)

timing_budget_slider = Scale(tof_timing_budget_lf)
timing_budget_slider_text = Label(tof_timing_budget_lf, text=str(daytripper_config.timing_budget_ms)+'ms')

sensitivity_info_button = Button(nr_sensitivity_lf, text="What's this?", command=sensitivity_info_popup)
sensitivity_reset_button = Button(nr_sensitivity_lf, text="Reset to Default", command=sensitivity_reset_click)

timing_budget_info_button = Button(tof_timing_budget_lf, text="What's this?", command=timing_budget_info_popup)
timing_budget_reset_button = Button(tof_timing_budget_lf, text="Reset to Default", command=timing_budget_reset_click)

range_min_slider = Scale(tof_range_lf)
range_max_slider = Scale(tof_range_lf)

range_min_text = Label(tof_range_lf, text='From: ' + cm_to_feet_inch(daytripper_config.tof_range_min_cm))
range_max_text = Label(tof_range_lf, text='To: ' + cm_to_feet_inch(daytripper_config.tof_range_max_cm))

range_reset_button = Button(tof_range_lf, text="Reset to Default", command=range_reset_click)

led_lf = LabelFrame(settings_lf, text="LED Indicator", width=cube_witch, height=cube_height)
nrf_address_lf = LabelFrame(settings_lf, text="Wireless Address", width=cube_witch, height=cube_height)
opmode_lf = LabelFrame(settings_lf, text="Operation Mode", width=cube_witch, height=cube_height)
debug_uart_lf = LabelFrame(settings_lf, text="Debug Messages", width=cube_witch, height=cube_height)

# debug mode, op mode, charge behavior, 

def enable_widgets():
    serial_apply_button.config(state=NORMAL)
    serial_reset_all_button.config(state=NORMAL)

def show_settings():
    hwif_lf.place(x=PADDING, y=50)
    hwif_label.place(x=0, y=0)
    root.update()
    settings_lf.place(x=PADDING, y=100)
    root.update()
    refresh_rate_lf.place(x=PADDING, y=0)
    root.update()
    nr_sensitivity_lf.place(x=refresh_rate_lf.winfo_x() + refresh_rate_lf.winfo_width() + PADDING, y=0)
    root.update()
    tof_timing_budget_lf.place(x=nr_sensitivity_lf.winfo_x() + nr_sensitivity_lf.winfo_width() + PADDING, y=0)
    root.update()
    tof_range_lf.place(x=tof_timing_budget_lf.winfo_x() + tof_timing_budget_lf.winfo_width() + PADDING, y=0)
    root.update()

    led_lf.place(x=PADDING, y=refresh_rate_lf.winfo_height() + 5)
    nrf_address_lf.place(x=refresh_rate_lf.winfo_x() + refresh_rate_lf.winfo_width() + PADDING, y=refresh_rate_lf.winfo_height() + 5)
    opmode_lf.place(x=nr_sensitivity_lf.winfo_x() + nr_sensitivity_lf.winfo_width() + PADDING, y=refresh_rate_lf.winfo_height() + 5)
    debug_uart_lf.place(x=tof_timing_budget_lf.winfo_x() + tof_timing_budget_lf.winfo_width() + PADDING, y=refresh_rate_lf.winfo_height() + 5)


    refresh_rate_slider.config(from_=1, to=30, length=refresh_rate_lf.winfo_width() * 0.85, showvalue=0, sliderlength=20, orient=HORIZONTAL, command=print_selection_refresh_rate)
    refresh_rate_slider.set(daytripper_config.refresh_rate_Hz)
    refresh_rate_slider.place(x=PADDING, y=PADDING)
    root.update()
    refresh_rate_slider_text.place(x=refresh_rate_lf.winfo_width() / 2.9, y=30)
    root.update()

    refresh_rate_info_button.place(x=PADDING, y=55, width=cube_witch * 0.85)
    refresh_rate_reset_button.place(x=PADDING, y=82, width=cube_witch * 0.85)
    sensitivity_slider.config(from_=0, to=2, length=refresh_rate_lf.winfo_width() * 0.85, showvalue=0, sliderlength=20, orient=HORIZONTAL, command=print_selection_sensitivity)
    sensitivity_slider.set(daytripper_config.nr_sensitivity)
    sensitivity_slider.place(x=PADDING, y=PADDING)
    sensitivity_slider_text.place(x=nr_sensitivity_lf.winfo_width() / 3.5, y=30)

    sensitivity_info_button.place(x=PADDING, y=55, width=cube_witch * 0.85)
    sensitivity_reset_button.place(x=PADDING, y=82, width=cube_witch * 0.85)

    timing_budget_slider.config(from_=20, to=200, length=tof_timing_budget_lf.winfo_width() * 0.85, showvalue=0, sliderlength=20, orient=HORIZONTAL, command=print_selection_timing_budget)
    timing_budget_slider.set(daytripper_config.timing_budget_ms)
    timing_budget_slider.place(x=PADDING, y=PADDING)
    timing_budget_slider_text.place(x=tof_timing_budget_lf.winfo_width() / 3.2, y=30)

    timing_budget_info_button.place(x=PADDING, y=55, width=cube_witch * 0.85)
    timing_budget_reset_button.place(x=PADDING, y=82, width=cube_witch * 0.85)

    range_min_slider.config(from_=0, to=get_max_range_cm(), length=tof_range_lf.winfo_width() * 0.85, showvalue=0, sliderlength=20, orient=HORIZONTAL, command=print_selection_range_min)
    range_min_slider.set(daytripper_config.tof_range_min_cm)
    range_min_slider.place(x=PADDING, y=20)

    range_max_slider.config(from_=0, to=get_max_range_cm(), length=tof_range_lf.winfo_width() * 0.85, showvalue=0, sliderlength=20, orient=HORIZONTAL, command=print_selection_range_max)
    range_max_slider.set(daytripper_config.tof_range_max_cm)
    range_max_slider.place(x=PADDING, y=60)

    range_min_text.place(x=5, y=-4)
    range_max_text.place(x=5, y=37)
    range_reset_button.place(x=PADDING, y=82, width=cube_witch * 0.85)

serial_dropdown_refresh()
serial_connect()

def repeat_func():
    root.after(500, repeat_func)

root.after(500, repeat_func)   
root.mainloop()
