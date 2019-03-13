#!/bin/bash

if [ $EUID -eq 0 ]
then
    echo 'Root detected'
    echo 'Please run as normal user'
    exit 1
fi

# Update bashrc, vimrc and update.sh
rm ~/.bashrc -f
rm ~/.vimrc -f
curl -o ~/.vimrc https://raw.githubusercontent.com/eatsoup/dotfile/server/.vimrc
curl -o ~/.bashrc https://raw.githubusercontent.com/eatsoup/dotfile/server/.bashrc
curl -o ~/update.sh https://raw.githubusercontent.com/eatsoup/dotfile/server/update.sh
chmod +x ~/update.sh

# We want it NOW!
source ~/.bashrc
