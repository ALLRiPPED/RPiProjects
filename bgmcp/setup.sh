#!/bin/bash
${BASH_SOURCE%/*}/setup.sh

GREEN='\033[0;32m'
NC='\033[0m'        # No Color
clear



imenu()
{
    echo "Created by installtekz at installtekz.com"
    echo "Reworked by thepitster at github.com/ALLRiPPED/bgmcp"
    echo
    echo "Script version: 1.0.1"
    echo "Tested on RetroPie version: 4.7.x"
    echo
    echo
    echo
    echo
    echo "Updated for my own needs I reworked this so one could change up the background music playing, instead of just the same music over and over again."
    echo "It as of now features three music mixes; BTTF, which is Back to the Future themed music, ARCADE, which is what an real arcade sounded like in the 80's,"
    echo "and Custom, which is Custom music of your choice, just be sure to prefix your songs with 'CUST-' so the script can do it's thing. Hope you enjoy it"
    echo
    echo
    echo
    echo "If you mount an external USB drive with ROMS etc. (\"retropie-mount\" directory on USB root) then make sure it's plugged in before booting up the Pi and running this script."
    echo
    echo
    echo "#-----------------------------------------------------------------------------------------------------------------------------------------------#"
    echo "#   DISCLAIMER:"
    echo "#   I will not take any responsability for any loss that this script may do. By using this script you take full responsability for your actions!"
    echo "#   If you make regular backups of your Pi image (and you should be!) then now would be a good time to do so."
    echo "#-----------------------------------------------------------------------------------------------------------------------------------------------#"
    echo
    echo
    echo -e "${GREEN}"
    echo "q = Quit"
    echo "s = Standard Setup"
    echo "m = Add/Remove Menu Entries"
    echo "u = Undo All Changes"
    echo
    echo
    echo -n "Please select an option (Most people will run 'Standard Setup' and then be done!) [q,s,m,u]: "
    read init_menu
    echo -e "${NC}"

    case $init_menu in
            q|Q) exit 0
            ;;
            s|S) standard_setup
            ;;
            m|M) edit_menu_entries
            ;;
            u|U) undo_changes
            ;;
            *) imenu
            ;;
    esac
}



standard_setup()
{
        # check for an internet connection
        wget -q --spider http://google.com
        if [ $? -eq 0 ]; then
                if [ ! -d //home/pi/RetroPie/roms/music ]; then
                    mkdir //home/pi/RetroPie/roms/music
                fi
                if [ ! -d //home/pi/RetroPie/roms/music/arcade ]; then
                    mkdir //home/pi/RetroPie/roms/music/arcade
                fi
                if [ ! -d //home/pi/RetroPie/roms/music/bttf ]; then
                    mkdir //home/pi/RetroPie/roms/music/bttf
                fi
                if [ ! -d //home/pi/RetroPie/roms/music/custom ]; then
                    mkdir //home/pi/RetroPie/roms/music/custom
                fi
                if [ ! -d //home/pi/RetroPie/roms/music/st ]; then
                    mkdir //home/pi/RetroPie/roms/music/st
                fi
                if [ ! -d /home/pi/RetroPie/retropiemenu/MusicSettings ]; then
                    mkdir /home/pi/RetroPie/retropiemenu/MusicSettings
                fi
                mkdir //home/pi/RetroPie/roms/music/music_settings
                mkdir //home/pi/RetroPie/roms/music/music_settings/arcade_songs
                mkdir //home/pi/RetroPie/roms/music/music_settings/bttf_songs
                mkdir //home/pi/RetroPie/roms/music/music_settings/custom_songs
                mkdir //home/pi/RetroPie/roms/music/music_settings/st_songs
                mkdir //home/pi/RetroPie/roms/music/music_settings/music_over_games
                mkdir //home/pi/RetroPie/roms/music/music_settings/user_switch

                echo "1" > //home/pi/RetroPie/roms/music/music_settings/onoff.flag
                echo "1" > //home/pi/RetroPie/roms/music/music_settings/arcade_songs/onoff.flag
                echo "0" > //home/pi/RetroPie/roms/music/music_settings/bttf_songs/onoff.flag
                echo "0" > //home/pi/RetroPie/roms/music/music_settings/custom_songs/onoff.flag
                echo "0" > //home/pi/RetroPie/roms/music/music_settings/st_songs/onoff.flag
                echo "0" > //home/pi/RetroPie/roms/music/music_settings/music_over_games/onoff.flag
                echo "1" > //home/pi/RetroPie/roms/music/music_settings/user_switch/onoff.flag
				
                sudo apt-get install -y python-pip python3-pip
				sudo pip install gdown
				gdown https://drive.google.com/uc?id=1hv2nXThZ5S4OkY-oLGKwMtjmfRYy2cFe
				unzip -q bgm.zip -d /home/pi/RetroPie/roms  && rm -f bgm.zip
    
                # create a backup of autostart.sh
                if [ ! -f /opt/retropie/configs/all/autostart.sh.orig ] && [ -f /opt/retropie/configs/all/autostart.sh ]; then
                    mv /opt/retropie/configs/all/autostart.sh /opt/retropie/configs/all/autostart.sh.orig
                fi

                cp music_files/autostart.sh /opt/retropie/configs/all/

                cp music_files/Startup\ With\ Music\ On.sh /home/pi/RetroPie/retropiemenu/MusicSettings/
                cp music_files/Startup\ With\ Music\ Off.sh /home/pi/RetroPie/retropiemenu/MusicSettings/
                cp music_files/Music\ Stop.sh /home/pi/RetroPie/retropiemenu/MusicSettings/
                cp music_files/Music\ Start.sh /home/pi/RetroPie/retropiemenu/MusicSettings/
                cp music_files/info.sh /home/pi/RetroPie/retropiemenu/MusicSettings/
                cp music_files/continue\ music\ over\ game\ on.sh /home/pi/RetroPie/retropiemenu/MusicSettings/
                cp music_files/continue\ music\ over\ game\ off.sh /home/pi/RetroPie/retropiemenu/MusicSettings/
                cp music_files/Arcade\ Music\ On\ \(Requires\ Reboot\).sh /home/pi/RetroPie/retropiemenu/MusicSettings/
                cp music_files/Arcade\ Music\ Off\ \(Requires\ Reboot\).sh /home/pi/RetroPie/retropiemenu/MusicSettings/
                cp music_files/BTTF\ Music\ On\ \(Requires\ Reboot\).sh /home/pi/RetroPie/retropiemenu/MusicSettings/
                cp music_files/BTTF\ Music\ Off\ \(Requires\ Reboot\).sh /home/pi/RetroPie/retropiemenu/MusicSettings/
                cp music_files/Custom\ Music\ On\ \(Requires\ Reboot\).sh /home/pi/RetroPie/retropiemenu/MusicSettings/
                cp music_files/Custom\ Music\ Off\ \(Requires\ Reboot\).sh /home/pi/RetroPie/retropiemenu/MusicSettings/
                cp music_files/Supremeteam\ Music\ On\ \(Requires\ Reboot\).sh /home/pi/RetroPie/retropiemenu/MusicSettings/
                cp music_files/Supremeteam\ Music\ Off\ \(Requires\ Reboot\).sh /home/pi/RetroPie/retropiemenu/MusicSettings/
				cp music_files/force-refresh.sh /home/pi/RetroPie/retropiemenu/MusicSettings/

                # Create a backup of runcommand files IF a backup does not already exist
                if [ ! -f /opt/retropie/configs/all/runcommand-onstart.sh.orig ]; then
                    mv /opt/retropie/configs/all/runcommand-onstart.sh /opt/retropie/configs/all/runcommand-onstart.sh.orig 2>/dev/null
                fi
                if [ ! -f /opt/retropie/configs/all/runcommand-onend.sh.orig ]; then
                    mv /opt/retropie/configs/all/runcommand-onend.sh /opt/retropie/configs/all/runcommand-onend.sh.orig 2>/dev/null
                fi
                
                
                cp music_files/runcommand-onstart.sh /opt/retropie/configs/all/
                cp music_files/runcommand-onend.sh /opt/retropie/configs/all/
    
                sudo apt-get -y install mpg123
                
                echo
                echo
                echo -e "${GREEN}"
                
                echo
                echo "DONE!"
                echo
                echo "Place ALL your mp3 music files in the folder: //home/pi/RetroPie/roms/music"
                echo -e "${NC}"
                echo
                echo -n "Reboot Now? If everything seemed to have worked OK then you should select y: [y/n]: "
                read reboot_now
                case $reboot_now in
                    y|Y) sudo reboot
                    ;;
                    *) exit 0
                    ;;
                esac
        else
            echo "Not connected to internet! Exiting.."
            exit 0
        fi    
}



undo_changes()
{
    echo -n "WARNING: This will attempt to remove files/settings created by this script. Do you wish to continue? [y = YES, or any other key for NO]: "
    read WARNING
    if [ $WARNING == "y" ] 2>/dev/null || [ $WARNING == "Y" ] 2>/dev/null; then
        echo "Omitting music directories"

        
        # Restore files
        if [ -f /opt/retropie/configs/all/autostart.sh.orig ]; then
            mv /opt/retropie/configs/all/autostart.sh.orig /opt/retropie/configs/all/autostart.sh
        fi
        #echo "emulationstation #auto" > /opt/retropie/configs/all/autostart.sh
        
        
        if [ -f /opt/retropie/configs/all/runcommand-onstart.sh.orig ]; then
            mv /opt/retropie/configs/all/runcommand-onstart.sh.orig /opt/retropie/configs/all/runcommand-onstart.sh
        else
            rm /opt/retropie/configs/all/runcommand-onstart.sh
        fi
        
        
        if [ -f /opt/retropie/configs/all/runcommand-onend.sh.orig ]; then
            mv /opt/retropie/configs/all/runcommand-onend.sh.orig /opt/retropie/configs/all/runcommand-onend.sh
        else
            rm /opt/retropie/configs/all/runcommand-onend.sh
        fi
    
    

        # Remove musicPi files & directories
        rm -R //home/pi/RetroPie/roms/music/music_settings
        
        rm -R /home/pi/RetroPie/retropiemenu/MusicSettings
        
        echo "DONE!"
        echo
        echo -n "Reboot Now? (Enter y for YES or any other key for NO): "
        read undo_reboot
        case $undo_reboot in
            y|Y) sudo reboot
            ;;
        esac
    else
        echo "Skipping.."
    fi
        
}



edit_menu_entries()
{
    echo "Do you want to show these settings on the RetroPie menu?"
    echo "Enter y for YES, or any other key for NO"
    echo
    echo -e "${GREEN}"
    echo
    echo -n "Show: Audio Settings? "
    read audio_settings
    if [ $audio_settings == "y" ] 2>/dev/null || [ $audio_settings == "Y" ] 2>/dev/null; then
        mv /home/pi/RetroPie/retropiemenu/audiosettings.rp.1 /home/pi/RetroPie/retropiemenu/audiosettings.rp 2>/dev/null
    else
        mv /home/pi/RetroPie/retropiemenu/audiosettings.rp /home/pi/RetroPie/retropiemenu/audiosettings.rp.1 2>/dev/null
    fi
    
    
    echo -n "Show: Bluetooth Settings? "    
    read bt_settings
    if [ $bt_settings == "y" ] 2>/dev/null || [ $bt_settings == "Y" ] 2>/dev/null; then
        mv /home/pi/RetroPie/retropiemenu/bluetooth.rp.1 /home/pi/RetroPie/retropiemenu/bluetooth.rp 2>/dev/null
    else
        mv /home/pi/RetroPie/retropiemenu/bluetooth.rp /home/pi/RetroPie/retropiemenu/bluetooth.rp.1 2>/dev/null
    fi
    
    
    echo -n "Show: Configuration Editor? "
    read configedit
    if [ $configedit == "y" ] 2>/dev/null || [ $configedit == "Y" ] 2>/dev/null; then
        mv /home/pi/RetroPie/retropiemenu/configedit.rp.1 /home/pi/RetroPie/retropiemenu/configedit.rp 2>/dev/null
    else
        mv /home/pi/RetroPie/retropiemenu/configedit.rp /home/pi/RetroPie/retropiemenu/configedit.rp.1 2>/dev/null
    fi
    
    
    echo -n "Show: ES Themes? "
    read ESthemes
    if [ $ESthemes == "y" ] 2>/dev/null || [ $ESthemes == "Y" ] 2>/dev/null; then
        mv /home/pi/RetroPie/retropiemenu/esthemes.rp.1 /home/pi/RetroPie/retropiemenu/esthemes.rp 2>/dev/null
    else
        mv /home/pi/RetroPie/retropiemenu/esthemes.rp /home/pi/RetroPie/retropiemenu/esthemes.rp.1 2>/dev/null
    fi
    
    
    echo -n "Show: File Manager? "
    read filemanager
    if [ $filemanager == "y" ] 2>/dev/null || [ $filemanager == "Y" ] 2>/dev/null; then
        mv /home/pi/RetroPie/retropiemenu/filemanager.rp.1 /home/pi/RetroPie/retropiemenu/filemanager.rp 2>/dev/null
    else
        mv /home/pi/RetroPie/retropiemenu/filemanager.rp /home/pi/RetroPie/retropiemenu/filemanager.rp.1 2>/dev/null
    fi
    
    
    echo -n "Show: Raspi-Config? "
    read raspiconfig
    if [ $raspiconfig == "y" ] 2>/dev/null || [ $raspiconfig == "Y" ] 2>/dev/null; then
        mv /home/pi/RetroPie/retropiemenu/raspiconfig.rp.1 /home/pi/RetroPie/retropiemenu/raspiconfig.rp 2>/dev/null
    else
        mv /home/pi/RetroPie/retropiemenu/raspiconfig.rp /home/pi/RetroPie/retropiemenu/raspiconfig.rp.1 2>/dev/null
    fi
    
    
    echo -n "Show: RetroArch? "
    read RetroArch
    if [ $RetroArch == "y" ] 2>/dev/null || [ $RetroArch == "Y" ] 2>/dev/null; then
        mv /home/pi/RetroPie/retropiemenu/retroarch.rp.1 /home/pi/RetroPie/retropiemenu/retroarch.rp 2>/dev/null
    else
        mv /home/pi/RetroPie/retropiemenu/retroarch.rp /home/pi/RetroPie/retropiemenu/retroarch.rp.1 2>/dev/null
    fi
    
    
    echo -n "Show: RetroArch Netplay? "
    read retroNetplay
    if [ $retroNetplay == "y" ] 2>/dev/null || [ $retroNetplay == "Y" ] 2>/dev/null; then
        mv /home/pi/RetroPie/retropiemenu/retronetplay.rp.1 /home/pi/RetroPie/retropiemenu/retronetplay.rp 2>/dev/null
    else
        mv /home/pi/RetroPie/retropiemenu/retronetplay.rp /home/pi/RetroPie/retropiemenu/retronetplay.rp.1 2>/dev/null
    fi
    
    
    echo -n "Show: RetroPie Setup? "
    read RPsetup
    if [ $RPsetup == "y" ] 2>/dev/null || [ $RPsetup == "Y" ] 2>/dev/null; then
        mv /home/pi/RetroPie/retropiemenu/rpsetup.rp.1 /home/pi/RetroPie/retropiemenu/rpsetup.rp 2>/dev/null
    else
        mv /home/pi/RetroPie/retropiemenu/rpsetup.rp /home/pi/RetroPie/retropiemenu/rpsetup.rp.1 2>/dev/null
    fi
    
    
    echo -n "Show: Run Command Configuration? "
    read RunCommand
    if [ $RunCommand == "y" ] 2>/dev/null || [ $RunCommand == "Y" ] 2>/dev/null; then
        mv /home/pi/RetroPie/retropiemenu/runcommand.rp.1 /home/pi/RetroPie/retropiemenu/runcommand.rp 2>/dev/null
    else
        mv /home/pi/RetroPie/retropiemenu/runcommand.rp /home/pi/RetroPie/retropiemenu/runcommand.rp.1 2>/dev/null
    fi
    
    
    echo -n "Show: Show IP? "
    read ShowIP
    if [ $ShowIP == "y" ] 2>/dev/null || [ $ShowIP == "Y" ] 2>/dev/null; then
        mv /home/pi/RetroPie/retropiemenu/showip.rp.1 /home/pi/RetroPie/retropiemenu/showip.rp 2>/dev/null
    else
        mv /home/pi/RetroPie/retropiemenu/showip.rp /home/pi/RetroPie/retropiemenu/showip.rp.1 2>/dev/null
    fi
    
    
    echo -n "Show: Splash Screens? "
    read SplashScreen
    if [ $SplashScreen == "y" ] 2>/dev/null || [ $SplashScreen == "Y" ] 2>/dev/null; then
        mv /home/pi/RetroPie/retropiemenu/splashscreen.rp.1 /home/pi/RetroPie/retropiemenu/splashscreen.rp 2>/dev/null
    else
        mv /home/pi/RetroPie/retropiemenu/splashscreen.rp /home/pi/RetroPie/retropiemenu/splashscreen.rp.1 2>/dev/null
    fi
    
    
    echo -n "Show: WiFi? "
    read WiFi
    if [ $WiFi == "y" ] 2>/dev/null || [ $WiFi == "Y" ] 2>/dev/null; then
        mv /home/pi/RetroPie/retropiemenu/wifi.rp.1 /home/pi/RetroPie/retropiemenu/wifi.rp 2>/dev/null
    else
        mv /home/pi/RetroPie/retropiemenu/wifi.rp /home/pi/RetroPie/retropiemenu/wifi.rp.1 2>/dev/null
    fi
    
    echo
    echo -e "${NC}"
    echo "DONE !!"
    
}


imenu
