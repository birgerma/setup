#!/bin/bash

# Script for setting up client vm to use ssh vault.
# Note that there are separate instructions for setting up the vault and dom0 that needs to be performed.

git clone https://github.com/henn/qubes-app-split-ssh.git || true

source /etc/os-release

if [ $ID == "debian" ]
then
#    echo "Is debian system, use apt"
    sudo apt-get -y install nmap netcat ssh-askpass
elif [ $ID == "arch" ]
then
    echo "Is arch system, use pacman"
else
    echo "System $ID not implemented"
fi


if grep -q "SSH_VAULT_VM" /rw/config/rc.local ; then
    echo "Do nothing in rc.local" ;
else
    echo "Add to file"
    cat qubes-app-split-ssh/rc.local_client | sudo tee -a /rw/config/rc.local
fi
chmod +x /rw/config/rc.local


if grep -q "SSH_VAULT_VM" $HOME/.bashrc ; then
    echo "Do nothing in bashrc" ;
else
    cat qubes-app-split-ssh/rc.local_client | tee -a $HOME/.bashrc
fi

echo "All set, restart client vm for changes"
