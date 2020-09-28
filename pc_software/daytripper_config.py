import os
import time
import copy
import json
import datetime
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
import urllib.request

THIS_VERSION_NUMBER = '0.2.0'
MAIN_WINDOW_WIDTH = 720
MAIN_WINDOW_HEIGHT = 470
PADDING = 10
HEIGHT_CONNECT_LF = 50
discord_link_url = "https://raw.githubusercontent.com/dekuNukem/daytripper/master/resources/discord_link.txt"

def open_user_manual_url():
    webbrowser.open('https://github.com/dekuNukem/daytripper/blob/master/quick_start_guide.md')

def open_discord_link():
    try:
        webbrowser.open(str(urllib.request.urlopen(discord_link_url).read().decode('utf-8')).split('\n')[0])
    except Exception as e:
        messagebox.showerror("Error", "Failed to open discord link!\n"+str(e))

def create_help_window():
    help_window = Toplevel(root)
    help_window.title("Daytripper help")
    help_window.geometry("280x130")
    help_window.resizable(width=FALSE, height=FALSE)

    user_manual_label = Label(master=help_window, text="Not sure what to do? Please read...")
    user_manual_label.place(x=35, y=5)
    user_manual_button = Button(help_window, text="User Manual", command=open_user_manual_url)
    user_manual_button.place(x=60, y=30, width=160)

    discord_label = Label(master=help_window, text="Questions or comments? Ask in...")
    discord_label.place(x=35, y=60)
    discord_button = Button(help_window, text="Official Discord Chatroom", command=open_discord_link)
    discord_button.place(x=50, y=85, width=180)

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

MODELID_STDRANGE_VL53L0X = 0xee
MODELID_LONGRANGE_VL53L1X = 0xcc

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
    if daytripper_config.tof_model_id == MODELID_STDRANGE_VL53L0X:
        tof_type_string = 'Standard Range (120cm)'
    elif daytripper_config.tof_model_id == MODELID_LONGRANGE_VL53L1X:
        tof_type_string = 'Long Range (400cm)'
    return "Type: " + model_string + '      Unique ID: ' + id_string + '      FW Version: ' + fw_ver_string + '      Laser Sensor: ' + tof_type_string

def get_max_range_cm():
    if daytripper_config.is_valid is False:
        return 0
    if daytripper_config.tof_model_id == MODELID_STDRANGE_VL53L0X:
        return 120
    elif daytripper_config.tof_model_id == MODELID_LONGRANGE_VL53L1X:
        return 400
    return 0

def fw_update_click(what):
    webbrowser.open('https://github.com/dekuNukem/daytripper/blob/master/advanced_usage.md#usb-firmware-updates')

def check_firmware_update():
    fw_ver_string = str(daytripper_config.fw_version_major) + '.' + str(daytripper_config.fw_version_minor) + '.' + str(daytripper_config.fw_version_patch)
    firmware_update_str_label.place(x=10, y=19)
    fw_result = check_update.get_firmware_update_status(fw_ver_string)
    if fw_result == 0:
        firmware_update_str_label.config(text='Firmware (' + str(fw_ver_string) +'): Up to date')
        firmware_update_str_label.unbind("<Button-1>")
    elif fw_result == 1:
        firmware_update_str_label.config(text='Firmware (' + str(fw_ver_string) +'): Update available! Click me!', fg='black', bg='orange', cursor="hand2")
        firmware_update_str_label.bind("<Button-1>", fw_update_click)
    else:
        firmware_update_str_label.config(text='Firmware: Unknown')
        firmware_update_str_label.unbind("<Button-1>")

def serial_connect():
    if len(serial_var.get()) <= 1:
        return
    ser.port = serial_var.get()
    ser.timeout = 0.5
    try:
        ser.open()
        ser.write("show\n".encode('utf-8'))
        result = ser.readlines()
        ser.close()
    except Exception as e:
        messagebox.showerror("Error", 'Serial port exception:\n' + str(e))
        return
    result = [x.decode('utf-8') for x in result]
    result = [x for x in result if x.startswith('dt_')]
    if len(result) <= 0:
        messagebox.showerror("Error", 'No valid response received.\nMake sure the correct port is selected, and TX is turned OFF before plugging in.')
        return
    if not daytripper_config.load_config(result[0]):
        messagebox.showerror("Error", 'error parsing data')
        return
    # print(daytripper_config)
    hwif_label_stringvar.set(make_info_string())
    enable_widgets()
    show_settings()
    check_firmware_update()
    
def validate_dt_obj(dt_obj):
    if dt_obj.is_valid is False:
        messagebox.showerror("Error", 'Invalid configuration')
        return False
    if dt_obj.tof_range_min_cm > dt_obj.tof_range_max_cm:
        min_temp = dt_obj.tof_range_min_cm;
        slider_adjust_range_min(dt_obj.tof_range_max_cm);
        range_min_slider.set(dt_obj.tof_range_max_cm)
        slider_adjust_range_max(min_temp);
        range_max_slider.set(min_temp)
    if dt_obj.tof_range_max_cm - dt_obj.tof_range_min_cm <= 30:
        messagebox.showinfo("Info", 'Detection range is very narrow, are you sure?')
    return True

def make_serial_command(dt_obj):
    result = 'save'
    result += ' ' + str(int(dt_obj.refresh_rate_Hz))
    result += ' ' + str(int(dt_obj.nr_sensitivity))
    result += ' ' + str(int(dt_obj.timing_budget_ms))
    result += ' ' + str(int(dt_obj.tof_range_max_cm/2))
    result += ' ' + str(int(dt_obj.tof_range_min_cm/2))
    result += ' ' + str(int(dt_obj.use_led))
    result += ' ' + str(int(dt_obj.op_mode))
    result += ' ' + str(int(dt_obj.print_debug_info))
    result += ' ' + str(int(dt_obj.tx_wireless_addr))
    result += '\n'
    return result

def serial_apply_changes():
    validate_dt_obj(daytripper_config)
    ser_command = make_serial_command(daytripper_config)
    # print(ser_command)
    try:
        ser.open()
        ser.write(ser_command.encode('utf-8'))
        result = ser.readlines()
        ser.close()
    except Exception as e:
        messagebox.showerror("Error", 'Serial port exception:\n' + str(e))
        return
    result = [x.decode('utf-8') for x in result]
    result = [x for x in result if x.startswith('OK')]
    if len(result) <= 0:
        messagebox.showerror("Error", 'No valid response received.')
        return
    messagebox.showinfo("Info", 'Settings successfully saved!\n\nTo take effect, unplug and turn it off then on again.')

def serial_reset_all():
    sensitivity_reset_click()
    range_reset_click()
    refresh_rate_reset_click()
    timing_budget_reset_click()
    led_reset_click()
    wireless_addr_reset_click()
    opmode_reset_click()
    debug_reset_click()

user_guide_button = Button(connection_lf, text="How do I...", command=create_help_window)
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
    nrs_mapping = ['Off', 'Balanced', 'High']
    try:
        return nrs_mapping[int(value)]
    except Exception as e:
        print('nrs_value_to_text', e)
        return 'Unknown'

def bin_to_text(value):
    bin_mapping = ['Off', 'On']
    try:
        return bin_mapping[int(value)]
    except Exception as e:
        print('bin_to_text', e)
        return 'Unknown'

def opmode_to_text(value):
    bin_mapping = ['One-shot Trigger', 'Continuous']
    try:
        return bin_mapping[int(value)]
    except Exception as e:
        print('opmode_to_text', e)
        return 'Unknown'

def cm_to_feet_inch(height_cm):
    height_cm = int(height_cm)
    height_in = height_cm / 2.54
    feet = height_in // 12
    inches = height_in % 12
    return str(height_cm)+'cm ('+str(int(feet))+'ft '+str(int(inches))+'in)'

def slider_adjust_refresh_rate(value):
    refresh_rate_slider_text.config(text=str(value)+'Hz')
    daytripper_config.refresh_rate_Hz = int(value)

def slider_adjust_timing_budget(value):
    timing_budget_slider_text.config(text=str(value)+'ms')
    daytripper_config.timing_budget_ms = int(value)

def slider_adjust_sensitivity(value):
    sensitivity_slider_text.config(text=nrs_value_to_text(value))
    daytripper_config.nr_sensitivity = int(value)

def slider_adjust_range_max(value):
    range_max_text.config(text='To: ' + cm_to_feet_inch(value))
    daytripper_config.tof_range_max_cm = int(value)

def slider_adjust_range_min(value):
    range_min_text.config(text='From: ' + cm_to_feet_inch(value))
    daytripper_config.tof_range_min_cm = int(value)

def slider_adjust_led(value):
    led_text.config(text=bin_to_text(value))
    daytripper_config.use_led = int(value)

def slider_adjust_wireless_addr(value):
    wireless_addr_text.config(text=str(value))
    daytripper_config.tx_wireless_addr = int(value)

def slider_adjust_opmode(value):
    opmode_text.config(text=opmode_to_text(value))
    daytripper_config.op_mode = int(value)

def slider_adjust_debug(value):
    debug_text.config(text=bin_to_text(value))
    daytripper_config.print_debug_info = int(value)

def refresh_rate_info_popup():
    messagebox.showinfo("Information", 'How many times per second the sensor takes a reading.\n\nHigher refresh rate makes TX more sensitive to faster movements. However, it will also drain the battery quicker.')

def refresh_rate_reset_click():
    refresh_rate_slider.set(6)
    slider_adjust_refresh_rate(6)

def sensitivity_info_popup():
    messagebox.showinfo("Information", 'NR prevents potential false triggers by taking additional measurements.\n\nTurning it off will noticeably improve motion sensitivity. However, false triggers might occur occasionally, especially in bright conditions.')

def sensitivity_reset_click():
    sensitivity_slider.set(1)
    slider_adjust_sensitivity(1)

def timing_budget_info_popup():
    messagebox.showinfo("Information", 'Time allocated for the sensor to get a single reading.\n\nA higher value will result in more accurate measurements, but also more battery drain and slower refresh rate.')

def timing_budget_reset_click():
    timing_budget_slider.set(25)
    slider_adjust_timing_budget(25)

def led_info_popup():
    messagebox.showinfo("Information", 'Whether to illuminate the blue LED when triggered.\n\nDisabling the LED might make TX less noticeable.')

def led_reset_click():
    led_slider.set(1)
    slider_adjust_led(1)

def range_reset_click():
    range_max_slider.set(get_max_range_cm())
    range_min_slider.set(0)
    slider_adjust_range_max(get_max_range_cm())
    slider_adjust_range_min(0)

def wireless_addr_reset_click():
    slider_adjust_wireless_addr(12)
    wireless_addr_slider.set(12)

def wireless_addr_info_popup():
    messagebox.showinfo("Information", 'Wireless address this device operates on.\n\nA TX/RX pair on the same address will work together.\n\nIf you have multiple Daytrippers, you can put them on different addresses so they will work independently, or you can put them all on the same address, and they will work together.')

def opmode_reset_click():
    slider_adjust_opmode(0)
    opmode_slider.set(0)

def opmode_info_popup():
    messagebox.showinfo("Information", 'One-shot trigger: Default mode, TX only talks to RX when triggered.\n\nContinuous mode: TX talks to RX on every measurement, suitable for streaming live data. High battery drain.')

def debug_reset_click():
    slider_adjust_debug(1)
    debug_slider.set(1)

def debug_popup():
    messagebox.showinfo("Information", 'Whether to print debug messages through hardware UART.\n\nTurning it off might save a tiny bit of battery life.\n\nDoesn\'t really matter that much to be honest :)')

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
wireless_address_lf = LabelFrame(settings_lf, text="Wireless Address", width=cube_witch, height=cube_height)
opmode_lf = LabelFrame(settings_lf, text="Operation Mode", width=cube_witch, height=cube_height)
debug_uart_lf = LabelFrame(settings_lf, text="Print Debug Info", width=cube_witch, height=cube_height)

led_slider = Scale(led_lf)
led_text = Label(led_lf, text=bin_to_text(daytripper_config.use_led))
led_info_button = Button(led_lf, text="What's this?", command=led_info_popup)
led_reset_button = Button(led_lf, text="Reset to Default", command=led_reset_click)

wireless_addr_slider = Scale(wireless_address_lf)
wireless_addr_text = Label(wireless_address_lf, text=str(daytripper_config.tx_wireless_addr))
wireless_addr_info_button = Button(wireless_address_lf, text="What's this?", command=wireless_addr_info_popup)
wireless_addr_reset_button = Button(wireless_address_lf, text="Reset to Default", command=wireless_addr_reset_click)

def wireless_addr_plus_click():
    if wireless_addr_slider.get() >= 255:
        return
    slider_adjust_wireless_addr(wireless_addr_slider.get()+1)
    wireless_addr_slider.set(wireless_addr_slider.get()+1)

def wireless_addr_minus_click():
    if wireless_addr_slider.get() <= 0:
        return
    slider_adjust_wireless_addr(wireless_addr_slider.get()-1)
    wireless_addr_slider.set(wireless_addr_slider.get()-1)

wireless_addr_plus_button = Button(wireless_address_lf, text="+", command=wireless_addr_plus_click)
wireless_addr_minus_button = Button(wireless_address_lf, text="-", command=wireless_addr_minus_click)

# debug mode, op mode, charge behavior, 

opmode_slider = Scale(opmode_lf)
opmode_text = Label(opmode_lf, text=opmode_to_text(daytripper_config.op_mode))
opmode_info_button = Button(opmode_lf, text="What's this?", command=opmode_info_popup)
opmode_reset_button = Button(opmode_lf, text="Reset to Default", command=opmode_reset_click)

debug_slider = Scale(debug_uart_lf)
debug_text = Label(debug_uart_lf, text=bin_to_text(daytripper_config.print_debug_info))
debug_info_button = Button(debug_uart_lf, text="What's this?", command=debug_popup)
debug_reset_button = Button(debug_uart_lf, text="Reset to Default", command=debug_reset_click)

backup_lf = LabelFrame(root, text="Backups", width=MAIN_WINDOW_WIDTH/2 - PADDING*2, height=HEIGHT_CONNECT_LF+10)
updates_lf = LabelFrame(root, text="Updates", width=MAIN_WINDOW_WIDTH/2 - PADDING*2 + 5, height=HEIGHT_CONNECT_LF+10)
updates_lf.place(x=365, y=400)
update_str_label = Label(master=updates_lf, text="")
firmware_update_str_label = Label(master=updates_lf, text="")

def current_time_str():
    return str(datetime.datetime.now().isoformat(sep='T') + "Z ").replace('-', '').replace(':', '').split('.')[0]

def dump_settings():
    dump_dict = {}
    dump_dict['is_valid'] = daytripper_config.is_valid
    dump_dict['refresh_rate_Hz'] = daytripper_config.refresh_rate_Hz
    dump_dict['nr_sensitivity'] = daytripper_config.nr_sensitivity
    dump_dict['timing_budget_ms'] = daytripper_config.timing_budget_ms
    dump_dict['tof_range_max_cm'] = daytripper_config.tof_range_max_cm
    dump_dict['tof_range_min_cm'] = daytripper_config.tof_range_min_cm
    dump_dict['use_led'] = daytripper_config.use_led
    dump_dict['op_mode'] = daytripper_config.op_mode
    dump_dict['print_debug_info'] = daytripper_config.print_debug_info
    dump_dict['tx_wireless_addr'] = daytripper_config.tx_wireless_addr
    dump_dict['hardware_id'] = daytripper_config.hardware_id
    dump_dict['tof_model_id'] = daytripper_config.tof_model_id
    dump_dict['daytripper_type'] = daytripper_config.daytripper_type
    dump_dict['fw_version_major'] = daytripper_config.fw_version_major
    dump_dict['fw_version_minor'] = daytripper_config.fw_version_minor
    dump_dict['fw_version_patch'] = daytripper_config.fw_version_patch
    dump_dict['created_at'] = int(time.time())
    filename = filedialog.asksaveasfilename(initialfile='daytripper_settings_'+current_time_str(), defaultextension='.txt')
    if len(filename) < 3:
        return
    try:
        with open(filename,'w') as myfile:
            myfile.write(json.dumps(dump_dict))
    except Exception as e:
        messagebox.showerror("Error", 'Save Failed:\n' + str(e))

def load_settings():
    filename = filedialog.askopenfilename()
    if len(filename) < 3:
        return
    # print(filename)
    new_settings = {}
    try:
        with open(filename) as myfile:
            new_settings = json.loads(myfile.read())
    except Exception as e:
        messagebox.showerror("Error", 'Load Failed:\n' + str(e))
    if new_settings['is_valid'] is False:
        return
    daytripper_config.refresh_rate_Hz = new_settings['refresh_rate_Hz']
    daytripper_config.nr_sensitivity = new_settings['nr_sensitivity']
    daytripper_config.timing_budget_ms = new_settings['timing_budget_ms']
    daytripper_config.tof_range_max_cm = new_settings['tof_range_max_cm']
    daytripper_config.tof_range_min_cm = new_settings['tof_range_min_cm']
    daytripper_config.use_led = new_settings['use_led']
    daytripper_config.op_mode = new_settings['op_mode']
    daytripper_config.print_debug_info = new_settings['print_debug_info']
    daytripper_config.tx_wireless_addr = new_settings['tx_wireless_addr']

    slider_adjust_refresh_rate(daytripper_config.refresh_rate_Hz)
    refresh_rate_slider.set(daytripper_config.refresh_rate_Hz)

    slider_adjust_sensitivity(daytripper_config.nr_sensitivity)
    sensitivity_slider.set(daytripper_config.nr_sensitivity)

    slider_adjust_timing_budget(daytripper_config.timing_budget_ms)
    timing_budget_slider.set(daytripper_config.timing_budget_ms)

    slider_adjust_range_max(daytripper_config.tof_range_max_cm)
    range_max_slider.set(daytripper_config.tof_range_max_cm)

    slider_adjust_range_min(daytripper_config.tof_range_min_cm)
    range_min_slider.set(daytripper_config.tof_range_min_cm)

    slider_adjust_led(daytripper_config.use_led)
    led_slider.set(daytripper_config.use_led)

    slider_adjust_opmode(daytripper_config.op_mode)
    opmode_slider.set(daytripper_config.op_mode)

    slider_adjust_debug(daytripper_config.print_debug_info)
    debug_slider.set(daytripper_config.print_debug_info)

    slider_adjust_wireless_addr(daytripper_config.tx_wireless_addr)
    wireless_addr_slider.set(daytripper_config.tx_wireless_addr)


dump_setting_button = Button(backup_lf, text="Export current settings...", command=dump_settings)
load_setting_button = Button(backup_lf, text="Import settings...", command=load_settings)

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
    # wireless_address_lf.place(x=refresh_rate_lf.winfo_x() + refresh_rate_lf.winfo_width() + PADDING, y=refresh_rate_lf.winfo_height() + 5)
    # opmode_lf.place(x=nr_sensitivity_lf.winfo_x() + nr_sensitivity_lf.winfo_width() + PADDING, y=refresh_rate_lf.winfo_height() + 5)
    debug_uart_lf.place(x=tof_timing_budget_lf.winfo_x() + tof_timing_budget_lf.winfo_width() + PADDING, y=refresh_rate_lf.winfo_height() + 5)

    refresh_rate_slider.config(from_=1, to=30, length=refresh_rate_lf.winfo_width() * 0.85, showvalue=0, sliderlength=20, orient=HORIZONTAL, command=slider_adjust_refresh_rate)
    refresh_rate_slider.set(daytripper_config.refresh_rate_Hz)
    refresh_rate_slider.place(x=PADDING, y=PADDING)
    root.update()
    refresh_rate_slider_text.place(x=refresh_rate_lf.winfo_width() / 2.9, y=30)
    root.update()

    refresh_rate_info_button.place(x=PADDING, y=55, width=cube_witch * 0.85)
    refresh_rate_reset_button.place(x=PADDING, y=82, width=cube_witch * 0.85)
    sensitivity_slider.config(from_=0, to=2, length=refresh_rate_lf.winfo_width() * 0.85, showvalue=0, sliderlength=20, orient=HORIZONTAL, command=slider_adjust_sensitivity)
    sensitivity_slider.set(daytripper_config.nr_sensitivity)
    sensitivity_slider.place(x=PADDING, y=PADDING)
    sensitivity_slider_text.place(x=nr_sensitivity_lf.winfo_width() / 3.5, y=30)

    sensitivity_info_button.place(x=PADDING, y=55, width=cube_witch * 0.85)
    sensitivity_reset_button.place(x=PADDING, y=82, width=cube_witch * 0.85)

    timing_budget_slider.config(from_=20, to=100, length=tof_timing_budget_lf.winfo_width() * 0.85, showvalue=0, sliderlength=20, orient=HORIZONTAL, command=slider_adjust_timing_budget)
    timing_budget_slider.set(daytripper_config.timing_budget_ms)
    timing_budget_slider.place(x=PADDING, y=PADDING)
    timing_budget_slider_text.place(x=tof_timing_budget_lf.winfo_width() / 3.2, y=30)

    timing_budget_info_button.place(x=PADDING, y=55, width=cube_witch * 0.85)
    timing_budget_reset_button.place(x=PADDING, y=82, width=cube_witch * 0.85)

    range_min_slider.config(from_=0, to=get_max_range_cm(), length=tof_range_lf.winfo_width() * 0.85, showvalue=0, sliderlength=20, orient=HORIZONTAL, command=slider_adjust_range_min)
    range_min_slider.set(daytripper_config.tof_range_min_cm)
    range_min_slider.place(x=PADDING, y=20)

    range_max_slider.config(from_=0, to=get_max_range_cm(), length=tof_range_lf.winfo_width() * 0.85, showvalue=0, sliderlength=20, orient=HORIZONTAL, command=slider_adjust_range_max)
    range_max_slider.set(daytripper_config.tof_range_max_cm)
    range_max_slider.place(x=PADDING, y=60)

    range_min_text.place(x=5, y=-4)
    range_max_text.place(x=5, y=37)
    range_reset_button.place(x=PADDING, y=82, width=cube_witch * 0.85)

    led_slider.config(from_=0, to=1, length=led_lf.winfo_width() * 0.85, showvalue=0, sliderlength=20, orient=HORIZONTAL, command=slider_adjust_led)
    led_slider.set(daytripper_config.use_led)
    led_slider.place(x=PADDING, y=PADDING)
    led_text.place(x=led_lf.winfo_width() / 2.5, y=30)
    led_info_button.place(x=PADDING, y=55, width=cube_witch * 0.85)
    led_reset_button.place(x=PADDING, y=82, width=cube_witch * 0.85)

    wireless_addr_slider.config(from_=0, to=255, length=led_lf.winfo_width() * 0.85, showvalue=0, sliderlength=20, orient=HORIZONTAL, command=slider_adjust_wireless_addr)
    wireless_addr_slider.set(daytripper_config.tx_wireless_addr)
    wireless_addr_slider.place(x=PADDING, y=PADDING)
    wireless_addr_text.place(x=65, y=30)
    wireless_addr_reset_button.place(x=PADDING, y=82, width=cube_witch * 0.85)
    wireless_addr_info_button.place(x=PADDING, y=55, width=cube_witch * 0.85)
    wireless_addr_plus_button.place(x=100, y=30, width=30)
    wireless_addr_minus_button.place(x=30, y=30, width=30)

    opmode_slider.config(from_=0, to=1, length=led_lf.winfo_width() * 0.85, showvalue=0, sliderlength=20, orient=HORIZONTAL, command=slider_adjust_opmode)
    opmode_slider.set(daytripper_config.op_mode)
    opmode_slider.place(x=PADDING, y=PADDING)
    opmode_text.place(x=20, y=30)
    opmode_reset_button.place(x=PADDING, y=82, width=cube_witch * 0.85)
    opmode_info_button.place(x=PADDING, y=55, width=cube_witch * 0.85)

    debug_slider.config(from_=0, to=1, length=led_lf.winfo_width() * 0.85, showvalue=0, sliderlength=20, orient=HORIZONTAL, command=slider_adjust_debug)
    debug_slider.set(daytripper_config.print_debug_info)
    debug_slider.place(x=PADDING, y=PADDING)
    debug_text.place(x=led_lf.winfo_width() / 2.5, y=30)
    debug_reset_button.place(x=PADDING, y=82, width=cube_witch * 0.85)
    debug_info_button.place(x=PADDING, y=55, width=cube_witch * 0.85)

    backup_lf.place(x=PADDING, y=400)

    dump_setting_button.place(x=PADDING, y=5, width=180)
    load_setting_button.place(x=200, y=5, width=130)

def update_click(event):
    webbrowser.open('https://github.com/dekuNukem/daytripper/releases')

update_result = check_update.get_pc_app_update_status(THIS_VERSION_NUMBER)
update_str_label.place(x=10, y=-2)
if update_result == 0:
    update_str_label.config(text='This app (' + str(THIS_VERSION_NUMBER) + '): Up to date')
    update_str_label.unbind("<Button-1>")
elif update_result == 1:
    update_str_label.config(text='This app (' + str(THIS_VERSION_NUMBER) + '): Update available! Click me!', fg='black', bg='orange', cursor="hand2")
    update_str_label.bind("<Button-1>", update_click)
elif update_result == 2:
    update_str_label.config(text='This app (' + str(THIS_VERSION_NUMBER) + '): Unknown')
    update_str_label.unbind("<Button-1>")

serial_dropdown_refresh()
# serial_connect()

# def repeat_func():
#     root.after(500, repeat_func)
# root.after(500, repeat_func)  

root.mainloop()
