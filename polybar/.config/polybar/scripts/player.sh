#!/bin/sh

player_status=$(playerctl status 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
    echo "%{F$(xrdb -get primary)}%{F-} $(playerctl metadata artist) - $(playerctl metadata title)"
elif [ "$player_status" = "Paused" ]; then
    echo "%{F$(xrdb -get primary)}%{F-} $(playerctl metadata artist) - $(playerctl metadata title)"
else
    echo "%{F$(xrdb -get primary)}%{F-} %{F#707880}Nothing is playing.%{F-}"
fi