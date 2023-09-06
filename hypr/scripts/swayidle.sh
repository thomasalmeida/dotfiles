#!/bin/bash

isFullScreen() {
    xdotool search --onlyvisible --class ".*" getwindowgeometry --shell 2>/dev/null | grep "_NET_WM_STATE(ATOM) = _NET_WM_STATE_FULLSCREEN" &> /dev/null
    return $?
}

isAppRunning() {
    local apps=("Zoom" "vlc")
    for app in "${apps[@]}"; do
        if pgrep -x "$app" > /dev/null; then
            return 1
        fi
    done
    return 0
}

shouldLock() {
    if isFullScreen || isAppRunning; then
        return 1
    fi
    return 0
}

swayidle -w \
    timeout 290 'if ! shouldLock; then notify-send "Locking..." -t 5000; fi' \
    timeout 295 'if ! shouldLock; then notify-send "Bye!" -t 5000; fi' \
    timeout 300 'if ! shouldLock; then swaylock -C ~/.config/swaylock/config; fi' \
    timeout 600 'if ! shouldLock; then hyprctl dispatch dpms off; fi' \
    timeout 1200 'if ! shouldLock; then systemctl suspend; fi' \
    resume 'hyprctl dispatch dpms on' \
    before-sleep 'swaylock -C ~/.config/swaylock/config' &

