# rpi-auto-setup

Personal bash setup script for auto-setup a RPI running Raspberry Pi OS

## usage

~~~shell
# run this script:

> curl https://j71.nl/rpi | bash

# contents of this file:

> cat rpi

#!/bin/bash
#= rpi.sh
# https://github.com/jdg71nl/rpi-auto-setup
# git clone https://github.com/jdg71nl/rpi-auto-setup.git
# git clone git@github.com:jdg71nl/rpi-auto-setup.git
set -o xtrace
cd $HOME
curl -fsOL https://raw.githubusercontent.com/jdg71nl/rpi-auto-setup/main/setup_rpi.sh
chmod +x setup_rpi.sh
#-eof

# then run locally on (fresh) RPI:

> setup_rpi.sh

#
~~~
