#!/bin/bash
#= setup_a_before_net.sh

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

#
echo "# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - "
echo "# NEXT: check user jdg ..."
#
# > openssl rand -base64 29 | tr -d "=+/" | cut -c1-25
# wlOZuprceKIXgsxBfMZBWVyj1
#
# note: -5 = SHA256-based password algorithm
# > echo "mysecret" | openssl passwd -5 -salt 'wlOZuprceKIXgsxBfMZBWVyj1' -stdin
# $5$wlOZuprceKIXgsxB$W67Tds1fRXL2FNtMVF8KKJXNLCYeeZ30uXrV8n26oFD
#
# > echo "mysecret" | openssl passwd -5 -salt $(openssl rand -base64 29 | tr -d "=+/" | cut -c1-25) -stdin
# $5$o1QSFz3UjYlLR48L$QhTgjwpVMuokcxmpqFKhiSko6u/zqNalPPu3W1AxyTA
#
# generated 'ourpassword' using above SHA256 algo:
HASH='$5$bEOE6br5fYLb7VpA$y.pLTM4svrjgEJT8uS33N5rt6oPM6/YVTWvYn.d6FdB'
#
if ! id -u jdg ; then
  echo "# user 'jdg' does not exist, creating .."
  useradd -m -p ${HASH} jdg
  adduser jdg sudo
  #
  cp ${SETUP_C} /home/jdg
  chmod 755 /home/jdg/${SETUP_C}
  chown jdg:jdg /home/jdg/${SETUP_C}
else
  echo "# user 'jdg' does exist, updating pwd .."
  echo "jdg:${HASH}" | chpasswd -e 
fi
echo "# done."
echo "# "

#
echo "# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - "
echo "# NEXT: (re)setting pwd for default users: pi, root .."
echo "pi:${HASH}"      | chpasswd -e 
echo "root:${HASH}"    | chpasswd -e 
echo "# done."
echo "# "

#
echo "# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - "
echo "# NEXT: update sudo ..."
SUDOERS="/etc/sudoers"
sed -i  's/^%sudo.*$/# &/' ${SUDOERS}
sed -i  's/^Defaults editor=.*$/# &/' ${SUDOERS}
cat <<HERE >> ${SUDOERS}
Defaults editor=/usr/bin/vim
%sudo ALL=(ALL) NOPASSWD:ALL
HERE
echo "# done."
echo "# "

#
echo "# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - "
echo "# NEXT: (re)setting keyboard map to 'pc101' .."
KEYB="/etc/default/keyboard"
#
cat <<HERE >> ${KEYB}
#= /etc/default/keyboard
# KEYBOARD CONFIGURATION FILE
# Consult the keyboard(5) manual page.
XKBMODEL="pc101"
XKBLAYOUT="us"
XKBVARIANT=""
XKBOPTIONS=""
BACKSPACE="guess"
#-EOF
HERE
dpkg-reconfigure -f noninteractive keyboard-configuration
echo "# done."
echo "# "

echo "# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - "
echo "# NEXT: setting locale to 'en_US.UTF-8' ..."
#
# > cat /etc/locale.gen | egrep -v '^#'
# en_US.UTF-8 UTF-8
#
LOCALE="/etc/locale.gen"
cat <<HERE > ${LOCALE}
en_US.UTF-8 UTF-8
HERE
update-locale --no-checks LANG
update-locale --no-checks "LANG=en_US.UTF-8"
dpkg-reconfigure -f noninteractive locales
echo "# done."
echo "# "

echo "# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - "
echo "# NEXT: setting Wifi country to 'nl' ..."
#
# > wpa_cli -i wlan0 status
# bssid=f4:2e:7f:79:9e:a4
# freq=2462
# ssid=LB21 Gast
# id=0
# mode=station
# pairwise_cipher=CCMP
# group_cipher=CCMP
# key_mgmt=WPA2-PSK
# wpa_state=COMPLETED
# ip_address=10.21.88.101
# p2p_device_address=ba:27:eb:2c:a4:db
# address=b8:27:eb:2c:a4:db
# uuid=b8f683d3-78ad-5038-b4c0-b3513d50100c
#
IFACE_LIST="$(list_wlan_interfaces)"
IFACE="$(echo "$IFACE_LIST" | head -n 1)"  # > echo $IFACE  ==> wlan0
#
COUNTRY="nl"  # > sudo wpa_cli -i "$IFACE" get country ==> nl
#
wpa_cli -i "$IFACE" set country "$COUNTRY"
wpa_cli -i "$IFACE" save_config > /dev/null 2>&1
if iw reg set "$COUNTRY" 2> /dev/null; then
  ASK_TO_REBOOT=1
fi
if hash rfkill 2> /dev/null; then
  rfkill unblock wifi
  if is_pi ; then
    for filename in /var/lib/systemd/rfkill/*:wlan ; do
      echo 0 > $filename
    done
  fi
fi
echo "# done."
echo "# "

# Wifi ssid
echo "# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - "
echo "# NEXT: setting some default WiFi SSID ..."
#
ID="$(wpa_cli -i "$IFACE" add_network)"
SSID="LB21 Gast"
PASSPHRASE="gastinlb21"
wpa_cli -i "$IFACE" set_network "$ID" ssid "\"$SSID\"" 2>&1 | grep -q "OK"
wpa_cli -i "$IFACE" set_network "$ID" psk "\"$PASSPHRASE\"" 2>&1 | grep -q "OK"
wpa_cli -i "$IFACE" enable_network "$ID" > /dev/null 2>&1
wpa_cli -i "$IFACE" save_config > /dev/null 2>&1
wpa_cli -i "$IFACE" reconfigure > /dev/null 2>&1
#
ID="$(wpa_cli -i "$IFACE" add_network)"
SSID="The Hague Tech"
PASSPHRASE="onceuponatime"
wpa_cli -i "$IFACE" set_network "$ID" ssid "\"$SSID\"" 2>&1 | grep -q "OK"
wpa_cli -i "$IFACE" set_network "$ID" psk "\"$PASSPHRASE\"" 2>&1 | grep -q "OK"
wpa_cli -i "$IFACE" enable_network "$ID" > /dev/null 2>&1
wpa_cli -i "$IFACE" save_config > /dev/null 2>&1
wpa_cli -i "$IFACE" reconfigure > /dev/null 2>&1
#
echo "# done."
echo "# "

# serial
echo "# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - "
echo "# NEXT: enabling serial ..."
set_config_var enable_uart 1 $CONFIG
set_config_var dtoverlay disable-bt $CONFIG
systemctl disable hciuart
echo "# done."
echo "# "

# hdmi
echo "# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - "
echo "# NEXT: enabling hdmi hotplug ..."
set_config_var hdmi_force_hotplug 1 $CONFIG
echo "# done."
echo "# "

echo "# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - "
echo "# NEXT: setting timezone to 'Europe/Amsterdam' ..."
#
# > cat /etc/timezone 
# Europe/Amsterdam
#
rm /etc/localtime
echo "Europe/Amsterdam" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata
echo "# done."
echo "# "

echo "# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - "
echo "# Next steps: "
echo "# 1. before internet: run script           (do as root)>    ${SETUP_A}   <<=== DONE NOW "
echo "# 2. reboot (to set wifi-country) "
echo "# 3. if no ethernet: select wifi-network:  (do as root)>    ${SETUP_0}   "
echo "# 4. with internet: run script             (do as root)>    ${SETUP_B}   "
echo "# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - "

#-EOF
