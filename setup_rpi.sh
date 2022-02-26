#!/bin/bash
#= setup_rpi.sh

SETUP_A="setup_a_before_net.sh"
SETUP_B="setup_b_after_net.sh"
SETUP_0="setup_0_add_wifi.sh"

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
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAA==
HERE

echo "# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - "
echo "# Next steps: "
echo "# 1. before internet: run script           (do as root)>    ${SETUP_A}   "
echo "# 2. reboot (to set wifi-country) "
echo "# 3. if no ethernet: select wifi-network:  (do as root)>    ${SETUP_0}   "
echo "# 4. with internet: run script             (do as root)>    ${SETUP_B}   "
echo "# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - "

#-EOF
