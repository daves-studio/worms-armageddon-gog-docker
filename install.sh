#!/bin/bash

set -e

BASEDIR=$(dirname "$0")
cd $BASEDIR/files

if [ ! -f setup_worms_armageddon_2.0.0.2.exe ]; then
  echo "You need to download 'setup_worms_armageddon_2.0.0.2.exe' offline installer"
  echo "from GOG and put it in files directory for this script to work!"
  exit 1
fi

if which wget >/dev/null; then
  echo "Using wget"
  tool="wget"
elif which curl >/dev/null; then
  echo "Using curl"
  tool="curl"
else
  echo "Could not find wget or curl on system"
  exit 1
fi

if [ ! -f docker-wine ]; then
  if [ "$tool" = "wget" ]; then
    wget https://raw.githubusercontent.com/scottyhardy/docker-wine/master/docker-wine
  else
    curl https://raw.githubusercontent.com/scottyhardy/docker-wine/master/docker-wine -o docker-wine
  fi
  chmod +x docker-wine
fi

if [ ! -f WA_update-3.8_\[CD\]_Installer.exe ]; then
  if [ "$tool" = "wget" ]; then
    wget https://worms2d.info/files/WA_update-3.8_%5BCD%5D_Installer.exe
  else
    curl https://worms2d.info/files/WA_update-3.8_%5BCD%5D_Installer.exe -o WA_update-3.8_[CD]_Installer.exe
  fi
fi

if [ ! -f wkWormNAT2-tfgdbproxy.zip ]; then
  if [ "$tool" = "wget" ]; then
    wget https://github.com/daves-studio/MyWormNET2/releases/download/v1.0.1/wkWormNAT2-tfgdbproxy.zip
  else
    curl https://github.com/daves-studio/MyWormNET2/releases/download/v1.0.1/wkWormNAT2-tfgdbproxy.zip -o wkWormNAT2-tfgdbproxy.zip
  fi
fi
#
# # Initialise .wine folder
# ./docker-wine wine cmd.exe /C "echo Initialised .wine folder"
#
# # Install WA
# # Have to run as root as we need to use apt in container
# ./docker-wine --volume="$(pwd):/home/wineuser/WA/" --as-root /bin/bash -c "/home/wineuser/WA/WA-install.sh"
