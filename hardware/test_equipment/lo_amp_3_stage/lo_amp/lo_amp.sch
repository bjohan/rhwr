EESchema Schematic File Version 4
LIBS:lo_amp-cache
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
L grf_3042:GRF3042 U1
U 1 1 5E9748C4
P 2500 3700
F 0 "U1" H 2700 4025 50  0000 C CNN
F 1 "GRF3042" H 2700 3934 50  0000 C CNN
F 2 "footprints:grf3042" H 2500 3700 50  0001 C CNN
F 3 "" H 2500 3700 50  0001 C CNN
	1    2500 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5E9749B0
P 3350 3250
F 0 "R2" H 3420 3296 50  0000 L CNN
F 1 "12" H 3420 3205 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" V 3280 3250 50  0001 C CNN
F 3 "~" H 3350 3250 50  0001 C CNN
	1    3350 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5E974A8A
P 1900 3650
F 0 "R1" H 1970 3696 50  0000 L CNN
F 1 "1k67" H 1970 3605 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" V 1830 3650 50  0001 C CNN
F 3 "~" H 1900 3650 50  0001 C CNN
	1    1900 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5E974B14
P 3700 3450
F 0 "C3" V 3448 3450 50  0000 C CNN
F 1 "100n" V 3539 3450 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" H 3738 3300 50  0001 C CNN
F 3 "~" H 3700 3450 50  0001 C CNN
	1    3700 3450
	0    1    1    0   
$EndComp
$Comp
L Device:L L1
U 1 1 5E974BF6
P 3350 3650
F 0 "L1" H 3403 3696 50  0000 L CNN
F 1 "200n" H 3403 3605 50  0000 L CNN
F 2 "Resistors_SMD:R_0402" H 3350 3650 50  0001 C CNN
F 3 "~" H 3350 3650 50  0001 C CNN
	1    3350 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5E974CA8
P 10200 3800
F 0 "C4" V 9948 3800 50  0000 C CNN
F 1 "10p" V 10039 3800 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" H 10238 3650 50  0001 C CNN
F 3 "~" H 10200 3800 50  0001 C CNN
	1    10200 3800
	0    1    1    0   
$EndComp
$Comp
L Device:C C1
U 1 1 5E974D02
P 1150 3800
F 0 "C1" V 898 3800 50  0000 C CNN
F 1 "10p" V 989 3800 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" H 1188 3650 50  0001 C CNN
F 3 "~" H 1150 3800 50  0001 C CNN
	1    1150 3800
	0    1    1    0   
$EndComp
Wire Wire Line
	3350 3800 3200 3800
Wire Wire Line
	3350 3400 3350 3450
Wire Wire Line
	3550 3450 3350 3450
Connection ~ 3350 3450
Wire Wire Line
	3350 3450 3350 3500
Wire Wire Line
	1900 3800 2200 3800
Wire Wire Line
	1900 3500 1900 3450
Wire Wire Line
	1900 3450 3350 3450
$Comp
L Device:C C2
U 1 1 5E974E2C
P 5400 1650
F 0 "C2" V 5148 1650 50  0000 C CNN
F 1 "50u" V 5239 1650 50  0000 C CNN
F 2 "Capacitors_SMD:CP_Elec_10x10.5" H 5438 1500 50  0001 C CNN
F 3 "~" H 5400 1650 50  0001 C CNN
	1    5400 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5E974E82
P 2650 4250
F 0 "#PWR0101" H 2650 4000 50  0001 C CNN
F 1 "GND" H 2655 4077 50  0000 C CNN
F 2 "" H 2650 4250 50  0001 C CNN
F 3 "" H 2650 4250 50  0001 C CNN
	1    2650 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5E974EA4
P 5650 1900
F 0 "#PWR0102" H 5650 1650 50  0001 C CNN
F 1 "GND" H 5655 1727 50  0000 C CNN
F 2 "" H 5650 1900 50  0001 C CNN
F 3 "" H 5650 1900 50  0001 C CNN
	1    5650 1900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5E974EBF
P 4850 1600
F 0 "#PWR0103" H 4850 1350 50  0001 C CNN
F 1 "GND" H 4855 1427 50  0000 C CNN
F 2 "" H 4850 1600 50  0001 C CNN
F 3 "" H 4850 1600 50  0001 C CNN
	1    4850 1600
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 5E975029
P 4550 1500
F 0 "J2" H 4656 1678 50  0000 C CNN
F 1 "Conn_01x02_Male" H 4656 1587 50  0000 C CNN
F 2 "Connectors_Molex:Molex_KK-6410-02_02x2.54mm_Straight" H 4550 1500 50  0001 C CNN
F 3 "~" H 4550 1500 50  0001 C CNN
	1    4550 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 1600 4850 1600
$Comp
L Connector:Conn_Coaxial J3
U 1 1 5E9752CE
P 10700 3800
F 0 "J3" H 10799 3776 50  0000 L CNN
F 1 "Conn_Coaxial" H 10799 3685 50  0000 L CNN
F 2 "Connectors_Molex:Molex_SMA_Jack_Edge_Mount" H 10700 3800 50  0001 C CNN
F 3 " ~" H 10700 3800 50  0001 C CNN
	1    10700 3800
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_Coaxial J1
U 1 1 5E97536C
P 700 3800
F 0 "J1" H 630 4038 50  0000 C CNN
F 1 "Conn_Coaxial" H 630 3947 50  0000 C CNN
F 2 "Connectors_Molex:Molex_SMA_Jack_Edge_Mount" H 700 3800 50  0001 C CNN
F 3 " ~" H 700 3800 50  0001 C CNN
	1    700  3800
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5E975460
P 10700 4150
F 0 "#PWR0104" H 10700 3900 50  0001 C CNN
F 1 "GND" H 10705 3977 50  0000 C CNN
F 2 "" H 10700 4150 50  0001 C CNN
F 3 "" H 10700 4150 50  0001 C CNN
	1    10700 4150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5E975481
P 700 4150
F 0 "#PWR0105" H 700 3900 50  0001 C CNN
F 1 "GND" H 705 3977 50  0000 C CNN
F 2 "" H 700 4150 50  0001 C CNN
F 3 "" H 700 4150 50  0001 C CNN
	1    700  4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10700 4150 10700 4000
Wire Wire Line
	10500 3800 10350 3800
Wire Wire Line
	2650 4150 2650 4250
Wire Wire Line
	900  3800 1000 3800
Wire Wire Line
	700  4000 700  4150
$Comp
L power:GND #PWR0106
U 1 1 5E975B89
P 2100 3600
F 0 "#PWR0106" H 2100 3350 50  0001 C CNN
F 1 "GND" H 2105 3427 50  0000 C CNN
F 2 "" H 2100 3600 50  0001 C CNN
F 3 "" H 2100 3600 50  0001 C CNN
	1    2100 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5E975BAA
P 3300 3600
F 0 "#PWR0107" H 3300 3350 50  0001 C CNN
F 1 "GND" H 3305 3427 50  0000 C CNN
F 2 "" H 3300 3600 50  0001 C CNN
F 3 "" H 3300 3600 50  0001 C CNN
	1    3300 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 3700 3200 3600
Wire Wire Line
	3200 3600 3300 3600
Connection ~ 3200 3600
Wire Wire Line
	2200 3700 2200 3600
Wire Wire Line
	2200 3600 2100 3600
Connection ~ 2200 3600
$Comp
L power:GND #PWR0108
U 1 1 5E97665E
P 4100 3450
F 0 "#PWR0108" H 4100 3200 50  0001 C CNN
F 1 "GND" H 4105 3277 50  0000 C CNN
F 2 "" H 4100 3450 50  0001 C CNN
F 3 "" H 4100 3450 50  0001 C CNN
	1    4100 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 3450 3850 3450
$Comp
L Device:C C5
U 1 1 5E976B60
P 1750 3450
F 0 "C5" V 1498 3450 50  0000 C CNN
F 1 "100n" V 1589 3450 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" H 1788 3300 50  0001 C CNN
F 3 "~" H 1750 3450 50  0001 C CNN
	1    1750 3450
	0    1    1    0   
$EndComp
Connection ~ 1900 3450
$Comp
L power:GND #PWR0109
U 1 1 5E976BE6
P 1400 3450
F 0 "#PWR0109" H 1400 3200 50  0001 C CNN
F 1 "GND" H 1405 3277 50  0000 C CNN
F 2 "" H 1400 3450 50  0001 C CNN
F 3 "" H 1400 3450 50  0001 C CNN
	1    1400 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 3450 1600 3450
$Comp
L Regulator_Linear:L7805 U3
U 1 1 5EE7D624
P 6200 1500
F 0 "U3" H 6200 1742 50  0000 C CNN
F 1 "L7805" H 6200 1651 50  0000 C CNN
F 2 "Power_Integrations:TO-220" H 6225 1350 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 6200 1450 50  0001 C CNN
	1    6200 1500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5EE7E617
P 6200 1900
F 0 "#PWR0110" H 6200 1650 50  0001 C CNN
F 1 "GND" H 6205 1727 50  0000 C CNN
F 2 "" H 6200 1900 50  0001 C CNN
F 3 "" H 6200 1900 50  0001 C CNN
	1    6200 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 1800 5650 1900
Wire Wire Line
	6200 1800 6200 1900
$Comp
L Device:C C11
U 1 1 5EE7EC5D
P 7200 1650
F 0 "C11" V 6948 1650 50  0000 C CNN
F 1 "50u" V 7039 1650 50  0000 C CNN
F 2 "Capacitors_SMD:CP_Elec_10x10.5" H 7238 1500 50  0001 C CNN
F 3 "~" H 7200 1650 50  0001 C CNN
	1    7200 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C9
U 1 1 5EE7ECD1
P 6700 1650
F 0 "C9" V 6448 1650 50  0000 C CNN
F 1 "100n" V 6539 1650 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" H 6738 1500 50  0001 C CNN
F 3 "~" H 6700 1650 50  0001 C CNN
	1    6700 1650
	-1   0    0    1   
$EndComp
Connection ~ 5400 1500
Wire Wire Line
	5400 1500 4750 1500
Wire Wire Line
	5400 1500 5650 1500
$Comp
L Device:C C8
U 1 1 5EE7F181
P 5650 1650
F 0 "C8" V 5398 1650 50  0000 C CNN
F 1 "100n" V 5489 1650 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" H 5688 1500 50  0001 C CNN
F 3 "~" H 5650 1650 50  0001 C CNN
	1    5650 1650
	-1   0    0    1   
$EndComp
Connection ~ 5650 1500
Wire Wire Line
	5650 1500 5900 1500
$Comp
L power:GND #PWR0111
U 1 1 5EE7F535
P 5400 1900
F 0 "#PWR0111" H 5400 1650 50  0001 C CNN
F 1 "GND" H 5405 1727 50  0000 C CNN
F 2 "" H 5400 1900 50  0001 C CNN
F 3 "" H 5400 1900 50  0001 C CNN
	1    5400 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 1800 5400 1900
$Comp
L power:GND #PWR0112
U 1 1 5EE7F894
P 6700 1900
F 0 "#PWR0112" H 6700 1650 50  0001 C CNN
F 1 "GND" H 6705 1727 50  0000 C CNN
F 2 "" H 6700 1900 50  0001 C CNN
F 3 "" H 6700 1900 50  0001 C CNN
	1    6700 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 1800 6700 1900
$Comp
L power:GND #PWR0113
U 1 1 5EE7FC17
P 7200 1900
F 0 "#PWR0113" H 7200 1650 50  0001 C CNN
F 1 "GND" H 7205 1727 50  0000 C CNN
F 2 "" H 7200 1900 50  0001 C CNN
F 3 "" H 7200 1900 50  0001 C CNN
	1    7200 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 1800 7200 1900
Wire Wire Line
	7200 1500 6950 1500
Connection ~ 6700 1500
Wire Wire Line
	6700 1500 6500 1500
$Comp
L power:+5V #PWR0114
U 1 1 5EE803AD
P 6950 1500
F 0 "#PWR0114" H 6950 1350 50  0001 C CNN
F 1 "+5V" H 6965 1673 50  0000 C CNN
F 2 "" H 6950 1500 50  0001 C CNN
F 3 "" H 6950 1500 50  0001 C CNN
	1    6950 1500
	1    0    0    -1  
$EndComp
Connection ~ 6950 1500
Wire Wire Line
	6950 1500 6700 1500
Wire Wire Line
	3350 3100 3350 3000
$Comp
L power:+5V #PWR0115
U 1 1 5EE81AE7
P 3350 3000
F 0 "#PWR0115" H 3350 2850 50  0001 C CNN
F 1 "+5V" H 3365 3173 50  0000 C CNN
F 2 "" H 3350 3000 50  0001 C CNN
F 3 "" H 3350 3000 50  0001 C CNN
	1    3350 3000
	1    0    0    -1  
$EndComp
$Comp
L grf_3042:GRF3042 U2
U 1 1 5EE830B3
P 5500 3700
F 0 "U2" H 5700 4025 50  0000 C CNN
F 1 "GRF3042" H 5700 3934 50  0000 C CNN
F 2 "footprints:grf3042" H 5500 3700 50  0001 C CNN
F 3 "" H 5500 3700 50  0001 C CNN
	1    5500 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5EE830B9
P 6350 3250
F 0 "R4" H 6420 3296 50  0000 L CNN
F 1 "12" H 6420 3205 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" V 6280 3250 50  0001 C CNN
F 3 "~" H 6350 3250 50  0001 C CNN
	1    6350 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5EE830BF
P 4900 3650
F 0 "R3" H 4970 3696 50  0000 L CNN
F 1 "1k67" H 4970 3605 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" V 4830 3650 50  0001 C CNN
F 3 "~" H 4900 3650 50  0001 C CNN
	1    4900 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C10
U 1 1 5EE830C5
P 6700 3450
F 0 "C10" V 6448 3450 50  0000 C CNN
F 1 "100n" V 6539 3450 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" H 6738 3300 50  0001 C CNN
F 3 "~" H 6700 3450 50  0001 C CNN
	1    6700 3450
	0    1    1    0   
$EndComp
$Comp
L Device:L L2
U 1 1 5EE830CB
P 6350 3650
F 0 "L2" H 6403 3696 50  0000 L CNN
F 1 "200n" H 6403 3605 50  0000 L CNN
F 2 "Resistors_SMD:R_0402" H 6350 3650 50  0001 C CNN
F 3 "~" H 6350 3650 50  0001 C CNN
	1    6350 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 3800 6200 3800
Wire Wire Line
	6350 3400 6350 3450
Wire Wire Line
	6550 3450 6350 3450
Connection ~ 6350 3450
Wire Wire Line
	6350 3450 6350 3500
Wire Wire Line
	4900 3800 5200 3800
Wire Wire Line
	4900 3500 4900 3450
Wire Wire Line
	4900 3450 6350 3450
$Comp
L power:GND #PWR0116
U 1 1 5EE830D9
P 5650 4250
F 0 "#PWR0116" H 5650 4000 50  0001 C CNN
F 1 "GND" H 5655 4077 50  0000 C CNN
F 2 "" H 5650 4250 50  0001 C CNN
F 3 "" H 5650 4250 50  0001 C CNN
	1    5650 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 4150 5650 4250
$Comp
L power:GND #PWR0117
U 1 1 5EE830E0
P 5100 3600
F 0 "#PWR0117" H 5100 3350 50  0001 C CNN
F 1 "GND" H 5105 3427 50  0000 C CNN
F 2 "" H 5100 3600 50  0001 C CNN
F 3 "" H 5100 3600 50  0001 C CNN
	1    5100 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 5EE830E6
P 6300 3600
F 0 "#PWR0118" H 6300 3350 50  0001 C CNN
F 1 "GND" H 6305 3427 50  0000 C CNN
F 2 "" H 6300 3600 50  0001 C CNN
F 3 "" H 6300 3600 50  0001 C CNN
	1    6300 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 3700 6200 3600
Wire Wire Line
	6200 3600 6300 3600
Connection ~ 6200 3600
Wire Wire Line
	5200 3700 5200 3600
Wire Wire Line
	5200 3600 5100 3600
Connection ~ 5200 3600
$Comp
L power:GND #PWR0119
U 1 1 5EE830F2
P 7100 3450
F 0 "#PWR0119" H 7100 3200 50  0001 C CNN
F 1 "GND" H 7105 3277 50  0000 C CNN
F 2 "" H 7100 3450 50  0001 C CNN
F 3 "" H 7100 3450 50  0001 C CNN
	1    7100 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 3450 6850 3450
$Comp
L Device:C C7
U 1 1 5EE830F9
P 4750 3450
F 0 "C7" V 4498 3450 50  0000 C CNN
F 1 "100n" V 4589 3450 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" H 4788 3300 50  0001 C CNN
F 3 "~" H 4750 3450 50  0001 C CNN
	1    4750 3450
	0    1    1    0   
$EndComp
Connection ~ 4900 3450
$Comp
L power:GND #PWR0120
U 1 1 5EE83100
P 4400 3450
F 0 "#PWR0120" H 4400 3200 50  0001 C CNN
F 1 "GND" H 4405 3277 50  0000 C CNN
F 2 "" H 4400 3450 50  0001 C CNN
F 3 "" H 4400 3450 50  0001 C CNN
	1    4400 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 3450 4600 3450
Wire Wire Line
	6350 3100 6350 3000
$Comp
L power:+5V #PWR0121
U 1 1 5EE83108
P 6350 3000
F 0 "#PWR0121" H 6350 2850 50  0001 C CNN
F 1 "+5V" H 6365 3173 50  0000 C CNN
F 2 "" H 6350 3000 50  0001 C CNN
F 3 "" H 6350 3000 50  0001 C CNN
	1    6350 3000
	1    0    0    -1  
$EndComp
$Comp
L grf_3042:GRF3042 U4
U 1 1 5EE856D2
P 8450 3700
F 0 "U4" H 8650 4025 50  0000 C CNN
F 1 "GRF3042" H 8650 3934 50  0000 C CNN
F 2 "footprints:grf3042" H 8450 3700 50  0001 C CNN
F 3 "" H 8450 3700 50  0001 C CNN
	1    8450 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5EE856D8
P 9300 3250
F 0 "R6" H 9370 3296 50  0000 L CNN
F 1 "12" H 9370 3205 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" V 9230 3250 50  0001 C CNN
F 3 "~" H 9300 3250 50  0001 C CNN
	1    9300 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5EE856DE
P 7850 3650
F 0 "R5" H 7920 3696 50  0000 L CNN
F 1 "1k67" H 7920 3605 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" V 7780 3650 50  0001 C CNN
F 3 "~" H 7850 3650 50  0001 C CNN
	1    7850 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C14
U 1 1 5EE856E4
P 9650 3450
F 0 "C14" V 9398 3450 50  0000 C CNN
F 1 "100n" V 9489 3450 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" H 9688 3300 50  0001 C CNN
F 3 "~" H 9650 3450 50  0001 C CNN
	1    9650 3450
	0    1    1    0   
$EndComp
$Comp
L Device:L L3
U 1 1 5EE856EA
P 9300 3650
F 0 "L3" H 9353 3696 50  0000 L CNN
F 1 "200n" H 9353 3605 50  0000 L CNN
F 2 "Resistors_SMD:R_0402" H 9300 3650 50  0001 C CNN
F 3 "~" H 9300 3650 50  0001 C CNN
	1    9300 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 3800 9150 3800
Wire Wire Line
	9300 3400 9300 3450
Wire Wire Line
	9500 3450 9300 3450
Connection ~ 9300 3450
Wire Wire Line
	9300 3450 9300 3500
Wire Wire Line
	7850 3800 8150 3800
Wire Wire Line
	7850 3500 7850 3450
Wire Wire Line
	7850 3450 9300 3450
$Comp
L power:GND #PWR0122
U 1 1 5EE856F8
P 8600 4250
F 0 "#PWR0122" H 8600 4000 50  0001 C CNN
F 1 "GND" H 8605 4077 50  0000 C CNN
F 2 "" H 8600 4250 50  0001 C CNN
F 3 "" H 8600 4250 50  0001 C CNN
	1    8600 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 4150 8600 4250
$Comp
L power:GND #PWR0123
U 1 1 5EE856FF
P 8050 3600
F 0 "#PWR0123" H 8050 3350 50  0001 C CNN
F 1 "GND" H 8055 3427 50  0000 C CNN
F 2 "" H 8050 3600 50  0001 C CNN
F 3 "" H 8050 3600 50  0001 C CNN
	1    8050 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0124
U 1 1 5EE85705
P 9250 3600
F 0 "#PWR0124" H 9250 3350 50  0001 C CNN
F 1 "GND" H 9255 3427 50  0000 C CNN
F 2 "" H 9250 3600 50  0001 C CNN
F 3 "" H 9250 3600 50  0001 C CNN
	1    9250 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 3700 9150 3600
Wire Wire Line
	9150 3600 9250 3600
Connection ~ 9150 3600
Wire Wire Line
	8150 3700 8150 3600
Wire Wire Line
	8150 3600 8050 3600
Connection ~ 8150 3600
$Comp
L power:GND #PWR0125
U 1 1 5EE85711
P 10050 3450
F 0 "#PWR0125" H 10050 3200 50  0001 C CNN
F 1 "GND" H 10055 3277 50  0000 C CNN
F 2 "" H 10050 3450 50  0001 C CNN
F 3 "" H 10050 3450 50  0001 C CNN
	1    10050 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 3450 9800 3450
$Comp
L Device:C C13
U 1 1 5EE85718
P 7700 3450
F 0 "C13" V 7448 3450 50  0000 C CNN
F 1 "100n" V 7539 3450 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" H 7738 3300 50  0001 C CNN
F 3 "~" H 7700 3450 50  0001 C CNN
	1    7700 3450
	0    1    1    0   
$EndComp
Connection ~ 7850 3450
$Comp
L power:GND #PWR0126
U 1 1 5EE8571F
P 7350 3450
F 0 "#PWR0126" H 7350 3200 50  0001 C CNN
F 1 "GND" H 7355 3277 50  0000 C CNN
F 2 "" H 7350 3450 50  0001 C CNN
F 3 "" H 7350 3450 50  0001 C CNN
	1    7350 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 3450 7550 3450
Wire Wire Line
	9300 3100 9300 3000
$Comp
L power:+5V #PWR0127
U 1 1 5EE85727
P 9300 3000
F 0 "#PWR0127" H 9300 2850 50  0001 C CNN
F 1 "+5V" H 9315 3173 50  0000 C CNN
F 2 "" H 9300 3000 50  0001 C CNN
F 3 "" H 9300 3000 50  0001 C CNN
	1    9300 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 5EE86450
P 4300 3800
F 0 "C6" V 4048 3800 50  0000 C CNN
F 1 "10p" V 4139 3800 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" H 4338 3650 50  0001 C CNN
F 3 "~" H 4300 3800 50  0001 C CNN
	1    4300 3800
	0    1    1    0   
$EndComp
$Comp
L Device:C C12
U 1 1 5EE8651C
P 7250 3800
F 0 "C12" V 6998 3800 50  0000 C CNN
F 1 "10p" V 7089 3800 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" H 7288 3650 50  0001 C CNN
F 3 "~" H 7250 3800 50  0001 C CNN
	1    7250 3800
	0    1    1    0   
$EndComp
Wire Wire Line
	1300 3800 1900 3800
Connection ~ 1900 3800
Wire Wire Line
	3350 3800 4150 3800
Connection ~ 3350 3800
Wire Wire Line
	4450 3800 4900 3800
Connection ~ 4900 3800
Wire Wire Line
	6350 3800 7100 3800
Connection ~ 6350 3800
Wire Wire Line
	7400 3800 7850 3800
Connection ~ 7850 3800
Wire Wire Line
	9300 3800 10050 3800
Connection ~ 9300 3800
$EndSCHEMATC
