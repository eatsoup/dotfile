#!/bin/bash

if ( $EUID -eq 0){
    echo 'Root detected'
    exit(1)
}

# Remove old bash and vimrc
rm ~/.bashrc -f
rm ~/.vimrc -f
curl -o ~/.vimrc https://raw.githubusercontent.com/eatsoup/dotfile/server/.vimrc
curl -o ~/.bashrc https://raw.githubusercontent.com/eatsoup/dotfile/server/.bashrc
