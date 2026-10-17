#!/usr/bin/env bash
# Usage: screenshot.sh full|area|window — saves to ~/Pictures/Screenshots and copies to clipboard.
set -euo pipefail

mode="${1:-full}"
dir="${HOME}/Pictures/Screenshots"
file="${dir}/$(date +%Y-%m-%d_%H-%M-%S).png"
mkdir -p "${dir}"

focused_window_geometry() {
    swaymsg -t get_tree | jq -r '.. | select(.focused? == true) | .rect | "\(.x),\(.y) \(.width)x\(.height)"'
}

case "${mode}" in
    full)   grim "${file}" ;;
    area)   grim -g "$(slurp)" "${file}" ;;
    window) grim -g "$(focused_window_geometry)" "${file}" ;;
    *) echo "unknown mode: ${mode}" >&2; exit 1 ;;
esac

wl-copy < "${file}"
notify-send -i "${file}" "Screenshot saved" "${file##*/} (copied to clipboard)"
