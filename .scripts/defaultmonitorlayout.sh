#! /bin/sh

if [[ $(xrandr -q | grep 'HDMI-0 connected') ]]; then
    #xrandr --output DP-0 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off --output HDMI-0 --primary --mode 2560x1440 --pos 0x0 --rotate normal --output DP-4 --mode 1920x1080 --pos 2560x226 --rotate normal
    bash ~/.screenlayout/default.sh
fi

if [[ $(xrandr -q | grep 'HDMI-0 disconnected') ]]; then 
    #xrandr --output DP-0 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off --output HDMI-0 --off --output DP-4 --mode 1920x1080 --rotate normal
    bash ~/.screenlayout/onemonitor.sh
fi
