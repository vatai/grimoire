#!/usr/bin/env bash
# Power menu rendered with wofi in dmenu mode.
set -euo pipefail

declare -A actions=(
    ["  Lock"]="swaylock -f"
    ["  Suspend"]="systemctl suspend"
    ["  Logout"]="swaymsg exit"
    ["  Reboot"]="systemctl reboot"
    ["  Shutdown"]="systemctl poweroff"
)
order=("  Lock" "  Suspend" "  Logout" "  Reboot" "  Shutdown")

choice=$(printf '%s\n' "${order[@]}" | fuzzel --dmenu --prompt "Power " --lines 5 --width 22)
[[ -n "${choice}" ]] && exec ${actions[${choice}]}
