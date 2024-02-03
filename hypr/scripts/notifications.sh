#!/bin/bash

selected=$(dunstctl history | jq -r '.data[][] | "\(.id.data) | \(.appname.data) - \(.summary.data): \(.body.data)"' | wofi --show=dmenu -n | cut -d '|' -f1 | xargs)

if [ -n "$selected" ]; then
  dunstctl history-rm "$selected"
fi
