EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:Mr.Robot Schematics-cache
EELAYER 25 0
EELAYER END
$Descr USLetter 11000 8500
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
NoConn ~ 7200 -150
$Comp
L +5V #PWR01
U 1 1 5AD74DE3
P 8700 1750
F 0 "#PWR01" H 8700 1600 50  0001 C CNN
F 1 "+5V" H 8700 1890 50  0000 C CNN
F 2 "" H 8700 1750 50  0001 C CNN
F 3 "" H 8700 1750 50  0001 C CNN
	1    8700 1750
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR02
U 1 1 5AD74E09
P 7000 3650
F 0 "#PWR02" H 7000 3400 50  0001 C CNN
F 1 "Earth" H 7000 3500 50  0001 C CNN
F 2 "" H 7000 3650 50  0001 C CNN
F 3 "" H 7000 3650 50  0001 C CNN
	1    7000 3650
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5AD74EF2
P 6350 1700
F 0 "R1" V 6430 1700 50  0000 C CNN
F 1 "680" V 6350 1700 50  0000 C CNN
F 2 "" V 6280 1700 50  0001 C CNN
F 3 "" H 6350 1700 50  0001 C CNN
	1    6350 1700
	0    1    1    0   
$EndComp
$Comp
L LED_ARGB D?
U 1 1 5AD74FD2
P 8500 2300
F 0 "D?" H 8500 2670 50  0000 C CNN
F 1 "LED_ARGB" H 8500 1950 50  0000 C CNN
F 2 "" H 8500 2250 50  0001 C CNN
F 3 "" H 8500 2250 50  0001 C CNN
	1    8500 2300
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 5AD7507F
P 7750 1500
F 0 "R4" V 7830 1500 50  0000 C CNN
F 1 "18" V 7750 1500 50  0000 C CNN
F 2 "" V 7680 1500 50  0001 C CNN
F 3 "" H 7750 1500 50  0001 C CNN
	1    7750 1500
	0    1    1    0   
$EndComp
$Comp
L Q_NPN_CBE T3
U 1 1 5AD7525B
P 6900 3300
F 0 "T3" H 7100 3350 50  0000 L CNN
F 1 "2N2222A" H 7100 3250 50  0000 L CNN
F 2 "" H 7100 3400 50  0001 C CNN
F 3 "" H 6900 3300 50  0001 C CNN
	1    6900 3300
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 5AD754D8
P 7750 2200
F 0 "R6" V 7830 2200 50  0000 C CNN
F 1 "10" V 7750 2200 50  0000 C CNN
F 2 "" V 7680 2200 50  0001 C CNN
F 3 "" H 7750 2200 50  0001 C CNN
	1    7750 2200
	0    1    1    0   
$EndComp
$Comp
L Q_NPN_CBE T1
U 1 1 5AD7562F
P 6900 1700
F 0 "T1" H 7100 1750 50  0000 L CNN
F 1 "2N2222A" H 7100 1650 50  0000 L CNN
F 2 "" H 7100 1800 50  0001 C CNN
F 3 "" H 6900 1700 50  0001 C CNN
	1    6900 1700
	1    0    0    -1  
$EndComp
$Comp
L Q_NPN_CBE T2
U 1 1 5AD756AB
P 6900 2500
F 0 "T2" H 7100 2550 50  0000 L CNN
F 1 "2N2222A" H 7100 2450 50  0000 L CNN
F 2 "" H 7100 2600 50  0001 C CNN
F 3 "" H 6900 2500 50  0001 C CNN
	1    6900 2500
	1    0    0    -1  
$EndComp
Text GLabel 5650 1700 0    60   Input ~ 12
GPIO5-RED
Text GLabel 5650 2500 0    60   Input ~ 12
GPIO26-GREEN
Text GLabel 5650 3300 0    60   Input ~ 12
GPIO6-BLUE
$Comp
L R R2
U 1 1 5B204BD1
P 6350 2500
F 0 "R2" V 6430 2500 50  0000 C CNN
F 1 "680" V 6350 2500 50  0000 C CNN
F 2 "" V 6280 2500 50  0001 C CNN
F 3 "" H 6350 2500 50  0001 C CNN
	1    6350 2500
	0    1    1    0   
$EndComp
$Comp
L R R3
U 1 1 5B204C02
P 6350 3300
F 0 "R3" V 6430 3300 50  0000 C CNN
F 1 "680" V 6350 3300 50  0000 C CNN
F 2 "" V 6280 3300 50  0001 C CNN
F 3 "" H 6350 3300 50  0001 C CNN
	1    6350 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	8700 1750 8700 2300
Wire Wire Line
	7000 2300 7600 2300
Wire Wire Line
	7600 1500 7000 1500
$Comp
L R R5
U 1 1 5B207E79
P 7750 1700
F 0 "R5" V 7830 1700 50  0000 C CNN
F 1 "18" V 7750 1700 50  0000 C CNN
F 2 "" V 7680 1700 50  0001 C CNN
F 3 "" H 7750 1700 50  0001 C CNN
	1    7750 1700
	0    1    1    0   
$EndComp
$Comp
L R R7
U 1 1 5B20829F
P 7750 2400
F 0 "R7" V 7830 2400 50  0000 C CNN
F 1 "10" V 7750 2400 50  0000 C CNN
F 2 "" V 7680 2400 50  0001 C CNN
F 3 "" H 7750 2400 50  0001 C CNN
	1    7750 2400
	0    1    1    0   
$EndComp
Wire Wire Line
	7600 2200 7600 2400
Wire Wire Line
	7600 1700 7600 1500
Wire Wire Line
	7900 1700 7900 1500
Wire Wire Line
	7900 2200 7900 2400
Connection ~ 7900 2300
Connection ~ 7600 2300
Connection ~ 7900 1700
Connection ~ 7600 1500
$Comp
L R R8
U 1 1 5B2087E5
P 7750 3000
F 0 "R8" V 7830 3000 50  0000 C CNN
F 1 "10" V 7750 3000 50  0000 C CNN
F 2 "" V 7680 3000 50  0001 C CNN
F 3 "" H 7750 3000 50  0001 C CNN
	1    7750 3000
	0    1    1    0   
$EndComp
$Comp
L R R9
U 1 1 5B208829
P 7750 3200
F 0 "R9" V 7830 3200 50  0000 C CNN
F 1 "10" V 7750 3200 50  0000 C CNN
F 2 "" V 7680 3200 50  0001 C CNN
F 3 "" H 7750 3200 50  0001 C CNN
	1    7750 3200
	0    1    1    0   
$EndComp
Wire Wire Line
	7900 3000 7900 3200
Connection ~ 7900 3000
Connection ~ 7600 3100
Wire Wire Line
	7600 3000 7600 3200
Wire Wire Line
	7000 3100 7600 3100
$Comp
L R R10
U 1 1 5BC73123
P 5900 1850
F 0 "R10" V 5980 1850 50  0000 C CNN
F 1 "1k" V 5900 1850 50  0000 C CNN
F 2 "" V 5830 1850 50  0001 C CNN
F 3 "" H 5900 1850 50  0001 C CNN
	1    5900 1850
	1    0    0    -1  
$EndComp
$Comp
L R R11
U 1 1 5BC735C1
P 5900 2650
F 0 "R11" V 5980 2650 50  0000 C CNN
F 1 "1k" V 5900 2650 50  0000 C CNN
F 2 "" V 5830 2650 50  0001 C CNN
F 3 "" H 5900 2650 50  0001 C CNN
	1    5900 2650
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR?
U 1 1 5BC7377B
P 5900 2150
F 0 "#PWR?" H 5900 1900 50  0001 C CNN
F 1 "Earth" V 5900 2000 50  0001 C CNN
F 2 "" H 5900 2150 50  0001 C CNN
F 3 "" H 5900 2150 50  0001 C CNN
	1    5900 2150
	1    0    0    -1  
$EndComp
$Comp
L R R12
U 1 1 5BC73AB5
P 5900 3450
F 0 "R12" V 5980 3450 50  0000 C CNN
F 1 "1k" V 5900 3450 50  0000 C CNN
F 2 "" V 5830 3450 50  0001 C CNN
F 3 "" H 5900 3450 50  0001 C CNN
	1    5900 3450
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR?
U 1 1 5BC73B46
P 5900 2950
F 0 "#PWR?" H 5900 2700 50  0001 C CNN
F 1 "Earth" V 5900 2800 50  0001 C CNN
F 2 "" H 5900 2950 50  0001 C CNN
F 3 "" H 5900 2950 50  0001 C CNN
	1    5900 2950
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR?
U 1 1 5BC73B81
P 5900 3750
F 0 "#PWR?" H 5900 3500 50  0001 C CNN
F 1 "Earth" V 5900 3600 50  0001 C CNN
F 2 "" H 5900 3750 50  0001 C CNN
F 3 "" H 5900 3750 50  0001 C CNN
	1    5900 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 1700 6200 1700
Wire Wire Line
	5650 2500 6200 2500
Wire Wire Line
	5650 3300 6200 3300
Wire Wire Line
	6500 1700 6700 1700
Wire Wire Line
	6500 2500 6700 2500
Wire Wire Line
	6500 3300 6700 3300
Wire Wire Line
	7900 1700 8150 1700
Wire Wire Line
	8150 1700 8150 2100
Wire Wire Line
	8150 2100 8300 2100
Wire Wire Line
	7900 2300 8300 2300
Wire Wire Line
	7900 3000 8150 3000
Wire Wire Line
	8150 3000 8150 2500
Wire Wire Line
	8150 2500 8300 2500
$Comp
L Earth #PWR?
U 1 1 5BC743EF
P 7000 2850
F 0 "#PWR?" H 7000 2600 50  0001 C CNN
F 1 "Earth" H 7000 2700 50  0001 C CNN
F 2 "" H 7000 2850 50  0001 C CNN
F 3 "" H 7000 2850 50  0001 C CNN
	1    7000 2850
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR?
U 1 1 5BC7442A
P 7000 2100
F 0 "#PWR?" H 7000 1850 50  0001 C CNN
F 1 "Earth" H 7000 1950 50  0001 C CNN
F 2 "" H 7000 2100 50  0001 C CNN
F 3 "" H 7000 2100 50  0001 C CNN
	1    7000 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 1900 7000 2100
Wire Wire Line
	7000 2700 7000 2850
Wire Wire Line
	7000 3500 7000 3650
Wire Wire Line
	5900 3750 5900 3600
Wire Wire Line
	5900 2950 5900 2800
Wire Wire Line
	5900 2150 5900 2000
$EndSCHEMATC
