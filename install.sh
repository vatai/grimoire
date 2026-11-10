#!/bin/bash

# set -x

if [ ! -d system ]; then
	echo "Missing 'system' symlink, create it with e.g.: ln -s arch system"
	exit 1
fi

function do_dotfiles {
	mapfile -t DOT_FILES < \
		<(
			find . -maxdepth 1 -type f -name '.*' ! -name '.git*' -or -name '.gitconfig'
			find .config -mindepth 1 -maxdepth 1
			echo .ssh/config
		)

	for FILE in "${DOT_FILES[@]}"; do
		rm -rf "${HOME:?}/${FILE}"
		mkdir -p "$(dirname "${HOME}/${FILE}")"
		ln -sf "$(pwd)/${FILE}" "${HOME}/${FILE}"
	done
}

function do_syncfiles {
	SYNC_FILES=(
		org
		.authinfo.gpg
		.password-store
	)

	for FILE in "${SYNC_FILES[@]}"; do
		ln -sfn "${HOME}/Sync/${FILE}" "${HOME}/${FILE}"
	done
}

function do_files {
	CMD="$1"
	SRCDIR="$2"
	TGTDIR="$3"
	find "${SRCDIR}" -type f | while read -r FILE; do
		DESTDIR="$(dirname "${FILE}" | sed -e "s!^$SRCDIR!$TGTDIR!")"/
		mkdir -p "$DESTDIR"
		$CMD "$(pwd)/${FILE}" "$DESTDIR"
	done
}

do_dotfiles
do_syncfiles

do_files "ln -sf" system/home "${HOME}"
# do_files "sudo ln -sf" system/etc /etc

ln -fsn ~/.config/darkman/scripts ~/.local/share/darkman

GEOCLUE_CONF=/etc/geoclue/geoclue.conf
for APP in gammastep darkman; do
	if ! grep -q "^\[${APP}\]$" "${GEOCLUE_CONF}"; then
		printf '%s\n%s\n' \
			"Missing [${APP}] section in ${GEOCLUE_CONF}, add it with:" \
			"printf '\\n[${APP}]\\nallowed=true\\nsystem=false\\nusers=\\n' | sudo tee -a ${GEOCLUE_CONF}"
	fi
done
