#!/bin/sh

COMMAND=$1

case $COMMAND in
	up)
		brightnessctl set +5%
		;;
	down)
		brightnessctl set 5%-
		;;
esac

brightness_perc=$(brightnessctl -m | awk -F',' '{print $4+0}')

#echo $brightness_perc > /tmp/wobpipe
~/.config/labwc/wob_caller.sh $brightness_perc
