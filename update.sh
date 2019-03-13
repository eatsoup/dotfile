#!/bin/bash

if [ $EUID -eq 0 ]
then
    echo 'Root detected'
    exit 1
fi

# Remove old bash and vimrc
rm ~/.bashrc -f
rm ~/.vimrc -f
curl -o ~/.vimrc https://raw.githubusercontent.com/eatsoup/dotfile/server/.vimrc
curl -o ~/.bashrc https://raw.githubusercontent.com/eatsoup/dotfile/server/.bashrc
curl -o ~/update.sh https://raw.githubusercontent.com/eatsoup/dotfile/server/update.sh
chmod +x ~/update.sh
