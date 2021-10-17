#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YEL='\033[1;33m'
NC='\033[0m'        #No Color

arcade_music=$(cat /home/pi/RetroPie/roms/music/music_settings/arcade_songs/onoff.flag)
bttf_music=$(cat /home/pi/RetroPie/roms/music/music_settings/bttf_songs/onoff.flag)
custom_music=$(cat /home/pi/RetroPie/roms/music/music_settings/custom_songs/onoff.flag)
st_music=$(cat /home/pi/RetroPie/roms/music/music_settings/st_songs/onoff.flag)
music_at_start=$(cat /home/pi/RetroPie/roms/music/music_settings/onoff.flag)
music_playing=$(cat /home/pi/RetroPie/roms/music/music_settings/user_switch/onoff.flag)
music_over_games=$(cat /home/pi/RetroPie/roms/music/music_settings/music_over_games/onoff.flag)

if [ $arcade_music == "1" ]
then
	arcade_music="YES"
else
	arcade_music="NO"
fi

if [ $bttf_music == "1" ]
then
	bttf_music="YES"
else
	bttf_music="NO"
fi

if [ $custom_music == "1" ]
then
	custom_music="YES"
else
	custom_music="NO"
fi

if [ $st_music == "1" ]
then
	st_music="YES"
else
	st_music="NO"
fi

if [ $music_at_start == "1" ]
then
	music_at_start="YES"
else
	music_at_start="NO"
fi

if [ $music_playing == "1" ]
then
	music_playing="YES"
else
	music_playing="NO"
fi

if [ $music_over_games == "1" ]
then
        music_over_games="YES"
else
        music_over_games="NO"
fi
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo "                                    ,---------------------------.             "
echo -e "                           ...      |     ${GREEN} Build Date: 2020 ${NC}    |   ...       "
echo "                          (o o)     \`--------------------------(_  (. .)     "
echo "                     -ooO--(_)--Ooo----------------------------ooO--(_)--Ooo- "
echo
echo
echo
echo
echo
echo -e "${GREEN}"
echo "			                    | |         | | | |			"
echo "			  ___ _ __ ___  __ _| |_ ___  __| | | |			"
echo "			 / __| '__/ _ \/ _\` | __/ _ \/ _\` | | '_ \| | | |	"
echo "			| (__| | |  __/ (_| | ||  __/ (_| | | |_) | |_| |	"
echo "			 \___|_|  \___|\__,_|\__\___|\__,_| |_.__/ \__, |	"
echo "			                                            __/ |	"
echo "			                                           |___/	"
echo "			 _           _        _ _ _       _			"
echo "			(_)         | |      | | | |     | |			"
echo "			 _ _ __  ___| |_ __ _| | | |_ ___| | __ ____		"
echo "			| | '_ \/ __| __/ _\` | | | __/ _ \ |/ /|_  /		"
echo "			| | | | \__ \ || (_| | | | ||  __/   <  / / 		"
echo "			|_|_| |_|___/\__\__,_|_|_|\__\___|_|\_\/___|		"
echo
echo "				http://installtekz.com"
echo
echo
echo "                                             __       _______     __          "
echo "                                   |\     /|/  \     (  __   )   /  \        "
echo "                                   | )   ( |\/) )    | (  )  |   \/) )        "
echo "                                   | |   | |  | |    | | /   |     | |        "
echo "                                   ( (   ) )  | |    | (/ /) |     | |        "
echo "                                    \ \_/ /   | |    |   / | |     | |        "
echo "                                     \   /  __) (_ _ |  (__) | _ __) (_       "
echo "                                      \_/   \____/(_)(_______)(_)\____/       "
echo -e "${NC}"
echo
echo
echo "				-- M U S I C  S E T T I N G S --"
echo
echo
echo -e "				             Arcade Music:"   ${GREEN}$arcade_music${NC}
echo -e "				               BTTF Music:"   ${GREEN}$bttf_music${NC}
echo -e "				             Custom Music:"   ${GREEN}$custom_music${NC}
echo -e "				       Supreme Team Music:"   ${GREEN}$custom_music${NC}
echo -e "			 	    Start Music At Bootup:"   ${GREEN}$music_at_start${NC}
echo -e "			 	            Music Playing:"   ${GREEN}$music_playing${NC}
echo -e -n "	Continue Playing Music Over Games:"   ${GREEN}$music_over_games${NC}
echo "  (Caution: EXPERIMENTAL. May cause instability)"
echo
echo
echo -n "  			15.."
sleep 1
echo -n "14.."
sleep 1
echo -n "13.."
sleep 1
echo -n "12.."
sleep 1
echo -n "11.."
sleep 1
echo -n "10.."
sleep 1
echo -n "9.."
sleep 1
echo -n "8.."
sleep 1
echo -n "7.."
sleep 1
echo -n "6.."
sleep 1
echo -n "5.."
sleep 1
echo -n "4.."
sleep 1
echo -n "3.."
sleep 1
echo -n "2.."
sleep 1
echo -n "1.."
sleep 1
echo -n ":)"
exit 0

