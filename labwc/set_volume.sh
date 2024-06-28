#!/usr/bin/env bash

COMMAND=$1

SINK=@DEFAULT_SINK@
#SINK=1

#volume=$(pactl list sinks | grep 'Volume:' | head -n 1 | awk '{print $5}' | sed 's/[^0-9]*//g')

case $COMMAND in
	up)
		wpctl set-volume -l 1 $SINK "10%+" > /dev/null
		;;
	down)
		wpctl set-volume $SINK "10%-" > /dev/null
		;;
	mute)
		wpctl set-mute $SINK toggle > /dev/null
		;;
esac


volume=$(wpctl get-volume @DEFAULT_SINK@ | awk '{print $2}')
volume_perc=$(printf "%.0f" $(echo $volume*100 | bc))

echo $volume_perc > /tmp/wobpipe
