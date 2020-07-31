# worms-armageddon-gog-docker

## Install
You need to download 'setup_worms_armageddon_2.0.0.2.exe' offline installer from GOG and put it in files directory of this repo first.

Next run `./install.sh`
After quite a while you should see the 3.8 WA Setup GUI, Click Next, leave the program path as it is, Click Next, Accept the Warning, Click Finish. You should then see a 'Successfully Installed WA' message in the terminal

## Run
Run `./run.sh`

## To Use Hosting Proxy
Go to settings and Turn on WormKit Modules and also Community Server List. (Bug in UI means only first option will be changed). Reload WA.

## Known Issues

- No Sound on Linux (not sure why).
- No Sound on Mac (Not supported by docker-wine)
