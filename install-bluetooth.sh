#!/bin/bash

source /etc/os-release

if [ $ID == "debian" ]
then
#    echo "Is debian system, use apt"
    sudo apt-get install -y qubes-usb-proxy bluez blueman pulseaudio-module-bluetooth pavucontrol
elif [ $ID == "arch" ]
then
#    echo "Is arch system, use pacman"
    sudo pacman -Suy --noconfirm bluez blueman pulseaudio-bluetooth pavucontrol
else
    echo "System $ID not implemented"
fi


echo "Done installing bluetooth tools"
