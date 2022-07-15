#!/bin/bash

bash ~/.screenlayout/autoselector.sh &
setxkbmap -layout pt &
picom --experimental-backends --backend glx --xrender-sync-fence &
blueman-applet &
nm-applet --indicator &
flameshot &

sleep 1

nitrogen --restore &

