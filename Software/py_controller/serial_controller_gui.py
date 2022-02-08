import sys
from datetime import datetime

import numpy as np

from PyQt5 import QtCore, QtWidgets, QtSerialPort
import pyqtgraph as pg

import nidaqmx
from nidaqmx.stream_readers import AnalogMultiChannelReader
from nidaqmx.system.storage.persisted_task import PersistedTask
from nidaqmx.constants import LoggingMode, LoggingOperation

ENV_MONITER_LOG = False

"""
This is a pyqt based UI program designed as a unified control software for 
the Droplet Instrumentation. It provides serial connection to the control brd and different tabs:
* pre-set position control, automated sequences (custom and pre-set) and manual control
* Camera triggering frame rate setting
* NI-DaQMX thermocouple measurements
"""

# List of Serial BAUD rates for selection
BAUDS = [
    "110",
    "300",
    "1200",
    "2400",
    "4800",
    "9600",
    "19200",
    "38400",
    "57600",
    "115200",  # controller firmware uses this value
    "128000",
    "256000",
]

# color sequence for auto assigned chart line colors
COLORS = ["r", "g", "b", "c", "m", "y", "k", "w"]

"""
@def get_com_devices
@returns list(str) Ports
Helper function for finding OS names of serial ports available for connection
"""


def get_com_devices():
    ports = QtSerialPort.QSerialPortInfo.availablePorts()
    return [p.systemLocation() for p in ports]


def get_nimax_tasks():
    local_sys = nidaqmx.system.system.System()
    return local_sys.tasks.task_names


# main App window setup
class Window(QtWidgets.QMainWindow):
    def __init__(self):
        super().__init__()
        title = "Droplet Instrumentation Controller"
        left = 64
        top = 128
        width = 540
        height = 960
        self.setWindowTitle(title)
        self.setGeometry(left, top, width, height)

        self.table_widget = Widget(self)  # main UI widget
        self.setCentralWidget(self.table_widget)

        self.show()


class niDaQ(QtCore.QObject):
    data_aquired = QtCore.pyqtSignal()


# define main UI structure
class Widget(QtWidgets.QWidget):
    def __init__(self, parent):
        super(Widget, self).__init__(parent)
        self.layout = QtWidgets.QVBoxLayout(self)

        self.devices = get_com_devices()
        self.control_brd = QtSerialPort.QSerialPort()

        if ENV_MONITER_LOG:
            self.atmos_moniter = QtSerialPort.QSerialPort()
            self.atmos = [np.NaN, np.NaN, np.NaN]
            # self.connect_atmos()

        self.niDaQ_dev = niDaQ()
        self.niDaQ_dev.data_aquired.connect(self.update_graph)

        # 2s timer for updating COM devices drop-down
        self.update_timer = QtCore.QTimer()
        self.update_timer.timeout.connect(self.update_devs)
        self.update_timer.start(2000)

        # pipette state and preset positions
        self.pip_engaged = True
        self.tip_pos = 250.0
        self.res_pos = 172.0
        self.drop_pos = 84.0

        # Initialise tabs
        self.tabs = QtWidgets.QTabWidget()
        self.Motors = QtWidgets.QWidget()
        self.Cameras = QtWidgets.QWidget()
        self.DaQ = QtWidgets.QWidget()

        self.tabs.addTab(self.Motors, "Motors")
        self.tabs.addTab(self.Cameras, "Cameras")
        self.tabs.addTab(self.DaQ, "Temperature")

        MotorTabLayout = QtWidgets.QVBoxLayout()
        MotorTabLayout.setContentsMargins(128, 16, 128, 16)

        # ----------------------------------------------------------------------------------
        # Serial Monitor--------------------------------------------------------------------
        self.raw_input = QtWidgets.QLineEdit()
        self.raw_input.setPlaceholderText("Raw Input...")
        self.raw_input.returnPressed.connect(self.send_raw)
        self.send_btn = QtWidgets.QPushButton(text="Send", clicked=self.send_raw)
        self.do_ts = QtWidgets.QCheckBox(text="Show Timestamp")
        self.serial_monitor = QtWidgets.QTextEdit(readOnly=True)
        self.serial_monitor.setFontFamily("Monospace")

        MoniterLayout = QtWidgets.QGridLayout()
        MoniterLayout.addWidget(self.raw_input, 0, 0, 1, 2)
        MoniterLayout.addWidget(self.send_btn, 0, 2, 1, 1)
        MoniterLayout.addWidget(self.do_ts, 0, 3, 1, 1)
        MoniterLayout.addWidget(self.serial_monitor, 1, 0, 1, 4)
        # ----------------------------------------------------------------------------------

        # Position Setup--------------------------------------------------------------------
        self.home_btn = QtWidgets.QPushButton(
            text="Home Motor Positions", clicked=(lambda: self.send_cmd("HOME "))
        )
        self.home_btn.setStyleSheet("QPushButton {background-color: #ff9f6b}")

        self.reset_btn = QtWidgets.QPushButton(
            text="Reset Saved Positions", clicked=self.init_reset
        )
        self.reset_btn.setStyleSheet("QPushButton {background-color: #cccccc}")

        self.drop_btn = QtWidgets.QPushButton(
            text=f"Go to Droplet Stage ({self.drop_pos}°)",
            clicked=(lambda: self.send_cmd(f"R {self.drop_pos}")),
        )
        self.drop_btn.setStyleSheet("QPushButton {background-color: #fff173}")
        self.res_btn = QtWidgets.QPushButton(
            text=f"Go to Reservoir ({self.res_pos}°)",
            clicked=(lambda: self.send_cmd(f"R {self.res_pos}")),
        )
        self.res_btn.setStyleSheet("QPushButton {background-color: #73d3ff}")
        self.tip_btn = QtWidgets.QPushButton(
            text=f"Go to Tip Change ({self.tip_pos}°)",
            clicked=(lambda: self.send_cmd(f"R {self.tip_pos}")),
        )
        self.tip_btn.setStyleSheet("QPushButton {background-color: #ff73e5}")

        ProcedureLayout = QtWidgets.QVBoxLayout()
        ProcedureLayout.addWidget(self.home_btn)
        ProcedureLayout.addWidget(self.reset_btn)
        ProcedureLayout.addWidget(self.drop_btn)
        ProcedureLayout.addWidget(self.res_btn)
        ProcedureLayout.addWidget(self.tip_btn)
        # ----------------------------------------------------------------------------------

        # Standard Sequences-----------------------------------------------------------------
        self.exec_seq_btn = QtWidgets.QPushButton(
            text="Run Standard Sequence", clicked=self.send_seq
        )
        self.exec_seq_btn.setStyleSheet(
            "QPushButton {background-color: #73ff98; font-size: 16pt; color: #101010; padding: 8px}"
        )

        self.seq_Z_dispense = QtWidgets.QDoubleSpinBox()
        self.seq_Z_dispense.setRange(0.0, 10.0)
        self.seq_Z_dispense.setSingleStep(0.1)
        self.seq_Z_dispense.setValue(2.5)
        self.seq_Z_deposit = QtWidgets.QDoubleSpinBox()
        self.seq_Z_deposit.setRange(0.0, 10.0)
        self.seq_Z_deposit.setSingleStep(0.1)
        self.seq_Z_deposit.setValue(0.0)

        self.seq_Z_jump = QtWidgets.QDoubleSpinBox()
        self.seq_Z_jump.setRange(0.0, 5.0)
        self.seq_Z_jump.setSingleStep(0.1)
        self.seq_Z_jump.setValue(2.5)
        self.seq_dispense_del = QtWidgets.QDoubleSpinBox()
        self.seq_dispense_del.setRange(0.0, 10000)
        self.seq_dispense_del.setSingleStep(100.0)
        self.seq_dispense_del.setValue(0.0)

        seq_setting_layout = QtWidgets.QGridLayout()
        seq_setting_layout.addWidget(
            QtWidgets.QLabel("Dispense Height (mm)"), 0, 0, 1, 1
        )
        seq_setting_layout.addWidget(self.seq_Z_dispense, 0, 1, 1, 1)
        seq_setting_layout.addWidget(
            QtWidgets.QLabel("Dispense Delay (ms)"), 0, 2, 1, 1
        )
        seq_setting_layout.addWidget(self.seq_dispense_del, 0, 3, 1, 1)
        seq_setting_layout.addWidget(
            QtWidgets.QLabel("Deposit Height (mm)"), 1, 0, 1, 1
        )
        seq_setting_layout.addWidget(self.seq_Z_deposit, 1, 1, 1, 1)
        seq_setting_layout.addWidget(
            QtWidgets.QLabel("Retraction delta (mm)"), 1, 2, 1, 1
        )
        seq_setting_layout.addWidget(self.seq_Z_jump, 1, 3, 1, 1)

        SequenceLayout = QtWidgets.QVBoxLayout()
        SequenceLayout.addWidget(self.exec_seq_btn)
        SequenceLayout.addLayout(seq_setting_layout)
        # ----------------------------------------------------------------------------------

        # Manual Control--------------------------------------------------------------------
        self.R_val = QtWidgets.QDoubleSpinBox()
        self.R_val.setRange(0.0, 300.0)
        self.Z_val = QtWidgets.QDoubleSpinBox()
        self.Z_val.setRange(0.0, 10.0)
        self.Z_val.setValue(10.0)
        self.DEL_val = QtWidgets.QDoubleSpinBox()
        self.DEL_val.setSingleStep(100.0)
        self.DEL_val.setRange(0.0, 10000.0)
        self.R_btn = QtWidgets.QPushButton(
            text="Rotate (deg)",
            clicked=(lambda: self.send_cmd(f"R {self.R_val.value()}")),
        )
        self.Z_btn = QtWidgets.QPushButton(
            text="Set Height (mm)",
            clicked=(lambda: self.send_cmd(f"Z {self.Z_val.value()}")),
        )
        self.DEL_btn = QtWidgets.QPushButton(
            text="Delay (ms)",
            clicked=(lambda: self.send_cmd(f"DEL {self.DEL_val.value()}")),
        )
        self.PIP_btn = QtWidgets.QPushButton(
            text="Refill Pipette", clicked=(lambda: self.send_cmd("PIP "))
        )

        self.record_seq = QtWidgets.QPushButton(
            text="Custom Sequence", checkable=True, toggled=self.record_toggled
        )
        self.record_seq.setStyleSheet(
            "QPushButton:checked{color: #ffffff; background-color: #ff0000}"
        )
        CommandLayout = QtWidgets.QGridLayout()
        CommandLayout.addWidget(self.Z_val, 0, 0, 1, 1)
        CommandLayout.addWidget(self.Z_btn, 0, 1, 1, 1)
        CommandLayout.addWidget(self.R_val, 1, 0, 1, 1)
        CommandLayout.addWidget(self.R_btn, 1, 1, 1, 1)
        CommandLayout.addWidget(self.DEL_val, 2, 0, 1, 1)
        CommandLayout.addWidget(self.DEL_btn, 2, 1, 1, 1)
        CommandLayout.addWidget(self.record_seq, 3, 0, 1, 1)
        CommandLayout.addWidget(self.PIP_btn, 3, 1, 1, 1)
        # ----------------------------------------------------------------------------------
        MotorTabLayout.addLayout(ProcedureLayout)
        MotorTabLayout.addSpacing(16)
        MotorTabLayout.addLayout(SequenceLayout)
        MotorTabLayout.addSpacing(16)
        MotorTabLayout.addLayout(CommandLayout)
        MotorTabLayout.addSpacing(16)
        self.Motors.setLayout(MotorTabLayout)
        # ----------------------------------------------------------------------------------

        CameraTabLayout = QtWidgets.QVBoxLayout()
        CameraTabLayout.setContentsMargins(128, 0, 128, 0)
        CameraTabLayout.setAlignment(QtCore.Qt.AlignVCenter)

        FPS_layout = QtWidgets.QHBoxLayout()
        init_fps = [10.0, 1.0, 0.1]
        fps_inputs = [QtWidgets.QDoubleSpinBox() for f in init_fps]
        for n in range(3):
            fps_inputs[n].setValue(init_fps[n])
            FPS_layout.addWidget(fps_inputs[n])

        Times_layout = QtWidgets.QHBoxLayout()
        init_times = [6.0, 60.0, 0.0]
        time_inputs = [QtWidgets.QDoubleSpinBox() for t in init_times]
        for n in range(3):
            time_inputs[n].setRange(0.0, 1000.0)
            time_inputs[n].setValue(init_times[n])
            Times_layout.addWidget(time_inputs[n])

        time_inputs[2].setDisabled(True)
        self.update_cam = QtWidgets.QPushButton(
            text="Update Camera Settings",
            clicked=(
                lambda: self.send_cmd(
                    f"SETCAM {fps_inputs[0].value()} {time_inputs[0].value()} {fps_inputs[1].value()} {time_inputs[1].value()} {fps_inputs[2].value()} {time_inputs[2].value()}"
                )
            ),
        )
        self.start_cam = QtWidgets.QPushButton(
            text="Start Cameras", clicked=(lambda: self.send_cmd("RUNCAM "))
        )
        self.stop_cam = QtWidgets.QPushButton(
            text="Stop Cameras", clicked=(lambda: self.send_cmd("STOPCAM "))
        )

        CameraTabLayout.addWidget(QtWidgets.QLabel("Frame rates (Hz):"))
        CameraTabLayout.addLayout(FPS_layout)
        CameraTabLayout.addWidget(QtWidgets.QLabel("Durations (s):"))
        CameraTabLayout.addLayout(Times_layout)
        CameraTabLayout.addWidget(self.update_cam)
        CameraTabLayout.addSpacing(16)
        CameraTabLayout.addWidget(self.start_cam)
        CameraTabLayout.addWidget(self.stop_cam)

        self.Cameras.setLayout(CameraTabLayout)
        # ----------------------------------------------------------------------------------
        # Temperaure Graphing Layout--------------------------------------------------------

        TemperatureTabLayout = QtWidgets.QVBoxLayout()

        self.Temperature_Task = None
        self.Temperature_Reader = None
        self.data_slice = None
        self.temp_data = None
        self.logfilename = None

        pg.setConfigOptions(antialias=True)
        self.T_chart = pg.plot()
        self.T_chart.addLegend()
        self.T_chart.setDownsampling(mode="peak")
        self.T_chart.setClipToView(True)
        self.T_curves = None

        T_UILayout = QtWidgets.QGridLayout()
        self.daq_btn = QtWidgets.QPushButton(
            text="Start", checkable=True, toggled=self.daq_stop_start
        )
        self.daq_btn.setStyleSheet("QPushButton:checked{background-color: #f00000}")
        self.TDMS_log = QtWidgets.QCheckBox(text="Log Data")
        self.logfiledisplay = QtWidgets.QLabel("No log file selected...")
        self.selectlog_btn = QtWidgets.QPushButton(
            text="Select LogFile", clicked=self.select_logfile
        )

        T_UILayout.addWidget(self.daq_btn, 0, 0, 1, 4)
        T_UILayout.addWidget(self.TDMS_log, 0, 4, 1, 1)
        T_UILayout.addWidget(self.logfiledisplay, 1, 0, 1, 4, QtCore.Qt.AlignRight)
        T_UILayout.addWidget(self.selectlog_btn, 1, 4, 1, 1)

        TemperatureTabLayout.addWidget(self.T_chart)
        TemperatureTabLayout.addLayout(T_UILayout)

        self.DaQ.setLayout(TemperatureTabLayout)
        # ----------------------------------------------------------------------------------
        # Serial Connection Layout----------------------------------------------------------
        self.com_select = QtWidgets.QComboBox()
        self.com_select.setDuplicatesEnabled(False)
        self.com_select.addItems(self.devices)
        self.com_select.setCurrentIndex(self.com_select.count() - 1)
        self.baud_select = QtWidgets.QComboBox()
        self.baud_select.addItems(BAUDS)
        self.baud_select.setCurrentIndex(BAUDS.index("115200"))

        self.connection_btn = QtWidgets.QPushButton(
            text="Connect", checkable=True, toggled=self.serial_connect
        )
        self.connection_btn.setStyleSheet(
            "QPushButton:checked{background-color: #00f000}"
        )
        ConnectionLayout = QtWidgets.QGridLayout()
        ConnectionLayout.addWidget(self.connection_btn, 0, 0, 1, 2)
        ConnectionLayout.addWidget(self.com_select, 1, 0, 1, 1)
        ConnectionLayout.addWidget(self.baud_select, 1, 1, 1, 1)

        # ----------------------------------------------------------------------------------
        # Add all Layouts-------------------------------------------------------------------
        self.layout.addLayout(MoniterLayout)
        self.layout.addWidget(self.tabs)
        self.layout.addLayout(ConnectionLayout)
        self.setLayout(self.layout)
        # ----------------------------------------------------------------------------------

    def connect_atmos(self):
        self.atmos_moniter = QtSerialPort.QSerialPort(
            "/dev/ttyACM0",
            baudRate=QtSerialPort.QSerialPort.BaudRate(69),
            readyRead=self.read_atmos,
        )
        self.atmos_moniter.open(QtCore.QIODevice.ReadWrite)

    @QtCore.pyqtSlot()
    def read_atmos(self):
        try:
            self.atmos = list(
                map(float, self.atmos_moniter.readLine().data().decode().split(","))
            )
        except ValueError:
            pass

    # ----------------------------------------------------------------------------------

    # Signal Slot Functions ----------------------------------------------------------------
    @QtCore.pyqtSlot()
    def init_reset(self):
        if not self.res_btn.isChecked():
            self.res_btn.setText("Set Reservoir Position")
            self.res_btn.setCheckable(True)
            self.res_btn.setChecked(True)
            self.res_btn.clicked.disconnect()
            self.res_btn.clicked.connect(lambda: self.reset_pos("drop"))

        if not self.drop_btn.isChecked():
            self.drop_btn.setText("Set Droplet Position")
            self.drop_btn.setCheckable(True)
            self.drop_btn.setChecked(True)
            self.drop_btn.clicked.disconnect()
            self.drop_btn.clicked.connect(lambda: self.reset_pos("res"))

        if not self.tip_btn.isChecked():
            self.tip_btn.setText("Set Tip Change Position")
            self.tip_btn.setCheckable(True)
            self.tip_btn.setChecked(True)
            self.tip_btn.clicked.disconnect()
            self.tip_btn.clicked.connect(lambda: self.reset_pos("tip"))

    @QtCore.pyqtSlot()
    def reset_pos(self, pos):
        if pos == "drop":
            self.res_pos = self.R_val.value()
            self.res_btn.setText(f"Go to Reservoir ({self.res_pos}°)")
            self.res_btn.setCheckable(False)
            self.res_btn.clicked.disconnect()
            self.res_btn.clicked.connect(lambda: self.send_cmd(f"R {self.res_pos}"))
        elif pos == "res":
            self.drop_pos = self.R_val.value()
            self.drop_btn.setText(f"Go to Droplet Stage ({self.drop_pos}°)")
            self.drop_btn.setCheckable(False)
            self.drop_btn.clicked.disconnect()
            self.drop_btn.clicked.connect(lambda: self.send_cmd(f"R {self.drop_pos}"))
        elif pos == "tip":
            self.tip_pos = self.R_val.value()
            self.tip_btn.setText(f"Go to Tip Change ({self.tip_pos}°)")
            self.tip_btn.setCheckable(False)
            self.tip_btn.clicked.disconnect()
            self.tip_btn.clicked.connect(lambda: self.send_cmd(f"R {self.tip_pos}"))

    @QtCore.pyqtSlot()
    def receive(self):
        while self.control_brd.canReadLine():
            text = self.control_brd.readLine().data().decode()
            text = text.rstrip("\r\n")
            if self.do_ts.isChecked():
                text = str(datetime.now()) + ": " + text
            self.serial_monitor.append(text)

    @QtCore.pyqtSlot()
    def send_raw(self):
        if self.raw_input.text() == "!clear":
            self.serial_monitor.clear()
        else:
            self.control_brd.write(self.raw_input.text().encode())
            if self.record_seq.isChecked():
                QtCore.QTimer.singleShot(1500, self.record_seq.toggle)
        self.raw_input.clear()

    @QtCore.pyqtSlot()
    def send_cmd(self, cmd):
        sender = self.sender()
        if sender in [
            self.R_btn,
            self.res_btn,
            self.tip_btn,
            self.drop_btn,
            self.exec_seq_btn,
        ]:
            self.Z_val.setValue(10.0)
        if sender in [self.res_btn, self.exec_seq_btn]:
            self.R_val.setValue(self.res_pos)
        elif sender == self.tip_btn:
            self.R_val.setValue(self.tip_pos)
        elif sender == self.drop_btn:
            self.R_val.setValue(self.drop_pos)
        elif sender == self.home_btn:
            self.R_val.setValue(0.0)
            self.Z_val.setValue(10.0)
        elif sender == self.start_cam:
            self.start_cam.setText("Restart Cameras")
        elif sender in [self.update_cam, self.stop_cam]:
            self.start_cam.setText("Start Cameras")
        elif sender == self.PIP_btn:
            if self.pip_engaged:
                cmd += "UP"
                self.PIP_btn.setText("Dispense Droplet")
            else:
                cmd += "DOWN"
                self.PIP_btn.setText("Refill Pipette")
            self.pip_engaged = not self.pip_engaged

        if self.record_seq.isChecked():
            self.raw_input.setText(self.raw_input.text() + cmd + "; ")
        else:
            self.control_brd.write(cmd.encode())

    @QtCore.pyqtSlot(bool)
    def send_seq(self):

        # safety
        if (self.seq_Z_deposit.value() + self.seq_Z_jump.value()) > 10.0:
            self.seq_Z_jump.setValue(0.0)

        std_sequence = f"R {self.res_pos}; Z 0; PIP UP; R {self.drop_pos}; DEL 200; Z {self.seq_Z_dispense.value()}; RUNCAM ; PIP DOWN; DEL {self.seq_dispense_del.value()}; Z {self.seq_Z_deposit.value()}; Z {self.seq_Z_deposit.value()+self.seq_Z_jump.value()}; ADJ R 100; R {self.res_pos};"

        self.record_seq.toggle()
        self.raw_input.setText(std_sequence)
        QtCore.QTimer.singleShot(1500, self.send_btn.click)

    @QtCore.pyqtSlot(bool)
    def record_toggled(self, checked):
        self.raw_input.clear()
        if checked:
            self.control_brd.write("SEQ".encode())
        else:
            self.control_brd.write("END".encode())

    @QtCore.pyqtSlot()
    def update_devs(self):
        self.devices = get_com_devices()
        if (len(self.devices) <= 0) and self.connection_btn.isChecked():
            self.connection_btn.toggle()

        i = self.com_select.currentIndex()
        self.com_select.clear()
        self.com_select.addItems(self.devices)
        self.com_select.setCurrentIndex(i)

    @QtCore.pyqtSlot()
    def select_logfile(self):
        opt = QtWidgets.QFileDialog.Options()
        opt |= QtWidgets.QFileDialog.DontConfirmOverwrite
        filename, _ = QtWidgets.QFileDialog.getSaveFileName(
            filter="*.tdms", options=opt
        )
        if filename == "":
            if self.TDMS_log.isChecked():
                self.TDMS_log.toggle()
            return
        self.logfilename = filename
        self.logfiledisplay.setText(self.logfilename)

    @QtCore.pyqtSlot(bool)
    def daq_stop_start(self, checked):
        self.daq_btn.setText("Stop" if checked else "Start")
        if checked:  # Starting, init NIDaQ Tasks and Logging
            self.selectlog_btn.setDisabled(True)
            self.TDMS_log.setDisabled(True)

            if (self.logfilename is None) and (self.TDMS_log.isChecked()):
                self.select_logfile()

            self.Temperature_Task = PersistedTask("Droplet_Temps").load()

            log_state = (
                LoggingMode.LOG_AND_READ
                if self.TDMS_log.isChecked()
                else LoggingMode.OFF
            )

            if ENV_MONITER_LOG:
                run_name = "Run"
            else:
                run_name = f"Run @ : {self.atmos[0]} degC, {self.atmos[1]}%, {self.atmos[2]} hPa"

            self.Temperature_Task.in_stream.configure_logging(
                self.logfilename,
                logging_mode=log_state,
                group_name=run_name,
                operation=LoggingOperation.OPEN_OR_CREATE,
            )

            self.Temperature_Reader = AnalogMultiChannelReader(
                self.Temperature_Task.in_stream
            )

            frame_size = 1
            self.Temperature_Task.register_every_n_samples_acquired_into_buffer_event(
                frame_size, self.daq_callback
            )
            self.data_slice = np.zeros(
                (self.Temperature_Task.number_of_channels, frame_size)
            )

            self.temp_data = np.array([[]] * self.Temperature_Task.number_of_channels)

            self.T_chart.clear()
            self.T_curves = []
            for i in range(self.Temperature_Task.number_of_channels):
                self.T_curves += [
                    self.T_chart.plot(pen=COLORS[i], name=f"Temperature_{i}")
                ]

            self.Temperature_Task.start()
        else:  # Halt and Close Task
            self.selectlog_btn.setDisabled(False)
            self.TDMS_log.setDisabled(False)
            self.Temperature_Task.stop()
            self.Temperature_Task.close()

    @QtCore.pyqtSlot()
    def update_graph(self):
        for i, curve in enumerate(self.T_curves):
            curve.setData(self.temp_data[i, :])

    def daq_callback(
        self, task_handle, every_n_samples_event_type, number_of_samples, callbackdata
    ):
        self.Temperature_Reader.read_many_sample(
            self.data_slice, number_of_samples_per_channel=number_of_samples
        )
        self.temp_data = np.append(self.temp_data, self.data_slice, axis=1)

        self.niDaQ_dev.data_aquired.emit()

        return 0

    @QtCore.pyqtSlot(bool)
    def serial_connect(self, checked):
        self.connection_btn.setText("Disconnect" if checked else "Connect")
        if checked:
            self.baud_select.setDisabled(True)
            self.com_select.setDisabled(True)
            if not self.control_brd.isOpen():
                self.control_brd = QtSerialPort.QSerialPort(
                    self.com_select.currentText(),
                    baudRate=QtSerialPort.QSerialPort.BaudRate(
                        int(self.baud_select.currentText())
                    ),
                    readyRead=self.receive,
                )
                if not self.control_brd.open(QtCore.QIODevice.ReadWrite):
                    self.connection_btn.setChecked(False)
        else:
            self.baud_select.setDisabled(False)
            self.com_select.setDisabled(False)
            self.control_brd.close()

    # ----------------------------------------------------------------------------------


def main():
    app = QtWidgets.QApplication(sys.argv)
    app.setStyle("Fusion")
    run = Window()
    sys.exit(app.exec_())


if __name__ == "__main__":
    main()
