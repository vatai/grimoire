#!/usr/bin/bash

function sed_system {
    sudo sed -i -e 's/^\#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf
}

sed_system
