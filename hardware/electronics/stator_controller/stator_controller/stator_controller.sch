EESchema Schematic File Version 4
EELAYER 26 0
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
L MCU_Module:Arduino_UNO_R2 A1
U 1 1 5F1757BC
P 6250 4400
F 0 "A1" H 6250 5578 50  0000 C CNN
F 1 "Arduino_UNO_R2" H 6250 5487 50  0000 C CNN
F 2 "sch:Arduino_Uno_Shield" H 6400 3350 50  0001 L CNN
F 3 "https://www.arduino.cc/en/Main/arduinoBoardUno" H 6050 5450 50  0001 C CNN
	1    6250 4400
	1    0    0    -1  
$EndComp
$Comp
L components:stepper_module U1
U 1 1 5F17640C
P 4150 4100
F 0 "U1" H 4200 4465 50  0000 C CNN
F 1 "stepper_module" H 4200 4374 50  0000 C CNN
F 2 "sch:DIP-16_500_ELL" H 4150 3600 50  0001 C CNN
F 3 "" H 4150 3600 50  0001 C CNN
	1    4150 4100
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:L7805 U2
U 1 1 5F176510
P 5450 1300
F 0 "U2" H 5450 1542 50  0000 C CNN
F 1 "L7805" H 5450 1451 50  0000 C CNN
F 2 "Power_Integrations:TO-220" H 5475 1150 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 5450 1250 50  0001 C CNN
	1    5450 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_BEC Q1
U 1 1 5F1767DF
P 3550 5850
F 0 "Q1" H 3740 5896 50  0000 L CNN
F 1 "Q_NPN_BEC" H 3740 5805 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 3750 5950 50  0001 C CNN
F 3 "~" H 3550 5850 50  0001 C CNN
	1    3550 5850
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 5F17687A
P 2950 1300
F 0 "J2" H 3056 1478 50  0000 C CNN
F 1 "8V_TO_16V_IN" H 3056 1387 50  0000 C CNN
F 2 "Connectors_Phoenix:PhoenixContact_MSTBVA-G_02x5.08mm_Vertical" H 2950 1300 50  0001 C CNN
F 3 "~" H 2950 1300 50  0001 C CNN
	1    2950 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5F176A7D
P 5450 1700
F 0 "#PWR0101" H 5450 1450 50  0001 C CNN
F 1 "GND" H 5455 1527 50  0000 C CNN
F 2 "" H 5450 1700 50  0001 C CNN
F 3 "" H 5450 1700 50  0001 C CNN
	1    5450 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 1600 5450 1700
$Comp
L power:GND #PWR0102
U 1 1 5F176ACF
P 3150 1500
F 0 "#PWR0102" H 3150 1250 50  0001 C CNN
F 1 "GND" H 3155 1327 50  0000 C CNN
F 2 "" H 3150 1500 50  0001 C CNN
F 3 "" H 3150 1500 50  0001 C CNN
	1    3150 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 1400 3150 1500
Wire Wire Line
	3150 1300 3350 1300
$Comp
L Device:C C3
U 1 1 5F176B7F
P 5000 1450
F 0 "C3" H 5115 1496 50  0000 L CNN
F 1 "C" H 5115 1405 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 5038 1300 50  0001 C CNN
F 3 "~" H 5000 1450 50  0001 C CNN
	1    5000 1450
	1    0    0    -1  
$EndComp
Connection ~ 5000 1300
Wire Wire Line
	5000 1300 5150 1300
$Comp
L Device:CP C2
U 1 1 5F176BF4
P 4750 1450
F 0 "C2" H 4868 1496 50  0000 L CNN
F 1 "CP" H 4868 1405 50  0000 L CNN
F 2 "Capacitors_SMD:CP_Elec_10x10.5" H 4788 1300 50  0001 C CNN
F 3 "~" H 4750 1450 50  0001 C CNN
	1    4750 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 1300 5000 1300
$Comp
L Device:C C4
U 1 1 5F176C86
P 5900 1450
F 0 "C4" H 6015 1496 50  0000 L CNN
F 1 "C" H 6015 1405 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 5938 1300 50  0001 C CNN
F 3 "~" H 5900 1450 50  0001 C CNN
	1    5900 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C5
U 1 1 5F176CC8
P 6200 1450
F 0 "C5" H 6318 1496 50  0000 L CNN
F 1 "CP" H 6318 1405 50  0000 L CNN
F 2 "Capacitors_SMD:CP_Elec_10x10.5" H 6238 1300 50  0001 C CNN
F 3 "~" H 6200 1450 50  0001 C CNN
	1    6200 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 1300 6150 1300
Connection ~ 5900 1300
Wire Wire Line
	5900 1300 5750 1300
$Comp
L power:GND #PWR0103
U 1 1 5F176D50
P 5000 1700
F 0 "#PWR0103" H 5000 1450 50  0001 C CNN
F 1 "GND" H 5005 1527 50  0000 C CNN
F 2 "" H 5000 1700 50  0001 C CNN
F 3 "" H 5000 1700 50  0001 C CNN
	1    5000 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 1600 5000 1700
$Comp
L power:GND #PWR0104
U 1 1 5F176D8F
P 4750 1700
F 0 "#PWR0104" H 4750 1450 50  0001 C CNN
F 1 "GND" H 4755 1527 50  0000 C CNN
F 2 "" H 4750 1700 50  0001 C CNN
F 3 "" H 4750 1700 50  0001 C CNN
	1    4750 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 1600 4750 1700
$Comp
L power:GND #PWR0105
U 1 1 5F176DDD
P 5900 1700
F 0 "#PWR0105" H 5900 1450 50  0001 C CNN
F 1 "GND" H 5905 1527 50  0000 C CNN
F 2 "" H 5900 1700 50  0001 C CNN
F 3 "" H 5900 1700 50  0001 C CNN
	1    5900 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 1600 5900 1700
$Comp
L power:GND #PWR0106
U 1 1 5F176E55
P 6200 1700
F 0 "#PWR0106" H 6200 1450 50  0001 C CNN
F 1 "GND" H 6205 1527 50  0000 C CNN
F 2 "" H 6200 1700 50  0001 C CNN
F 3 "" H 6200 1700 50  0001 C CNN
	1    6200 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 1600 6200 1700
$Comp
L power:+5V #PWR0107
U 1 1 5F176F0D
P 6150 1300
F 0 "#PWR0107" H 6150 1150 50  0001 C CNN
F 1 "+5V" H 6165 1473 50  0000 C CNN
F 2 "" H 6150 1300 50  0001 C CNN
F 3 "" H 6150 1300 50  0001 C CNN
	1    6150 1300
	1    0    0    -1  
$EndComp
Connection ~ 6150 1300
Wire Wire Line
	6150 1300 5900 1300
$Comp
L Connector:Conn_01x02_Male J3
U 1 1 5F17700C
P 2950 2000
F 0 "J3" H 3056 2178 50  0000 C CNN
F 1 "5V_IN" H 3056 2087 50  0000 C CNN
F 2 "Connectors_Phoenix:PhoenixContact_MSTBVA-G_02x5.08mm_Vertical" H 2950 2000 50  0001 C CNN
F 3 "~" H 2950 2000 50  0001 C CNN
	1    2950 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5F177012
P 3150 2200
F 0 "#PWR0109" H 3150 1950 50  0001 C CNN
F 1 "GND" H 3155 2027 50  0000 C CNN
F 2 "" H 3150 2200 50  0001 C CNN
F 3 "" H 3150 2200 50  0001 C CNN
	1    3150 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 2100 3150 2200
$Comp
L power:+5V #PWR0110
U 1 1 5F1770FB
P 3150 1850
F 0 "#PWR0110" H 3150 1700 50  0001 C CNN
F 1 "+5V" H 3165 2023 50  0000 C CNN
F 2 "" H 3150 1850 50  0001 C CNN
F 3 "" H 3150 1850 50  0001 C CNN
	1    3150 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 1850 3150 2000
$Comp
L Device:R R1
U 1 1 5F177316
P 4050 1450
F 0 "R1" H 4120 1496 50  0000 L CNN
F 1 "9K" H 4120 1405 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" V 3980 1450 50  0001 C CNN
F 3 "~" H 4050 1450 50  0001 C CNN
	1    4050 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5F177384
P 4050 1900
F 0 "R2" H 4120 1946 50  0000 L CNN
F 1 "1K" H 4120 1855 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" V 3980 1900 50  0001 C CNN
F 3 "~" H 4050 1900 50  0001 C CNN
	1    4050 1900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 5F1773EA
P 4050 2150
F 0 "#PWR0111" H 4050 1900 50  0001 C CNN
F 1 "GND" H 4055 1977 50  0000 C CNN
F 2 "" H 4050 2150 50  0001 C CNN
F 3 "" H 4050 2150 50  0001 C CNN
	1    4050 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 2050 4050 2150
Wire Wire Line
	4050 1600 4050 1750
$Comp
L Diode:BZX84Cxx D1
U 1 1 5F1776DE
P 4350 1900
F 0 "D1" V 4304 1979 50  0000 L CNN
F 1 "BZX84Cxx" V 4395 1979 50  0000 L CNN
F 2 "Diodes_SMD:D_SOT-23_ANK" H 4350 1725 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 4350 1900 50  0001 C CNN
	1    4350 1900
	0    1    1    0   
$EndComp
Wire Wire Line
	4350 1750 4050 1750
Connection ~ 4050 1750
Wire Wire Line
	4350 2050 4050 2050
Connection ~ 4050 2050
$Comp
L Connector:Conn_01x02_Male J5
U 1 1 5F177AE5
P 4500 1100
F 0 "J5" V 4560 1141 50  0000 L CNN
F 1 "EN_INT_5V" V 4651 1141 50  0000 L CNN
F 2 "Connectors_Molex:Molex_SPOX-5267_22-03-5025_02x2.54mm_Straight" H 4500 1100 50  0001 C CNN
F 3 "~" H 4500 1100 50  0001 C CNN
	1    4500 1100
	0    1    1    0   
$EndComp
Wire Wire Line
	4750 1300 4500 1300
Connection ~ 4750 1300
Wire Wire Line
	4400 1300 4050 1300
Connection ~ 4050 1300
$Comp
L Device:C C1
U 1 1 5F178025
P 3750 1900
F 0 "C1" H 3865 1946 50  0000 L CNN
F 1 "C" H 3865 1855 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 3788 1750 50  0001 C CNN
F 3 "~" H 3750 1900 50  0001 C CNN
	1    3750 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 1750 3750 1750
Wire Wire Line
	3750 2050 4050 2050
Text Label 3750 1750 0    50   ~ 0
V_MEAS
Text Label 7000 4400 0    50   ~ 0
V_MEAS
$Comp
L Device:R R4
U 1 1 5F178995
P 4850 4000
F 0 "R4" V 4643 4000 50  0000 C CNN
F 1 "1K" V 4734 4000 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 4780 4000 50  0001 C CNN
F 3 "~" H 4850 4000 50  0001 C CNN
	1    4850 4000
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 5F178A7D
P 5150 4100
F 0 "R7" V 4943 4100 50  0000 C CNN
F 1 "1K" V 5034 4100 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 5080 4100 50  0001 C CNN
F 3 "~" H 5150 4100 50  0001 C CNN
	1    5150 4100
	0    1    1    0   
$EndComp
$Comp
L Device:R R10
U 1 1 5F178ABD
P 5500 4200
F 0 "R10" V 5293 4200 50  0000 C CNN
F 1 "1K" V 5384 4200 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 5430 4200 50  0001 C CNN
F 3 "~" H 5500 4200 50  0001 C CNN
	1    5500 4200
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 5F178B01
P 4850 4300
F 0 "R5" V 4643 4300 50  0000 C CNN
F 1 "1K" V 4734 4300 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 4780 4300 50  0001 C CNN
F 3 "~" H 4850 4300 50  0001 C CNN
	1    4850 4300
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 5F178B45
P 5150 4400
F 0 "R8" V 4943 4400 50  0000 C CNN
F 1 "1K" V 5034 4400 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 5080 4400 50  0001 C CNN
F 3 "~" H 5150 4400 50  0001 C CNN
	1    5150 4400
	0    1    1    0   
$EndComp
$Comp
L Device:R R11
U 1 1 5F178B8F
P 5500 4500
F 0 "R11" V 5293 4500 50  0000 C CNN
F 1 "1K" V 5384 4500 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 5430 4500 50  0001 C CNN
F 3 "~" H 5500 4500 50  0001 C CNN
	1    5500 4500
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 5F178BD9
P 4850 4600
F 0 "R6" V 4643 4600 50  0000 C CNN
F 1 "1K" V 4734 4600 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 4780 4600 50  0001 C CNN
F 3 "~" H 4850 4600 50  0001 C CNN
	1    4850 4600
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 5F178C1F
P 5150 4700
F 0 "R9" V 4943 4700 50  0000 C CNN
F 1 "1K" V 5034 4700 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 5080 4700 50  0001 C CNN
F 3 "~" H 5150 4700 50  0001 C CNN
	1    5150 4700
	0    1    1    0   
$EndComp
Wire Wire Line
	4650 4000 4700 4000
Wire Wire Line
	4650 4100 5000 4100
Wire Wire Line
	4650 4200 5350 4200
Wire Wire Line
	4650 4300 4700 4300
Wire Wire Line
	4650 4400 5000 4400
Wire Wire Line
	4650 4500 5350 4500
Wire Wire Line
	4650 4600 4700 4600
Wire Wire Line
	4650 4700 5000 4700
$Comp
L power:+5V #PWR0112
U 1 1 5F17DEB9
P 6450 3250
F 0 "#PWR0112" H 6450 3100 50  0001 C CNN
F 1 "+5V" H 6465 3423 50  0000 C CNN
F 2 "" H 6450 3250 50  0001 C CNN
F 3 "" H 6450 3250 50  0001 C CNN
	1    6450 3250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0113
U 1 1 5F17DEF4
P 3500 4100
F 0 "#PWR0113" H 3500 3950 50  0001 C CNN
F 1 "+5V" H 3515 4273 50  0000 C CNN
F 2 "" H 3500 4100 50  0001 C CNN
F 3 "" H 3500 4100 50  0001 C CNN
	1    3500 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 3250 6450 3400
Wire Wire Line
	3500 4100 3750 4100
$Comp
L power:GND #PWR0114
U 1 1 5F17EF79
P 3650 4000
F 0 "#PWR0114" H 3650 3750 50  0001 C CNN
F 1 "GND" H 3655 3827 50  0000 C CNN
F 2 "" H 3650 4000 50  0001 C CNN
F 3 "" H 3650 4000 50  0001 C CNN
	1    3650 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 4000 3650 4000
$Comp
L power:GND #PWR0115
U 1 1 5F17F8E0
P 3650 4600
F 0 "#PWR0115" H 3650 4350 50  0001 C CNN
F 1 "GND" H 3655 4427 50  0000 C CNN
F 2 "" H 3650 4600 50  0001 C CNN
F 3 "" H 3650 4600 50  0001 C CNN
	1    3650 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 4600 3650 4600
Wire Wire Line
	3750 4700 3350 4700
Wire Wire Line
	3350 4700 3350 3700
Connection ~ 3350 1300
Wire Wire Line
	3350 1300 4050 1300
Wire Wire Line
	2550 5950 2550 5650
Wire Wire Line
	2550 5650 2950 5650
$Comp
L Device:R R3
U 1 1 5F18378D
P 4050 5850
F 0 "R3" V 3843 5850 50  0000 C CNN
F 1 "1K" V 3934 5850 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 3980 5850 50  0001 C CNN
F 3 "~" H 4050 5850 50  0001 C CNN
	1    4050 5850
	0    1    1    0   
$EndComp
Wire Wire Line
	3900 5850 3750 5850
Wire Wire Line
	4200 5850 4700 5850
Wire Wire Line
	4700 5850 4700 4800
Wire Wire Line
	4700 4800 5750 4800
$Comp
L Connector:Conn_01x04_Male J4
U 1 1 5F1856C1
P 3450 4300
F 0 "J4" H 3556 4578 50  0000 C CNN
F 1 "Conn_01x04_Male" H 3556 4487 50  0000 C CNN
F 2 "Connectors_Molex:Molex_SPOX-5267_22-03-5045_04x2.54mm_Straight" H 3450 4300 50  0001 C CNN
F 3 "~" H 3450 4300 50  0001 C CNN
	1    3450 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 4200 3750 4200
Wire Wire Line
	3650 4300 3750 4300
Wire Wire Line
	3650 4400 3750 4400
Wire Wire Line
	3650 4500 3750 4500
Wire Wire Line
	5300 4700 5750 4700
Wire Wire Line
	5000 4600 5750 4600
Wire Wire Line
	5650 4500 5750 4500
Wire Wire Line
	5300 4400 5750 4400
Wire Wire Line
	5000 4300 5750 4300
Wire Wire Line
	5650 4200 5750 4200
Wire Wire Line
	5300 4100 5750 4100
Wire Wire Line
	5000 4000 5750 4000
$Comp
L Connector:Conn_01x02_Male J7
U 1 1 5F193A28
P 2700 4700
F 0 "J7" H 2806 4878 50  0000 C CNN
F 1 "VMOT_EXT" H 2806 4787 50  0000 C CNN
F 2 "Connectors_Phoenix:PhoenixContact_MSTBVA-G_02x5.08mm_Vertical" H 2700 4700 50  0001 C CNN
F 3 "~" H 2700 4700 50  0001 C CNN
	1    2700 4700
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J8
U 1 1 5F193B3A
P 3150 3250
F 0 "J8" H 3256 3428 50  0000 C CNN
F 1 "EN_VMOT_VIN" H 3256 3337 50  0000 C CNN
F 2 "Connectors_Molex:Molex_SPOX-5267_22-03-5025_02x2.54mm_Straight" H 3150 3250 50  0001 C CNN
F 3 "~" H 3150 3250 50  0001 C CNN
	1    3150 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 3250 3350 1300
$Comp
L Connector:Conn_01x02_Male J9
U 1 1 5F193BC8
P 3150 4500
F 0 "J9" V 3210 4541 50  0000 L CNN
F 1 "EN_VMOT_EXT" V 3301 4541 50  0000 L CNN
F 2 "Connectors_Molex:Molex_SPOX-5267_22-03-5025_02x2.54mm_Straight" H 3150 4500 50  0001 C CNN
F 3 "~" H 3150 4500 50  0001 C CNN
	1    3150 4500
	0    1    1    0   
$EndComp
Wire Wire Line
	3350 4700 3150 4700
Connection ~ 3350 4700
Wire Wire Line
	3050 4700 2900 4700
$Comp
L power:GND #PWR0116
U 1 1 5F1964E3
P 2800 6150
F 0 "#PWR0116" H 2800 5900 50  0001 C CNN
F 1 "GND" H 2805 5977 50  0000 C CNN
F 2 "" H 2800 6150 50  0001 C CNN
F 3 "" H 2800 6150 50  0001 C CNN
	1    2800 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 6050 2800 6150
$Comp
L Device:R R12
U 1 1 5F19840F
P 2050 3850
F 0 "R12" H 2120 3896 50  0000 L CNN
F 1 "9K" H 2120 3805 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" V 1980 3850 50  0001 C CNN
F 3 "~" H 2050 3850 50  0001 C CNN
	1    2050 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R13
U 1 1 5F198415
P 2050 4300
F 0 "R13" H 2120 4346 50  0000 L CNN
F 1 "1K" H 2120 4255 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" V 1980 4300 50  0001 C CNN
F 3 "~" H 2050 4300 50  0001 C CNN
	1    2050 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5F19841B
P 2050 4550
F 0 "#PWR0108" H 2050 4300 50  0001 C CNN
F 1 "GND" H 2055 4377 50  0000 C CNN
F 2 "" H 2050 4550 50  0001 C CNN
F 3 "" H 2050 4550 50  0001 C CNN
	1    2050 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 4450 2050 4550
Wire Wire Line
	2050 4000 2050 4150
$Comp
L Diode:BZX84Cxx D2
U 1 1 5F198423
P 2350 4300
F 0 "D2" V 2304 4379 50  0000 L CNN
F 1 "BZX84Cxx" V 2395 4379 50  0000 L CNN
F 2 "Diodes_SMD:D_SOT-23_ANK" H 2350 4125 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 2350 4300 50  0001 C CNN
	1    2350 4300
	0    1    1    0   
$EndComp
Wire Wire Line
	2350 4150 2050 4150
Connection ~ 2050 4150
Wire Wire Line
	2350 4450 2050 4450
Connection ~ 2050 4450
$Comp
L Device:C C6
U 1 1 5F19842D
P 1750 4300
F 0 "C6" H 1865 4346 50  0000 L CNN
F 1 "C" H 1865 4255 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 1788 4150 50  0001 C CNN
F 3 "~" H 1750 4300 50  0001 C CNN
	1    1750 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 4150 1750 4150
Wire Wire Line
	1750 4450 2050 4450
Text Label 1750 4150 0    50   ~ 0
V_MOTOR
Wire Wire Line
	2050 3700 3350 3700
Connection ~ 3350 3700
Wire Wire Line
	3350 3700 3350 3350
Text Label 7000 4500 0    50   ~ 0
V_MOTOR
Wire Wire Line
	7000 4500 6750 4500
Wire Wire Line
	6750 4400 7000 4400
Connection ~ 2800 6050
Wire Wire Line
	2800 6050 3450 6050
$Comp
L Device:D D3
U 1 1 5F1A0FFC
P 2950 5500
F 0 "D3" V 2904 5579 50  0000 L CNN
F 1 "D" V 2995 5579 50  0000 L CNN
F 2 "Diodes_SMD:D_2010" H 2950 5500 50  0001 C CNN
F 3 "~" H 2950 5500 50  0001 C CNN
	1    2950 5500
	0    1    1    0   
$EndComp
Connection ~ 2950 5650
Wire Wire Line
	2950 5650 3450 5650
$Comp
L Connector:Conn_01x03_Male J1
U 1 1 5F1A30EE
P 2100 5950
F 0 "J1" H 2206 6228 50  0000 C CNN
F 1 "EXT_RELAY" H 2206 6137 50  0000 C CNN
F 2 "Connectors_Molex:Molex_SPOX-5267_22-03-5035_03x2.54mm_Straight" H 2100 5950 50  0001 C CNN
F 3 "~" H 2100 5950 50  0001 C CNN
	1    2100 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 6050 2800 6050
Wire Wire Line
	2550 5950 2300 5950
Wire Wire Line
	2300 5850 2300 5350
Wire Wire Line
	2300 5350 2950 5350
$Comp
L power:GND #PWR?
U 1 1 5F1A96E4
P 2900 4900
F 0 "#PWR?" H 2900 4650 50  0001 C CNN
F 1 "GND" H 2905 4727 50  0000 C CNN
F 2 "" H 2900 4900 50  0001 C CNN
F 3 "" H 2900 4900 50  0001 C CNN
	1    2900 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 4800 2900 4900
$EndSCHEMATC
