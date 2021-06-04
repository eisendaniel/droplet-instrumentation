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
L RF_Module:ESP32-WROOM-32 U?
U 1 1 60B9CB5A
P 6800 4050
F 0 "U?" H 6800 5631 50  0000 C CNN
F 1 "ESP32-WROOM-32" H 6800 5540 50  0000 C CNN
F 2 "RF_Module:ESP32-WROOM-32" H 6800 2550 50  0001 C CNN
F 3 "https://www.espressif.com/sites/default/files/documentation/esp32-wroom-32_datasheet_en.pdf" H 6500 4100 50  0001 C CNN
	1    6800 4050
	1    0    0    -1  
$EndComp
$Comp
L Driver_Motor:Pololu_Breakout_DRV8825 A?
U 1 1 60BA2527
P 8900 2150
F 0 "A?" H 8900 2931 50  0000 C CNN
F 1 "Pololu_Breakout_DRV8825" H 8900 2840 50  0000 C CNN
F 2 "Module:Pololu_Breakout-16_15.2x20.3mm" H 9100 1350 50  0001 L CNN
F 3 "https://www.pololu.com/product/2982" H 9000 1850 50  0001 C CNN
	1    8900 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60BA5B36
P 6250 1750
F 0 "#PWR?" H 6250 1500 50  0001 C CNN
F 1 "GND" H 6255 1577 50  0000 C CNN
F 2 "" H 6250 1750 50  0001 C CNN
F 3 "" H 6250 1750 50  0001 C CNN
	1    6250 1750
	1    0    0    -1  
$EndComp
$Comp
L power:+VDC #PWR?
U 1 1 60BA6690
P 6250 1250
F 0 "#PWR?" H 6250 1150 50  0001 C CNN
F 1 "+VDC" H 6250 1525 50  0000 C CNN
F 2 "" H 6250 1250 50  0001 C CNN
F 3 "" H 6250 1250 50  0001 C CNN
	1    6250 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 60BA7DB3
P 6850 1500
F 0 "C?" H 6968 1546 50  0000 L CNN
F 1 "CP" H 6968 1455 50  0000 L CNN
F 2 "" H 6888 1350 50  0001 C CNN
F 3 "~" H 6850 1500 50  0001 C CNN
	1    6850 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 60BA81F8
P 6500 1500
F 0 "C?" H 6618 1546 50  0000 L CNN
F 1 "CP" H 6618 1455 50  0000 L CNN
F 2 "" H 6538 1350 50  0001 C CNN
F 3 "~" H 6500 1500 50  0001 C CNN
	1    6500 1500
	1    0    0    -1  
$EndComp
NoConn ~ 8500 1750
$Comp
L power:+VDC #PWR?
U 1 1 60BBCA80
P 8900 1250
F 0 "#PWR?" H 8900 1150 50  0001 C CNN
F 1 "+VDC" H 8900 1525 50  0000 C CNN
F 2 "" H 8900 1250 50  0001 C CNN
F 3 "" H 8900 1250 50  0001 C CNN
	1    8900 1250
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 60BBC613
P 8400 1750
F 0 "#PWR?" H 8400 1600 50  0001 C CNN
F 1 "+3V3" H 8415 1923 50  0000 C CNN
F 2 "" H 8400 1750 50  0001 C CNN
F 3 "" H 8400 1750 50  0001 C CNN
	1    8400 1750
	1    0    0    -1  
$EndComp
NoConn ~ 8500 2750
$Comp
L power:GND #PWR?
U 1 1 60BC3DF9
P 8450 3100
F 0 "#PWR?" H 8450 2850 50  0001 C CNN
F 1 "GND" H 8455 2927 50  0000 C CNN
F 2 "" H 8450 3100 50  0001 C CNN
F 3 "" H 8450 3100 50  0001 C CNN
	1    8450 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 2150 8450 2150
Wire Wire Line
	8450 2150 8450 3000
Wire Wire Line
	8450 3000 8900 3000
Wire Wire Line
	8900 3000 8900 2950
Wire Wire Line
	8900 3000 9000 3000
Wire Wire Line
	9000 3000 9000 2950
Connection ~ 8900 3000
Wire Wire Line
	8450 3100 8450 3000
Connection ~ 8450 3000
Wire Wire Line
	8500 2550 8400 2550
Wire Wire Line
	8400 2550 8400 1950
Wire Wire Line
	8400 1950 8500 1950
Wire Wire Line
	8500 2650 8400 2650
Wire Wire Line
	8400 2650 8400 2550
Connection ~ 8400 2550
Wire Wire Line
	8500 1850 8400 1850
Wire Wire Line
	8400 1850 8400 1950
Connection ~ 8400 1950
Wire Wire Line
	8400 1850 8400 1750
Connection ~ 8400 1850
Wire Wire Line
	8900 1250 8900 1550
$Comp
L Driver_Motor:Pololu_Breakout_DRV8825 A?
U 1 1 60BC6775
P 8900 4600
F 0 "A?" H 8900 5381 50  0000 C CNN
F 1 "Pololu_Breakout_DRV8825" H 8900 5290 50  0000 C CNN
F 2 "Module:Pololu_Breakout-16_15.2x20.3mm" H 9100 3800 50  0001 L CNN
F 3 "https://www.pololu.com/product/2982" H 9000 4300 50  0001 C CNN
	1    8900 4600
	1    0    0    -1  
$EndComp
NoConn ~ 8500 4200
$Comp
L power:+VDC #PWR?
U 1 1 60BC6786
P 8900 3700
F 0 "#PWR?" H 8900 3600 50  0001 C CNN
F 1 "+VDC" H 8900 3975 50  0000 C CNN
F 2 "" H 8900 3700 50  0001 C CNN
F 3 "" H 8900 3700 50  0001 C CNN
	1    8900 3700
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 60BC6790
P 8400 4200
F 0 "#PWR?" H 8400 4050 50  0001 C CNN
F 1 "+3V3" H 8415 4373 50  0000 C CNN
F 2 "" H 8400 4200 50  0001 C CNN
F 3 "" H 8400 4200 50  0001 C CNN
	1    8400 4200
	1    0    0    -1  
$EndComp
NoConn ~ 8500 5200
$Comp
L power:GND #PWR?
U 1 1 60BC679B
P 8450 5550
F 0 "#PWR?" H 8450 5300 50  0001 C CNN
F 1 "GND" H 8455 5377 50  0000 C CNN
F 2 "" H 8450 5550 50  0001 C CNN
F 3 "" H 8450 5550 50  0001 C CNN
	1    8450 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 4600 8450 4600
Wire Wire Line
	8450 4600 8450 5450
Wire Wire Line
	8450 5450 8900 5450
Wire Wire Line
	8900 5450 8900 5400
Wire Wire Line
	8900 5450 9000 5450
Wire Wire Line
	9000 5450 9000 5400
Connection ~ 8900 5450
Wire Wire Line
	8450 5550 8450 5450
Connection ~ 8450 5450
Wire Wire Line
	8500 5000 8400 5000
Wire Wire Line
	8400 5000 8400 4400
Wire Wire Line
	8400 4400 8500 4400
Wire Wire Line
	8500 5100 8400 5100
Wire Wire Line
	8400 5100 8400 5000
Connection ~ 8400 5000
Wire Wire Line
	8500 4300 8400 4300
Wire Wire Line
	8400 4300 8400 4400
Connection ~ 8400 4400
Wire Wire Line
	8400 4300 8400 4200
Connection ~ 8400 4300
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
L power:+3V3 #PWR?
U 1 1 60BE7BAC
P 6150 2500
F 0 "#PWR?" H 6150 2350 50  0001 C CNN
F 1 "+3V3" H 6165 2673 50  0000 C CNN
F 2 "" H 6150 2500 50  0001 C CNN
F 3 "" H 6150 2500 50  0001 C CNN
	1    6150 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60BE91DC
P 6800 5500
F 0 "#PWR?" H 6800 5250 50  0001 C CNN
F 1 "GND" H 6805 5327 50  0000 C CNN
F 2 "" H 6800 5500 50  0001 C CNN
F 3 "" H 6800 5500 50  0001 C CNN
	1    6800 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 2650 6800 2600
Wire Wire Line
	6800 2600 6150 2600
Wire Wire Line
	6150 2600 6150 2500
Wire Wire Line
	6200 2850 6150 2850
Wire Wire Line
	6150 2850 6150 2600
Connection ~ 6150 2600
Wire Wire Line
	6800 5500 6800 5450
Text GLabel 8350 2250 0    50   Input ~ 0
R_STEP
Text GLabel 8350 2350 0    50   Input ~ 0
R_DIR
Text GLabel 8350 4700 0    50   Input ~ 0
Z_STEP
Text GLabel 8350 4800 0    50   Input ~ 0
Z_DIR
Wire Wire Line
	8350 4700 8500 4700
Wire Wire Line
	8350 4800 8500 4800
Wire Wire Line
	8350 2250 8500 2250
Wire Wire Line
	8350 2350 8500 2350
$Comp
L Motor:Stepper_Motor_bipolar M?
U 1 1 60B988BE
P 9750 2450
F 0 "M?" H 9938 2574 50  0000 L CNN
F 1 "Stepper_Motor_bipolar" H 9938 2483 50  0000 L CNN
F 2 "" H 9760 2440 50  0001 C CNN
F 3 "http://www.infineon.com/dgdl/Application-Note-TLE8110EE_driving_UniPolarStepperMotor_V1.1.pdf?fileId=db3a30431be39b97011be5d0aa0a00b0" H 9760 2440 50  0001 C CNN
	1    9750 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 2450 9450 2450
Wire Wire Line
	9450 2450 9450 2550
Wire Wire Line
	9300 2350 9450 2350
Wire Wire Line
	9300 2150 9650 2150
Wire Wire Line
	9300 2050 9850 2050
Wire Wire Line
	9850 2050 9850 2150
$Comp
L Motor:Stepper_Motor_bipolar M?
U 1 1 60C05853
P 9750 4900
F 0 "M?" H 9938 5024 50  0000 L CNN
F 1 "Stepper_Motor_bipolar" H 9938 4933 50  0000 L CNN
F 2 "" H 9760 4890 50  0001 C CNN
F 3 "http://www.infineon.com/dgdl/Application-Note-TLE8110EE_driving_UniPolarStepperMotor_V1.1.pdf?fileId=db3a30431be39b97011be5d0aa0a00b0" H 9760 4890 50  0001 C CNN
	1    9750 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 4900 9450 4900
Wire Wire Line
	9450 4900 9450 5000
Wire Wire Line
	9300 4800 9450 4800
Wire Wire Line
	9300 4600 9650 4600
Wire Wire Line
	9300 4500 9850 4500
Wire Wire Line
	9850 4500 9850 4600
Text GLabel 7500 4150 2    50   Input ~ 0
R_STEP
Text GLabel 7500 4050 2    50   Input ~ 0
R_DIR
Text GLabel 7500 3350 2    50   Input ~ 0
Z_STEP
Text GLabel 7500 3950 2    50   Input ~ 0
Z_DIR
Wire Wire Line
	7500 4150 7400 4150
Wire Wire Line
	7500 4050 7400 4050
Wire Wire Line
	7500 3350 7400 3350
Wire Wire Line
	7500 3950 7400 3950
Wire Wire Line
	8900 3700 8900 4000
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
Text Notes 7450 2200 0    50   ~ 0
Controller\n
$EndSCHEMATC
