set -e

apt update
apt install -y innoextract
mkdir /home/wineuser/.wine/drive_c/Program\ Files\ \(x86\)/WA
cd /home/wineuser/.wine/drive_c/Program\ Files\ \(x86\)/WA
innoextract /home/wineuser/WA/setup_worms_armageddon_2.0.0.2.exe
mv app/* ./
rm -r tmp/
rm -r app/
chown -R wineuser:wineuser /home/wineuser/.wine/drive_c/Program\ Files\ \(x86\)/WA

su wineuser -c "wine /home/wineuser/WA/WA_update-3.8_[CD]_Installer.exe"
python3 -c "f=open(r'/home/wineuser/.wine/drive_c/Program Files (x86)/WA/WA.exe', 'r+b'); f.seek(0x160, 0); f.write(b'\x9c'); f.seek(0x296712, 0); f.write(b'\x02')"

cp -r /home/wineuser/WA/WA/* /home/wineuser/.wine/drive_c/Program\ Files\ \(x86\)/WA
chown -R wineuser:wineuser /home/wineuser/.wine/drive_c/Program\ Files\ \(x86\)/WA

echo "Successfully Installed WA"
