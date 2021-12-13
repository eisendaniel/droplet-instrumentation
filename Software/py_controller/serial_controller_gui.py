import sys
from PyQt5 import QtCore, QtWidgets, QtSerialPort
from datetime import datetime

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
    "115200",
    "128000",
    "256000",
]


def get_com_devices():
    ports = QtSerialPort.QSerialPortInfo.availablePorts()
    return [p.systemLocation() for p in ports]


class App(QtWidgets.QMainWindow):
    def __init__(self):
        super().__init__()
        self.title = "Droplet Instrumentation Controller"
        self.left = 64
        self.top = 128
        self.width = 600
        self.height = 800
        self.setWindowTitle(self.title)
        self.setGeometry(self.left, self.top, self.width, self.height)

        self.table_widget = Widget(self)
        self.setCentralWidget(self.table_widget)

        self.show()


class Widget(QtWidgets.QWidget):
    def __init__(self, parent):
        super(Widget, self).__init__(parent)
        self.layout = QtWidgets.QVBoxLayout(self)

        self.devices = get_com_devices()
        self.update_timer = QtCore.QTimer()
        self.update_timer.timeout.connect(self.update_devs)
        self.update_timer.start(2000)

        self.pip_engaged = True
        self.tip_pos = 10.0
        self.res_pos = 56.0
        self.drop_pos = 172.4

        # Initialise tab screen
        self.tabs = QtWidgets.QTabWidget()
        self.Motors = QtWidgets.QWidget()
        self.Cameras = QtWidgets.QWidget()
        self.TODO = QtWidgets.QWidget()
        self.tabs.resize(600, 800)

        self.tabs.addTab(self.Motors, "Motors")
        self.tabs.addTab(self.Cameras, "Cameras")
        self.tabs.addTab(self.TODO, "TODO")

        MotorTabLayout = QtWidgets.QVBoxLayout()
        MotorTabLayout.setContentsMargins(128, 16, 128, 16)
        # MotorTabLayout.setAlignment(QtCore.Qt.AlignVCenter)

        # Serial Moniter--------------------------------------------------------------------
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
            text="Execute Preset Sequence", clicked=self.send_seq
        )
        self.exec_seq_btn.setStyleSheet(
            "QPushButton {background-color: #73ff98; font-size: 16pt; color: #101010; padding: 8px}"
        )

        self.seq_sel_btn = QtWidgets.QComboBox()
        self.seq_sel_btn.addItems(
            ["Standard Deposit Sequence", "Large Volume Drop Sequence"]
        )

        SequenceLayout = QtWidgets.QVBoxLayout()
        SequenceLayout.addWidget(self.exec_seq_btn)
        SequenceLayout.addWidget(self.seq_sel_btn)
        # ----------------------------------------------------------------------------------

        # Manual Control--------------------------------------------------------------------
        self.R_val = QtWidgets.QDoubleSpinBox()
        self.R_val.setMinimum(0.0)
        self.R_val.setMaximum(180.0)
        self.Z_val = QtWidgets.QDoubleSpinBox()
        self.Z_val.setMinimum(0.0)
        self.Z_val.setMaximum(10.0)
        self.Z_val.setValue(5.0)
        self.DEL_val = QtWidgets.QDoubleSpinBox()
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
        self.PIP_btn = QtWidgets.QPushButton(text="Refill Pipette", clicked=(lambda: self.send_cmd("PIP ")))

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

        # Serial Connection-----------------------------------------------------------------
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
        # MotorTabLayout.addLayout(MoniterLayout)
        MotorTabLayout.addLayout(ProcedureLayout)
        MotorTabLayout.addSpacing(16)
        MotorTabLayout.addLayout(SequenceLayout)
        MotorTabLayout.addSpacing(16)
        MotorTabLayout.addLayout(CommandLayout)
        MotorTabLayout.addSpacing(16)
        # MotorTabLayout.addLayout(ConnectionLayout)
        self.Motors.setLayout(MotorTabLayout)
        # ----------------------------------------------------------------------------------

        CameraTabLayout = QtWidgets.QVBoxLayout()
        CameraTabLayout.setContentsMargins(128, 0, 128, 0)
        CameraTabLayout.setAlignment(QtCore.Qt.AlignVCenter)

        FPS_layout = QtWidgets.QHBoxLayout()
        init_fps = [30.0, 20.0, 10.0]
        fps_inpts = [QtWidgets.QDoubleSpinBox() for f in init_fps]
        for n in range(3):
            fps_inpts[n].setValue(init_fps[n])
            FPS_layout.addWidget(fps_inpts[n])

        Times_layout = QtWidgets.QHBoxLayout()
        init_times = [5.0, 5.0, 5.0]
        time_inpts = [QtWidgets.QDoubleSpinBox() for t in init_times]
        for n in range(3):
            time_inpts[n].setValue(init_times[n])
            Times_layout.addWidget(time_inpts[n])

        self.update_cam = QtWidgets.QPushButton(
            text="Update Camera Settings", 
            clicked=(lambda: self.send_cmd(f"SETCAM {fps_inpts[0].value()} {time_inpts[0].value()} {fps_inpts[1].value()} {time_inpts[1].value()} {fps_inpts[2].value()} {time_inpts[2].value()}"))
            )
        self.start_cam = QtWidgets.QPushButton(
            text="Start Cameras",
            clicked=(lambda: self.send_cmd("RUNCAM "))
        )

        CameraTabLayout.addWidget(QtWidgets.QLabel("Framerates (Hz):"))
        CameraTabLayout.addLayout(FPS_layout)
        CameraTabLayout.addWidget(QtWidgets.QLabel("Durations (s):"))
        CameraTabLayout.addLayout(Times_layout)
        CameraTabLayout.addWidget(self.update_cam)
        CameraTabLayout.addSpacing(16)
        CameraTabLayout.addWidget(self.start_cam)

        self.Cameras.setLayout(CameraTabLayout)

        # ----------------------------------------------------------------------------------
        self.layout.addLayout(MoniterLayout)
        self.layout.addWidget(self.tabs)
        self.layout.addLayout(ConnectionLayout)
        self.setLayout(self.layout)
        # ----------------------------------------------------------------------------------
        # Open serial connection
        self.serial = QtSerialPort.QSerialPort(
            self.com_select.currentText(),
            baudRate=QtSerialPort.QSerialPort.BaudRate(
                int(self.baud_select.currentText())
            ),
            readyRead=self.receive,
        )

    # Signal Slot Functions -----------------------------------------------------------------
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
        while self.serial.canReadLine():
            text = self.serial.readLine().data().decode()
            text = text.rstrip("\r\n")
            if self.do_ts.isChecked():
                text = str(datetime.now()) + ": " + text
            self.serial_monitor.append(text)

    @QtCore.pyqtSlot()
    def send_raw(self):
        if self.raw_input.text() == "!clear":
            self.serial_monitor.clear()
        else:
            self.serial.write(self.raw_input.text().encode())
            if self.record_seq.isChecked():
                QtCore.QTimer.singleShot(1500, self.record_seq.toggle)
        self.raw_input.clear()

    @QtCore.pyqtSlot()
    def send_cmd(self, cmd):
        sender = self.sender()
        if sender in [self.R_btn, self.res_btn, self.tip_btn, self.drop_btn]:
            self.Z_val.setValue(10.0)
        if sender == self.res_btn:
            self.R_val.setValue(self.res_pos)
        elif sender == self.tip_btn:
            self.R_val.setValue(self.tip_pos)
        elif sender == self.drop_btn:
            self.R_val.setValue(self.drop_pos)
        elif sender == self.home_btn:
            self.R_val.setValue(0.0)
            self.Z_val.setValue(5.0)
        elif sender == self.start_cam:
            self.start_cam.setText("Restart Cameras")
        elif sender == self.PIP_btn:
            if self.pip_engaged:
                cmd+= "UP"
                self.PIP_btn.setText("Dispense Droplet")
            else:
                cmd+= "DOWN"
                self.PIP_btn.setText("Refill Pipette")
            self.pip_engaged = not self.pip_engaged

        if self.record_seq.isChecked():
            self.raw_input.setText(self.raw_input.text() + cmd + "; ")
        else:
            self.serial.write(cmd.encode())

    @QtCore.pyqtSlot(bool)
    def send_seq(self):

        sequences = [
            f"R {self.res_pos}; Z 0; PIP UP; R {self.drop_pos}; DEL 500; PIP DOWN; Z {self.Z_val.value()}; Z 1; ADJ R -100; R {self.res_pos};",
            f"R {self.res_pos}; Z 0; PIP UP; R {self.drop_pos}; DEL 500; PIP DOWN; DEL 500; R {self.res_pos};",
        ]

        self.record_seq.toggle()
        self.raw_input.setText(sequences[self.seq_sel_btn.currentIndex()])
        QtCore.QTimer.singleShot(1500, self.send_btn.click)

    @QtCore.pyqtSlot(bool)
    def record_toggled(self, checked):
        self.raw_input.clear()
        if checked:
            self.serial.write("SEQ".encode())
        else:
            self.serial.write("END".encode())

    @QtCore.pyqtSlot()
    def update_devs(self):
        self.devices = get_com_devices()
        if (len(self.devices) <= 0) and self.connection_btn.isChecked():
            self.connection_btn.toggle()

        i = self.com_select.currentIndex()
        self.com_select.clear()
        self.com_select.addItems(self.devices)
        self.com_select.setCurrentIndex(i)
        self.update_timer.start(2000)

    @QtCore.pyqtSlot(bool)
    def serial_connect(self, checked):
        self.connection_btn.setText("Disconnect" if checked else "Connect")
        if checked:
            if not self.serial.isOpen():
                self.serial = QtSerialPort.QSerialPort(
                    self.com_select.currentText(),
                    baudRate=QtSerialPort.QSerialPort.BaudRate(
                        int(self.baud_select.currentText())
                    ),
                    readyRead=self.receive,
                )
                if not self.serial.open(QtCore.QIODevice.ReadWrite):
                    self.connection_btn.setChecked(False)
        else:
            self.serial.close()

    # ----------------------------------------------------------------------------------


def main():
    app = QtWidgets.QApplication(sys.argv)
    app.setStyle("Fusion")
    run = App()
    sys.exit(app.exec_())


if __name__ == "__main__":
    main()
