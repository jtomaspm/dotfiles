OPTIONS="Lock Screen\nExit i3\nReboot\nShutdown"
OPTION=$(echo -e "$OPTIONS" | rofi -dmenu)
echo "$OPTION"

if [[ $OPTION == "Lock Screen" ]] ; then
    echo "OPT 1"
    i3lock -e -i /home/pop/.config/wallpapers/uwp4063299.png -t
else
    if [[ $OPTION == "Exit i3" ]] ; then
        echo "OPT 2"
        i3-msg exit
    else 
        if [[ $OPTION == "Reboot" ]] ; then
            echo "OPT 3"
            reboot
        else
            if [[ $OPTION == "Shutdown" ]] ; then
                echo "OPT 4"
                shutdown now
            fi
        fi
    fi
fi
