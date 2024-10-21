# About
This repo contains the main dotfiles I use on Arch Linux with AwesomeWM. The
locations of all configuration folders can be set up automatically with the
`setup.py` script, although make sure you read the logs carefully before
approving each change so preexisting files do not get deleted. Instead of
cloning each folder into the correct location, the `setup.py` script creates
symlinks so you can edit all your dotfiles from one folder. You will still need
to install the software that uses each config. 

![Example Screenshot](READMEAssets/example.png?raw=true)
![Example Screenshot](READMEAssets/example2.png?raw=true)

# Installation
To install these dotfiles, either clone this GitHub repo, or run this command in the desired location:
```sh
bash <(curl -s https://raw.githubusercontent.com/2Carrot10/dotfiles/master/download.sh)
```
After the repo has been cloned, link the dotfiles to their respective locations by running `setup.py`

(I made this `archinstall` config for myself, not for general use.)
Using a live USB, install most necessary software and setup most presets using `archinstall` by running the following code:
```sh
archinstall --config https://raw.githubusercontent.com/2Carrot10/dotfiles/master/archinstall/config.json
```
# Requirements to install 
- Python
