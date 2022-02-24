#!/bin/bash
#= setup_rpi_top.sh

SETUP_A="setup_a_before_net.sh"
SETUP_B="setup_b_after_net.sh"
SETUP_0"setup_0_add_wifi.sh"

#
MYUID=$( id -u )
if [ $MYUID != 0 ]; then
  echo "# provide your password for 'sudo':" ; sudo "$0" "$@" ; exit 1 ;
fi

#
cd /root/
#
echo "# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - "
echo "# NEXT: extracting <internal>.tgz.base64.txt ..."
#
rm -f setup_?_*.sh
#
# cat <<HERE > ${BASE}
cat <<HERE | openssl base64 -d | tar xvzf - 
