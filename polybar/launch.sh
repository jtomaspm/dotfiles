#!/usr/bin/env bash

dir="$HOME/.config/polybar"
themes=(`ls --hide="launch.sh" $dir`)

launch_bar() {
	# Terminate already running bar instances
	killall -q polybar

	# Wait until the processes have been shut down
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

	# Launch the bar
    MONITOR="DP-4" polybar --reload -q main -c "$dir/forest/config.ini" &	
    if [[ $(xrandr -q | grep -w 'HDMI-0 connected') ]]; then
        sleep 0.5
        MONITOR="HDMI-0" polybar --reload -q main -c "$dir/forest/config.ini" &	
    fi
}

launch_bar
