#!/usr/bin/env python3
import RPi.GPIO as GPIO #Imports RPi for GPIO Use (Comment/Uncomment to use)
import drivers # Imports Custom LCD Display Driver
import struct # Imports structure function
import time # Imports time function
from time import sleep # Imports sleep function from time module
disp = drivers.Lcd() # Initializes LCD Display

BeepPin=13
ALedPin=6

MORSECODE = {
	'A':'01', 'B':'1000', 'C':'1010', 'D':'100', 'E':'0', 'F':'0010', 'G':'110',
	'H':'0000', 'I':'00', 'J':'0111', 'K':'101', 'L':'0100', 'M':'11', 'N':'10',
	'O':'111', 'P':'0110', 'Q':'1101', 'R':'010', 'S':'000', 'T':'1',
	'U':'001', 'V':'0001', 'W':'011', 'X':'1001', 'Y':'1011', 'Z':'1100',
	'1':'01111', '2':'00111', '3':'00011', '4':'00001', '5':'00000',
	'6':'10000', '7':'11000', '8':'11100', '9':'11110', '0':'11111',
	'?':'001100', '/':'10010', ',':'110011', '.':'010101', ';':'101010',
	'!':'101011', '@':'011010', ':':'111000',
	}

def setup():
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(BeepPin, GPIO.OUT, initial=GPIO.LOW)
    GPIO.setup(ALedPin,GPIO.OUT,initial=GPIO.LOW)

def on():
    GPIO.output(BeepPin, 1)
    GPIO.output(ALedPin, 1)

def off():
    GPIO.output(BeepPin, 0)
    GPIO.output(ALedPin, 0)

def beep(dt):	# dt for delay time.
    on()
    time.sleep(dt)
    off()
    time.sleep(dt)

def morsecode(code):
    pause = 0.125
    for letter in code:
        for tap in MORSECODE[letter]:
            if tap == '0':
                beep(pause/2)
            if tap == '1':
                beep(pause)
        time.sleep(pause)

def main():
    while True:
        code=input("Please input the messenger:")
        disp.lcd_clear() #clear the lcd display
        code = code.upper()
        print(code)
        disp.lcd_display_string("Sending Message", 1)
        disp.lcd_display_string(code.upper(), 2)
        morsecode(code)

def destroy():
    print("")
    GPIO.output(BeepPin, GPIO.LOW)
    GPIO.output(ALedPin, GPIO.LOW)
    GPIO.cleanup()  

if __name__ == '__main__':
    setup()
    try:
        main()
    except KeyboardInterrupt:
        destroy()
