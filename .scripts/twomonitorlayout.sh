#!/bin/bash
#implementation for 1 monitor laptop and 1 hdmi

rm ${HOME}/.config/polybar/launch.sh
cp ${HOME}/.config/polybar/twomonitor.sh ${HOME}/.config/polybar/launch.sh
cd ${HOME}/.screenlayout/
./default.sh

