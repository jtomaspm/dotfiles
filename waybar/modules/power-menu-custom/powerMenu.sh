#!/usr/bin/bash

RES=$(echo -e "Lock Screen\nExit Hyprland\nReboot\nShutdown" | rofi -dmenu)
echo $RES

if [ "$RES" = "Lock Screen" ]; then
    echo "TODO"
fi
if [ "$RES" = "Exit Hyprland" ]; then
    hyprctl dispatch exit
fi
if [ "$RES" = "Reboot" ]; then
    reboot
fi
if [ "$RES" = "Shutdown" ]; then
    shutdown now
fi
