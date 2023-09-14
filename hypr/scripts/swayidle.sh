#!/bin/bash

isFullScreen() {
    xdotool search --onlyvisible --class ".*" getwindowgeometry --shell 2>/dev/null | grep "_NET_WM_STATE(ATOM) = _NET_WM_STATE_FULLSCREEN" &> /dev/null
    return $?
}

isAppRunning() {
    local apps=("zoom" "vlc")
    for app in "${apps[@]}"; do
        if pgrep -x "$app" > /dev/null; then
            return 0
        fi
    done
    return 1
}

shouldLock() {
    if isFullScreen || isAppRunning; then
        return 1
    fi
    return 0
}

swayidle -w \
    timeout 290 'if ! shouldLock; then notify-send -u critical "Locking..." -t 5000; fi' \
    timeout 295 'if ! shouldLock; then notify-send -u critical "Bye!" -t 5000; fi' \
    timeout 300 'if ! shouldLock; then swaylock -C ~/.config/swaylock/config; fi' \
    timeout 600 'if ! shouldLock; then swaymsg "output * dpms off"; fi' \
    timeout 1200 'if ! shouldLock; then systemctl suspend; fi' \
    resume 'swaymsg "output * dpms on"' \
    before-sleep 'swaylock -C ~/.config/swaylock/config' &
