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
        self.res_pos = 56
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

        self.raw_input = QtWidgets.QLineEdit()
        self.raw_input.setPlaceholderText("Raw Input...")
        self.raw_input.returnPressed.connect(self.send_raw)
        self.send_btn = QtWidgets.QPushButton(text="Send", clicked=self.send_raw)
        self.do_ts = QtWidgets.QCheckBox(text="Show Timestamp")
        self.serial_monitor = QtWidgets.QTextEdit(readOnly=True)
        self.serial_monitor.setFontFamily("Monospace")

        self.home_btn = QtWidgets.QPushButton(
            text="Home Motor Positions", clicked=(lambda: self.send_cmd("HOME "))
        )
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
            clicked=(lambda: self.send_cmd("R " + str(self.R_val.value()))),
        )
        self.Z_btn = QtWidgets.QPushButton(
            text="Set Height (mm)",
            clicked=(lambda: self.send_cmd("Z " + str(self.Z_val.value()))),
        )
        self.DEL_btn = QtWidgets.QPushButton(
            text="Delay (ms)",
            clicked=(lambda: self.send_cmd("DEL " + str(self.DEL_val.value()))),
        )
        self.PIP_btn = QtWidgets.QPushButton(
            text="Refill Pipette", clicked=self.send_P
        )

        self.record_seq = QtWidgets.QPushButton(
            text="Record Sequence", checkable=True, toggled=self.record_toggled
        )

        self.res_btn = QtWidgets.QPushButton(
            text=f"Go to Reservoir ({self.res_pos}°)",
            clicked=(lambda: self.send_cmd(f"R {self.res_pos}")),
        )
        self.drop_btn = QtWidgets.QPushButton(
            text=f"Go to Droplet Stage ({self.drop_pos}°)",
            clicked=(lambda: self.send_cmd(f"R {self.drop_pos}")),
        )
        self.reset_btn = QtWidgets.QPushButton(
            text="Reset Saved Positions", clicked=self.init_reset
        )

        self.com_select = QtWidgets.QComboBox()
        self.com_select.setDuplicatesEnabled(False)
        self.com_select.addItems(self.devices)
        self.com_select.setCurrentIndex(self.com_select.count() - 1)
        self.baud_select = QtWidgets.QComboBox()
        self.baud_select.addItems(BAUDS)
        self.baud_select.setCurrentIndex(BAUDS.index("115200"))

        self.connection_btn = QtWidgets.QPushButton(
            text="Connect", checkable=True, toggled=self.on_toggled
        )

        self.Motors.layout = QtWidgets.QGridLayout()  # row, col, r_span, c_span
        self.Motors.layout.addWidget(self.raw_input, 0, 0, 1, 2)
        self.Motors.layout.addWidget(self.send_btn, 0, 2, 1, 1)
        self.Motors.layout.addWidget(self.do_ts, 0, 3, 1, 1)
        self.Motors.layout.addWidget(self.serial_monitor, 1, 0, 1, 4)

        self.Motors.layout.addWidget(self.reset_btn, 2, 1, 1, 2)
        self.Motors.layout.addWidget(self.res_btn, 3, 1, 1, 1)
        self.Motors.layout.addWidget(self.drop_btn, 3, 2, 1, 1)

        self.Motors.layout.addWidget(self.home_btn, 4, 1, 1, 2)
        self.Motors.layout.addWidget(self.R_val, 5, 1, 1, 1)
        self.Motors.layout.addWidget(self.R_btn, 5, 2, 1, 1)
        self.Motors.layout.addWidget(self.Z_val, 6, 1, 1, 1)
        self.Motors.layout.addWidget(self.Z_btn, 6, 2, 1, 1)
        self.Motors.layout.addWidget(self.DEL_val, 7, 1, 1, 1)
        self.Motors.layout.addWidget(self.DEL_btn, 7, 2, 1, 1)
        self.Motors.layout.addWidget(self.record_seq, 8, 1, 1, 1)
        self.Motors.layout.addWidget(self.PIP_btn, 8, 2, 1, 1)

        self.Motors.layout.addWidget(self.connection_btn, 9, 0, 1, 4)
        self.Motors.layout.addWidget(self.com_select, 10, 0, 1, 2)
        self.Motors.layout.addWidget(self.baud_select, 10, 2, 1, 2)
        self.Motors.setLayout(self.Motors.layout)

        self.layout.addWidget(self.tabs)
        self.setLayout(self.layout)

        # Open serial connection
        self.serial = QtSerialPort.QSerialPort(
            self.com_select.currentText(),
            baudRate=QtSerialPort.QSerialPort.BaudRate(
                int(self.baud_select.currentText())
            ),
            readyRead=self.receive,
        )

    @QtCore.pyqtSlot()
    def init_reset(self):
        if not self.res_btn.isChecked():
            self.res_btn.setText("Set Reservoir Position")
            self.res_btn.setCheckable(True)
            self.res_btn.setChecked(True)
            self.res_btn.clicked.disconnect()
            self.res_btn.clicked.connect(lambda: self.reset_pos(True))
            self.res_reset = True

        if not self.drop_btn.isChecked():
            self.drop_btn.setText("Set Droplet Position")
            self.drop_btn.setCheckable(True)
            self.drop_btn.setChecked(True)
            self.drop_btn.clicked.disconnect()
            self.drop_btn.clicked.connect(lambda: self.reset_pos(False))
            self.drop_reset = True

    @QtCore.pyqtSlot()
    def reset_pos(self, isReservoir):
        if isReservoir:
            self.res_pos = self.R_val.value()
            self.res_btn.setText(f"Go to Reservoir ({self.res_pos}°)")
            self.res_btn.setCheckable(False)
            self.res_reset = False
            self.res_btn.clicked.disconnect()
            self.res_btn.clicked.connect(lambda: self.send_cmd(f"R {self.res_pos}"))
        else:
            self.drop_pos = self.R_val.value()
            self.drop_btn.setText(f"Go to Droplet Stage ({self.drop_pos}°)")
            self.drop_btn.setCheckable(False)
            self.drop_reset = False
            self.drop_btn.clicked.disconnect()
            self.drop_btn.clicked.connect(lambda: self.send_cmd(f"R {self.drop_pos}"))

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
        if self.record_seq.isChecked():
            self.raw_input.setText(self.raw_input.text() + cmd + "; ")
        else:
            self.serial.write(cmd.encode())

    @QtCore.pyqtSlot()
    def send_P(self):
        if self.pip_engaged:
            cmd = "PIP UP"
            self.PIP_btn.setText("Dispense Droplet")
        else:
            cmd = "PIP DOWN"
            self.PIP_btn.setText("Refill Pipette")
        if self.record_seq.isChecked():
            self.raw_input.setText(self.raw_input.text() + cmd + "; ")
        else:
            self.serial.write(cmd.encode())
        self.pip_engaged = not self.pip_engaged

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
    def on_toggled(self, checked):
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


def main():
    app = QtWidgets.QApplication(sys.argv)
    run = App()
    sys.exit(app.exec_())


if __name__ == "__main__":
    main()
