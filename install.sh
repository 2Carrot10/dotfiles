#!/bin/bash

printf "This is the installer for my dotfiles. Using git, it will automatically place the dotfiles\n"
printf "in the current location ($(pwd)).\nThe file will be titled 'dotfiles'.\n"
read -p "Continue installation? (Y/N):" confirm && [[ $confirm == [yY][eE][sS] || $confirm == [yY] ]] || exit
printf "Running command: git clone https://github.com/2Carrot10/dotfiles.git\n"
git clone "https://github.com/2Carrot10/dotfiles.git"
printf "The repo is now cloned! Would you like to automatically continue to setup?"
printf "\nTo do so, you must have 'python' as an environment variable."
read -p "Start setup? (Y/N):" confirm && [[ $confirm == [yY][eE][sS] || $confirm == [yY] ]] || exit
python setup.py

