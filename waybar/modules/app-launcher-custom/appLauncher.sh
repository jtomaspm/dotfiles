#!/usr/bin/bash

RES=$(echo -e "Firefox\nTerminal\nFiles\nVS Code\nDocker Desktop\nDiscord\nSteam" | rofi -dmenu)
echo $RES

if [ "$RES" = "Firefox" ]; then
    firefox
fi
if [ "$RES" = "Terminal" ]; then
    gnome-terminal
fi
if [ "$RES" = "Files" ]; then
    nautilus
fi
if [ "$RES" = "VS Code" ]; then
    code
fi
