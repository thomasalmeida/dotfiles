#!/bin/bash

status=$(playerctl -p spotify status)

if [[ "$status" == "Playing" ]]; then
    artist=$(playerctl -p spotify metadata artist)
    title=$(playerctl -p spotify metadata title)

    artist=$(echo "$artist" | cut -c1-50)
    title=$(echo "$title" | cut -c1-50)

    text="$artist - $title"
elif [[ "$status" == "Paused" ]]; then
    text="paused"
else
    text=""
fi

echo -e "{\"text\":\"$text\", \"class\":\"$status\"}"
