#!/bin/bash

printf "This is the installer for my dotfiles. Using git, it will automatically place the dotfiles\n"
printf "in the current location ($(pwd)).\nThe file will be titled 'dotfiles'.\n"
read -p "Continue installation? (Y/N):" confirm && [[ $confirm == [yY][eE][sS] || $confirm == [yY] ]] || exit
printf "Running command: git clone https://github.com/2Carrot10/dotfiles.git\n"
git clone "https://github.com/2Carrot10/dotfiles.git"
printf "The repo is now cloned! To set up the dotfiles, run 'python dotfiles/setup.py'"
# This installer no longer goes directly to the setup program. This is so it is easier for a user
# To choose to feed the 'yes' command into the setup without being specifically prompted to do so.

#printf "The repo is now cloned! Would you like to automatically continue to setup?"
#printf "\nTo do so, you must have 'python' installed and set as an environment variable.\n"
#read -p "Start setup? (Y/N):" confirm && [[ $confirm == [yY][eE][sS] || $confirm == [yY] ]] || exit
#python dotfiles/setup.py

