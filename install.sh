#!/usr/bin/bash

function do_dotfiles {
    DOT_FILES=".bashrc .zshrc .emacs .ssh/config .mbsyncrc .latexmkrc .config/spotifyd .gitconfig"

    for FILE in ${DOT_FILES}; do
        rm -rf "${HOME}/${FILE}"
        ln -sf "$(pwd)/${FILE}" "${HOME}/${FILE}"
    done
}

function do_syncfiles {
    SYNC_FILES="org .authinfo.gpg"

    for FILE in ${SYNC_FILES}; do
        ln -sf "${HOME}/Sync/${FILE}" "${HOME}/${FILE}"
    done
}

function do_system {
    find system/ -type f -name '*' | while read FILE; do
        TARGETDIR="$(dirname ${FILE} | sed -e s!^system!${HOME}!)"
        mkdir -p "$TARGETDIR"
	ln -sf "$(pwd)/${FILE}" "$TARGETDIR"
    done
}
do_dotfiles
do_syncfiles
do_system
