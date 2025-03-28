#!/usr/bin/bash

# cd into script path
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd $SCRIPTPATH

# Ignore list
IGNORE=("bin" "wallpaper" "install.sh" ".git" "scripts" "git")

printf "Start installing dotfiles\n\n"
printf "Ignore: %s\n" "${IGNORE[@]}"
printf "\n"

# Install stow, if not installed
pacman -Q | grep stow 1>/dev/null
if [ $? != 0 ]; then
    printf "Installing stow\n"
    sudo pacman -S stow
else
    printf "Stow is already installed\n"
fi

# Prevent from symlinking whole directory
if [ ! -d "/home/chris/.gnupg" ]; then
    printf "Creating ~/.gnupg\n\n"
    mkdir ~/.gnupg
else
    printf "~/.gnupg is already available\n\n"
fi

# Setting up all the symlinks
max=${#IGNORE[@]}
max=$((max-1))

for f in *; do
	ignored=false

    #Check if package is in ignore list
	for i in `seq 0 $max`
	do

		if [[ ${IGNORE[$i]} == $f ]]; then
			ignored=true
		fi

	done

    # Create symlink if not ignored
	if [[ $ignored == false ]]; then
        printf "Symlink for $f created\n"
		stow "$f"
	fi
done

printf "\nDone\n"
