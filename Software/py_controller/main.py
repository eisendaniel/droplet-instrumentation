import time
import os
import sys
from PySide2.QtCore import QLine
from PySide2.QtWidgets import QApplication, QMainWindow, QDesktopWidget, QTextEdit, QLineEdit, QPushButton, QMessageBox, QWidget, QGridLayout, QTextEdit, QGroupBox, QVBoxLayout, QHBoxLayout, QComboBox, QLabel
import serial.tools.list_ports
import serial
from PySide2.QtGui import QIcon, QScreen
from random import randint
import platform


def find_USB_device():
    myports = [tuple(p) for p in list(serial.tools.list_ports.comports())]
    print(myports)
    usb_port_list = [p[0] for p in myports]

    return usb_port_list


class GroupClass(QGroupBox):
    def __init__(self, widget, title="Connection Config"):
        super().__init__(widget)
        self.widget = widget
        self.title = title
        self.sep = "-"
        self.id = -1
        self.name = ''
        self.items = find_USB_device()
        self.serial = None
        self.init()

    def init(self):
        self.setTitle(self.title)

        self.selectlbl = QLabel("Select port:")

        self.typeBox = QComboBox()
        self.typeBox.addItems(self.items)
        self.typeBox.setCurrentIndex(self.typeBox.count()-1)

        button = QPushButton("Connect")
        button.clicked.connect(self.connect)
        send_btn = QPushButton("send")
        send_btn.clicked.connect(self.send_data)

        titlelbl = QLabel("Enter")
        self.title = QLineEdit("")
        desclbl = QLabel("Console")
        self.desc = QTextEdit("")

        self.fields = QGridLayout()
        self.fields.addWidget(self.selectlbl, 0, 0, 1, 1)  # select port
        self.fields.addWidget(self.typeBox, 0, 1, 1, 1)  # dropdown
        self.fields.addWidget(button, 0, 2, 1, 1)

        self.fields.addWidget(titlelbl, 1, 0, 1, 1)  # Enter
        self.fields.addWidget(self.title, 1, 1, 1, 1)
        self.fields.addWidget(send_btn, 1, 2, 1, 1)
        self.fields.addWidget(desclbl, 2, 0, 1, 1)  # Console
        self.fields.addWidget(self.desc, 3, 1, 1, 1)
        self.setLayout(self.fields)

    def connect(self):
        self.desc.setText("")
        self.desc.setText(
            f">> trying to connect to port {self.typeBox.currentText()} ...")

        if self.serial is None:
            # TODO selectedable baud-----------v
            self.serial = serial.Serial(
                self.typeBox.currentText(), 115200, timeout=1)
            time.sleep(0.05)
            answer = self.read_data()
            if answer != "":
                self.desc.setText(self.desc.toPlainText() +
                                  "\n>>Connected\n"+answer)
        else:
            self.desc.setText(
                f">> {self.typeBox.currentText()} already opened!\n")

    def send_data(self):
        if self.serial is None:
            self.connect()
        if self.serial.isOpen():
            if self.title.text() != "":
                self.serial.write(self.title.text().encode())
                answer = self.read_data()
                self.desc.setText(self.desc.toPlainText()+"\n"+answer)

    def read_data(self):
        self.serial.flush()
        answer = ""
        while self.serial.inWaiting() > 0:
            answer += "\n"+str(self.serial.readline()).replace("\\r","").replace("\\n", "").replace("'", "").replace("b", "")
        return answer


class SerialInterface(QMainWindow):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.width = 650
        self.height = 350

        self.resize(self.width, self.height)
        self.setWindowIcon(QIcon('./resources/logo-100.png'))
        self.setWindowTitle('Serial Monitor')

        # center window on screen
        qr = self.frameGeometry()
        cp = QScreen().availableGeometry().center()
        qr.moveCenter(cp)

        # init layout
        centralwidget = QWidget(self)
        centralLayout = QHBoxLayout(centralwidget)
        self.setCentralWidget(centralwidget)

        # add connect group
        self.connectgrp = GroupClass(self)
        centralLayout.addWidget(self.connectgrp)


def main():
    app = QApplication(sys.argv)
    frame = SerialInterface()
    frame.show()
    sys.exit(app.exec_())


if __name__ == "__main__":
    main()
