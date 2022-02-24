#!/bin/bash
#= setup_rpi.sh

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
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
HERE

echo "# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - "
echo "# Next steps: "
echo "# 1. before internet: run script           (do as root)>    ${SETUP_A}   "
echo "# 2. reboot (to set wifi-country) "
echo "# 3. if no ethernet: select wifi-network:  (do as root)>    ${SETUP_0}   "
echo "# 4. with internet: run script             (do as root)>    ${SETUP_B}   "
echo "# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - "

#-EOF