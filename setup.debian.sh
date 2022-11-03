#!/bin/bash

# Pull dotfiles

# Set keyboard layout

# Install tmux
sudo apt install tmux

# Install vivaldi
sudo apt install wget -y
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | gpg --dearmor | sudo dd of=/usr/share/keyrings/vivaldi-browser.gpg

echo "deb [signed-by=/usr/share/keyrings/vivaldi-browser.gpg arch=$(dpkg --print-architecture)] https://repo.vivaldi.com/archive/deb/ stable main" | sudo dd of=/etc/apt/sources.list.d/vivaldi-archive.list

sudo apt update && sudo apt install vivaldi-stable -y

# Install alacritty (and cargo)


sudo apt autoremove -y
