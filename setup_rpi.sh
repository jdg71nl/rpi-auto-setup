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
echo "# > cd /root/   ... "
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
pOd//tVkdQBQAAA=
HERE

echo "# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - "
echo "# Next steps: "
echo "# 1. before internet: run script           (do as root)>    ${SETUP_A}   "
echo "# 2. reboot (to set wifi-country) "
echo "# 3. if no ethernet: select wifi-network:  (do as root)>    ${SETUP_0}   "
echo "# 4. with internet: run script             (do as root)>    ${SETUP_B}   "
echo "# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - "

#-EOF
