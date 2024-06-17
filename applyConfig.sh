#!/bin/bash

RED='\033[0;31m'
NC='\033[0m'
printf "adding configs for the following dirrectories:\n"
printf "$(ls -d */)\n"
for dir in */; do
	printf "\n***** Linking ${RED}$(pwd)/${dir}${NC} *****\n"
	if [ -d "$dir" ]; then
		if [ -f "$(pwd)/${dir}.location.conf" ]; then
			source "$(pwd)/${dir}.location.conf"
			printf "Linking files based on the configuration file at ${RED}${dir}.location.conf${NC}:\n\n"
			printf "$(cat $(pwd)/${dir}.location.conf)\n\n"
			desired_endpoint="${desired_endpoint/#\~/$HOME}"

			printf "Target link location of ${RED}${dir}${target_files}${NC} is ${RED}${desired_endpoint}${NC}\n"

					read -p "Is this configuration correct? (Y/N):" confirm && [[ $confirm == [yY][eE][sS] || $confirm == [yY] ]] || continue

			desired_endpoint_with_target=${desired_endpoint}${dir}
			if test -d ${desired_endpoint_with_target}; then 
				printf "Symlink already detected to $(readlink -f ${desired_endpoint_with_target}). No further action will be taken.\n"
				read -p "Overwrite this symlink? (Y/N): (Work In Progress)"
				continue
			fi

			if [ -d ${desired_endpoint_with_target} ]; then
				printf "${RED}${desired_endpoint_with_target}${NC} already exists\n"
				files=$(shopt -s nullglob dotglob; echo desired_endpoint_with_target)
				if (( ${#files} )); then
					printf "There are already files at this location:\n"
					printf "$(ls -a ${desired_endpoint_with_target})\n"
					read -p "Continue? (Y/N):" confirm && [[ $confirm == [yY][eE][sS] || $confirm == [yY] ]] || continue
					read -p "Delete files before making symlink? (Y/N):" awnser
					if [[ $awnser = [yY][eE][sS] || $awnser = [yY] ]]; then
						rm -r "${desired_endpoint_with_target}"
					fi
				fi
			fi
			printf "Link ${RED}$(pwd)/${dir}${target_files}${NC} to ${RED}${desired_endpoint}${NC}? (Y/N): "
			read -p "" confirm && [[ $confirm == [yY][eE][sS] || $confirm == [yY] ]] || continue
			ln -s "$(pwd)/${dir}${target_files}" "${desired_endpoint}"
			printf "Linked $(pwd)/${dir}${target_files} to ${desired_endpoint}\n"
		else
			printf "ERROR: ${RED}$(pwd)/${dir}.location.conf${NC} does not exist\n"
		fi
	else
		printf "Skipping ${dir} because it is not a dirrectory\n"
	fi
done
printf "Completed all symlinks\n"
