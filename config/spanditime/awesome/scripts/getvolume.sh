#!/usr/bin/env bash
volume=$(pamixer --get-volume)
muted=$(pamixer --get-volume-human | grep -e muted)
if [ "$muted" = "muted" ]; then echo "*$volume"; else echo "%$volume"; fi
