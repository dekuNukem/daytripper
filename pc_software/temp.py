# updates_lf = LabelFrame(root, text="Updates", width=int(MAIN_WINDOW_WIDTH*0.2) - PADDING, height=HEIGHT_CONNECT_LF)
# updates_lf.place(x=int(MAIN_WINDOW_WIDTH*0.8), y=50)
# root.update()
def serial_reset_all():
    print("serial_reset_all")
    refresh_rate_lf.place_forget()
    root.update()