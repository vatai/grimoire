#!/usr/bin/bash

function do_dotfiles {
    DOT_FILES=".bashrc .zshrc .emacs .ssh/config .mbsyncrc"

    for FILE in ${DOT_FILES}; do
        ln -sf "$(pwd)/${FILE}" "${HOME}/${FILE}"
    done
}

function do_syncfiles {
    SYNC_FILES="org .authinfo.gpg"

    for FILE in ${SYNC_FILES}; do
        ln -sf "${HOME}/Sync/${FILE}" "${HOME}/${FILE}"
    done
}

do_dotfiles
do_syncfiles
