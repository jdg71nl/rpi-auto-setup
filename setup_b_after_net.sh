#!/bin/bash
#= setup_b_after_net.sh

SETUP_A="setup_a_before_net.sh"
SETUP_B="setup_b_after_net.sh"
SETUP_0="setup_0_add_wifi.sh"

#
MYUID=$( id -u )
if [ $MYUID != 0 ]; then
  echo "# provide your password for 'sudo':" ; sudo "$0" "$@" ; exit 1 ;
fi

#
echo "# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - "
echo "# NEXT: apt update & apt install ..."
#
apt update && apt install -y lsof htop vim curl git telnet openvpn libdevice-serialport-perl libjson-perl libjson-maybexs-perl liblwp-useragent-determined-perl minicom ntp python3-smbus i2c-tools
#
apt purge -y rfkill
# && rm -rf /var/lib/apt/lists/*
echo "# done."
echo "# "

#
echo "# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - "
echo "# NEXT: enabling SSH daemon ..."
ssh-keygen -A &&
update-rc.d ssh enable &&
invoke-rc.d ssh start
echo "# done."
echo "# "

echo "# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - "
echo "# NEXT: installing opensssetup  ..."
cd /root/ && if [ ! -d ./opensyssetup/ ]; then git clone https://github.com/jdg71nl/opensyssetup.git && ./opensyssetup/setup.sh ; fi
sudo -u jdg -- sh -c "cd /home/jdg/ && if [ ! -d ./opensyssetup/ ]; then git clone https://github.com/jdg71nl/opensyssetup.git && ./opensyssetup/setup.sh ; fi"
echo "# done."
echo "# "

#-EOF
