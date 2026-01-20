#!/usr/bin/bash

# cd into script path
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd $SCRIPTPATH

printf "Start installing dotfiles\n\n"

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
    printf "Creating ~/.gnupg\n"
    mkdir ~/.gnupg
    chmod 700 ~/.gnupg
else
    printf "~/.gnupg is already available\n"
fi

for f in common/*; do
    # Create symlink if not ignored
    printf "Symlink for $f created\n"
    stow -t ~/ -d common/ "$(basename $f)"
done

if [ $1 == "desktop" ]; then
    for f in desktop/*; do
        # Create symlink if not ignored
        printf "Symlink for $f created\n"
        stow -t ~/ -d desktop/ "$(basename $f)"
    done
fi

printf "Done\n"
