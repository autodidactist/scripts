#!/bin/bash

if pgrep -x "redshift" > /dev/null
then
    # killall redshift
    redshift -x
    notify-send "Redshift Resetting to Normal🌅"
else
    redshift -O 4000K -b 0.8 &
    notify-send "Redshifting to Sepia 😴"
fi
