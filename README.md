<img src="https://raw.githubusercontent.com/2carrot10/dotfiles/master/READMEAssets/example1.png" alt="img" align="right" width="400px">
<img src="https://raw.githubusercontent.com/2carrot10/dotfiles/master/READMEAssets/example2.png" alt="img" align="right" width="400px">
<img src="https://raw.githubusercontent.com/2carrot10/dotfiles/master/READMEAssets/example3.png" alt="img" align="right" width="400px">

# About
This repo contains the main dotfiles I use on Arch Linux with AwesomeWM, as well as an installer and an archinstall config file. The locations of all configuration folders can be set up automatically with the `meta/dotctl sync` script. By default, the `meta/dotctl sync` command creates symlinks so you can manage all your dotfiles from a single directory.


# ⚙️ Included configurations
* AwesomeWM
* Nvim
* Rofi
* Kitty
* Bash
* Tmux

# ✨ Notable Features
## Keybind and color consistency
All programs use the same color scheme ([Tokyo Night](https://github.com/tokyo-night/tokyo-night-vscode-theme)), font ([Jet Brains Mono](https://www.programmingfonts.org/#jetbrainsmono)), and keymaps ([Vi](https://en.wikipedia.org/wiki/Vi_(text_editor))).

## Extensibility
The final filepath locations of each configuration is not hardcoded. Instead, each config has a `meta.json` file. If you add your own dotfiles, they will be detected by the `dotctl` script.

## Dotctl
<a href="https://asciinema.org/a/ae42h42mnWaO7mW2B2KCijuTJ" target="_blank"><img src="https://asciinema.org/a/ae42h42mnWaO7mW2B2KCijuTJ.svg" /></a>

You can link all tracked dotfiles into the desired location using this command:
```sh
dotctl sync
```
Or copy them into their desired directories:
```sh
dotctl sync --clone
```
To install all packages to use the dotfiles, use the `install` command:
```sh
dotctl install
```
If you want to start tracking a new file, simply use this command:
```sh
dotctl track /path/to/your/file
```
Check the install status of your dotfiles:
```sh
dotctl status
```
You can specify which files to target with almost any subcommand -- by default, the commands operate on **all** tracked files:
```sh
dotctl sync nvim awesomewm kitty
```
`dotctl` is able to do a lot more! Use `dotctl help` for more information.

## AwesomeWM (window manager)
The window manager features a minimalist system tray that lays on top of all windows so the windows can be viewed at full resolution by default.

## Bash (shell) 
* File navigation functions
* Shortened command aliases
* Safer commands (`rm`, `mv`)
* Colorful & shortened PS1

# 🚀 Installation
## Dotfiles
To install these dotfiles, either clone this GitHub repo or run the download script.
### Option 1: Clone repo
After cloning the repo, you will generally want to `sync` and `install`. You can choose which dotfiles to set up by specifying them as parameters into the following commands:
```sh
./dotctl sync & ./dotctl install
```

### Option 2: Run download script
To install the dotfiles, run this command in the desired location:
```sh
bash <(curl -s https://raw.githubusercontent.com/2Carrot10/dotfiles/master/meta/download)
```
The command will automatically download the repo, place the dotfiles in the correct locations ('sync'), and install necessary packages. If you want to set everything up with a single command, you can pipe `yes` into the command above.

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
