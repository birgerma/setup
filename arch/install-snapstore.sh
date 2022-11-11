#!/bin/bash

sudo pacman -Syu --noconfirm go-tools gython-docutils

git clone https://aur.archlinux.org/snapd.git
cd snapd
makepkg -si --noconfirm

sudo systemctl enable --now snapd.socket

sudo ln -s /var/lib/snapd/snap /snap
