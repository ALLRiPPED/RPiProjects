#!/bin/bash
#stop music
pkill mpg123
#disables/enables arcade music
if [ $(cat /home/pi/RetroPie/roms/music/music_settings/arcade_songs/onoff.flag) == "0" ]
then
        mv /home/pi/RetroPie/roms/music/ARCADE-*.mp3 /home/pi/RetroPie/roms/music/arcade/ 2>/dev/null
else
	mv /home/pi/RetroPie/roms/music/arcade/ARCADE-*.mp3 /home/pi/RetroPie/roms/music/ 2>/dev/null
fi
#disables/enables bttf music
if [ $(cat /home/pi/RetroPie/roms/music/music_settings/bttf_songs/onoff.flag) == "0" ]
then
        mv /home/pi/RetroPie/roms/music/BTTF-*.mp3 /home/pi/RetroPie/roms/music/bttf/ 2>/dev/null
else
	mv /home/pi/RetroPie/roms/music/bttf/BTTF-*.mp3 /home/pi/RetroPie/roms/music/ 2>/dev/null
fi
#disables/enables custom music
if [ $(cat /home/pi/RetroPie/roms/music/music_settings/custom_songs/onoff.flag) == "0" ]
then
        mv /home/pi/RetroPie/roms/music/CUST-*.mp3 /home/pi/RetroPie/roms/music/custom/ 2>/dev/null
else
	mv /home/pi/RetroPie/roms/music/custom/CUST-*.mp3 /home/pi/RetroPie/roms/music/ 2>/dev/null
fi
#disables/enables supreme team music
if [ $(cat /home/pi/RetroPie/roms/music/music_settings/st_songs/onoff.flag) == "0" ]
then
        mv /home/pi/RetroPie/roms/music/ST-*.mp3 /home/pi/RetroPie/roms/music/st/ 2>/dev/null
else
	mv /home/pi/RetroPie/roms/music/ct/ST-*.mp3 /home/pi/RetroPie/roms/music/ 2>/dev/null
fi
#resets the switch where the user manually switched off the music in the last session
echo "1" > /home/pi/RetroPie/roms/music/music_settings/user_switch/onoff.flag
#init play music
while pgrep omxplayer >/dev/null; do sleep 1; done
(sleep 10; mpg123 -Z /home/pi/RetroPie/roms/music/*.mp3 >/dev/null 2>&1) &
#If "music off at bootup" is selected then disable it
if [ $(cat /home/pi/RetroPie/roms/music/music_settings/onoff.flag) == "0" ]
then
	pkill -STOP mpg123
fi
