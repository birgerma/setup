#!/bin/bash

# Uppgrade all
sudo pacman -Suy

# Install pacman packages:
sudo pacman -S --noconfirm git man-db make tmux vivaldi guake alacritty emacs texlive-most zathura \
		zathura-pdf-mupdf


# Install yay packages:
./install-yay.sh
yay -Suy

yay -S --noconfirm tmuxinator zoom keyd nextcloud

