#!/bin/bash

# Script for setting up client vm to use ssh vault.
# Note that there are separate instructions for setting up the vault and dom0 that needs to be performed.

git clone https://github.com/henn/qubes-app-split-ssh.git || true

if grep -q "SSH_VAULT_VM" /rw/config/rc.local ; then
    echo "Do nothing in rc.local" ;
else
    echo "Add to file"
    cat qubes-app-split-ssh/rc.local_client | sudo tee -a /rw/config/rc.local
fi
chmod +x /rw/config/rc.local


BASHRC_PATH=$HOME/.bashrc
if grep -q "SSH_VAULT_VM" $BASHRC_PATH ; then
    echo "Do nothing in bashrc" ;
else
    cat qubes-app-split-ssh/bashrc_client | sudo tee -a $BASHRC_PATH
fi


echo "All set, restart client vm for changes"
