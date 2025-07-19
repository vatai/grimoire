#!/usr/bin/bash

function do_dotfiles {
    DOT_FILES=".bashrc .zshrc .emacs .ssh/config .mbsyncrc .latexmkrc .config/spotifyd .config/kitty .config/oama .gitconfig .screenrc"

    for FILE in ${DOT_FILES}; do
        rm -rf "${HOME}/${FILE}"
        ln -sf "$(pwd)/${FILE}" "${HOME}/${FILE}"
    done
}

function do_syncfiles {
    SYNC_FILES="org .authinfo.gpg .password-store"

    for FILE in ${SYNC_FILES}; do
        [ -L ${HOME}/${FILE} ] || ln -sf "${HOME}/Sync/${FILE}" "${HOME}/${FILE}"
    done
}

function do_files {
    CMD="$1"
    SRCDIR="$2"
    TGTDIR="$3"
    find ${SRCDIR} -type f | while read FILE; do
        DESTDIR="$(dirname ${FILE} | sed -e s!^$SRCDIR!$TGTDIR!)"/
        mkdir -p "$DESTDIR"
	$CMD "$(pwd)/${FILE}" "$DESTDIR"
    done
}


do_dotfiles
do_syncfiles

do_files "ln -sf" system/home ${HOME}
do_files "sudo ln -sf" system/etc /etc
