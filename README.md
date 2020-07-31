# worms-armageddon-gog-docker

## Install
You need to download 'setup_worms_armageddon_2.0.0.2.exe' offline installer from GOG and put it in files directory of this repo first.

### To Use Hosting Proxy
Change `"LoadWormKitModules"=dword:00000000` to `"LoadWormKitModules"=dword:00000001` in `files/user.reg`. Changing in WA UI later does not seem to work.

### Finish Install
Next run `./install.sh`
After quite a while you should see the 3.8 WA Setup GUI, Click Next, change the program path to `C:\Program Files (x86)\WA`, Click Install, Accept the Warning, Click Finish. You should then see a 'Successfully Installed WA' message in the terminal

## Run
Run `./run.sh`


## Known Issues

- No Sound on Linux (not sure why).
- No Sound on Mac (Not supported by docker-wine)
- Changing settings in WA doesn't always work (Only settings that require Registry Changes - Changing Scheme & Teams still works fine). You can use user.reg whilst installing to change settings.

## Reseting docker-wine
Need to remove the volume winehome. E.g.
```
docker volume rm winehome
```
