#!/usr/bin/bash
if [ "$#" -ne 3 ]; then
    echo "useage: $0 file start_time duration"
    exit
fi

input=$1
start=$2
duration=$3
ffmpeg -c -i $input -ss $start -t $duration -async 1 cut_$start.mp4
