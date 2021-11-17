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
L Connector:Barrel_Jack J102
U 1 1 61847D2D
P 3600 3575
F 0 "J102" H 3657 3900 50  0000 C CNN
F 1 "Barrel_Jack" H 3657 3809 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Horizontal" H 3650 3535 50  0001 C CNN
F 3 "~" H 3650 3535 50  0001 C CNN
	1    3600 3575
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 618516FD
P 3900 3725
F 0 "#PWR0105" H 3900 3475 50  0001 C CNN
F 1 "GND" H 3905 3552 50  0000 C CNN
F 2 "" H 3900 3725 50  0001 C CNN
F 3 "" H 3900 3725 50  0001 C CNN
	1    3900 3725
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 3475 3900 3450
Wire Wire Line
	3900 3675 3900 3700
$Comp
L Device:LED D104
U 1 1 618EA881
P 5900 4225
AR Path="/618EA881" Ref="D104"  Part="1" 
AR Path="/618B7602/618EA881" Ref="D?"  Part="1" 
F 0 "D104" V 5847 4305 50  0000 L CNN
F 1 "LED" V 5938 4305 50  0000 L CNN
F 2 "LED_THT:LED_D3.0mm_Clear" H 5900 4225 50  0001 C CNN
F 3 "~" H 5900 4225 50  0001 C CNN
	1    5900 4225
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 618EA88D
P 6050 4775
AR Path="/618EA88D" Ref="#PWR0101"  Part="1" 
AR Path="/618B7602/618EA88D" Ref="#PWR?"  Part="1" 
F 0 "#PWR0101" H 6050 4525 50  0001 C CNN
F 1 "GND" H 6055 4602 50  0000 C CNN
F 2 "" H 6050 4775 50  0001 C CNN
F 3 "" H 6050 4775 50  0001 C CNN
	1    6050 4775
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D105
U 1 1 618EA894
P 6200 4225
AR Path="/618EA894" Ref="D105"  Part="1" 
AR Path="/618B7602/618EA894" Ref="D?"  Part="1" 
F 0 "D105" V 6147 4305 50  0000 L CNN
F 1 "LED" V 6238 4305 50  0000 L CNN
F 2 "LED_THT:LED_D3.0mm_Clear" H 6200 4225 50  0001 C CNN
F 3 "~" H 6200 4225 50  0001 C CNN
	1    6200 4225
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5900 4725 5900 4750
Wire Wire Line
	5900 4750 6050 4750
Wire Wire Line
	6200 4750 6200 4725
Wire Wire Line
	6050 4750 6050 4775
Connection ~ 6050 4750
Wire Wire Line
	6050 4750 6200 4750
Wire Wire Line
	5900 4075 5900 4050
Wire Wire Line
	6200 4050 6200 4075
$Comp
L Device:LED D103
U 1 1 618EA8A9
P 5600 4225
AR Path="/618EA8A9" Ref="D103"  Part="1" 
AR Path="/618B7602/618EA8A9" Ref="D?"  Part="1" 
F 0 "D103" V 5547 4305 50  0000 L CNN
F 1 "LED" V 5638 4305 50  0000 L CNN
F 2 "LED_THT:LED_D3.0mm_Clear" H 5600 4225 50  0001 C CNN
F 3 "~" H 5600 4225 50  0001 C CNN
	1    5600 4225
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5600 4725 5600 4750
Wire Wire Line
	5600 4075 5600 4050
Connection ~ 5900 4050
Connection ~ 5900 4750
Wire Wire Line
	5600 4050 5900 4050
Wire Wire Line
	5600 4750 5900 4750
$Comp
L Device:LED D102
U 1 1 618EA8BC
P 5300 4225
AR Path="/618EA8BC" Ref="D102"  Part="1" 
AR Path="/618B7602/618EA8BC" Ref="D?"  Part="1" 
F 0 "D102" V 5247 4305 50  0000 L CNN
F 1 "LED" V 5338 4305 50  0000 L CNN
F 2 "LED_THT:LED_D3.0mm_Clear" H 5300 4225 50  0001 C CNN
F 3 "~" H 5300 4225 50  0001 C CNN
	1    5300 4225
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5300 4725 5300 4750
Wire Wire Line
	5300 4075 5300 4050
Wire Wire Line
	5300 4050 5600 4050
Wire Wire Line
	5300 4750 5600 4750
Connection ~ 5600 4050
Connection ~ 5600 4750
$Comp
L Device:LED D101
U 1 1 618EA8CF
P 5000 4225
AR Path="/618EA8CF" Ref="D101"  Part="1" 
AR Path="/618B7602/618EA8CF" Ref="D?"  Part="1" 
F 0 "D101" V 4947 4305 50  0000 L CNN
F 1 "LED" V 5038 4305 50  0000 L CNN
F 2 "LED_THT:LED_D3.0mm_Clear" H 5000 4225 50  0001 C CNN
F 3 "~" H 5000 4225 50  0001 C CNN
	1    5000 4225
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5000 4725 5000 4750
Wire Wire Line
	5000 4075 5000 4050
Wire Wire Line
	5000 4050 5300 4050
Wire Wire Line
	5000 4750 5300 4750
$Comp
L Device:LED D106
U 1 1 618EA8E0
P 6500 4225
AR Path="/618EA8E0" Ref="D106"  Part="1" 
AR Path="/618B7602/618EA8E0" Ref="D?"  Part="1" 
F 0 "D106" V 6447 4305 50  0000 L CNN
F 1 "LED" V 6538 4305 50  0000 L CNN
F 2 "LED_THT:LED_D3.0mm_Clear" H 6500 4225 50  0001 C CNN
F 3 "~" H 6500 4225 50  0001 C CNN
	1    6500 4225
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6500 4750 6500 4725
Wire Wire Line
	6500 4050 6500 4075
Wire Wire Line
	6200 4050 6500 4050
Wire Wire Line
	6200 4750 6500 4750
$Comp
L Device:LED D107
U 1 1 618EA8F1
P 6800 4225
AR Path="/618EA8F1" Ref="D107"  Part="1" 
AR Path="/618B7602/618EA8F1" Ref="D?"  Part="1" 
F 0 "D107" V 6747 4305 50  0000 L CNN
F 1 "LED" V 6838 4305 50  0000 L CNN
F 2 "LED_THT:LED_D3.0mm_Clear" H 6800 4225 50  0001 C CNN
F 3 "~" H 6800 4225 50  0001 C CNN
	1    6800 4225
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6800 4750 6800 4725
Wire Wire Line
	6800 4050 6800 4075
Wire Wire Line
	6500 4050 6800 4050
Wire Wire Line
	6500 4750 6800 4750
$Comp
L Device:LED D108
U 1 1 618EA902
P 7100 4225
AR Path="/618EA902" Ref="D108"  Part="1" 
AR Path="/618B7602/618EA902" Ref="D?"  Part="1" 
F 0 "D108" V 7047 4305 50  0000 L CNN
F 1 "LED" V 7138 4305 50  0000 L CNN
F 2 "LED_THT:LED_D3.0mm_Clear" H 7100 4225 50  0001 C CNN
F 3 "~" H 7100 4225 50  0001 C CNN
	1    7100 4225
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7100 4750 7100 4725
Wire Wire Line
	7100 4050 7100 4075
Wire Wire Line
	6800 4050 7100 4050
Wire Wire Line
	6800 4750 7100 4750
Connection ~ 5300 4050
Connection ~ 5300 4750
Connection ~ 6500 4750
Connection ~ 6200 4750
Connection ~ 6800 4750
Connection ~ 6800 4050
Connection ~ 6500 4050
Connection ~ 6200 4050
$Comp
L Mechanical:MountingHole H102
U 1 1 618EA91B
P 7450 4375
AR Path="/618EA91B" Ref="H102"  Part="1" 
AR Path="/618B7602/618EA91B" Ref="H?"  Part="1" 
F 0 "H102" H 7550 4421 50  0000 L CNN
F 1 "MountingHole" H 7550 4330 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 7450 4375 50  0001 C CNN
F 3 "~" H 7450 4375 50  0001 C CNN
	1    7450 4375
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H103
U 1 1 618EA921
P 7450 4550
AR Path="/618EA921" Ref="H103"  Part="1" 
AR Path="/618B7602/618EA921" Ref="H?"  Part="1" 
F 0 "H103" H 7550 4596 50  0000 L CNN
F 1 "MountingHole" H 7550 4505 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 7450 4550 50  0001 C CNN
F 3 "~" H 7450 4550 50  0001 C CNN
	1    7450 4550
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H101
U 1 1 618EA927
P 7450 4200
AR Path="/618EA927" Ref="H101"  Part="1" 
AR Path="/618B7602/618EA927" Ref="H?"  Part="1" 
F 0 "H101" H 7550 4246 50  0000 L CNN
F 1 "MountingHole" H 7550 4155 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 7450 4200 50  0001 C CNN
F 3 "~" H 7450 4200 50  0001 C CNN
	1    7450 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 4050 6200 4050
$Comp
L Device:C_Small C101
U 1 1 6190AD50
P 4000 3575
F 0 "C101" H 3700 3625 50  0000 L CNN
F 1 "100u" H 3700 3550 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 4038 3425 50  0001 C CNN
F 3 "~" H 4000 3575 50  0001 C CNN
	1    4000 3575
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_POT R102
U 1 1 61905841
P 3575 4350
F 0 "R102" V 3475 4350 50  0000 C CNN
F 1 "10k" V 3400 4350 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Alps_RK09L_Single_Vertical" V 3505 4350 50  0001 C CNN
F 3 "~" H 3575 4350 50  0001 C CNN
	1    3575 4350
	0    -1   1    0   
$EndComp
$Comp
L Device:Q_NMOS_GDS Q101
U 1 1 619223C7
P 4900 3775
F 0 "Q101" H 5104 3821 50  0000 L CNN
F 1 "Q_NMOS_GDS" H 5104 3730 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 5100 3875 50  0001 C CNN
F 3 "~" H 4900 3775 50  0001 C CNN
	1    4900 3775
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 3975 5000 4050
Wire Wire Line
	5000 3575 5000 3375
$Comp
L Device:R R101
U 1 1 61936482
P 4700 3575
F 0 "R101" H 4770 3621 50  0000 L CNN
F 1 "10k" H 4770 3530 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4630 3575 50  0001 C CNN
F 3 "~" H 4700 3575 50  0001 C CNN
	1    4700 3575
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 4375 7100 4425
Wire Wire Line
	6800 4375 6800 4425
Wire Wire Line
	6500 4375 6500 4425
Wire Wire Line
	6200 4375 6200 4425
Wire Wire Line
	5900 4375 5900 4425
Wire Wire Line
	5600 4375 5600 4425
Wire Wire Line
	5300 4375 5300 4425
Wire Wire Line
	5000 4375 5000 4425
$Comp
L Device:R R110
U 1 1 618EA908
P 7100 4575
AR Path="/618EA908" Ref="R110"  Part="1" 
AR Path="/618B7602/618EA908" Ref="R?"  Part="1" 
F 0 "R110" H 7170 4621 50  0000 L CNN
F 1 "100" H 7170 4530 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 7030 4575 50  0001 C CNN
F 3 "~" H 7100 4575 50  0001 C CNN
	1    7100 4575
	-1   0    0    1   
$EndComp
$Comp
L Device:R R109
U 1 1 618EA8F7
P 6800 4575
AR Path="/618EA8F7" Ref="R109"  Part="1" 
AR Path="/618B7602/618EA8F7" Ref="R?"  Part="1" 
F 0 "R109" H 6870 4621 50  0000 L CNN
F 1 "100" H 6870 4530 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 6730 4575 50  0001 C CNN
F 3 "~" H 6800 4575 50  0001 C CNN
	1    6800 4575
	-1   0    0    1   
$EndComp
$Comp
L Device:R R108
U 1 1 618EA8E6
P 6500 4575
AR Path="/618EA8E6" Ref="R108"  Part="1" 
AR Path="/618B7602/618EA8E6" Ref="R?"  Part="1" 
F 0 "R108" H 6570 4621 50  0000 L CNN
F 1 "100" H 6570 4530 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 6430 4575 50  0001 C CNN
F 3 "~" H 6500 4575 50  0001 C CNN
	1    6500 4575
	-1   0    0    1   
$EndComp
$Comp
L Device:R R103
U 1 1 618EA8D5
P 5000 4575
AR Path="/618EA8D5" Ref="R103"  Part="1" 
AR Path="/618B7602/618EA8D5" Ref="R?"  Part="1" 
F 0 "R103" H 5070 4621 50  0000 L CNN
F 1 "100" H 5070 4530 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4930 4575 50  0001 C CNN
F 3 "~" H 5000 4575 50  0001 C CNN
	1    5000 4575
	-1   0    0    1   
$EndComp
$Comp
L Device:R R104
U 1 1 618EA8C2
P 5300 4575
AR Path="/618EA8C2" Ref="R104"  Part="1" 
AR Path="/618B7602/618EA8C2" Ref="R?"  Part="1" 
F 0 "R104" H 5370 4621 50  0000 L CNN
F 1 "100" H 5370 4530 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5230 4575 50  0001 C CNN
F 3 "~" H 5300 4575 50  0001 C CNN
	1    5300 4575
	-1   0    0    1   
$EndComp
$Comp
L Device:R R105
U 1 1 618EA8AF
P 5600 4575
AR Path="/618EA8AF" Ref="R105"  Part="1" 
AR Path="/618B7602/618EA8AF" Ref="R?"  Part="1" 
F 0 "R105" H 5670 4621 50  0000 L CNN
F 1 "100" H 5670 4530 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5530 4575 50  0001 C CNN
F 3 "~" H 5600 4575 50  0001 C CNN
	1    5600 4575
	-1   0    0    1   
$EndComp
$Comp
L Device:R R107
U 1 1 618EA89A
P 6200 4575
AR Path="/618EA89A" Ref="R107"  Part="1" 
AR Path="/618B7602/618EA89A" Ref="R?"  Part="1" 
F 0 "R107" H 6270 4621 50  0000 L CNN
F 1 "100" H 6270 4530 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 6130 4575 50  0001 C CNN
F 3 "~" H 6200 4575 50  0001 C CNN
	1    6200 4575
	-1   0    0    1   
$EndComp
$Comp
L Device:R R106
U 1 1 618EA887
P 5900 4575
AR Path="/618EA887" Ref="R106"  Part="1" 
AR Path="/618B7602/618EA887" Ref="R?"  Part="1" 
F 0 "R106" H 5970 4621 50  0000 L CNN
F 1 "100" H 5970 4530 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5830 4575 50  0001 C CNN
F 3 "~" H 5900 4575 50  0001 C CNN
	1    5900 4575
	-1   0    0    1   
$EndComp
Wire Wire Line
	5000 3375 4700 3375
Wire Wire Line
	4700 3375 4700 3425
Connection ~ 5000 3375
Wire Wire Line
	5000 3375 5000 3275
Wire Wire Line
	4700 3775 4700 3725
Wire Wire Line
	4700 3775 4375 3775
Connection ~ 4700 3775
Text Label 4375 3775 0    50   ~ 0
ENABLE
$Comp
L power:VDD #PWR0103
U 1 1 6196C88D
P 3900 3425
F 0 "#PWR0103" H 3900 3275 50  0001 C CNN
F 1 "VDD" H 3915 3598 50  0000 C CNN
F 2 "" H 3900 3425 50  0001 C CNN
F 3 "" H 3900 3425 50  0001 C CNN
	1    3900 3425
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J101
U 1 1 619FF879
P 5625 3575
F 0 "J101" H 5543 3250 50  0000 C CNN
F 1 "CTRL_V_LED" H 5543 3341 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2_1x02_P5.00mm_Horizontal" H 5625 3575 50  0001 C CNN
F 3 "~" H 5625 3575 50  0001 C CNN
	1    5625 3575
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J103
U 1 1 61A000ED
P 6250 3575
F 0 "J103" H 6168 3250 50  0000 C CNN
F 1 "RING_V_LED" H 6168 3341 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2_1x02_P5.00mm_Horizontal" H 6250 3575 50  0001 C CNN
F 3 "~" H 6250 3575 50  0001 C CNN
	1    6250 3575
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 61A121F5
P 5825 3650
F 0 "#PWR0104" H 5825 3400 50  0001 C CNN
F 1 "GND" H 5830 3477 50  0000 C CNN
F 2 "" H 5825 3650 50  0001 C CNN
F 3 "" H 5825 3650 50  0001 C CNN
	1    5825 3650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 61A171B5
P 6450 3650
F 0 "#PWR0106" H 6450 3400 50  0001 C CNN
F 1 "GND" H 6455 3477 50  0000 C CNN
F 2 "" H 6450 3650 50  0001 C CNN
F 3 "" H 6450 3650 50  0001 C CNN
	1    6450 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5825 3575 5825 3650
Wire Wire Line
	6450 3575 6450 3650
Text Label 5875 3475 0    50   ~ 0
V_LED
Text Label 6500 3475 0    50   ~ 0
V_LED
Wire Wire Line
	5825 3475 5875 3475
Wire Wire Line
	6450 3475 6500 3475
$Comp
L Connector_Generic:Conn_01x02 J104
U 1 1 61A480DF
P 6825 3575
F 0 "J104" H 6743 3250 50  0000 C CNN
F 1 "ENABLE" H 6743 3341 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 6825 3575 50  0001 C CNN
F 3 "~" H 6825 3575 50  0001 C CNN
	1    6825 3575
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 61A480E9
P 7025 3650
F 0 "#PWR0107" H 7025 3400 50  0001 C CNN
F 1 "GND" H 7030 3477 50  0000 C CNN
F 2 "" H 7025 3650 50  0001 C CNN
F 3 "" H 7025 3650 50  0001 C CNN
	1    7025 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7025 3575 7025 3650
Text Label 7075 3475 0    50   ~ 0
ENABLE
Wire Wire Line
	7025 3475 7075 3475
Text Label 5000 3275 2    50   ~ 0
V_LED
Connection ~ 5000 4050
Wire Wire Line
	4000 3450 3900 3450
Connection ~ 3900 3450
Wire Wire Line
	3900 3450 3900 3425
Wire Wire Line
	4000 3475 4000 3450
Wire Wire Line
	4000 3675 4000 3700
Wire Wire Line
	4000 3700 3900 3700
Connection ~ 3900 3700
Wire Wire Line
	3900 3700 3900 3725
Wire Wire Line
	3575 4500 3575 4550
Text Label 3575 4550 3    50   ~ 0
V_LED
$Comp
L power:VDD #PWR0102
U 1 1 61930929
P 3425 4250
F 0 "#PWR0102" H 3425 4100 50  0001 C CNN
F 1 "VDD" H 3440 4423 50  0000 C CNN
F 2 "" H 3425 4250 50  0001 C CNN
F 3 "" H 3425 4250 50  0001 C CNN
	1    3425 4250
	1    0    0    -1  
$EndComp
NoConn ~ 3725 4350
Text Label 7100 4050 0    50   ~ 0
LED_BUS
Wire Wire Line
	3425 4250 3425 4350
$EndSCHEMATC