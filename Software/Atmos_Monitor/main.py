
import alarm
import time
import board
import displayio
import terminalio
from adafruit_bme280 import basic as adafruit_bme280
# can try import bitmap_label below for alternative
from adafruit_display_text import label
import adafruit_displayio_sh1107

button_a = alarm.pin.PinAlarm(pin=board.D5, value=True, edge=False, pull=False)

displayio.release_displays()

# Create sensor object, using the board's default I2C bus.
i2c = board.I2C()  # uses board.SCL and board.SDA

bme280 = adafruit_bme280.Adafruit_BME280_I2C(i2c)
# change this to match the location's pressure (hPa) at sea level
bme280.sea_level_pressure = 1013.25

display_bus = displayio.I2CDisplay(i2c, device_address=0x3C)

# SH1107 is vertically oriented 64x128
WIDTH = 128
HEIGHT = 64
BORDER = 2

display = adafruit_displayio_sh1107.SH1107(
    display_bus, width=WIDTH, height=HEIGHT, rotation=0
)

timer = 0

while True:
    screen = displayio.Group()
    
    color_bitmap = displayio.Bitmap(WIDTH, HEIGHT, 1)
    color_palette = displayio.Palette(1)
    color_palette[0] = 0xFFFFFF  # White

    bg_sprite = displayio.TileGrid(color_bitmap, pixel_shader=color_palette, x=0, y=0)
    screen.append(bg_sprite)

    # Draw a smaller inner rectangle in black
    inner_bitmap = displayio.Bitmap(WIDTH - BORDER * 2, HEIGHT - BORDER * 2, 1)
    inner_palette = displayio.Palette(1)
    inner_palette[0] = 0x000000  # Black
    inner_sprite = displayio.TileGrid(inner_bitmap, pixel_shader=inner_palette, x=BORDER, y=BORDER)
    screen.append(inner_sprite)

    print(timer)

    text = "Temp (C):   {:.2f}".format(bme280.temperature)
    text_area = label.Label(terminalio.FONT, text=text, color=0xFFFFFF, x=8, y=8)
    screen.append(text_area)

    text = "Humi (%):   {:.2f}".format(bme280.relative_humidity)
    text_area = label.Label(terminalio.FONT, text=text, color=0xFFFFFF, x=8, y=28)
    screen.append(text_area)

    text = "Pres (hPa): {:.2f}".format(bme280.pressure)
    text_area = label.Label(terminalio.FONT, text=text, color=0xFFFFFF, x=8, y=50)
    screen.append(text_area)
    
    display.show(screen)
    #screen.append(clear_screen)
    
    #if timer >= 20:
    #    screen.append(clear_screen)
    #    display.show(screen)
    #    alarm.exit_and_deep_sleep_until_alarms(button_a)
        
    #timer+=1
    time.sleep(1)