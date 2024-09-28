#!/bin/bash

printf "This is the installer for my dotfiles. Using git, it will automatically place the dotfiles\n"
printf "in the current location ($(pwd)).\nThe file will be titled 'dotfiles'.\n"
read -p "Continue download? (Y/N):" confirm && [[ $confirm == [yY][eE][sS] || $confirm == [yY] ]] || exit
printf "Running command: git clone https://github.com/2Carrot10/dotfiles.git\n"
git clone "https://github.com/2Carrot10/dotfiles.git"
printf "The repo has been downloaded."
read -p "Proceed with setup? (Y/N):" confirm && [[ $confirm == [yY][eE][sS] || $confirm == [yY] ]] || exit
python dotfiles/setup.py
