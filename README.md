# About
This repo contains the main dotfiles I use on Arch Linux with AwesomeWM, as well as an installer and an archinstall config file. The locations of all configuration folders can be set up automatically with the `meta/dmanage sync` script. By default, the `meta/dmanage sync` command creates symlinks so you can manage all your dotfiles from a single directory.

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
All programs use the same color scheme ([Tokyo-Night](https://github.com/tokyo-night/tokyo-night-vscode-theme)), font ([Jet Brains Mono](https://www.programmingfonts.org/#jetbrainsmono)), and keymaps ([Vi](https://en.wikipedia.org/wiki/Vi_(text_editor))).

## Extensibility
The final filepath locations of each configuration is not hardcoded. Instead, each config has a `meta.json` file. If you add your own dotfiles, they will be detected by the `dmanage` script.

You can link all tracked dotfiles into the desired location using this command:
```sh
dmanage sync
```
Or copy them into their desired directories:
```sh
dmanage sync --clone
```
If you want to start tracking a new file, simply use this command:
```sh
dmanage track /path/to/your/file
```
Check the install status of your dotfiles:
```sh
dmanage status
```
You can specify which files to target with almost any subcommand -- by default, the commands operate on **all** tracked files:
```sh
dmanage sync nvim awesomewm kitty
```
`dmanage` is able to do a lot more! Use `dmanage help` for more information.

## AwesomeWM (window manager)
The window manager features a minimalist system tray that lays on top of all windows so the windows can be viewed at full resolution by default.

## Bash (shell) 
* File navigation functions
* Shortened command aliases
* Safer commands (i.e. `rm`, `mv`)
* Colorful & shortened PS1

# Installation
## Dotfiles
To install these dotfiles, either clone this GitHub repo, or run this command in the desired location:
```sh
bash <(curl -s https://raw.githubusercontent.com/2Carrot10/dotfiles/master/meta/download)
```
The command will automatically download the repo and run the install script. If you want to set everything up with a single command, you can pipe `yes` into the command above.

## Archinstall config 
(I made this `archinstall` config for myself. If you would like to use it, you will likely want to change some settings.)
During the Arch installation process, you can install most necessary software and setup most presets using `archinstall` by running the following code:
```sh
archinstall --config https://raw.githubusercontent.com/2Carrot10/dotfiles/master/meta/archinstallConfig.json
```
# Installation Requirements
- Bash
- Git
- Python
