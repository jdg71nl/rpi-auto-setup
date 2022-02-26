#!/bin/bash
#= generate__setup_rpi.sh

TOP="setup_rpi_top.sh"
MID="setup_rpi_mid.txt"
BOT="setup_rpi_bot.sh"
OUT="setup_rpi.sh"

case "$(uname -s)" in
  Darwin)                         PLAT='MacOS' ;;
  Linux)                          PLAT='Linux' ;;
  CYGWIN*|MINGW32*|MSYS*|MINGW*)  PLAT='Windows' ;;
  *)                              PLAT='Unknown' ;;
esac
# echo "# detected platform '${PLAT}' "
# usage: if [ "${PLAT}" == "Linux" ]; then echo "# detected Linux" ; fi

if [ -f ${MID} ]; then
  rm ${MID}
fi

tar czf - setup_?_*.sh | openssl base64 > ${MID}

cat ${TOP} ${MID} ${BOT} > ${OUT}

if [ "${PLAT}" == "MacOS" ]; then
  sed -i "" 's/setup_rpi_top.sh/setup_rpi.sh/' ${OUT}
else 
  sed -i    's/setup_rpi_top.sh/setup_rpi.sh/' ${OUT}
fi

chmod +x ${OUT}

#-EOF
