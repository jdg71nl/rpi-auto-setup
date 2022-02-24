#!/bin/bash
#= generate__setup_rpi.sh

TOP="setup_rpi_top.sh"
MID="setup_rpi_mid.txt"
BOT="setup_rpi_bot.sh"
OUT="setup_rpi.sh"

if [ -f ${MID} ]; then
  rm ${MID}
fi

tar czf - setup_?_*.sh | openssl base64 > ${MID}

cat ${TOP} ${MID} ${BOT} > ${OUT}
sed -i 's/setup_rpi_top.sh/setup_rpi.sh/' ${OUT}
chmod +x ${OUT}

#-EOF
