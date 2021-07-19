EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR03
U 1 1 60BA5B36
P 6250 1750
F 0 "#PWR03" H 6250 1500 50  0001 C CNN
F 1 "GND" H 6255 1577 50  0000 C CNN
F 2 "" H 6250 1750 50  0001 C CNN
F 3 "" H 6250 1750 50  0001 C CNN
	1    6250 1750
	1    0    0    -1  
$EndComp
$Comp
L power:+VDC #PWR02
U 1 1 60BA6690
P 6250 1250
F 0 "#PWR02" H 6250 1150 50  0001 C CNN
F 1 "+VDC" H 6250 1525 50  0000 C CNN
F 2 "" H 6250 1250 50  0001 C CNN
F 3 "" H 6250 1250 50  0001 C CNN
	1    6250 1250
	1    0    0    -1  
$EndComp
$Comp
L Motor_Control-rescue:CP-Device C2
U 1 1 60BA7DB3
P 6850 1500
F 0 "C2" H 6968 1546 50  0000 L CNN
F 1 "100u" H 6968 1455 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 6888 1350 50  0001 C CNN
F 3 "~" H 6850 1500 50  0001 C CNN
	1    6850 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 1250 6250 1300
Wire Wire Line
	6250 1300 6500 1300
Wire Wire Line
	6850 1300 6850 1350
Wire Wire Line
	6500 1350 6500 1300
Connection ~ 6500 1300
Wire Wire Line
	6500 1300 6850 1300
Wire Wire Line
	6250 1750 6250 1700
Wire Wire Line
	6250 1700 6500 1700
Wire Wire Line
	6850 1700 6850 1650
Wire Wire Line
	6500 1650 6500 1700
Connection ~ 6500 1700
Wire Wire Line
	6500 1700 6850 1700
$Comp
L power:+3V3 #PWR01
U 1 1 60BE7BAC
P 7150 2450
F 0 "#PWR01" H 7150 2300 50  0001 C CNN
F 1 "+3V3" H 7165 2623 50  0000 C CNN
F 2 "" H 7150 2450 50  0001 C CNN
F 3 "" H 7150 2450 50  0001 C CNN
	1    7150 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 5300 7050 5050
Wire Notes Line
	6000 850  6000 5850
Wire Notes Line
	6000 2050 7900 2050
Wire Notes Line
	7900 850  7900 5850
Wire Notes Line
	10900 5850 10900 850 
Wire Notes Line
	6000 850  10900 850 
Wire Notes Line
	6000 5850 10900 5850
Text Notes 7300 1000 0    50   ~ 0
Motor Supply\n
Text Notes 10300 1000 0    50   ~ 0
Motor Drivers\n
Text Notes 7400 2200 0    50   ~ 0
Controller\n
Wire Wire Line
	10250 4500 10250 4600
Wire Wire Line
	10250 2050 10250 2150
Wire Wire Line
	9300 3700 9300 4000
Wire Wire Line
	9700 4500 10250 4500
Wire Wire Line
	9700 4600 10050 4600
Wire Wire Line
	9700 4800 9850 4800
Wire Wire Line
	9800 4900 9800 5000
Wire Wire Line
	9700 4900 9800 4900
$Comp
L Motor:Stepper_Motor_bipolar M2
U 1 1 60C05853
P 10150 4900
F 0 "M2" H 10100 4700 50  0000 L CNN
F 1 "Z" H 9750 4600 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 10160 4890 50  0001 C CNN
F 3 "http://www.infineon.com/dgdl/Application-Note-TLE8110EE_driving_UniPolarStepperMotor_V1.1.pdf?fileId=db3a30431be39b97011be5d0aa0a00b0" H 10160 4890 50  0001 C CNN
	1    10150 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 2050 10250 2050
Wire Wire Line
	9700 2150 10050 2150
Wire Wire Line
	9700 2350 9850 2350
Wire Wire Line
	9700 2450 9800 2450
$Comp
L Motor:Stepper_Motor_bipolar M1
U 1 1 60B988BE
P 10150 2450
F 0 "M1" H 10100 2250 50  0000 L CNN
F 1 "R" H 10100 2150 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 10160 2440 50  0001 C CNN
F 3 "http://www.infineon.com/dgdl/Application-Note-TLE8110EE_driving_UniPolarStepperMotor_V1.1.pdf?fileId=db3a30431be39b97011be5d0aa0a00b0" H 10160 2440 50  0001 C CNN
	1    10150 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 2350 8900 2350
Wire Wire Line
	8750 2250 8900 2250
Wire Wire Line
	8750 4800 8900 4800
Wire Wire Line
	8750 4700 8900 4700
Text GLabel 8750 4800 0    50   Input ~ 0
Z_DIR
Text GLabel 8750 4700 0    50   Input ~ 0
Z_STEP
Text GLabel 8750 2350 0    50   Input ~ 0
R_DIR
Text GLabel 8750 2250 0    50   Input ~ 0
R_STEP
Connection ~ 8800 4300
Wire Wire Line
	8800 4300 8800 4200
Connection ~ 8800 4400
Wire Wire Line
	8800 4300 8800 4400
Wire Wire Line
	8900 4300 8800 4300
Connection ~ 8800 5000
Wire Wire Line
	8800 5100 8800 5000
Wire Wire Line
	8900 5100 8800 5100
Wire Wire Line
	8800 4400 8900 4400
Wire Wire Line
	8800 5000 8800 4400
Wire Wire Line
	8900 5000 8800 5000
Wire Wire Line
	8900 4600 8850 4600
NoConn ~ 8900 5200
$Comp
L power:+3V3 #PWR06
U 1 1 60BC6790
P 8800 4200
F 0 "#PWR06" H 8800 4050 50  0001 C CNN
F 1 "+3V3" H 8815 4373 50  0000 C CNN
F 2 "" H 8800 4200 50  0001 C CNN
F 3 "" H 8800 4200 50  0001 C CNN
	1    8800 4200
	1    0    0    -1  
$EndComp
$Comp
L power:+VDC #PWR010
U 1 1 60BC6786
P 9300 3700
F 0 "#PWR010" H 9300 3600 50  0001 C CNN
F 1 "+VDC" H 9300 3975 50  0000 C CNN
F 2 "" H 9300 3700 50  0001 C CNN
F 3 "" H 9300 3700 50  0001 C CNN
	1    9300 3700
	1    0    0    -1  
$EndComp
NoConn ~ 8900 4200
$Comp
L Driver_Motor:Pololu_Breakout_DRV8825 A2
U 1 1 60BC6775
P 9300 4600
F 0 "A2" H 9300 5381 50  0000 C CNN
F 1 "Z Motor Driver" H 9300 5290 50  0000 C CNN
F 2 "Module:Pololu_Breakout-16_15.2x20.3mm" H 9500 3800 50  0001 L CNN
F 3 "https://www.pololu.com/product/2982" H 9400 4300 50  0001 C CNN
	1    9300 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 1250 9300 1550
Connection ~ 8800 1850
Wire Wire Line
	8800 1850 8800 1750
Connection ~ 8800 1950
Wire Wire Line
	8800 1850 8800 1950
Wire Wire Line
	8900 1850 8800 1850
Connection ~ 8800 2550
Wire Wire Line
	8800 2650 8800 2550
Wire Wire Line
	8900 2650 8800 2650
Wire Wire Line
	8800 1950 8900 1950
Wire Wire Line
	8800 2550 8800 1950
Wire Wire Line
	8900 2550 8800 2550
Connection ~ 8850 3000
Wire Wire Line
	8850 3100 8850 3000
Wire Wire Line
	9300 3000 9300 2950
Wire Wire Line
	8850 3000 9300 3000
Wire Wire Line
	8850 2150 8850 3000
Wire Wire Line
	8900 2150 8850 2150
$Comp
L power:GND #PWR011
U 1 1 60BC3DF9
P 9400 3100
F 0 "#PWR011" H 9400 2850 50  0001 C CNN
F 1 "GND" H 9405 2927 50  0000 C CNN
F 2 "" H 9400 3100 50  0001 C CNN
F 3 "" H 9400 3100 50  0001 C CNN
	1    9400 3100
	1    0    0    -1  
$EndComp
NoConn ~ 8900 2750
$Comp
L power:+3V3 #PWR05
U 1 1 60BBC613
P 8800 1750
F 0 "#PWR05" H 8800 1600 50  0001 C CNN
F 1 "+3V3" H 8815 1923 50  0000 C CNN
F 2 "" H 8800 1750 50  0001 C CNN
F 3 "" H 8800 1750 50  0001 C CNN
	1    8800 1750
	1    0    0    -1  
$EndComp
$Comp
L power:+VDC #PWR09
U 1 1 60BBCA80
P 9300 1250
F 0 "#PWR09" H 9300 1150 50  0001 C CNN
F 1 "+VDC" H 9300 1525 50  0000 C CNN
F 2 "" H 9300 1250 50  0001 C CNN
F 3 "" H 9300 1250 50  0001 C CNN
	1    9300 1250
	1    0    0    -1  
$EndComp
NoConn ~ 8900 1750
$Comp
L Driver_Motor:Pololu_Breakout_DRV8825 A1
U 1 1 60BA2527
P 9300 2150
F 0 "A1" H 9300 2931 50  0000 C CNN
F 1 "R Motor Driver" H 9300 2840 50  0000 C CNN
F 2 "Module:Pololu_Breakout-16_15.2x20.3mm" H 9500 1350 50  0001 L CNN
F 3 "https://www.pololu.com/product/2982" H 9400 1850 50  0001 C CNN
	1    9300 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 5000 9850 5000
Wire Wire Line
	9800 2450 9800 2550
Wire Wire Line
	9800 2550 9850 2550
$Comp
L power:GNDD #PWR04
U 1 1 60F70744
P 7050 5300
F 0 "#PWR04" H 7050 5050 50  0001 C CNN
F 1 "GNDD" H 7054 5145 50  0000 C CNN
F 2 "" H 7050 5300 50  0001 C CNN
F 3 "" H 7050 5300 50  0001 C CNN
	1    7050 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR07
U 1 1 60F7559F
P 8850 3100
F 0 "#PWR07" H 8850 2850 50  0001 C CNN
F 1 "GNDD" H 8854 2945 50  0000 C CNN
F 2 "" H 8850 3100 50  0001 C CNN
F 3 "" H 8850 3100 50  0001 C CNN
	1    8850 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 3100 9400 2950
Connection ~ 8850 5450
Wire Wire Line
	8850 5550 8850 5450
Wire Wire Line
	9300 5450 9300 5400
Wire Wire Line
	8850 5450 9300 5450
Wire Wire Line
	8850 4600 8850 5450
$Comp
L power:GND #PWR012
U 1 1 60F7D990
P 9400 5550
F 0 "#PWR012" H 9400 5300 50  0001 C CNN
F 1 "GND" H 9405 5377 50  0000 C CNN
F 2 "" H 9400 5550 50  0001 C CNN
F 3 "" H 9400 5550 50  0001 C CNN
	1    9400 5550
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR08
U 1 1 60F7D99A
P 8850 5550
F 0 "#PWR08" H 8850 5300 50  0001 C CNN
F 1 "GNDD" H 8854 5395 50  0000 C CNN
F 2 "" H 8850 5550 50  0001 C CNN
F 3 "" H 8850 5550 50  0001 C CNN
	1    8850 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 5550 9400 5400
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 60F81099
P 7350 1450
F 0 "J1" H 7450 1450 50  0000 L CNN
F 1 "V_MOTOR" H 7450 1350 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2_1x02_P5.00mm_Horizontal" H 7350 1450 50  0001 C CNN
F 3 "~" H 7350 1450 50  0001 C CNN
	1    7350 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 1450 7100 1450
Wire Wire Line
	7100 1450 7100 1300
Wire Wire Line
	7100 1300 6850 1300
Connection ~ 6850 1300
Wire Wire Line
	7150 1550 7100 1550
Wire Wire Line
	7100 1550 7100 1700
Wire Wire Line
	7100 1700 6850 1700
Connection ~ 6850 1700
Wire Wire Line
	6450 4650 6550 4650
Wire Wire Line
	6450 4550 6550 4550
Text GLabel 6450 4650 0    50   Input ~ 0
Z_DIR
Text GLabel 6450 4550 0    50   Input ~ 0
Z_STEP
$Comp
L MCU_Module:Adafruit_Feather_HUZZAH32_ESP32 A3
U 1 1 60F95919
P 7050 3750
F 0 "A3" H 7050 2361 50  0000 C CNN
F 1 "Adafruit_Feather_HUZZAH32_ESP32" H 7050 2270 50  0000 C CNN
F 2 "Module:Adafruit_Feather" H 7150 2400 50  0001 L CNN
F 3 "https://cdn-learn.adafruit.com/downloads/pdf/adafruit-huzzah32-esp32-feather.pdf" H 7050 2550 50  0001 C CNN
	1    7050 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 3950 6550 3950
Wire Wire Line
	6450 4050 6550 4050
Text GLabel 6450 3950 0    50   Input ~ 0
R_DIR
Text GLabel 6450 4050 0    50   Input ~ 0
R_STEP
Wire Wire Line
	7150 2550 7150 2450
NoConn ~ 7250 2550
NoConn ~ 7550 2950
NoConn ~ 7550 3250
NoConn ~ 6950 2550
NoConn ~ 6550 2950
NoConn ~ 6550 3050
NoConn ~ 6550 3150
NoConn ~ 6550 3250
NoConn ~ 6550 3350
NoConn ~ 6550 3450
NoConn ~ 6550 3550
NoConn ~ 6550 3650
NoConn ~ 6550 3850
NoConn ~ 6550 4250
NoConn ~ 6550 4350
NoConn ~ 7550 3550
NoConn ~ 7550 3650
NoConn ~ 7550 3750
NoConn ~ 7550 3850
NoConn ~ 7550 3950
NoConn ~ 7550 4050
$Comp
L Motor_Control-rescue:CP-Device C1
U 1 1 60BA81F8
P 6500 1500
F 0 "C1" H 6618 1546 50  0000 L CNN
F 1 "100u" H 6618 1455 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 6538 1350 50  0001 C CNN
F 3 "~" H 6500 1500 50  0001 C CNN
	1    6500 1500
	1    0    0    -1  
$EndComp
$EndSCHEMATC
