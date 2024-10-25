# About
This repo contains the main dotfiles I use on Arch Linux with AwesomeWM, as
well as a archinstall config file. The locations of all configuration folders
can be set up automatically with the `setup.py` script, although make sure you
read the logs carefully before approving each change so preexisting files do
not get deleted. Instead of cloning each folder into the correct location, the
`setup.py` script creates symlinks so you can edit all your dotfiles from one
folder. You will still need to install the software that uses each config. 

![Example Screenshot](READMEAssets/example1.png?raw=true)
![Example Screenshot](READMEAssets/example2.png?raw=true)
![Example Screenshot](READMEAssets/example3.png?raw=true)

# Included configurations
* Awesomewm
* Nvim
* Rofi
* Kitty
* Bash
* Zathura
* Tmux

# Notable Features
## Keybind and color consistency
All programs use the same color scheme 
([tokyo-night](https://github.com/tokyo-night/tokyo-night-vscode-theme)) and keymaps (VI).

## Extensibility
The final filepath locations of each configuration is not hardcoded. Instead,
each configuration has a .location.json file. If you add your own dotfiles,
they will be detected by the `manage --install` script.

## Awesomewm (window manager)
The window manager features a minimalist system tray that lays on top of all
windows so all windows can be viewed in full screen by default.

## Bash (shell) 
File navigation functions.
Print string (PS1)

# Installation
## Dotfiles
To install these dotfiles, either clone this GitHub repo, or run this command in the desired location:
```sh
bash <(curl -s https://raw.githubusercontent.com/2Carrot10/dotfiles/master/meta/download)
```
After the repo has been cloned, link the dotfiles to their respective locations by running `manage --install`.
The `download` script should automatically give you the option to run setup.py.

## Archinstall config 
(I made this `archinstall` config for myself, not for general use.)
Using a live USB, install most necessary software and setup most presets using
`archinstall` by running the following code:
```sh
archinstall --config https://raw.githubusercontent.com/2Carrot10/dotfiles/master/setup/archinstallConfig.json
```
# Installation Requirements
- Python
