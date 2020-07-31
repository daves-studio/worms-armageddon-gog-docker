set -e

BASEDIR=$(dirname "$0")
cd $BASEDIR/files

if [ ! -f setup_worms_armageddon_2.0.0.2.exe ]; then
  echo "You need to download 'setup_worms_armageddon_2.0.0.2.exe' offline installer"
  echo "from GOG and put it in files directory for this script to work!"
  exit 1
fi

if [ ! -f docker-wine ]; then
  wget https://raw.githubusercontent.com/scottyhardy/docker-wine/master/docker-wine
  chmod +x docker-wine
fi

if [ ! -f WA_update-3.8_\[CD\]_Installer.exe ]; then
  wget https://worms2d.info/files/WA_update-3.8_%5BCD%5D_Installer.exe
fi

if [ ! -f wkWormNAT2-tfgdbproxy.zip ]; then
  wget https://github.com/daves-studio/MyWormNET2/releases/download/v1.0.1/wkWormNAT2-tfgdbproxy.zip
fi


./docker-wine --volume="$(pwd):/home/wineuser/WA/" --as-root /bin/bash -c "/home/wineuser/WA/client-install.sh"
