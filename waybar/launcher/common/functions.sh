# functions.sh

function send_notification() {
  local user=$(who | awk '{print $1}' | head -1)
  local uid=$(id -u "$user")
  sudo -u "$user" DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$uid/bus" notify-send "$1" "$2"
}
