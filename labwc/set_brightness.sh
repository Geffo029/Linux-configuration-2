#!/bin/sh

COMMAND=$1

case $COMMAND in
	up)
		brightnessctl set +10%
		;;
	down)
		brightnessctl set 10%-
		;;
esac

brightness_perc=$(brightnessctl -m | awk -F',' '{print $4+0}')

echo $brightness_perc > /tmp/wobpipe
