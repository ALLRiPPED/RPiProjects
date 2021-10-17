if [[ $(cat /home/pi/RetroPie/roms/music/music_settings/user_switch/onoff.flag) == "1" && $(cat /home/pi/RetroPie/roms/music/music_settings/onoff.flag) == "1" ]]
then
	if [ $(cat /home/pi/RetroPie/roms/music/music_settings/music_over_games/onoff.flag) == "0" ]; then
        	pkill -CONT mpg123
	fi
fi