set -e

BASEDIR=$(dirname "$0")
cd $BASEDIR/files

./docker-wine  ${@} wine /home/wineuser/.wine/drive_c/Program\ Files\ \(x86\)/WA/WA.exe
