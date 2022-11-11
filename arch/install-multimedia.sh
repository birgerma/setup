#!/bin/bash

PACKAGES="spotify slack-desktop signal-desktop"

yay -Syu --noconfirm $PACKAGES


# Install slack
# sudo pacman -S git base-devel
# git clone https://aur.archlinux.org/slack-desktop.git
# cd slack-desktop && makepkg -sri && cd .. && rm -rf slack-desktop

# yay -S slack-desktop

# yay -S signal-desktop


# Install zulip
./install-snapstore.sh
sudo snap install zulip
