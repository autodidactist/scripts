#!/bin/sh

set -xe

mpv --geometry=-0-0 --autofit=30% --untimed --no-cache --no-osc \
--no-input-default-bindings --profile=low-latency  \
--input-conf=~/.config/mpv/input.conf --title=webcam $(ls /dev/video[0,2,4,6,8] | tail -n 1)
