#!/usr/bin/bash

OUTPUT="${HOME}/rec-$(date '+%Y%m%d-%H%M%S').mp3"

ffmpeg -y -f pulse -i 1 -f pulse -i 2 \
	-filter_complex "[0] [1] amerge" \
	"${OUTPUT}"
