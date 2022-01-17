import pyqtgraph as pg
from pyqtgraph.Qt import QtCore, QtGui
import numpy as np
from time import perf_counter

win = pg.GraphicsLayoutWidget(show=True)
win.setWindowTitle('pyqtgraph example: Scrolling Plots')

import nidaqmx
from nidaqmx.stream_readers import AnalogSingleChannelReader
from nidaqmx.system.storage.persisted_task import PersistedTask
system = nidaqmx.system.System.local()
print(system.driver_version,end="\n\n")


Temperature_Task = PersistedTask("Droplet_Temps").load()
Temperature_Reader = AnalogSingleChannelReader(Temperature_Task.in_stream)
data = np.array([])

plot = win.addPlot()
plot.setDownsampling(mode='peak')
plot.setClipToView(True)
curve = plot.plot()

def update():
    global data
    data = np.append(data,Temperature_Reader.read_one_sample())

    curve.setData(data)

timer = pg.QtCore.QTimer()
timer.timeout.connect(update)
timer.start(100)

if __name__ == '__main__':
    pg.exec()
    Temperature_Task.close()
