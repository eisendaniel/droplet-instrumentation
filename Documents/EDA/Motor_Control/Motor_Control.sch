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
P 5400 1825
F 0 "#PWR03" H 5400 1575 50  0001 C CNN
F 1 "GND" H 5405 1652 50  0000 C CNN
F 2 "" H 5400 1825 50  0001 C CNN
F 3 "" H 5400 1825 50  0001 C CNN
	1    5400 1825
	1    0    0    -1  
$EndComp
$Comp
L power:+VDC #PWR02
U 1 1 60BA6690
P 5400 1325
F 0 "#PWR02" H 5400 1225 50  0001 C CNN
F 1 "+VDC" H 5400 1600 50  0000 C CNN
F 2 "" H 5400 1325 50  0001 C CNN
F 3 "" H 5400 1325 50  0001 C CNN
	1    5400 1325
	1    0    0    -1  
$EndComp
$Comp
L Motor_Control-rescue:CP-Device C2
U 1 1 60BA7DB3
P 5600 1575
F 0 "C2" H 5718 1621 50  0000 L CNN
F 1 "100u" H 5718 1530 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 5638 1425 50  0001 C CNN
F 3 "~" H 5600 1575 50  0001 C CNN
	1    5600 1575
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 1375 5600 1425
Wire Wire Line
	5200 1425 5200 1375
Wire Wire Line
	5200 1375 5400 1375
Wire Wire Line
	5600 1775 5600 1725
Wire Wire Line
	5200 1725 5200 1775
Wire Wire Line
	5200 1775 5400 1775
Wire Notes Line
	5200 2150 5200 5950
Wire Notes Line
	7700 950  7700 5950
Wire Notes Line
	10700 5950 10700 950 
Text Notes 7125 1100 0    50   ~ 0
Motor Supply\n
Text Notes 10100 1100 0    50   ~ 0
Motor Drivers\n
Text Notes 7250 2300 0    50   ~ 0
Controller\n
Wire Wire Line
	9950 4600 9950 4700
Wire Wire Line
	9950 2150 9950 2250
Wire Wire Line
	9050 3800 9050 4100
Wire Wire Line
	9450 4600 9950 4600
Wire Wire Line
	9450 4700 9750 4700
Wire Wire Line
	9450 4900 9550 4900
Wire Wire Line
	9500 5000 9500 5100
Wire Wire Line
	9450 5000 9500 5000
$Comp
L Motor:Stepper_Motor_bipolar M2
U 1 1 60C05853
P 9850 5000
F 0 "M2" H 9800 4800 50  0000 L CNN
F 1 "Z" H 9450 4700 50  0000 L CNN
F 2 "molex_sherlock:molex_sherlock_vrthdr_4pin" H 9860 4990 50  0001 C CNN
F 3 "http://www.infineon.com/dgdl/Application-Note-TLE8110EE_driving_UniPolarStepperMotor_V1.1.pdf?fileId=db3a30431be39b97011be5d0aa0a00b0" H 9860 4990 50  0001 C CNN
	1    9850 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 2150 9950 2150
Wire Wire Line
	9450 2250 9750 2250
Wire Wire Line
	9450 2450 9550 2450
Wire Wire Line
	9450 2550 9500 2550
$Comp
L Motor:Stepper_Motor_bipolar M1
U 1 1 60B988BE
P 9850 2550
F 0 "M1" H 9800 2350 50  0000 L CNN
F 1 "R" H 9800 2250 50  0000 L CNN
F 2 "molex_sherlock:molex_sherlock_vrthdr_4pin" H 9860 2540 50  0001 C CNN
F 3 "http://www.infineon.com/dgdl/Application-Note-TLE8110EE_driving_UniPolarStepperMotor_V1.1.pdf?fileId=db3a30431be39b97011be5d0aa0a00b0" H 9860 2540 50  0001 C CNN
	1    9850 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 2450 8650 2450
Wire Wire Line
	8500 2350 8650 2350
Wire Wire Line
	8500 4900 8650 4900
Wire Wire Line
	8500 4800 8650 4800
Connection ~ 8550 4400
Wire Wire Line
	8550 4400 8550 4300
Connection ~ 8550 4500
Wire Wire Line
	8550 4400 8550 4500
Wire Wire Line
	8650 4400 8550 4400
Connection ~ 8550 5100
Wire Wire Line
	8550 5200 8550 5100
Wire Wire Line
	8650 5200 8550 5200
Wire Wire Line
	8550 4500 8650 4500
Wire Wire Line
	8550 5100 8550 4500
Wire Wire Line
	8650 5100 8550 5100
Wire Wire Line
	8650 4700 8600 4700
NoConn ~ 8650 5300
$Comp
L power:+3V3 #PWR06
U 1 1 60BC6790
P 8550 4300
F 0 "#PWR06" H 8550 4150 50  0001 C CNN
F 1 "+3V3" H 8565 4473 50  0000 C CNN
F 2 "" H 8550 4300 50  0001 C CNN
F 3 "" H 8550 4300 50  0001 C CNN
	1    8550 4300
	1    0    0    -1  
$EndComp
$Comp
L power:+VDC #PWR010
U 1 1 60BC6786
P 9050 3800
F 0 "#PWR010" H 9050 3700 50  0001 C CNN
F 1 "+VDC" H 9050 4075 50  0000 C CNN
F 2 "" H 9050 3800 50  0001 C CNN
F 3 "" H 9050 3800 50  0001 C CNN
	1    9050 3800
	1    0    0    -1  
$EndComp
NoConn ~ 8650 4300
$Comp
L Driver_Motor:Pololu_Breakout_DRV8825 A2
U 1 1 60BC6775
P 9050 4700
F 0 "A2" H 9050 5481 50  0000 C CNN
F 1 "Z Motor Driver" H 9050 5390 50  0000 C CNN
F 2 "Module:Pololu_Breakout-16_15.2x20.3mm" H 9250 3900 50  0001 L CNN
F 3 "https://www.pololu.com/product/2133" H 9150 4400 50  0001 C CNN
	1    9050 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 1350 9050 1650
Connection ~ 8550 1950
Wire Wire Line
	8550 1950 8550 1850
Connection ~ 8550 2050
Wire Wire Line
	8550 1950 8550 2050
Wire Wire Line
	8650 1950 8550 1950
Connection ~ 8550 2650
Wire Wire Line
	8550 2750 8550 2650
Wire Wire Line
	8650 2750 8550 2750
Wire Wire Line
	8550 2050 8650 2050
Wire Wire Line
	8550 2650 8550 2050
Wire Wire Line
	8650 2650 8550 2650
Connection ~ 8600 3100
Wire Wire Line
	8600 3200 8600 3100
Wire Wire Line
	9050 3100 9050 3050
Wire Wire Line
	8600 3100 9050 3100
Wire Wire Line
	8600 2250 8600 3100
Wire Wire Line
	8650 2250 8600 2250
$Comp
L power:GND #PWR011
U 1 1 60BC3DF9
P 9150 3200
F 0 "#PWR011" H 9150 2950 50  0001 C CNN
F 1 "GND" H 9155 3027 50  0000 C CNN
F 2 "" H 9150 3200 50  0001 C CNN
F 3 "" H 9150 3200 50  0001 C CNN
	1    9150 3200
	1    0    0    -1  
$EndComp
NoConn ~ 8650 2850
$Comp
L power:+3V3 #PWR05
U 1 1 60BBC613
P 8550 1850
F 0 "#PWR05" H 8550 1700 50  0001 C CNN
F 1 "+3V3" H 8565 2023 50  0000 C CNN
F 2 "" H 8550 1850 50  0001 C CNN
F 3 "" H 8550 1850 50  0001 C CNN
	1    8550 1850
	1    0    0    -1  
$EndComp
$Comp
L power:+VDC #PWR09
U 1 1 60BBCA80
P 9050 1350
F 0 "#PWR09" H 9050 1250 50  0001 C CNN
F 1 "+VDC" H 9050 1625 50  0000 C CNN
F 2 "" H 9050 1350 50  0001 C CNN
F 3 "" H 9050 1350 50  0001 C CNN
	1    9050 1350
	1    0    0    -1  
$EndComp
NoConn ~ 8650 1850
$Comp
L Driver_Motor:Pololu_Breakout_DRV8825 A1
U 1 1 60BA2527
P 9050 2250
F 0 "A1" H 9050 3031 50  0000 C CNN
F 1 "R Motor Driver" H 9050 2940 50  0000 C CNN
F 2 "Module:Pololu_Breakout-16_15.2x20.3mm" H 9250 1450 50  0001 L CNN
F 3 "https://www.pololu.com/product/2133" H 9150 1950 50  0001 C CNN
	1    9050 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 2550 9500 2650
Wire Wire Line
	9500 2650 9550 2650
$Comp
L power:GNDD #PWR04
U 1 1 60F70744
P 7200 5250
F 0 "#PWR04" H 7200 5000 50  0001 C CNN
F 1 "GNDD" H 7204 5095 50  0000 C CNN
F 2 "" H 7200 5250 50  0001 C CNN
F 3 "" H 7200 5250 50  0001 C CNN
	1    7200 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR07
U 1 1 60F7559F
P 8600 3200
F 0 "#PWR07" H 8600 2950 50  0001 C CNN
F 1 "GNDD" H 8604 3045 50  0000 C CNN
F 2 "" H 8600 3200 50  0001 C CNN
F 3 "" H 8600 3200 50  0001 C CNN
	1    8600 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 3200 9150 3050
Connection ~ 8600 5550
Wire Wire Line
	8600 5650 8600 5550
Wire Wire Line
	9050 5550 9050 5500
Wire Wire Line
	8600 5550 9050 5550
Wire Wire Line
	8600 4700 8600 5550
$Comp
L power:GND #PWR012
U 1 1 60F7D990
P 9150 5650
F 0 "#PWR012" H 9150 5400 50  0001 C CNN
F 1 "GND" H 9155 5477 50  0000 C CNN
F 2 "" H 9150 5650 50  0001 C CNN
F 3 "" H 9150 5650 50  0001 C CNN
	1    9150 5650
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR08
U 1 1 60F7D99A
P 8600 5650
F 0 "#PWR08" H 8600 5400 50  0001 C CNN
F 1 "GNDD" H 8604 5495 50  0000 C CNN
F 2 "" H 8600 5650 50  0001 C CNN
F 3 "" H 8600 5650 50  0001 C CNN
	1    8600 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 5650 9150 5500
Wire Wire Line
	5950 1375 5775 1375
Wire Wire Line
	5950 1775 5775 1775
Wire Wire Line
	7250 3950 7150 3950
Wire Wire Line
	7250 3850 7150 3850
$Comp
L Motor_Control-rescue:CP-Device C1
U 1 1 60BA81F8
P 5200 1575
F 0 "C1" H 5318 1621 50  0000 L CNN
F 1 "100u" H 5318 1530 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 5238 1425 50  0001 C CNN
F 3 "~" H 5200 1575 50  0001 C CNN
	1    5200 1575
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 5100 9550 5100
Connection ~ 5600 1775
Connection ~ 5600 1375
Wire Wire Line
	5400 1825 5400 1775
Connection ~ 5400 1775
Wire Wire Line
	5400 1775 5600 1775
Wire Wire Line
	5400 1325 5400 1375
Connection ~ 5400 1375
Wire Wire Line
	5400 1375 5600 1375
$Comp
L Connector:Barrel_Jack J2
U 1 1 611C8652
P 4800 1575
F 0 "J2" H 4857 1900 50  0000 C CNN
F 1 "Barrel_Jack" H 4857 1809 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Horizontal" H 4850 1535 50  0001 C CNN
F 3 "https://www.cuidevices.com/product/resource/pj-002bh.pdf" H 4850 1535 50  0001 C CNN
	1    4800 1575
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 1475 5100 1375
Wire Wire Line
	5100 1375 5200 1375
Connection ~ 5200 1375
Wire Wire Line
	5100 1675 5100 1775
Wire Wire Line
	5100 1775 5200 1775
Connection ~ 5200 1775
$Comp
L power:+3V3 #PWR01
U 1 1 60BE7BAC
P 5500 2750
F 0 "#PWR01" H 5500 2600 50  0001 C CNN
F 1 "+3V3" H 5515 2923 50  0000 C CNN
F 2 "" H 5500 2750 50  0001 C CNN
F 3 "" H 5500 2750 50  0001 C CNN
	1    5500 2750
	1    0    0    -1  
$EndComp
$Comp
L ESP32-DEVKITC-32D:ESP32-DEVKITC-32D U1
U 1 1 611F93D4
P 6350 4050
F 0 "U1" H 6350 5217 50  0000 C CNN
F 1 "ESP32-DEVKITC-32D" H 6350 5126 50  0000 C CNN
F 2 "MODULE_ESP32-DEVKITC-32D:MODULE_ESP32-DEVKITC-32D" H 6350 4050 50  0001 L BNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Espressif%20PDFs/ESP32-DevKitC_GSG_Ver1.4_2017.pdf" H 6350 4050 50  0001 L BNN
F 4 "Espressif Systems" H 6350 4050 50  0001 L BNN "MANUFACTURER"
F 5 "4" H 6350 4050 50  0001 L BNN "PARTREV"
F 6 "15.98" H 6350 4050 50  0001 C CNN "cost"
F 7 "https://www.digikey.co.nz/product-detail/en/espressif-systems/ESP32-DEVKITC-32D/1965-1000-ND/9356990" H 6350 4050 50  0001 C CNN "link"
F 8 "ESP32-DEVKITC-32D" H 6350 4050 50  0001 C CNN "man part #"
	1    6350 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 3250 7150 3250
Wire Wire Line
	7250 3350 7150 3350
Wire Wire Line
	7150 3150 7200 3150
Wire Wire Line
	7200 3150 7200 3750
Wire Wire Line
	7150 3750 7200 3750
Connection ~ 7200 3750
Wire Wire Line
	7200 3750 7200 5250
$Comp
L power:GNDD #PWR0101
U 1 1 6121E752
P 5500 5250
F 0 "#PWR0101" H 5500 5000 50  0001 C CNN
F 1 "GNDD" H 5504 5095 50  0000 C CNN
F 2 "" H 5500 5250 50  0001 C CNN
F 3 "" H 5500 5250 50  0001 C CNN
	1    5500 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 5250 5500 4450
Wire Wire Line
	5500 4450 5550 4450
Wire Wire Line
	5550 3150 5500 3150
Wire Wire Line
	5500 2750 5500 3150
Wire Wire Line
	7150 4350 7250 4350
Wire Wire Line
	7150 4250 7250 4250
Wire Wire Line
	7150 4150 7250 4150
Text Label 7250 3850 0    50   ~ 0
R_STEP
Text Label 7250 3950 0    50   ~ 0
R_DIR
Text Label 8500 2350 2    50   ~ 0
R_STEP
Text Label 8500 2450 2    50   ~ 0
R_DIR
Text Label 7250 3250 0    50   ~ 0
Z_STEP
Text Label 7250 3350 0    50   ~ 0
Z_DIR
Text Label 8500 4800 2    50   ~ 0
Z_STEP
Text Label 8500 4900 2    50   ~ 0
Z_DIR
Text Label 7250 4350 0    50   ~ 0
PIP_TRIG
Text Label 7250 4250 0    50   ~ 0
Z_LIM
Text Label 7250 4150 0    50   ~ 0
R_LIM
Wire Notes Line
	3725 950  10700 950 
Wire Notes Line
	3725 5950 10700 5950
$Comp
L molex_sherlock_vrthdr_2pin:353620250 J1
U 1 1 6126271A
P 5950 1625
F 0 "J1" H 6200 1375 60  0000 C CNN
F 1 "Power Molex" H 6425 1800 60  0000 C CNN
F 2 "molex_sherlock:molex_sherlock_vrthdr_2pin" H 6350 1565 60  0001 C CNN
F 3 "" H 5950 1625 60  0000 C CNN
	1    5950 1625
	1    0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 611BB4B9
P 5775 1875
F 0 "H2" H 5675 1832 50  0000 R CNN
F 1 "GND" H 5675 1923 50  0000 R CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 5775 1875 50  0001 C CNN
F 3 "~" H 5775 1875 50  0001 C CNN
	1    5775 1875
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 611BAD7F
P 5775 1275
F 0 "H1" H 5875 1324 50  0000 L CNN
F 1 "VDC" H 5875 1233 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 5775 1275 50  0001 C CNN
F 3 "~" H 5775 1275 50  0001 C CNN
	1    5775 1275
	1    0    0    -1  
$EndComp
Connection ~ 5775 1375
Wire Wire Line
	5775 1375 5600 1375
Connection ~ 5775 1775
Wire Wire Line
	5775 1775 5600 1775
Wire Wire Line
	5950 1625 5950 1775
$Comp
L molex_sherlock_vrthdr_2pin:353620250 J3
U 1 1 6128B423
P 4200 2950
F 0 "J3" H 4442 2563 60  0000 C CNN
F 1 "Pipette" H 4442 2669 60  0000 C CNN
F 2 "molex_sherlock:molex_sherlock_vrthdr_2pin" H 4600 2890 60  0001 C CNN
F 3 "" H 4200 2950 60  0000 C CNN
	1    4200 2950
	1    0    0    1   
$EndComp
$Comp
L molex_sherlock_vrthdr_2pin:353620250 J4
U 1 1 6128C0C1
P 4200 3975
F 0 "J4" H 4442 3588 60  0000 C CNN
F 1 "R Home" H 4442 3694 60  0000 C CNN
F 2 "molex_sherlock:molex_sherlock_vrthdr_2pin" H 4600 3915 60  0001 C CNN
F 3 "" H 4200 3975 60  0000 C CNN
	1    4200 3975
	1    0    0    1   
$EndComp
$Comp
L molex_sherlock_vrthdr_2pin:353620250 J5
U 1 1 6128FFA6
P 4200 5050
F 0 "J5" H 4442 4663 60  0000 C CNN
F 1 "Z Home" H 4442 4769 60  0000 C CNN
F 2 "molex_sherlock:molex_sherlock_vrthdr_2pin" H 4600 4990 60  0001 C CNN
F 3 "" H 4200 5050 60  0000 C CNN
	1    4200 5050
	1    0    0    1   
$EndComp
Text Label 4150 4950 2    50   ~ 0
Z_LIM
Text Label 4150 3875 2    50   ~ 0
R_LIM
Wire Wire Line
	5950 1375 5950 1525
Wire Notes Line
	3725 2150 7700 2150
Wire Notes Line
	3725 950  3725 5950
Text Notes 4725 2275 0    50   ~ 0
Connectors\n
Text Label 4150 2850 2    50   ~ 0
PIP_TRIG
$Comp
L power:GNDD #PWR0102
U 1 1 6134080F
P 4150 3000
F 0 "#PWR0102" H 4150 2750 50  0001 C CNN
F 1 "GNDD" H 4154 2845 50  0000 C CNN
F 2 "" H 4150 3000 50  0001 C CNN
F 3 "" H 4150 3000 50  0001 C CNN
	1    4150 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0103
U 1 1 61340F0D
P 4150 4025
F 0 "#PWR0103" H 4150 3775 50  0001 C CNN
F 1 "GNDD" H 4154 3870 50  0000 C CNN
F 2 "" H 4150 4025 50  0001 C CNN
F 3 "" H 4150 4025 50  0001 C CNN
	1    4150 4025
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0104
U 1 1 61341A8F
P 4150 5100
F 0 "#PWR0104" H 4150 4850 50  0001 C CNN
F 1 "GNDD" H 4154 4945 50  0000 C CNN
F 2 "" H 4150 5100 50  0001 C CNN
F 3 "" H 4150 5100 50  0001 C CNN
	1    4150 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 2850 4200 2850
Wire Wire Line
	4200 2950 4150 2950
Wire Wire Line
	4150 2950 4150 3000
Wire Wire Line
	4200 3975 4150 3975
Wire Wire Line
	4150 3975 4150 4025
Wire Wire Line
	4150 3875 4200 3875
Wire Wire Line
	4150 4950 4200 4950
Wire Wire Line
	4200 5050 4150 5050
Wire Wire Line
	4150 5050 4150 5100
$EndSCHEMATC
