# About
This repo contains the main dotfiles I use on Arch Linux with AwesomeWM, as well as an installer and a archinstall config file. The locations of all configuration folders can be set up automatically with the `meta/dmanage --install` script, although make sure you read the prompts carefully before approving each change so preexisting files do not get deleted. Instead of cloning each folder into the correct location, the `meta/dmanage --install` script creates symlinks so you can edit all your dotfiles from one folder. You will still need to install the software that uses each config. 

![Example Screenshot](READMEAssets/example1.png?raw=true)
![Example Screenshot](READMEAssets/example2.png?raw=true)
![Example Screenshot](READMEAssets/example3.png?raw=true)

# Included configurations
* AwesomeWM
* Nvim
* Rofi
* Kitty
* Bash
* Tmux

# Notable Features
## Keybind and color consistency
All programs use the same color scheme ([tokyo-night](https://github.com/tokyo-night/tokyo-night-vscode-theme)), font ([Jet Brains Mono](https://www.programmingfonts.org/#jetbrainsmono)), and keymaps ([VI](https://en.wikipedia.org/wiki/Vi_(text_editor))).

## Extensibility
The final filepath locations of each configuration is not hardcoded. Instead, each configuration has a `.meta.json` file. If you add your own dotfiles, they will be detected by the `dmanage` script.

You can check the install status of your dotfiles:
```sh
dmanage status
```
You can check the ideal state of your dotfiles:
```sh
dmanage info
```
You can install or check specific dotfiles by specifying parameters:
```sh
dmanage sync nvim awesomewm kitty
```

## AwesomeWM (window manager)
The window manager features a minimalist system tray that lays on top of all windows so the windows can be viewed at full resolution by default.

## Bash (shell) 
* File navigation functions
* Improved print string (PS1)
* Human readable aliases
* Shortened command aliases

# Installation
## Dotfiles
To install these dotfiles, either clone this GitHub repo, or run this command in the desired location:
```sh
bash <(curl -s https://raw.githubusercontent.com/2Carrot10/dotfiles/master/meta/download)
```
The command will automatically download the repo (via SSH) and run the install script.

## Archinstall config 
(I made this `archinstall` config for myself, not for general use.)
Using a live USB, install most necessary software and setup most presets using `archinstall` by running the following code:
```sh
archinstall --config https://raw.githubusercontent.com/2Carrot10/dotfiles/master/meta/archinstallConfig.json
```
# Installation Requirements
- Bash
- Git
- Python
