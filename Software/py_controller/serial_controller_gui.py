import sys
from PyQt5 import QtCore, QtWidgets, QtSerialPort

BAUDS = ["110", "300", "1200", '2400', '4800', '9600',
         '19200', '38400', '57600', '115200', '128000', '256000']


def get_com_devices():
    ports = QtSerialPort.QSerialPortInfo.availablePorts()
    return [p.systemLocation() for p in ports]


class App(QtWidgets.QMainWindow):
    def __init__(self):
        super().__init__()
        self.title = 'Droplet Instrumentation Controller'
        self.left = 0
        self.top = 0
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

        # Initialize tab screen
        self.tabs = QtWidgets.QTabWidget()
        self.Motors = QtWidgets.QWidget()
        self.Cameras = QtWidgets.QWidget()
        self.TODO = QtWidgets.QWidget()
        self.tabs.resize(600, 800)

        self.tabs.addTab(self.Motors, "Motors")
        self.tabs.addTab(self.Cameras, "Cameras")
        self.tabs.addTab(self.TODO, "...")

        self.com_select = QtWidgets.QComboBox()
        self.com_select.addItems(self.devices)
        self.com_select.setCurrentIndex(self.com_select.count()-1)
        self.baud_select = QtWidgets.QComboBox()
        self.baud_select.addItems(BAUDS)
        self.baud_select.setCurrentIndex(BAUDS.index("115200"))

        self.raw_input = QtWidgets.QLineEdit()
        self.raw_input.setPlaceholderText("Raw Input...")
        self.raw_input.returnPressed.connect(self.send_raw)
        self.send_btn = QtWidgets.QPushButton(
            text="Send",
            clicked=self.send_raw
        )
        self.output_text = QtWidgets.QTextEdit(readOnly=True)
        self.connection_btn = QtWidgets.QPushButton(
            text="Connect",
            checkable=True,
            toggled=self.on_toggled
        )

        self.Motors.layout = QtWidgets.QGridLayout()  # R  C  rs cs
        self.Motors.layout.addWidget(self.raw_input,      0, 0, 1, 2)
        self.Motors.layout.addWidget(self.send_btn,       0, 2, 1, 1)
        self.Motors.layout.addWidget(self.output_text,    1, 0, 1, 3)
        self.Motors.layout.addWidget(self.connection_btn, 2, 0, 1, 3)
        self.Motors.layout.addWidget(self.com_select,     3, 0, 1, 2)
        self.Motors.layout.addWidget(self.baud_select,    3, 2, 1, 1)
        self.Motors.setLayout(self.Motors.layout)

        self.layout.addWidget(self.tabs)
        self.setLayout(self.layout)

        # Open serial connection
        self.serial = QtSerialPort.QSerialPort(
            self.com_select.currentText(),
            baudRate=QtSerialPort.QSerialPort.BaudRate(
                int(self.baud_select.currentText())),
            readyRead=self.receive
        )

    # Func callbacks
    @QtCore.pyqtSlot()
    def receive(self):
        while self.serial.canReadLine():
            text = self.serial.readLine().data().decode()
            text = text.rstrip('\r\n')
            self.output_text.append(text)

    @QtCore.pyqtSlot()
    def send_raw(self):
        if self.raw_input.text() == "!clear":
            self.output_text.clear()
        else:
            self.serial.write(self.raw_input.text().encode())
        self.raw_input.clear()

    @QtCore.pyqtSlot(bool)
    def on_toggled(self, checked):
        self.connection_btn.setText("Disconnect" if checked else "Connect")
        if checked:
            if not self.serial.isOpen():
                self.serial = QtSerialPort.QSerialPort(
                    self.com_select.currentText(),
                    baudRate=QtSerialPort.QSerialPort.BaudRate(
                        int(self.baud_select.currentText())),
                    readyRead=self.receive
                )
                if not self.serial.open(QtCore.QIODevice.ReadWrite):
                    self.connection_btn.setChecked(False)
        else:
            self.serial.close()

        self.devices = get_com_devices()


def main():
    app = QtWidgets.QApplication(sys.argv)
    run = App()
    sys.exit(app.exec_())


if __name__ == '__main__':
    main()
