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
P 4600 2000
F 0 "#PWR03" H 4600 1750 50  0001 C CNN
F 1 "GND" H 4605 1827 50  0000 C CNN
F 2 "" H 4600 2000 50  0001 C CNN
F 3 "" H 4600 2000 50  0001 C CNN
	1    4600 2000
	1    0    0    -1  
$EndComp
$Comp
L power:+VDC #PWR02
U 1 1 60BA6690
P 4600 1500
F 0 "#PWR02" H 4600 1400 50  0001 C CNN
F 1 "+VDC" H 4600 1750 50  0000 C CNN
F 2 "" H 4600 1500 50  0001 C CNN
F 3 "" H 4600 1500 50  0001 C CNN
	1    4600 1500
	1    0    0    -1  
$EndComp
$Comp
L Motor_Control-rescue:CP-Device C2
U 1 1 60BA7DB3
P 4800 1750
F 0 "C2" H 4918 1796 50  0000 L CNN
F 1 "100u" H 4918 1705 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 4838 1600 50  0001 C CNN
F 3 "~" H 4800 1750 50  0001 C CNN
	1    4800 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 1600 4400 1550
Wire Wire Line
	4400 1550 4600 1550
Wire Wire Line
	4800 1950 4800 1900
Wire Wire Line
	4400 1900 4400 1950
Wire Wire Line
	4400 1950 4600 1950
Wire Notes Line
	6100 1150 6100 6150
Wire Notes Line
	9100 6150 9100 1150
Text Notes 3650 1250 0    50   ~ 0
Motor Supply\n
Text Notes 6150 1250 0    50   ~ 0
Motor Drivers\n
Text Notes 3650 2450 0    50   ~ 0
Controller\n
Wire Wire Line
	8350 4800 8350 4900
Wire Wire Line
	8350 2350 8350 2450
Wire Wire Line
	7450 4000 7450 4300
Wire Wire Line
	7850 4800 8350 4800
Wire Wire Line
	7850 4900 8150 4900
Wire Wire Line
	7850 5100 7950 5100
Wire Wire Line
	7900 5200 7900 5300
Wire Wire Line
	7850 5200 7900 5200
$Comp
L Motor:Stepper_Motor_bipolar M2
U 1 1 60C05853
P 8250 5200
F 0 "M2" H 8200 5000 50  0000 L CNN
F 1 "Z" H 7850 4900 50  0000 L CNN
F 2 "molex_sherlock:molex_sherlock_vrthdr_4pin" H 8260 5190 50  0001 C CNN
F 3 "http://www.infineon.com/dgdl/Application-Note-TLE8110EE_driving_UniPolarStepperMotor_V1.1.pdf?fileId=db3a30431be39b97011be5d0aa0a00b0" H 8260 5190 50  0001 C CNN
	1    8250 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 2350 8350 2350
Wire Wire Line
	7850 2450 8150 2450
Wire Wire Line
	7850 2650 7950 2650
Wire Wire Line
	7850 2750 7900 2750
$Comp
L Motor:Stepper_Motor_bipolar M1
U 1 1 60B988BE
P 8250 2750
F 0 "M1" H 8200 2550 50  0000 L CNN
F 1 "R" H 8200 2450 50  0000 L CNN
F 2 "molex_sherlock:molex_sherlock_vrthdr_4pin" H 8260 2740 50  0001 C CNN
F 3 "http://www.infineon.com/dgdl/Application-Note-TLE8110EE_driving_UniPolarStepperMotor_V1.1.pdf?fileId=db3a30431be39b97011be5d0aa0a00b0" H 8260 2740 50  0001 C CNN
	1    8250 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 2650 7050 2650
Wire Wire Line
	6900 2550 7050 2550
Wire Wire Line
	6900 5100 7050 5100
Wire Wire Line
	6900 5000 7050 5000
Connection ~ 6950 4600
Wire Wire Line
	6950 4600 6950 4500
Connection ~ 6950 4700
Wire Wire Line
	6950 4600 6950 4700
Wire Wire Line
	7050 4600 6950 4600
Connection ~ 6950 5300
Wire Wire Line
	6950 5400 6950 5300
Wire Wire Line
	7050 5400 6950 5400
Wire Wire Line
	6950 4700 7050 4700
Wire Wire Line
	6950 5300 6950 4700
Wire Wire Line
	7050 5300 6950 5300
Wire Wire Line
	7050 4900 7000 4900
$Comp
L power:+3V3 #PWR06
U 1 1 60BC6790
P 6950 4500
F 0 "#PWR06" H 6950 4350 50  0001 C CNN
F 1 "+3V3" H 6965 4673 50  0000 C CNN
F 2 "" H 6950 4500 50  0001 C CNN
F 3 "" H 6950 4500 50  0001 C CNN
	1    6950 4500
	1    0    0    -1  
$EndComp
$Comp
L power:+VDC #PWR010
U 1 1 60BC6786
P 7450 4000
F 0 "#PWR010" H 7450 3900 50  0001 C CNN
F 1 "+VDC" H 7450 4275 50  0000 C CNN
F 2 "" H 7450 4000 50  0001 C CNN
F 3 "" H 7450 4000 50  0001 C CNN
	1    7450 4000
	1    0    0    -1  
$EndComp
NoConn ~ 7050 4500
Wire Wire Line
	7450 1550 7450 1850
Connection ~ 6950 2150
Wire Wire Line
	6950 2150 6950 2050
Connection ~ 6950 2250
Wire Wire Line
	6950 2150 6950 2250
Wire Wire Line
	7050 2150 6950 2150
Connection ~ 6950 2850
Wire Wire Line
	6950 2950 6950 2850
Wire Wire Line
	7050 2950 6950 2950
Wire Wire Line
	6950 2250 7050 2250
Wire Wire Line
	6950 2850 6950 2250
Wire Wire Line
	7050 2850 6950 2850
Connection ~ 7000 3300
Wire Wire Line
	7000 3400 7000 3300
Wire Wire Line
	7450 3300 7450 3250
Wire Wire Line
	7000 3300 7450 3300
Wire Wire Line
	7000 2450 7000 3300
Wire Wire Line
	7050 2450 7000 2450
$Comp
L power:GND #PWR011
U 1 1 60BC3DF9
P 7550 3400
F 0 "#PWR011" H 7550 3150 50  0001 C CNN
F 1 "GND" H 7555 3227 50  0000 C CNN
F 2 "" H 7550 3400 50  0001 C CNN
F 3 "" H 7550 3400 50  0001 C CNN
	1    7550 3400
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR05
U 1 1 60BBC613
P 6950 2050
F 0 "#PWR05" H 6950 1900 50  0001 C CNN
F 1 "+3V3" H 6965 2223 50  0000 C CNN
F 2 "" H 6950 2050 50  0001 C CNN
F 3 "" H 6950 2050 50  0001 C CNN
	1    6950 2050
	1    0    0    -1  
$EndComp
$Comp
L power:+VDC #PWR09
U 1 1 60BBCA80
P 7450 1550
F 0 "#PWR09" H 7450 1450 50  0001 C CNN
F 1 "+VDC" H 7450 1825 50  0000 C CNN
F 2 "" H 7450 1550 50  0001 C CNN
F 3 "" H 7450 1550 50  0001 C CNN
	1    7450 1550
	1    0    0    -1  
$EndComp
NoConn ~ 7050 2050
$Comp
L Driver_Motor:Pololu_Breakout_DRV8825 A1
U 1 1 60BA2527
P 7450 2450
F 0 "A1" H 7450 3231 50  0000 C CNN
F 1 "R Motor Driver" H 7450 3140 50  0000 C CNN
F 2 "Module:Pololu_Breakout-16_15.2x20.3mm" H 7650 1650 50  0001 L CNN
F 3 "https://www.pololu.com/product/2133" H 7550 2150 50  0001 C CNN
	1    7450 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 2750 7900 2850
Wire Wire Line
	7900 2850 7950 2850
$Comp
L power:GNDD #PWR04
U 1 1 60F70744
P 5600 5050
F 0 "#PWR04" H 5600 4800 50  0001 C CNN
F 1 "GNDD" H 5604 4895 50  0000 C CNN
F 2 "" H 5600 5050 50  0001 C CNN
F 3 "" H 5600 5050 50  0001 C CNN
	1    5600 5050
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR07
U 1 1 60F7559F
P 7000 3400
F 0 "#PWR07" H 7000 3150 50  0001 C CNN
F 1 "GNDD" H 7004 3245 50  0000 C CNN
F 2 "" H 7000 3400 50  0001 C CNN
F 3 "" H 7000 3400 50  0001 C CNN
	1    7000 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 3400 7550 3250
Connection ~ 7000 5750
Wire Wire Line
	7000 5850 7000 5750
Wire Wire Line
	7450 5750 7450 5700
Wire Wire Line
	7000 5750 7450 5750
Wire Wire Line
	7000 4900 7000 5750
$Comp
L power:GND #PWR012
U 1 1 60F7D990
P 7550 5850
F 0 "#PWR012" H 7550 5600 50  0001 C CNN
F 1 "GND" H 7555 5677 50  0000 C CNN
F 2 "" H 7550 5850 50  0001 C CNN
F 3 "" H 7550 5850 50  0001 C CNN
	1    7550 5850
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR08
U 1 1 60F7D99A
P 7000 5850
F 0 "#PWR08" H 7000 5600 50  0001 C CNN
F 1 "GNDD" H 7004 5695 50  0000 C CNN
F 2 "" H 7000 5850 50  0001 C CNN
F 3 "" H 7000 5850 50  0001 C CNN
	1    7000 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 5850 7550 5700
Wire Wire Line
	5650 3900 5550 3900
Wire Wire Line
	5650 3800 5550 3800
$Comp
L Motor_Control-rescue:CP-Device C1
U 1 1 60BA81F8
P 4400 1750
F 0 "C1" H 4518 1796 50  0000 L CNN
F 1 "100u" H 4518 1705 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 4438 1600 50  0001 C CNN
F 3 "~" H 4400 1750 50  0001 C CNN
	1    4400 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 5300 7950 5300
Wire Wire Line
	4600 2000 4600 1950
Connection ~ 4600 1950
Wire Wire Line
	4600 1950 4800 1950
Wire Wire Line
	4600 1500 4600 1550
Connection ~ 4600 1550
Wire Wire Line
	4600 1550 4800 1550
$Comp
L Connector:Barrel_Jack J2
U 1 1 611C8652
P 4000 1750
F 0 "J2" H 4057 2075 50  0000 C CNN
F 1 "Barrel_Jack" H 4057 1984 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Horizontal" H 4050 1710 50  0001 C CNN
F 3 "https://www.cuidevices.com/product/resource/pj-002bh.pdf" H 4050 1710 50  0001 C CNN
F 4 "1.18" H 4000 1750 50  0001 C CNN "cost"
F 5 "https://www.digikey.co.nz/en/products/detail/cui-devices/PJ-002BH/408447" H 4000 1750 50  0001 C CNN "link"
F 6 "PJ-002BH" H 4000 1750 50  0001 C CNN "man part #"
	1    4000 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 1650 4300 1550
Wire Wire Line
	4300 1550 4400 1550
Connection ~ 4400 1550
Wire Wire Line
	4300 1850 4300 1950
Wire Wire Line
	4300 1950 4400 1950
Connection ~ 4400 1950
$Comp
L power:+3V3 #PWR01
U 1 1 60BE7BAC
P 3900 2800
F 0 "#PWR01" H 3900 2650 50  0001 C CNN
F 1 "+3V3" H 3915 2973 50  0000 C CNN
F 2 "" H 3900 2800 50  0001 C CNN
F 3 "" H 3900 2800 50  0001 C CNN
	1    3900 2800
	1    0    0    -1  
$EndComp
$Comp
L ESP32-DEVKITC-32D:ESP32-DEVKITC-32D U1
U 1 1 611F93D4
P 4750 4000
F 0 "U1" H 4750 5167 50  0000 C CNN
F 1 "ESP32-DEVKITC-32D" H 4750 5076 50  0000 C CNN
F 2 "MODULE_ESP32-DEVKITC-32D:MODULE_ESP32-DEVKITC-32D" H 4750 4000 50  0001 L BNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Espressif%20PDFs/ESP32-DevKitC_GSG_Ver1.4_2017.pdf" H 4750 4000 50  0001 L BNN
F 4 "Espressif Systems" H 4750 4000 50  0001 L BNN "MANUFACTURER"
F 5 "4" H 4750 4000 50  0001 L BNN "PARTREV"
F 6 "15.98" H 4750 4000 50  0001 C CNN "cost"
F 7 "https://www.digikey.co.nz/product-detail/en/espressif-systems/ESP32-DEVKITC-32D/1965-1000-ND/9356990" H 4750 4000 50  0001 C CNN "link"
F 8 "ESP32-DEVKITC-32D" H 4750 4000 50  0001 C CNN "man part #"
	1    4750 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 3200 5550 3200
Wire Wire Line
	5650 3300 5550 3300
Wire Wire Line
	5550 3100 5600 3100
Wire Wire Line
	5600 3100 5600 3700
Wire Wire Line
	5550 3700 5600 3700
Connection ~ 5600 3700
Wire Wire Line
	5600 3700 5600 5050
$Comp
L power:GNDD #PWR0101
U 1 1 6121E752
P 3900 5050
F 0 "#PWR0101" H 3900 4800 50  0001 C CNN
F 1 "GNDD" H 3904 4895 50  0000 C CNN
F 2 "" H 3900 5050 50  0001 C CNN
F 3 "" H 3900 5050 50  0001 C CNN
	1    3900 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 4400 3950 4400
Wire Wire Line
	3950 3100 3900 3100
Wire Wire Line
	5550 4300 5650 4300
Wire Wire Line
	5550 4200 5650 4200
Wire Wire Line
	5550 4100 5650 4100
Text Label 5650 3900 0    50   ~ 0
R_STEP
Text Label 5650 3800 0    50   ~ 0
R_DIR
Text Label 6900 2550 2    50   ~ 0
R_STEP
Text Label 6900 2650 2    50   ~ 0
R_DIR
Text Label 5650 3300 0    50   ~ 0
Z_STEP
Text Label 5650 3200 0    50   ~ 0
Z_DIR
Text Label 6900 5000 2    50   ~ 0
Z_STEP
Text Label 6900 5100 2    50   ~ 0
Z_DIR
Text Label 5650 4300 0    50   ~ 0
PIP_TRIG
Text Label 5650 4200 0    50   ~ 0
Z_LIM
Text Label 5650 4100 0    50   ~ 0
R_LIM
Wire Notes Line
	2100 1150 9100 1150
Wire Notes Line
	2100 6150 9100 6150
$Comp
L molex_sherlock_vrthdr_2pin:353620250 J1
U 1 1 6126271A
P 5150 1800
F 0 "J1" H 5400 1550 60  0000 C CNN
F 1 "- Power +" H 5625 1975 60  0000 C CNN
F 2 "molex_sherlock:molex_sherlock_vrthdr_2pin" H 5550 1740 60  0001 C CNN
F 3 "" H 5150 1800 60  0000 C CNN
	1    5150 1800
	1    0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 611BB4B9
P 5000 2100
F 0 "H2" H 4900 2057 50  0000 R CNN
F 1 "GND" H 5000 2275 50  0000 C CNN
F 2 "MountingHole:MountingHole_3.7mm_Pad_Via" H 5000 2100 50  0001 C CNN
F 3 "~" H 5000 2100 50  0001 C CNN
	1    5000 2100
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 611BAD7F
P 5000 1400
F 0 "H1" H 5100 1449 50  0000 L CNN
F 1 "+VDC" H 5000 1575 50  0000 C CNN
F 2 "MountingHole:MountingHole_3.7mm_Pad_Via" H 5000 1400 50  0001 C CNN
F 3 "~" H 5000 1400 50  0001 C CNN
	1    5000 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 1800 5150 1950
$Comp
L molex_sherlock_vrthdr_2pin:353620250 J3
U 1 1 6128B423
P 2700 3100
F 0 "J3" H 2942 2713 60  0000 C CNN
F 1 "Pipette" H 2942 2819 60  0000 C CNN
F 2 "molex_sherlock:molex_sherlock_vrthdr_2pin" H 3100 3040 60  0001 C CNN
F 3 "" H 2700 3100 60  0000 C CNN
	1    2700 3100
	1    0    0    1   
$EndComp
$Comp
L molex_sherlock_vrthdr_2pin:353620250 J4
U 1 1 6128C0C1
P 2700 3825
F 0 "J4" H 2942 3438 60  0000 C CNN
F 1 "R Home" H 2942 3544 60  0000 C CNN
F 2 "molex_sherlock:molex_sherlock_vrthdr_2pin" H 3100 3765 60  0001 C CNN
F 3 "" H 2700 3825 60  0000 C CNN
	1    2700 3825
	1    0    0    1   
$EndComp
$Comp
L molex_sherlock_vrthdr_2pin:353620250 J5
U 1 1 6128FFA6
P 2700 4650
F 0 "J5" H 2942 4263 60  0000 C CNN
F 1 "Z Home" H 2942 4369 60  0000 C CNN
F 2 "molex_sherlock:molex_sherlock_vrthdr_2pin" H 3100 4590 60  0001 C CNN
F 3 "" H 2700 4650 60  0000 C CNN
	1    2700 4650
	1    0    0    1   
$EndComp
Text Label 2650 4550 2    50   ~ 0
Z_LIM
Text Label 2650 3725 2    50   ~ 0
R_LIM
Wire Wire Line
	5150 1550 5150 1700
Wire Notes Line
	2125 2350 6100 2350
Wire Notes Line
	2100 1150 2100 6150
Text Notes 2150 2450 0    50   ~ 0
Connectors\n
Text Label 2650 3000 2    50   ~ 0
PIP_TRIG
$Comp
L power:GNDD #PWR0102
U 1 1 6134080F
P 2650 3150
F 0 "#PWR0102" H 2650 2900 50  0001 C CNN
F 1 "GNDD" H 2654 2995 50  0000 C CNN
F 2 "" H 2650 3150 50  0001 C CNN
F 3 "" H 2650 3150 50  0001 C CNN
	1    2650 3150
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0103
U 1 1 61340F0D
P 2650 3875
F 0 "#PWR0103" H 2650 3625 50  0001 C CNN
F 1 "GNDD" H 2654 3720 50  0000 C CNN
F 2 "" H 2650 3875 50  0001 C CNN
F 3 "" H 2650 3875 50  0001 C CNN
	1    2650 3875
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0104
U 1 1 61341A8F
P 2650 4700
F 0 "#PWR0104" H 2650 4450 50  0001 C CNN
F 1 "GNDD" H 2654 4545 50  0000 C CNN
F 2 "" H 2650 4700 50  0001 C CNN
F 3 "" H 2650 4700 50  0001 C CNN
	1    2650 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 3000 2700 3000
Wire Wire Line
	2700 3100 2650 3100
Wire Wire Line
	2650 3100 2650 3150
Wire Wire Line
	2700 3825 2650 3825
Wire Wire Line
	2650 3825 2650 3875
Wire Wire Line
	2650 3725 2700 3725
Wire Wire Line
	2650 4550 2700 4550
Wire Wire Line
	2700 4650 2650 4650
Wire Wire Line
	2650 4650 2650 4700
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J6
U 1 1 61226BF5
P 2850 5500
F 0 "J6" H 2900 5917 50  0000 C CNN
F 1 "EXP" H 2900 5826 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 2850 5500 50  0001 C CNN
F 3 "~" H 2850 5500 50  0001 C CNN
	1    2850 5500
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0105
U 1 1 61227C6F
P 2600 5250
F 0 "#PWR0105" H 2600 5100 50  0001 C CNN
F 1 "+3V3" H 2615 5423 50  0000 C CNN
F 2 "" H 2600 5250 50  0001 C CNN
F 3 "" H 2600 5250 50  0001 C CNN
	1    2600 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0106
U 1 1 6122C2DE
P 3200 5750
F 0 "#PWR0106" H 3200 5500 50  0001 C CNN
F 1 "GNDD" H 3204 5595 50  0000 C CNN
F 2 "" H 3200 5750 50  0001 C CNN
F 3 "" H 3200 5750 50  0001 C CNN
	1    3200 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 5300 2600 5300
Wire Wire Line
	2600 5300 2600 5250
Wire Wire Line
	3950 3700 3850 3700
Wire Wire Line
	3950 3800 3850 3800
Wire Wire Line
	3950 3900 3850 3900
Wire Wire Line
	3950 4000 3850 4000
Wire Wire Line
	3950 4100 3850 4100
Wire Wire Line
	3950 4200 3850 4200
Wire Wire Line
	3950 4300 3850 4300
Wire Wire Line
	3950 4500 3850 4500
Text Label 3850 3700 2    50   ~ 0
IO32
Text Label 3850 3800 2    50   ~ 0
IO33
Text Label 3850 3900 2    50   ~ 0
IO25
Text Label 3850 4000 2    50   ~ 0
IO26
Text Label 3850 4100 2    50   ~ 0
IO27
Text Label 3850 4200 2    50   ~ 0
IO14
Text Label 3850 4300 2    50   ~ 0
IO12
Text Label 3850 4500 2    50   ~ 0
IO13
Wire Wire Line
	3150 5400 3250 5400
Wire Wire Line
	3150 5500 3250 5500
Wire Wire Line
	3150 5600 3250 5600
Wire Wire Line
	2550 5400 2650 5400
Wire Wire Line
	2550 5500 2650 5500
Wire Wire Line
	2550 5600 2650 5600
Wire Wire Line
	2550 5700 2650 5700
Wire Wire Line
	3200 5300 3150 5300
Wire Wire Line
	3200 5300 3200 5750
Wire Wire Line
	3150 5700 3250 5700
Text Label 2550 5400 2    50   ~ 0
IO12
Text Label 2550 5500 2    50   ~ 0
IO13
Text Label 2550 5600 2    50   ~ 0
IO14
Text Label 2550 5700 2    50   ~ 0
IO25
Text Label 3250 5500 0    50   ~ 0
IO27
Text Label 3250 5400 0    50   ~ 0
IO26
Text Label 3250 5600 0    50   ~ 0
IO32
Text Label 3250 5700 0    50   ~ 0
IO33
NoConn ~ 3950 3200
NoConn ~ 3950 3300
NoConn ~ 3950 3400
NoConn ~ 3950 3500
NoConn ~ 3950 3600
NoConn ~ 3950 4600
NoConn ~ 3950 4700
NoConn ~ 3950 4800
NoConn ~ 3950 4900
NoConn ~ 5550 4900
NoConn ~ 5550 4800
NoConn ~ 5550 4700
NoConn ~ 5550 4600
NoConn ~ 5550 4500
NoConn ~ 5550 4400
NoConn ~ 5550 4000
NoConn ~ 5550 3600
NoConn ~ 5550 3500
NoConn ~ 5550 3400
Wire Notes Line
	3600 1150 3600 6150
$Comp
L Mechanical:MountingHole_Pad H5
U 1 1 6123F662
P 3000 1650
F 0 "H5" H 3100 1653 50  0000 L CNN
F 1 "??M3" H 3100 1608 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 3000 1650 50  0001 C CNN
F 3 "~" H 3000 1650 50  0001 C CNN
	1    3000 1650
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H4
U 1 1 6124CE50
P 2700 1650
F 0 "H4" H 2800 1653 50  0000 L CNN
F 1 "??M3" H 2800 1608 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 2700 1650 50  0001 C CNN
F 3 "~" H 2700 1650 50  0001 C CNN
	1    2700 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 1750 2400 1800
Wire Wire Line
	2400 1800 2700 1800
Wire Wire Line
	3000 1750 3000 1800
Wire Wire Line
	2700 1750 2700 1800
Connection ~ 2700 1800
Wire Wire Line
	2700 1800 2850 1800
$Comp
L power:GND #PWR0107
U 1 1 61266B03
P 2850 1900
F 0 "#PWR0107" H 2850 1650 50  0001 C CNN
F 1 "GND" H 2855 1727 50  0000 C CNN
F 2 "" H 2850 1900 50  0001 C CNN
F 3 "" H 2850 1900 50  0001 C CNN
	1    2850 1900
	1    0    0    -1  
$EndComp
Connection ~ 2850 1800
Wire Wire Line
	2850 1800 3000 1800
Wire Wire Line
	2850 1800 2850 1900
$Comp
L Mechanical:MountingHole_Pad H6
U 1 1 61248704
P 3300 1650
F 0 "H6" H 3400 1653 50  0000 L CNN
F 1 "??M3" H 3400 1608 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 3300 1650 50  0001 C CNN
F 3 "~" H 3300 1650 50  0001 C CNN
	1    3300 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 1800 3300 1800
Wire Wire Line
	3300 1800 3300 1750
Connection ~ 3000 1800
Text Notes 2150 1250 0    50   ~ 0
Mounting\n
Wire Wire Line
	4800 1550 4800 1600
$Comp
L Mechanical:MountingHole_Pad H3
U 1 1 6123F6D5
P 2400 1650
F 0 "H3" H 2500 1650 50  0000 L CNN
F 1 "??M3" H 2500 1608 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 2400 1650 50  0001 C CNN
F 3 "~" H 2400 1650 50  0001 C CNN
	1    2400 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 2800 3900 3100
Wire Wire Line
	3900 5050 3900 4400
$Comp
L Connector:TestPoint_Small TP1
U 1 1 61332EC4
P 4050 5650
F 0 "TP1" H 4098 5650 50  0000 L CNN
F 1 "Z_STEP" H 4098 5605 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 4250 5650 50  0001 C CNN
F 3 "~" H 4250 5650 50  0001 C CNN
	1    4050 5650
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Small TP2
U 1 1 6133804E
P 4300 5650
F 0 "TP2" H 4348 5650 50  0000 L CNN
F 1 "Z_DIR" H 4348 5605 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 4500 5650 50  0001 C CNN
F 3 "~" H 4500 5650 50  0001 C CNN
	1    4300 5650
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Small TP3
U 1 1 61338062
P 4550 5650
F 0 "TP3" H 4598 5650 50  0000 L CNN
F 1 "R_STEP" H 4598 5605 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 4750 5650 50  0001 C CNN
F 3 "~" H 4750 5650 50  0001 C CNN
	1    4550 5650
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Small TP4
U 1 1 6133D860
P 4800 5650
F 0 "TP4" H 4848 5650 50  0000 L CNN
F 1 "R_DIR" H 4848 5605 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 5000 5650 50  0001 C CNN
F 3 "~" H 5000 5650 50  0001 C CNN
	1    4800 5650
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Small TP5
U 1 1 61342E8E
P 5050 5650
F 0 "TP5" H 5098 5650 50  0000 L CNN
F 1 "PIP_TRIG" H 5098 5605 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 5250 5650 50  0001 C CNN
F 3 "~" H 5250 5650 50  0001 C CNN
	1    5050 5650
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Small TP6
U 1 1 61342E98
P 5300 5650
F 0 "TP6" H 5348 5650 50  0000 L CNN
F 1 "Z_LIM" H 5348 5605 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 5500 5650 50  0001 C CNN
F 3 "~" H 5500 5650 50  0001 C CNN
	1    5300 5650
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Small TP7
U 1 1 61342EA2
P 5550 5650
F 0 "TP7" H 5598 5650 50  0000 L CNN
F 1 "R_LIM" H 5598 5605 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 5750 5650 50  0001 C CNN
F 3 "~" H 5750 5650 50  0001 C CNN
	1    5550 5650
	1    0    0    -1  
$EndComp
Text Label 4050 5750 3    50   ~ 0
Z_STEP
Text Label 4300 5750 3    50   ~ 0
Z_DIR
Text Label 4550 5750 3    50   ~ 0
R_STEP
Text Label 4800 5750 3    50   ~ 0
R_DIR
Text Label 5050 5750 3    50   ~ 0
PIP_TRIG
Text Label 5300 5750 3    50   ~ 0
Z_LIM
Text Label 5550 5750 3    50   ~ 0
R_LIM
Wire Wire Line
	4050 5650 4050 5750
Wire Wire Line
	4300 5650 4300 5750
Wire Wire Line
	4550 5650 4550 5750
Wire Wire Line
	4800 5650 4800 5750
Wire Wire Line
	5050 5650 5050 5750
Wire Wire Line
	5300 5650 5300 5750
Wire Wire Line
	5550 5650 5550 5750
Wire Notes Line
	3600 5450 6100 5450
Wire Wire Line
	4800 1550 5000 1550
Wire Wire Line
	5000 1550 5000 1500
Connection ~ 4800 1550
Wire Wire Line
	5000 1550 5150 1550
Connection ~ 5000 1550
Wire Wire Line
	4800 1950 5000 1950
Wire Wire Line
	5000 1950 5000 2000
Connection ~ 4800 1950
Wire Wire Line
	5000 1950 5150 1950
Connection ~ 5000 1950
Text Notes 3650 5550 0    50   ~ 0
Test Points\n
$Comp
L Driver_Motor:Pololu_Breakout_DRV8825 A2
U 1 1 60BC6775
P 7450 4900
F 0 "A2" H 7450 5681 50  0000 C CNN
F 1 "Z Motor Driver" H 7450 5590 50  0000 C CNN
F 2 "Module:Pololu_Breakout-16_15.2x20.3mm" H 7650 4100 50  0001 L CNN
F 3 "https://www.pololu.com/product/2133" H 7550 4600 50  0001 C CNN
	1    7450 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 2950 6950 3050
Wire Wire Line
	6950 3050 7050 3050
Connection ~ 6950 2950
Wire Wire Line
	6950 5400 6950 5500
Wire Wire Line
	6950 5500 7050 5500
Connection ~ 6950 5400
$EndSCHEMATC
