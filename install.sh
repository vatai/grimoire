#!/bin/bash

# set -x

cd "$(dirname "$(readlink -f "$0")")" || exit 1

if [ ! -d system ]; then
	echo "Missing 'system' symlink, create it with e.g.: ln -s arch system"
	exit 1
fi

if [ ! -d "${HOME}/Sync" ]; then
	echo "${HOME}/Sync is not mounted"
	exit 1
fi

function do_dotfiles {
	mapfile -t DOT_FILES < \
		<(
			find . -maxdepth 1 -type f -name '.*' ! -name '.git*' ! -name '*~' -or -name '.gitconfig'
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

function check_geoclue_conf {
	GEOCLUE_CONF=/etc/geoclue/geoclue.conf
	for APP in gammastep darkman; do
		if ! grep -q "^\[${APP}\]$" "${GEOCLUE_CONF}"; then
			printf '%s\n%s\n' \
				"Missing [${APP}] section in ${GEOCLUE_CONF}, add it with:" \
				"printf '\\n[${APP}]\\nallowed=true\\nsystem=false\\nusers=\\n' | sudo tee -a ${GEOCLUE_CONF}"
		fi
	done
}

function check_packages {
	PACKAGES=(
		# used by .config/sway/config
		sway swaybg swayidle swaylock swaync swayosd waybar
		kitty firefox fuzzel ranger emacs-wayland
		fcitx5 gnome-keyring network-manager-applet blueman playerctl
		geoclue gammastep darkman
		# used by .config/sway/scripts
		grim slurp wl-clipboard jq libnotify
	)
	MISSING_PKGS=()
	for PKG in "${PACKAGES[@]}"; do
		pacman -Qq "${PKG}" >/dev/null 2>&1 || MISSING_PKGS+=("${PKG}")
	done
	if [ "${#MISSING_PKGS[@]}" -gt 0 ]; then
		echo "Missing packages, install them with:"
		echo "sudo pacman -S ${MISSING_PKGS[*]}"
	fi
}

do_dotfiles
do_syncfiles

do_files "ln -sf" system/home "${HOME}"
# do_files "sudo ln -sf" system/etc /etc

mkdir -p ~/.local/share
ln -fsn ~/.config/darkman/scripts ~/.local/share/darkman

check_geoclue_conf
check_packages
