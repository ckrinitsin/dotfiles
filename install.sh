#!/usr/bin/bash

sudo pacman -S stow

# Ignore list
IGNORE=("bin" "wallpaper" "install.sh" ".git")

max=${#IGNORE[@]}
max=$((max-1))

# Setting up all the symlinks
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
		stow $f
	fi
done

# install important packages
sudo pacman -S alacritty dunst nvim qutebrowser starship xdg-user-dirs zathura meson ninja

# install rofi and dmenu for wayland
git clone https://github.com/davatorium/rofi.git /tmp/rofi
cd /tmp/rofi
meson setup build
ninja -C build
sudo ninja -C build install
git clone https://git.sr.ht/~fabiancodes/dmenu-wayland /tmp/dmenu-wl
cd /tmp/dmenu-wl
mkdir build
meson build
ninja -C build
sudo ninja -C build install
