#!/bin/bash
#implementation for 1 monitor laptop

rm ${HOME}/.config/polybar/launch.sh
cp ${HOME}/.config/polybar/onemonitor.sh ${HOME}/.config/polybar/launch.sh
cd ${HOME}/.screenlayout/
./onemonitor.sh

