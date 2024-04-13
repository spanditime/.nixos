#!/usr/bin/env bash
BAT=$(upower -i `upower -e | grep 'BAT'` | grep 'percentage' | cut -d':' -f2 | tr -d '%,[:blank:]')
AC=$(upower -i `upower -e | grep 'BAT'` | grep 'state' | cut -d':' -f2 | tr -d '[:blank:]')

if [[ "$AC" == "charging" ]]; then
	echo "*$BAT"
elif [[ "$AC" == "fully-charged" ]]; then
	echo "*$BAT"
else
	echo "-$BAT"
fi
