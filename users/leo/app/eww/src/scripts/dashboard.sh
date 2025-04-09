#!/usr/bin/env bash

FLAG_FILE="/home/leonardo/.cache/eww_dashboard.flag"

if [[ ! `pidof eww` ]]; then
	eww daemon
	sleep 1
fi

if [[ ! -f "$FLAG_FILE" ]]; then
	touch "$FLAG_FILE"
	eww open dashboard
else
	eww close dashboard
	rm "$FLAG_FILE"
fi
