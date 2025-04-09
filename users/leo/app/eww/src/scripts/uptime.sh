#!/usr/bin/env bash

CONTROL="$(uptime -p | awk '{print $3}')"

if [[ $CONTROL = "minutes" || $CONTROL = "minute" || $CONTROL = "minutes," || $CONTROL = "minute," ]]; then
	MIN=$(uptime -p | awk '{print $2}')
	MIN+="min"
	echo "$MIN"
elif [[ $CONTROL = "hours" || $CONTROL = "hour" || $CONTROL = "hours," || $CONTROL = "hour," ]]; then
	HOUR=$(uptime -p | awk '{print $2}')
	HOUR+="h"
	HOUR+=$(uptime -p | awk '{print $4}')
	HOUR+="min"
	echo "$HOUR"
elif [[ $CONTROL = "days" || $CONTROL = "day" || $CONTROL = "days," || $CONTROL = "day," ]]; then
	DAY=$(uptime -p | awk '{print $2}')
	DAY+="d"
	DAY+=$(uptime -p | awk '{print $4}')
	DAY+="h"
	DAY+=$(uptime -p | awk '{print $6}')
	DAY+="min"
	echo "$DAY"
else
	echo "error"
fi
