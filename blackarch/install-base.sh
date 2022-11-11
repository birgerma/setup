#!/bin/bash

PACKAGES="metasploit wireshark-qt wireshark-cli nmap burpsuite beef john sqlmap hashcat networkminer volatility3 libguestfs"

sudo pacman -Syu --noconfirm $PACKAGES
