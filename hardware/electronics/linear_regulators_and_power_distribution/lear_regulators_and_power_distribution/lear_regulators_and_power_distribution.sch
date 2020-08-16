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
L Regulator_Linear:LM317_3PinPackage U1
U 1 1 5F171C29
P 2350 1600
F 0 "U1" H 2350 1842 50  0000 C CNN
F 1 "LM317_3PinPackage" H 2350 1751 50  0000 C CNN
F 2 "Power_Integrations:TO-220" H 2350 1850 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm317.pdf" H 2350 1600 50  0001 C CNN
	1    2350 1600
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LM337_SOT223 U3
U 1 1 5F171D87
P 2800 6000
F 0 "U3" H 2800 5850 50  0000 C CNN
F 1 "LM337_SOT223" H 2800 5759 50  0000 C CNN
F 2 "Power_Integrations:TO-220" H 2800 5800 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm337-n.pdf" H 2800 6000 50  0001 C CNN
	1    2800 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5F171DF2
P 3000 1750
F 0 "R1" H 3070 1796 50  0000 L CNN
F 1 "R" H 3070 1705 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" V 2930 1750 50  0001 C CNN
F 3 "~" H 3000 1750 50  0001 C CNN
	1    3000 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:D D1
U 1 1 5F171E84
P 2350 1100
F 0 "D1" H 2350 1316 50  0000 C CNN
F 1 "D" H 2350 1225 50  0000 C CNN
F 2 "Diodes_SMD:D_2114" H 2350 1100 50  0001 C CNN
F 3 "~" H 2350 1100 50  0001 C CNN
	1    2350 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:D D3
U 1 1 5F171F1E
P 3300 1750
F 0 "D3" V 3254 1829 50  0000 L CNN
F 1 "D" V 3345 1829 50  0000 L CNN
F 2 "Diodes_SMD:D_2114" H 3300 1750 50  0001 C CNN
F 3 "~" H 3300 1750 50  0001 C CNN
	1    3300 1750
	0    1    1    0   
$EndComp
$Comp
L Device:R_POT RV1
U 1 1 5F17203C
P 2350 2200
F 0 "RV1" H 2280 2246 50  0000 R CNN
F 1 "R_POT" H 2280 2155 50  0000 R CNN
F 2 "Potentiometers:Potentiometer_Trimmer_Vishay_TS53YL" H 2350 2200 50  0001 C CNN
F 3 "~" H 2350 2200 50  0001 C CNN
	1    2350 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5F1720FB
P 2800 2200
F 0 "C5" H 2915 2246 50  0000 L CNN
F 1 "C" H 2915 2155 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 2838 2050 50  0001 C CNN
F 3 "~" H 2800 2200 50  0001 C CNN
	1    2800 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C11
U 1 1 5F172125
P 3750 1750
F 0 "C11" H 3865 1796 50  0000 L CNN
F 1 "C" H 3865 1705 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 3788 1600 50  0001 C CNN
F 3 "~" H 3750 1750 50  0001 C CNN
	1    3750 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C13
U 1 1 5F1721B5
P 4050 1750
F 0 "C13" H 4168 1796 50  0000 L CNN
F 1 "CP" H 4168 1705 50  0000 L CNN
F 2 "Capacitors_SMD:CP_Elec_10x10.5" H 4088 1600 50  0001 C CNN
F 3 "~" H 4050 1750 50  0001 C CNN
	1    4050 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1
U 1 1 5F1721E5
P 1700 1750
F 0 "C1" H 1818 1796 50  0000 L CNN
F 1 "CP" H 1818 1705 50  0000 L CNN
F 2 "Capacitors_SMD:CP_Elec_10x10.5" H 1738 1600 50  0001 C CNN
F 3 "~" H 1700 1750 50  0001 C CNN
	1    1700 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT RV3
U 1 1 5F1722C7
P 2800 5300
F 0 "RV3" H 2730 5346 50  0000 R CNN
F 1 "R_POT" H 2730 5255 50  0000 R CNN
F 2 "Potentiometers:Potentiometer_Trimmer_Vishay_TS53YL" H 2800 5300 50  0001 C CNN
F 3 "~" H 2800 5300 50  0001 C CNN
	1    2800 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 5F17239B
P 3250 5300
F 0 "C7" H 3365 5346 50  0000 L CNN
F 1 "C" H 3365 5255 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 3288 5150 50  0001 C CNN
F 3 "~" H 3250 5300 50  0001 C CNN
	1    3250 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5F1723FF
P 3250 5850
F 0 "R3" H 3320 5896 50  0000 L CNN
F 1 "R" H 3320 5805 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" V 3180 5850 50  0001 C CNN
F 3 "~" H 3250 5850 50  0001 C CNN
	1    3250 5850
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C9
U 1 1 5F172495
P 3650 5850
F 0 "C9" H 3768 5896 50  0000 L CNN
F 1 "CP" H 3768 5805 50  0000 L CNN
F 2 "Capacitors_SMD:CP_Elec_10x10.5" H 3688 5700 50  0001 C CNN
F 3 "~" H 3650 5850 50  0001 C CNN
	1    3650 5850
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C3
U 1 1 5F17253F
P 2250 5850
F 0 "C3" H 2368 5896 50  0000 L CNN
F 1 "CP" H 2368 5805 50  0000 L CNN
F 2 "Capacitors_SMD:CP_Elec_10x10.5" H 2288 5700 50  0001 C CNN
F 3 "~" H 2250 5850 50  0001 C CNN
	1    2250 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 1900 2350 1950
Wire Wire Line
	2800 2350 2600 2350
Wire Wire Line
	2800 2050 2800 1950
Wire Wire Line
	2800 1950 2500 1950
Connection ~ 2350 1950
Wire Wire Line
	2350 1950 2350 2050
Wire Wire Line
	2500 2200 2500 1950
Connection ~ 2500 1950
Wire Wire Line
	2500 1950 2350 1950
Wire Wire Line
	2800 1950 3000 1950
Wire Wire Line
	3000 1950 3000 1900
Connection ~ 2800 1950
Wire Wire Line
	3000 1950 3300 1950
Wire Wire Line
	3300 1950 3300 1900
Connection ~ 3000 1950
Wire Wire Line
	3300 1600 3000 1600
Connection ~ 3000 1600
Wire Wire Line
	3000 1600 2650 1600
Wire Wire Line
	3750 1900 3900 1900
Wire Wire Line
	3900 1900 3900 2350
Wire Wire Line
	3900 2350 2800 2350
Connection ~ 3900 1900
Wire Wire Line
	3900 1900 4050 1900
Connection ~ 2800 2350
Wire Wire Line
	4050 1600 3750 1600
Connection ~ 3300 1600
Connection ~ 3750 1600
Wire Wire Line
	3750 1600 3300 1600
Wire Wire Line
	1700 1600 1850 1600
Wire Wire Line
	1700 1900 1700 2350
Wire Wire Line
	1700 2350 2350 2350
Connection ~ 2350 2350
Wire Wire Line
	3000 1600 3000 1100
Wire Wire Line
	3000 1100 2500 1100
Wire Wire Line
	2200 1100 1850 1100
Wire Wire Line
	1850 1100 1850 1600
Connection ~ 1850 1600
Wire Wire Line
	1850 1600 2050 1600
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 5F17338E
P 900 1600
F 0 "J1" H 1006 1778 50  0000 C CNN
F 1 "21V_IN" H 1006 1687 50  0000 C CNN
F 2 "Connectors_Molex:Molex_SPOX-5267_22-03-5025_02x2.54mm_Straight" H 900 1600 50  0001 C CNN
F 3 "~" H 900 1600 50  0001 C CNN
	1    900  1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 6000 3250 6000
Connection ~ 3250 6000
Wire Wire Line
	3250 6000 3650 6000
Wire Wire Line
	3250 5700 3250 5550
Wire Wire Line
	2800 5700 2800 5550
Wire Wire Line
	2800 5550 2950 5550
Connection ~ 2800 5550
Wire Wire Line
	2800 5550 2800 5450
Connection ~ 3250 5550
Wire Wire Line
	3250 5550 3250 5450
Wire Wire Line
	2950 5300 2950 5550
Connection ~ 2950 5550
Wire Wire Line
	2950 5550 3250 5550
Wire Wire Line
	3650 5700 3650 5150
Wire Wire Line
	3650 5150 3250 5150
Wire Wire Line
	2250 5150 2250 5700
Connection ~ 2800 5150
Wire Wire Line
	2800 5150 2500 5150
Connection ~ 3250 5150
Wire Wire Line
	3250 5150 2800 5150
Wire Wire Line
	2500 6000 2250 6000
Wire Wire Line
	1700 1600 1350 1600
Connection ~ 1700 1600
$Comp
L power:GND #PWR0101
U 1 1 5F176B9B
P 2600 2350
F 0 "#PWR0101" H 2600 2100 50  0001 C CNN
F 1 "GND" H 2605 2177 50  0000 C CNN
F 2 "" H 2600 2350 50  0001 C CNN
F 3 "" H 2600 2350 50  0001 C CNN
	1    2600 2350
	1    0    0    -1  
$EndComp
Connection ~ 2600 2350
Wire Wire Line
	2600 2350 2350 2350
$Comp
L power:GND #PWR0102
U 1 1 5F176BD1
P 2500 5150
F 0 "#PWR0102" H 2500 4900 50  0001 C CNN
F 1 "GND" H 2505 4977 50  0000 C CNN
F 2 "" H 2500 5150 50  0001 C CNN
F 3 "" H 2500 5150 50  0001 C CNN
	1    2500 5150
	1    0    0    -1  
$EndComp
Connection ~ 2500 5150
Wire Wire Line
	2500 5150 2250 5150
Wire Wire Line
	1100 1700 1100 2350
Wire Wire Line
	1100 2350 1700 2350
Connection ~ 1700 2350
$Comp
L Regulator_Linear:LM317_3PinPackage U5
U 1 1 5F177C9B
P 5900 1650
F 0 "U5" H 5900 1892 50  0000 C CNN
F 1 "LM317_3PinPackage" H 5900 1801 50  0000 C CNN
F 2 "Power_Integrations:TO-220" H 5900 1900 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm317.pdf" H 5900 1650 50  0001 C CNN
	1    5900 1650
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LM337_SOT223 U4
U 1 1 5F177CA1
P 2800 7550
F 0 "U4" H 2800 7400 50  0000 C CNN
F 1 "LM337_SOT223" H 2800 7309 50  0000 C CNN
F 2 "Power_Integrations:TO-220" H 2800 7350 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm337-n.pdf" H 2800 7550 50  0001 C CNN
	1    2800 7550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5F177CA7
P 6550 1800
F 0 "R5" H 6620 1846 50  0000 L CNN
F 1 "R" H 6620 1755 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" V 6480 1800 50  0001 C CNN
F 3 "~" H 6550 1800 50  0001 C CNN
	1    6550 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:D D5
U 1 1 5F177CAD
P 5900 1150
F 0 "D5" H 5900 1366 50  0000 C CNN
F 1 "D" H 5900 1275 50  0000 C CNN
F 2 "Diodes_SMD:D_2114" H 5900 1150 50  0001 C CNN
F 3 "~" H 5900 1150 50  0001 C CNN
	1    5900 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:D D7
U 1 1 5F177CB3
P 6850 1800
F 0 "D7" V 6804 1879 50  0000 L CNN
F 1 "D" V 6895 1879 50  0000 L CNN
F 2 "Diodes_SMD:D_2114" H 6850 1800 50  0001 C CNN
F 3 "~" H 6850 1800 50  0001 C CNN
	1    6850 1800
	0    1    1    0   
$EndComp
$Comp
L Device:R_POT RV5
U 1 1 5F177CB9
P 5900 2250
F 0 "RV5" H 5830 2296 50  0000 R CNN
F 1 "R_POT" H 5830 2205 50  0000 R CNN
F 2 "Potentiometers:Potentiometer_Trimmer_Vishay_TS53YL" H 5900 2250 50  0001 C CNN
F 3 "~" H 5900 2250 50  0001 C CNN
	1    5900 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C17
U 1 1 5F177CBF
P 6350 2250
F 0 "C17" H 6465 2296 50  0000 L CNN
F 1 "C" H 6465 2205 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 6388 2100 50  0001 C CNN
F 3 "~" H 6350 2250 50  0001 C CNN
	1    6350 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C19
U 1 1 5F177CC5
P 7300 1800
F 0 "C19" H 7415 1846 50  0000 L CNN
F 1 "C" H 7415 1755 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 7338 1650 50  0001 C CNN
F 3 "~" H 7300 1800 50  0001 C CNN
	1    7300 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C20
U 1 1 5F177CCB
P 7600 1800
F 0 "C20" H 7718 1846 50  0000 L CNN
F 1 "CP" H 7718 1755 50  0000 L CNN
F 2 "Capacitors_SMD:CP_Elec_10x10.5" H 7638 1650 50  0001 C CNN
F 3 "~" H 7600 1800 50  0001 C CNN
	1    7600 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C15
U 1 1 5F177CD1
P 5250 1800
F 0 "C15" H 5368 1846 50  0000 L CNN
F 1 "CP" H 5368 1755 50  0000 L CNN
F 2 "Capacitors_SMD:CP_Elec_10x10.5" H 5288 1650 50  0001 C CNN
F 3 "~" H 5250 1800 50  0001 C CNN
	1    5250 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT RV4
U 1 1 5F177CD7
P 2800 6850
F 0 "RV4" H 2730 6896 50  0000 R CNN
F 1 "R_POT" H 2730 6805 50  0000 R CNN
F 2 "Potentiometers:Potentiometer_Trimmer_Vishay_TS53YL" H 2800 6850 50  0001 C CNN
F 3 "~" H 2800 6850 50  0001 C CNN
	1    2800 6850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 5F177CDD
P 3250 6850
F 0 "C8" H 3365 6896 50  0000 L CNN
F 1 "C" H 3365 6805 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 3288 6700 50  0001 C CNN
F 3 "~" H 3250 6850 50  0001 C CNN
	1    3250 6850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5F177CE3
P 3250 7400
F 0 "R4" H 3320 7446 50  0000 L CNN
F 1 "R" H 3320 7355 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" V 3180 7400 50  0001 C CNN
F 3 "~" H 3250 7400 50  0001 C CNN
	1    3250 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C10
U 1 1 5F177CE9
P 3650 7400
F 0 "C10" H 3768 7446 50  0000 L CNN
F 1 "CP" H 3768 7355 50  0000 L CNN
F 2 "Capacitors_SMD:CP_Elec_10x10.5" H 3688 7250 50  0001 C CNN
F 3 "~" H 3650 7400 50  0001 C CNN
	1    3650 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C4
U 1 1 5F177CEF
P 2250 7400
F 0 "C4" H 2368 7446 50  0000 L CNN
F 1 "CP" H 2368 7355 50  0000 L CNN
F 2 "Capacitors_SMD:CP_Elec_10x10.5" H 2288 7250 50  0001 C CNN
F 3 "~" H 2250 7400 50  0001 C CNN
	1    2250 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 1950 5900 2000
Wire Wire Line
	6350 2400 6150 2400
Wire Wire Line
	6350 2100 6350 2000
Wire Wire Line
	6350 2000 6050 2000
Connection ~ 5900 2000
Wire Wire Line
	5900 2000 5900 2100
Wire Wire Line
	6050 2250 6050 2000
Connection ~ 6050 2000
Wire Wire Line
	6050 2000 5900 2000
Wire Wire Line
	6350 2000 6550 2000
Wire Wire Line
	6550 2000 6550 1950
Connection ~ 6350 2000
Wire Wire Line
	6550 2000 6850 2000
Wire Wire Line
	6850 2000 6850 1950
Connection ~ 6550 2000
Wire Wire Line
	6850 1650 6550 1650
Connection ~ 6550 1650
Wire Wire Line
	6550 1650 6200 1650
Wire Wire Line
	7300 1950 7450 1950
Wire Wire Line
	7450 1950 7450 2400
Wire Wire Line
	7450 2400 6350 2400
Connection ~ 7450 1950
Wire Wire Line
	7450 1950 7600 1950
Connection ~ 6350 2400
Wire Wire Line
	7600 1650 7300 1650
Connection ~ 6850 1650
Connection ~ 7300 1650
Wire Wire Line
	7300 1650 6850 1650
Wire Wire Line
	5250 1650 5400 1650
Wire Wire Line
	5250 1950 5250 2400
Wire Wire Line
	5250 2400 5900 2400
Connection ~ 5900 2400
Wire Wire Line
	6550 1650 6550 1150
Wire Wire Line
	6550 1150 6050 1150
Wire Wire Line
	5750 1150 5400 1150
Wire Wire Line
	5400 1150 5400 1650
Connection ~ 5400 1650
Wire Wire Line
	5400 1650 5600 1650
Wire Wire Line
	3100 7550 3250 7550
Connection ~ 3250 7550
Wire Wire Line
	3250 7550 3650 7550
Wire Wire Line
	3250 7250 3250 7100
Wire Wire Line
	2800 7250 2800 7100
Wire Wire Line
	2800 7100 2950 7100
Connection ~ 2800 7100
Wire Wire Line
	2800 7100 2800 7000
Connection ~ 3250 7100
Wire Wire Line
	3250 7100 3250 7000
Wire Wire Line
	2950 6850 2950 7100
Connection ~ 2950 7100
Wire Wire Line
	2950 7100 3250 7100
Wire Wire Line
	3650 7250 3650 6700
Wire Wire Line
	3650 6700 3250 6700
Wire Wire Line
	2250 6700 2250 7250
Connection ~ 2800 6700
Wire Wire Line
	2800 6700 2500 6700
Connection ~ 3250 6700
Wire Wire Line
	3250 6700 2800 6700
Wire Wire Line
	2500 7550 2250 7550
Connection ~ 2250 7550
Wire Wire Line
	2250 7550 1800 7550
Wire Wire Line
	5250 1650 4650 1650
Connection ~ 5250 1650
$Comp
L power:GND #PWR0103
U 1 1 5F177D43
P 6150 2400
F 0 "#PWR0103" H 6150 2150 50  0001 C CNN
F 1 "GND" H 6155 2227 50  0000 C CNN
F 2 "" H 6150 2400 50  0001 C CNN
F 3 "" H 6150 2400 50  0001 C CNN
	1    6150 2400
	1    0    0    -1  
$EndComp
Connection ~ 6150 2400
Wire Wire Line
	6150 2400 5900 2400
$Comp
L power:GND #PWR0104
U 1 1 5F177D4B
P 2500 6700
F 0 "#PWR0104" H 2500 6450 50  0001 C CNN
F 1 "GND" H 2505 6527 50  0000 C CNN
F 2 "" H 2500 6700 50  0001 C CNN
F 3 "" H 2500 6700 50  0001 C CNN
	1    2500 6700
	1    0    0    -1  
$EndComp
Connection ~ 2500 6700
Wire Wire Line
	2500 6700 2250 6700
$Comp
L Regulator_Linear:LM317_3PinPackage U2
U 1 1 5F17B7A6
P 2500 4050
F 0 "U2" H 2500 4292 50  0000 C CNN
F 1 "LM317_3PinPackage" H 2500 4201 50  0000 C CNN
F 2 "Power_Integrations:TO-220" H 2500 4300 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm317.pdf" H 2500 4050 50  0001 C CNN
	1    2500 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5F17B7AC
P 3150 4200
F 0 "R2" H 3220 4246 50  0000 L CNN
F 1 "R" H 3220 4155 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" V 3080 4200 50  0001 C CNN
F 3 "~" H 3150 4200 50  0001 C CNN
	1    3150 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:D D2
U 1 1 5F17B7B2
P 2500 3550
F 0 "D2" H 2500 3766 50  0000 C CNN
F 1 "D" H 2500 3675 50  0000 C CNN
F 2 "Diodes_SMD:D_2114" H 2500 3550 50  0001 C CNN
F 3 "~" H 2500 3550 50  0001 C CNN
	1    2500 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:D D4
U 1 1 5F17B7B8
P 3450 4200
F 0 "D4" V 3404 4279 50  0000 L CNN
F 1 "D" V 3495 4279 50  0000 L CNN
F 2 "Diodes_SMD:D_2114" H 3450 4200 50  0001 C CNN
F 3 "~" H 3450 4200 50  0001 C CNN
	1    3450 4200
	0    1    1    0   
$EndComp
$Comp
L Device:R_POT RV2
U 1 1 5F17B7BE
P 2500 4650
F 0 "RV2" H 2430 4696 50  0000 R CNN
F 1 "R_POT" H 2430 4605 50  0000 R CNN
F 2 "Potentiometers:Potentiometer_Trimmer_Vishay_TS53YL" H 2500 4650 50  0001 C CNN
F 3 "~" H 2500 4650 50  0001 C CNN
	1    2500 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 5F17B7C4
P 2950 4650
F 0 "C6" H 3065 4696 50  0000 L CNN
F 1 "C" H 3065 4605 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 2988 4500 50  0001 C CNN
F 3 "~" H 2950 4650 50  0001 C CNN
	1    2950 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C12
U 1 1 5F17B7CA
P 3900 4200
F 0 "C12" H 4015 4246 50  0000 L CNN
F 1 "C" H 4015 4155 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 3938 4050 50  0001 C CNN
F 3 "~" H 3900 4200 50  0001 C CNN
	1    3900 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C14
U 1 1 5F17B7D0
P 4200 4200
F 0 "C14" H 4318 4246 50  0000 L CNN
F 1 "CP" H 4318 4155 50  0000 L CNN
F 2 "Capacitors_SMD:CP_Elec_10x10.5" H 4238 4050 50  0001 C CNN
F 3 "~" H 4200 4200 50  0001 C CNN
	1    4200 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C2
U 1 1 5F17B7D6
P 1850 4200
F 0 "C2" H 1968 4246 50  0000 L CNN
F 1 "CP" H 1968 4155 50  0000 L CNN
F 2 "Capacitors_SMD:CP_Elec_10x10.5" H 1888 4050 50  0001 C CNN
F 3 "~" H 1850 4200 50  0001 C CNN
	1    1850 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 4350 2500 4400
Wire Wire Line
	2950 4800 2750 4800
Wire Wire Line
	2950 4500 2950 4400
Wire Wire Line
	2950 4400 2650 4400
Connection ~ 2500 4400
Wire Wire Line
	2500 4400 2500 4500
Wire Wire Line
	2650 4650 2650 4400
Connection ~ 2650 4400
Wire Wire Line
	2650 4400 2500 4400
Wire Wire Line
	2950 4400 3150 4400
Wire Wire Line
	3150 4400 3150 4350
Connection ~ 2950 4400
Wire Wire Line
	3150 4400 3450 4400
Wire Wire Line
	3450 4400 3450 4350
Connection ~ 3150 4400
Wire Wire Line
	3450 4050 3150 4050
Connection ~ 3150 4050
Wire Wire Line
	3150 4050 2800 4050
Wire Wire Line
	3900 4350 4050 4350
Wire Wire Line
	4050 4350 4050 4800
Wire Wire Line
	4050 4800 2950 4800
Connection ~ 4050 4350
Wire Wire Line
	4050 4350 4200 4350
Connection ~ 2950 4800
Wire Wire Line
	4200 4050 3900 4050
Connection ~ 3450 4050
Connection ~ 3900 4050
Wire Wire Line
	3900 4050 3450 4050
Wire Wire Line
	1850 4050 2000 4050
Wire Wire Line
	1850 4350 1850 4800
Wire Wire Line
	1850 4800 2500 4800
Connection ~ 2500 4800
Wire Wire Line
	3150 4050 3150 3550
Wire Wire Line
	3150 3550 2650 3550
Wire Wire Line
	2350 3550 2000 3550
Wire Wire Line
	2000 3550 2000 4050
Connection ~ 2000 4050
Wire Wire Line
	2000 4050 2200 4050
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 5F17B802
P 1050 4050
F 0 "J2" H 1156 4228 50  0000 C CNN
F 1 "11V_IN_A" H 1156 4137 50  0000 C CNN
F 2 "Connectors_Molex:Molex_SPOX-5267_22-03-5025_02x2.54mm_Straight" H 1050 4050 50  0001 C CNN
F 3 "~" H 1050 4050 50  0001 C CNN
	1    1050 4050
	1    0    0    -1  
$EndComp
Connection ~ 1850 4050
$Comp
L power:GND #PWR0105
U 1 1 5F17B80A
P 2750 4800
F 0 "#PWR0105" H 2750 4550 50  0001 C CNN
F 1 "GND" H 2755 4627 50  0000 C CNN
F 2 "" H 2750 4800 50  0001 C CNN
F 3 "" H 2750 4800 50  0001 C CNN
	1    2750 4800
	1    0    0    -1  
$EndComp
Connection ~ 2750 4800
Wire Wire Line
	2750 4800 2500 4800
Wire Wire Line
	1250 4150 1250 4800
Wire Wire Line
	1250 4800 1850 4800
Connection ~ 1850 4800
$Comp
L Regulator_Linear:LM317_3PinPackage U6
U 1 1 5F17B815
P 6550 4050
F 0 "U6" H 6550 4292 50  0000 C CNN
F 1 "LM317_3PinPackage" H 6550 4201 50  0000 C CNN
F 2 "Power_Integrations:TO-220" H 6550 4300 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm317.pdf" H 6550 4050 50  0001 C CNN
	1    6550 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5F17B81B
P 7200 4200
F 0 "R6" H 7270 4246 50  0000 L CNN
F 1 "R" H 7270 4155 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" V 7130 4200 50  0001 C CNN
F 3 "~" H 7200 4200 50  0001 C CNN
	1    7200 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:D D6
U 1 1 5F17B821
P 6550 3550
F 0 "D6" H 6550 3766 50  0000 C CNN
F 1 "D" H 6550 3675 50  0000 C CNN
F 2 "Diodes_SMD:D_2114" H 6550 3550 50  0001 C CNN
F 3 "~" H 6550 3550 50  0001 C CNN
	1    6550 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:D D8
U 1 1 5F17B827
P 7500 4200
F 0 "D8" V 7454 4279 50  0000 L CNN
F 1 "D" V 7545 4279 50  0000 L CNN
F 2 "Diodes_SMD:D_2114" H 7500 4200 50  0001 C CNN
F 3 "~" H 7500 4200 50  0001 C CNN
	1    7500 4200
	0    1    1    0   
$EndComp
$Comp
L Device:R_POT RV6
U 1 1 5F17B82D
P 6550 4650
F 0 "RV6" H 6480 4696 50  0000 R CNN
F 1 "R_POT" H 6480 4605 50  0000 R CNN
F 2 "Potentiometers:Potentiometer_Trimmer_Vishay_TS53YL" H 6550 4650 50  0001 C CNN
F 3 "~" H 6550 4650 50  0001 C CNN
	1    6550 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C18
U 1 1 5F17B833
P 7000 4650
F 0 "C18" H 7115 4696 50  0000 L CNN
F 1 "C" H 7115 4605 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 7038 4500 50  0001 C CNN
F 3 "~" H 7000 4650 50  0001 C CNN
	1    7000 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C21
U 1 1 5F17B839
P 7950 4200
F 0 "C21" H 8065 4246 50  0000 L CNN
F 1 "C" H 8065 4155 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 7988 4050 50  0001 C CNN
F 3 "~" H 7950 4200 50  0001 C CNN
	1    7950 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C22
U 1 1 5F17B83F
P 8250 4200
F 0 "C22" H 8368 4246 50  0000 L CNN
F 1 "CP" H 8368 4155 50  0000 L CNN
F 2 "Capacitors_SMD:CP_Elec_10x10.5" H 8288 4050 50  0001 C CNN
F 3 "~" H 8250 4200 50  0001 C CNN
	1    8250 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C16
U 1 1 5F17B845
P 5900 4200
F 0 "C16" H 6018 4246 50  0000 L CNN
F 1 "CP" H 6018 4155 50  0000 L CNN
F 2 "Capacitors_SMD:CP_Elec_10x10.5" H 5938 4050 50  0001 C CNN
F 3 "~" H 5900 4200 50  0001 C CNN
	1    5900 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 4350 6550 4400
Wire Wire Line
	7000 4800 6800 4800
Wire Wire Line
	7000 4500 7000 4400
Wire Wire Line
	7000 4400 6700 4400
Connection ~ 6550 4400
Wire Wire Line
	6550 4400 6550 4500
Wire Wire Line
	6700 4650 6700 4400
Connection ~ 6700 4400
Wire Wire Line
	6700 4400 6550 4400
Wire Wire Line
	7000 4400 7200 4400
Wire Wire Line
	7200 4400 7200 4350
Connection ~ 7000 4400
Wire Wire Line
	7200 4400 7500 4400
Wire Wire Line
	7500 4400 7500 4350
Connection ~ 7200 4400
Wire Wire Line
	7500 4050 7200 4050
Connection ~ 7200 4050
Wire Wire Line
	7200 4050 6850 4050
Wire Wire Line
	7950 4350 8100 4350
Wire Wire Line
	8100 4350 8100 4800
Wire Wire Line
	8100 4800 7000 4800
Connection ~ 8100 4350
Wire Wire Line
	8100 4350 8250 4350
Connection ~ 7000 4800
Wire Wire Line
	8250 4050 7950 4050
Connection ~ 7500 4050
Connection ~ 7950 4050
Wire Wire Line
	7950 4050 7500 4050
Wire Wire Line
	5900 4050 6050 4050
Wire Wire Line
	5900 4350 5900 4800
Wire Wire Line
	5900 4800 6550 4800
Connection ~ 6550 4800
Wire Wire Line
	7200 4050 7200 3550
Wire Wire Line
	7200 3550 6700 3550
Wire Wire Line
	6400 3550 6050 3550
Wire Wire Line
	6050 3550 6050 4050
Connection ~ 6050 4050
Wire Wire Line
	6050 4050 6250 4050
$Comp
L power:GND #PWR0106
U 1 1 5F17B879
P 6800 4800
F 0 "#PWR0106" H 6800 4550 50  0001 C CNN
F 1 "GND" H 6805 4627 50  0000 C CNN
F 2 "" H 6800 4800 50  0001 C CNN
F 3 "" H 6800 4800 50  0001 C CNN
	1    6800 4800
	1    0    0    -1  
$EndComp
Connection ~ 6800 4800
Wire Wire Line
	6800 4800 6550 4800
Wire Wire Line
	4650 1650 4650 700 
Wire Wire Line
	4650 700  1350 700 
Wire Wire Line
	1350 700  1350 1600
Connection ~ 1350 1600
Wire Wire Line
	1350 1600 1100 1600
Connection ~ 2250 6700
Wire Wire Line
	1500 6700 2250 6700
Wire Wire Line
	1500 7450 1500 6700
$Comp
L Connector:Conn_01x02_Male J3
U 1 1 5F177D21
P 1300 7450
F 0 "J3" H 1406 7628 50  0000 C CNN
F 1 "-20V_IN" H 1406 7537 50  0000 C CNN
F 2 "Connectors_Molex:Molex_SPOX-5267_22-03-5025_02x2.54mm_Straight" H 1300 7450 50  0001 C CNN
F 3 "~" H 1300 7450 50  0001 C CNN
	1    1300 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 4050 1850 4050
$Comp
L Connector:Conn_01x02_Male J10
U 1 1 5F1AF7AD
P 5400 4050
F 0 "J10" H 5506 4228 50  0000 C CNN
F 1 "11V_IN_B" H 5506 4137 50  0000 C CNN
F 2 "Connectors_Molex:Molex_SPOX-5267_22-03-5025_02x2.54mm_Straight" H 5400 4050 50  0001 C CNN
F 3 "~" H 5400 4050 50  0001 C CNN
	1    5400 4050
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J9
U 1 1 5F1AF997
P 4600 4050
F 0 "J9" H 4573 4023 50  0000 R CNN
F 1 "8V_OUT_A" H 4573 3932 50  0000 R CNN
F 2 "Connectors_Molex:Molex_SPOX-5267_22-03-5025_02x2.54mm_Straight" H 4600 4050 50  0001 C CNN
F 3 "~" H 4600 4050 50  0001 C CNN
	1    4600 4050
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J8
U 1 1 5F1B6AE5
P 4500 1600
F 0 "J8" H 4473 1573 50  0000 R CNN
F 1 "18V_OUT_A" H 4473 1482 50  0000 R CNN
F 2 "Connectors_Molex:Molex_SPOX-5267_22-03-5025_02x2.54mm_Straight" H 4500 1600 50  0001 C CNN
F 3 "~" H 4500 1600 50  0001 C CNN
	1    4500 1600
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J12
U 1 1 5F1B6C8D
P 8200 1650
F 0 "J12" H 8172 1623 50  0000 R CNN
F 1 "18V_OUT_B" H 8172 1532 50  0000 R CNN
F 2 "Connectors_Molex:Molex_SPOX-5267_22-03-5025_02x2.54mm_Straight" H 8200 1650 50  0001 C CNN
F 3 "~" H 8200 1650 50  0001 C CNN
	1    8200 1650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8000 1650 7600 1650
Connection ~ 7600 1650
Wire Wire Line
	4300 1600 4050 1600
Connection ~ 4050 1600
Wire Wire Line
	4300 1700 4300 2350
Wire Wire Line
	4300 2350 3900 2350
Connection ~ 3900 2350
Wire Wire Line
	8000 1750 8000 2400
Wire Wire Line
	8000 2400 7450 2400
Connection ~ 7450 2400
$Comp
L Connector:Conn_01x02_Male J13
U 1 1 5F1D3A55
P 8750 4050
F 0 "J13" H 8723 4023 50  0000 R CNN
F 1 "8V_OUT_B" H 8723 3932 50  0000 R CNN
F 2 "Connectors_Molex:Molex_SPOX-5267_22-03-5025_02x2.54mm_Straight" H 8750 4050 50  0001 C CNN
F 3 "~" H 8750 4050 50  0001 C CNN
	1    8750 4050
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J5
U 1 1 5F1D3B8D
P 4250 6000
F 0 "J5" H 4223 5880 50  0000 R CNN
F 1 "-18V_OUT_A" H 4223 5971 50  0000 R CNN
F 2 "Connectors_Molex:Molex_SPOX-5267_22-03-5025_02x2.54mm_Straight" H 4250 6000 50  0001 C CNN
F 3 "~" H 4250 6000 50  0001 C CNN
	1    4250 6000
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x02_Male J4
U 1 1 5F1D3CFD
P 4250 5750
F 0 "J4" H 4222 5630 50  0000 R CNN
F 1 "-18V_OUT_B" H 4222 5721 50  0000 R CNN
F 2 "Connectors_Molex:Molex_SPOX-5267_22-03-5025_02x2.54mm_Straight" H 4250 5750 50  0001 C CNN
F 3 "~" H 4250 5750 50  0001 C CNN
	1    4250 5750
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x02_Male J7
U 1 1 5F1E34CC
P 4250 7550
F 0 "J7" H 4223 7430 50  0000 R CNN
F 1 "-8V_OUT_A" H 4223 7521 50  0000 R CNN
F 2 "Connectors_Molex:Molex_SPOX-5267_22-03-5025_02x2.54mm_Straight" H 4250 7550 50  0001 C CNN
F 3 "~" H 4250 7550 50  0001 C CNN
	1    4250 7550
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x02_Male J6
U 1 1 5F1E34D2
P 4250 7300
F 0 "J6" H 4222 7180 50  0000 R CNN
F 1 "-8V_OUT_B" H 4222 7271 50  0000 R CNN
F 2 "Connectors_Molex:Molex_SPOX-5267_22-03-5025_02x2.54mm_Straight" H 4250 7300 50  0001 C CNN
F 3 "~" H 4250 7300 50  0001 C CNN
	1    4250 7300
	-1   0    0    1   
$EndComp
Wire Wire Line
	2250 6000 1800 6000
Wire Wire Line
	1800 6000 1800 7550
Connection ~ 2250 6000
Connection ~ 1800 7550
Wire Wire Line
	1800 7550 1500 7550
Wire Wire Line
	4400 4800 4050 4800
Connection ~ 4050 4800
Wire Wire Line
	4400 4050 4200 4050
Connection ~ 4200 4050
Wire Wire Line
	8550 4050 8250 4050
Connection ~ 8250 4050
Wire Wire Line
	8550 4150 8550 4800
Wire Wire Line
	8550 4800 8100 4800
Connection ~ 8100 4800
Wire Wire Line
	4050 5900 3850 5900
Wire Wire Line
	3850 5900 3850 5650
Wire Wire Line
	3850 5650 4050 5650
Wire Wire Line
	3850 5650 3850 5150
Wire Wire Line
	3850 5150 3650 5150
Connection ~ 3850 5650
Connection ~ 3650 5150
Wire Wire Line
	4050 7450 3900 7450
Wire Wire Line
	3900 7450 3900 7200
Wire Wire Line
	3900 7200 4050 7200
Wire Wire Line
	4050 6000 3950 6000
Wire Wire Line
	3950 6000 3950 5750
Wire Wire Line
	3950 5750 4050 5750
Wire Wire Line
	4050 7550 4000 7550
Wire Wire Line
	4000 7550 4000 7300
Wire Wire Line
	4000 7300 4050 7300
Wire Wire Line
	3650 7550 4000 7550
Connection ~ 3650 7550
Connection ~ 4000 7550
Wire Wire Line
	3900 7200 3900 6700
Wire Wire Line
	3900 6700 3650 6700
Connection ~ 3900 7200
Connection ~ 3650 6700
Wire Wire Line
	3950 6000 3650 6000
Connection ~ 3950 6000
Connection ~ 3650 6000
Wire Wire Line
	5600 4050 5900 4050
Connection ~ 5900 4050
Wire Wire Line
	5600 4150 5600 4800
Wire Wire Line
	5600 4800 5900 4800
Connection ~ 5900 4800
$Comp
L Connector:Conn_01x02_Male J11
U 1 1 5F271203
P 7750 5550
F 0 "J11" H 7856 5728 50  0000 C CNN
F 1 "5V2_USB_IN" H 7856 5637 50  0000 C CNN
F 2 "Connectors_Molex:Molex_SPOX-5267_22-03-5025_02x2.54mm_Straight" H 7750 5550 50  0001 C CNN
F 3 "~" H 7750 5550 50  0001 C CNN
	1    7750 5550
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C23
U 1 1 5F2713D7
P 8450 5700
F 0 "C23" H 8568 5746 50  0000 L CNN
F 1 "CP" H 8568 5655 50  0000 L CNN
F 2 "Capacitors_SMD:CP_Elec_10x10.5" H 8488 5550 50  0001 C CNN
F 3 "~" H 8450 5700 50  0001 C CNN
	1    8450 5700
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J14
U 1 1 5F2714FF
P 9350 5650
F 0 "J14" H 9322 5623 50  0000 R CNN
F 1 "5V2_USB_OUT_1" H 9322 5532 50  0000 R CNN
F 2 "Connectors_Molex:Molex_SPOX-5267_22-03-5025_02x2.54mm_Straight" H 9350 5650 50  0001 C CNN
F 3 "~" H 9350 5650 50  0001 C CNN
	1    9350 5650
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J15
U 1 1 5F27171D
P 9350 5850
F 0 "J15" H 9322 5823 50  0000 R CNN
F 1 "5V2_USB_OUT_1" H 9322 5732 50  0000 R CNN
F 2 "Connectors_Molex:Molex_SPOX-5267_22-03-5025_02x2.54mm_Straight" H 9350 5850 50  0001 C CNN
F 3 "~" H 9350 5850 50  0001 C CNN
	1    9350 5850
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J16
U 1 1 5F2717B7
P 9350 6050
F 0 "J16" H 9322 6023 50  0000 R CNN
F 1 "5V2_USB_OUT_1" H 9322 5932 50  0000 R CNN
F 2 "Connectors_Molex:Molex_SPOX-5267_22-03-5025_02x2.54mm_Straight" H 9350 6050 50  0001 C CNN
F 3 "~" H 9350 6050 50  0001 C CNN
	1    9350 6050
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J17
U 1 1 5F271851
P 9350 6250
F 0 "J17" H 9322 6223 50  0000 R CNN
F 1 "5V2_USB_OUT_1" H 9322 6132 50  0000 R CNN
F 2 "Connectors_Molex:Molex_SPOX-5267_22-03-5025_02x2.54mm_Straight" H 9350 6250 50  0001 C CNN
F 3 "~" H 9350 6250 50  0001 C CNN
	1    9350 6250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9150 6350 8900 6350
Wire Wire Line
	8900 6350 8900 6150
Wire Wire Line
	8900 5750 9150 5750
Wire Wire Line
	9150 6250 9000 6250
Wire Wire Line
	9000 6250 9000 6050
Wire Wire Line
	9000 5650 9150 5650
Wire Wire Line
	9150 5850 9000 5850
Connection ~ 9000 5850
Wire Wire Line
	9000 5850 9000 5650
Wire Wire Line
	9150 5950 8900 5950
Connection ~ 8900 5950
Wire Wire Line
	8900 5950 8900 5850
Wire Wire Line
	9150 6050 9000 6050
Connection ~ 9000 6050
Wire Wire Line
	9000 6050 9000 5850
Wire Wire Line
	9150 6150 8900 6150
Connection ~ 8900 6150
Wire Wire Line
	8900 6150 8900 5950
Wire Wire Line
	9000 5650 9000 5550
Wire Wire Line
	9000 5550 8450 5550
Connection ~ 9000 5650
Wire Wire Line
	7950 5550 8450 5550
Connection ~ 8450 5550
Wire Wire Line
	7950 5650 7950 5850
Wire Wire Line
	7950 5850 8300 5850
Wire Wire Line
	8450 5850 8900 5850
Connection ~ 8450 5850
Connection ~ 8900 5850
Wire Wire Line
	8900 5850 8900 5750
Wire Wire Line
	4400 4150 4400 4800
$Comp
L power:GND #PWR?
U 1 1 5F35A827
P 8300 5850
F 0 "#PWR?" H 8300 5600 50  0001 C CNN
F 1 "GND" H 8305 5677 50  0000 C CNN
F 2 "" H 8300 5850 50  0001 C CNN
F 3 "" H 8300 5850 50  0001 C CNN
	1    8300 5850
	1    0    0    -1  
$EndComp
Connection ~ 8300 5850
Wire Wire Line
	8300 5850 8450 5850
$EndSCHEMATC