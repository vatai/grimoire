#!/usr/bin/env python3
"""Emit the current playerctl track as waybar JSON, one line per change."""
import json
import subprocess
import sys


def emit(player, status, title):
    icon = "spotify" if "spotify" in player else "default"
    text = "" if status == "Stopped" or not title else f"{'' if status == 'Playing' else ''} {title}"
    print(json.dumps({"text": text, "alt": icon, "class": status.lower()}), flush=True)


def follow_metadata():
    fmt = "{{playerName}}|{{status}}|{{artist}} - {{title}}"
    proc = subprocess.Popen(["playerctl", "metadata", "--follow", "--format", fmt], stdout=subprocess.PIPE, text=True)
    for line in proc.stdout:
        player, status, title = (line.rstrip("\n").split("|", 2) + ["", ""])[:3]
        emit(player, status, title.strip(" -"))


if __name__ == "__main__":
    try:
        follow_metadata()
    except KeyboardInterrupt:
        sys.exit(0)
