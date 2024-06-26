#!/usr/bin/bash

# cd into script path
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd $SCRIPTPATH

# Ignore list
IGNORE=("bin" "wallpaper" "install.sh" ".git" "scripts")

# Install important packages
sudo pacman -S stow

# Prevent from symlinking whole directory
mkdir ~/.gnupg

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
		stow "$f"
	fi
done
