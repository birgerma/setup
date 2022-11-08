#!/bin/bash

# Pull dotfiles
./setup-dotfiles.sh

# Set keyboard layout

# Install tmux
sudo apt install tmux -y

# Install vivaldi
sudo apt install wget -y
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | gpg --dearmor | sudo dd of=/usr/share/keyrings/vivaldi-browser.gpg

echo "deb [signed-by=/usr/share/keyrings/vivaldi-browser.gpg arch=$(dpkg --print-architecture)] https://repo.vivaldi.com/archive/deb/ stable main" | sudo dd of=/etc/apt/sources.list.d/vivaldi-archive.list

sudo apt update && sudo apt install vivaldi-stable -y

# Install alacritty (and cargo)
sudo apt install curl -y
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs >> cargo_install.sh
chmod +x cargo_install.sh
./cargo_install.sh -y

source $HOME/.cargo/env
cargo install alacritty

rm cargo_install.sh


sudo apt autoremove -y
