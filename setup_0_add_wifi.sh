#!/bin/bash
#= setup_0_add_wifi.sh

SETUP_A="setup_a_before_net.sh"
SETUP_B="setup_b_after_net.sh"
SETUP_0="setup_0_add_wifi.sh"

# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - 
# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - 
# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - 
# parts from: raspi-config ==> https://github.com/RPi-Distro/raspi-config
#
# <raspi-config>

CONFIG=/boot/config.txt

USER=${SUDO_USER:-$(who -m | awk '{ print $1 }')}

is_pi () {
  ARCH=$(dpkg --print-architecture)
  if [ "$ARCH" = "armhf" ] || [ "$ARCH" = "arm64" ] ; then
    return 0
  else
    return 1
  fi
}

if is_pi ; then
  CMDLINE=/boot/cmdline.txt
else
  CMDLINE=/proc/cmdline
fi

is_pione() {
  if grep -q "^Revision\s*:\s*00[0-9a-fA-F][0-9a-fA-F]$" /proc/cpuinfo; then
    return 0
  elif grep -q "^Revision\s*:\s*[ 123][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]0[0-36][0-9a-fA-F]$" /proc/cpuinfo ; then
    return 0
  else
    return 1
  fi
}

is_pitwo() {
  grep -q "^Revision\s*:\s*[ 123][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]04[0-9a-fA-F]$" /proc/cpuinfo
  return $?
}

is_pizero() {
  grep -q "^Revision\s*:\s*[ 123][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]0[9cC][0-9a-fA-F]$" /proc/cpuinfo
  return $?
}

is_pifour() {
  grep -q "^Revision\s*:\s*[ 123][0-9a-fA-F][0-9a-fA-F]3[0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]$" /proc/cpuinfo
  return $?
}

get_pi_type() {
  if is_pione; then
    echo 1
  elif is_pitwo; then
    echo 2
  else
    echo 0
  fi
}

set_config_var() {
  lua - "$1" "$2" "$3" <<EOF > "$3.bak"
local key=assert(arg[1])
local value=assert(arg[2])
local fn=assert(arg[3])
local file=assert(io.open(fn))
local made_change=false
for line in file:lines() do
  if line:match("^#?%s*"..key.."=.*$") then
    line=key.."="..value
    made_change=true
  end
  print(line)
end

if not made_change then
  print(key.."="..value)
end
EOF
mv "$3.bak" "$3"
}

clear_config_var() {
  lua - "$1" "$2" <<EOF > "$2.bak"
local key=assert(arg[1])
local fn=assert(arg[2])
local file=assert(io.open(fn))
for line in file:lines() do
  if line:match("^%s*"..key.."=.*$") then
    line="#"..line
  end
  print(line)
end
EOF
mv "$2.bak" "$2"
}

get_config_var() {
  lua - "$1" "$2" <<EOF
local key=assert(arg[1])
local fn=assert(arg[2])
local file=assert(io.open(fn))
local found=false
for line in file:lines() do
  local val = line:match("^%s*"..key.."=(.*)$")
  if (val ~= nil) then
    print(val)
    found=true
    break
  end
end
if not found then
   print(0)
end
EOF
}

is_number() {
  case $1 in
    ''|*[!0-9]*) return 0 ;;
    *) return 1 ;;
  esac
}

get_hostname() {
  cat /etc/hostname | tr -d " \t\n\r"
}

get_ssh() {
  if service ssh status | grep -q inactive; then
    echo 1
  else
    echo 0
  fi
}

list_wlan_interfaces() {
  for dir in /sys/class/net/*/wireless; do
    if [ -d "$dir" ]; then
      basename "$(dirname "$dir")"
    fi
  done
}

# </raspi-config>
# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - 
# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - 
# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - 

#
MYUID=$( id -u )
if [ $MYUID != 0 ]; then
  echo "# provide your password for 'sudo':" ; sudo "$0" "$@" ; exit 1 ;
fi

# wifi ssid psk
echo "# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - "
echo "# NEXT: setting WiFi wlan0 SSID and PSK (opens whiptail-dialog, press <Enter> to start) ..."
read
#
SSID=""
while [ -z "$SSID" ]; do
  SSID=$(whiptail --inputbox "Please enter SSID" 20 60 3>&1 1>&2 2>&3)
  if [ $? -ne 0 ]; then
    # return 0
    SSID="none"
  elif [ -z "$SSID" ]; then
    whiptail --msgbox "SSID cannot be empty. Please try again." 20 60
  fi
done
#
PASSPHRASE=$(whiptail --passwordbox "Please enter passphrase. Leave it empty if none." 20 60 3>&1 1>&2 2>&3)
#
# Escape special characters for embedding in regex below
local ssid="$(echo "$SSID" \
  | sed 's;\\;\\\\;g' \
  | sed -e 's;\.;\\\.;g' \
        -e 's;\*;\\\*;g' \
        -e 's;\+;\\\+;g' \
        -e 's;\?;\\\?;g' \
        -e 's;\^;\\\^;g' \
        -e 's;\$;\\\$;g' \
        -e 's;\/;\\\/;g' \
        -e 's;\[;\\\[;g' \
        -e 's;\];\\\];g' \
        -e 's;{;\\{;g'   \
        -e 's;};\\};g'   \
        -e 's;(;\\(;g'   \
        -e 's;);\\);g'   \
        -e 's;";\\\\\";g')"

wpa_cli -i "$IFACE" list_networks \
  | tail -n +2 | cut -f -2 | grep -P "\t$ssid$" | cut -f1 \
  | while read ID; do
  wpa_cli -i "$IFACE" remove_network "$ID" > /dev/null 2>&1
done

ID="$(wpa_cli -i "$IFACE" add_network)"
wpa_cli -i "$IFACE" set_network "$ID" ssid "\"$SSID\"" 2>&1 | grep -q "OK"
RET=$((RET + $?))

if [ -z "$PASSPHRASE" ]; then
  wpa_cli -i "$IFACE" set_network "$ID" key_mgmt NONE 2>&1 | grep -q "OK"
  RET=$((RET + $?))
else
  wpa_cli -i "$IFACE" set_network "$ID" psk "\"$PASSPHRASE\"" 2>&1 | grep -q "OK"
  RET=$((RET + $?))
fi

if [ $RET -eq 0 ]; then
  wpa_cli -i "$IFACE" enable_network "$ID" > /dev/null 2>&1
else
  wpa_cli -i "$IFACE" remove_network "$ID" > /dev/null 2>&1
  if [ "$INTERACTIVE" = True ]; then
    whiptail --msgbox "Failed to set SSID or passphrase" 20 60
  fi
fi
wpa_cli -i "$IFACE" save_config > /dev/null 2>&1

echo "$IFACE_LIST" | while read IFACE; do
  wpa_cli -i "$IFACE" reconfigure > /dev/null 2>&1
done
#
echo "# done."
echo "# "
echo "# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - "

#-EOF
