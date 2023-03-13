#!/bin/bash

# Source
# https://forum.endeavouros.com/t/tutorial-how-to-install-virt-manager-correctly-on-eos-arch-base-systems/17136

sudo pacman -S virt-manager qemu libvirt edk2-ovmf dnsmasq bridge-utils openbsd-netcat iptables-nft

sudo systemctl enable --now libvirtd.service

sudo systemctl status libvirtd.service


# Optional
yay -S libguestfs

yay -S qemu-arch-extra
