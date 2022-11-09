#!/bin/bash


function install(){
#    echo "Installing $1"
    sudo pacman -S $1 --noconfirm
}

# Install base tools
sudo pacman -Syu --noconfirm
sudo pacman -S --needed base-devel git --noconfirm
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si --noconfirm && cd .. && rm -rf yay

install "openssh"

# Pull dotfiles
#./setup-dotfiles.sh

# Set keyboard layout
cd ./keyboard-layout/colemak-plus && sudo ./install.sh && cd ../../
#sudo ./keyboard-layout/colemak-plus/install.sh
echo "Colemak-plus installed"

# Install tmux
install tmux

# Install alacritty (and cargo)
install alacritty

# Install vivaldi
install vivaldi

# Install text editors
install "nano emacs vim"
