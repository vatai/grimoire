#!/bin/sh
gsettings set org.gnome.desktop.interface color-scheme "prefer-$1"
case "$1" in
    dark)  gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark ;;
    light) gsettings set org.gnome.desktop.interface gtk-theme Adwaita ;;
esac
emacsclient --eval "(dynamic-theme-$1-mode)" >/dev/null 2>&1 || true
