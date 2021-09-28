import time
import alarm
import digitalio
from board import *
import displayio
import terminalio
from adafruit_bme280 import basic as adafruit_bme280

from adafruit_display_text import label
import adafruit_displayio_sh1107

displayio.release_displays()

# Create sensor object, using the board's default I2C bus.
i2c = I2C()  # uses board.SCL and board.SDA

A_btn = digitalio.DigitalInOut(D9)
A_btn.pull = digitalio.Pull.UP
B_btn = digitalio.DigitalInOut(D6) #pulled up in hardware
C_btn = digitalio.DigitalInOut(D5)
C_btn.pull = digitalio.Pull.UP

bme280 = adafruit_bme280.Adafruit_BME280_I2C(i2c, address=0x77)
# change this to match the location's pressure (hPa) at sea level
bme280.sea_level_pressure = 1013.25

display_bus = displayio.I2CDisplay(i2c, device_address=0x3C)

# SH1107 is vertically oriented 64x128
WIDTH = 128
HEIGHT = 64
BORDER = 0

display = adafruit_displayio_sh1107.SH1107(
    display_bus, width=WIDTH, height=HEIGHT, rotation=0
)

def deep_sleep():
    A_btn.deinit()
    B_btn.deinit()
    C_btn.deinit()
    
    A_btn_alarm = alarm.pin.PinAlarm(pin=D9, value=False, pull= True)
    B_btn_alarm = alarm.pin.PinAlarm(pin=D6, value=False) #pulled up in hardware
    C_btn_alarm = alarm.pin.PinAlarm(pin=D5, value=False, pull= True)
    
    display.sleep()
    bme280.mode = adafruit_bme280.MODE_SLEEP
    alarm.exit_and_deep_sleep_until_alarms(A_btn_alarm,B_btn_alarm,C_btn_alarm)

def main():
    #seconds
    init_timer = 60
    timer = init_timer
    sleep_time = 1

    while True:
        if (False in [A_btn.value, B_btn.value, C_btn.value]):
            timer = init_timer
        
        screen = displayio.Group()

        color_bitmap = displayio.Bitmap(WIDTH, HEIGHT, 1)
        color_palette = displayio.Palette(1)
        color_palette[0] = 0xFFFFFF  # White
        border_sprite = displayio.TileGrid(color_bitmap, pixel_shader=color_palette, x=0, y=0)
        screen.append(border_sprite)

        # Draw a smaller inner rectangle in black
        inner_bitmap = displayio.Bitmap(WIDTH - BORDER * 2, HEIGHT - BORDER * 2, 1)
        inner_palette = displayio.Palette(1)
        inner_palette[0] = 0x000000  # Black
        inner_sprite = displayio.TileGrid(inner_bitmap, pixel_shader=inner_palette, x=BORDER, y=BORDER)
        screen.append(inner_sprite)

        # Timer bar
        sleepbar_bitmap = displayio.Bitmap(4,int(HEIGHT * timer/init_timer),1)
        sleepbar_palette = displayio.Palette(1)
        sleepbar_palette[0] = 0xFFFFFF
        sleepbar_sprite = displayio.TileGrid(sleepbar_bitmap, pixel_shader=sleepbar_palette, x=0, y=0)
        screen.append(sleepbar_sprite)

        text = "Temp (C):   {:.2f}".format(bme280.temperature)
        text_area = label.Label(terminalio.FONT, text=text, color=0xFFFFFF, x=12, y=14)
        screen.append(text_area)

        text = "Humi (%):   {:.2f}".format(bme280.relative_humidity)
        text_area = label.Label(terminalio.FONT, text=text, color=0xFFFFFF, x=12, y=int((HEIGHT/2)))
        screen.append(text_area)

        text = "Pres (hPa): {:.2f}".format(bme280.pressure)
        text_area = label.Label(terminalio.FONT, text=text, color=0xFFFFFF, x=12, y=HEIGHT-15)
        screen.append(text_area)

        display.show(screen)

        time.sleep(sleep_time)
        timer -= sleep_time

        if (timer <= 0):
            deep_sleep()

main()
