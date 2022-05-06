#!/usr/bin/bash

ffmpeg -y \
	-f pulse -i 1 \
	-f pulse -i 2 \
	-filter_complex "[0:0] [1:0] amerge" \
	recording.mp3 && \
	mpv recording.mp3
	# -acodec libmp3lame -ab 320k \
# 1	alsa_input.usb-046d_C922_Pro_Stream_Webcam_1E2ECEAF-02.iec958-stereo	module-alsa-card.c	s16le 2ch 32000Hz	RUNNING
# 2	alsa_output.pci-0000_09_00.4.analog-stereo.monitor	module-alsa-card.c	s16le 2ch 44100Hz	RUNNING
# 3	alsa_input.pci-0000_09_00.4.analog-stereo	module-alsa-card.c	s16le 2ch 44100Hz	RUNNING
# 6	alsa_output.pci-0000_07_00.1.hdmi-stereo.monitor	module-alsa-card.c	s16le 2ch 44100Hz	RUNNING
