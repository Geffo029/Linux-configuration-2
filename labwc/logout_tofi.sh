#!/bin/bash

RET=$(echo -e "Cancel\nLogout\nSuspend\nReboot\nShutdown" | tofi)

case $RET in
	Shutdown) systemctl poweroff ;;
	Reboot) systemctl reboot ;;
	Suspend) systemctl suspend ;;
	Logout) labwc --exit ;;
	*) ;;
esac
