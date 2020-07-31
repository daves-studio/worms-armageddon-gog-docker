set -e

if [ ! -f "/home/wineuser/.wine/drive_c/Program Files (x86)/WA/WABaseComplete.txt" ]; then
  # Install Dependencies
  apt update
  apt install -y innoextract unzip

  # Setup WA Folder
  rm -rf /home/wineuser/.wine/drive_c/Program\ Files\ \(x86\)/WA
  mkdir -p /home/wineuser/.wine/drive_c/Program\ Files\ \(x86\)/WA
  chown -R wineuser:wineuser /home/wineuser/.wine/

  # Install WA Base Game
  cd /home/wineuser/.wine/drive_c/Program\ Files\ \(x86\)/WA
  innoextract /home/wineuser/WA/setup_worms_armageddon_2.0.0.2.exe
  rm -r tmp/
  mv app/* ./
  rm -r app/

  # Install WormNAT2 WormKit Module
  unzip /home/wineuser/WA/wkWormNAT2-tfgdbproxy.zip -d /home/wineuser/.wine/drive_c/Program\ Files\ \(x86\)/WA
  cp /home/wineuser/.wine/drive_c/Program\ Files\ \(x86\)/WA/wkWormNAT2/*.dll /home/wineuser/.wine/drive_c/Program\ Files\ \(x86\)/WA/

  # Create/Update Registry with WormsArmageddon data
  if [ ! -f "/home/wineuser/.wine/user.reg" ]; then
    cp /home/wineuser/WA/new.reg /home/wineuser/.wine/user.reg
  fi
  cat /home/wineuser/WA/user.reg >> /home/wineuser/.wine/user.reg
  chown wineuser:wineuser /home/wineuser/.wine/user.reg

  # Fix permissions for users
  chown -R wineuser:wineuser /home/wineuser/.wine/drive_c/Program\ Files\ \(x86\)/WA

  # Stage Complete
  su wineuser -c "touch /home/wineuser/.wine/drive_c/Program\ Files\ \(x86\)/WA/WABaseComplete.txt"
  echo "Successfully Installed WA Base"
else
  echo "WA Base already installed in Wine"
fi

if [ ! -f "/home/wineuser/.wine/drive_c/Program Files (x86)/WA/WAComplete.txt" ]; then
  cd /home/wineuser/.wine/drive_c/Program\ Files\ \(x86\)/WA

  # Install WA 3.8 Patch (CD Version) (Not Automatic)
  su wineuser -c "wine /home/wineuser/WA/WA_update-3.8_[CD]_Installer.exe"
  # Patch WA.exe to turn it back into GoG version
  python3 -c "f=open(r'/home/wineuser/.wine/drive_c/Program Files (x86)/WA/WA.exe', 'r+b'); f.seek(0x160, 0); f.write(b'\x9c'); f.seek(0x296712, 0); f.write(b'\x02')"

  # Apply Full Wormage, Schemes and DaveNet
  cp -r /home/wineuser/WA/WA/* /home/wineuser/.wine/drive_c/Program\ Files\ \(x86\)/WA
  chown -R wineuser:wineuser /home/wineuser/.wine/drive_c/Program\ Files\ \(x86\)/WA

  # Stage Complete
  su wineuser -c "touch /home/wineuser/.wine/drive_c/Program\ Files\ \(x86\)/WA/WABaseComplete.txt"
  echo "Successfully Installed WA"
else
  echo "WA already installed in Wine"
fi
